Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1869DC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.51281.1638797137386869310
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F375A1042;
	Mon,  6 Dec 2021 05:25:36 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 107C53F73D;
	Mon,  6 Dec 2021 05:25:35 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH][HONISTER 09/13] arm-bsp/trusted-firmware-a: patch to change
 flash base address of FIP
Date: Mon,  6 Dec 2021 13:25:09 +0000
Message-Id: <20211206132513.20172-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2543

From: Satish Kumar <satish.kumar01@arm.com>

More space in the flash is reserved up front for metadata
parser and UEFI variables. That requires change in the flash
base address of where images are present.

Change-Id: If6c048a6117023aae2e748c23ed52447857b0d04
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...change-base-address-of-FIP-in-the-fl.patch | 33 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch
new file mode 100644
index 0000000..825c3ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 5541d466ebf46f0a14fae3effbcc46bcc2dd8efc Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 20 Sep 2021 06:01:54 +0100
+Subject: [PATCH 1/1] plat/arm: corstone1000: change base address of FIP in the flash
+
+More space in the flash is reserved up front for metadata
+parser and UEFI variables. That requires change in the flash
+base address of where images are present.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ plat/arm/board/corstone1000/common/include/platform_def.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b/plat/arm/board/corstone1000/common/include/platform_def.h
+index 97d7b2974..079b1c9d4 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -208,7 +208,7 @@
+ 
+ /* NOR Flash */
+ 
+-#define PLAT_ARM_FIP_BASE			UL(0x08131000)
++#define PLAT_ARM_FIP_BASE			UL(0x081EF000)
+ #define PLAT_ARM_FIP_MAX_SIZE			UL(0x1ff000)  /* 1.996 MB */
+ 
+ #define PLAT_ARM_NVM_BASE			V2M_FLASH0_BASE
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 2c9f326..6bb089d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -15,6 +15,7 @@ SRC_URI:append = " \
                  file://0001-Rename-Diphda-to-corstone1000.patch \
                  file://0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch \
                  file://0003-corstone1000-implement-platform-specific-psci-reset.patch \
+                 file://0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch   \
                  "
 
 TFA_DEBUG = "1"
-- 
2.17.1


