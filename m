Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6702.1627415214684926927
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 12:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C7291FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 12:46:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CF8D3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 12:46:53 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI: merge testimage into the build stage
Date: Tue, 27 Jul 2021 15:46:46 -0400
Message-Id: <20210727194648.25710-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml   | 98 +++++++-----------------------------------------
 ci/testimage.yml |  1 +
 2 files changed, 14 insertions(+), 85 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a3c4493..949c80a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -5,7 +5,6 @@ stages:
   - prep
   - bootstrap
   - build
-  - test
 
 # Common job fragment to get a worker ready
 .setup:
@@ -35,26 +34,6 @@ stages:
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
 
-.build_artifacts:
-  artifacts:
-    paths:
-      - $IMAGE_DIR/*
-    expire_in: 1 day
-
-.test:
-  extends: .setup
-  stage: test
-  # Unique before_script here to avoid the rm from the one in .setup
-  before_script:
-    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
-  script:
-    - KASFILES=$(./ci/jobs-to-kas $CI_JOB_NAME)
-    # These are needed to avoid warnings about file permissions from the artifacts
-    - sudo chown -R builder $KAS_WORK_DIR
-    - sudo chgrp -R builder $KAS_WORK_DIR
-    - kas build $KASFILES -c testimage
-
-
 #
 # Prep stage, update repositories once
 #
@@ -162,83 +141,32 @@ n1sdp/armgcc:
 qemu-cortex-a53:
   extends: .build
 
-qemuarm:
-  extends:
-    - .build
-    - .build_artifacts
-
-qemuarm64-sbsa:
-  extends:
-    - .build
-    - .build_artifacts
-
-qemuarm64-secureboot:
-  extends:
-    - .build
-    - .build_artifacts
-
-qemuarm64-secureboot/clang:
-  extends:
-    - .build
-    - .build_artifacts
-
-qemuarm64-secureboot/clang/musl:
-  extends:
-    - .build
-    - .build_artifacts
-
-qemuarm64-secureboot/musl:
-  extends:
-    - .build
-    - .build_artifacts
-
-qemuarmv5:
-  extends:
-    - .build
-    - .build_artifacts
-
-sgi575:
+qemuarm/testimage:
   extends: .build
 
-tc0:
+qemuarm64-sbsa:
   extends: .build
 
-
-#
-# Third phase, the test jobs
-#
-
-# QEMU based machines can use testimage, others will need something else (i.e., LAVA)
-
-qemuarm/testimage:
-  extends: .test
-  needs:
-    - job: qemuarm
-
 qemuarm64-secureboot/testimage:
-  extends: .test
-  needs:
-    - job: qemuarm64-secureboot
+  extends: .build
 
 qemuarm64-secureboot/clang/testimage:
-  extends: .test
-  needs:
-    - job: qemuarm64-secureboot/clang
+  extends: .build
 
 qemuarm64-secureboot/clang/musl/testimage:
-  extends: .test
-  needs:
-    - job: qemuarm64-secureboot/clang/musl
+  extends: .build
 
 qemuarm64-secureboot/musl/testimage:
-  extends: .test
-  needs:
-    - job: qemuarm64-secureboot/musl
+  extends: .build
 
 qemuarmv5/testimage:
-  extends: .test
-  needs:
-    - job: qemuarmv5
+  extends: .build
+
+sgi575:
+  extends: .build
+
+tc0:
+  extends: .build
 
 
 #
diff --git a/ci/testimage.yml b/ci/testimage.yml
index df2c22e..adc7765 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -4,6 +4,7 @@ header:
 local_conf_header:
   testimage: |
     IMAGE_CLASSES += "testimage"
+    TESTIMAGE_AUTO = "1"
   slirp: |
     TEST_RUNQEMUPARAMS = "slirp"
     TEST_SERVER_IP = "127.0.0.1"
-- 
2.17.1

