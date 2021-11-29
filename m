Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41448C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 12:49:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.60001.1638190170791445784
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 04:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C8B8113E;
	Mon, 29 Nov 2021 04:49:30 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC2403F766;
	Mon, 29 Nov 2021 04:49:28 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	"Arpita S.K" <Arpita.S.K@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 1/5] arm-bsp/machine: introducing corstone1000 MPS3
 machine
Date: Mon, 29 Nov 2021 12:49:11 +0000
Message-Id: <20211129124915.23058-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
References: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 12:49:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2466

From: "Arpita S.K" <Arpita.S.K@arm.com>

This commit adds the corstone1000-mps3 machine.

Change-Id: I99f657574a693527d7763cb4cc9b0b05218bb316
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .gitlab-ci.yml                                   |  3 +++
 ci/corstone1000-mps3.yml                         | 12 ++++++++++++
 kas/corstone1000-mps3.yml                        |  6 ++++++
 meta-arm-bsp/conf/layer.conf                     |  2 +-
 meta-arm-bsp/conf/machine/corstone1000-mps3.conf |  9 +++++++++
 5 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 ci/corstone1000-mps3.yml
 create mode 100644 kas/corstone1000-mps3.yml
 create mode 100644 meta-arm-bsp/conf/machine/corstone1000-mps3.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 78f3373..dde03ac 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -112,6 +112,9 @@ corstone700-mps3:
 corstone1000-fvp:
   extends: .build
 
+corstone1000-mps3:
+  extends: .build
+
 fvp-base/testimage:
   extends: .build
   tags:
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


