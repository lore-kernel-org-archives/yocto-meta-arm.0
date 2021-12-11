Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADC9C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20073.1639216963078503312
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B40781396;
	Sat, 11 Dec 2021 02:02:42 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9E863F73D;
	Sat, 11 Dec 2021 02:02:41 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 4/7] arm-bsp/optee-os: cherry pick fixes from upstream
 integration branch
Date: Sat, 11 Dec 2021 10:02:23 +0000
Message-Id: <20211211100226.17180-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
References: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:02:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2619

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to fix missing error check during sp init
and add support for defining memory regions

Change-Id: I381ff9805288590809471494bdff5e7f62232f7c
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...d-missing-error-check-during-SP-init.patch | 40 +++++++++++++++++++
 .../optee/optee-os_corstone1000_common.inc    |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
new file mode 100644
index 0000000..852067b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 4617f85b70c7e4206b244f3eaffdc62ac3744a17 Mon Sep 17 00:00:00 2001
+From: Jelle Sels <jelle.sels@arm.com>
+Date: Mon, 10 May 2021 11:37:23 +0200
+Subject: [PATCH] Fix: add missing error check during SP init
+
+Error checking during SP initialization (sp_init_uuid()) was lacking.
+As a result an out of CORE HEAP situation resulted in a panic. This was
+due to lack of memory in the inflate() function of zlib.
+
+Signed-off-by: Jelle Sels <jelle.sels@arm.com>
+Change-Id: I287e2e2dd507feb45991b32ed264b3b6ad6fcd39
+
+diff --git a/core/arch/arm/kernel/sp.c b/core/arch/arm/kernel/sp.c
+index 4acbc2e2..23532a01 100644
+--- a/core/arch/arm/kernel/sp.c
++++ b/core/arch/arm/kernel/sp.c
+@@ -383,10 +383,14 @@ static TEE_Result __attribute__((unused)) sp_init_uuid(const TEE_UUID *uuid)
+ 				  cancel_req_to,
+ 				  &param);
+ 
+-	args.a0 = sp_get_session(sess->id)->sp_regs.x[0];
+-	sp_thread(sess->id, FFA_NW_ID, &args);
++	if (res == TEE_SUCCESS) {
++		args.a0 = sp_get_session(sess->id)->sp_regs.x[0];
++		sp_thread(sess->id, FFA_NW_ID, &args);
+ 
+-	thread_spmc_msg_recv(&args, sess->id);
++		thread_spmc_msg_recv(&args, sess->id);
++	} else {
++		EMSG("SP initialization failed, try increasing CFG_CORE_HEAP_SIZE");
++	}
+ 
+ 	return res;
+ }
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
index 8a4cf1d..6e81316 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
@@ -11,7 +11,8 @@ SRC_URI:append = " \
                   file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch \
                   file://0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch \
 		  file://0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch \
-		  "
+                  file://0005-Fix-add-missing-error-check-during-SP-init.patch \
+                   "
 
 COMPATIBLE_MACHINE = "corstone1000"
 
-- 
2.17.1


