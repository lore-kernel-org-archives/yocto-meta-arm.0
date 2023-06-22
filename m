Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519BEEB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:16:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11054.1687439799863431740
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 06:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A0671042;
	Thu, 22 Jun 2023 06:17:23 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B6F93F64C;
	Thu, 22 Jun 2023 06:16:38 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH MICKLEDORE 2/7] arm-bsp/u-boot: corstone1000: Enable EFI set/get time services
Date: Thu, 22 Jun 2023 14:16:23 +0100
Message-Id: <20230622131628.11573-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622131628.11573-1-emekcan.aras@arm.com>
References: <20230622131628.11573-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 13:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4827

From: Emekcan Aras <emekcan.aras@arm.com>

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch adds the required configs to the corstone1000 u-boot
defconfig to enable the EFI services. This is done to fix the SCT
failure reported by the SetTime_Conf and SetTime_Func.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...042-Enable-EFI-set-get-time-services.patch | 32 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Enable-EFI-set-get-time-services.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Enable-EFI-set-get-time-services.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Enable-EFI-set-get-time-services.patch
new file mode 100644
index 00000000..8911abfe
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Enable-EFI-set-get-time-services.patch
@@ -0,0 +1,32 @@
+From 9f326f0db8aa13fde93e2ed79055b920c8598a28 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Mon, 12 Jun 2023 15:14:52 +0000
+Subject: [PATCH] Enable EFI set/get time services
+
+SetTime_Conf and SetTime_Func tests in UEFI SCT test suite of ACS
+fails with unsupported return value. CONFIG_EFI_SET_TIME and
+CONFIG_EFI_GET_TIME config values are added to enable these EFI
+services.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+---
+ configs/corstone1000_defconfig | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index c692cc91bd..f1901dfe8b 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -7,6 +7,8 @@ CONFIG_NR_DRAM_BANKS=1
+ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
+ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x83f00000
+ CONFIG_DM_GPIO=y
++CONFIG_EFI_SET_TIME=y
++CONFIG_EFI_GET_TIME=y
+ CONFIG_DEFAULT_DEVICE_TREE="corstone1000-mps3"
+ CONFIG_SYS_PROMPT="corstone1000# "
+ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 3899fc14..fc51aead 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -58,7 +58,8 @@ SRC_URI:append:corstone1000 = " \
         file://0038-nvmxip-move-header-to-include.patch					  \ 
         file://0039-corstone1000-set-kernel_addr-based-on-boot_idx.patch		  \ 
         file://0040-corstone1000-boot-index-from-active.patch				  \ 
-        file://0041-corstone1000-enable-PSCI-reset.patch				  \ 
+        file://0041-corstone1000-enable-PSCI-reset.patch				  \
+        file://0042-Enable-EFI-set-get-time-services.patch                                \ 
         "
 
 #
-- 
2.17.1


