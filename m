Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E111CDD1C8
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:57:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.72753.1727452628967841477
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 08:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED7D214BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 08:57:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CA733F6A8
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 08:57:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI: add KAS_BUILD_DIR variable
Date: Fri, 27 Sep 2024 16:57:03 +0100
Message-Id: <20240927155705.1121586-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:57:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6132

Instead of always using KAS_WORK_DIR/build to refer to the build tree,
on the assumption that is where the build tree is, export KAS_BUILD_DIR
and use that variable instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e8627731..bca957fe 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -34,13 +34,14 @@ stages:
   interruptible: true
   variables:
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
+    KAS_BUILD_DIR: $KAS_WORK_DIR/build
     KAS_REPO_REF_DIR: $CACHE_DIR/repos
     SSTATE_DIR: $CACHE_DIR/sstate
     DL_DIR: $CACHE_DIR/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
     TOOLCHAIN_DIR: $CACHE_DIR/toolchains
-    IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
-    TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
+    IMAGE_DIR: $KAS_BUILD_DIR/tmp/deploy/images
+    TOOLCHAIN_LINK_DIR: $KAS_BUILD_DIR/toolchains
   before_script:
     - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
     - echo SSTATE_DIR =3D $SSTATE_DIR
@@ -75,13 +76,13 @@ stages:
     - echo KASFILES=3D$KASFILES
     - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
     - kas build $KASFILES
-    - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
+    - ./ci/check-warnings $KAS_BUILD_DIR/warnings.log
   artifacts:
     name: "logs"
     when: always
     paths:
-      - $CI_PROJECT_DIR/work/build/tmp*/work*/**/temp/log.do_*.*
-      - $CI_PROJECT_DIR/work/build/tmp*/work*/**/testimage/*
+      - $KAS_BUILD_DIR/tmp*/work*/**/temp/log.do_*.*
+      - $KAS_BUILD_DIR/tmp*/work*/**/testimage/*
=20
 #
 # Prep stage, update repositories once.
--=20
2.34.1


