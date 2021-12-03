Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9263DC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:29:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10943.1638534557138087658
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 04:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD0EE1477;
	Fri,  3 Dec 2021 04:29:16 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 684763F5A1;
	Fri,  3 Dec 2021 04:29:15 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 03/11] arm-bsp/u-boot: corstone1000: Enable PSCI Reset
Date: Fri,  3 Dec 2021 12:28:53 +0000
Message-Id: <20211203122901.3549-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
References: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 12:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2514

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit enables PSCI Reset for corstone1000 platform. It configures
u-boot to use PSCI interfaces in efi_reset_system function.

Change-Id: I88ea55fde2b2c6e455a4b38e885e62a410b0b0e7
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...9-corstone1000-set-CONFIG_PSCI_RESET.patch | 27 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone1000-set-CONFIG_PSCI_RESET.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone1000-set-CONFIG_PSCI_RESET.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone1000-set-CONFIG_PSCI_RESET.patch
new file mode 100644
index 0000000..79068fa
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone1000-set-CONFIG_PSCI_RESET.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 8b85cddde48f31266349277980a65d25dfae302e Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 17 Nov 2021 18:48:35 +0000
+Subject: [PATCH] corstone1000: set CONFIG_PSCI_RESET
+
+set CONFIG_PSCI_RESET to allow efi_reset_system API to use PSCI.
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+---
+ configs/corstone1000_defconfig | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index b59b75df3e..55f93b0a2c 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -64,3 +64,5 @@ CONFIG_CMD_RTC=y
+ CONFIG_EFI_GET_TIME=y
+ CONFIG_EFI_SET_TIME=y
+ CONFIG_RTC_EMULATION=y
++CONFIG_PSCI_RESET=y
++
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index a3a32a8..4910dea 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -38,7 +38,8 @@ SRC_URI:append:corstone1000 = " \
       file://0026-corstone1000-Disable-set-get-of-NV-variables.patch \
       file://0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch \
       file://0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch \
-     "
+      file://0029-corstone1000-set-CONFIG_PSCI_RESET.patch \
+      "
 
 #
 # FVP BASE
-- 
2.17.1


