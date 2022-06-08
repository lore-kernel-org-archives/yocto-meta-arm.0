Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8903DCCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 09:17:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4467.1654679830312677474
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 02:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 058191424;
	Wed,  8 Jun 2022 02:17:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5009B3F66F;
	Wed,  8 Jun 2022 02:17:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm/trusted-firmware-m: remove compiler options
Date: Wed,  8 Jun 2022 10:17:04 +0100
Message-Id: <20220608091706.109771-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 09:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3483

The recipe supports the use of both Arm's binary GCC (aka GNU Arm
Embedded Compiler, or gnu-rm) and binary Clang (aka Arm Compiler).
However, armcompiler was never tested and doesn't work: 6.17 does a
network operation on every call to check the license which fails with
the network isolation in do_compile tasks, and 6.18 is behind a
loginwall so we can't automatically fetch it in a recipe.

Simplify the recipe to hardcode the use of gnu-rm, and remove the clang
support.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.6.0.bb       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.=
0.bb
index 3a5e57ea..45334e38 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
@@ -48,6 +48,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEPENDS +=3D "cmake-native \
             ninja-native \
+            gcc-arm-none-eabi-native \
             python3-intelhex-native \
             python3-jinja2-native \
             python3-pyyaml-native \
@@ -68,14 +69,14 @@ python() {
         raise bb.parse.SkipRecipe("TFM_PLATFORM needs to be set")
 }
=20
-PACKAGECONFIG ??=3D "cc-gnuarm"
-# What compiler to use
-PACKAGECONFIG[cc-gnuarm] =3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_GNUA=
RM.cmake,,gcc-arm-none-eabi-native"
-PACKAGECONFIG[cc-armclang] =3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_AR=
MCLANG.cmake,,armcompiler-native"
+PACKAGECONFIG ??=3D ""
 # Whether to integrate the test suite
 PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DON,-DTEST_S=3DOFF"
 PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DON,-DTEST_NS=3DOFF"
=20
+# Currently we only support using the Arm binary GCC
+EXTRA_OECMAKE +=3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_GNUARM.cmake"
+
 # Don't let FetchContent download more sources during do_configure
 EXTRA_OECMAKE +=3D "-DFETCHCONTENT_FULLY_DISCONNECTED=3DON"
=20
--=20
2.25.1


