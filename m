Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4599.1618478974503741512
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB615106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 445AE3F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:33 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] Rename top-level kas/ to ci/
Date: Thu, 15 Apr 2021 10:29:29 +0100
Message-Id: <20210415092929.3153651-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415092929.3153651-1-ross.burton@arm.com>
References: <20210415092929.3153651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The files in kas/ are not generic Kas files, but instead designed
specifically and solely around the CI system.

Change-Id: I30082392ad2231a4c1c41e54a292595adf81715b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                       | 10 +++++-----
 {kas =3D> ci}/armgcc.yml               |  0
 {kas =3D> ci}/base.yml                 |  0
 {kas =3D> ci}/bootstrap.yml            |  0
 {kas =3D> ci}/check-machine-coverage   |  2 +-
 {kas =3D> ci}/check-warnings           |  0
 {kas =3D> ci}/clang.yml                |  0
 {kas =3D> ci}/corstone500.yml          |  0
 {kas =3D> ci}/corstone700-fvp.yml      |  0
 {kas =3D> ci}/corstone700-mps3.yml     |  0
 {kas =3D> ci}/external-gcc-arm32.yml   |  0
 {kas =3D> ci}/fvp-base-arm32.yml       |  0
 {kas =3D> ci}/fvp-base.yml             |  0
 {kas =3D> ci}/fvp-baser-aemv8r64.yml   |  0
 {kas =3D> ci}/gem5-arm64-xen.yml       |  0
 {kas =3D> ci}/gem5-arm64.yml           |  0
 {kas =3D> ci}/generic-arm64.yml        |  0
 {kas =3D> ci}/jobs-to-kas              |  4 ++--
 {kas =3D> ci}/juno.yml                 |  0
 {kas =3D> ci}/logging.yml              |  0
 {kas =3D> ci}/meta-python.yml          |  0
 {kas =3D> ci}/meta-zephyr.yml          |  0
 {kas =3D> ci}/microbit-v1.yml          |  0
 {kas =3D> ci}/musca-b1.yml             |  0
 {kas =3D> ci}/musca-s1.yml             |  0
 {kas =3D> ci}/musl.yml                 |  0
 {kas =3D> ci}/n1sdp.yml                |  0
 {kas =3D> ci}/qemu-cortex-a53.yml      |  0
 {kas =3D> ci}/qemuarm.yml              |  0
 {kas =3D> ci}/qemuarm64-sbsa.yml       |  0
 {kas =3D> ci}/qemuarm64-secureboot.yml |  0
 {kas =3D> ci}/qemuarmv5.yml            |  0
 {kas =3D> ci}/sgi575.yml               |  0
 {kas =3D> ci}/tc0.yml                  |  0
 {kas =3D> ci}/update-repos             |  0
 35 files changed, 8 insertions(+), 8 deletions(-)
 rename {kas =3D> ci}/armgcc.yml (100%)
 rename {kas =3D> ci}/base.yml (100%)
 rename {kas =3D> ci}/bootstrap.yml (100%)
 rename {kas =3D> ci}/check-machine-coverage (94%)
 rename {kas =3D> ci}/check-warnings (100%)
 rename {kas =3D> ci}/clang.yml (100%)
 rename {kas =3D> ci}/corstone500.yml (100%)
 rename {kas =3D> ci}/corstone700-fvp.yml (100%)
 rename {kas =3D> ci}/corstone700-mps3.yml (100%)
 rename {kas =3D> ci}/external-gcc-arm32.yml (100%)
 rename {kas =3D> ci}/fvp-base-arm32.yml (100%)
 rename {kas =3D> ci}/fvp-base.yml (100%)
 rename {kas =3D> ci}/fvp-baser-aemv8r64.yml (100%)
 rename {kas =3D> ci}/gem5-arm64-xen.yml (100%)
 rename {kas =3D> ci}/gem5-arm64.yml (100%)
 rename {kas =3D> ci}/generic-arm64.yml (100%)
 rename {kas =3D> ci}/jobs-to-kas (83%)
 rename {kas =3D> ci}/juno.yml (100%)
 rename {kas =3D> ci}/logging.yml (100%)
 rename {kas =3D> ci}/meta-python.yml (100%)
 rename {kas =3D> ci}/meta-zephyr.yml (100%)
 rename {kas =3D> ci}/microbit-v1.yml (100%)
 rename {kas =3D> ci}/musca-b1.yml (100%)
 rename {kas =3D> ci}/musca-s1.yml (100%)
 rename {kas =3D> ci}/musl.yml (100%)
 rename {kas =3D> ci}/n1sdp.yml (100%)
 rename {kas =3D> ci}/qemu-cortex-a53.yml (100%)
 rename {kas =3D> ci}/qemuarm.yml (100%)
 rename {kas =3D> ci}/qemuarm64-sbsa.yml (100%)
 rename {kas =3D> ci}/qemuarm64-secureboot.yml (100%)
 rename {kas =3D> ci}/qemuarmv5.yml (100%)
 rename {kas =3D> ci}/sgi575.yml (100%)
 rename {kas =3D> ci}/tc0.yml (100%)
 rename {kas =3D> ci}/update-repos (100%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 732589b..fec2890 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,7 +15,7 @@ stages:
     KAS_REPO_REF_DIR: $CI_BUILDS_DIR/persist/repos
     SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
     DL_DIR: $CI_BUILDS_DIR/persist/downloads
-    BB_LOGCONFIG: $CI_PROJECT_DIR/kas/logging.yml
+    BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
   before_script:
     - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
     - echo SSTATE_DIR =3D $SSTATE_DIR
@@ -26,10 +26,10 @@ stages:
 .build:
   extends: .setup
   script:
-  - KASFILES=3D$(kas/jobs-to-kas $CI_JOB_NAME)
+  - KASFILES=3D$(./ci/jobs-to-kas $CI_JOB_NAME)
   - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
   - kas build $KASFILES
-  - ./kas/check-warnings $KAS_WORK_DIR/build/warnings.log
+  - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
=20
=20
 #
@@ -39,7 +39,7 @@ update-repos:
   extends: .setup
   stage: prep
   script:
-  - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./kas/update-repos
+  - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
=20
=20
 #
@@ -56,7 +56,7 @@ n1sdp/bootstrap:
 machine-coverage:
   stage: bootstrap
   script:
-  - ./kas/check-machine-coverage
+  - ./ci/check-machine-coverage
   coverage: '/Coverage: \d+/'
=20
=20
diff --git a/kas/armgcc.yml b/ci/armgcc.yml
similarity index 100%
rename from kas/armgcc.yml
rename to ci/armgcc.yml
diff --git a/kas/base.yml b/ci/base.yml
similarity index 100%
rename from kas/base.yml
rename to ci/base.yml
diff --git a/kas/bootstrap.yml b/ci/bootstrap.yml
similarity index 100%
rename from kas/bootstrap.yml
rename to ci/bootstrap.yml
diff --git a/kas/check-machine-coverage b/ci/check-machine-coverage
similarity index 94%
rename from kas/check-machine-coverage
rename to ci/check-machine-coverage
index 53d3983..035d421 100755
--- a/kas/check-machine-coverage
+++ b/ci/check-machine-coverage
@@ -14,7 +14,7 @@ machines =3D metaarm.glob("meta-*/conf/machine/*.conf")
 machines =3D set(p.stem for p in machines)
=20
 # All kas files
-kas =3D metaarm.glob("kas/*.yml")
+kas =3D metaarm.glob("ci/*.yml")
 kas =3D set(p.stem for p in kas)
=20
 missing =3D machines - kas
diff --git a/kas/check-warnings b/ci/check-warnings
similarity index 100%
rename from kas/check-warnings
rename to ci/check-warnings
diff --git a/kas/clang.yml b/ci/clang.yml
similarity index 100%
rename from kas/clang.yml
rename to ci/clang.yml
diff --git a/kas/corstone500.yml b/ci/corstone500.yml
similarity index 100%
rename from kas/corstone500.yml
rename to ci/corstone500.yml
diff --git a/kas/corstone700-fvp.yml b/ci/corstone700-fvp.yml
similarity index 100%
rename from kas/corstone700-fvp.yml
rename to ci/corstone700-fvp.yml
diff --git a/kas/corstone700-mps3.yml b/ci/corstone700-mps3.yml
similarity index 100%
rename from kas/corstone700-mps3.yml
rename to ci/corstone700-mps3.yml
diff --git a/kas/external-gcc-arm32.yml b/ci/external-gcc-arm32.yml
similarity index 100%
rename from kas/external-gcc-arm32.yml
rename to ci/external-gcc-arm32.yml
diff --git a/kas/fvp-base-arm32.yml b/ci/fvp-base-arm32.yml
similarity index 100%
rename from kas/fvp-base-arm32.yml
rename to ci/fvp-base-arm32.yml
diff --git a/kas/fvp-base.yml b/ci/fvp-base.yml
similarity index 100%
rename from kas/fvp-base.yml
rename to ci/fvp-base.yml
diff --git a/kas/fvp-baser-aemv8r64.yml b/ci/fvp-baser-aemv8r64.yml
similarity index 100%
rename from kas/fvp-baser-aemv8r64.yml
rename to ci/fvp-baser-aemv8r64.yml
diff --git a/kas/gem5-arm64-xen.yml b/ci/gem5-arm64-xen.yml
similarity index 100%
rename from kas/gem5-arm64-xen.yml
rename to ci/gem5-arm64-xen.yml
diff --git a/kas/gem5-arm64.yml b/ci/gem5-arm64.yml
similarity index 100%
rename from kas/gem5-arm64.yml
rename to ci/gem5-arm64.yml
diff --git a/kas/generic-arm64.yml b/ci/generic-arm64.yml
similarity index 100%
rename from kas/generic-arm64.yml
rename to ci/generic-arm64.yml
diff --git a/kas/jobs-to-kas b/ci/jobs-to-kas
similarity index 83%
rename from kas/jobs-to-kas
rename to ci/jobs-to-kas
index d1f2f10..7057970 100755
--- a/kas/jobs-to-kas
+++ b/ci/jobs-to-kas
@@ -8,8 +8,8 @@ set -e -u
 # Read Job namne from $1 and split on /
 IFS=3D/ read -r -a PARTS<<<$1
=20
-# Prefix each part with kas/
-PARTS=3D("${PARTS[@]/#/kas/}")
+# Prefix each part with ci/
+PARTS=3D("${PARTS[@]/#/ci/}")
=20
 # Suffix each part with .yml
 PARTS=3D("${PARTS[@]/%/.yml}")
diff --git a/kas/juno.yml b/ci/juno.yml
similarity index 100%
rename from kas/juno.yml
rename to ci/juno.yml
diff --git a/kas/logging.yml b/ci/logging.yml
similarity index 100%
rename from kas/logging.yml
rename to ci/logging.yml
diff --git a/kas/meta-python.yml b/ci/meta-python.yml
similarity index 100%
rename from kas/meta-python.yml
rename to ci/meta-python.yml
diff --git a/kas/meta-zephyr.yml b/ci/meta-zephyr.yml
similarity index 100%
rename from kas/meta-zephyr.yml
rename to ci/meta-zephyr.yml
diff --git a/kas/microbit-v1.yml b/ci/microbit-v1.yml
similarity index 100%
rename from kas/microbit-v1.yml
rename to ci/microbit-v1.yml
diff --git a/kas/musca-b1.yml b/ci/musca-b1.yml
similarity index 100%
rename from kas/musca-b1.yml
rename to ci/musca-b1.yml
diff --git a/kas/musca-s1.yml b/ci/musca-s1.yml
similarity index 100%
rename from kas/musca-s1.yml
rename to ci/musca-s1.yml
diff --git a/kas/musl.yml b/ci/musl.yml
similarity index 100%
rename from kas/musl.yml
rename to ci/musl.yml
diff --git a/kas/n1sdp.yml b/ci/n1sdp.yml
similarity index 100%
rename from kas/n1sdp.yml
rename to ci/n1sdp.yml
diff --git a/kas/qemu-cortex-a53.yml b/ci/qemu-cortex-a53.yml
similarity index 100%
rename from kas/qemu-cortex-a53.yml
rename to ci/qemu-cortex-a53.yml
diff --git a/kas/qemuarm.yml b/ci/qemuarm.yml
similarity index 100%
rename from kas/qemuarm.yml
rename to ci/qemuarm.yml
diff --git a/kas/qemuarm64-sbsa.yml b/ci/qemuarm64-sbsa.yml
similarity index 100%
rename from kas/qemuarm64-sbsa.yml
rename to ci/qemuarm64-sbsa.yml
diff --git a/kas/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
similarity index 100%
rename from kas/qemuarm64-secureboot.yml
rename to ci/qemuarm64-secureboot.yml
diff --git a/kas/qemuarmv5.yml b/ci/qemuarmv5.yml
similarity index 100%
rename from kas/qemuarmv5.yml
rename to ci/qemuarmv5.yml
diff --git a/kas/sgi575.yml b/ci/sgi575.yml
similarity index 100%
rename from kas/sgi575.yml
rename to ci/sgi575.yml
diff --git a/kas/tc0.yml b/ci/tc0.yml
similarity index 100%
rename from kas/tc0.yml
rename to ci/tc0.yml
diff --git a/kas/update-repos b/ci/update-repos
similarity index 100%
rename from kas/update-repos
rename to ci/update-repos
--=20
2.25.1

