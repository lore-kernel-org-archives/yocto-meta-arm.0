Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576B9CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:59:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18806.1781787560816973533
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=a95N1k3l;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EAE12936
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:15 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF82E3F915
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781787560; bh=8kBwbuL+Y7/crI7Hs67bEtK82cUp9X+4IuBVZ0+DOb4=;
	h=From:To:Subject:Date:From;
	b=a95N1k3lv9EhL47FbhEamElQtOnc4GAfKKC/Ro2qalPovF5vHjzo5p20K8WZL8ahJ
	 Hva+pv3TB6vSgsSJkAKEaBaoisJwe/ClTC5QOvEakMQolISC1HpE7KibSMa73TaRFb
	 BCLkJPt2cQ5ufGW7nIDf0fwswwxVU+Ma8851XyFs=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm/trusted-firmware-a: Add support for v2.15.0
Date: Thu, 18 Jun 2026 08:59:12 -0400
Message-ID: <20260618125918.62619-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7085

Add support for the newest release of TF-A.
mbedtls was made a git submodule.  Given that this is no longer needed
for the generic inc file, I've moved the relevant parts to the LTS
recipe and others using the older way of building.

Also, seeing some weird behavior with CPUs not coming on line in
sbsa-ref and qemuarm-secureboot.  So, pinning those back to the LTS
until they can be sorted out.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sbsa-ref.conf       |  2 +
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 .../trusted-firmware-a-fvp-base.inc           |  3 -
 .../trusted-firmware-a-juno.inc               |  1 -
 .../trusted-firmware-a-rdn2.inc               | 26 +++++++++
 .../trusted-firmware-a-rdv2.inc               | 26 +++++++++
 meta-arm/conf/machine/qemuarm-secureboot.conf |  2 +
 .../trusted-firmware-a/cot-dt2c_0.1.0.bb      |  6 +-
 .../fiptool-native_2.15.0.bb                  | 33 +++++++++++
 .../trusted-firmware-a/tf-a-tests_2.15.0.bb   | 56 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc | 19 -------
 .../trusted-firmware-a_2.10.30.bb             |  2 +
 .../trusted-firmware-a_2.12.10.bb             |  2 +
 .../trusted-firmware-a_2.14.1.bb              | 20 +++++++
 .../trusted-firmware-a_2.15.0.bb              |  8 +++
 15 files changed, 181 insertions(+), 26 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/fiptool-nativ=
e_2.15.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.=
15.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.15.0.bb

diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/=
machine/sbsa-ref.conf
index 1f86cdb6e0e7..82d55c9b3d7a 100644
--- a/meta-arm-bsp/conf/machine/sbsa-ref.conf
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -26,6 +26,8 @@ EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURE=
S", "systemd", "systemd-boo
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
=20
 EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
+#FIXME - in 2.15.0, new logic for pen hold the SMP cores was added, whic=
h breaks this platform.  Hold this back until it can be resolved.
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.14.%"
=20
 QB_SYSTEM_NAME =3D "qemu-system-aarch64"
 QB_MACHINE =3D "-machine sbsa-ref"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 4979f29477f3..86522d1b88ef 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -11,6 +11,7 @@ SRC_URI:append =3D " \
=20
 TFA_DEBUG =3D "1"
 TFA_UBOOT ?=3D "1"
+#FIXME - this can be removed after moving to 2.15.0
 TFA_MBEDTLS =3D "1"
 TFA_BUILD_TARGET =3D "bl2 bl31 fip"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index c87cbb726ec8..8b06eace2012 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -55,9 +55,6 @@ TFA_PLATFORM =3D "fvp"
 # Disable debug build if measured boot is enabled.
 TFA_DEBUG :=3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation=
', '0',\
               d.getVar('TFA_DEBUG'), d)}"
-# Add mbedtls if measured boot is enabled
-TFA_MBEDTLS :=3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestati=
on',\
-               '1', d.getVar('TFA_MBEDTLS'), d)}"
 TFA_UBOOT ?=3D "1"
 TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-juno.inc
index a3a35ab4e501..c69e2ec3662e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno=
.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno=
.inc
@@ -3,7 +3,6 @@
 COMPATIBLE_MACHINE =3D "juno"
 TFA_PLATFORM =3D "juno"
 TFA_DEBUG =3D "1"
