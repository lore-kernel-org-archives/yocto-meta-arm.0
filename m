Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE9C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 23:56:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4913.1664841358661160540
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 16:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4FF811FB
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Oct 2022 16:56:03 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F25783F67D
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Oct 2022 16:55:56 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: apply a patch so that meta-zephyr is compatible with
 langdale
Date: Mon,  3 Oct 2022 18:18:48 -0400
Message-Id: <20221003221848.26450-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 23:56:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3913

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 0001-layers-add-langdale-compatibility.patch | 42 ++++++++++++++++++++
 ci/meta-zephyr.yml                           |  4 ++
 2 files changed, 46 insertions(+)
 create mode 100644 0001-layers-add-langdale-compatibility.patch

diff --git a/0001-layers-add-langdale-compatibility.patch b/0001-layers-add-langdale-compatibility.patch
new file mode 100644
index 00000000..034864e0
--- /dev/null
+++ b/0001-layers-add-langdale-compatibility.patch
@@ -0,0 +1,42 @@
+From 6eb21b8c40daa9049c68787b0e6ed841e8f2d07c Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Thu, 29 Sep 2022 18:09:02 -0400
+Subject: [PATCH] layers: add langdale compatibility
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ meta-zephyr-bsp/conf/layer.conf  | 4 ++--
+ meta-zephyr-core/conf/layer.conf | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/meta-zephyr-bsp/conf/layer.conf b/meta-zephyr-bsp/conf/layer.conf
+index 507374f206b0..cbbaafe2a8dc 100644
+--- a/meta-zephyr-bsp/conf/layer.conf
++++ b/meta-zephyr-bsp/conf/layer.conf
+@@ -15,6 +15,6 @@ LAYERVERSION_zephyrbsp = "1"
+ 
+ LAYERDEPENDS_zephyrbsp = "zephyrcore core meta-python"
+ 
+-LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister kirkstone"
++LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister kirkstone langdale"
+ 
+-X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
++X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone langdale', 'include/x86', 'include', d)}"
+diff --git a/meta-zephyr-core/conf/layer.conf b/meta-zephyr-core/conf/layer.conf
+index 20c8fdf93a83..3d1e57b13897 100644
+--- a/meta-zephyr-core/conf/layer.conf
++++ b/meta-zephyr-core/conf/layer.conf
+@@ -15,8 +15,8 @@ LAYERVERSION_zephyrcore = "1"
+ 
+ LAYERDEPENDS_zephyrcore = "core meta-python"
+ 
+-LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister kirkstone"
++LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister kirkstone langdale"
+ 
+-X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
++X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone langdale', 'include/x86', 'include', d)}"
+ 
+ PYTHON3_NATIVE_SITEPACKAGES_DIR = "${libdir_native}/${PYTHON3_DIR}/site-packages"
+-- 
+2.30.2
+
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index bdd0e2bb..211f2e32 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -8,6 +8,10 @@ repos:
     url: https://git.yoctoproject.org/git/meta-zephyr
     layers:
       meta-zephyr-core:
+    patches:
+      langdale:
+        repo: meta-arm
+        path: 0001-layers-add-langdale-compatibility.patch
 
 target:
   - zephyr-kernel-test-all
-- 
2.17.1


