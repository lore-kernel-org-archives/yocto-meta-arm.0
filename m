Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83588C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 13:37:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.19154.1640180227103927313
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Dec 2021 05:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C804106F;
	Wed, 22 Dec 2021 05:37:06 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6D1C3F5A1;
	Wed, 22 Dec 2021 05:37:05 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 1/1] arm-bsp/u-boot: add ethernet device and enable
 configs for SCT
Date: Wed, 22 Dec 2021 13:36:56 +0000
Message-Id: <20211222133656.1110-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211222133656.1110-1-xueliang.zhong@arm.com>
References: <20211222133656.1110-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Dec 2021 13:37:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2761

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to add
* ethernet device SMC911x device and this is required to support
  bootfromnetwork SCT
* also enabled other config options to fix SCT issues

Change-Id: Ic6112c019cb08f77e29508ad47980f851f79088c
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...-corstone1000-enable-ethernet-device.patch | 83 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-corstone1000-enable-ethernet-device.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-corstone1000-enable-ethernet-device.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-corstone1000-enable-ethernet-device.patch
new file mode 100644
index 0000000..be76a5c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-corstone1000-enable-ethernet-device.patch
@@ -0,0 +1,83 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 0f90466c2d435534ea19669515c6e0af389d430b Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 22 Dec 2021 11:31:28 +0000
+Subject: [PATCH] corstone1000: enable ethernet device
+
+This change is to enable ethernet device (SMC911x) and few
+other config options which are required by EDK-2 conformance test
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
+index a51f5ddfa0..113a8238c7 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -54,6 +54,14 @@ static struct mm_region corstone1000_mem_map[] = {
+                 .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+                          PTE_BLOCK_NON_SHARE |
+                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++                 /* ethernet */
++                .virt = 0x40100000UL,
++                .phys = 0x40100000UL,
++                .size = 0x00100000UL,
++                .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++                         PTE_BLOCK_NON_SHARE |
++                         PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+ 		/* OCVM */
+ 		.virt = 0x80000000UL,
+@@ -95,6 +103,23 @@ int dram_init_banksize(void)
+ 	return 0;
+ }
+ 
++/*
++ * Board specific ethernet initialization routine.
++ * */
++int board_eth_init(struct bd_info *bis)
++{
++	        int rc = 0;
++#ifndef CONFIG_DM_ETH
++#ifdef CONFIG_SMC91111
++	rc = smc91111_initialize(0, CONFIG_SMC91111_BASE);
++#endif
++#ifdef CONFIG_SMC911X
++	rc = smc911x_initialize(0, CONFIG_SMC911X_BASE);
++#endif
++#endif
++	return rc;
++}
++
+ void reset_cpu(ulong addr)
+ {
+ }
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index d576ee1b67..45904ec98d 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -67,3 +67,19 @@ CONFIG_PSCI_RESET=y
+ CONFIG_DISTRO_DEFAULTS=y
+ CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
+ # CONFIG_EFI_CAPSULE_FIRMWARE_FIT is not set
++CONFIG_CMD_DHCP=y
++CONFIG_SMC911X=y
++CONFIG_SMC911X_BASE=0x40100000
++CONFIG_DM_ETH=y
++CONFIG_PHY_SMSC=y
++CONFIG_CMD_BOOTEFI_SELFTEST=y
++CONFIG_CMD_TIME=y
++CONFIG_CMD_GETTIME=y
++CONFIG_NET_RANDOM_ETHADDR=y
++CONFIG_VERSION_VARIABLE=y
++CONFIG_PHYLIB=y
++CONFIG_PHY=y
++CONFIG_RAM=y
++CONFIG_ERRNO_STR=y
++CONFIG_CMD_EDITENV=y
++CONFIG_MISC=y
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 4f7f477..93c4be8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -59,6 +59,7 @@ SRC_URI:append:corstone1000 = " \
       file://0045-corstone1000-defconfig-enable-CAPSULE_FIRMWARE_RAW-c.patch \
       file://0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch \
       file://0047-efi_firmware-add-get_image_info-for-corstone1000.patch \
+      file://0048-corstone1000-enable-ethernet-device.patch \
       "
 
 #
-- 
2.17.1


