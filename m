Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3DFCD128A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 12:59:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17257.1712840354671101069
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 05:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A302B113E
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:43 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE0F33F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp: remove unused recipes
Date: Thu, 11 Apr 2024 08:59:12 -0400
Message-Id: <20240411125913.64905-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 12:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5520

These recipes users went away but didn't clean up after themselves.
Doing so now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/tf-a-tests_2.9.0.bb    | 54 -------------------
 .../optee/optee-client_4.0.0.bb               |  7 ---
 .../optee/optee-os-tadevkit_3.20.0.bb         | 24 ---------
 .../optee/optee-os-tadevkit_4.0.0.bb          | 29 ----------
 .../recipes-security/optee/optee-os_4.0.0.bb  | 10 ----
 .../optee/optee-test_4.0.0.bb                 | 11 ----
 6 files changed, 135 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-test=
s_2.9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_4.0.=
0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.20.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_4.0.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.=
bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0=
.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb
deleted file mode 100644
index 72a3e7911ba5..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb
+++ /dev/null
@@ -1,54 +0,0 @@
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
-          "
-SRCBRANCH =3D "master"
-SRCREV =3D "df6783437cdc98dabf4f49568312b86460f72efa"
-
-DEPENDS +=3D "optee-os"
-
-EXTRA_OEMAKE +=3D "USE_NVM=3D0"
-EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
-EXTRA_OEMAKE +=3D "DEBUG=3D1"
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
-    install -m 0644 ${B}/${TFA_PLATFORM}/debug/tftf.bin ${D}/firmware/tf=
tf.bin
-}
-
-do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_4.0.0.bb b/=
meta-arm-bsp/recipes-security/optee/optee-client_4.0.0.bb
deleted file mode 100644
index dc9577c211f0..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_4.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-SRCREV =3D "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
-
-inherit pkgconfig
-DEPENDS +=3D "util-linux"
-EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0=
.bb b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
deleted file mode 100644
index 202caa546e95..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require optee-os_3.20.0.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
-
-do_install() {
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-	echo "Do not inherit do_deploy from optee-os."
-}
-
-FILES:${PN} =3D "${includedir}/optee/"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.=
bb b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.bb
deleted file mode 100644
index 9fe2697e60da..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.0.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require optee-os_4.0.0.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
-
-do_install() {
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-	echo "Do not inherit do_deploy from optee-os."
-}
-
-FILES:${PN} =3D "${includedir}/optee/"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
-
-# Include extra headers needed by SPMC tests to TA DEVKIT.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bb b/meta=
-arm-bsp/recipes-security/optee/optee-os_4.0.0.bb
deleted file mode 100644
index cb326042a571..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
-SRC_URI +=3D " \
-    file://0003-optee-enable-clang-support.patch \
-   "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bb b/me=
ta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bb
deleted file mode 100644
index ecd949f4318c..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-SRCREV =3D "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
-
-# Include ffa_spmc test group if the SPMC test is enabled.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
-
-RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                                              ' arm-ffa-user', '' , d)}"
--=20
2.39.3 (Apple Git-146)


