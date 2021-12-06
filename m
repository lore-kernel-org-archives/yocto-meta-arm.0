Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140D4C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.51154.1638797132602193156
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDC421042;
	Mon,  6 Dec 2021 05:25:31 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A66D63F73D;
	Mon,  6 Dec 2021 05:25:30 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH][HONISTER 06/13] arm-bsp/trusted firmware-a: corstone1000:
 implement EFI reset system
Date: Mon,  6 Dec 2021 13:25:06 +0000
Message-Id: <20211206132513.20172-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2540

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit implements efi_reset_system for corstone1000 platform. In
order to reset the system, the host uses secure host watchdog to assert
an interrupt (WS1) on the secure-enclave side, then secure-enclave
resets the system.

Change-Id: I772181cd43e789f1d6508aaa433eb109d8f85b5d
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...plement-platform-specific-psci-reset.patch | 60 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch
new file mode 100644
index 0000000..98f2e63
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 1b99c6dd614002a79e4dda96d630089775a1d233 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 17 Nov 2021 18:45:32 +0000
+Subject: [PATCH] corstone1000: implement platform specific psci reset
+
+This implements platform specific psci reset for the corstone1000.
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+---
+ .../corstone1000/common/corstone1000_pm.c     | 23 +++++++++++++++++--
+ 1 file changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+index 12b322e27..e95ab30b7 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+@@ -6,17 +6,36 @@
+ 
+ #include <lib/psci/psci.h>
+ #include <plat/arm/common/plat_arm.h>
+-
+ /*******************************************************************************
+  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Standard
+  * platform layer will take care of registering the handlers with PSCI.
+  ******************************************************************************/
++
++#define SECURE_WATCHDOG_ADDR_CTRL_REG     0x1A320000
++#define SECURE_WATCHDOG_ADDR_VAL_REG      0x1A320008
++#define SECURE_WATCHDOG_MASK_ENABLE       0x01
++#define SECURE_WATCHDOG_COUNTDOWN_VAL     0x1000
++
++static void __dead2 corstone1000_system_reset(void)
++{
++
++    uint32_t volatile * const watchdog_ctrl_reg = (int *) SECURE_WATCHDOG_ADDR_CTRL_REG;
++    uint32_t volatile * const watchdog_val_reg = (int *) SECURE_WATCHDOG_ADDR_VAL_REG;
++
++   *(watchdog_val_reg) = SECURE_WATCHDOG_COUNTDOWN_VAL;
++   *watchdog_ctrl_reg = SECURE_WATCHDOG_MASK_ENABLE;
++     while (1){
++        wfi();
++    }
++}
++
+ plat_psci_ops_t plat_arm_psci_pm_ops = {
+-	/* dummy struct */
++    .system_reset = corstone1000_system_reset,
+ 	.validate_ns_entrypoint = NULL
+ };
+ 
+ const plat_psci_ops_t *plat_arm_psci_override_pm_ops(plat_psci_ops_t *ops)
+ {
++    ops = &plat_arm_psci_pm_ops;
+ 	return ops;
+ }
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 833396e..2c9f326 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -14,6 +14,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files/corstone1000:"
 SRC_URI:append = " \
                  file://0001-Rename-Diphda-to-corstone1000.patch \
                  file://0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch \
+                 file://0003-corstone1000-implement-platform-specific-psci-reset.patch \
                  "
 
 TFA_DEBUG = "1"
-- 
2.17.1


