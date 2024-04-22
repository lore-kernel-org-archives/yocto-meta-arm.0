Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE01DC07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:37:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18672.1713793067072759563
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 06:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 004EB150C;
	Mon, 22 Apr 2024 06:38:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 483553F73F;
	Mon, 22 Apr 2024 06:37:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/6] CI: sort jobs alphabetically
Date: Mon, 22 Apr 2024 13:37:39 +0000
Message-Id: <20240422133739.190536-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422133739.190536-1-ross.burton@arm.com>
References: <20240422133739.190536-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 13:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5583

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 176 ++++++++++++++++++++++++-------------------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a0d25063..53a99a76 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -119,6 +119,29 @@ update-repos:
 #  VIRT: [none, xen]
 #  TESTING: testimage
=20
+arm-systemready-ir-acs:
+  extends: .build
+  timeout: 12h
+  parallel:
+    matrix:
+      # arm-systemready-ir-acs must be specified after fvp-base for orde=
ring
+      # purposes for the jobs-to-kas output. It is not enough to just ha=
ve it
+      # in the job name because fvp-base.yml overwrites the target.
+      - PLATFORM: fvp-base
+        ARM_SYSTEMREADY_IR_ACS: arm-systemready-ir-acs
+  tags:
+    - ${ACS_TAG}
+
+# Validate layers are Yocto Project Compatible
+check-layers:
+  extends: .setup
+  script:
+    - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedd=
ed.yml:lockfile.yml --command \
+      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dep=
endency"
+  parallel:
+    matrix:
+      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain]
+
 corstone1000-fvp:
   extends: .build
   parallel:
@@ -136,6 +159,29 @@ corstone1000-mps3:
         TESTING: [none, tftf]
       - FIRMWARE: none
