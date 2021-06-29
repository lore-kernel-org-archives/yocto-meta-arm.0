Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11875.1624988107733797066
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 10:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56B2F12FC
	for <meta-arm@lists.yoctoproject.org>; Tue, 29 Jun 2021 10:35:07 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B4363F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 29 Jun 2021 10:35:07 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [gatesgarth][PATCH 3/3] CI: add testing and testimage
Date: Tue, 29 Jun 2021 13:35:00 -0400
Message-Id: <20210629173500.24254-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629173500.24254-1-jon.mason@arm.com>
References: <20210629173500.24254-1-jon.mason@arm.com>

Add a testing task to the gitlab CI and run testimage in that job.
Currently, it only runs against some of the qemu based machines.
Using slirp, there is no need for a privileged container or tun/tap
devices.

Change-Id: Ia85a3d0089f7d4dc7595c3a45d328c79d8e675f1
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml   | 94 +++++++++++++++++++++++++++++++++++++++++-------
 ci/testimage.yml | 14 ++++++++
 2 files changed, 96 insertions(+), 12 deletions(-)
 create mode 100644 ci/testimage.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2720a68..641a5f1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -5,6 +5,7 @@ stages:
   - prep
   - bootstrap
   - build
+  - test
 
 # Common job fragment to get a worker ready
 .setup:
@@ -16,6 +17,7 @@ stages:
     DL_DIR: $CI_BUILDS_DIR/persist/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
     TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
+    IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
   before_script:
     - echo KAS_WORK_DIR = $KAS_WORK_DIR
     - echo SSTATE_DIR = $SSTATE_DIR
@@ -28,10 +30,29 @@ stages:
   extends: .setup
   interruptible: true
   script:
-  - KASFILES=$(ci/jobs-to-kas $CI_JOB_NAME)
-  - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
-  - kas build $KASFILES
-  - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
+    - KASFILES=$(./ci/jobs-to-kas $CI_JOB_NAME)
+    - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
+    - kas build $KASFILES
+    - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
+
+.build_artifacts:
+  artifacts:
+    paths:
+      - $IMAGE_DIR/*
+    expire_in: 1 day
+
+.test:
+  extends: .setup
+  stage: test
+  # Unique before_script here to avoid the rm from the one in .setup
+  before_script:
+    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
+  script:
+    - KASFILES=$(./ci/jobs-to-kas $CI_JOB_NAME)
+    # These are needed to avoid warnings about file permissions from the artifacts
+    - sudo chown -R builder $KAS_WORK_DIR
+    - sudo chgrp -R builder $KAS_WORK_DIR
+    - kas build $KASFILES -c testimage
 
 
 #
@@ -116,22 +137,34 @@ n1sdp/armgcc:
   allow_failure: true
 
 qemuarm:
-  extends: .build
-
-qemuarmv5:
-  extends: .build
+  extends:
+    - .build
+    - .build_artifacts
 
 qemuarm64-secureboot:
-  extends: .build
+  extends:
+    - .build
+    - .build_artifacts
 
 qemuarm64-secureboot/clang:
-  extends: .build
+  extends:
+    - .build
+    - .build_artifacts
 
 qemuarm64-secureboot/clang/musl:
-  extends: .build
+  extends:
+    - .build
+    - .build_artifacts
 
 qemuarm64-secureboot/musl:
-  extends: .build
+  extends:
+    - .build
+    - .build_artifacts
+
+qemuarmv5:
+  extends:
+    - .build
+    - .build_artifacts
 
 sgi575:
   extends: .build
@@ -140,6 +173,43 @@ tc0:
   extends: .build
 
 
+#
+# Third phase, the test jobs
+#
+
+# QEMU based machines can use testimage, others will need something else (i.e., LAVA)
+
+qemuarm/testimage:
+  extends: .test
+  needs:
+    - job: qemuarm
+
+qemuarm64-secureboot/testimage:
+  extends: .test
+  needs:
+    - job: qemuarm64-secureboot
+
+qemuarm64-secureboot/clang/testimage:
+  extends: .test
+  needs:
+    - job: qemuarm64-secureboot/clang
+
+qemuarm64-secureboot/clang/musl/testimage:
+  extends: .test
+  needs:
+    - job: qemuarm64-secureboot/clang/musl
+
+qemuarm64-secureboot/musl/testimage:
+  extends: .test
+  needs:
+    - job: qemuarm64-secureboot/musl
+
+qemuarmv5/testimage:
+  extends: .test
+  needs:
+    - job: qemuarmv5
+
+
 #
 # Utility tasks, not executed automatically
 #
diff --git a/ci/testimage.yml b/ci/testimage.yml
new file mode 100644
index 0000000..df2c22e
--- /dev/null
+++ b/ci/testimage.yml
@@ -0,0 +1,14 @@
+header:
+  version: 9
+
+local_conf_header:
+  testimage: |
+    IMAGE_CLASSES += "testimage"
+  slirp: |
+    TEST_RUNQEMUPARAMS = "slirp"
+    TEST_SERVER_IP = "127.0.0.1"
+    QEMU_USE_SLIRP = "1"
+
+# Multiple targets are available, put it down to just one
+target:
+  - core-image-base
-- 
2.17.1

