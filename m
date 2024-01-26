Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3562C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 16:43:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2807.1706287427743695170
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 08:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67A851FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 08:44:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1F283F762
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 08:43:46 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: support extra kas files from environment
Date: Fri, 26 Jan 2024 16:43:40 +0000
Message-Id: <20240126164341.2846181-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 16:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5364

From: Ross Burton <ross.burton@arm.com>

Extend jobs-to-kas so the first argument is still the GitLab job name,
but allow further arguments to specify extra Kas files to use in
addition.

Then add a variable EXTRA_KAS_FILES to the CI configuration that
defaults to the empty string and pass this to jobs-to-kas.

This lets specific pipeline runs add extra Kas files, for example to use
experimental branches or enable extra features without touching the CI
directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml |  3 ++-
 ci/jobs-to-kas | 26 +++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 22ecfd71..4c6ce14a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -11,6 +11,7 @@ variables:
   FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY: 0
   ACS_TEST: 0
   ACS_TAG: ""
+  EXTRA_KAS_FILES: ""
=20
 stages:
   - prep
@@ -61,7 +62,7 @@ stages:
     # Catch all for everything else
     - if: '$KERNEL !=3D "linux-yocto-dev"'
   script:
-    - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME"):lockfile.yml
+    - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME" $EXTRA_KAS_FILES):loc=
kfile.yml
     - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
diff --git a/ci/jobs-to-kas b/ci/jobs-to-kas
index eea6e463..df81c2e3 100755
--- a/ci/jobs-to-kas
+++ b/ci/jobs-to-kas
@@ -3,17 +3,28 @@
 # This script is expecting an input of machine name, optionally followed=
 by a
 # colon and a list of one or more parameters separated by commas between
 # brackets.  For example, the following are acceptable:
-# corstone1000-mps3
-# fvp-base: [testimage]
-# qemuarm64-secureboot: [clang, glibc, testimage]
+#   corstone1000-mps3
+#   fvp-base: [testimage]
+#   qemuarm64-secureboot: [clang, glibc, testimage]
+# This argument should be quoted to avoid expansion and to be handled
+# as a single value.
+#
+# Any further arguments will be handled as further yml file basenames.
 #
 # Turn this list into a series of yml files separated by colons to pass =
to kas
=20
 set -e -u
=20
-FILES=3D"ci/$(echo $1 | cut -d ':' -f 1).yml"
+# First, parse the GitLab CI job name (CI_JOB_NAME via $1) and accumulat=
e a list
+# of Kas files.
+JOBNAME=3D"$1"
+shift
+
+# The base name of the job
+FILES=3D"ci/$(echo $JOBNAME | cut -d ':' -f 1).yml"
=20
-for i in $(echo $1 | cut -s -d ':' -f 2 | sed 's/[][,]//g'); do
+# The list of matrix variations
+for i in $(echo $JOBNAME | cut -s -d ':' -f 2 | sed 's/[][,]//g'); do
 	# Given that there are no yml files for gcc or glibc, as those are the
 	# defaults, we can simply ignore those parameters.  They are necessary
 	# to pass in so that matrix can correctly setup all of the permutations
@@ -24,4 +35,9 @@ for i in $(echo $1 | cut -s -d ':' -f 2 | sed 's/[][,]/=
/g'); do
 	FILES+=3D":ci/$i.yml"
 done
=20
+# Now pick up any further names
+for i in $*; do
+	FILES+=3D":ci/$i.yml"
+done
+
 echo $FILES
--=20
2.34.1


