Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86FDC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 16:38:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.30668.1680194300909721050
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 09:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC5E41650;
	Thu, 30 Mar 2023 09:39:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2087D3F6C4;
	Thu, 30 Mar 2023 09:38:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/6] arm/scp-firmware: improve debug packaging
Date: Thu, 30 Mar 2023 17:38:14 +0100
Message-Id: <20230330163815.3677638-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330163815.3677638-1-ross.burton@arm.com>
References: <20230330163815.3677638-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 16:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4516

Instead of a SCP_BUILD_RELEASE boolean, add CMAKE_BUILD_TYPE and default
to RelWithDebInfo which gives us release (optimised) builds with debug
symbols in the matching .elf files.

To ensure that buildpaths don't leak into the debug symbols, pass the
debug prefix maps via CFLAGS and ASMFLAGS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb   | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index a1662d58..b9d0953a 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -14,7 +14,7 @@ SRCREV  =3D "673d014f3861ad81cc5ab06d2884a314a610799b"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
-SCP_BUILD_RELEASE   ?=3D "1"
+CMAKE_BUILD_TYPE    ?=3D "RelWithDebInfo"
 SCP_PLATFORM        ?=3D "invalid"
 SCP_COMPILER        ?=3D "arm-none-eabi"
 SCP_LOG_LEVEL       ?=3D "WARN"
@@ -29,8 +29,6 @@ DEPENDS =3D "virtual/arm-none-eabi-gcc-native \
 # For now we only build with GCC, so stop meta-clang trying to get invol=
ved
 TOOLCHAIN =3D "gcc"
=20
-SCP_BUILD_STR =3D "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'Relea=
se', 'Debug', d)}"
-
 inherit deploy
=20
 B =3D "${WORKDIR}/build"
@@ -39,13 +37,16 @@ S =3D "${WORKDIR}/git"
 # Allow platform specific copying of only scp or both scp & mcp, default=
 to both
 FW_TARGETS ?=3D "scp mcp"
 FW_INSTALL ?=3D "ramfw romfw"
+
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
+export CFLAGS =3D "${DEBUG_PREFIX_MAP}"
+export ASMFLAGS =3D "${DEBUG_PREFIX_MAP}"
+
 LDFLAGS[unexport] =3D "1"
-CFLAGS[unexport] =3D "1"
=20
-EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${SCP_BUILD_STR} \
+EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${CMAKE_BUILD_TYPE} \
                  -D SCP_LOG_LEVEL=3D${SCP_LOG_LEVEL} \
                  -D SCP_PLATFORM_FEATURE_SET=3D${SCP_PLATFORM_FEATURE_SE=
T} \
                  -D DISABLE_CPPCHECK=3D1 \
--=20
2.34.1


