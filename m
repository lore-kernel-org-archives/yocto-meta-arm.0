Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8B7C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:50:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.26751.1653306643691100414
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 04:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0975D1063;
	Mon, 23 May 2022 04:50:43 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.9.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBA9E3F73D;
	Mon, 23 May 2022 04:50:41 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH kirkstone 1/2] kas: corstone1000: set HEADs to kirkstone and
 drop use of meta-arm-image
Date: Mon, 23 May 2022 12:50:29 +0100
Message-Id: <20220523115030.5235-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523115030.5235-1-abdellatif.elkhlifi@arm.com>
References: <20220523115030.5235-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 11:50:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3452

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Align all repos to kirkstone stable branch HEAD

meta-arm-image is no longer supported on master and should be dropped
in kirkstone as well.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 181ae8ba..9345f55c 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,7 +5,7 @@ distro: poky-tiny
 
 defaults:
   repos:
-    refspec: master
+    refspec: kirkstone
 
 repos:
   meta-arm:
@@ -16,7 +16,6 @@ repos:
 
   poky:
     url: https://git.yoctoproject.org/git/poky
-    refspec: master
     layers:
       meta:
       meta-poky:
@@ -24,15 +23,10 @@ repos:
 
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    refspec: master
     layers:
       meta-oe:
       meta-python:
 
-  meta-arm-image:
-     url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-image.git
-     refspec: e075959fd718bc3dcedf68965eb9f9205b88d5d0
-
 local_conf_header:
   base: |
     CONF_VERSION = "2"
-- 
2.17.1


