Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A12DC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.383.1649347747325149764
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C28A1596
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09FE33F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/scp-firmware: add 2.10
Date: Thu,  7 Apr 2022 17:09:03 +0100
Message-Id: <20220407160903.3809656-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407160903.3809656-1-ross.burton@arm.com>
References: <20220407160903.3809656-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3254

Add a new recipe for SCP Firmware 2.10.

As we're late in the release cycle, keep 2.9 in the tree so that BSPs
that can't be tested in time can stay with 2.9 for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../scp-firmware/scp-firmware_2.10.0.bb       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0=
.bb

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
new file mode 100644
index 00000000..f976047a
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -0,0 +1,83 @@
+SUMMARY =3D "SCP and MCP Firmware"
+DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
+HOMEPAGE =3D "https://github.com/ARM-software/SCP-firmware"
+
+LICENSE =3D "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
+                    file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
+
+SRC_URI =3D "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=3D=
https;branch=3Dmaster"
+
+SRCREV  =3D "673d014f3861ad81cc5ab06d2884a314a610799b"
+
+PROVIDES +=3D "virtual/control-processor-firmware"
+
+SCP_BUILD_RELEASE   ?=3D "1"
+SCP_PLATFORM        ?=3D "invalid"
+SCP_COMPILER        ?=3D "arm-none-eabi"
+SCP_LOG_LEVEL       ?=3D "WARN"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D "virtual/arm-none-eabi-gcc-native"
+# For now we only build with GCC, so stop meta-clang trying to get invol=
ved
+TOOLCHAIN =3D "gcc"
+
+SCP_BUILD_STR =3D "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'relea=
se', 'debug', d)}"
+
+inherit deploy
+
+B =3D "${WORKDIR}/build"
+S =3D "${WORKDIR}/git"
+
+# Allow platform specific copying of only scp or both scp & mcp, default=
 to both
+FW_TARGETS ?=3D "scp mcp"
+FW_INSTALL ?=3D "ramfw romfw"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+LDFLAGS[unexport] =3D "1"
+
+# No configure
+do_configure[noexec] =3D "1"
+
+EXTRA_OEMAKE =3D "V=3D1 \
+                BUILD_PATH=3D'${B}' \
+                PRODUCT=3D'${SCP_PLATFORM}' \
+                MODE=3D'${SCP_BUILD_STR}' \
+                LOG_LEVEL=3D'${SCP_LOG_LEVEL}' \
+                CC=3D'${SCP_COMPILER}-gcc' \
+                AR=3D'${SCP_COMPILER}-ar' \
+                SIZE=3D'${SCP_COMPILER}-size' \
+                OBJCOPY=3D'${SCP_COMPILER}-objcopy' \
+                "
+
+do_compile() {
+    oe_runmake -C "${S}"
+}
+do_compile[cleandirs] +=3D "${B}"
+
+do_install() {
+     install -d ${D}/firmware
+     for FW in ${FW_TARGETS}; do
+        for TYPE in ${FW_INSTALL}; do
+           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_=
BUILD_STR}/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
+           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_=
BUILD_STR}/bin/${FW}_${TYPE}.elf" "${D}/firmware/"
+        done
+     done
+}
+
+FILES:${PN} =3D "/firmware"
+SYSROOT_DIRS +=3D "/firmware"
+
+FILES:${PN}-dbg +=3D "/firmware/*.elf"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP:${PN}-dbg =3D "arch textrel"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+INHIBIT_PACKAGE_STRIP =3D "1"
+
+do_deploy() {
+    # Copy the images to deploy directory
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
--=20
2.25.1


