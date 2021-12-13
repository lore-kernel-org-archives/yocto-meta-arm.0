Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7CBC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 18:18:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14977.1639419498797551596
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 10:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6120E6D;
	Mon, 13 Dec 2021 10:18:18 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 631223F793;
	Mon, 13 Dec 2021 10:18:17 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 4/5] kas: corstone1000: update meta-arm-image SHA
Date: Mon, 13 Dec 2021 18:18:01 +0000
Message-Id: <20211213181802.13323-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213181802.13323-1-abdellatif.elkhlifi@arm.com>
References: <20211213181802.13323-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 18:18:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2668

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Aligning to the last meta-arm-image version to
add psa-arch-tests to the rootfs.

Change-Id: I40e945f814df4b6f7c30772d3dd6f91e6b6fcafc
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index eb6d84c..fc7271a 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -31,7 +31,7 @@ repos:
 
   meta-arm-image:
      url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-image.git
-     refspec: 4512b434d5cde8881473c4caa724a26cd517a604
+     refspec: aeb0571e8bc935f3f8b15c3b27ab4275e2069b5b
 
 local_conf_header:
   base: |
-- 
2.17.1


