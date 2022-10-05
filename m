Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A90C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 13:47:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23742.1664977625819211702
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 06:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3294A113E
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Oct 2022 06:47:12 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D92F3F792
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Oct 2022 06:47:05 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: trusted services as a feature instead of a machine
Date: Wed,  5 Oct 2022 09:46:59 -0400
Message-Id: <20221005134700.7308-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 13:47:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3935

Trusted services is a feature, not a unique machine.  Modify the setup
to reflect this.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                     |  9 +--------
 ...rm64-secureboot-ts.yml => trusted-services.yml} | 14 --------------
 2 files changed, 1 insertion(+), 22 deletions(-)
 rename ci/{qemuarm64-secureboot-ts.yml => trusted-services.yml} (61%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 491ccebb..60c6ed91 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -151,14 +151,7 @@ qemuarm64-secureboot:
     matrix:
       - TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
-        TESTING: testimage
-
-qemuarm64-secureboot-ts:
-  extends: .build
-  parallel:
-    matrix:
-      - TOOLCHAINS: [gcc, clang]
-        TCLIBC: [glibc, musl]
+        TS: [none, trusted-services]
         TESTING: testimage
 
 qemuarm64:
diff --git a/ci/qemuarm64-secureboot-ts.yml b/ci/trusted-services.yml
similarity index 61%
rename from ci/qemuarm64-secureboot-ts.yml
rename to ci/trusted-services.yml
index 66a27c68..433ec78b 100644
--- a/ci/qemuarm64-secureboot-ts.yml
+++ b/ci/trusted-services.yml
@@ -1,20 +1,9 @@
-# Build qemuarm64-secureboot machine with
-# Trusted Services secure partition included into optee-os image.
-#
-# Run Trustes Services OEQA tests.
-
 header:
   version: 11
   includes:
-    - ci/base.yml
     - ci/meta-openembedded.yml
 
-machine: qemuarm64-secureboot
-
 local_conf_header:
-  failing_tests: |
-    # software IO TLB: Cannot allocate buffer
-    DEFAULT_TEST_SUITES:remove = "parselogs"
   trusted_services: |
     TEST_SUITES:append = " trusted_services"
     # Include TS Crypto, Storage, ITS, Attestation and SMM-Gateway SPs into optee-os image
@@ -23,6 +12,3 @@ local_conf_header:
     IMAGE_INSTALL:append = " packagegroup-ts-tests"
     # Include TS PSA Arch tests into image
     IMAGE_INSTALL:append = " packagegroup-ts-tests-psa"
-
-target:
-  - core-image-base
-- 
2.17.1


