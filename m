Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.335.1631555081368356463
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B2C96D
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 10:44:40 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 780233F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 10:44:40 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] ci: make get-binary-toolchain run per build
Date: Mon, 13 Sep 2021 13:44:35 -0400
Message-Id: <20210913174436.19864-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

In a distributed, non-homogeneous CI setup, the binary-toolchain setup
script might not run on the machine that needs the toolchains.  Make
this per-build and it will always be there, at the expense of running on
builds that might not need it (though it still should be fast).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml           | 9 ++-------
 ci/get-binary-toolchains | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 697603b..ab254f6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -24,6 +24,8 @@ stages:
     - echo DL_DIR = $DL_DIR
     - rm -rf $KAS_WORK_DIR
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
+    # Must do this here, as it's the only way to make sure the toolhchain is installed on the same builder
+    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR
 
 # Generalised fragment to do a Kas build
 .build:
@@ -43,13 +45,6 @@ update-repos:
   script:
   - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
 
-get-binary-toolchains:
-  extends: .setup
-  stage: prep
-  script:
-    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR
-
-
 #
 # Bootstrap stage, bootstrap and machine coverage
 #
diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 6fa7ff4..fae3b01 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -7,7 +7,7 @@ VER="10.2-2020.11"
 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
 
-# These should be already created by .bitlab-ci.yml, but do here if run outside of that env
+# These should be already created by .gitlab-ci.yml, but do here if run outside of that env
 mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR
 
 if [ $HOST_ARCH = "aarch64" ]; then
-- 
2.17.1

