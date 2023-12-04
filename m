Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FA1C07E97
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:53:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.101351.1701788017091234513
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Dec 2023 06:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0F1B1474
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Dec 2023 06:54:22 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C2DC3F6C4
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Dec 2023 06:53:36 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-a: update to 2.10
Date: Mon,  4 Dec 2023 11:19:51 -0600
Message-Id: <20231204171952.13471-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231204171952.13471-1-jon.mason@arm.com>
References: <20231204171952.13471-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Dec 2023 14:53:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5288

Update tf-a and mbedtls to the latest versions.  Also, migrate the
previous version to meta-arm-bsp for corstone1000.

NOTE: in v2.10, the fiptool makefile was changed to reference LDOPTS
instead of LDLIBS.

NOTE: commit 408cde8a59080ac2caa11c4d99474b2ef09f90df in tf-a modifies
the qemu_sbsa starting offset, and per the commit comment, it requires
the edk2 same change.  This is why the edk-platforms SHA has been
changed.  There are only 19 patches between the previous SHA and this
one (most of which are adding a single platform).  So, it shouldn't be
too impactful to bump the SHA (instead of making it a patch to apply
on top of the existing SHA).

NOTE: tf-a-tests added LDFLAGS to the makefile, causing the need for it
to be removed in the recipe.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  1 +
 meta-arm-bsp/conf/machine/sgi575.conf         |  1 +
 .../fiptool-native_2.9.0.bb                   |  0
 .../trusted-firmware-a/tf-a-tests_2.9.0.bb    |  0
 .../trusted-firmware-a_2.8.6.bb               |  4 ++
 .../trusted-firmware-a_2.9.0.bb               |  6 +-
 ...ert-usage-of-plat_ic_has_interrupt_t.patch | 38 +++++++++++++
 .../fiptool-native_2.10.0.bb                  | 33 +++++++++++
 .../trusted-firmware-a/tf-a-tests_2.10.0.bb   | 55 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  2 +-
 .../trusted-firmware-a_%.bbappend             |  1 +
 .../trusted-firmware-a_2.10.0.bb              | 12 ++++
 .../recipes-bsp/uefi/edk2-firmware_202308.bb  |  2 +-
 13 files changed, 152 insertions(+), 3 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/fipto=
