Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6100C83026
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14177.1751032191019767204
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 06:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D01B1007
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C8AA3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone 2/6] CI: clean up variable definitions
Date: Fri, 27 Jun 2025 14:49:42 +0100
Message-ID: <20250627134946.154438-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134946.154438-1-ross.burton@arm.com>
References: <20250627134946.154438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 13:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6586

Mostly taken from master, rationalise the variable definitions and stop
hardcoding /persist/.

Users of this CI will have to ensure that they've set CACHE_DIR if they
want anything actually cached.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fd6cbd57c3..9c9eb74191 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -7,6 +7,10 @@ variables:
   # by default
   FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY: 0
   FF_KUBERNETES_HONOR_ENTRYPOINT: 1
+  # The directory to use as the persistent cache (the root for DL_DIR,
+  # SSTATE_DIR, etc). The default is the build tree which will not be
+  # persistent, so this should be set in the runner.
+  CACHE_DIR: $CI_PROJECT_DIR
=20
 stages:
   - prep
@@ -20,11 +24,12 @@ stages:
   interruptible: true
   variables:
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
-    KAS_REPO_REF_DIR: $CI_BUILDS_DIR/persist/repos
-    SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
-    DL_DIR: $CI_BUILDS_DIR/persist/downloads
+    KAS_BUILD_DIR: $KAS_WORK_DIR/build
+    KAS_REPO_REF_DIR: ""
+    SSTATE_DIR: $CACHE_DIR/sstate
+    DL_DIR: $CACHE_DIR/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
-    TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
+    TOOLCHAIN_DIR: $CACHE_DIR/toolchains
     IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
     TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
   before_script:
--=20
2.43.0


