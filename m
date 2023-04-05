Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63E1C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 14:24:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.131353.1680704639555086385
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 07:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99F251684;
	Wed,  5 Apr 2023 07:24:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E64D3F762;
	Wed,  5 Apr 2023 07:23:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm/scp-firmware: remove 2.10 recipe
Date: Wed,  5 Apr 2023 15:23:55 +0100
Message-Id: <20230405142355.1703355-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405142355.1703355-1-ross.burton@arm.com>
References: <20230405142355.1703355-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 14:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4543

Our machines have moved to 2.11 so we can remove the 2.10 recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../scp-firmware/scp-firmware_2.10.0.bb       | 111 ------------------
 1 file changed, 111 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0=
.bb

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
deleted file mode 100644
index b9d0953a..00000000
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ /dev/null
@@ -1,111 +0,0 @@
-SUMMARY =3D "SCP and MCP Firmware"
-DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
-HOMEPAGE =3D "https://github.com/ARM-software/SCP-firmware"
-
-LICENSE =3D "BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
-                    file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
-
-SRC_URI_SCP_FIRMWARE ?=3D "gitsm://github.com/ARM-software/SCP-firmware.=
git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH}"
-SRCBRANCH =3D "master"
-
-SRCREV  =3D "673d014f3861ad81cc5ab06d2884a314a610799b"
-
-PROVIDES +=3D "virtual/control-processor-firmware"
-
-CMAKE_BUILD_TYPE    ?=3D "RelWithDebInfo"
-SCP_PLATFORM        ?=3D "invalid"
-SCP_COMPILER        ?=3D "arm-none-eabi"
-SCP_LOG_LEVEL       ?=3D "WARN"
-SCP_PLATFORM_FEATURE_SET ?=3D "0"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-DEPENDS =3D "virtual/arm-none-eabi-gcc-native \
-           cmake-native \
-           ninja-native \
-          "
-
-# For now we only build with GCC, so stop meta-clang trying to get invol=
ved
-TOOLCHAIN =3D "gcc"
-
-inherit deploy
-
-B =3D "${WORKDIR}/build"
-S =3D "${WORKDIR}/git"
-
-# Allow platform specific copying of only scp or both scp & mcp, default=
 to both
-FW_TARGETS ?=3D "scp mcp"
-FW_INSTALL ?=3D "ramfw romfw"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE ?=3D "invalid"
-
-export CFLAGS =3D "${DEBUG_PREFIX_MAP}"
-export ASMFLAGS =3D "${DEBUG_PREFIX_MAP}"
-
-LDFLAGS[unexport] =3D "1"
-
-EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${CMAKE_BUILD_TYPE} \
-                 -D SCP_LOG_LEVEL=3D${SCP_LOG_LEVEL} \
-                 -D SCP_PLATFORM_FEATURE_SET=3D${SCP_PLATFORM_FEATURE_SE=
T} \
-                 -D DISABLE_CPPCHECK=3D1 \
-                "
-
-do_configure() {
-    for FW in ${FW_TARGETS}; do
-        for TYPE in ${FW_INSTALL}; do
-            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR=3D"${SCP_PLATFORM}/${FW}_${TYPE}"
-        done
-    done
-}
-
-do_configure[cleandirs] +=3D "${B}"
-
-do_compile() {
-    for FW in ${FW_TARGETS}; do
-        for TYPE in ${FW_INSTALL}; do
-            VERBOSE=3D1 cmake --build ${B}/${TYPE}/${FW} --target all
-        done
-    done
-}
-
-do_install() {
-    install -d ${D}/firmware
-    for TYPE in ${FW_INSTALL}; do
-        for FW in ${FW_TARGETS}; do
-           if [ "$TYPE" =3D "romfw" ]; then
-               if [ "$FW" =3D "scp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1" "${D}/firmware/${FW}_${TYPE}.elf"
-               elif [ "$FW" =3D "mcp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl1" "${D}/firmware/${FW}_${TYPE}.elf"
-               fi
-           elif [ "$TYPE" =3D "ramfw" ]; then
-               if [ "$FW" =3D "scp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2" "${D}/firmware/${FW}_${TYPE}.elf"
-               elif [ "$FW" =3D "mcp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-mc=
p-bl2" "${D}/firmware/${FW}_${TYPE}.elf"
-               fi
-           fi
-       done
-    done
-}
-
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
-
-FILES:${PN}-dbg +=3D "/firmware/*.elf"
-# These binaries are specifically for 32-bit arm
-INSANE_SKIP:${PN}-dbg +=3D "arch"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INHIBIT_PACKAGE_STRIP =3D "1"
-
-do_deploy() {
-    # Copy the images to deploy directory
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
--=20
2.34.1


