Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.393.1794338048516941587
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 11:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gRL+LASv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED8BF14BF
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 11:14:04 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAFD13F673
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 11:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794338048; bh=FXVSxT8ZrSbdxokcxFHmfe375JE+H35rpPmNkVa/BYc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gRL+LASvi5DTDk+ZnZYQYvOwCoRXvn9ssAjXrwr7t/cXoSw/0OfSeK0W1/SHlBqcP
	 WXBc2I5g+evVHBqFAplK8BHpYYMFM3DJHHDslKKRIz8ucTgqqEod9sFR45iG6ZdBJF
	 hUu/tyaqDkTlzWP06cowkgLg4NTA4O8Nhy8rucKg=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] scripts: add utility to identify unused BSP recipes and patches
Date: Tue, 10 Nov 2026 14:14:05 -0500
Message-ID: <20261110191406.48308-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110191406.48308-1-jon.mason@arm.com>
References: <20261110191406.48308-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 19:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7206

Add a Python utility to identify potentially unused files in meta-arm.

The script performs static analysis of BitBake metadata to find
patches that are no longer referenced, unused include files in
meta-arm-bsp, and BSP recipes that may have become obsolete as
platforms are updated.

Recipe detection examines preferred versions, providers, image
contents, and dependencies to identify recipes that are no longer
referenced. Results are grouped by confidence to help distinguish
likely unused recipes from those requiring further investigation.

The utility operates independently of BitBake and requires only
Python=E2=80=99s standard library. By default, it reports findings withou=
t
modifying files. Dangling patches can optionally be removed after
confirmation, while recipes and include files remain report-only
to avoid unintended removal.

This utility consolidates several Bash scripts originally written
by hand. ChatGPT was used to translate them to Python, combine
their functionality, and extend the reference detection.

AI-generated: ChatGPT (OpenAI)
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/find-unused.py | 279 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)
 create mode 100644 scripts/find-unused.py

