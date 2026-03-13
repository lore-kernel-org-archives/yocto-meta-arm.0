Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3ECD105F7AA
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 13:21:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15682.1773408065989925857
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 06:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 164D7497
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Mar 2026 06:20:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D31F83F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Mar 2026 06:21:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: remove last traces of TOOLCHAIN_DIR
Date: Fri, 13 Mar 2026 13:20:59 +0000
Message-ID: <20260313132100.1603643-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Mar 2026 13:21:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6952

When the binary toolchain support was removed[1] we no longer used this
variable, but a few instances of it was left behind.

[1] meta-arm 03af0c72f1 ("arm-toolchain: remove external-arm-toolchain")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 4 +---
 ci/base.yml    | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a93a0f1e0d..a1e40e365d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -37,12 +37,10 @@ stages:
     SSTATE_DIR: $CACHE_DIR/sstate
     DL_DIR: $CACHE_DIR/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
-    TOOLCHAIN_DIR: $CACHE_DIR/toolchains
     IMAGE_DIR: $KAS_BUILD_DIR/tmp/deploy/images
-    TOOLCHAIN_LINK_DIR: $KAS_BUILD_DIR/toolchains
   before_script:
     - rm -rf $KAS_WORK_DIR
-    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
+    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR
=20
 # Generalised fragment to do a Kas build
 .build:
diff --git a/ci/base.yml b/ci/base.yml
index 87192fba26..cb1fe91439 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -33,7 +33,6 @@ repos:
=20
 env:
   BB_LOGCONFIG: ""
-  TOOLCHAIN_DIR: ""
=20
 local_conf_header:
   base: |
--=20
2.43.0


