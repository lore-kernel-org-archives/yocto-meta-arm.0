Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0727FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 13:53:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6761.1666878828481140665
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 06:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0372C23A
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 06:53:54 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E3EC3F7B4
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 06:53:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: add Mickledore to layer compat string
Date: Thu, 27 Oct 2022 09:53:41 -0400
Message-Id: <20221027135341.20393-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 13:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4050

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 meta-atp/conf/layer.conf           | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 3df56136..75efe546 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "langdale"
+LAYERSERIES_COMPAT_meta-arm-bsp = "langdale mickledore"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index f21fa6fb..bb37cd06 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "langdale"
+LAYERSERIES_COMPAT_arm-toolchain = "langdale mickledore"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index af8c4cc3..68d8c562 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "langdale"
+LAYERSERIES_COMPAT_meta-arm = "langdale mickledore"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
index 191a8e85..8e48b26f 100644
--- a/meta-atp/conf/layer.conf
+++ b/meta-atp/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILE_COLLECTIONS += "meta-atp"
 BBFILE_PATTERN_meta-atp = "^${LAYERDIR}/"
 
 LAYERDEPENDS_meta-atp = "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp = "langdale"
+LAYERSERIES_COMPAT_meta-atp = "langdale mickledore"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 1d129bca..db378b38 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 = "langdale"
+LAYERSERIES_COMPAT_meta-gem5 = "langdale mickledore"
 
 BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
-- 
2.17.1


