Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70E4C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 18:53:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2473.1659984804380722541
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 11:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B9A7ED1
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Aug 2022 11:53:24 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C17533F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Aug 2022 11:53:23 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] gem5: add meta-arm-bsp dependency
Date: Tue,  2 Aug 2022 11:56:20 -0400
Message-Id: <20220802155620.31970-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 18:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3653

meta-gem5 needs the 5.4 kernel, which is only present in the
meta-arm-bsp layer.  Add this as a dependency to resolve issues.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index d329bd04..3affe251 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-gem5"
 BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
-LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
+LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm meta-arm-bsp"
 LAYERSERIES_COMPAT_meta-gem5 = "kirkstone"
 
 BBFILES_DYNAMIC += " \
-- 
2.17.1


