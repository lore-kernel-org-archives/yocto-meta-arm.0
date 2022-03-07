Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0D5C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:44:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25649.1646657063131903621
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 04:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A37121FB
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Mar 2022 04:44:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D8553F766
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Mar 2022 04:44:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: fix python3-dtc installation"
Date: Mon,  7 Mar 2022 12:44:20 +0000
Message-Id: <20220307124420.1928893-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 12:44:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3119

This is now fixed in meta-virtualization master.

This reverts commit fd34e9bb75fccd6abc1dcbda0691a9951484e59a.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 0001-python3-dtc-fix-wheel-build.patch | 40 +++-----------------------
 1 file changed, 4 insertions(+), 36 deletions(-)

diff --git a/0001-python3-dtc-fix-wheel-build.patch b/0001-python3-dtc-fi=
x-wheel-build.patch
index 92032190..ca45c91f 100644
--- a/0001-python3-dtc-fix-wheel-build.patch
+++ b/0001-python3-dtc-fix-wheel-build.patch
@@ -1,7 +1,7 @@
 From ef0d9470c853ee8bbef33db4708d3657646ad8f8 Mon Sep 17 00:00:00 2001
 From: Tim Orling <ticotimo@gmail.com>
 Date: Sun, 27 Feb 2022 15:28:17 -0800
-Subject: [PATCH 1/2] python3-dtc: fix wheel build
+Subject: [PATCH] python3-dtc: fix wheel build
=20
 The wheel that is built is ${S}/dist/libfdt-1.6.2.dev39+g4048aed.d202201=
03-cp310-cp310-linux_x86_64.whl
 Set PYPA_WHEEL to match this.
@@ -18,44 +18,12 @@ index 449d071..671d280 100644
 @@ -19,6 +19,8 @@ SRCREV =3D "4048aed12b81c5a0154b9af438edc99ec7d2b6a1"
  PV =3D "1.6.1+git${SRCPV}"
  S =3D "${WORKDIR}/git"
-
+=20
 +PYPA_WHEEL =3D "${S}/dist/libfdt-1.6.2*.whl"
 +
  inherit setuptools3 pkgconfig
-
+=20
  BBCLASSEXTEND =3D "native nativesdk"
---
+--=20
 2.25.1
=20
-
-From 07ea5e0d41350f2bbee3c0a1498f5e42dec66e35 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 1 Mar 2022 11:50:37 +0000
-Subject: [PATCH 2/2] python3-dtc: fix missing files in sysroot
-
-There is a bug in SWIG/setuptools where 'pip install' doesn't build
-libfdt.py unless the build tree is already dirty, which makes using
-the library impossible.
-
-Bump the SRCREV to incorporate the upstream workaround for this issue.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- recipes-kernel/dtc/python3-dtc_1.6.1.bb | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dt=
c/python3-dtc_1.6.1.bb
-index 671d280..a868bd0 100644
---- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
-+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
-@@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)=
"
-
- LIC_FILES_CHKSUM =3D "file://pylibfdt/libfdt.i;beginline=3D1;endline=3D=
6;md5=3Dafda088c974174a29108c8d80b5dce90"
-
--SRCREV =3D "4048aed12b81c5a0154b9af438edc99ec7d2b6a1"
-+SRCREV =3D "c001fc01a43e7a06447c06ea3d50bd60641322b8"
-
- PV =3D "1.6.1+git${SRCPV}"
- S =3D "${WORKDIR}/git"
---
-2.25.1
--=20
2.25.1


