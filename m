Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EFBC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:23:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16285.1639077791375243799
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 11:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05DC0D6E;
	Thu,  9 Dec 2021 11:23:11 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D87FC3F73B;
	Thu,  9 Dec 2021 11:23:09 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 1/8] arm-bsp/optee-os: increase core heap size
Date: Thu,  9 Dec 2021 19:22:53 +0000
Message-Id: <20211209192300.29211-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
References: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 19:23:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2600

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to increase optee core heap size to 131072 bytes
from its default value to accomodate openAMP and smm-gateway

Change-Id: I40912334f59a50bb3baf853bb5ff4b01c3b23966
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...ne1000-increase-OPTEE-core-heap-size.patch | 29 +++++++++++++++++++
 .../optee/optee-os_corstone1000_common.inc    |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
new file mode 100644
index 0000000..42babb1
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 5fdf7792ead29784718d30d8a8a5383a994e2fef Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Thu, 2 Dec 2021 12:51:11 +0000
+Subject: [PATCH] plat-corstone1000: increase OPTEE core heap size
+
+This change is to increase optee core heap size to 131072
+from its default value to fit openAMP and smm-gateway
+in SEL0
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
+index 7a4aa13c..65d652a4 100644
+--- a/core/arch/arm/plat-corstone1000/conf.mk
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -31,6 +31,7 @@ CFG_DDR_SIZE ?= 0x80000000
+ CFG_DT_ADDR ?= 0x82100000
+ CFG_DTB_MAX_SIZE ?= 0x100000
+ 
++CFG_CORE_HEAP_SIZE ?= 131072
+ $(call force,CFG_PSCI_ARM64,y)
+ $(call force,CFG_DT,y)
+ $(call force,CFG_EXTERNAL_DTB_OVERLAY,y)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
index 9280d72..8a4cf1d 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
@@ -9,7 +9,9 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
 SRC_URI:append = " \
                   file://0001-plat-corstone1000-add-corstone1000-platform.patch \
                   file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch \
-                  file://0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch"
+                  file://0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch \
+		  file://0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch \
+		  "
 
 COMPATIBLE_MACHINE = "corstone1000"
 
-- 
2.17.1


