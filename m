Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6072.1606307505514579930
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD2631B
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 893AC3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:44 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm/scp-firmware: Add SCP v2.7.0
Date: Wed, 25 Nov 2020 12:31:26 +0000
Message-Id: <20201125123127.3226384-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125123127.3226384-1-ross.burton@arm.com>
References: <20201125123127.3226384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jon Mason <jon.mason@arm.com>

Add the latest version of SCP.  Not adding an inc file between them,
since the older one should be removed ASAP.

Change-Id: I0a1e58ffdb6d0d405b199e498587fe410076fc08
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../scp-firmware/scp-firmware_2.7.0.bb        | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.=
bb

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb b/me=
ta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb
new file mode 100644
index 0000000..13092f1
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb
@@ -0,0 +1,74 @@
+SUMMARY =3D "SCP and MCP Firmware"
+DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
+HOMEPAGE =3D "https://github.com/ARM-software/SCP-firmware"
+
+LICENSE =3D "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
+                    file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
+
+SRC_URI =3D "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=3D=
https"
+SRCREV  =3D "2c4f3af270024b85e1b38fd963050c58f6e9b865"
+
+PROVIDES +=3D "virtual/control-processor-firmware"
+
+SCP_BUILD_RELEASE   ?=3D "1"
+SCP_PLATFORM        ?=3D "invalid"
+SCP_COMPILER        ?=3D "arm-none-eabi"
+SCP_LOG_LEVEL       ?=3D "WARN"
+
+DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
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
+        done
+     done
+}
+
+FILES_${PN} =3D "/firmware"
+SYSROOT_DIRS +=3D "/firmware"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP_${PN} =3D "textrel"
+
+do_deploy() {
+    # Copy the images to deploy directory
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
--=20
2.25.1

