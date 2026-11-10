Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.392.1794338048516803905
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 11:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NvcGInI/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EC741477
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 11:14:04 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 733B03F673
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 11:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794338047; bh=W/tzz4k/Ta5x3IpoQtVExA252sIMEGzecBjWETqZRm8=;
	h=From:To:Subject:Date:From;
	b=NvcGInI//5u6BwQ80dALn+O0AWq0znalmYUyaMddC/ZRhBnW2f4fCaZuJiw7cH3tI
	 XA1PRSKtYSVfhHwmcXMpyBROhGH3frM5isGZQMS8tQguJg1qgbHJaX0774WbZZzngP
	 xhhoA93OsirZtJIGAFrS/O15C/wRq+1pyX8ERUU8=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] scripts: add release management script
Date: Tue, 10 Nov 2026 14:14:04 -0500
Message-ID: <20261110191406.48308-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2026 19:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7207

Add a Python script to simplify and consolidate the meta-arm release
process, replacing several previously used standalone Bash scripts.

The script supports creating GPG-signed Yocto release tags, updating
existing release branches when new commits are available, and creating
platform-specific release tags. Platform tags use the existing naming
convention and support specifying a release date independently of when
the tag is created.

Release tags can be published to the upstream repository, with support
for publishing individual tags or automatically identifying unpublished
releases. Existing upstream tags are checked to prevent accidental
overwrites.

Release announcements can be generated automatically, including commit
counts, changelogs, and LTS support information. Announcements can be
reviewed and edited using the user=E2=80=99s configured editor before bei=
ng
sent via sendmail or mutt.

A dry-run mode is enabled by default, allowing release operations to be
reviewed before execution. Additional checks verify the release
environment, and a unit test suite validates the release management
logic.

This implementation is based on original Bash scripts written by me
for managing meta-arm and platform releases. ChatGPT was used to
consolidate and refactor the existing functionality, translate it to
Python, and assist with additional features and testing.

AI-Generated: Uses OpenAI ChatGPT (GPT-6)
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/meta-arm-release.py      | 731 +++++++++++++++++++++++++++++++
 scripts/test_meta_arm_release.py | 220 ++++++++++
 2 files changed, 951 insertions(+)
 create mode 100644 scripts/meta-arm-release.py
 create mode 100644 scripts/test_meta_arm_release.py

diff --git a/scripts/meta-arm-release.py b/scripts/meta-arm-release.py
new file mode 100644
index 000000000000..518da03fc168
--- /dev/null
+++ b/scripts/meta-arm-release.py
@@ -0,0 +1,731 @@
+#!/usr/bin/env python3
+# SPDX-FileCopyrightText: 2026 Arm Limited
+# SPDX-License-Identifier: MIT
+"""Create, publish and announce meta-arm release tags."""
+
+import argparse
+from datetime import date, datetime
+import os
+import re
+import shlex
+import shutil
+import subprocess
+import sys
+import tempfile
+from dataclasses import dataclass
+from email.message import EmailMessage
+from pathlib import Path
+
+SUPPORT_URL =3D 'https://docs.yoctoproject.org/ref-manual/release-proces=
s.html'
+VERSION_RE =3D re.compile(r'^(\d+)\.(\d+)(?:\.(\d+))?$')
+PLATFORM_TAG_RE =3D re.compile(r'^[A-Z][A-Z0-9_-]*-[0-9]{4}\.[0-9]{2}\.[=
0-9]{2}$')
+DEFAULT_LTS =3D ('scarthgap', 'wrynose')
+
+
+class ReleaseError(Exception):
+    pass
+
+
+def run(*argv, check=3DTrue):
+    result =3D subprocess.run(argv, text=3DTrue, stdout=3Dsubprocess.PIP=
E,
+                            stderr=3Dsubprocess.PIPE)
+    if check and result.returncode:
+        raise ReleaseError(f"{' '.join(argv)}: {result.stderr.strip()}")
+    return result
+
+
+def git(*args, check=3DTrue):
+    return run('git', *args, check=3Dcheck)
+
+
+def series_number(version):
+    match =3D VERSION_RE.fullmatch(version)
+    if not match or match.group(3) is not None or int(match.group(2)) > =
3:
+        raise ReleaseError(f'Invalid initial release version: {version}'=
)
+    return int(match.group(1)) * 4 + int(match.group(2))
+
+
+def series_from_number(number):
+    return f'{number // 4}.{number % 4}'
+
+
+def previous_series(version):
+    number =3D series_number(version)
+    if number =3D=3D 0:
+        raise ReleaseError('No previous release version')
+    return series_from_number(number - 1)
+
+
+def next_patch(version):
+    match =3D VERSION_RE.fullmatch(version)
+    if not match:
+        raise ReleaseError(f'Invalid version: {version}')
+    return f'{match.group(1)}.{match.group(2)}.{int(match.group(3) or 0)=
 + 1}'