=20
+documentation:
+  extends: .setup
+  script:
+    - |
+      # This can be removed when the kas container has python3-venv inst=
alled
+      sudo apt-get update && sudo apt-get install --yes python3-venv
+
+      python3 -m venv venv
+      . ./venv/bin/activate
+
+      pip3 install -r meta-arm-bsp/documentation/requirements.txt
+
+      for CONF in meta-*/documentation/*/conf.py ; do
+        echo Building $CONF...
+        SOURCE_DIR=3D$(dirname $CONF)
+        MACHINE=3D$(basename $SOURCE_DIR)
+        sphinx-build -vW $SOURCE_DIR build-docs/$MACHINE
+      done
+      test -d build-docs/
+  artifacts:
+    paths:
+      - build-docs/
+
 fvp-base:
   extends: .build
   parallel:
@@ -144,19 +190,6 @@ fvp-base:
       - FIRMWARE: edk2
       - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
-arm-systemready-ir-acs:
-  extends: .build
-  timeout: 12h
-  parallel:
-    matrix:
-      # arm-systemready-ir-acs must be specified after fvp-base for orde=
ring
-      # purposes for the jobs-to-kas output. It is not enough to just ha=
ve it
-      # in the job name because fvp-base.yml overwrites the target.
-      - PLATFORM: fvp-base
-        ARM_SYSTEMREADY_IR_ACS: arm-systemready-ir-acs
-  tags:
-    - ${ACS_TAG}
-
 fvps:
   extends: .build
=20
@@ -169,16 +202,6 @@ genericarm64:
       - KERNEL: linux-yocto-dev
         TESTING: testimage
=20
-sbsa-ref:
-  extends: .build
-  parallel:
-    matrix:
-      - KERNEL: [linux-yocto, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang]
-        TESTING: testimage
-      - KERNEL: linux-yocto-dev
-        TESTING: testimage
-
 juno:
   extends: .build
   parallel:
@@ -186,6 +209,22 @@ juno:
       - TOOLCHAINS: [gcc, clang]
         FIRMWARE: [u-boot, edk2]
=20
+# What percentage of machines in the layer do we build
+machine-coverage:
+  extends: .setup
+  script:
+    - ./ci/check-machine-coverage
+  coverage: '/Coverage: \d+/'
+
+metrics:
+  extends: .setup
+  artifacts:
+    reports:
+      metrics: metrics.txt
+  script:
+    - kas shell --update --force-checkout ci/base.yml --command \
+      "$CI_PROJECT_DIR/ci/patchreview $CI_PROJECT_DIR/meta-* --verbose -=
-metrics $CI_PROJECT_DIR/metrics.txt"
+
 musca-b1:
   extends: .build
=20
@@ -198,6 +237,20 @@ n1sdp:
     matrix:
       - TESTING: [none, n1sdp-ts, n1sdp-optee, tftf]
=20
+pending-updates:
+  extends: .setup
+  artifacts:
+    paths:
+      - update-report
+  script:
+    - rm -fr update-report
+    # This configuration has all of the layers we need enabled
+    - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml:ci/meta-secure-core.yml:lockfile.yml --command \
+      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
+  # Do this on x86 whilst the compilers are x86-only
+  tags:
+    - x86_64
+
 qemuarm64-secureboot:
   extends: .build
   parallel:
@@ -263,11 +316,15 @@ qemuarmv5:
       - DISTRO: poky-tiny
         TESTING: testimage
=20
-sgi575:
-  extends: .build
-
-toolchains:
+sbsa-ref:
   extends: .build
+  parallel:
+    matrix:
+      - KERNEL: [linux-yocto, linux-yocto-rt]
+        TOOLCHAINS: [gcc, clang]
+        TESTING: testimage
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
=20
 selftest:
   extends: .setup
@@ -275,65 +332,8 @@ selftest:
     - KASFILES=3D./ci/qemuarm64.yml:./ci/selftest.yml:lockfile.yml
     - kas shell --update --force-checkout $KASFILES -c 'oe-selftest --nu=
m-processes 2 --select-tag meta-arm --run-all-tests'
=20
-# Validate layers are Yocto Project Compatible
-check-layers:
-  extends: .setup
-  script:
-    - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedd=
ed.yml:lockfile.yml --command \
-      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dep=
endency"
-  parallel:
-    matrix:
-      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain]
-
-pending-updates:
-  extends: .setup
-  artifacts:
-    paths:
-      - update-report
-  script:
-    - rm -fr update-report
-    # This configuration has all of the layers we need enabled
-    - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml:ci/meta-secure-core.yml:lockfile.yml --command \
-      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
-  # Do this on x86 whilst the compilers are x86-only
-  tags:
-    - x86_64
-
-# What percentage of machines in the layer do we build
-machine-coverage:
-  extends: .setup
-  script:
-    - ./ci/check-machine-coverage
-  coverage: '/Coverage: \d+/'
-
-metrics:
-  extends: .setup
-  artifacts:
-    reports:
-      metrics: metrics.txt
-  script:
-    - kas shell --update --force-checkout ci/base.yml --command \
-      "$CI_PROJECT_DIR/ci/patchreview $CI_PROJECT_DIR/meta-* --verbose -=
-metrics $CI_PROJECT_DIR/metrics.txt"
-
-documentation:
-  extends: .setup
-  script:
-    - |
-      # This can be removed when the kas container has python3-venv inst=
alled
-      sudo apt-get update && sudo apt-get install --yes python3-venv
-
-      python3 -m venv venv
-      . ./venv/bin/activate
-
-      pip3 install -r meta-arm-bsp/documentation/requirements.txt
+sgi575:
+  extends: .build
=20
-      for CONF in meta-*/documentation/*/conf.py ; do
-        echo Building $CONF...
-        SOURCE_DIR=3D$(dirname $CONF)
-        MACHINE=3D$(basename $SOURCE_DIR)
-        sphinx-build -vW $SOURCE_DIR build-docs/$MACHINE
-      done
-      test -d build-docs/
-  artifacts:
-    paths:
-      - build-docs/
+toolchains:
+  extends: .build
--=20
2.34.1


