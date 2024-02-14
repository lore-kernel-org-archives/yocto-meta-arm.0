Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB23C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:03:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41637.1707919394703235827
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 06:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E6C11FB;
	Wed, 14 Feb 2024 06:03:55 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A2F43F5A1;
	Wed, 14 Feb 2024 06:03:13 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 1/4] bsp: Move Corstone-1000 U-Boot configuration entries
Date: Wed, 14 Feb 2024 14:03:00 +0000
Message-ID: <20240214140303.38535-2-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214140303.38535-1-drew.reed@arm.com>
References: <20240214140303.38535-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Feb 2024 14:03:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5380

From: Drew Reed <Drew.Reed@arm.com>

Moved the U-Boot configuration items from the machine definition to the
Corstone-1000 specific U-Boot append file as it makes it easier to the
U-Boot configuration for a machine in one place and to make it more
consistant with other platforms.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc   | 11 -----------
 .../recipes-bsp/images/corstone1000-image.bb         |  5 +++++
 .../recipes-bsp/u-boot/u-boot-corstone1000.inc       | 12 ++++++++++--
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 06b630a5..a1e67c21 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -20,22 +20,11 @@ TFA_BL2_RE_IMAGE_LOAD_ADDRESS =3D "0x62353000"
 TFA_BL2_RE_SIGN_BIN_SIZE =3D "0x2d000"
 TFA_FIP_RE_IMAGE_LOAD_ADDRESS =3D "0x68130000"
 TFA_FIP_RE_SIGN_BIN_SIZE =3D "0x00200000"
-RE_LAYOUT_WRAPPER_VERSION =3D "0.0.7"
-TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
-RE_IMAGE_OFFSET =3D "0x1000"
=20
 # u-boot
 PREFERRED_VERSION_u-boot ?=3D "2023.07%"
 EXTRA_IMAGEDEPENDS +=3D "u-boot"
=20
-UBOOT_CONFIG ??=3D "EFI"
-UBOOT_CONFIG[EFI] =3D "corstone1000_defconfig"
-UBOOT_ENTRYPOINT  =3D "0x80000000"
-UBOOT_LOADADDRESS =3D "0x80000000"
-UBOOT_BOOTARGS =3D "earlycon=3Dpl011,0x1a510000 console=3DttyAMA0 loglev=
el=3D9"
-UBOOT_ARCH =3D "arm"
-UBOOT_EXTLINUX =3D "0"
-
 #optee
 PREFERRED_VERSION_optee-os ?=3D "4.1.%"
 EXTRA_IMAGEDEPENDS +=3D "optee-os"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta=
-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index 714a57cb..e7d00596 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -17,6 +17,11 @@ UEFI_FIRMWARE_BINARY =3D "${PN}-${MACHINE}.${CAPSULE_I=
MGTYPE}"
 UEFI_CAPSULE_CONFIG =3D "${THISDIR}/files/${PN}-capsule-update-image.jso=
n"
 CAPSULE_IMGTYPE =3D "wic"
=20
+# TF-X settings for signing host images
+RE_LAYOUT_WRAPPER_VERSION =3D "0.0.7"
+TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
+RE_IMAGE_OFFSET =3D "0x1000"
+
 do_sign_images() {
     # Sign TF-A BL2
     sign_host_image ${RECIPE_SYSROOT}/firmware/${TFA_BL2_BINARY} \
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index cf0640a3..2585ff25 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -1,10 +1,18 @@
 # Corstone1000 specific U-boot support
=20
-DEPENDS:append =3D " gnutls-native openssl-native efitools-native"
+DEPENDS:append =3D " openssl-native efitools-native"
 CORSTONE1000_DEVICE_TREE:corstone1000-mps3 =3D "corstone1000-mps3"
 CORSTONE1000_DEVICE_TREE:corstone1000-fvp =3D "corstone1000-fvp"
 EXTRA_OEMAKE:append =3D ' DEVICE_TREE=3D${CORSTONE1000_DEVICE_TREE}'
=20
+UBOOT_CONFIG ??=3D "EFI"
+UBOOT_CONFIG[EFI] =3D "corstone1000_defconfig"
+UBOOT_ENTRYPOINT  =3D "0x80000000"
+UBOOT_LOADADDRESS =3D "0x80000000"
+UBOOT_BOOTARGS =3D "${LINUX_KERNEL_ARGS} loglevel=3D9"
+UBOOT_ARCH =3D "arm"
+UBOOT_EXTLINUX =3D "0"
+
 SYSROOT_DIRS:append =3D " /boot"
=20
 SRC_URI:append =3D " \
@@ -52,7 +60,7 @@ SRC_URI:append =3D " \
     file://0042-corstone1000-enable-virtio-net-support.patch		  \
     "
=20
-do_configure:append(){
+do_configure:append() {
     openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout =
${B}/CRT.key -out ${B}/CRT.crt -nodes -days 365
     cert-to-efi-sig-list ${B}/CRT.crt ${B}/corstone1000_defconfig/CRT.es=
l
 }
--=20
2.43.0