+
+
+def platform_tag(name, release_date=3DNone):
+    """Build a platform tag, validating both platform name and calendar =
date."""
+    if not re.fullmatch(r'[A-Za-z][A-Za-z0-9_-]*', name):
+        raise ReleaseError(f'Invalid platform name: {name}')
+    if release_date is None:
+        release_date =3D date.today().strftime('%Y.%m.%d')
+    try:
+        datetime.strptime(release_date, '%Y.%m.%d')
+    except ValueError as exc:
+        raise ReleaseError('--date must be a valid YYYY.MM.DD date') fro=
m exc
+    if not re.fullmatch(r'\d{4}\.\d{2}\.\d{2}', release_date):
+        raise ReleaseError('--date must use YYYY.MM.DD')
+    return f'{name.upper()}-{release_date}'
+
+
+@dataclass
+class BranchStatus:
+    branch: str
+    series: str
+    last_tag: str | None
+    commits: int | None
+    next_tag: str
+
+
+class ReleaseManager:
+    def __init__(self, remote=3D'yoctoproject', recipient=3D'meta-arm@li=
sts.yoctoproject.org',
+                 lts=3DDEFAULT_LTS, execute=3DFalse, edit=3DFalse, as_of=
=3DNone, force_lts=3DFalse, mailer=3D'auto'):
+        self.remote =3D remote
+        self.recipient =3D recipient
+        self.lts =3D tuple(lts)
+        self.execute =3D execute
+        self.edit =3D edit
+        self.as_of =3D as_of
+        self.force_lts =3D force_lts
+        if mailer not in ('auto', 'sendmail', 'mutt'):
+            raise ReleaseError(f'Invalid mailer: {mailer}')
+        self.mailer =3D mailer
+        self._branches =3D None
+        self._series =3D None
+
+    def branch_ref(self, branch):
+        return f'refs/remotes/{self.remote}/{branch}'
+
+    def branches(self):
+        if self._branches is None:
+            refs =3D git('for-each-ref', '--format=3D%(refname:strip=3D3=
)',
+                       f'refs/remotes/{self.remote}/').stdout.splitlines=
()
+            self._branches =3D sorted(b for b in refs if b not in ('mast=
er', 'testing') and '/' not in b)
+            if not self._branches:
+                raise ReleaseError(f'No release branches under {self.rem=
ote}')
+        return self._branches
+
+    def require_branch(self, branch):
+        if branch not in self.branches():
+            raise ReleaseError(f'Unknown or excluded upstream branch: {b=
ranch}')
+
+    @staticmethod
+    def ancestor(older, newer):
+        return git('merge-base', '--is-ancestor', older, newer, check=3D=
False).returncode =3D=3D 0
+
+    @staticmethod
+    def tag_commit(tag):
+        result =3D git('rev-parse', '--verify', '-q', f'refs/tags/{tag}^=
{{commit}}', check=3DFalse)
+        return result.stdout.strip() if result.returncode =3D=3D 0 else =
None
+
+    @staticmethod
+    def tag_object(tag):
+        result =3D git('rev-parse', '--verify', '-q', f'refs/tags/{tag}'=
, check=3DFalse)
+        return result.stdout.strip() if result.returncode =3D=3D 0 else =
None
+
+    def numeric_tags(self):
+        return [tag for tag in git('tag', '-l').stdout.splitlines() if V=
ERSION_RE.fullmatch(tag)]
+
+    def discover_series(self):
+        """Use tags that lie on a branch, not inherited tags on its fork=
 history.
+
+        A branch's initial release can be at the fork itself; in that ca=
se,
+        resolve shared tags by proximity and fail closed if ambiguous.
+        """
+        if self._series is not None:
+            return self._series
+        branches =3D self.branches()
+        tags =3D self.numeric_tags()
+        forks =3D {}
+        for branch in branches:
+            result =3D git('merge-base', self.branch_ref(branch), self.b=
ranch_ref('master'))
+            forks[branch] =3D result.stdout.strip()
+
+        # For every series, assign it to the branch whose tip is nearest
+        # to its latest reachable tag. Ties cannot establish ownership.
+        candidates =3D {}
+        for tag in tags:
+            match =3D VERSION_RE.fullmatch(tag)
+            series =3D f'{match.group(1)}.{match.group(2)}'
+            for branch in branches:
+                if not self.ancestor(f'refs/tags/{tag}', self.branch_ref=
(branch)):
+                    continue
+                distance =3D int(git('rev-list', '--count',
+                                   f'{tag}..{self.branch_ref(branch)}').=
stdout)
+                current =3D candidates.setdefault(series, {})
+                if branch not in current or distance < current[branch][0=
] or (
+                        distance =3D=3D current[branch][0] and
+                        (int(match.group(3) or 0) > current[branch][1]))=
:
+                    current[branch] =3D (distance, int(match.group(3) or=
 0), tag)
+
+        owners =3D {}
+        for series, choices in candidates.items():
+            ranked =3D sorted((v[0], -v[1], b) for b, v in choices.items=
())
+            if not ranked:
+                continue
+            # If multiple branches are tied, avoid guessing ownership.
+            if len(ranked) > 1 and ranked[0][:2] =3D=3D ranked[1][:2]:
+                raise ReleaseError(f'Ambiguous ownership for {series}: {=
ranked[0][2]}, {ranked[1][2]}')
+            owners[series] =3D ranked[0][2]
+
+        by_branch =3D {}
+        for series, branch in owners.items():
+            if branch in by_branch:
+                raise ReleaseError(f'Multiple version series appear to b=
elong to {branch}')
+            by_branch[branch] =3D series
+
+        if not by_branch:
+            raise ReleaseError('No release version anchors found')
+
+        # Infer only unreleased branches, after the highest established =
series.
+        missing =3D [b for b in branches if b not in by_branch]
+        if missing:
+            latest =3D max(series_number(s) for s in by_branch.values())
+            ordered =3D sorted(missing, key=3Dlambda b: int(git('show', =
'-s', '--format=3D%ct', forks[b]).stdout))
+            for earlier, later in zip(ordered, ordered[1:]):
+                if not self.ancestor(forks[earlier], forks[later]) or fo=
rks[earlier] =3D=3D forks[later]:
+                    raise ReleaseError(f'Cannot order unreleased branche=
s: {earlier}, {later}')
+            for branch in ordered:
+                latest +=3D 1
+                by_branch[branch] =3D series_from_number(latest)
+        self._series =3D by_branch
+        return by_branch
+
+    def latest_tag(self, branch):
+        series =3D self.discover_series()[branch]
+        choices =3D []
+        for tag in self.numeric_tags():
+            match =3D VERSION_RE.fullmatch(tag)
+            if f'{match.group(1)}.{match.group(2)}' !=3D series:
+                continue
+            if self.ancestor(f'refs/tags/{tag}', self.branch_ref(branch)=
):
+                choices.append((int(match.group(3) or 0), tag))
+        return max(choices)[1] if choices else None
+
+    def status(self, branch):
+        self.require_branch(branch)
+        series =3D self.discover_series()[branch]
+        last =3D self.latest_tag(branch)
+        if not last:
+            return BranchStatus(branch, series, None, None, f'Initial {s=
eries}')
+        count =3D int(git('rev-list', '--count', f'{last}..{self.branch_=
ref(branch)}').stdout)
+        return BranchStatus(branch, series, last, count, next_patch(last=
) if count else '-')
+
+    def show_status(self, branches):
+        print(f'{"Branch":<18} {"Version":<9} {"Last-tag":<14} {"Commits=
":<10} Next-tag')
+        for branch in branches:
+            state =3D self.status(branch)
+            print(f'{branch:<18} {state.series:<9} {state.last_tag or "(=
none)":<14} '
+                  f'{str(state.commits) if state.commits is not None els=
e "-":<10} {state.next_tag}')
+
+    def create_tags(self, branch, version, ref, kind):
+        self.require_branch(branch)
+        if not VERSION_RE.fullmatch(version):
+            raise ReleaseError(f'Invalid tag version: {version}')
+        target =3D git('rev-parse', '--verify', f'{ref}^{{commit}}').std=
out.strip()
+        if not self.ancestor(target, self.branch_ref(branch)):
+            raise ReleaseError(f'{ref} is not on {branch}')
+        for tag in (version, f'yocto-{version}'):
+            old =3D self.tag_commit(tag)
+            if old and old !=3D target:
+                raise ReleaseError(f'{tag} already points to another com=
mit')
+        print(f'{branch}: {version} -> {target[:12]} ({kind})')
+        for tag in (version, f'yocto-{version}'):
+            if self.tag_object(tag):
+                print(f'  Exists: {tag}')
+            elif self.execute:
+                git('tag', '-s', tag, '-m', f'{kind} for Yocto Project {=
version} ({branch})', target)
+                print(f'  Created: {tag}')
+            else:
+                print(f'  DRY RUN: create {tag}')
+        self._series =3D None
+
+    def release(self, branch, version):
+        self.require_branch(branch)
+        expected =3D self.discover_series()[branch]
+        if version !=3D expected:
+            raise ReleaseError(f'Expected {expected} for {branch}, got {=
version}')
+        ref =3D self.branch_ref(branch)
+        if self.as_of:
+            ref =3D git('rev-list', '--first-parent', '--before', f'{sel=
f.as_of} 23:59:59',
+                      '-1', ref).stdout.strip()
+            if not ref:
+                raise ReleaseError(f'No commit on {branch} before {self.=
as_of}')
+        self.create_tags(branch, version, ref, 'Initial release')
+
+    def update(self, branches):
+        created =3D []
+        for branch in branches:
+            state =3D self.status(branch)
+            if not state.last_tag:
+                print(f'{branch}: initial release {state.series} missing=
; skipping')
+            elif not state.commits:
+                print(f'{branch}: no new commits; skipping')
+            else:
+                self.create_tags(branch, state.next_tag, self.branch_ref=
(branch), 'Update')
+                created.append((branch, state.next_tag))
+        return created
+
+    def platform(self, name, ref, release_date=3DNone):
+        """Create a signed platform tag without requiring release branch=
 discovery."""
+        tag =3D platform_tag(name, release_date)
+        target =3D git('rev-parse', '--verify', f'{ref}^{{commit}}').std=
out.strip()
+        existing =3D self.tag_object(tag)
+        if existing:
+            if self.tag_commit(tag) !=3D target:
+                raise ReleaseError(f'{tag} already exists at another com=
mit')
+            print(f'Platform tag already exists: {tag} -> {target[:12]}'=
)
+            return tag
+        print(f'Platform: {name}\nCommit:   {target[:12]}\nTag:      {ta=
g}')
+        if self.execute:
+            message =3D f'{name.upper()} platform release ({tag.rsplit("=
-", 1)[1]})\n\nRelease of the {name} platform at commit {target}.'
+            git('tag', '-s', tag, '-m', message, target)
+            print(f'Created signed tag: {tag}')
+        else:
+            print(f'DRY RUN: Would create signed tag {tag}.')
+        return tag
+
+    def tags_for(self, branches):
+        series_map =3D self.discover_series()
+        selected =3D branches or self.branches()
+        result =3D set()
+        for branch in selected:
+            self.require_branch(branch)
+            series =3D series_map[branch]
+            for tag in self.numeric_tags():
+                match =3D VERSION_RE.fullmatch(tag)
+                if f'{match.group(1)}.{match.group(2)}' !=3D series:
+                    continue
+                if not self.ancestor(f'refs/tags/{tag}', self.branch_ref=
(branch)):
+                    continue
+                paired =3D f'yocto-{tag}'
+                if not self.tag_commit(paired) or self.tag_commit(paired=
) !=3D self.tag_commit(tag):
+                    raise ReleaseError(f'Missing or mismatched paired ta=
g: {paired}')
+                result.update((tag, paired))
+        return sorted(result)
+
+    def push(self, selections=3D(), all_tags=3DFalse):
+        """Push selected tags, or all recognized release tags, without o=
verwrites.
+
+        For compatibility, a selection may be an existing release branch=
.
+        Explicit tag names need not match the recognized tag patterns.
+        """
+        if all_tags:
+            tags =3D git('tag', '-l').stdout.splitlines()
+        elif selections:
+            tags =3D set()
+            for selection in selections:
+                if self.tag_object(selection):
+                    tags.add(selection)
+                elif selection in self.branches():
+                    tags.update(self.tags_for((selection,)))
+                else:
+                    raise ReleaseError(f'Unknown tag or release branch: =
{selection}')
+            tags =3D sorted(tags)
+        else:
+            tags =3D [t for t in git('tag', '-l').stdout.splitlines()
+                    if VERSION_RE.fullmatch(t)
+                    or (t.startswith('yocto-') and VERSION_RE.fullmatch(=
t[6:]))
+                    or PLATFORM_TAG_RE.fullmatch(t)]
+        if not tags:
+            print('No matching release tags')
+            return
+        remote =3D {}
+        for line in git('ls-remote', '--tags', '--refs', self.remote).st=
dout.splitlines():
+            sha, ref =3D line.split()
+            remote[ref.removeprefix('refs/tags/')] =3D sha
+        pending =3D []
+        published =3D 0
+        for tag in tags:
+            local =3D self.tag_object(tag)
+            old =3D remote.get(tag)
+            if old is None:
+                pending.append(tag)
+            elif old =3D=3D local:
+                published +=3D 1
+            else:
+                raise ReleaseError(f'Tag conflict on {self.remote}: {tag=
} local=3D{local} remote=3D{old}')
+        print(f'Upstream: {self.remote}\nAlready published: {published}\=
nNew tags: {len(pending)}')
+        for tag in pending:
+            print(f'  {tag}')
+        if pending and self.execute:
+            git('push', '--atomic', self.remote,
+                *(f'refs/tags/{tag}:refs/tags/{tag}' for tag in pending)=
)
+            print(f'Published {len(pending)} tags.')
+        elif not self.execute:
+            print('DRY RUN: No tags pushed.')
+
+    def lts_description(self, branch):
+        if branch in self.lts or self.force_lts:
+            opening =3D ('This is a Long Term Support (LTS) release. met=
a-arm generally aims '
+                       'to follow the Yocto Project\'s LTS support lifec=
ycle on a best-effort '
+                       'basis, with maintenance primarily focused on bug=
 fixes and security '
+                       'fixes. CI testing is performed on supported conf=
igurations as resources permit.')
+        else:
+            opening =3D ('This is NOT a Long Term Support (LTS) release.=
 meta-arm generally aims '
+                       'to follow the Yocto Project\'s release support l=
ifecycle on a best-effort '
+                       'basis. For non-LTS releases, this means approxim=
ately seven months of '
+                       'limited maintenance, primarily consisting of bug=
 fixes and security fixes, '
+                       'with minimal CI testing.')
+        if self.lts:
+            names =3D ', '.join(self.lts[:-1]) + (' and ' if len(self.lt=
s) > 1 else '') + self.lts[-1]
+            opening +=3D f'\n\nThe currently supported LTS branches are =
{names}.'
+        return opening + ('\n\nFor more information about the Yocto Proj=
ect\'s release '
+                          f'lifecycle and LTS policy, see:\n{SUPPORT_URL=
}')
+
+    def announcement(self, branch, version):
+        self.require_branch(branch)
+        series =3D self.discover_series()[branch]
+        if version !=3D series and not re.fullmatch(re.escape(series) + =
r'\.\d+', version):
+            raise ReleaseError(f'{version} does not belong to {branch} (=
{series})')
+        if not self.tag_commit(version) or self.tag_commit(version) !=3D=
 self.tag_commit(f'yocto-{version}'):
+            raise ReleaseError(f'Missing or mismatched release tag pair:=
 {version}')
+        if not self.ancestor(f'refs/tags/{version}', self.branch_ref(bra=
nch)):
+            raise ReleaseError(f'{version} is not on {branch}')
+        lts_text =3D self.lts_description(branch)
+        if version =3D=3D series:
+            previous =3D previous_series(version)
+            if not self.tag_commit(previous):
+                raise ReleaseError(f'Missing previous initial release ta=
g {previous}')
+            count =3D git('rev-list', '--count', f'{previous}..{version}=
').stdout.strip()
+            subject =3D f'meta-arm {branch} release'
+            body =3D (f'meta-arm has released the {branch} support branc=
h, tagged as {version}.\n\n'
+                    f'{lts_text}\n\nThis release contains {count} commit=
s since the previous '
+                    f'Yocto Project release, {previous}.')
+        else:
+            patch =3D int(version.rsplit('.', 1)[1])
+            previous =3D series if patch =3D=3D 1 else f'{series}.{patch=
 - 1}'
+            if not self.tag_commit(previous) or not self.ancestor(previo=
us, version):
+                raise ReleaseError(f'Missing or non-ancestor previous ta=
g: {previous}')
+            log =3D git('log', '--reverse', '--format=3D%h %s', f'{previ=
ous}..{version}').stdout.strip()
+            count =3D int(git('rev-list', '--count', f'{previous}..{vers=
ion}').stdout)
+            if not count:
+                raise ReleaseError('No commits in update release')
+            dates =3D git('log', '--reverse', '--format=3D%cs', f'{previ=
ous}..{version}').stdout.splitlines()
+            first, last =3D dates[0], git('log', '-1', '--format=3D%cs',=
 version).stdout.strip()
+            subject =3D f'meta-arm {branch} update'
+            body =3D (f'meta-arm has released an updated {branch} suppor=
t tag, {version}.\n\n'
+                    f'{lts_text}\n\nThis release contains {count} commit=
s between {first} and {last}.\n\n'
+                    'Changes included in this release:\n\n' +
+                    '\n'.join('  ' + line for line in log.splitlines()))
+        body +=3D (f'\n\nThe release is available under the {version} an=
d yocto-{version} tags.\n'
+                 'Both tags are GPG signed.\n\nThanks,\nThe meta-arm tea=
m')
+        return subject, body
+
+    @staticmethod
+    def editor_command():
+        # git var GIT_EDITOR already respects GIT_EDITOR, VISUAL, EDITOR=
 and core.editor.
+        result =3D git('var', 'GIT_EDITOR', check=3DFalse)
+        return result.stdout.strip() if result.returncode =3D=3D 0 and r=
esult.stdout.strip() else 'vi'
+
+    def edit_message(self, subject, body):
+        original =3D f'Subject: {subject}\n\n{body}\n'
+        with tempfile.TemporaryDirectory(prefix=3D'meta-arm-release-') a=
s directory:
+            path =3D Path(directory) / 'announcement.txt'
+            path.write_text(original, encoding=3D'utf-8')
+            editor =3D self.editor_command()
+            print(f'Opening announcement in {editor}...', flush=3DTrue)
+            # Interactive editors must inherit stdin, stdout, and stderr=
.
+            # Git editor settings may contain shell quoting and argument=
s.
+            try:
+                subprocess.run(
+                    ['sh', '-c', f'{editor} "$1"', 'editor', str(path)],
+                    check=3DTrue,
+                )
+            except subprocess.CalledProcessError as exc:
+                raise ReleaseError('Editor exited unsuccessfully; email =
not sent') from exc
+            edited =3D path.read_text(encoding=3D'utf-8')
+        if edited =3D=3D original:
+            print('Email unchanged; not sending.')
+            return None
+        header, separator, text =3D edited.partition('\n\n')
+        if not separator or not header.startswith('Subject: '):
+            raise ReleaseError('Edited email must begin with Subject: fo=
llowed by a blank line')
+        new_subject =3D header.removeprefix('Subject: ').strip()
+        if not new_subject or '\r' in new_subject or '\n' in new_subject=
 or not text.strip():
+            raise ReleaseError('Invalid edited email subject or body')
+        return new_subject, text.rstrip('\n')
+
+    def mail_backend(self):
+        """Resolve the requested mailer without silently changing forced=
 choices."""
+        sendmail =3D shutil.which('sendmail')
+        if not sendmail and os.access('/usr/sbin/sendmail', os.X_OK):
+            sendmail =3D '/usr/sbin/sendmail'
+        mutt =3D shutil.which('mutt')
+
+        if self.mailer =3D=3D 'sendmail':
+            return sendmail
+        if self.mailer =3D=3D 'mutt':
+            return mutt
+        return sendmail or mutt
+
+    def send(self, subject, body):
+        backend =3D self.mail_backend()
+        if not backend:
+            raise ReleaseError(f'Requested mailer {self.mailer!r} is una=
vailable' if self.mailer !=3D 'auto'
+                               else 'Neither sendmail nor mutt is availa=
ble')
+        if os.path.basename(backend) =3D=3D 'mutt':
+            subprocess.run([backend, '-s', subject, '--', self.recipient=
],
+                           input=3Dbody + '\n', text=3DTrue, check=3DTru=
e)
+        else:
+            message =3D EmailMessage()
+            message['To'] =3D self.recipient
+            message['Subject'] =3D subject
+            message.set_content(body)
+            subprocess.run([backend, '-t', '-i'], input=3Dmessage.as_byt=
es(), check=3DTrue)
+
+    def email(self, branch, version):
+        subject, body =3D self.announcement(branch, version)
+        if self.edit:
+            changed =3D self.edit_message(subject, body)
+            if changed is None:
+                return
+            subject, body =3D changed
+        print(f'\nSubject: {subject}\n\n{body}\n')
+        if not self.execute:
+            print('DRY RUN: Email not sent.')
+            return
+        for tag in (version, f'yocto-{version}'):
+            output =3D git('ls-remote', '--tags', '--refs', self.remote,=
 f'refs/tags/{tag}').stdout
+            entries =3D dict(line.split()[::-1] for line in output.split=
lines())
+            if entries.get(f'refs/tags/{tag}') !=3D self.tag_object(tag)=
:
+                raise ReleaseError(f'{tag} is not published identically =
on {self.remote}')
+        self.send(subject, body)
+        print('Email submitted successfully.')
+
+    def check(self):
+        print('meta-arm release environment\n' + '-' * 48)
+        errors =3D 0
+        inside =3D git('rev-parse', '--is-inside-work-tree', check=3DFal=
se).returncode =3D=3D 0
+        print(f'Git repository:       {"OK" if inside else "FAILED"}')
+        errors +=3D not inside
+        url =3D git('remote', 'get-url', self.remote, check=3DFalse)
+        print(f'Upstream remote:      {self.remote} ({url.stdout.strip()=
 or "missing"})')
+        reachable =3D url.returncode =3D=3D 0 and git('ls-remote', '--he=
ads', self.remote, check=3DFalse).returncode =3D=3D 0
+        print(f'Upstream reachable:   {"OK" if reachable else "FAILED"}'=
)
+        errors +=3D not reachable
+        master =3D git('rev-parse', '--verify', '-q', f'{self.branch_ref=
("master")}^{{commit}}', check=3DFalse).returncode =3D=3D 0
+        print(f'Master branch:        {"OK" if master else "MISSING"}')
+        errors +=3D not master
+        if master:
+            print(f'Release branches:     {len(self.branches())}')
+        identity =3D (git('config', 'user.name', check=3DFalse).stdout.s=
trip(),
+                    git('config', 'user.email', check=3DFalse).stdout.st=
rip())
+        print(f'Git identity:         {identity[0]} <{identity[1]}>' if =
all(identity)
+              else 'Git identity:         NOT CONFIGURED')
+        errors +=3D not all(identity)
+        signing =3D git('config', 'user.signingkey', check=3DFalse).stdo=
ut.strip()
+        print(f'GPG signing key:      {signing or "Git default (not veri=
fied)"}')
+        mailer_path =3D self.mail_backend()
+        mailer_note =3D ' (forced)' if self.mailer !=3D 'auto' else ' (a=
uto)'
+        print(f'Email delivery:       {(mailer_path or "Not available") =
+ mailer_note}')
+        print(f'Email recipient:      {self.recipient}')
+        print(f'Editor:               {self.editor_command()}')
+        print(f'LTS branches:         {", ".join(self.lts)}')
+        print('Environment ready.' if not errors else f'Environment chec=
k failed: {errors} error(s).')
+        return not errors
+
+
+class FriendlyArgumentParser(argparse.ArgumentParser):
+    """Display the curated usage page without argparse's duplicate secti=
ons."""
+
+    def format_help(self):
+        return self.description + '\n'
+
+
+def parser():
+    """Build a CLI with a compact, example-driven help page."""
+    help_text =3D """\
+Usage: meta-arm-release.py COMMAND [ARGUMENTS] [OPTIONS]
+
+Commands:
+  check                       Check the release environment
+  status [BRANCH...]          Show release status and pending commits
+  release BRANCH VERSION      Create initial signed release tags (x.y)
+  update [BRANCH...]          Tag branches containing new commits (x.y.z=
)
+  tag BRANCH VERSION REF      Tag a specific historical commit
+  platform NAME REF           Create a signed platform release tag
+  push [TAG|BRANCH...]        Publish missing release tags to upstream
+  email BRANCH VERSION        Preview or send an announcement
+  all BRANCH VERSION          Initial release, updates, push and announc=
ements
+
+Options:
+  -h, --help, -?              Display this help
+  -n, --dry-run               Preview operations (default)
+  -x, --execute               Perform requested operations
+  -e, --edit                  Edit announcements using your configured e=
ditor
+  --lts                       Treat specified release as LTS
+  --as-of YYYY-MM-DD          Select historical first-parent commit by d=
ate
+  --date YYYY.MM.DD           Platform tag date (default: today)
+  --remote NAME               Upstream remote (default: yoctoproject)
+  --email-to ADDRESS          Override announcement recipient
+  --mailer {auto,sendmail,mutt}  Select email delivery method (default: =
auto)
+  --lts-branches "A B"        Set supported LTS branches
+
+Examples:
+  meta-arm-release.py check
+  meta-arm-release.py status
+  meta-arm-release.py status scarthgap wrynose
+  meta-arm-release.py release blacksail 6.1
+  meta-arm-release.py release blacksail 6.1 --execute
+  meta-arm-release.py update scarthgap whinlatter --execute
+  meta-arm-release.py tag wrynose 6.0 COMMIT --execute
+  meta-arm-release.py platform corstone1000 HEAD
+  meta-arm-release.py platform corstone1000 HEAD --date 2026.10.01 --exe=
cute
+  meta-arm-release.py push CORSTONE1000-2026.10.01 --execute
+  meta-arm-release.py push
+  meta-arm-release.py push --execute
+  meta-arm-release.py email blacksail 6.1
+  meta-arm-release.py email blacksail 6.1 --edit
+  meta-arm-release.py email blacksail 6.1 --edit --execute
+  meta-arm-release.py email blacksail 6.1 --mailer mutt --execute
+  meta-arm-release.py all blacksail 6.1 --execute
+
+Notes:
+  * Dry-run is the default; --execute does not ask for confirmation.
+  * Email previews require no mail program; automatic delivery prefers
+    sendmail and falls back to mutt. Use --mailer to force a backend.
+  * Editor selection follows Git configuration (including VISUAL/EDITOR)=
.
+  * Release branches must exist upstream; branches containing '/' are sk=
ipped.
+  * Existing tags are never overwritten; only missing tags are pushed.
+  * Push without arguments discovers Yocto and platform release tags.
+  * Push operations use only the configured upstream remote.
+  * The script never checks out branches.
+
+Environment variables:
+  META_ARM_RELEASE_REMOTE      Override upstream remote
+  META_ARM_RELEASE_EMAIL       Override announcement recipient
+  META_ARM_LTS_BRANCHES        Space-separated LTS branches
+  META_ARM_MAILER              auto, sendmail, or mutt
+"""
+    p =3D FriendlyArgumentParser(
+        prog=3D'meta-arm-release.py',
+        description=3Dhelp_text,
+        formatter_class=3Dargparse.RawDescriptionHelpFormatter,
+        add_help=3DFalse,
+    )
+    p.add_argument('-h', '--help', '-?', action=3D'help', help=3Dargpars=
e.SUPPRESS)
+    p.add_argument('--execute', '-x', action=3D'store_true', help=3Dargp=
arse.SUPPRESS)
+    p.add_argument('--dry-run', '-n', action=3D'store_true', help=3Dargp=
arse.SUPPRESS)
+    p.add_argument('--edit', '-e', action=3D'store_true', help=3Dargpars=
e.SUPPRESS)
+    p.add_argument('--lts', action=3D'store_true', help=3Dargparse.SUPPR=
ESS)
+    p.add_argument('--as-of', metavar=3D'YYYY-MM-DD', help=3Dargparse.SU=
PPRESS)
+    p.add_argument('--date', metavar=3D'YYYY.MM.DD', help=3Dargparse.SUP=
PRESS)
+    p.add_argument('--remote', default=3Dos.getenv('META_ARM_RELEASE_REM=
OTE', 'yoctoproject'),
+                   help=3Dargparse.SUPPRESS)
+    p.add_argument('--email-to', default=3Dos.getenv('META_ARM_RELEASE_E=
MAIL', 'meta-arm@lists.yoctoproject.org'),
+                   help=3Dargparse.SUPPRESS)
+    p.add_argument('--mailer', choices=3D('auto', 'sendmail', 'mutt'),
+                   default=3Dos.getenv('META_ARM_MAILER', 'auto'), help=3D=
argparse.SUPPRESS)
+    p.add_argument('--lts-branches', default=3Dos.getenv('META_ARM_LTS_B=
RANCHES', 'scarthgap wrynose'),
+                   help=3Dargparse.SUPPRESS)
+    sub =3D p.add_subparsers(dest=3D'command', required=3DTrue, metavar=3D=
'COMMAND')
+    sub.add_parser('check', add_help=3DFalse)
+    q =3D sub.add_parser('status', add_help=3DFalse)
+    q.add_argument('branches', nargs=3D'*')
+    q =3D sub.add_parser('release', add_help=3DFalse)
+    q.add_argument('branch')
+    q.add_argument('version')
+    q =3D sub.add_parser('update', add_help=3DFalse)
+    q.add_argument('branches', nargs=3D'*')
+    q =3D sub.add_parser('tag', add_help=3DFalse)
+    q.add_argument('branch')
+    q.add_argument('version')
+    q.add_argument('ref')
+    q =3D sub.add_parser('platform', add_help=3DFalse)
+    q.add_argument('name')
+    q.add_argument('ref')
+    q =3D sub.add_parser('push', add_help=3DFalse)
+    q.add_argument('selections', nargs=3D'*')
+    q =3D sub.add_parser('email', add_help=3DFalse)
+    q.add_argument('branch')
+    q.add_argument('version')
+    q =3D sub.add_parser('all', add_help=3DFalse)
+    q.add_argument('branch')
+    q.add_argument('version')
+    return p
+
+
+def main(argv=3DNone):
+    p =3D parser()
+    # Support global options either before or after the subcommand.
+    args =3D list(sys.argv[1:] if argv is None else argv)
+    if not args or any(token in ('-h', '--help', '-?') for token in args=
):
+        p.print_help()
+        return 0
+    globals_with_value =3D ('--as-of', '--date', '--remote', '--email-to=
', '--lts-branches', '--mailer')
+    globals_flags =3D ('--execute', '-x', '--dry-run', '-n', '--edit', '=
-e', '--lts')
+    front, rest =3D [], []
+    i =3D 0
+    while i < len(args):
+        token =3D args[i]
+        if token in globals_with_value:
+            if i + 1 >=3D len(args):
+                p.error(f'{token} requires a value')
+            front.extend(args[i:i+2]); i +=3D 2
+        elif token in globals_flags:
+            front.append(token); i +=3D 1
+        else:
+            rest.append(token); i +=3D 1
+    ns =3D p.parse_args(front + rest)
+    if ns.email_to.find('\n') >=3D 0 or ns.email_to.find('\r') >=3D 0:
+        p.error('Invalid email recipient')
+    if ns.date and ns.command !=3D 'platform':
+        p.error('--date only applies to platform')
+    if ns.edit and ns.command not in ('email', 'all'):
+        p.error('--edit only applies to email and all')
+    if ns.as_of and not re.fullmatch(r'\d{4}-\d{2}-\d{2}', ns.as_of):
+        p.error('--as-of requires YYYY-MM-DD')
+    manager =3D ReleaseManager(ns.remote, ns.email_to, ns.lts_branches.s=
plit(),
+                             ns.execute and not ns.dry_run, ns.edit, ns.=
as_of, ns.lts, ns.mailer)
+    if ns.command =3D=3D 'check':
+        return 0 if manager.check() else 1
+    if git('rev-parse', '--is-inside-work-tree', check=3DFalse).returnco=
de:
+        raise ReleaseError('Not in a Git repository')
+    if ns.command =3D=3D 'status':
+        manager.show_status(ns.branches or manager.branches())
+    elif ns.command =3D=3D 'release':
+        manager.release(ns.branch, ns.version)
+    elif ns.command =3D=3D 'update':
+        manager.update(ns.branches or manager.branches())
+    elif ns.command =3D=3D 'tag':
+        manager.require_branch(ns.branch)
+        expected =3D manager.discover_series()[ns.branch]
+        if ns.version !=3D expected and not re.fullmatch(re.escape(expec=
ted) + r'\.\d+', ns.version):
+            raise ReleaseError(f'Wrong version series for {ns.branch}: {=
ns.version}')
+        manager.create_tags(ns.branch, ns.version, ns.ref, 'Release')
+    elif ns.command =3D=3D 'platform':
+        manager.platform(ns.name, ns.ref, ns.date)
+    elif ns.command =3D=3D 'push':
+        manager.push(ns.selections)
+    elif ns.command =3D=3D 'email':
+        manager.email(ns.branch, ns.version)
+    elif ns.command =3D=3D 'all':
+        manager.release(ns.branch, ns.version)
+        created =3D [(ns.branch, ns.version)]
+        created +=3D manager.update([b for b in manager.branches() if b =
!=3D ns.branch])
+        if manager.execute:
+            manager.push()
+            for branch, version in created:
+                manager.email(branch, version)
+        else:
+            print('DRY RUN: No tags created, pushed or emails sent.')
+    return 0
+
+
+if __name__ =3D=3D '__main__':
+    try:
+        sys.exit(main())
+    except (ReleaseError, subprocess.CalledProcessError) as error:
+        print(f'ERROR: {error}', file=3Dsys.stderr)
+        sys.exit(1)
diff --git a/scripts/test_meta_arm_release.py b/scripts/test_meta_arm_rel=
ease.py
new file mode 100644
index 000000000000..8c0d3c39a211
--- /dev/null
+++ b/scripts/test_meta_arm_release.py
@@ -0,0 +1,220 @@
+#!/usr/bin/env python3
+# SPDX-FileCopyrightText: 2026 Arm Limited
+# SPDX-License-Identifier: MIT
+"""Offline unit and integration tests for meta-arm-release.py."""
+
+import importlib.util
+import os
+import subprocess
+import tempfile
+import unittest
+from pathlib import Path
+from unittest.mock import patch
+
+SCRIPT =3D Path(__file__).with_name('meta-arm-release.py')
+spec =3D importlib.util.spec_from_file_location('meta_arm_release', SCRI=
PT)
+release =3D importlib.util.module_from_spec(spec)
+import sys
+sys.modules[spec.name] =3D release
+spec.loader.exec_module(release)
+
+
+class VersionTests(unittest.TestCase):
+    def test_initial_release_sequence(self):
+        self.assertEqual(release.previous_series('6.0'), '5.3')
+        self.assertEqual(release.previous_series('6.1'), '6.0')
+        self.assertEqual(release.series_from_number(release.series_numbe=
r('5.3') + 1), '6.0')
+
+    def test_patch_version(self):
+        self.assertEqual(release.next_patch('5.0'), '5.0.1')
+        self.assertEqual(release.next_patch('5.0.4'), '5.0.5')
+
+    def test_bad_version(self):
+        with self.assertRaises(release.ReleaseError):
+            release.series_number('6.4')
+
+
+class GitFixture(unittest.TestCase):
+    def setUp(self):
+        self.temp =3D tempfile.TemporaryDirectory()
+        self.addCleanup(self.temp.cleanup)
+        self.repo =3D Path(self.temp.name)
+        self.previous =3D Path.cwd()
+        os.chdir(self.repo)
+        self.addCleanup(os.chdir, self.previous)
+        self.git('init', '-q', '-b', 'master')
+        self.git('config', 'user.name', 'Test Maintainer')
+        self.git('config', 'user.email', 'test@example.com')
+        self.commit('initial')
+        self.remote =3D self.repo / 'upstream.git'
+        subprocess.check_call(['git', 'init', '-q', '--bare', str(self.r=
emote)])
+        self.git('remote', 'add', 'yoctoproject', str(self.remote))
+        self.git('update-ref', 'refs/remotes/yoctoproject/master', self.=
git('rev-parse', 'master'))
+
+    def git(self, *args):
+        return subprocess.check_output(['git', *args], text=3DTrue).stri=
p()
+
+    def commit(self, subject):
+        with (self.repo / 'history.txt').open('a') as stream:
+            stream.write(subject + '\n')
+        self.git('add', 'history.txt')
+        self.git('commit', '-q', '-m', subject)
+
+    def branch(self, name):
+        self.git('branch', name)
+        self.git('update-ref', f'refs/remotes/yoctoproject/{name}', self=
.git('rev-parse', name))
+
+    def refresh(self, name):
+        self.git('update-ref', f'refs/remotes/yoctoproject/{name}', self=
.git('rev-parse', name))
+
+
+class ReleaseIntegrationTests(GitFixture):
+    def test_existing_tag_and_update(self):
+        self.branch('scarthgap')
+        self.git('checkout', '-q', 'scarthgap')
+        self.git('tag', '-a', '5.0', '-m', 'initial')
+        self.git('tag', '-a', 'yocto-5.0', '-m', 'initial')
+        self.commit('fix one')
+        self.commit('fix two')
+        self.refresh('scarthgap')
+        self.git('checkout', '-q', 'master')
+        manager =3D release.ReleaseManager()
+        state =3D manager.status('scarthgap')
+        self.assertEqual((state.series, state.last_tag, state.commits, s=
tate.next_tag),
+                         ('5.0', '5.0', 2, '5.0.1'))
+
+    def test_no_updates(self):
+        self.branch('scarthgap')
+        self.git('tag', '-a', '5.0', '-m', 'initial')
+        self.git('tag', '-a', 'yocto-5.0', '-m', 'initial')
+        state =3D release.ReleaseManager().status('scarthgap')
+        self.assertEqual(state.commits, 0)
+        self.assertEqual(state.next_tag, '-')
+
+    def test_announcement_initial_count(self):
+        self.branch('wrynose')
+        self.git('tag', '-a', '6.0', '-m', 'initial')
+        self.git('tag', '-a', 'yocto-6.0', '-m', 'initial')
+        self.commit('master change')
+        self.branch('blacksail')
+        self.git('tag', '-a', '6.1', '-m', 'initial')
+        self.git('tag', '-a', 'yocto-6.1', '-m', 'initial')
+        manager =3D release.ReleaseManager()
+        subject, body =3D manager.announcement('blacksail', '6.1')
+        self.assertEqual(subject, 'meta-arm blacksail release')
+        self.assertIn('1 commits since the previous Yocto Project releas=
e, 6.0', body)
+        self.assertIn('The meta-arm team', body)
+        self.assertNotIn('Changes included', body)
+
+    def test_update_announcement_lists_changes(self):
+        self.branch('scarthgap')
+        self.git('checkout', '-q', 'scarthgap')
+        self.git('tag', '-a', '5.0', '-m', 'initial')
+        self.git('tag', '-a', 'yocto-5.0', '-m', 'initial')
+        self.commit('fix one')
+        self.git('tag', '-a', '5.0.1', '-m', 'update')
+        self.git('tag', '-a', 'yocto-5.0.1', '-m', 'update')
+        self.refresh('scarthgap')
+        manager =3D release.ReleaseManager()
+        subject, body =3D manager.announcement('scarthgap', '5.0.1')
+        self.assertIn('fix one', body)
+        self.assertIn('1 commits', body)
+        self.assertIn('5.0.1 and yocto-5.0.1 tags', body)
+
+    def test_push_dry_run_does_not_modify_remote(self):
+        self.branch('scarthgap')
+        self.git('tag', '-a', '5.0', '-m', 'initial')
+        self.git('tag', '-a', 'yocto-5.0', '-m', 'initial')
+        manager =3D release.ReleaseManager(execute=3DFalse)
+        with patch('builtins.print') as printer:
+            manager.push(['scarthgap'])
+        self.assertTrue(any('New tags: 2' in str(call) for call in print=
er.call_args_list))
+
+
+
+class MailerTests(unittest.TestCase):
+    def test_auto_prefers_sendmail(self):
+        with patch.object(release.shutil, 'which', side_effect=3Dlambda =
x: {'sendmail': '/usr/bin/sendmail', 'mutt': '/usr/bin/mutt'}.get(x)):
+            self.assertEqual(release.ReleaseManager(mailer=3D'auto').mai=
l_backend(), '/usr/bin/sendmail')
+
+    def test_force_mutt(self):
+        with patch.object(release.shutil, 'which', side_effect=3Dlambda =
x: {'sendmail': '/usr/bin/sendmail', 'mutt': '/usr/bin/mutt'}.get(x)):
+            self.assertEqual(release.ReleaseManager(mailer=3D'mutt').mai=
l_backend(), '/usr/bin/mutt')
+
+    def test_force_sendmail_unavailable_does_not_fallback(self):
+        with patch.object(release.shutil, 'which', side_effect=3Dlambda =
x: {'mutt': '/usr/bin/mutt'}.get(x)), patch.object(release.os, 'access', =
return_value=3DFalse):
+            manager =3D release.ReleaseManager(mailer=3D'sendmail')
+            self.assertIsNone(manager.mail_backend())
+            with self.assertRaisesRegex(release.ReleaseError, 'sendmail'=
):
+                manager.send('subject', 'body')
+
+    def test_cli_override_env(self):
+        with patch.dict(os.environ, {'META_ARM_MAILER': 'mutt'}):
+            self.assertEqual(release.parser().parse_args(['--mailer', 's=
endmail', 'check']).mailer, 'sendmail')
+            self.assertEqual(release.parser().parse_args(['check']).mail=
er, 'mutt')
+
+    def test_invalid_mailer_rejected(self):
+        with self.assertRaises(release.ReleaseError):
+            release.ReleaseManager(mailer=3D'invalid')
+
+if __name__ =3D=3D '__main__':
+    unittest.main(verbosity=3D2)
+
+
+class EditorTests(unittest.TestCase):
+    def test_editor_inherits_terminal_streams(self):
+        manager =3D release.ReleaseManager(edit=3DTrue)
+        with patch.object(manager, 'editor_command', return_value=3D'vim=
 -c "set spell"'):
+            with patch.object(release.subprocess, 'run') as invoke:
+                result =3D manager.edit_message('Subject', 'Body')
+        self.assertIsNone(result)
+        invoke.assert_called_once()
+        args, kwargs =3D invoke.call_args
+        self.assertEqual(args[0][:3], ['sh', '-c', 'vim -c "set spell" "=
$1"'])
+        self.assertTrue(kwargs['check'])
+        self.assertNotIn('stdout', kwargs)
+        self.assertNotIn('stderr', kwargs)
+        self.assertNotIn('stdin', kwargs)
+
+    def test_editor_failure_prevents_send(self):
+        manager =3D release.ReleaseManager(edit=3DTrue)
+        with patch.object(manager, 'editor_command', return_value=3D'vim=
'):
+            with patch.object(release.subprocess, 'run', side_effect=3Ds=
ubprocess.CalledProcessError(1, 'vim')):
+                with self.assertRaisesRegex(release.ReleaseError, 'Edito=
r exited unsuccessfully'):
+                    manager.edit_message('Subject', 'Body')
+
+
+class PlatformReleaseTests(GitFixture):
+    def test_platform_tag_name_and_date(self):
+        self.assertEqual(release.platform_tag('corstone1000', '2026.10.0=
1'),
+                         'CORSTONE1000-2026.10.01')
+        with self.assertRaises(release.ReleaseError):
+            release.platform_tag('corstone1000', '2026.02.30')
+
+    def test_platform_dry_run_does_not_create_tag(self):
+        manager =3D release.ReleaseManager()
+        tag =3D manager.platform('corstone1000', 'HEAD', '2026.10.01')
+        self.assertEqual(tag, 'CORSTONE1000-2026.10.01')
+        self.assertIsNone(manager.tag_object(tag))
+
+    def test_platform_existing_tag_is_idempotent(self):
+        self.git('tag', '-a', 'CORSTONE1000-2026.10.01', '-m', 'release'=
)
+        manager =3D release.ReleaseManager(execute=3DTrue)
+        self.assertEqual(manager.platform('corstone1000', 'HEAD', '2026.=
10.01'),
+                         'CORSTONE1000-2026.10.01')
+
+    def test_push_explicit_platform_tag(self):
+        self.git('tag', '-a', 'CORSTONE1000-2026.10.01', '-m', 'release'=
)
+        manager =3D release.ReleaseManager(execute=3DTrue)
+        manager.push(('CORSTONE1000-2026.10.01',))
+        remote =3D self.git('ls-remote', '--tags', '--refs', 'yoctoproje=
ct',
+                          'refs/tags/CORSTONE1000-2026.10.01')
+        self.assertIn('refs/tags/CORSTONE1000-2026.10.01', remote)
+
+    def test_push_auto_discovers_platform_tag(self):
+        self.git('tag', '-a', 'CORSTONE1000-2026.10.01', '-m', 'release'=
)
+        manager =3D release.ReleaseManager(execute=3DTrue)
+        manager.push()
+        remote =3D self.git('ls-remote', '--tags', '--refs', 'yoctoproje=
ct',
+                          'refs/tags/CORSTONE1000-2026.10.01')
+        self.assertIn('refs/tags/CORSTONE1000-2026.10.01', remote)
--=20
2.54.0 (Apple Git-157)

