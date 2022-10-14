Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B16C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 12:12:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6503.1665749558711900135
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 05:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BF741424;
	Fri, 14 Oct 2022 05:12:44 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 337AF3F792;
	Fri, 14 Oct 2022 05:12:37 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/kernel: Fix TEE driver bug for corstone1000
Date: Fri, 14 Oct 2022 13:12:30 +0100
Message-Id: <20221014121230.16045-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221014121230.16045-1-emekcan.aras@arm.com>
References: <20221014121230.16045-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 12:12:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3969

From: Emekcan <emekcan.aras@arm.com>

Fixes the Tee driver bug in corstone1000. It adds a
delay to fix a possible race-condition occurs during
FF-A calls. This is a temporary fix for the upcoming
release.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...dds-workaround-for-cs1k-specific-bug.patch | 41 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-workaround-for-cs1k-specific-bug.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-workaround-for-cs1k-specific-bug.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-workaround-for-cs1k-specific-bug.patch
new file mode 100644
index 00000000..5cd8e4b0
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-workaround-for-cs1k-specific-bug.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Inappropriate[Temporary bugfix]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+From f1a869ea986305a6fb20f3c770c11778a898b86d Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Thu, 13 Oct 2022 20:53:42 +0100
+Subject: [PATCH] Adds workaround for cs1k specific bug
+
+Adds a temporary workaround to solve a possible
+race-conditioning issue in the tee driver
+for corstone1000.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ drivers/firmware/arm_ffa/driver.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
+index ec731e9e942b..2a3ef649935e 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -32,6 +32,7 @@
+ #include <linux/scatterlist.h>
+ #include <linux/slab.h>
+ #include <linux/uuid.h>
++#include <linux/delay.h>
+ 
+ #include "common.h"
+ 
+@@ -344,7 +345,7 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32bit,
+ {
+ 	u32 req_id, resp_id, src_dst_ids = PACK_TARGET_INFO(src_id, dst_id);
+ 	ffa_value_t ret;
+-
++	msleep(1);
+ 	if (mode_32bit) {
+ 		req_id = FFA_MSG_SEND_DIRECT_REQ;
+ 		resp_id = FFA_MSG_SEND_DIRECT_RESP;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index d0740bcd..34a40907 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -49,6 +49,7 @@ SRC_URI:append:corstone1000 = " \
            file://0003-Add-rpmsg-driver-for-corstone1000.patch \
            file://0004-rpmsg-arm-fix-return-value.patch \
            file://0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch \
+           file://0006-Adds-workaround-for-cs1k-specific-bug.patch \
         "
 
 SRC_URI:append:corstone1000 = " ${@bb.utils.contains('MACHINE_FEATURES', \
-- 
2.17.1


