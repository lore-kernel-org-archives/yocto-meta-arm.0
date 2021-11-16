Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B237C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 14:56:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.130.1637074603031534415
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 06:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 553886D
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 06:56:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0063F3F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 06:56:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] gem5/gem5: specify precise BSD license flavour
Date: Tue, 16 Nov 2021 14:56:38 +0000
Message-Id: <20211116145639.3483446-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 14:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2410

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc | 2 +-
 meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb            | 2 +-
 meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb    | 2 +-
 meta-gem5/recipes-devtools/gem5/gem5-native.inc             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc =
b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
index 7e753b2c..c4fd3a1d 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
@@ -1,7 +1,7 @@
 # Build instructions for gem5 custom bootloader
=20
 SUMMARY =3D "Gem5 AARCH64 boot loader"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 inherit deploy
=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb b/meta-gem5=
/recipes-devtools/gem5/gem5-m5ops_20.bb
index 7b483445..8ff4826e 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
@@ -3,7 +3,7 @@ inherit scons package
=20
 HOMEPAGE =3D "https://www.gem5.org/documentation/general_docs/m5ops"
 SUMMARY =3D "m5ops provide pseudo-instructions to trigger gem5 functiona=
lity"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 M5OPS_DIR =3D "util/m5"
=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb b/m=
eta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
index 07faddbb..b91dbbc7 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
@@ -2,7 +2,7 @@ require gem5-source_20.inc
=20
 SUMMARY =3D "m5term allows users to connect to gem5's simulated console"
 HOMEPAGE =3D "https://www.gem5.org/documentation/general_docs/fullsystem=
/m5term"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 inherit native
=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/=
recipes-devtools/gem5/gem5-native.inc
index 74b35c98..9c07aad4 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -2,7 +2,7 @@
=20
 SUMMARY =3D "A modular platform for computer-system architecture researc=
h"
 HOMEPAGE =3D "http://gem5.org"
-LICENSE =3D "BSD & MIT & LGPLv2.1"
+LICENSE =3D "BSD-3-Clause & MIT & LGPLv2.1"
=20
 # Gem5 build and run parameter
=20
--=20
2.25.1


