Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12493C41513
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 17:33:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.314.1715103197465864560
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 May 2024 10:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC4DDA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:42 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 76A6C3F587
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:16 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm-bsp: remove unused recipes
Date: Tue,  7 May 2024 13:33:10 -0400
Message-Id: <20240507173313.50788-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240507173313.50788-1-jon.mason@arm.com>
References: <20240507173313.50788-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 17:33:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5700

No references can be found for these recipes in meta-arm-bsp, so
removing them.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../fiptool-native_2.8.6.bb                   | 33 -----------
 .../trusted-firmware-a/tf-a-tests_2.8.0.bb    | 57 -------------------
 .../recipes-bsp/uefi/edk2-firmware_202311.bb  |  7 ---
 .../optee/optee-examples_3.18.0.bb            |  3 -
 .../optee/optee-examples_3.20.0.bb            |  3 -
 .../optee/optee-examples_4.0.0.bb             |  3 -
 6 files changed, 106 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-n=
ative_2.8.6.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-test=
s_2.8.0.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202311.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-examples_3.=
18.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-examples_3.=
20.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-examples_4.=
0.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2=
.8.6.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.=
6.bb
deleted file mode 100644
index 02f338739669..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.6.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# Firmware Image Package (FIP)
-# It is a packaging format used by TF-A to package the
-# firmware images in a single binary.
-
-DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
-LICENSE =3D "BSD-3-Clause"
-
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
-
-# Use fiptool from TF-A v2.8.6
-SRCREV =3D "ff0bd5f9bb2ba2f31fb9cec96df917747af9e92d"
-SRCBRANCH =3D "lts-v2.8"
-
-DEPENDS +=3D "openssl-native"
-
-inherit native
-
-EXTRA_OEMAKE =3D "V=3D1 HOSTCC=3D'${BUILD_CC}' OPENSSL_DIR=3D${STAGING_D=
IR_NATIVE}/${prefix_native}"
-
-do_compile () {
-    # This is still needed to have the native fiptool executing properly=
 by
-    # setting the RPATH
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
-    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
-
-    oe_runmake fiptool
-}
-
-do_install () {
-    install -D -p -m 0755 tools/fiptool/fiptool ${D}${bindir}/fiptool
-}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0=
.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
deleted file mode 100644
index 160ada673221..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
-LICENSE =3D "BSD-3-Clause & NCSA"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a=
32aa0ee7d1b4a"
-
-inherit deploy
-
-COMPATIBLE_MACHINE ?=3D "invalid"
-
-SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
-          file://tf-a-tests-no-warn-rwx-segments.patch"
-SRCBRANCH =3D "lts-v2.8"
-SRCREV =3D "85442d2943440718c2c2c9c5c690202b4b4f5725"
-
-DEPENDS +=3D "optee-os"
-
-EXTRA_OEMAKE +=3D "USE_NVM=3D0"
-EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
-EXTRA_OEMAKE +=3D "DEBUG=3D1"
-
-# Modify mode based on debug or release mode
-TFTF_MODE ?=3D "debug"
-
-# Platform must be set for each machine
-TFA_PLATFORM ?=3D "invalid"
-
-EXTRA_OEMAKE +=3D "ARCH=3Daarch64"
-EXTRA_OEMAKE +=3D "LOG_LEVEL=3D50"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-# Add platform parameter
-EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}"
-
-# Requires CROSS_COMPILE set by hand as there is no configure script
-export CROSS_COMPILE=3D"${TARGET_PREFIX}"
-
-do_compile() {
-    oe_runmake -C ${S} tftf
-}
-
-do_compile[cleandirs] =3D "${B}"
-
-FILES:${PN} =3D "/firmware/tftf.bin"
-SYSROOT_DIRS +=3D "/firmware"
-
-do_install() {
-    install -d -m 755 ${D}/firmware
-    install -m 0644 ${B}/${TFA_PLATFORM}/${TFTF_MODE}/tftf.bin ${D}/firm=
ware/tftf.bin
-}
-
-do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202311.bb b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware_202311.bb
deleted file mode 100644
index aa11cfd1c680..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202311.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SRCREV_edk2           ?=3D "8736b8fdca85e02933cdb0a13309de14c9799ece"
-SRCREV_edk2-platforms ?=3D "d61836283a4c9198a02387fe7b31a8242e732f3f"
-
-# FIXME - clang is having issues with antlr
-TOOLCHAIN:aarch64 =3D "gcc"
-
-require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm-bsp/recipes-security/optee/optee-examples_3.18.0.bb=
 b/meta-arm-bsp/recipes-security/optee/optee-examples_3.18.0.bb
deleted file mode 100644
index 7796430c9ac2..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-examples_3.18.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-SRCREV =3D "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-examples_3.20.0.bb=
 b/meta-arm-bsp/recipes-security/optee/optee-examples_3.20.0.bb
deleted file mode 100644
index 4a63f951f181..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-examples_3.20.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-SRCREV =3D "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-examples_4.0.0.bb =
b/meta-arm-bsp/recipes-security/optee/optee-examples_4.0.0.bb
deleted file mode 100644
index f082a25d05c7..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-examples_4.0.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
--=20
2.39.3 (Apple Git-146)


