Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6386.1627415214689102291
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 12:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6323A31B
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 12:46:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 491FA3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 12:46:53 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] CI: Add bootstrap for clang
Date: Tue, 27 Jul 2021 15:46:47 -0400
Message-Id: <20210727194648.25710-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727194648.25710-1-jon.mason@arm.com>
References: <20210727194648.25710-1-jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml         | 10 +++++++---
 ci/clang-bootstrap.yml | 10 ++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 ci/clang-bootstrap.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 949c80a..6cfe1d0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -60,6 +60,10 @@ n1sdp/bootstrap:
   extends: .build
   stage: bootstrap
 
+n1sdp/clang/clang-bootstrap:
+  extends: .build
+  stage: bootstrap
+
 # What percentage of machines in the layer do we build
 machine-coverage:
   stage: bootstrap
@@ -68,6 +72,9 @@ machine-coverage:
   - ./ci/check-machine-coverage
   coverage: '/Coverage: \d+/'
 
+toolchains:
+  extends: .build
+  stage: bootstrap
 
 #
 # Build stage, the actual build jobs
@@ -81,9 +88,6 @@ check-layers:
   - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy.yml:ci/meta-python.yml --command \
     "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.yml $CI_PROJECT_DIR $KAS_WORK_DIR"
 
-toolchains:
-  extends: .build
-
 corstone500:
   extends: .build
 
diff --git a/ci/clang-bootstrap.yml b/ci/clang-bootstrap.yml
new file mode 100644
index 0000000..f5497ff
--- /dev/null
+++ b/ci/clang-bootstrap.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+
+target:
+  - binutils-cross-aarch64
+  - clang-cross-aarch64
+  - clang-native
+  - python3-native
+  - opkg-native
+  - rpm-native
-- 
2.17.1

