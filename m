Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D1AC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:16:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.248.1664817365405805829
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 10:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB5316A3
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Oct 2022 10:16:11 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF3253F67D
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Oct 2022 10:16:04 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] ci: move features only needed by testimage from base
Date: Mon,  3 Oct 2022 13:16:00 -0400
Message-Id: <20221003171600.24454-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003171600.24454-1-jon.mason@arm.com>
References: <20221003171600.24454-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 17:16:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3911

Move the features uniquely needed for system images to the testimage
file.  This should reduce the image size and amount of things needing to
be built for machines that do not run testimage.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml      | 6 ------
 ci/testimage.yml | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index eff466ed..3f644c1e 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -38,14 +38,8 @@ local_conf_header:
     PACKAGECONFIG:append:pn-perf = " coresight"
     INHERIT += "rm_work"
     DISTRO_FEATURES:remove = "ptest"
-  kvm: |
-    QEMU_USE_KVM = ""
   perf: |
     CORE_IMAGE_EXTRA_INSTALL += "perf"
-  sshkeys: |
-    CORE_IMAGE_EXTRA_INSTALL += "ssh-pregen-hostkeys"
-  universally_failing_tests: |
-    TEST_SUITES:remove = "opkg"
 
 machine: unset
 
diff --git a/ci/testimage.yml b/ci/testimage.yml
index a26dcaf9..d7de7d06 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -5,9 +5,15 @@ local_conf_header:
   testimage: |
     IMAGE_CLASSES += "testimage"
     TESTIMAGE_AUTO = "1"
+  kvm: |
+    QEMU_USE_KVM = ""
   slirp: |
     TEST_RUNQEMUPARAMS = "slirp"
     TEST_SERVER_IP = "127.0.0.1"
     QEMU_USE_SLIRP = "1"
   sshd: |
     IMAGE_FEATURES:append = " ssh-server-dropbear"
+  sshkeys: |
+    CORE_IMAGE_EXTRA_INSTALL += "ssh-pregen-hostkeys"
+  universally_failing_tests: |
+    TEST_SUITES:remove = "opkg"
-- 
2.17.1


