Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B00C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 03:16:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1736.1664507768635494588
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 20:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA56A15A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 20:16:14 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9F933F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 20:16:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] layers: convert to langdale compatibility
Date: Thu, 29 Sep 2022 23:16:02 -0400
Message-Id: <20220930031602.9986-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 03:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3880

Now that langdale is available, convert all kirkstone references to it.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 meta-atp/conf/layer.conf           | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index a1e22c06..3df56136 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "kirkstone"
+LAYERSERIES_COMPAT_meta-arm-bsp = "langdale"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 3cb8b064..f21fa6fb 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
+LAYERSERIES_COMPAT_arm-toolchain = "langdale"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index c23ea56f..af8c4cc3 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "kirkstone"
+LAYERSERIES_COMPAT_meta-arm = "langdale"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
index 3ec36e8c..191a8e85 100644
--- a/meta-atp/conf/layer.conf
+++ b/meta-atp/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILE_COLLECTIONS += "meta-atp"
 BBFILE_PATTERN_meta-atp = "^${LAYERDIR}/"
 
 LAYERDEPENDS_meta-atp = "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp = "kirkstone"
+LAYERSERIES_COMPAT_meta-atp = "langdale"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index d329bd04..1d129bca 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 = "kirkstone"
+LAYERSERIES_COMPAT_meta-gem5 = "langdale"
 
 BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
-- 
2.17.1


