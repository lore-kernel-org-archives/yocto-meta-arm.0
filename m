Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.409.1794338048816200705
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 11:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fyWb6GZP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF3A1BC0
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 11:14:05 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27DE93F673
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794338048; bh=Ty8etVQlqbS/t9cNoPV/BTwtLSAqylZGKaFKFcY9cM0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fyWb6GZPSdT6bi2X0hn+tebJkl4mc8bDJZfC6vpmfb1RoVjr0dw4iZ1c5aK38VSWK
	 M1bF02EB6Dszzgh2EqKJ3UKdQLhBaoDJrB8fUjVSQZr/S0m7cwXfXnJamhM25Awcwv
	 1krrYFzSzoP82GxcxN4EEPZVzvabsmv57fYHZoag=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] scripts: add utility to track patch age and upstream status
Date: Tue, 10 Nov 2026 14:14:06 -0500
Message-ID: <20261110191406.48308-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110191406.48308-1-jon.mason@arm.com>
References: <20261110191406.48308-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 19:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7208

Add a Python utility to analyze the age, modification history, and
upstream status of patches maintained in meta-arm.

The script uses Git history to determine when patches were first
added, last modified, and how many times they have changed. It also
extracts Upstream-Status information to help identify patches that
have remained downstream for extended periods.

By default, the utility displays summary statistics, including
average patch age, patches older than one or two years, and upstream
status distribution. Verbose output provides per-patch information,
with options to sort by age or upstream status. Results can also be
exported to CSV for further analysis and reporting.

The utility operates independently of BitBake and requires only
Python=E2=80=99s standard library.

This utility is based on an original Bash script written by hand
to collect patch maintenance statistics for presentations. ChatGPT
was used to translate it to Python and extend its functionality.

AI-generated: ChatGPT (OpenAI)
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/patch-history.py | 181 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)
 create mode 100644 scripts/patch-history.py

