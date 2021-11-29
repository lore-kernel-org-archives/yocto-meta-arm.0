Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84516C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:58:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.64257.1638208682638342174
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 09:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136BB12FC;
	Mon, 29 Nov 2021 09:58:01 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBC9B3F5A1;
	Mon, 29 Nov 2021 09:57:59 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 01/10] arm-bsp/optee-os: add a rule in optee-os
 Makefile for secure partitions
Date: Mon, 29 Nov 2021 17:57:40 +0000
Message-Id: <20211129175749.10391-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
References: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 17:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2481

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to add a rule in optee-os Makefile to include
secure partitions as part of optee-os image

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Change-Id: I2f6f93ffca9a2332cbe9ffe4e9903b8ec524df51
---
 ...0-add-a-rule-in-Makefile-to-SP_MAKEF.patch | 38 +++++++++++++++++++
 .../optee/optee-os_corstone1000_common.inc    |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
new file mode 100644
index 0000000..9aec829
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 327290faefe16440c4975c9539b11d43c92bcf48 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Thu, 25 Nov 2021 06:20:48 +0000
+Subject: [PATCH] plat-corstone1000: add a rule in Makefile to SP_MAKEFILE_PATH
+
+This change is to provide an option to user to include
+secure manifest into optee-os Makefile so that the secure
+partition is part of optee-os image
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/Makefile b/Makefile
+index f6fcea8b..21722939 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,6 +18,16 @@ unexport MAKEFILE_LIST
+ # nonzero status). Useful since a few recipes use shell redirection.
+ .DELETE_ON_ERROR:
+ 
++# include secure partition make file and manifest file
++ifdef CFG_SP_MKFILE_PATH
++ifdef CFG_EMBED_DTB_SOURCE_FILE
++include $(CFG_SP_MKFILE_PATH)
++$(info Loading secure partitions manifest ${CFG_EMBED_DTB_SOURCE_FILE})
++CFG_EMBED_DTB_SOURCE_FILE :=${CFG_EMBED_DTB_SOURCE_FILE}
++OPTEE_OS_COMMON_EXTRA_FLAGS+=${CFG_EMBED_DTB_SOURCE_FILE}
++endif
++endif
++
+ include mk/checkconf.mk
+ 
+ .PHONY: all
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
index 423e968..9280d72 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
@@ -8,7 +8,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
 
 SRC_URI:append = " \
                   file://0001-plat-corstone1000-add-corstone1000-platform.patch \
-                  file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch"
+                  file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch \
+                  file://0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch"
 
 COMPATIBLE_MACHINE = "corstone1000"
 
-- 
2.17.1


