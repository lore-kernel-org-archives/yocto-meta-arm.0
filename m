Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775A5C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 12:45:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9476.1749818748376568919
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jun 2025 05:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6955214BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jun 2025 05:45:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A5E83F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jun 2025 05:45:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: localize BUILD_CC assignments
Date: Fri, 13 Jun 2025 13:45:42 +0100
Message-ID: <20250613124542.4099863-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jun 2025 12:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6549

BUILD_CC and friends are only needed for the build of BaseTools, so move
the assignments to that specific make call.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 6d86a68f..92f080bf 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -81,17 +81,6 @@ EDK_COMPILER:toolchain-clang =3D "CLANG38"
 export CLANG38_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
 export CLANG38_ARM_PREFIX =3D "${TARGET_PREFIX}"
=20
-# These variables were changed in edk2 commit
-# 206168e83f0901cbc1815ef5df4ac6598ad9721b, which was part of edk2-20230=
5
-export CC =3D "${BUILD_CC}"
-export CXX =3D "${BUILD_CXX}"
-export AS =3D "${BUILD_AS}"
-export AR =3D "${BUILD_AR}"
-export LD =3D "${BUILD_LD}"
-export CFLAGS =3D "${BUILD_CFLAGS}"
-export CPPFLAGS =3D "${BUILD_CPPFLAGS}"
-export LDFLAGS =3D "${BUILD_LFLAGS}"
-
 #FIXME - arm32 doesn't work with clang due to a linker issue
 TOOLCHAIN:arm =3D "gcc"
=20
@@ -108,8 +97,13 @@ do_compile() {
     cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${S}/Conf/tools_def.txt
     cp ${EDK_TOOLS_PATH}/Conf/target.template ${S}/Conf/target.txt
=20
-    # Build basetools
-    oe_runmake -C ${S}/BaseTools
+    # Build basetools for the build host
+    oe_runmake -C ${S}/BaseTools \
+        CC=3D"${BUILD_CC}" \
+        CXX=3D"${BUILD_CXX}" \
+        AS=3D"${BUILD_AS}" \
+        AR=3D"${BUILD_AR}" \
+        LD=3D"${BUILD_LD}"
=20
     PATH=3D"${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
     build \
--=20
2.43.0


