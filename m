Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EF5C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.51301.1638797143584989063
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 323126D;
	Mon,  6 Dec 2021 05:25:43 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC8493F73D;
	Mon,  6 Dec 2021 05:25:41 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH][HONISTER 13/13] kas: corstone1000: update SE binary sizes
Date: Mon,  6 Dec 2021 13:25:13 +0000
Message-Id: <20211206132513.20172-14-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2547

From: Satish Kumar <satish.kumar01@arm.com>

Update the size of bl2_signed.bin and tfm_s_signed.bin

Change-Id: I8312dd6d50faff53e1ca489cbf73c5f25671b21c
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 kas/corstone1000-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index cbca2c1..eb6d84c 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -31,7 +31,7 @@ repos:
 
   meta-arm-image:
      url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-image.git
-     refspec: CORSTONE-1000-2021.10.26
+     refspec: 4512b434d5cde8881473c4caa724a26cd517a604
 
 local_conf_header:
   base: |
-- 
2.17.1


