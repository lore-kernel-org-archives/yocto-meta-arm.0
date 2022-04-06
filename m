Return-Path: <satish.kumar01@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D63EC35296
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6303.1649234927144869056
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 01:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: satish.kumar01@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95FB21424;
	Wed,  6 Apr 2022 01:48:46 -0700 (PDT)
Received: from e124072.arm.com (unknown [10.57.43.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4DDE3F718;
	Wed,  6 Apr 2022 01:48:45 -0700 (PDT)
From: satish.kumar01@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 1/1] kas/corstone1000.yml: refspec update for run-scripts
Date: Wed,  6 Apr 2022 09:48:34 +0100
Message-Id: <20220406084834.16517-2-satish.kumar01@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220406084834.16517-1-satish.kumar01@arm.com>
References: <20220406084834.16517-1-satish.kumar01@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3243

From: Satish Kumar <satish.kumar01@arm.com>

Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 kas/corstone1000-fvp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index b7c9fd1..3b0bbca 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -6,7 +6,7 @@ header:
 repos:
   run-scripts:
      url: https://git.gitlab.arm.com/arm-reference-solutions/model-scripts.git
-     refspec: 7ad7b6f33bbdb7ae10c7ecfd56820c03a71e9bdf
+     refspec: b40b4227fe6b6fc8e4b688db8928f4be76e94eb7
      layers:
       .: 'excluded'
 
-- 
2.17.1


