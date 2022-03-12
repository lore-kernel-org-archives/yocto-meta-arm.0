Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2568C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:51:31 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.448.1647046290800039282
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Qt/EmZfm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id q194so8386550qke.5
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LWYASNrksIzWwCj9tJ7TTG5el2HOU1pYfZXwup3oooc=;
        b=Qt/EmZfmn+Pgl9y9P4mEFCxG0qosn9WQ0gzL5hFC3eOMCuDR0Z3607Cb90fXLjZ52t
         aEZ2jlUoqSYUMC5fn54LebuoX23CgViKF7KL2QPYdI0jeeytbx+gxO3ZkmEAL0/+P1Ey
         4aKH0u0+75wEel2Eb1QYWmjFGR/NCMhQANtgxIU9iMjo23lC9844Ump8tXzGoaLGh+Zq
         kFK8olNq4tNp5wYQKMaaZlr4Fisu0dObQGdU0x6wqq69ka4xPemM+/YzSPSRdTzagLc+
         1R2BTOQ+sKYly8g/cqwQHsTOvMaJcOTHx1+HEV7FK1WpaaNrfo+XcCc/e6ndtNqQ6LcM
         H2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LWYASNrksIzWwCj9tJ7TTG5el2HOU1pYfZXwup3oooc=;
        b=hUu3MTFFs3FLv5jv2VMiyTrYkBZsvAvFhJ8ji7FNK40lVmG0dJ909Rk+d3kMtJ+9Lv
         rUv/UeQ4Q/uEtZoQgmOfxKYM8sbO0R1nt4wS4PzhamhWQ7FYKwX7SS0wfgeucDqvFJvO
         Kkk2oToz1mPQfU/5YIXQk/kQdlkejbgcq27Bz+/BuAKCwEsF1F6l5uhMg9ji8Bp1WMCP
         WfnCgzUT78bOrfbueR8N2Yn4VdvbtvRx5B+bDsXNa+EIQZS2J+VjtG/L9CnAyc0AoheH
         SURX+Es20j5s1mEP3hsjLcSyohDCNciNtiVmjaYxgWJ1H0l2C9FwXGj3beWpAmCxTFAN
         hfvg==
X-Gm-Message-State: AOAM532LcPH0Qb5zcdWsiDdb9tuNU2Klvc+Cc39QBYD6uLxR6MfzWEzO
	M7fiDk3WcN6Odl72sCC39Lj2IpNNZHqPRg==
X-Google-Smtp-Source: 
 ABdhPJz77af4Zh3rg4jw9SUPf+gclQGs7qVvQO+XfJjyGIycyoRucipU7PnnT7/xal4VEmt768qUtg==
X-Received: by 2002:a05:620a:198b:b0:67d:5ca1:c5de with SMTP id
 bm11-20020a05620a198b00b0067d5ca1c5demr6495265qkb.270.1647046289646;
        Fri, 11 Mar 2022 16:51:29 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:77d1:5990:d885:810c])
        by smtp.gmail.com with ESMTPSA id
 g9-20020ac85d49000000b002dff273cce5sm6518426qtx.72.2022.03.11.16.51.29
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:51:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH gatesgarth 2/2] ci: make get-binary-toolchain run per build
Date: Fri, 11 Mar 2022 19:51:28 -0500
Message-Id: <20220312005128.3864989-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220312005128.3864989-1-jon.mason@arm.com>
References: <20220312005128.3864989-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 00:51:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3163

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
index 4d6e8344149d..39305a1205f0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -19,12 +19,15 @@ stages:
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
@@ -44,13 +47,6 @@ update-repos:
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
index ad0329835041..0ce47952ba3f 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -5,4 +5,4 @@ local_conf_header:
   cc: |
     PNBLACKLIST[gcc-cross-arm] = "Using external toolchain"
     TCMODE = "external-arm"
-    EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_DIR}/${TARGET_ARCH}"
+    EXTERNAL_TOOLCHAIN = "${TOPDIR}/toolchains/${TARGET_ARCH}"
diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 6fa7ff439232..e860ec267e18 100755
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
2.30.2


