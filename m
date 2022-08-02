Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD216C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 18:58:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2540.1659985118659313755
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 11:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E4EDED1
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Aug 2022 11:58:38 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2E0B3F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Aug 2022 11:58:37 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH honister] gem5: add meta-arm-bsp dependency
Date: Tue,  2 Aug 2022 12:01:21 -0400
Message-Id: <20220802160121.32301-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 18:58:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3655

meta-gem5 needs the 5.4 kernel, which is only present in the
meta-arm-bsp layer.  Add this as a dependency to resolve issues.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 0b699b27..5648941d 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-gem5"
 BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
-LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
+LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm meta-arm-bsp"
 LAYERSERIES_COMPAT_meta-gem5 = "honister"
 
 BBFILES_DYNAMIC += " \
-- 
2.17.1


