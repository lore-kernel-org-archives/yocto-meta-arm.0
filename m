Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C9BC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:09:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3228.1717524591412803382
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 11:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46146DA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:10:15 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A83E83F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:09:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm/trusted-firmware-a: add support for 2.11.0
Date: Tue,  4 Jun 2024 14:09:44 -0400
Message-Id: <20240604180949.15501-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5785

Add support for tf-a version v2.11.0 and mbedtls 3.6.0.  Modifications
to the license checksum were necessary due to the addition to that file
for DICE (which is Apache 2.0 licensed) for TF-A and the dual license of
mbedtls (Apache 2.0 and addition of GPLv2).

NOTE: FVP base is having (more of) an issue with CI on the newest TF-A,
with SSH tests timing out.  Holding that back to the LTS version until
it cane be resolved.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |  3 +-
 .../fiptool-native_2.11.0.bb                  | 33 +++++++++++
 .../trusted-firmware-a/tf-a-tests_2.11.0.bb   | 58 +++++++++++++++++++
 .../trusted-firmware-a_2.11.0.bb              | 19 ++++++
 4 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/fiptool-nativ=
e_2.11.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.=
11.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.11.0.bb

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 17fb5023ccc5..24d03e7124af 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -9,6 +9,7 @@ require conf/machine/include/arm/arch-armv8-4a.inc
 ARM_SYSTEMREADY_FIRMWARE =3D "trusted-firmware-a:do_deploy"
 ARM_SYSTEMREADY_ACS_CONSOLE =3D "default"
 EXTRA_IMAGEDEPENDS =3D "${ARM_SYSTEMREADY_FIRMWARE}"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
=20
 MACHINE_FEATURES =3D "efi"
=20
@@ -62,4 +63,4 @@ FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
 FVP_TERMINALS[bp.terminal_2] ?=3D ""
 FVP_TERMINALS[bp.terminal_3] ?=3D ""
-FVP_CONFIG[bp.secure_memory] ?=3D "1"
\ No newline at end of file
+FVP_CONFIG[bp.secure_memory] ?=3D "1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0.bb
new file mode 100644
index 000000000000..47e783a892c8
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0.bb
@@ -0,0 +1,33 @@
+# Firmware Image Package (FIP)
+# It is a packaging format used by TF-A to package the
+# firmware images in a single binary.
+
+DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
+LICENSE =3D "BSD-3-Clause"
+
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db5fbfdeb6855162dded3=
1fadcd5d4dc5"
+
+# Use fiptool from TF-A v2.11.0
+SRCREV =3D "f2735ebccf5173f74c0458736ec526276106097e"
+SRCBRANCH =3D "master"
+
+DEPENDS +=3D "openssl-native"
+
+inherit native
+
+EXTRA_OEMAKE =3D "V=3D1 HOSTCC=3D'${BUILD_CC}' OPENSSL_DIR=3D${STAGING_D=
IR_NATIVE}/${prefix_native}"
+
+do_compile () {
+    # This is still needed to have the native fiptool executing properly=
 by
+    # setting the RPATH
+    sed -i '/^LDOPTS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
+    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
+
+    oe_runmake fiptool
+}
+
+do_install () {
+    install -D -p -m 0755 tools/fiptool/fiptool ${D}${bindir}/fiptool
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb
new file mode 100644
index 000000000000..02f03f3b00cf
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb
@@ -0,0 +1,58 @@
+DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
+LICENSE =3D "BSD-3-Clause & NCSA"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a=
32aa0ee7d1b4a"
+
+inherit deploy
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
+          "
+SRCBRANCH =3D "master"
+SRCREV =3D "fd053b75cde9c2aa1a5b979a2b544890510d4f52"
+
+DEPENDS +=3D "optee-os"
+
+EXTRA_OEMAKE +=3D "USE_NVM=3D0"
+EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
+EXTRA_OEMAKE +=3D "DEBUG=3D1"
+
+# Modify mode based on debug or release mode
+TFTF_MODE ?=3D "debug"
+
+# Platform must be set for each machine
+TFA_PLATFORM ?=3D "invalid"
+
+EXTRA_OEMAKE +=3D "ARCH=3Daarch64"
+EXTRA_OEMAKE +=3D "LOG_LEVEL=3D50"
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+# Add platform parameter
+EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}"
+
+# Requires CROSS_COMPILE set by hand as there is no configure script
+export CROSS_COMPILE=3D"${TARGET_PREFIX}"
+
+LDFLAGS[unexport] =3D "1"
+do_compile() {
+    oe_runmake -C ${S} tftf
+}
+
+do_compile[cleandirs] =3D "${B}"
+
+FILES:${PN} =3D "/firmware/tftf.bin"
+SYSROOT_DIRS +=3D "/firmware"
+
+do_install() {
+    install -d -m 755 ${D}/firmware
+    install -m 0644 ${B}/${TFA_PLATFORM}/${TFTF_MODE}/tftf.bin ${D}/firm=
ware/tftf.bin
+}
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.11.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
1.0.bb
new file mode 100644
index 000000000000..27cdfc0953f3
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.b=
b
@@ -0,0 +1,19 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.11.0
+SRCREV_tfa =3D "f2735ebccf5173f74c0458736ec526276106097e"
+SRCBRANCH =3D "master"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db5fbfdeb6855162dded=
31fadcd5d4dc5"
+
+# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
+# mbedtls-3.6.0
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
+SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
+
+# continue to boot also without TPM
+SRC_URI +=3D "\
+    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.pat=
ch \
+"
--=20
2.39.3 (Apple Git-146)


