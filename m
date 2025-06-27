Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47C7C7EE3A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14178.1751032193233779641
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 06:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A08011007
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 761E63F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone 5/6] CI: show all variables in update-repos
Date: Fri, 27 Jun 2025 14:49:45 +0100
Message-ID: <20250627134946.154438-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134946.154438-1-ross.burton@arm.com>
References: <20250627134946.154438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 13:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6589

This makes it easier to debug path usage.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ef75a45bba..91e92ae2ec 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -33,9 +33,6 @@ stages:
     IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
     TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
   before_script:
-    - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
-    - echo SSTATE_DIR =3D $SSTATE_DIR
-    - echo DL_DIR =3D $DL_DIR
     - rm -rf $KAS_WORK_DIR
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
     # Must do this here, as it's the only way to make sure the toolchain=
 is installed on the same builder
@@ -79,6 +76,8 @@ update-repos:
     - |
       exit_code=3D0
=20
+      printenv
+
       if [ -n "$KAS_REPO_REF_DIR" ]; then
         flock --verbose --timeout 60 $KAS_REPO_REF_DIR --command ./ci/up=
date-repos || exit_code=3D$?
         # Exit now if that failed, unless the status was 128 (fetch fail=
ed)
--=20
2.43.0


