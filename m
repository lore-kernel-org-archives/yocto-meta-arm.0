Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12027.1631634232613228663
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 08:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5474101E
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Sep 2021 08:43:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A2823F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Sep 2021 08:43:45 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 1/2] ci: make get-binary-toolchain run per build
Date: Tue, 14 Sep 2021 11:43:38 -0400
Message-Id: <20210914154339.23173-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

In a distributed, non-homogeneous CI setup, the binary-toolchain setup
script might not run on the machine that needs the toolchains.  Make
this per-build and it will always be there, at the expense of running on
builds that might not need it (though it still should be fast).

Also, there is an issue with the directory where the binary toolchain is
located being global, and racing against other systems using, setting up,
and tearing down.  Link this to a local directory to avoid any races.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml           | 12 ++++--------
 ci/external-gccarm.yml   |  2 +-
 ci/get-binary-toolchains | 24 +++++++++---------------
 3 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 697603b..ae2b346 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -18,12 +18,15 @@ stages:
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
     TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
     IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
+    TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
   before_script:
     - echo KAS_WORK_DIR = $KAS_WORK_DIR
     - echo SSTATE_DIR = $SSTATE_DIR
     - echo DL_DIR = $DL_DIR
     - rm -rf $KAS_WORK_DIR
-    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
+    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
+    # Must do this here, as it's the only way to make sure the toolchain is installed on the same builder
+    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
 
 # Generalised fragment to do a Kas build
 .build:
@@ -43,13 +46,6 @@ update-repos:
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
diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index ad03298..0ce4795 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -5,4 +5,4 @@ local_conf_header:
   cc: |
     PNBLACKLIST[gcc-cross-arm] = "Using external toolchain"
     TCMODE = "external-arm"
-    EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_DIR}/${TARGET_ARCH}"
+    EXTERNAL_TOOLCHAIN = "${TOPDIR}/toolchains/${TARGET_ARCH}"
diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 6fa7ff4..e860ec2 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -6,9 +6,10 @@ VER="10.2-2020.11"
 
 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
+TOOLCHAIN_LINK_DIR=$3
 
-# These should be already created by .bitlab-ci.yml, but do here if run outside of that env
-mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR
+# These should be already created by .gitlab-ci.yml, but do here if run outside of that env
+mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
 
 if [ $HOST_ARCH = "aarch64" ]; then
 	#AArch64 Linux hosted cross compilers
@@ -32,21 +33,14 @@ else
 fi
 
 for i in arm aarch64 aarch64_be; do
-	if [ ! -f $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
-		continue
-	fi
-
-	if [ -d $TOOLCHAIN_DIR/$i ]; then
-		echo "$TOOLCHAIN_DIR/$i EXISTS!"
-		MANIFEST=$(ls $TOOLCHAIN_DIR/$i | grep txt)
-		if [[ $MANIFEST != $VER-$HOST_ARCH-$i-none-linux-gnu*.txt ]]; then
-			echo "Removing old $MANIFEST for $VER-$HOST_ARCH-$i-*.txt toolchain"
-			rm -rf $TOOLCHAIN_DIR/$i
+	if [ ! -d $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*/ ]; then
+		if [ ! -f $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
+			continue
 		fi
-	fi
 
-	if [ ! -d $TOOLCHAIN_DIR/$i ]; then
 		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz
-		mv $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*/ $TOOLCHAIN_DIR/$i
 	fi
+
+	# Setup a link for the toolchain to use local to the building machine (e.g., not in a shared location)
+	ln -s $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu* $TOOLCHAIN_LINK_DIR/$i
 done
-- 
2.17.1

