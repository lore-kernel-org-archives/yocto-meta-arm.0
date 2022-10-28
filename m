Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B914ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:39:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.955.1666971572983652925
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 08:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D34C01FB;
	Fri, 28 Oct 2022 08:39:38 -0700 (PDT)
Received: from e121910.cambridge.arm.com (e121910.cambridge.arm.com [10.1.38.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23B403F534;
	Fri, 28 Oct 2022 08:39:30 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH langdale] kas: corstone1000: set branches to langdale
Date: Fri, 28 Oct 2022 16:39:22 +0100
Message-Id: <20221028153922.16996-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 15:39:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4059

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

point poky/meta-openembedded to langdale

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 21e5280a..5fe7f4da 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,7 +5,7 @@ distro: poky-tiny
 
 defaults:
   repos:
-    refspec: master
+    refspec: langdale
 
 repos:
   meta-arm:
@@ -16,7 +16,6 @@ repos:
 
   poky:
     url: https://git.yoctoproject.org/git/poky
-    refspec: master
     layers:
       meta:
       meta-poky:
@@ -24,7 +23,6 @@ repos:
 
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    refspec: master
     layers:
       meta-oe:
       meta-python:
-- 
2.17.1


