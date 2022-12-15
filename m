Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7338C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:16:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.138302.1671120972641580863
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E18A0169C;
	Thu, 15 Dec 2022 08:16:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5F073F73B;
	Thu, 15 Dec 2022 08:16:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 6/8] arm/trusted-firmware-m: remove compiler options
Date: Thu, 15 Dec 2022 16:16:04 +0000
Message-Id: <20221215161606.1194188-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215161606.1194188-1-ross.burton@arm.com>
References: <20221215161606.1194188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:16:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4190

The recipe supports the use of both Arm's binary GCC (aka GNU Arm
Embedded Compiler, or gnu-rm) and binary Clang (aka Arm Compiler).
However, armcompiler was never tested and doesn't work: 6.17 does a
network operation on every call to check the license which fails with
the network isolation in do_compile tasks, and 6.18 is behind a
loginwall so we can't automatically fetch it in a recipe.

Simplify the recipe to hardcode the use of gnu-rm, and remove the clang
support.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.5.0.bb       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.=
0.bb
index 0e0f8608..5e28f634 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
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
2.34.1


