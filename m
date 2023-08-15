Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EA1C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 14:25:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.135430.1692109516900127216
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 07:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A858B143D;
	Tue, 15 Aug 2023 07:25:58 -0700 (PDT)
Received: from PW04GXMM.cambridge.arm.com (PW04GXMM.arm.com [10.1.32.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76F503F6C4;
	Tue, 15 Aug 2023 07:25:15 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: corstone1000: add unique firmware GUID
Date: Tue, 15 Aug 2023 15:24:49 +0100
Message-Id: <20230815142450.545-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815142450.545-1-anusmita.duttamazumder@arm.com>
References: <20230815142450.545-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Aug 2023 14:25:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4961

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Add new Corstone-1000 firmware GUID and remove previous u-boot GUID to be=
 updated into ESRT table.
SR-IR 2.0 requires the capsule GUID to be unique.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 ...ne1000-ESRT-add-unique-firmware-GUID.patch | 47 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
034-corstone1000-ESRT-add-unique-firmware-GUID.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-cor=
stone1000-ESRT-add-unique-firmware-GUID.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0034-corstone1000-ESRT-add-unique-firmware-GUI=
D.patch
new file mode 100644
index 00000000..197a0695
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone10=
00-ESRT-add-unique-firmware-GUID.patch
@@ -0,0 +1,47 @@
+From 98b33cc6b3a56f56224e0a6fe6c3564de7b1341a Mon Sep 17 00:00:00 2001
+From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+Date: Tue, 8 Aug 2023 10:24:39 +0000
+Subject: [PATCH] corstone1000: ESRT: add unique firmware GUID
+
+Add unique Corstone-1000 firmware GUID
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+---
+ lib/efi_loader/efi_firmware.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
+index 6135f8ed1c..c9117ae2b2 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -20,12 +20,12 @@
+ #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
+=20
+ #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
+-#define EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID \
+-	EFI_GUID(0xe2bb9c06, 0x70e9, 0x4b14, 0x97, 0xa3, \
+-		 0x5a, 0x79, 0x13, 0x17, 0x6e, 0x3f)
++/* Firmware GUID */
++#define EFI_CORSTONE1000_FIRMWARE_GUID \
++	EFI_GUID(0x989f3a4e, 0x46e0, 0x4cd0, 0x98, 0x77, \
++		 0xa2, 0x5c, 0x70, 0xc0, 0x13, 0x29)
+=20
+- const efi_guid_t efi_firmware_image_type_uboot_raw =3D
+-				EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID;
++efi_guid_t corstone1000_firmware_guid =3D EFI_CORSTONE1000_FIRMWARE_GUI=
D;
+=20
+ static efi_status_t efi_corstone1000_img_info_get (
+ 	efi_uintn_t *image_info_size,
+@@ -353,7 +353,7 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
+ 			       descriptor_version, descriptor_count,
+ 			       descriptor_size,
+ 			       package_version, package_version_name,
+-			       &efi_firmware_image_type_uboot_raw);
++			       &corstone1000_firmware_guid);
+ #else
+ 	ret =3D efi_fill_image_desc_array(image_info_size, image_info,
+ 					descriptor_version, descriptor_count,
+--=20
+2.38.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 389f236e..37dcc2ef 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -51,6 +51,7 @@ SRC_URI:append:corstone1000 =3D " \
 	file://0031-corstone1000-enable-PSCI-reset.patch			  \
 	file://0032-Enable-EFI-set-get-time-services.patch			  \
 	file://0033-corstone1000-detect-inflated-kernel-size.patch			  \
+	file://0034-corstone1000-ESRT-add-unique-firmware-GUID.patch		\
         "
=20
 #
--=20
2.34.1


