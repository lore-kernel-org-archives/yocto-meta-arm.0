Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B2CEB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 13:43:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12777.1688737380599587368
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 06:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92287D75;
	Fri,  7 Jul 2023 06:43:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DEB83F73F;
	Fri,  7 Jul 2023 06:42:59 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] CI: generate and use a Kas lock file
Date: Fri,  7 Jul 2023 14:42:56 +0100
Message-Id: <20230707134257.3059771-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Jul 2023 13:43:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4869

From: Ross Burton <ross.burton@arm.com>

In the update-repos job, generate a Kas lock file to pin the SHAs of the
repositories being build during the build. This ensures that commits to
the repositories _during_ the build doesn't cause differing builds. All
of the kas calls use this lock file to ensure that their builds are
identical.

This lockfile is also added to the artifacts, so that it can be reused
afterwards to replicate the build: either as a known good base or to
replicate failures.

This lock file is only generated if it doesn't exist, so that
development branches can temporarily add a lockfile.yml if for example
master is too unstable to develop on.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1433d2ac..4a786f63 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -58,8 +58,8 @@ stages:
     # Catch all for everything else
     - if: '$KERNEL !=3D "linux-yocto-dev"'
   script:
-    - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME")
-    - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES=20
+    - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME"):lockfile.yml
+    - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
   artifacts:
@@ -77,7 +77,19 @@ update-repos:
   extends: .setup
   stage: prep
   script:
-    - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
+    - |
+      flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
+      # Only generate if doesn't already exist, to allow feature branche=
s to drop one in.
+      if test -f lockfile.yml; then
+        echo Using existing lockfile.yml
+      else
+        # Be sure that this is the complete list of layers being fetched
+        kas dump --lock --update ci/qemuarm64.yml:ci/meta-openembedded.y=
ml:ci/clang.yml:ci/meta-virtualization.yml | tee lockfile.yml
+      fi
+  artifacts:
+    name: "lockfile"
+    paths:
+      - lockfile.yml
=20
 #
 # Build stage, the actual build jobs
@@ -233,14 +245,14 @@ toolchains:
 selftest:
   extends: .setup
   script:
-    - KASFILES=3D./ci/qemuarm64.yml:./ci/selftest.yml
+    - KASFILES=3D./ci/qemuarm64.yml:./ci/selftest.yml:lockfile.yml
     - kas shell --update --force-checkout $KASFILES -c 'oe-selftest --nu=
m-processes 1 --run-tests runfvp'
=20
 # Validate layers are Yocto Project Compatible
 check-layers:
   extends: .setup
   script:
-    - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedd=
ed.yml --command \
+    - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedd=
ed.yml:lockfile.yml --command \
       "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dep=
endency"
   parallel:
     matrix:
@@ -254,7 +266,7 @@ pending-updates:
   script:
     - rm -fr update-report
     # This configuration has all of the layers we need enabled
-    - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml --command \
+    - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml:lockfile.yml --command \
       "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
   # Do this on x86 whilst the compilers are x86-only
   tags:
--=20
2.34.1


