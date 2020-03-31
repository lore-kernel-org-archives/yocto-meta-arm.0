Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4634.1585684642138615747
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 12:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 812DF40C1F;
	Tue, 31 Mar 2020 19:57:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1N0nrsw4yUE; Tue, 31 Mar 2020 19:57:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6AE3C40BEF;
	Tue, 31 Mar 2020 19:57:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 14A591718F4;
	Tue, 31 Mar 2020 15:57:20 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
Date: Tue, 31 Mar 2020 15:57:17 -0400
Message-Id: <1585684637-53492-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 3 +--
 meta-arm/conf/layer.conf           | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 0632ba3..8afcbe5 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "6"
 
 LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
+LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
 
 # We have patches for xen but meta-virtualization might not be there so filter
 # out recipes-extended/xen unless xen is activated in the features
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index a247dc1..3a4c4f0 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -8,8 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
 BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "30"
 
-LAYERSERIES_COMPAT_arm-toolchain = "zeus"
+LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
 
 # do not error out on bbappends for missing recipes
 BB_DANGLINGAPPENDS_WARNONLY = "true"
-
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 65ccd15..0b93e8d 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm = "6"
 
 LAYERDEPENDS_meta-arm = "core"
-LAYERSERIES_COMPAT_meta-arm = "warrior zeus"
+LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
-- 
2.7.4