-TFA_MBEDTLS =3D "1"
 TFA_UBOOT ?=3D "1"
 TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-rdn2.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-rdn2.inc
index 0c09818c9024..d761a7ae639d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
@@ -27,3 +27,29 @@ SRCREV_tfa =3D "a4b376b128bb5b91771002f7808566f53c8d9f=
3a"
 SRC_URI:remove =3D "file://0001-feat-build-add-HOSTLDFLAGS-to-pass-flags=
-to-host-lin.patch"
 LIC_FILES_CHKSUM:remove =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc=
63021c6eba7b524039e"
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118e32884721c0be33=
267bd7ae11130"
+
+# sub-directory in which mbedtls will be downloaded
+# Only needed for legacy versions, as v2.15.0 added this as a git submod=
ule
+TFA_MBEDTLS_DIR ?=3D "mbedtls"
+# This should be set to MBEDTLS download URL if MBEDTLS is needed
+SRC_URI_MBEDTLS ??=3D ""
+# This should be set to MBEDTLS LIC FILES checksum
+LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
+# add MBEDTLS to our sources if activated
+SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
+# Update license variables
+LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
+LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
+# add mbed TLS to version
+SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
+
+# Handle MBEDTLS
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=
=3D${TFA_MBEDTLS_DIR}', '', d)}"
+
+# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
+# mbedtls-3.6.5
+SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
+SRC_URI_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;=
protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=
=3D${SRCBRANCH_MBEDTLS}"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-rdv2.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-rdv2.inc
index 796011576e1d..8010c523e144 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
@@ -27,3 +27,29 @@ SRCREV_tfa =3D "a4b376b128bb5b91771002f7808566f53c8d9f=
3a"
 SRC_URI:remove =3D "file://0001-feat-build-add-HOSTLDFLAGS-to-pass-flags=
-to-host-lin.patch"
 LIC_FILES_CHKSUM:remove =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc=
63021c6eba7b524039e"
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118e32884721c0be33=
267bd7ae11130"
+
+# sub-directory in which mbedtls will be downloaded
+# Only needed for legacy versions, as v2.15.0 added this as a git submod=
ule
+TFA_MBEDTLS_DIR ?=3D "mbedtls"
+# This should be set to MBEDTLS download URL if MBEDTLS is needed
+SRC_URI_MBEDTLS ??=3D ""
+# This should be set to MBEDTLS LIC FILES checksum
+LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
+# add MBEDTLS to our sources if activated
+SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
+# Update license variables
+LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
+LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
+# add mbed TLS to version
+SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
+
+# Handle MBEDTLS
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=
=3D${TFA_MBEDTLS_DIR}', '', d)}"
+
+# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
+# mbedtls-3.6.5
+SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
+SRC_URI_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;=
protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=
=3D${SRCBRANCH_MBEDTLS}"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/con=
f/machine/qemuarm-secureboot.conf
index f08b84fe5e76..2787472bfdbf 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -18,6 +18,8 @@ IMAGE_FSTYPES +=3D "wic wic.qcow2"
=20
 WKS_FILE ?=3D "qemuarm.wks"
 WKS_FILE_DEPENDS =3D "trusted-firmware-a"
+#FIXME - in 2.15.0, new logic for pen hold the SMP cores was added, whic=
h breaks this platform.  Hold this back until it can be resolved.
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.14.%"
 IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
=20
 MACHINE_FEATURES +=3D "optee-ftpm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
index 2cffb46c417d..a4e72b0052f7 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -6,9 +6,9 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirm=
ware.org/TF-A/trusted-fir
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};branch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
-# Use cot-dt2c from TF-A v2.14.1
-SRCREV =3D "e82c7ced9e76aea35b176e608d67dfe5ebe1c569"
-SRCBRANCH =3D "lts-v2.14"
+# Use cot-dt2c from TF-A v2.15.0
+SRCREV =3D "da738d5eae93af342fdc4995dd3c05acb4c9d757"
+SRCBRANCH =3D "master"
=20
 inherit python_poetry_core
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.15.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.15.0.bb
new file mode 100644
index 000000000000..11e54fbf06e6
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.15.0.bb
@@ -0,0 +1,33 @@
+# Firmware Image Package (FIP)
+# It is a packaging format used by TF-A to package the
+# firmware images in a single binary.
+
+DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
+LICENSE =3D "BSD-3-Clause"
+
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
+
+# Use fiptool from TF-A v2.15.0
+SRCREV =3D "da738d5eae93af342fdc4995dd3c05acb4c9d757"
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
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
new file mode 100644
index 000000000000..8bd5dd564334
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
@@ -0,0 +1,56 @@
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
+SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://review.trustedfirmware.org/=
TF-A/tf-a-tests;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
+SRCBRANCH =3D "master"
+SRCREV =3D "bd08278493028d3c33936f61f406169a7f0deb9f"
+
+SRC_URI +=3D "file://0001-Fix-GCC-errors-in-test_psci_stat.c.patch"
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
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 62204042cbab..c8717c3f6e28 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -43,22 +43,6 @@ TFA_LTO ?=3D ""
=20
 B =3D "${WORKDIR}/build"
