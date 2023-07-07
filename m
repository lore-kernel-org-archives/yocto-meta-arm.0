Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1204AC0015E
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 13:43:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12778.1688737380679703440
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 06:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DE0D1063;
	Fri,  7 Jul 2023 06:43:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEE213F73F;
	Fri,  7 Jul 2023 06:42:59 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] CI: add a tool to fetch a lockfile.yml for a specified build
Date: Fri,  7 Jul 2023 14:42:57 +0100
Message-Id: <20230707134257.3059771-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707134257.3059771-1-ross.burton@arm.com>
References: <20230707134257.3059771-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Jul 2023 13:43:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4868

From: Ross Burton <ross.burton@arm.com>

This tool makes it easy to lock a build to a known good configuration,
for example by locking the SHAs to the last good build of master.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/download-lockfile.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100755 ci/download-lockfile.py

diff --git a/ci/download-lockfile.py b/ci/download-lockfile.py
new file mode 100755
index 00000000..3d4d50c6
--- /dev/null
+++ b/ci/download-lockfile.py
@@ -0,0 +1,31 @@
+#! /usr/bin/env python3
+
+"""
+Download the lockfile.yml produced by a CI pipeline, specified by the Gi=
tLab
+server, full name of the meta-arm project, and the refspec that was exec=
uted.
+
+For example,
+$ ./download-lockfile.py https://gitlab.com/ rossburton/meta-arm master
+
+SPDX-FileCopyrightText: Copyright 2023 Arm Limited and Contributors
+SPDX-License-Identifier: GPL-2.0-only
+"""
+
+import argparse
+import gitlab
+import io
+import zipfile
+
+parser =3D argparse.ArgumentParser()
+parser.add_argument("server", help=3D"GitLab server name")
+parser.add_argument("project", help=3D"meta-arm project name")
+parser.add_argument("refspec", help=3D"Branch/commit")
+args =3D parser.parse_args()
+
+gl =3D gitlab.Gitlab(args.server)
+project =3D gl.projects.get(args.project)
+artefact =3D project.artifacts.download(ref_name=3Dargs.refspec, job=3D"=
update-repos")
+
+z =3D zipfile.ZipFile(io.BytesIO(artefact))
+z.extract("lockfile.yml")
+print("Fetched lockfile.yml")
--=20
2.34.1


