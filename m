Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EA4C61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:25:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17874.1749047112054802555
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 07:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5284F267F
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Jun 2025 07:24:54 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4EA693F5A1
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Jun 2025 07:25:11 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/trusted-firmware-a: add 2.13.0 support
Date: Wed,  4 Jun 2025 10:25:09 -0400
Message-Id: <20250604142509.15895-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250604142509.15895-1-jon.mason@arm.com>
References: <20250604142509.15895-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jun 2025 14:25:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6527

Add recipe for the latest version of TF-A, which needs a newer version
of mbedtls as well.  The license checksum updated due to hob code being
imported from edk2, which is BSD 2 Clause, which is already in the
license field for the recipe.

Updating the git recipe to use the latest version, and keeping LTS
versions.

sgi575 was removed from 2.13.0.  So, pointing that to 2.12

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf         |  3 +
 .../fiptool-native_2.13.0.bb                  | 33 +++++++++++
 .../trusted-firmware-a/tf-a-tests_2.13.0.bb   | 55 +++++++++++++++++++
 .../trusted-firmware-a_2.13.0.bb              | 15 +++++
 .../trusted-firmware-a_git.bb                 | 16 ++----
 5 files changed, 112 insertions(+), 10 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/fiptool-nativ=
e_2.13.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.=
13.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.13.0.bb

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 048e072664b4..7540393009b8 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -9,6 +9,9 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.=
inc
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
+# 2.13.0 removes support for sgi575
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
+
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0.bb
new file mode 100644
index 000000000000..1eae9eebb80f
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0.bb
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
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D1118e32884721c0be332=
67bd7ae11130"
+
+# Use fiptool from  TF-A v2.13.0
+SRCREV =3D "c17351450c8a513ca3f30f936e26a71db693a145"
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
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
new file mode 100644
index 000000000000..14a9043a5914
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
@@ -0,0 +1,55 @@
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
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
+SRCBRANCH =3D "master"
+SRCREV =3D "fa267c12f9aa790b43b38d171273cf63892e8d51"
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
+export CROSS_COMPILE =3D "${TARGET_PREFIX}"
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
.13.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
3.0.bb
new file mode 100644
index 000000000000..40d7e319c860
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
@@ -0,0 +1,15 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.13.0
+SRCREV_tfa =3D "c17351450c8a513ca3f30f936e26a71db693a145"
+SRCBRANCH =3D "master"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118e32884721c0be33=
267bd7ae11130"
+
+# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
+# mbedtls-3.6.3
+SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
+SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 953f8bf3e878..d168457938a8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -1,23 +1,19 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
 # TF-A master
-SRCREV_tfa =3D "0035ab76e580b59f88ad5a6be76b7f2bebbac654"
+SRCREV_tfa =3D "c17351450c8a513ca3f30f936e26a71db693a145"
 SRCBRANCH =3D "master"
=20
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118e32884721c0be33=
267bd7ae11130"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.2
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-3.6"
-SRCREV_mbedtls =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
+# mbedtls-3.6.3
+SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
+SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
-# continue to boot also without TPM
-SRC_URI +=3D "\
-    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.pat=
ch \
-"
-
 # Not a release recipe, try our hardest to not pull this in implicitly
 DEFAULT_PREFERENCE =3D "-1"
 UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.39.5 (Apple Git-154)


