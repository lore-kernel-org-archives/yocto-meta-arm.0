Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3B6C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:24:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.743.1652282646461093833
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D235ED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 May 2022 08:24:05 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 438F43F66F
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 May 2022 08:24:05 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: make qemuarm-secureboot builds more thorough
Date: Wed, 11 May 2022 11:24:01 -0400
Message-Id: <20220511152401.10735-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 May 2022 15:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3384

Build all the things that qemuarm64-secureboot builds, removing those
that fail to compile (e.g., optee-spdevkit).  Unfortunately, clang
doesn't work at all.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml            | 3 ++-
 ci/qemuarm-secureboot.yml | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 40e00fc0..bc9f0801 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -191,7 +191,8 @@ qemuarm-secureboot:
   extends: .build
   parallel:
     matrix:
-      - TESTING: testimage
+      - TCLIBC: [glibc, musl]
+        TESTING: testimage
 
 qemuarm:
   extends: .build
diff --git a/ci/qemuarm-secureboot.yml b/ci/qemuarm-secureboot.yml
index 2fa8ef08..044661cd 100644
--- a/ci/qemuarm-secureboot.yml
+++ b/ci/qemuarm-secureboot.yml
@@ -4,3 +4,9 @@ header:
     - ci/base.yml
 
 machine: qemuarm-secureboot
+
+target:
+  - core-image-base
+  - optee-examples
+  - optee-test
+  - optee-os-tadevkit
-- 
2.17.1


