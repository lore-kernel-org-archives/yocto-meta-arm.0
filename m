Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC89C433FE
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 16:52:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14501.1637859120050410095
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 08:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77EDE113E;
	Thu, 25 Nov 2021 08:51:59 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.79.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDEF83F73B;
	Thu, 25 Nov 2021 08:51:57 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	vishnu.banavath@arm.com
Cc: nd@arm.com,
	"Arpita S.K" <Arpita.S.K@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/5] arm-bsp/machine: introducing corstone1000 MPS3 machine
Date: Thu, 25 Nov 2021 16:51:43 +0000
Message-Id: <20211125165147.25286-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125165147.25286-1-abdellatif.elkhlifi@arm.com>
References: <20211125165147.25286-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2451

From: "Arpita S.K" <Arpita.S.K@arm.com>

This commit adds the corstone1000-mps3 machine.

Change-Id: I99f657574a693527d7763cb4cc9b0b05218bb316
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .gitlab-ci.yml                                   |  3 +++
 ci/corstone1000-mps3.yml                         | 12 ++++++++++++
 kas/corstone1000-base.yml                        |  5 ++---
 kas/corstone1000-mps3.yml                        |  6 ++++++
 meta-arm-bsp/conf/layer.conf                     |  2 +-
 meta-arm-bsp/conf/machine/corstone1000-mps3.conf |  9 +++++++++
 6 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 ci/corstone1000-mps3.yml
 create mode 100644 kas/corstone1000-mps3.yml
 create mode 100644 meta-arm-bsp/conf/machine/corstone1000-mps3.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e2d000a..be522fc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -102,6 +102,9 @@ corstone700-mps3:
 corstone1000-fvp:
   extends: .build
 
+corstone1000-mps3:
+  extends: .build
+
 fvp-base:
   extends: .build
   parallel:
diff --git a/ci/corstone1000-mps3.yml b/ci/corstone1000-mps3.yml
new file mode 100644
index 0000000..fc06440
--- /dev/null
+++ b/ci/corstone1000-mps3.yml
@@ -0,0 +1,12 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-openembedded.yml
+
+local_conf_header:
+    custom-local-conf: |
+        INITRAMFS_IMAGE_BUNDLE = "0"
+        INITRAMFS_IMAGE:remove = "corstone1000-initramfs-image"
+
+machine: corstone1000-mps3
diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 0cf9401..36b08e7 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -16,7 +16,7 @@ repos:
 
   poky:
     url: https://git.yoctoproject.org/git/poky
-    refspec: honister
+    refspec: master
     layers:
       meta:
       meta-poky:
@@ -24,7 +24,7 @@ repos:
 
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    refspec: f16efc00b7fcdbfa8c53e35c1fcebed5c06d975e
+    refspec: master
     layers:
       meta-oe:
       meta-python:
@@ -40,7 +40,6 @@ local_conf_header:
     LICENSE_FLAGS_WHITELIST += "armcompiler"
     BB_NUMBER_THREADS ?= "16"
     PARALLEL_MAKE ?= "-j16"
-    INHERIT += "rm_work"
     PACKAGECONFIG:append:pn-perf = " coresight"
 
 machine: unset
diff --git a/kas/corstone1000-mps3.yml b/kas/corstone1000-mps3.yml
new file mode 100644
index 0000000..06e5962
--- /dev/null
+++ b/kas/corstone1000-mps3.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - corstone1000-base.yml
+
+machine: corstone1000-mps3
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 954e5d8..7af156e 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERSERIES_COMPAT_meta-arm-bsp = "honister"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
-LAYERDEPENDS_meta-arm-bsp:append:corstone1000 = " meta-python"
+LAYERDEPENDS_meta-arm-bsp:append:corstone1000 = " meta-python openembedded-layer"
 LAYERDEPENDS_meta-arm-bsp:append:musca-b1 = " meta-python"
 LAYERDEPENDS_meta-arm-bsp:append:musca-s1 = " meta-python"
 
diff --git a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf b/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
new file mode 100644
index 0000000..88f3d9d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
@@ -0,0 +1,9 @@
+#@TYPE: Machine
+#@NAME: corstone1000-mps3 machine
+#@DESCRIPTION: Machine configuration for Corstone1000 64-bit MPS3 FPGA board
+
+require conf/machine/include/corstone1000.inc
+
+TFA_TARGET_PLATFORM = "fpga"
+
+PLATFORM_IS_FVP = "FALSE"
-- 
2.17.1


