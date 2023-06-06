Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A837C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:40:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.155.1686062440943683963
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 07:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D653AB6;
	Tue,  6 Jun 2023 07:41:26 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C3DF43F6C4;
	Tue,  6 Jun 2023 07:40:39 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/u-boot: corstone1000: enable PSCI reset
Date: Tue,  6 Jun 2023 15:40:28 +0100
Message-Id: <20230606144028.52624-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230606144028.52624-1-emekcan.aras@arm.com>
References: <20230606144028.52624-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 14:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4734

From: Emekcan Aras <emekcan.aras@arm.com>

Even though corstone1000 platform does not support the entire PSCI APIs, it
relys on PSCI reset interface for system reset. The name of this config
changed in the new version of u-boot. This enables PSCI reset, so
the system can be resetted in u-boot again.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../0044-corstone1000-enable-psci-reset.patch | 30 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone1000-enable-psci-reset.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone1000-enable-psci-reset.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone1000-enable-psci-reset.patch
new file mode 100644
index 00000000..cb66d5a2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone1000-enable-psci-reset.patch
@@ -0,0 +1,30 @@
+From fc1e331fd3ba5a75791b3841c8876f2e1fda8da9 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 24 May 2023 09:12:11 +0100
+Subject: corstone1000: enable PSCI reset
+
+Even though corstone1000 does not implement entire PSCI APIs,it relies on 
+PSCI reset interface for the system reset. U-boot change the config name, so we
+need to enable it again.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ configs/corstone1000_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index b8d463f931..9f2ec97f0d 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -63,6 +63,7 @@ CONFIG_DM_RTC=y
+ CONFIG_RTC_EMULATION=y
+ CONFIG_DM_SERIAL=y
+ CONFIG_SYSRESET=y
++CONFIG_SYSRESET_PSCI=y
+ CONFIG_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_ERRNO_STR=y
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 6e68a421..d33f8c55 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -61,6 +61,7 @@ SRC_URI:append:corstone1000 = " \
         file://0041-nvmxip-move-header-to-include.patch				\
         file://0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch		\
         file://0043-corstone1000-boot-index-from-active.patch				\
+        file://0044-corstone1000-enable-psci-reset.patch                               \
         "
 
 #
-- 
2.17.1


