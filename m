Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F99C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:50:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.26541.1653306645063044336
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 04:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4C9139F;
	Mon, 23 May 2022 04:50:44 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.9.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784733F73D;
	Mon, 23 May 2022 04:50:43 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH kirkstone 2/2] kas: corstone1000: drop the use of the FVP
 script
Date: Mon, 23 May 2022 12:50:30 +0100
Message-Id: <20220523115030.5235-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523115030.5235-1-abdellatif.elkhlifi@arm.com>
References: <20220523115030.5235-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 11:50:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3453

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

FVP script is replaced with the runfvp command.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-fvp.yml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index 3b0bbcaf..d0d10a73 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -3,13 +3,6 @@ header:
   includes:
     - kas/corstone1000-base.yml
 
-repos:
-  run-scripts:
-     url: https://git.gitlab.arm.com/arm-reference-solutions/model-scripts.git
-     refspec: b40b4227fe6b6fc8e4b688db8928f4be76e94eb7
-     layers:
-      .: 'excluded'
-
 machine: corstone1000-fvp
 
 local_conf_header:
-- 
2.17.1


