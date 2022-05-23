Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513B2C4332F
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:44:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.26466.1653306285469094463
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 04:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D8B1063;
	Mon, 23 May 2022 04:44:44 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.9.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5E403F73D;
	Mon, 23 May 2022 04:44:42 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH 1/2] kas: corstone1000: drop use of meta-arm-image
Date: Mon, 23 May 2022 12:44:30 +0100
Message-Id: <20220523114431.2483-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523114431.2483-1-abdellatif.elkhlifi@arm.com>
References: <20220523114431.2483-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 11:44:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3449

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

meta-arm-image is no longer supported.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 64e3aaf1..21e5280a 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -29,10 +29,6 @@ repos:
       meta-oe:
       meta-python:
 
-  meta-arm-image:
-     url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-image.git
-     refspec: 9f611833ef58394b707836d69356c4e27d0265fc 
-
 local_conf_header:
   base: |
     CONF_VERSION = "2"
-- 
2.17.1


