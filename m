Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414C1CD1299
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 15:08:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2332.1712761693913157396
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 08:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9331480;
	Wed, 10 Apr 2024 08:08:43 -0700 (PDT)
Received: from PW04GXMM.arm.com (PW04GXMM.arm.com [10.1.28.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 100F63F766;
	Wed, 10 Apr 2024 08:08:12 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot:corstone1000: add unique guid for fvp and mps3
Date: Wed, 10 Apr 2024 16:07:43 +0100
Message-Id: <20240410150744.53421-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410150744.53421-1-anusmita.duttamazumder@arm.com>
References: <20240410150744.53421-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Apr 2024 15:08:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5517

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

This patch in U-boot sets unique GUID for Corstone1000 FVP and MPS3

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 .../documentation/corstone1000/user-guide.rst |  4 +-
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...000-set-unique-GUID-for-fvp-and-mps3.patch | 57 +++++++++++++++++++
 3 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index dc1d1023..06353b5d 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -735,11 +735,11 @@ generate a UEFI capsule.
    cd <_workspace>
=20
    ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
+   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
    --fw-version 6 build/tmp/deploy/images/corstone1000-mps3/corstone1000=
_image.nopt cs1k_cap_mps3_v6
=20
    ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/t=
mp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
-   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
+   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_=
capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
    --fw-version 5 build/tmp/deploy/images/corstone1000-mps3/corstone1000=
_image.nopt cs1k_cap_mps3_v5
=20
 Generating FVP Capsules
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index c7172d6f..c0a029e9 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -59,6 +59,7 @@ SRC_URI:append =3D " \
     file://0041-scatter-gather-flag-workaround.patch			  \
     file://0042-corstone1000-enable-virtio-net-support.patch		  \
     file://0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch		=
  \
+    file://0044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch		  \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-cor=
stone1000-set-unique-GUID-for-fvp-and-mps3.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0044-corstone1000-set-unique-GUID-for-fvp-a=
nd-mps3.patch
new file mode 100644
index 00000000..86b1071c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone10=
00-set-unique-GUID-for-fvp-and-mps3.patch
@@ -0,0 +1,57 @@
+From 6dc17c01df592f685636e34ad8bb0a6ecb994e15 Mon Sep 17 00:00:00 2001
+From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+Date: Thu, 21 Mar 2024 20:34:46 +0000
+Subject: [PATCH] corstone1000: set unique GUID for fvp and mps3
+
+This patch sets unique GUID for Corstone1000 FVP and MPS3
+
+Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
+Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+---
+ lib/efi_loader/efi_firmware.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
+index 7792a6aa83..1e49f79864 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -16,16 +16,19 @@
+=20
+ #include <linux/list.h>
+ #include <efi_variable.h>
++#include <generated/dt.h>
+=20
+ #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
+=20
+ #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
+ /* Firmware GUID */
+-#define EFI_CORSTONE1000_FIRMWARE_GUID \
++#define EFI_CORSTONE1000_FIRMWARE_GUID_FVP \
+ 	EFI_GUID(0x989f3a4e, 0x46e0, 0x4cd0, 0x98, 0x77, \
+ 		 0xa2, 0x5c, 0x70, 0xc0, 0x13, 0x29)
+=20
+-efi_guid_t corstone1000_firmware_guid =3D EFI_CORSTONE1000_FIRMWARE_GUI=
D;
++#define EFI_CORSTONE1000_FIRMWARE_GUID_MPS3 \
++	EFI_GUID(0xdf1865d1, 0x90fb, 0x4d59, 0x9c, 0x38, \
++		 0xc9, 0xf2, 0xc1, 0xbb, 0xa8, 0xcc)
+=20
+ static efi_status_t efi_corstone1000_img_info_get (
+ 	efi_uintn_t *image_info_size,
+@@ -334,6 +337,14 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
+ 	u16 **package_version_name)
+ {
+ 	efi_status_t ret;
++	efi_guid_t corstone1000_firmware_guid;
++	const char *cmp_dtb =3D DEVICE_TREE;
++=09
++	if (!strcmp(cmp_dtb, "corstone1000-fvp")) {
++		corstone1000_firmware_guid =3D (efi_guid_t)EFI_CORSTONE1000_FIRMWARE_=
GUID_FVP;
++	} else {
++		corstone1000_firmware_guid =3D (efi_guid_t)EFI_CORSTONE1000_FIRMWARE_=
GUID_MPS3;
++	}
+=20
+ 	EFI_ENTRY("%p %p %p %p %p %p %p %p\n", this,
+ 		  image_info_size, image_info,
+--=20
+2.38.1
+
--=20
2.34.1


