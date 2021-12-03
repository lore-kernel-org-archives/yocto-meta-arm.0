Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EF8C43217
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:29:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10945.1638534566976338070
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 04:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3D661396;
	Fri,  3 Dec 2021 04:29:26 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80DA83F5A1;
	Fri,  3 Dec 2021 04:29:25 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 09/11] arm-bsp/trusted-firmware-a: patch to identify which
 bank to load fip from
Date: Fri,  3 Dec 2021 12:28:59 +0000
Message-Id: <20211203122901.3549-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
References: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 12:29:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2522

From: Satish Kumar <satish.kumar01@arm.com>

Secure enclave decide the boot bank based on the firmware update
state of the system and updated the boot bank information at a given
location in the flash. In this commit, bl2 reads the givev flash location
to indentify the bank from which it should load fip from.

Change-Id: I2f7518c82c1664355da2aa1596f4f65f7a49a53d
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...identify-which-bank-to-load-fip-from.patch | 102 ++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch
new file mode 100644
index 0000000..18e784b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch
@@ -0,0 +1,102 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 03218b5bb3ef32298624a54d1b3b3cf3c8c5d800 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Wed, 27 Oct 2021 16:31:04 +0100
+Subject: [PATCH 1/1] plat/arm: corstone1000: identify which bank to load fip
+ from
+
+Secure enclave decide the boot bank based on the firmware update
+state of the system and updated the boot bank information at a given
+location in the flash. In this commit, bl2 reads the givev flash location
+to indentify the bank from which it should load fip from.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../corstone1000/common/corstone1000_plat.c   | 39 +++++++++++++++++++
+ .../common/include/platform_def.h             |  6 ++-
+ 2 files changed, 43 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+index 7a38b0b2e..4351d5e9d 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+@@ -11,6 +11,10 @@
+ #include <plat/arm/common/plat_arm.h>
+ #include <plat/common/platform.h>
+ #include <platform_def.h>
++#include <drivers/generic_delay_timer.h>
++#include <plat/arm/common/arm_fconf_getter.h>
++#include <plat/arm/common/arm_fconf_io_storage.h>
++#include <drivers/io/io_storage.h>
+ 
+ /*
+  * Table of regions to map using the MMU.
+@@ -26,6 +30,41 @@ const mmap_region_t plat_arm_mmap[] = {
+ 	{0}
+ };
+ 
++void identify_fip_start_address(void)
++{
++	const struct plat_io_policy *policy;
++	volatile uint32_t *boot_bank_flag = (uint32_t*)(PLAT_ARM_BOOT_BANK_FLAG);
++
++	VERBOSE("Boot bank flag = %u.\n\r", *boot_bank_flag);
++
++	policy = FCONF_GET_PROPERTY(arm, io_policies, FIP_IMAGE_ID);
++
++	assert(policy != NULL);
++	assert(policy->image_spec != 0UL);
++
++	io_block_spec_t *spec = (io_block_spec_t *)policy->image_spec;
++
++	if ((*boot_bank_flag) == 0) {
++		VERBOSE("Booting from bank 0: fip offset = 0x%lx\n\r",
++						PLAT_ARM_FIP_BASE_BANK0);
++		spec->offset = PLAT_ARM_FIP_BASE_BANK0;
++	} else {
++		VERBOSE("Booting from bank 1: fip offset = 0x%lx\n\r",
++						PLAT_ARM_FIP_BASE_BANK1);
++		spec->offset = PLAT_ARM_FIP_BASE_BANK1;
++	}
++}
++
++void bl2_platform_setup(void)
++{
++	arm_bl2_platform_setup();
++	/*
++	 * Identify the start address of the FIP by reading the boot
++	 * index flag from the flash.
++	 */
++	identify_fip_start_address();
++}
++
+ /* corstone1000 only has one always-on power domain and there
+  * is no power control present
+  */
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b/plat/arm/board/corstone1000/common/include/platform_def.h
+index edc90fa72..868e41388 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -213,13 +213,15 @@
+ 
+ /* NOR Flash */
+ 
+-#define PLAT_ARM_FIP_BASE			UL(0x081EF000)
++#define PLAT_ARM_BOOT_BANK_FLAG			UL(0x08002000)
++#define PLAT_ARM_FIP_BASE_BANK0			UL(0x081EF000)
++#define PLAT_ARM_FIP_BASE_BANK1			UL(0x0916F000)
+ #define PLAT_ARM_FIP_MAX_SIZE			UL(0x1ff000)  /* 1.996 MB */
+ 
+ #define PLAT_ARM_NVM_BASE			V2M_FLASH0_BASE
+ #define PLAT_ARM_NVM_SIZE			(SZ_32M)  /* 32 MB */
+ 
+-#define PLAT_ARM_FLASH_IMAGE_BASE		PLAT_ARM_FIP_BASE
++#define PLAT_ARM_FLASH_IMAGE_BASE		PLAT_ARM_FIP_BASE_BANK0
+ #define PLAT_ARM_FLASH_IMAGE_MAX_SIZE		PLAT_ARM_FIP_MAX_SIZE
+ 
+ /*
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 473d2a8..970a1ce 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -16,6 +16,7 @@ SRC_URI:append = " \
                  file://0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch \
                  file://0003-corstone1000-implement-platform-specific-psci-reset.patch \
                  file://0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch   \
+                 file://0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch   \
                  "
 
 TFA_DEBUG = "1"
-- 
2.17.1


