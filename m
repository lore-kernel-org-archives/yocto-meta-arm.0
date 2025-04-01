Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BEAC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 13:09:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18684.1743512955828079118
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 06:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7DAF1424
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Apr 2025 06:09:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F00563F694
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Apr 2025 06:09:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: dump all environment variables in update-repos
Date: Tue,  1 Apr 2025 14:09:09 +0100
Message-ID: <20250401130909.2924629-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401130909.2924629-1-ross.burton@arm.com>
References: <20250401130909.2924629-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 13:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6429

Print all of the environment variables in the update-repos task for
introspection, instead of a subset.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2575807e..557d48d7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -45,10 +45,6 @@ stages:
     IMAGE_DIR: $KAS_BUILD_DIR/tmp/deploy/images
     TOOLCHAIN_LINK_DIR: $KAS_BUILD_DIR/toolchains
   before_script:
-    - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
-    - echo SSTATE_DIR =3D $SSTATE_DIR
-    - echo DL_DIR =3D $DL_DIR
-    - echo KAS_PREMIRRORS =3D $KAS_PREMIRRORS
     - rm -rf $KAS_WORK_DIR
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
=20
@@ -99,6 +95,11 @@ update-repos:
   script:
     - |
       exit_code=3D0
+
+      # Dump the environment for reference
+      printenv
+
+      # Update the reference repositories if needed
       if [ -n "$KAS_REPO_REF_DIR" ]; then
         flock --verbose --timeout 60 $KAS_REPO_REF_DIR --command ./ci/up=
date-repos || exit_code=3D$?
         # Exit now if that failed, unless the status was 128 (fetch fail=
ed)
--=20
2.43.0


