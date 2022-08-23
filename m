Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBD4C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 19:14:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2099.1661282084908682095
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 12:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CDAA113E
	for <meta-arm@lists.yoctoproject.org>; Tue, 23 Aug 2022 12:14:48 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 573BB3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 23 Aug 2022 12:14:44 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/arm-bsp: Add yocto-kernel-cache bluetooth support
Date: Tue, 23 Aug 2022 15:14:39 -0400
Message-Id: <20220823191439.3416-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Aug 2022 19:14:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3712

Add yocto kernel cache bluetooth entries for platforms that have that
machine feature enabled.  This is necessary, as kernel warnings about it
not being enabled are now occurring.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/juno.scc         | 1 +
 .../linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno.scc
index 2980b393..240ecf5e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno.scc
@@ -1,5 +1,6 @@
 include features/input/input.scc
 include features/net/net.scc
+include features/bluetooth/bluetooth.scc
 include cfg/timer/no_hz.scc
 include cfg/usb-mass-storage.scc
 
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc b/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc
index 21bff023..70364769 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-kmeta/generic-arm64-standard.scc
@@ -3,3 +3,4 @@ define KTYPE standard
 define KARCH arm64
 
 include ktypes/standard/standard.scc
+include features/bluetooth/bluetooth.scc
-- 
2.17.1