diff --git a/scripts/find-unused.py b/scripts/find-unused.py
new file mode 100644
index 000000000000..782dacf4ff79
--- /dev/null
+++ b/scripts/find-unused.py
@@ -0,0 +1,279 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+# Copyright (c) 2026 Arm Limited
+"""Report dangling patches, unreferenced BSP includes, and candidate obs=
olete BSP recipes.
+
+Static analysis only; no BitBake environment required. Recipe/include re=
sults are
+review-only. Patch deletion is opt-in and still requires care with dynam=
ic SRC_URI.
+"""
+import argparse
+import fnmatch
+import re
+import subprocess
+import sys
+from collections import defaultdict
+from pathlib import Path
+
+META_EXT =3D {'.bb', '.bbappend', '.inc', '.conf', '.bbclass'}
+ASSIGN =3D re.compile(r'^\s*([A-Za-z0-9_${}/.+%-]+(?::[A-Za-z0-9_${}/.+%=
-]+)*)\s*(?:\?\?=3D|\?=3D|:=3D|\+=3D|=3D\+|\.=3D|=3D\.|=3D)\s*(.*)$')
+RECIPE =3D re.compile(r'^(.+)_([^_]+)\.(bb|bbappend)$')
+TOKEN =3D re.compile(r'[A-Za-z0-9][A-Za-z0-9_.+%-]*')
+
+
+def git(cmd, root):
+    return subprocess.run(['git', '-C', str(root), *cmd], capture_output=
=3DTrue)
+
+
+def load(root):
+    r =3D git(['rev-parse', '--show-toplevel'], root)
+    if r.returncode:
+        raise RuntimeError('Not in a Git checkout; specify --root')
+    root =3D Path(r.stdout.decode().strip()).resolve()
+    r =3D git(['ls-files', '-z'], root)
+    if r.returncode:
+        raise RuntimeError('git ls-files failed')
+    paths =3D [Path(p.decode('utf-8', 'surrogateescape')) for p in r.std=
out.split(b'\0') if p]
+    sources =3D {}
+    for path in paths:
+        if path.suffix in META_EXT:
+            try:
+                sources[path] =3D (root / path).read_text(encoding=3D'ut=
f-8', errors=3D'replace')
+            except OSError:
+                pass
+    return root, paths, sources
+
+
+def in_bsp(path):
+    return path.parts and path.parts[0] =3D=3D 'meta-arm-bsp'
+
+
+def recipe_tree(path):
+    return any(part.startswith('recipes-') for part in path.parts)
+
+
+def refs(name, sources, skip=3DNone):
+    return [p for p, text in sources.items() if p !=3D skip and name in =
text]
+
+
+def patches(paths, sources):
+    for path in paths:
+        if path.suffix !=3D '.patch' or not recipe_tree(path):
+            continue
+        found =3D refs(path.name, sources)
+        if not found:
+            yield ('patches', path, 'No literal filename reference in tr=
acked metadata', True)
+
+
+def includes(paths, sources):
+    for path in paths:
+        if not in_bsp(path) or path.suffix !=3D '.inc':
+            continue
+        found =3D refs(path.name, sources, path)
+        if found:
+            continue
+        # A basename may be constructed from variable expansions, e.g.
+        # require ${BPN}.inc. Treat these as ambiguous rather than safe.
+        parent =3D path.parent
+        dynamic =3D [p for p, content in sources.items()
+                   if p !=3D path and (p.parent =3D=3D parent or parent =
in p.parents)
+                   and re.search(r'(?m)^\s*(?:require|include)\s+[^\n#]*=
\$\{', content)]
+        note =3D 'No literal include reference found'
+        if dynamic:
+            note +=3D '; dynamic include(s) in ' + ', '.join(str(p) for =
p in dynamic[:3])
+        yield ('includes', path, note + ' (review only)', False)
+
+
+def logical_lines(text):
+    return re.sub(r'\\\s*\n\s*', ' ', text).splitlines()
+
+
+def metadata(sources):
+    selections =3D defaultdict(list)
+    mentions =3D defaultdict(set)
+    for path, content in sources.items():
+        for line in logical_lines(content):
+            line =3D line.split('#', 1)[0]
+            m =3D ASSIGN.match(line)
+            if not m:
+                continue
+            key, value =3D m.groups()
+            if key.startswith('PREFERRED_VERSION_'):
+                name =3D key[len('PREFERRED_VERSION_'):].split(':', 1)[0=
]
+                versions =3D re.findall(r'["\']([^"\']+)["\']', value)
+                if versions:
+                    selections[name].extend((v.strip(), path) for v in v=
ersions)
+                continue
+            # Only dependency/provider/image variables imply usage. Mere=
ly
+            # mentioning a recipe in an arbitrary string is not sufficie=
nt.
+            base =3D key.split(':', 1)[0]
+            if (base in {'IMAGE_INSTALL', 'CORE_IMAGE_EXTRA_INSTALL', 'P=
ACKAGE_INSTALL',
+                         'MACHINE_ESSENTIAL_EXTRA_RDEPENDS', 'MACHINE_ES=
SENTIAL_EXTRA_RRECOMMENDS',
+                         'MACHINE_EXTRA_RDEPENDS', 'MACHINE_EXTRA_RRECOM=
MENDS',
+                         'DEPENDS', 'RDEPENDS', 'RRECOMMENDS', 'EXTRA_IM=
AGEDEPENDS',
+                         'PREFERRED_PROVIDER_virtual/kernel', 'PREFERRED=
_PROVIDER_virtual/bootloader'}
+                    or base.startswith(('RDEPENDS_', 'RRECOMMENDS_', 'PR=
EFERRED_PROVIDER_'))):
+                for token in TOKEN.findall(value):
+                    mentions[token].add(path)
+    return selections, mentions
+
+
+def version_matches(version, pattern):
+    if '${' in pattern or '$(' in pattern:
+        return None
+    return fnmatch.fnmatchcase(version, pattern.replace('%', '*'))
+
+
+def recipes(paths, sources, verbose=3DFalse):
+    selections, mentions =3D metadata(sources)
+    groups =3D defaultdict(list)
+    for path in paths:
+        if not in_bsp(path) or not recipe_tree(path):
+            continue
+        m =3D RECIPE.match(path.name)
+        if m:
+            name, version, kind =3D m.groups()
+            groups[name].append((path, version, kind))
+
+    for name, entries in sorted(groups.items()):
+        picks =3D selections.get(name, [])
+        usage =3D mentions.get(name, set())
+        # Version-specific recipes are candidates only when there is evi=
dence
+        # of a version transition, or a vanished explicit pin. No pin an=
d no
+        # references is suspicious, but not proof: default selection is =
valid.
+        for path, version, kind in entries:
+            if version =3D=3D '%' or '${' in version:
+                continue
+            matched =3D [(p, src) for p, src in picks if version_matches=
(version, p)]
+            if matched:
+                if verbose:
+                    yield ('referenced', path, 'Version selected by ' + =
', '.join(str(src) for _, src in matched[:4]), False)
+                continue
+            unknown =3D [(p, src) for p, src in picks if version_matches=
(version, p) is None]
+            if unknown:
+                if verbose:
+                    yield ('referenced', path, 'Dynamic PREFERRED_VERSIO=
N: cannot resolve statically', False)
+                continue
+            # Check versions of the same type, not unrelated bb vs bbapp=
end.
+            peers =3D [(other, v) for other, v, k in entries if k =3D=3D=
 kind and other !=3D path]
+            newer_or_selected =3D [v for _, v in peers if v !=3D '%' and=
 (not picks or any(version_matches(v, p) for p, _ in picks))]
+            if picks:
+                reason =3D 'No matching PREFERRED_VERSION; selected: ' +=
 ', '.join(sorted({p for p, _ in picks}))
+                if not newer_or_selected:
+                    reason +=3D '; no alternative matching local version=
'
+            else:
+                reason =3D 'No PREFERRED_VERSION found'
+                if peers:
+                    reason +=3D '; other local versions: ' + ', '.join(s=
orted({v for _, v in peers}))
+            if usage:
+                reason +=3D '; recipe/provider referenced in ' + ', '.jo=
in(str(p) for p in sorted(usage)[:3])
+                category =3D 'potentially obsolete'
+            elif picks or peers:
+                category =3D 'potentially obsolete'
+                reason +=3D '; no direct image/dependency/provider refer=
ence found'
+            else:
+                category =3D 'likely unused'
+                reason +=3D '; no direct image/dependency/provider refer=
ence found (default BitBake selection still possible)'
+            yield ('recipes', path, f'{category}: {reason}', False)
+
+
+def main():
+    ap =3D argparse.ArgumentParser(
+        description=3D'Find cleanup candidates in a meta-arm Git checkou=
t (no BitBake required).',
+        formatter_class=3Dargparse.RawDescriptionHelpFormatter,
+        epilog=3D"""Checks and scope:
+  patches   All layers: tracked .patch files with no literal filename re=
ference
+            in tracked BitBake metadata. Dynamic SRC_URI can cause false=
 positives.
+  includes  meta-arm-bsp only: .inc files without literal references; dy=
namic
+            include/require statements are noted where detected.
+  recipes   meta-arm-bsp only: versioned .bb/.bbappend files compared wi=
th
+            PREFERRED_VERSION settings and image/dependency/provider men=
tions.
+            Results are grouped by confidence: likely unused, then poten=
tially
+            obsolete. A recipe may be selected implicitly without a vers=
ion pin.
+  all       Run all checks (default).
+
+Examples:
+  scripts/find-unused.py                       # Report everything
+  scripts/find-unused.py recipes --verbose     # Explain BSP recipe find=
ings
+  scripts/find-unused.py patches               # Find dangling patches
+  scripts/find-unused.py includes              # Review BSP include file=
s
+  scripts/find-unused.py patches --delete      # Confirm each patch remo=
val
+  scripts/find-unused.py patches --delete --force
+  scripts/find-unused.py --root /path/to/meta-arm all
+
+Safety:
+  Reporting is the default. Only dangling patches can be deleted; recipe
+  and include findings are ALWAYS review-only, even with --delete --forc=
e.
+  Searches use tracked files from Git but read the current working tree,=
 so
+  uncommitted edits to machine configurations affect the results. No Bit=
Bake
+  parsing, overrides, providers, or dynamic variable expansions are reso=
lved.
+""")
+    ap.add_argument('check', nargs=3D'?', choices=3D['all', 'patches', '=
includes', 'recipes'], default=3D'all', help=3D'Check to run (default: al=
l)')
+    ap.add_argument('--root', type=3DPath, default=3DPath.cwd(), help=3D=
'Path inside the meta-arm Git checkout (default: current directory)')
+    ap.add_argument('--verbose', action=3D'store_true', help=3D'Show rea=
sons and selected-version matches, including referenced recipes')
+    ap.add_argument('--delete', action=3D'store_true', help=3D'Prompt be=
fore deleting dangling patches only')
+    ap.add_argument('--force', action=3D'store_true', help=3D'With --del=
ete, skip prompts')
+    ap.add_argument('--dry-run', action=3D'store_true', help=3D'Explicit=
 report-only mode (the default)')
+    args =3D ap.parse_args()
+    if args.force and not args.delete:
+        ap.error('--force requires --delete')
+    if args.delete and args.dry_run:
+        ap.error('--delete conflicts with --dry-run')
+    try:
+        root, paths, sources =3D load(args.root)
+    except RuntimeError as exc:
+        ap.error(str(exc))
+    if args.verbose:
+        print(f'Repository: {root} | tracked files: {len(paths)} | metad=
ata: {len(sources)}')
+    checks =3D {'patches': patches, 'includes': includes, 'recipes': rec=
ipes}
+    total =3D 0
+    for check, func in checks.items():
+        if args.check not in ('all', check):
+            continue
+        found =3D list(func(paths, sources, args.verbose) if check =3D=3D=
 'recipes' else func(paths, sources))
+        visible =3D [f for f in found if f[0] !=3D 'referenced']
+        total +=3D len(visible)
+        print(f'\n{check.capitalize()} ({len(visible)} candidates):')
+        if check =3D=3D 'recipes':
+            def recipe_rank(item):
+                category, path, reason, _ =3D item
+                if category =3D=3D 'referenced':
+                    return (2, str(path))
+                if reason.startswith('likely unused:'):
+                    return (0, str(path))
+                return (1, str(path))
+            found.sort(key=3Drecipe_rank)
+        last_level =3D None
+        for category, path, reason, safe in found:
+            if category =3D=3D 'referenced' and not args.verbose:
+                continue
+            if check =3D=3D 'recipes':
+                level =3D ('Referenced' if category =3D=3D 'referenced' =
else
+                         'Likely unused' if reason.startswith('likely un=
used:') else
+                         'Potentially obsolete')
+                if level !=3D last_level:
+                    print(f'  {level}:')
+                    last_level =3D level
+                print(f'    {path}')
+            else:
+                print(f'  {path}')
+            if args.verbose or check =3D=3D 'recipes':
+                print(f'      {reason}' if check =3D=3D 'recipes' else f=
'    {reason}')
+            if args.delete and safe:
+                try:
+                    yes =3D args.force or input('    Delete patch? [y/N]=
 ').strip().lower() =3D=3D 'y'
+                except EOFError:
+                    yes =3D False
+                if yes:
+                    try:
+                        (root / path).unlink()
+                        print('    Deleted')
+                    except OSError as exc:
+                        print(f'    ERROR: {exc}', file=3Dsys.stderr)
+            elif args.delete and not safe and category !=3D 'referenced'=
:
+                print('    Review only; not deleted')
+    print(f'\nTotal: {total} candidates. Static analysis; verify before =
removing files.')
+    return 0
+
+
+if __name__ =3D=3D '__main__':
+    sys.exit(main())
--=20
2.54.0 (Apple Git-157)

