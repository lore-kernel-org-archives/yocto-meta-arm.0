Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8981.1603208225430264115
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 08:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 952761FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 08:37:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78F213F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 08:37:00 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] Drop dunfell support
Date: Fri, 16 Oct 2020 22:41:24 -0400
Message-Id: <20201017024126.28986-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Drop dunfell support from the master branch in anticipation of the
gatestgarth release.  All dunfell users should reference the dunfell
branch.

Change-Id: I9c5806f698cca42773aaea1fb49e0dfff437eaf4
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-autonomy/conf/layer.conf  | 2 +-
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 5a439e2..936b6c1 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
    openembedded-layer \
    virtualization-layer \
 "
-LAYERSERIES_COMPAT_meta-arm-autonomy = "dunfell gatesgarth"
+LAYERSERIES_COMPAT_meta-arm-autonomy = "gatesgarth"
 
 # We don't activate virtualization feature from meta-virtualization as it
 # brings in lots of stuff we don't need. We need to disable the sanity check
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 816ff9d..4de1bfa 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "6"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
-LAYERSERIES_COMPAT_meta-arm-bsp = "dunfell gatesgarth"
+LAYERSERIES_COMPAT_meta-arm-bsp = "gatesgarth"
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 6ab98af..d0ca75a 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_arm-toolchain = "30"
 LICENSE_PATH += "${LAYERDIR}/custom-licenses"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "dunfell gatesgarth"
+LAYERSERIES_COMPAT_arm-toolchain = "gatesgarth"
 
 # do not error out on bbappends for missing recipes
 BB_DANGLINGAPPENDS_WARNONLY = "true"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index d53c40a..9649738 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "dunfell gatesgarth"
+LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 439444c..58242c3 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "6"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer"
-LAYERSERIES_COMPAT_meta-gem5 = "dunfell gatesgarth"
+LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
-- 
2.17.1