=20
-# mbed TLS support (set TFA_MBEDTLS to 1 to activate)
-TFA_MBEDTLS ?=3D "0"
-# sub-directory in which mbedtls will be downloaded
-TFA_MBEDTLS_DIR ?=3D "mbedtls"
-# This should be set to MBEDTLS download URL if MBEDTLS is needed
-SRC_URI_MBEDTLS ??=3D ""
-# This should be set to MBEDTLS LIC FILES checksum
-LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
-# add MBEDTLS to our sources if activated
-SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
-# Update license variables
-LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
-LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
-# add mbed TLS to version
-SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
-
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin fil=
e
 TFA_UBOOT ??=3D "0"
@@ -131,9 +115,6 @@ EXTRA_OEMAKE +=3D "${@'SPMD_SPM_AT_SEL2=3D${TFA_SPMD_=
SPM_AT_SEL2}' if d.getVar('TFA_
 # Handle TFA_DEBUG parameter
 EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_DEBUG', '1', 'DEBUG=3D${TFA=
_DEBUG}', '', d)}"
=20
-# Handle MBEDTLS
-EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=
=3D${TFA_MBEDTLS_DIR}', '', d)}"
-
 # Uboot support
 DEPENDS +=3D " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] +=3D " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boo=
t:do_deploy', '', d)}"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.30.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.30.bb
index fd19ac911089..72dd4b09cc7c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.30.=
bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.30.=
bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2=
c740efedc159745b9b31f88ff03dd
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
 SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
+# The default value changed in v2.15.0 and later.  Given this is a legac=
y version, change it here to keep future versions simplier
+TFA_MBEDTLS_DIR =3D "mbedtls"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.10.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
12.10.bb
index 20fc5a7d70bc..737a90a70e15 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.10.=
bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.10.=
bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83=
b7626b8c7a37263c6a58af8d19bee
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
 SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
+# The default value changed in v2.15.0 and later.  Given this is a legac=
y version, change it here to keep future versions simplier
+TFA_MBEDTLS_DIR =3D "mbedtls"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.1.bb
index 2f69d054a3f8..de29941b2c8d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.1.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.1.b=
b
@@ -7,6 +7,26 @@ SRCBRANCH =3D "lts-v2.14"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
=20
+# mbed TLS support (set TFA_MBEDTLS to 1 to activate)
+TFA_MBEDTLS ?=3D "0"
+# sub-directory in which mbedtls will be downloaded
+# Only needed for legacy versions, as v2.15.0 added this as a git submod=
ule
+TFA_MBEDTLS_DIR ?=3D "mbedtls"
+# This should be set to MBEDTLS download URL if MBEDTLS is needed
+SRC_URI_MBEDTLS ??=3D ""
+# This should be set to MBEDTLS LIC FILES checksum
+LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
+# add MBEDTLS to our sources if activated
+SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
+# Update license variables
+LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
+LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
+# add mbed TLS to version
+SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
+
+# Handle MBEDTLS
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=
=3D${TFA_MBEDTLS_DIR}', '', d)}"
+
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.5
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.15.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
5.0.bb
new file mode 100644
index 000000000000..f780ab59bf5c
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.15.0.b=
b
@@ -0,0 +1,8 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.15.0
+SRC_URI_TRUSTED_FIRMWARE_A =3D "gitsm://review.trustedfirmware.org/TF-A/=
trusted-firmware-a;protocol=3Dhttps"
+SRCREV =3D "da738d5eae93af342fdc4995dd3c05acb4c9d757"
+SRCBRANCH =3D "master"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
--=20
2.50.1 (Apple Git-155)


