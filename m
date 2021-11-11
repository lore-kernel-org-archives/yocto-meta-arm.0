Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813ACC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 14:30:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77.1636641043857849323
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 06:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D6C0ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 06:30:33 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61E023F70D
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 06:30:33 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: remove unnecessary "+="
Date: Wed, 10 Nov 2021 19:30:58 -0500
Message-Id: <20211111003058.31126-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 14:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2365

Seeing error of
WARNING: ZEPHYRTESTS:remove += is not a recommended operator combination, please replace it.

Correcting the issue by changing it accordingly.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/qemu-cortex-a53.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/qemu-cortex-a53.yml b/ci/qemu-cortex-a53.yml
index fcecfc8..536dcda 100644
--- a/ci/qemu-cortex-a53.yml
+++ b/ci/qemu-cortex-a53.yml
@@ -6,7 +6,7 @@ header:
 
 local_conf_header:
   nonbuilding_tests: |
-    ZEPHYRTESTS:remove += "common device poll queue sleep"
+    ZEPHYRTESTS:remove = "common device poll queue sleep"
 
 machine: qemu-cortex-a53
 
-- 
2.17.1


