Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08298C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 11:28:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3993.1635506916313334499
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 04:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6B311063;
	Fri, 29 Oct 2021 04:28:35 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.80.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06E683F5A1;
	Fri, 29 Oct 2021 04:28:33 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com
Subject: [PATCH 12/13] corstone1000: Introducing ci and kas files
Date: Fri, 29 Oct 2021 12:27:52 +0100
Message-Id: <20211029112753.8231-13-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
References: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 11:28:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2325

From: "Arpita S.K" <Arpita.S.K@arm.com>

Adding ci and yaml files to support
corstone1000-fvp.

Change-Id: I74ebc3570d4b0c8abae58be5ef69064fc33e5bea
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
---
 .gitlab-ci.yml            |  3 +++
 ci/corstone1000-fvp.yml   | 12 ++++++++++
 kas/corstone1000-base.yml | 49 +++++++++++++++++++++++++++++++++++++++
 kas/corstone1000-fvp.yml  | 16 +++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 ci/corstone1000-fvp.yml
 create mode 100644 kas/corstone1000-base.yml
 create mode 100644 kas/corstone1000-fvp.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4a2b336..78f3373 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -109,6 +109,9 @@ corstone700-fvp:
 corstone700-mps3:
   extends: .build
 
+corstone1000-fvp:
+  extends: .build
+
 fvp-base/testimage:
   extends: .build
   tags:
diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
new file mode 100644
index 0000000..66cdec6
--- /dev/null
+++ b/ci/corstone1000-fvp.yml
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
+machine: corstone1000-fvp
diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
new file mode 100644
index 0000000..0cf9401
--- /dev/null
+++ b/kas/corstone1000-base.yml
@@ -0,0 +1,49 @@
+header:
+  version: 9
+
+distro: poky-tiny
+
+defaults:
+  repos:
+    refspec: master
+
+repos:
+  meta-arm:
+    layers:
+      meta-arm:
+      meta-arm-bsp:
+      meta-arm-toolchain:
+
+  poky:
+    url: https://git.yoctoproject.org/git/poky
+    refspec: honister
+    layers:
+      meta:
+      meta-poky:
+      meta-yocto-bsp:
+
+  meta-openembedded:
+    url: https://git.openembedded.org/meta-openembedded
+    refspec: f16efc00b7fcdbfa8c53e35c1fcebed5c06d975e
+    layers:
+      meta-oe:
+      meta-python:
+
+  meta-arm-image:
+     url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-image.git
+     refspec: main
+
+local_conf_header:
+  base: |
+    CONF_VERSION = "2"
+    PACKAGE_CLASSES = "package_ipk"
+    LICENSE_FLAGS_WHITELIST += "armcompiler"
+    BB_NUMBER_THREADS ?= "16"
+    PARALLEL_MAKE ?= "-j16"
+    INHERIT += "rm_work"
+    PACKAGECONFIG:append:pn-perf = " coresight"
+
+machine: unset
+
+target:
+  - corstone1000-image
diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
new file mode 100644
index 0000000..0f6cde2
--- /dev/null
+++ b/kas/corstone1000-fvp.yml
@@ -0,0 +1,16 @@
+header:
+  version: 9
+  includes:
+    - corstone1000-base.yml
+
+repos:
+  run-scripts:
+     url: https://git.gitlab.arm.com/arm-reference-solutions/model-scripts.git
+     refspec: corstone1000-fvp
+     layers:
+      .: 'excluded'
+
+machine: corstone1000-fvp
+
+target:
+  - corstone1000-image
-- 
2.17.1