diff --git a/scripts/patch-history.py b/scripts/patch-history.py
new file mode 100644
index 000000000000..3bd20e849ad9
--- /dev/null
+++ b/scripts/patch-history.py
@@ -0,0 +1,181 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+# Copyright (c) 2026 Arm Limited
+"""Report the age, change history, and upstream status of tracked patche=
s."""
+
+import argparse
+import csv
+import datetime as dt
+import re
+import subprocess
+import sys
+from collections import Counter, defaultdict
+from pathlib import Path
+
+
+def git(root, *args):
+    result =3D subprocess.run(['git', '-C', str(root), *args], capture_o=
utput=3DTrue)
+    if result.returncode:
+        raise RuntimeError(result.stderr.decode('utf-8', 'replace').stri=
p())
+    return result.stdout
+
+
+def metadata(root, path):
+    raw =3D git(root, 'log', '--follow', '--format=3D%as', '--', path)
+    dates =3D [x for x in raw.decode().splitlines() if x]
+    if not dates:
+        return '', '', 0
+    return dates[-1], dates[0], len(dates)
+
+
+def upstream_status(path):
+    try:
+        content =3D path.read_text(encoding=3D'utf-8', errors=3D'replace=
')
+    except OSError as exc:
+        print(f'warning: cannot read {path}: {exc}', file=3Dsys.stderr)
+        return 'Missing', ''
+    match =3D re.search(r'^\s*Upstream-Status:\s*(.*?)\s*$', content, re=
.I | re.M)
+    if not match:
+        return 'Missing', ''
+    full =3D match.group(1)
+    token =3D re.match(r'([^\s\[:]+)', full)
+    return (token.group(1) if token else 'Unknown'), full
+
+
+def layer_of(path):
+    return next((p for p in path.parts if p.startswith('meta-')), '(root=
)')
+
+
+def component_of(path):
+    # For standard recipes-*/<component>/files/foo.patch, choose <compon=
ent>.
+    parts =3D path.parts
+    for i, part in enumerate(parts[:-1]):
+        if part.startswith('recipes-') and i + 1 < len(parts) - 1:
+            return parts[i + 1]
+    return path.parent.name
+
+
+def main():
+    parser =3D argparse.ArgumentParser(
+        description=3D'Report Git patch age and upstreaming status from =
a meta-arm checkout.',
+        epilog=3D'''Examples:
+  scripts/patch-history.py
+  scripts/patch-history.py --verbose --sort age
+  scripts/patch-history.py --verbose --sort status
+  scripts/patch-history.py --layer meta-arm-bsp
+  scripts/patch-history.py --output bsp-patches.csv
+
+Only Git-tracked .patch and .diff files are scanned. Git rename history =
is
+followed where possible. Ages are calculated from the oldest and newest
+commits touching each file, not from patch header dates. By default, a
+summary is printed to the terminal. --verbose also lists each patch and
+its age. --output writes CSV for spreadsheet use; otherwise no file is
+created. No files in the tree are changed.''',
+        formatter_class=3Dargparse.RawDescriptionHelpFormatter,
+    )
+    parser.add_argument('--layer', help=3D'Restrict scanning to this lay=
er/directory relative to repository root')
+    parser.add_argument('--output', '-o', help=3D'Write CSV to this path=
 (no CSV is written by default)')
+    parser.add_argument('--sort', choices=3D['path', 'age', 'updated', '=
component', 'status'], default=3D'path',
+                        help=3D'Patch listing and CSV row order (status:=
 grouped alphabetically, oldest first within each status; age and updated=
: oldest first)')
+    parser.add_argument('--summary', action=3D'store_true', help=3D'Prin=
t aggregate statistics (already the default; retained for compatibility)'=
)
+    parser.add_argument('--verbose', '-v', action=3D'store_true', help=3D=
'List every patch with its age and upstream status in the terminal')
+    args =3D parser.parse_args()
+
+    try:
+        root =3D Path(subprocess.check_output(['git', 'rev-parse', '--sh=
ow-toplevel'], stderr=3Dsubprocess.PIPE,
+                                            text=3DTrue).strip()).resolv=
e()
+    except subprocess.CalledProcessError:
+        parser.error('run this from inside a Git repository')
+    if args.layer:
+        target =3D (root / args.layer).resolve()
+        if not target.is_relative_to(root) or not target.is_dir():
+            parser.error('--layer must name an existing directory inside=
 the repository')
+        scope =3D target.relative_to(root).as_posix()
+    else:
+        scope =3D None
+
+    try:
+        files =3D git(root, 'ls-files', '-z', '--', *( [scope] if scope =
else [] )).split(b'\0')
+    except RuntimeError as exc:
+        parser.error(str(exc))
+    today =3D dt.date.today()
+    rows =3D []
+    for encoded in files:
+        if not encoded:
+            continue
+        relative =3D encoded.decode('utf-8', 'surrogateescape')
+        if Path(relative).suffix.lower() not in ('.patch', '.diff'):
+            continue
+        absolute =3D root / relative
+        if not absolute.is_file():
+            continue
+        try:
+            added, updated, changes =3D metadata(root, relative)
+        except RuntimeError as exc:
+            print(f'warning: history unavailable for {relative}: {exc}',=
 file=3Dsys.stderr)
+            added, updated, changes =3D '', '', 0
+        status, detail =3D upstream_status(absolute)
+        rows.append({
+            'Patch Added': added,
+            'Last Updated': updated,
+            'Times Changed': changes,
+            'Component': component_of(Path(relative)),
+            'Upstream Status': status,
+            'Patch Age (Days)': (today - dt.date.fromisoformat(added)).d=
ays if added else '',
+            'Days Since Update': (today - dt.date.fromisoformat(updated)=
).days if updated else '',
+            'Layer': layer_of(Path(relative)),
+            'Patch File': relative,
+            'Upstream Status Detail': detail,
+        })
+    keys =3D {
+        'path': lambda r: r['Patch File'],
+        'age': lambda r: (-(r['Patch Age (Days)'] if isinstance(r['Patch=
 Age (Days)'], int) else -1), r['Patch File']),
+        'updated': lambda r: (-(r['Days Since Update'] if isinstance(r['=
Days Since Update'], int) else -1), r['Patch File']),
+        'component': lambda r: (r['Component'], r['Patch File']),
+        'status': lambda r: (r['Upstream Status'].lower(), -(r['Patch Ag=
e (Days)'] if isinstance(r['Patch Age (Days)'], int) else -1), r['Patch F=
ile']),
+    }
+    rows.sort(key=3Dkeys[args.sort])
+    if args.output:
+        output =3D Path(args.output)
+        fields =3D ['Patch Added', 'Last Updated', 'Times Changed', 'Com=
ponent', 'Upstream Status',
+                  'Patch Age (Days)', 'Days Since Update', 'Layer', 'Pat=
ch File', 'Upstream Status Detail']
+        try:
+            with output.open('w', newline=3D'', encoding=3D'utf-8') as s=
tream:
+                writer =3D csv.DictWriter(stream, fieldnames=3Dfields)
+                writer.writeheader()
+                writer.writerows(rows)
+        except OSError as exc:
+            parser.exit(1, f'error: cannot write {output}: {exc}\n')
+        print(f'Wrote {len(rows)} patches to {output}')
+
+    if args.verbose:
+        print('\nPatch Details (age in days)')
+        print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D')
+        for row in rows:
+            age =3D row['Patch Age (Days)']
+            print(f"{str(age) if age !=3D '' else 'n/a':>7}  {row['Upstr=
eam Status']:<16}  {row['Patch File']}")
+
+    if True:  # Summary is the default terminal output.
+        ages =3D [r['Patch Age (Days)'] for r in rows if isinstance(r['P=
atch Age (Days)'], int)]
+        print('\nPatch Maintenance Summary')
+        print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D')
+        print(f'Total patches:              {len(rows)}')
+        if ages:
+            print(f'Average patch age:          {sum(ages) / len(ages):.=
0f} days')
+            print(f'Oldest patch:               {max(ages)} days')
+            print(f'Patches older than 1 year:  {sum(a > 365 for a in ag=
es)}')
+            print(f'Patches older than 2 years: {sum(a > 730 for a in ag=
es)}')
+        counts =3D Counter(r['Upstream Status'] for r in rows)
+        groups =3D defaultdict(list)
+        for r in rows:
+            if isinstance(r['Patch Age (Days)'], int):
+                groups[r['Upstream Status']].append(r['Patch Age (Days)'=
])
+        print('\nUpstream Status (count, average age in days):')
+        for status in sorted(counts, key=3Dstr.lower):
+            ages_for_status =3D groups[status]
+            average =3D f'{sum(ages_for_status) / len(ages_for_status):.=
0f}' if ages_for_status else 'n/a'
+            print(f'  {status:<20} {counts[status]:>5}  {average:>6}')
+
+
+if __name__ =3D=3D '__main__':
+    main()
--=20
2.54.0 (Apple Git-157)

