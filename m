Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7453.1628600071263691174
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 05:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4501A11D4
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:30 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A2583F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:30 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm: remove support for hardknott and older
Date: Mon,  9 Aug 2021 19:05:12 -0400
Message-Id: <20210809230513.14521-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809230513.14521-1-jon.mason@arm.com>
References: <20210809230513.14521-1-jon.mason@arm.com>

No testing is being done against older branches.  Only have the
compatibility set to honister to prevent any issues.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-autonomy/conf/layer.conf | 2 +-
 meta-arm-bsp/conf/layer.conf      | 2 +-
 meta-arm/conf/layer.conf          | 2 +-
 meta-atp/conf/layer.conf          | 2 +-
 meta-gem5/conf/layer.conf         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 47aeee0..a77e802 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
    networking-layer \
    virtualization-layer \
 "
-LAYERSERIES_COMPAT_meta-arm-autonomy = "hardknott honister"
+LAYERSERIES_COMPAT_meta-arm-autonomy = "honister"
 
 # We don't activate virtualization feature from meta-virtualization as it
 # brings in lots of stuff we don't need. We need to disable the sanity check
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index d207930..f4306a6 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "hardknott honister"
+LAYERSERIES_COMPAT_meta-arm-bsp = "honister"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 4c3b58e..24d9091 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "hardknott honister"
+LAYERSERIES_COMPAT_meta-arm = "honister"
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
index 40c46c5..f749e4a 100644
--- a/meta-atp/conf/layer.conf
+++ b/meta-atp/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILE_COLLECTIONS += "meta-atp"
 BBFILE_PATTERN_meta-atp = "^${LAYERDIR}/"
 
 LAYERDEPENDS_meta-atp = "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp = "gatesgarth hardknott honister"
+LAYERSERIES_COMPAT_meta-atp = "honister"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 0ab704f..0b699b2 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 = "hardknott honister"
+LAYERSERIES_COMPAT_meta-gem5 = "honister"
 
 BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
-- 
2.17.1

