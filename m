Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD0AC4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1935.1639591472354459070
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 10:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06D461435;
	Wed, 15 Dec 2021 10:04:32 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D83323F5A1;
	Wed, 15 Dec 2021 10:04:30 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH honister 1/1] kas: corstone1000: update the FVP script repo
 SHA
Date: Wed, 15 Dec 2021 18:04:15 +0000
Message-Id: <20211215180415.9537-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211215180415.9537-1-abdellatif.elkhlifi@arm.com>
References: <20211215180415.9537-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2723

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Setting the model script SHA to use the right FVP
options.

Change-Id: I7f92fb97466bf4f5f48b8d184a396bf87bdeb401
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-fvp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index 2ea7fdc..f440197 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -6,7 +6,7 @@ header:
 repos:
   run-scripts:
      url: https://git.gitlab.arm.com/arm-reference-solutions/model-scripts.git
-     refspec: CORSTONE-1000-2021.10.26
+     refspec: 7ad7b6f33bbdb7ae10c7ecfd56820c03a71e9bdf
      layers:
       .: 'excluded'
 
-- 
2.17.1


