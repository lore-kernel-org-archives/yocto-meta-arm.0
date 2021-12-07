Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA0EC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 18:20:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.860.1638901201301869169
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 10:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741A211FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DE6B3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] trusted-firmware-a: don't use virtual/trusted-firmware-a
Date: Tue,  7 Dec 2021 18:19:52 +0000
Message-Id: <20211207181956.900131-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Dec 2021 18:20:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2555

There's no need to use virtual/trusted-firmware-a, as there's only one
provider of trusted-firmware-a: trusted-firmware-a.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf                      | 2 +-
 meta-arm-bsp/conf/machine/fvp-common.inc                        | 2 +-
 meta-arm-bsp/conf/machine/include/corstone1000.inc              | 2 +-
 meta-arm-bsp/conf/machine/include/corstone700.inc               | 2 +-
 meta-arm-bsp/conf/machine/include/tc.inc                        | 1 -
 meta-arm-bsp/conf/machine/juno.conf                             | 2 +-
 meta-arm-bsp/conf/machine/n1sdp.conf                            | 2 +-
 meta-arm-bsp/conf/machine/sgi575.conf                           | 2 +-
 meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb     | 2 +-
 meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb          | 2 +-
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc    | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 2 --
 meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend              | 2 +-
 14 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index e87d81d8..c9ab4064 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -16,7 +16,7 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.3%"
=20
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
=20
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index 5a4a5c62..799260ec 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -17,7 +17,7 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_u-boot ?=3D "2021.10"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
=20
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.  Disable rng-tools (which takes too long to
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 0e1c896c..994fb06d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -5,7 +5,7 @@ MACHINEOVERRIDES =3D. "corstone1000:"
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm=
-bsp/conf/machine/include/corstone700.inc
index 0ec385ab..8a03c00d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -18,7 +18,7 @@ PREFERRED_VERSION_gcc-arm-none-eabi-native ?=3D "9-2020=
-q2-update"
 PREFERRED_PROVIDER_virtual/control-processor-firmware ?=3D "boot-firmwar=
e"
=20
 EXTRA_IMAGEDEPENDS +=3D " \
-                      virtual/trusted-firmware-a          \
+                      trusted-firmware-a          \
                       external-system                     \
                       u-boot                              \
                       virtual/control-processor-firmware  \
diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index dd0b872e..9f0239bb 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -21,7 +21,6 @@ UBOOT_SIGN_KEYNAME =3D "dev_key"
 UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/keys"
 FIT_GENERATE_KEYS =3D "1"
=20
-PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 1000dadf..4a71d66d 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -23,7 +23,7 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
=20
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot firmware-imag=
e-juno"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot firmware-image-juno"
=20
 # Juno u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_juno_defconfig"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 643212fb..95a04c05 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -27,7 +27,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-r=
tl8168"
=20
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
=20
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 #UEFI EDK2 firmware
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 4f917105..7e1e6036 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -10,7 +10,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firm=
ware"
=20
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
=20
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb =
b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
index 0a8e2df6..abd4e328 100644
--- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
+++ b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
@@ -12,7 +12,7 @@ PV =3D "2020.02.10+git${SRCPV}"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
-DEPENDS =3D "virtual/arm-none-eabi-gcc-native virtual/trusted-firmware-a=
"
+DEPENDS =3D "virtual/arm-none-eabi-gcc-native trusted-firmware-a"
=20
 inherit deploy
=20
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/met=
a-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index a79bab50..d65c074f 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -5,7 +5,7 @@ LICENSE =3D "BSD-3-Clause"
 SECTION =3D "firmware"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D55=
0794465ba0ec5312d6919e203a55f9"
=20
-DEPENDS =3D "virtual/trusted-firmware-a virtual/kernel virtual/control-p=
rocessor-firmware"
+DEPENDS =3D "trusted-firmware-a virtual/kernel virtual/control-processor=
-firmware"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 1af68dde..a1e2af61 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -6,7 +6,7 @@ SCP_LOG_LEVEL =3D "INFO"
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
=20
 DEPENDS +=3D "fiptool-native"
-DEPENDS +=3D "virtual/trusted-firmware-a"
+DEPENDS +=3D "trusted-firmware-a"
=20
 do_install:append() {
    fiptool \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 68abc967..42648eaa 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -34,7 +34,7 @@ SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aa=
cd3d8"
=20
 # The install task signs the TF-A BL2 and FIP binaries.
 # So they need to be copied to the sysroot. Hence the dependencies below=
:
-do_prepare_recipe_sysroot[depends]+=3D "virtual/trusted-firmware-a:do_po=
pulate_sysroot"
+do_prepare_recipe_sysroot[depends]+=3D "trusted-firmware-a:do_populate_s=
ysroot"
=20
 # adding host images signing support
 require trusted-firmware-m-sign-host-images.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 243e641c..40c9e9e3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -1,8 +1,6 @@
 DESCRIPTION =3D "Trusted Firmware-A"
 LICENSE =3D "BSD-3-Clause & MIT"
=20
-PROVIDES =3D "virtual/trusted-firmware-a"
-
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 50777dcd..f65cb094 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -5,7 +5,7 @@ EDK2_BIN_NAME:qemuarm64-secureboot      =3D "QEMU_EFI.fd"
=20
=20
 COMPATIBLE_MACHINE:qemu-generic-arm64   =3D "qemu-generic-arm64"
-DEPENDS:append:qemu-generic-arm64       =3D " virtual/trusted-firmware-a=
 coreutils-native"
+DEPENDS:append:qemu-generic-arm64       =3D " trusted-firmware-a coreuti=
ls-native"
 EDK2_PLATFORM:qemu-generic-arm64        =3D "SbsaQemu"
 EDK2_PLATFORM_DSC:qemu-generic-arm64    =3D "Platform/Qemu/SbsaQemu/Sbsa=
Qemu.dsc"
 EDK2_BIN_NAME:qemu-generic-arm64        =3D "SBSA_FLASH0.fd"
--=20
2.25.1


