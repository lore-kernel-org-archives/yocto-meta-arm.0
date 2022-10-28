Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE10FFA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 14:08:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9621.1667225294225287121
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 07:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 092EE1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 07:08:20 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EC703F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 07:08:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: Add packages for opencsd and gator-daemon to base build
Date: Fri, 28 Oct 2022 10:23:30 -0400
Message-Id: <20221028142330.23482-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 14:08:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4062

opencsd and gator-daemon aren't currently being build.  Add them to the
base build so that they can be verified to at least compile.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml                | 5 +++--
 ci/corstone1000-common.yml | 2 +-
 ci/corstone500.yml         | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index c4e68886..75a30925 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -35,8 +35,9 @@ local_conf_header:
     PACKAGECONFIG:append:pn-perf = " coresight"
     INHERIT += "rm_work"
     DISTRO_FEATURES:remove = "ptest"
-  perf: |
-    CORE_IMAGE_EXTRA_INSTALL += "perf"
+  extrapackages: |
+    CORE_IMAGE_EXTRA_INSTALL += "perf opencsd"
+    CORE_IMAGE_EXTRA_INSTALL:aarch64 += "gator-daemon"
 
 machine: unset
 
diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 970a87c9..65ff9d38 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -5,7 +5,7 @@ header:
     - ci/meta-openembedded.yml
 
 local_conf_header:
-    perf: |
+    extrapackages: |
     # Intentionally blank to prevent perf from being added to the image in base.yml
 
 distro: poky-tiny
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
index d51d45fb..54633e1c 100644
--- a/ci/corstone500.yml
+++ b/ci/corstone500.yml
@@ -7,7 +7,7 @@ local_conf_header:
   testimagefvp: |
     INHERIT += "fvpboot"
     IMAGE_FEATURES:remove = " ssh-server-dropbear"
-  perf: |
+  extrapackages: |
     # Intentionally blank to prevent perf from being added to the image in base.yml
 
 machine: corstone500
-- 
2.17.1


