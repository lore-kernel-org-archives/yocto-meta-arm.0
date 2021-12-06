Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14448C433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.51153.1638797128918337854
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 894756D;
	Mon,  6 Dec 2021 05:25:28 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669333F73D;
	Mon,  6 Dec 2021 05:25:27 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH][HONISTER 04/13] arm-bsp/u-boot: corstone1000: Fix ISP1760 EFI
 boot issue
Date: Mon,  6 Dec 2021 13:25:04 +0000
Message-Id: <20211206132513.20172-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2538

From: Harry Moulton <harry.moulton@arm.com>

This patch does three things:
 - Add the CONFIG_EFI_PARTITION option to the corstone1000_defconfig
    to allow u-boot to detect EFI filesystems.
 - Add isp1760_get_max_xfer_size(), this fixes an issue where
    GPT partition info could not be loaded.
 - Fix the issue while detecting EFI filesystem, and loading GPT
    partition info.

Change-Id: Ic04c8710f4ea7e156aca196d7e54f090b9376c49
Signed-off-by: Harry Moulton <harry.moulton@arm.com>
---
 ...x-unrecognized-filesystem-type-error.patch | 96 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch
new file mode 100644
index 0000000..54973cc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch
@@ -0,0 +1,96 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Harry Moulton <harry.moulton@arm.com>
+
+From 224d5d7ca9359a1c383ee417d934d2a6dfca53df Mon Sep 17 00:00:00 2001
+From: Harry Moulton <harmou01@e123741.cambridge.arm.com>
+Date: Mon, 29 Nov 2021 13:13:17 +0000
+Subject: [PATCH] arm: corstone1000: fix unrecognized filesystem type
+ error.
+
+Fix the 'unrecognized filesystem type' error when attempting to boot
+from an EFI image on attached USB formated as GPT.
+
+Signed-off-by: Harry Moulton <harry.moulton@arm.com>
+---
+ common/usb_storage.c                |  3 +++
+ configs/corstone1000_defconfig      |  3 ++-
+ drivers/usb/isp1760/isp1760-uboot.c | 12 ++++++++++++
+ include/configs/corstone1000.h      |  1 +
+ 4 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/common/usb_storage.c b/common/usb_storage.c
+index 946c6b2b32..77b8b55010 100644
+--- a/common/usb_storage.c
++++ b/common/usb_storage.c
+@@ -769,6 +769,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *srb, struct us_data *us)
+ st:
+ 	retry = 0;
+ again:
++    if (srb->cmd[0] == SCSI_TST_U_RDY)
++        mdelay(100);
++
+ 	debug("STATUS phase\n");
+ 	result = usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
+ 				&actlen, USB_CNTL_TIMEOUT*5);
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index c5eb9af101..fe77bdc63f 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -20,6 +20,7 @@ CONFIG_CMD_BOOTM=y
+ CONFIG_CMD_LOADM=y
+ CONFIG_CMD_BOOTEFI=y
+ CONFIG_EFI_LOADER=y
++CONFIG_EFI_PARTITION=y
+ CONFIG_CMD_BOOTEFI_HELLO_COMPILE=y
+ CONFIG_CMD_BOOTEFI_HELLO=y
+ # CONFIG_CMD_XIMG is not set
+@@ -52,7 +53,7 @@ CONFIG_EFI_MM_COMM_TEE=y
+ # CONFIG_HEXDUMP is not set
+ CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
+ CONFIG_EFI_CAPSULE_ON_DISK=y
+-CONFIG_EFI_CAPSULE_ON_DISK_EARLY=y
++# CONFIG_EFI_CAPSULE_ON_DISK_EARLY is not set
+ # CONFIG_EFI_CAPSULE_AUTHENTICATE is not set
+ CONFIG_EFI_HAVE_CAPSULE_SUPPORT=y
+ CONFIG_EFI_CAPSULE_FIRMWARE_FIT=y
+diff --git a/drivers/usb/isp1760/isp1760-uboot.c b/drivers/usb/isp1760/isp1760-uboot.c
+index 9f2eaa75f3..cb03bc5d8c 100644
+--- a/drivers/usb/isp1760/isp1760-uboot.c
++++ b/drivers/usb/isp1760/isp1760-uboot.c
+@@ -56,9 +56,21 @@ static int isp1760_msg_submit_irq(struct udevice *dev, struct usb_device *udev,
+ 				  pipe, buffer, length, interval);
+ }
+ 
++static int isp1760_get_max_xfer_size(struct udevice *dev, size_t *size)
++{
++    struct isp1760_host_data *host = dev_get_priv(dev);
++    struct isp1760_hcd *priv = host->hcd.hcd_priv;
++    const struct isp1760_memory_layout *mem = priv->memory_layout;
++
++    *size = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
++
++    return 0;
++}
++
+ struct dm_usb_ops isp1760_usb_ops = {
+ 	.control	= isp1760_msg_submit_control,
+ 	.bulk		= isp1760_msg_submit_bulk,
+ 	.interrupt	= isp1760_msg_submit_irq,
++    .get_max_xfer_size = isp1760_get_max_xfer_size,
+ };
+ 
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 87682406d6..4c7993649d 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -91,6 +91,7 @@
+ #define CONFIG_SYS_MAXARGS		64	/* max command args */
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS					\
++                "usb_pgood_delay=250\0"         \
+ 				"fdt_addr_r=0x82000000\0"		\
+ 				"kernel_addr=0x08330000\0"		\
+ 				"kernel_addr_r=0x82100000\0"		\
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 8df5641..3e50992 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -39,6 +39,7 @@ SRC_URI:append:corstone1000 = " \
       file://0025-corstone1000-Update-FFA-shared-buffer-address.patch \
       file://0026-corstone1000-Disable-set-get-of-NV-variables.patch \
       file://0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch \
+      file://0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch \
      "
 
 #
-- 
2.17.1


