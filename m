Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345B1C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 04:13:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22207.1644380007483375616
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 20:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 147E5ED1
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Feb 2022 20:13:26 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECC5A3F718
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Feb 2022 20:13:25 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: space clean-up
Date: Tue,  8 Feb 2022 23:13:15 -0500
Message-Id: <20220209041315.13812-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 04:13:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2962

Add a space between "Submitted" and URL

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch  | 2 +-
 ...005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
index e3bc571..1579a63 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
@@ -3,7 +3,7 @@ From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Tue, 2 May 2017 11:12:43 +0100
 Subject: [PATCH 3/8] mailbox: arm_mhu: migrate to threaded irq handler
 
-Upstream-Status: Submitted[https://patchwork.kernel.org/patch/10970345]
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970345]
 
 In preparation to introduce support for doorbells which require the
 interrupt handlers to be threaded, this patch moves the existing
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
index 0bc2eb3..8afed21 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
@@ -3,7 +3,7 @@ From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Tue, 2 May 2017 12:07:28 +0100
 Subject: [PATCH 5/8] mailbox: arm_mhu: add full support for the doorbells
 
-Upstream-Status: Submitted[https://patchwork.kernel.org/patch/10970349]
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970349]
 
 We now have the basic infrastructure and binding to support doorbells
 on ARM MHU controller.
-- 
2.17.1


