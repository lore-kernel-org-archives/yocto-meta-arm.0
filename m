Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F9C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 16:34:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14513.1676565269776295285
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 08:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 790E41042;
	Thu, 16 Feb 2023 08:35:11 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 521443F881;
	Thu, 16 Feb 2023 08:34:28 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] CI: Factor out CACHE_DIR to improve mirror configurability
Date: Thu, 16 Feb 2023 16:24:36 +0000
Message-Id: <20230216162437.1232175-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 16:34:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4410

From: Peter Hoyes <Peter.Hoyes@arm.com>

Mirrors of meta-arm may have the persistent cache directory mounted in a
different place. To make it easier to configure, define this location
using a single $CACHE_DIR variable.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .gitlab-ci.yml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c1537b7a..6a286900 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -3,6 +3,7 @@ image: ghcr.io/siemens/kas/kas:3.2
 variables:
   CPU_REQUEST: ""
   DEFAULT_TAG: ""
+  CACHE_DIR: $CI_BUILDS_DIR/persist
   # These are needed as the k8s executor doesn't respect the container e=
ntrypoint
   # by default
   FF_KUBERNETES_HONOR_ENTRYPOINT: 1
@@ -23,11 +24,11 @@ stages:
   interruptible: true
   variables:
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
-    KAS_REPO_REF_DIR: $CI_BUILDS_DIR/persist/repos
-    SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
-    DL_DIR: $CI_BUILDS_DIR/persist/downloads
+    KAS_REPO_REF_DIR: $CACHE_DIR/repos
+    SSTATE_DIR: $CACHE_DIR/sstate
+    DL_DIR: $CACHE_DIR/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
-    TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
+    TOOLCHAIN_DIR: $CACHE_DIR/toolchains
     IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
     TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
   before_script:
--=20
2.34.1


