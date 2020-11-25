Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6110.1606307503873547659
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33E0211D4
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D485A3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:42 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm-bsp/boot-firmware: add firmware recipe for corstone700
Date: Wed, 25 Nov 2020 12:31:23 +0000
Message-Id: <20201125123127.3226384-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125123127.3226384-1-ross.burton@arm.com>
References: <20201125123127.3226384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Previously corstone700 used the scp-firmware recipe to build
boot-firmware, which is based on scp-firmware but doesn't share the
build system.

As the differences are not insignificant, extract a dedicated
boot-firmware recipe.  Also set PV appropriately as boot-firmware now
has dated tags.

Change-Id: I3b60172e145be571aa465afb81473b9d79e9e425
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../conf/machine/include/corstone700.inc      |  3 +-
 .../boot-firmware/boot-firmware_git.bb        | 62 +++++++++++++++++++
 .../scp-firmware/scp-firmware-corstone700.inc | 37 -----------
 .../scp-firmware/scp-firmware_%.bbappend      |  1 -
 4 files changed, 63 insertions(+), 40 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_=
git.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-co=
rstone700.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm=
-bsp/conf/machine/include/corstone700.inc
index 4aab85e..ab3e2a4 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,8 +14,7 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
=20
-PREFERRED_PROVIDER_virtual/control-processor-firmware ?=3D "scp-firmware=
"
-PREFERRED_VERSION_control-processor-firmware ?=3D "2.6.0"
+PREFERRED_PROVIDER_virtual/control-processor-firmware ?=3D "boot-firmwar=
e"
=20
 EXTRA_IMAGEDEPENDS +=3D " \
                       virtual/trusted-firmware-a          \
diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb =
b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
new file mode 100644
index 0000000..cd8ae3d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
@@ -0,0 +1,62 @@
+SUMMARY =3D "Boot Processor firmware for Corstone700"
+DESCRIPTION =3D "Boot Processor firmware"
+
+LICENSE =3D "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0 \
+                    file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
+
+SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmw=
are.git;protocol=3Dhttps"
+# This is two commits on from CORSTONE-700-2020.02.10
+SRCREV =3D "a4dd1b60218b5172a94e6f44c96384b84a77588c"
+PV =3D "2020.02.10+git${SRCPV}"
+
+PROVIDES +=3D "virtual/control-processor-firmware"
+
+DEPENDS =3D "virtual/arm-none-eabi-gcc-native virtual/trusted-firmware-a=
"
+
+inherit deploy
+
+B =3D "${WORKDIR}/build"
+S =3D "${WORKDIR}/git"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE =3D "(corstone700-*)"
+SCP_PLATFORM =3D "corstone-700"
+
+LDFLAGS[unexport] =3D "1"
+
+do_configure[noexec] =3D "1"
+
+EXTRA_OEMAKE =3D "PRODUCT=3D'${SCP_PLATFORM}' \
+                BUILD_PATH=3D${B} \
+                CROSS_COMPILE=3D'arm-none-eabi-' \
+                V=3Dy \
+               "
+
+do_compile() {
+    oe_runmake -C ${S}/tools/spitoc CC=3D${BUILD_CC} all
+    oe_runmake -C ${S}
+}
+do_compile[cleandirs] +=3D "${B}"
+
+do_install() {
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_ramfw/release/=
bin/firmware.bin ${D}/firmware/se_ramfw.bin
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_romfw/release/=
bin/firmware.bin ${D}/firmware/se_romfw.bin
+    ${S}/tools/spitoc/spitoc \
+        --seram ${D}/firmware/se_ramfw.bin \
+        --offset 1  \
+        --fip ${RECIPE_SYSROOT}/firmware/fip.bin-${TFA_PLATFORM} \
+        --offset  33 \
+        --out ${D}/firmware/spitoc.bin
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
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone7=
00.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.i=
nc
deleted file mode 100644
index 16437c5..0000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-# Corstone700 specific SCP configurations and build instructions
-
-SUMMARY =3D "Boot Processor firmware"
-DESCRIPTION =3D "Boot Processor firmware"
-DEPENDS +=3D "virtual/trusted-firmware-a"
-
-LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0 \
-                    file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
-
-COMPATIBLE_MACHINE =3D "(corstone700-*)"
-SCP_PLATFORM =3D "corstone-700"
-
-# boot-firmware project is a fork of scp-firmware
-SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmw=
are.git;protocol=3Dhttps;branch=3Dmaster"
-SRCREV =3D "a4dd1b60218b5172a94e6f44c96384b84a77588c"
-PV =3D "0.1.0~git${SRCPV}"
-
-B =3D "${WORKDIR}/build"
-
-EXTRA_OEMAKE =3D "PRODUCT=3D'${SCP_PLATFORM}' \
-                BUILD_PATH=3D${B} \
-                CROSS_COMPILE=3D'arm-none-eabi-' \
-               "
-do_compile_append() {
-   oe_runmake -C ${S}/tools/spitoc CC=3D${BUILD_CC} clean all
-}
-
-do_install() {
-    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_ramfw/release/=
bin/firmware.bin ${D}/firmware/se_ramfw.bin
-    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_romfw/release/=
bin/firmware.bin ${D}/firmware/se_romfw.bin
-    ${S}/tools/spitoc/spitoc \
-    --seram ${D}/firmware/se_ramfw.bin \
-    --offset 1  \
-    --fip ${RECIPE_SYSROOT}/firmware/fip.bin-${TFA_PLATFORM} \
-    --offset  33 \
-    --out ${D}/firmware/spitoc.bin
-}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 8a68704..b760ba7 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -6,6 +6,5 @@ MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
 MACHINE_SCP_REQUIRE_juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
-MACHINE_SCP_REQUIRE_corstone700 =3D "scp-firmware-corstone700.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
--=20
2.25.1