ol-native_2.9.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/tf-a-=
tests_2.9.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/trust=
ed-firmware-a_2.9.0.bb (73%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl=
31_runtime-revert-usage-of-plat_ic_has_interrupt_t.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/fiptool-nativ=
e_2.10.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.=
10.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.10.0.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 74a0a66f..2a246de0 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -27,6 +27,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-r=
tl8168"
 # TF-A
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 TFA_PLATFORM =3D "n1sdp"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.9.%"
=20
 # SCP
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 3c2c94b6..7f2a285a 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -9,6 +9,7 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.=
inc
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.9.%"
=20
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.0=
.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.0.=
bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/fiptool-native_2.9.=
0.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb =
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.9.0.bb
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.8.6.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.8.6.bb
index cffc6db1..ef7ea598 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
6.bb
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
6.bb
@@ -13,3 +13,7 @@ SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.g=
it;name=3Dmbedtls;protocol=3Dht
 SRCREV_mbedtls =3D "89f040a5c938985c5f30728baed21e49d0846a53"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
+
+do_compile:prepend() {
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.9.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.9.0.bb
similarity index 73%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
9.0.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.9.0.bb
index 31a6a909..d9fdf329 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.=
0.bb
@@ -1,4 +1,4 @@
-require trusted-firmware-a.inc
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
 # TF-A v2.9.0
 SRCREV_tfa =3D "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
@@ -10,3 +10,7 @@ SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.g=
it;name=3Dmbedtls;protocol=3Dht
 SRCREV_mbedtls =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
+
+do_compile:prepend() {
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl31_runt=
ime-revert-usage-of-plat_ic_has_interrupt_t.patch b/meta-arm/recipes-bsp/=
trusted-firmware-a/files/0001-bl31_runtime-revert-usage-of-plat_ic_has_in=
terrupt_t.patch
new file mode 100644
index 00000000..f6f054df
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl31_runtime-rev=
ert-usage-of-plat_ic_has_interrupt_t.patch
@@ -0,0 +1,38 @@
+From fd13a4d304da4233cb954329bf287ec9dfbb7367 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Mon, 4 Dec 2023 10:20:21 -0500
+Subject: [PATCH] bl31_runtime: revert usage of plat_ic_has_interrupt_typ=
e
+
+There is a regression caused by commit
+1f6bb41dd951714b47bf07bb9a332346ca261033 for the trusted services tests.
+This is due to the fact that the referenced commit changes the behavior
+from checking for both INTR_TYPE_EL3 and INTR_TYPE_S_EL1, to referencing
+an existing function that #if for _either_ INTR_TYPE_EL3 or
+INTR_TYPE_S_EL1 (depending on the value of GICV2_G0_FOR_EL3).  To work
+around this issue, revert the check back to its original form.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Pending
+---
+ bl31/interrupt_mgmt.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bl31/interrupt_mgmt.c b/bl31/interrupt_mgmt.c
+index 68c7f10add21..8e888b676b35 100644
+--- a/bl31/interrupt_mgmt.c
++++ b/bl31/interrupt_mgmt.c
+@@ -47,9 +47,9 @@ static intr_type_desc_t intr_type_descs[MAX_INTR_TYPES=
];
+  **********************************************************************=
********/
+ static int32_t validate_interrupt_type(uint32_t type)
+ {
+-	if (plat_ic_has_interrupt_type(type)) {
++	if ((type =3D=3D INTR_TYPE_S_EL1) || (type =3D=3D INTR_TYPE_NS) ||
++	    (type =3D=3D INTR_TYPE_EL3))
+ 		return 0;
+-	}
+=20
+ 	return -EINVAL;
+ }
+--=20
+2.30.2
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.0.bb
new file mode 100644
index 00000000..e45ea9c4
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.0.bb
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
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
+
+# Use fiptool from TF-A v2.10.0
+SRCREV =3D "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
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
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb
new file mode 100644
index 00000000..f3818b6d
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb
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
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
+          "
+SRCBRANCH =3D "master"
+SRCREV =3D "42b99719d5dde58bdde07712bcb70a20d87f9067"
+
+DEPENDS +=3D "optee-os"
+
+EXTRA_OEMAKE +=3D "USE_NVM=3D0"
+EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
+EXTRA_OEMAKE +=3D "DEBUG=3D1"
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
+    install -m 0644 ${B}/${TFA_PLATFORM}/debug/tftf.bin ${D}/firmware/tf=
tf.bin
+}
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 2bdf2211..922c0a34 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -168,7 +168,7 @@ BUILD_DIR .=3D "/${@'debug' if d.getVar("TFA_DEBUG") =
=3D=3D '1' else 'release'}"
 do_compile() {
     # This is still needed to have the native tools executing properly b=
y
     # setting the RPATH
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
+    sed -i '/^LDOPTS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
     sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
     sed -i '/^LIB/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/cert_create/Make=
file
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index ca0448f5..b3624bb3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -10,6 +10,7 @@ TOOLCHAIN:qemuarm-secureboot =3D "gcc"
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot :=3D "${THISDIR}/files:"
 SRC_URI:append:qemuarm64-secureboot =3D " \
             file://0001-Add-spmc_manifest-for-qemu.patch \
+            file://0001-bl31_runtime-revert-usage-of-plat_ic_has_interru=
pt_t.patch \
         "
=20
 TFA_PLATFORM:qemuarm64-secureboot =3D "qemu"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
0.0.bb
new file mode 100644
index 00000000..4f019844
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.b=
b
@@ -0,0 +1,12 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.10.0
+SRCREV_tfa =3D "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
+
+# mbedtls-3.5.1
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
+SRCREV_mbedtls =3D "edb8fec9882084344a314368ac7fd957a187519c"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202308.bb
index 8620a67b..2619f2fd 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb
@@ -1,5 +1,5 @@
 SRCREV_edk2           ?=3D "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
-SRCREV_edk2-platforms ?=3D "bb6841e3fd1c60b3f8510b4fc0a380784e05d326"
+SRCREV_edk2-platforms ?=3D "88ea1c2b62d44d6a4ebf2626ddaeecbc74f96877"
=20
 # FIXME - clang is having issues with antlr
 TOOLCHAIN:aarch64 =3D "gcc"
--=20
2.30.2


