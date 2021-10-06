Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66505C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 15:37:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13983.1633534661907591617
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 08:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE006D
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:37:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 195D33F66F
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:37:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: reformat .gitlab-ci.yml
Date: Wed,  6 Oct 2021 16:37:35 +0100
Message-Id: <20211006153735.3948616-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Oct 2021 15:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2257

Change-Id: Ia4ad65a32a4d09bae05a8f2ab18adc6cf3f820bd
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 48308c5d..44f3cd1e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,6 +1,6 @@
 image: ghcr.io/siemens/kas/kas
=20
-  # First do a common bootstrap, and then build all the targets
+# First do a common bootstrap, and then build all the targets
 stages:
   - prep
   - bootstrap
@@ -44,7 +44,7 @@ update-repos:
   extends: .setup
   stage: prep
   script:
-  - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
+    - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
=20
 #
 # Bootstrap stage, bootstrap and machine coverage
@@ -65,7 +65,7 @@ machine-coverage:
   stage: bootstrap
   interruptible: true
   script:
-  - ./ci/check-machine-coverage
+    - ./ci/check-machine-coverage
   coverage: '/Coverage: \d+/'
=20
 #
@@ -77,8 +77,8 @@ check-layers:
   extends: .setup
   coverage: '/Coverage: \d+/'
   script:
-  - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy=
.yml:ci/meta-openembedded.yml --command \
-    "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.=
yml $CI_PROJECT_DIR $KAS_WORK_DIR"
+    - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autono=
my.yml:ci/meta-openembedded.yml --command \
+      "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layer=
s.yml $CI_PROJECT_DIR $KAS_WORK_DIR"
=20
 pending-updates:
   extends: .setup
@@ -86,7 +86,7 @@ pending-updates:
     paths:
       - update-report.html
   script:
-  - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml -c "$CI_PROJECT_=
DIR/scripts/machine-summary.py -t updates.html -o $CI_PROJECT_DIR/update-=
report.html $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-arm-bsp)"
+    - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml -c "$CI_PROJEC=
T_DIR/scripts/machine-summary.py -t updates.html -o $CI_PROJECT_DIR/updat=
e-report.html $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-arm-bsp)=
"
=20
 corstone500:
   extends: .build
@@ -197,7 +197,6 @@ tc1:
 toolchains:
   extends: .build
=20
-
 #
 # Utility tasks, not executed automatically
 #
@@ -207,14 +206,14 @@ delete-dl-dir:
   stage: prep
   when: manual
   script:
-  - rm -rf $DL_DIR/*
+    - rm -rf $DL_DIR/*
=20
 delete-repo-dir:
   extends: .setup
   stage: prep
   when: manual
   script:
-  - rm -rf $KAS_REPO_REF_DIR/*
+    - rm -rf $KAS_REPO_REF_DIR/*
=20
 # Delete all sstate
 delete-sstate:
@@ -222,14 +221,14 @@ delete-sstate:
   stage: prep
   when: manual
   script:
-  - rm -rf $SSTATE_DIR/*
+    - rm -rf $SSTATE_DIR/*
=20
 delete-toolchains:
   extends: .setup
   stage: prep
   when: manual
   script:
-  - rm -rf $TOOLCHAIN_DIR/*
+    - rm -rf $TOOLCHAIN_DIR/*
=20
 # Wipe out old sstate
 prune-sstate:
@@ -237,9 +236,9 @@ prune-sstate:
   stage: prep
   when: manual
   script:
-  - du -h -s $SSTATE_DIR
-  - find $SSTATE_DIR -type f -atime +30 -delete
-  - du -h -s $SSTATE_DIR
+    - du -h -s $SSTATE_DIR
+    - find $SSTATE_DIR -type f -atime +30 -delete
+    - du -h -s $SSTATE_DIR
=20
 # Report on disk usage
 usage:
@@ -247,4 +246,4 @@ usage:
   stage: prep
   when: manual
   script:
-  - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR $TOOLCHAIN_DIR
+    - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR $TOOLCHAIN_DIR
--=20
2.25.1


