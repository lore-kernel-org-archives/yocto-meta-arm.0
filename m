Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6091.1619869752365427118
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 04:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BA4612FC
	for <meta-arm@lists.yoctoproject.org>; Sat,  1 May 2021 04:49:01 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AD163F70D
	for <meta-arm@lists.yoctoproject.org>; Sat,  1 May 2021 04:49:01 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: enable non-arm64 builders
Date: Sat,  1 May 2021 07:48:54 -0400
Message-Id: <20210501114854.1800-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501114854.1800-1-jon.mason@arm.com>
References: <20210501114854.1800-1-jon.mason@arm.com>

Abstract away all of the things preventing the current setup from
working on only internal, arm64 build hardware.

Change-Id: Ib8d0e8e76602d4553e044520a91349015b1aa19b
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                | 20 +++++--
 ci/base.yml                                   |  1 +
 ...rnal-gcc-arm32.yml => external-gccarm.yml} |  2 +-
 ci/get-binary-toolchains                      | 52 +++++++++++++++++++
 4 files changed, 71 insertions(+), 4 deletions(-)
 rename ci/{external-gcc-arm32.yml => external-gccarm.yml} (59%)
 create mode 100755 ci/get-binary-toolchains

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index dcf13b0..c4dd986 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,11 +15,12 @@ stages:
     SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
     DL_DIR: $CI_BUILDS_DIR/persist/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
+    TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
   before_script:
     - echo KAS_WORK_DIR = $KAS_WORK_DIR
     - echo SSTATE_DIR = $SSTATE_DIR
     - echo DL_DIR = $DL_DIR
-    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR
+    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
 
 # Generalised fragment to do a Kas build
 .build:
@@ -40,6 +41,12 @@ update-repos:
   script:
   - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
 
+get-binary-toolchains:
+  extends: .setup
+  stage: prep
+  script:
+    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR
+
 
 #
 # Bootstrap stage, bootstrap and machine coverage
@@ -78,7 +85,7 @@ fvp-base:
 fvp-base-arm32:
   extends: .build
 
-fvp-base-arm32/external-gcc-arm32:
+fvp-base-arm32/external-gccarm:
   extends: .build
 
 fvp-baser-aemv8r64:
@@ -174,6 +181,13 @@ delete-sstate:
   script:
   - rm -rf $SSTATE_DIR/*
 
+delete-toolchains:
+  extends: .setup
+  stage: prep
+  when: manual
+  script:
+  - rm -rf $TOOLCHAIN_DIR/*
+
 # Wipe out old sstate
 prune-sstate:
   extends: .setup
@@ -190,4 +204,4 @@ usage:
   stage: prep
   when: manual
   script:
-  - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR
+  - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR $TOOLCHAIN_DIR
diff --git a/ci/base.yml b/ci/base.yml
index 62bdead..4b1797e 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -22,6 +22,7 @@ repos:
 
 env:
   BB_LOGCONFIG: ""
+  TOOLCHAIN_DIR: ""
 
 local_conf_header:
   base: |
diff --git a/ci/external-gcc-arm32.yml b/ci/external-gccarm.yml
similarity index 59%
rename from ci/external-gcc-arm32.yml
rename to ci/external-gccarm.yml
index de8798e..ad03298 100644
--- a/ci/external-gcc-arm32.yml
+++ b/ci/external-gccarm.yml
@@ -5,4 +5,4 @@ local_conf_header:
   cc: |
     PNBLACKLIST[gcc-cross-arm] = "Using external toolchain"
     TCMODE = "external-arm"
-    EXTERNAL_TOOLCHAIN = "/usr/local/gcc-arm-10.2-2020.11-aarch64-arm-none-linux-gnueabihf"
+    EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_DIR}/${TARGET_ARCH}"
diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
new file mode 100755
index 0000000..6fa7ff4
--- /dev/null
+++ b/ci/get-binary-toolchains
@@ -0,0 +1,52 @@
+#!/bin/bash
+set -u
+
+HOST_ARCH=$(uname -m)
+VER="10.2-2020.11"
+
+DOWNLOAD_DIR=$1
+TOOLCHAIN_DIR=$2
+
+# These should be already created by .bitlab-ci.yml, but do here if run outside of that env
+mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR
+
+if [ $HOST_ARCH = "aarch64" ]; then
+	#AArch64 Linux hosted cross compilers
+
+	#AArch32 target with hard float (arm-none-linux-gnueabihf)
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+elif [ $HOST_ARCH = "x86_64" ]; then
+	#x86_64 Linux hosted cross compilers
+
+	#AArch32 target with hard float (arm-linux-none-gnueabihf)
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+
+	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
+
+	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
+else
+	echo "ERROR - Unknown build arch of $HOST_ARCH"
+	exit 1
+fi
+
+for i in arm aarch64 aarch64_be; do
+	if [ ! -f $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
+		continue
+	fi
+
+	if [ -d $TOOLCHAIN_DIR/$i ]; then
+		echo "$TOOLCHAIN_DIR/$i EXISTS!"
+		MANIFEST=$(ls $TOOLCHAIN_DIR/$i | grep txt)
+		if [[ $MANIFEST != $VER-$HOST_ARCH-$i-none-linux-gnu*.txt ]]; then
+			echo "Removing old $MANIFEST for $VER-$HOST_ARCH-$i-*.txt toolchain"
+			rm -rf $TOOLCHAIN_DIR/$i
+		fi
+	fi
+
+	if [ ! -d $TOOLCHAIN_DIR/$i ]; then
+		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz
+		mv $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*/ $TOOLCHAIN_DIR/$i
+	fi
+done
-- 
2.17.1

