Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8E5C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:50:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.418.1647046258683352469
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=kVB4ra94;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id gm1so8275653qvb.7
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wAYldYB8rwRSXWQCZJ05BBewiUKuMspUIHeLLl4EOpQ=;
        b=kVB4ra94nb2HAnCaXkxW8tXBHVUJ1nDKBOG6BA308iqcD5WO9gIG+dYWki4BWvnQfz
         YqB6ODjRNCXtL8pT0DpedpJFC5H3mzXO6xwmo4Yq3G2H+BCcU7bInoscEkGjBKcQD4XE
         TUsvSu7EyLU/nPZWzxX8eKCY+GuMojLjgEbDwZJhtLMPEql2jszCONV0Rud1wYguy2st
         PeBKqbUmLCgjl4L536tERrhyFzNudaay6JEipczO1kVAwIDqEbvAG3gNexMOB1piMcEK
         KwcHciy3IHDiZVn/Ir/H6uLuQXV0doXj2tBHzEWORg99ZNQ5T2NHyRlRgv/MbfOdjNPJ
         2FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wAYldYB8rwRSXWQCZJ05BBewiUKuMspUIHeLLl4EOpQ=;
        b=RctJjiKyEPuEgTG7wj7iECXxb1WsIhfyZpPLRMWeCOownTUHXTV/asBSBxPxDXuRMT
         UsGPPKCOH65XIfjLbB9Ql4ygrecYqii6bblrS8Ump5zEcjc3FMFqSLdvtx423ckL7DmX
         yHhr6aMBTMZ13O590ExxVlwUWjsn4+P5duNPYwb3C5ntDiJwcSfxRpw08O2ANvEhjNu8
         XlExW1pGOTI6GDWFMqkkRgxbm+C/IC0iYFsVN1g/8X8Ds796hNjizQCv968wDyiqJVro
         Lm/cEX7ABJFv2yEcf3KcCLGlKJy4ZtBSbJREBmIDp3rZUWGRZiN9+Ehy+QLEtyaPLYlI
         YSmw==
X-Gm-Message-State: AOAM531MicFo8MdiTfXN5RacNtj83aZkGcu+qXY9jCIvNg5G2wQkA3Ft
	JtsBFixUan2Gi5RCrMY2QXadZaKbLLK/sw==
X-Google-Smtp-Source: 
 ABdhPJx4CZ2/D/GSHLlhCLAAU9NVK7jkCKW9GUzNUJHwCQ0KXWn6qQaljzu5/eF8yGn/EIip3VK8+A==
X-Received: by 2002:ad4:5bc1:0:b0:42d:758c:f694 with SMTP id
 t1-20020ad45bc1000000b0042d758cf694mr9976699qvt.99.1647046257585;
        Fri, 11 Mar 2022 16:50:57 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:77d1:5990:d885:810c])
        by smtp.gmail.com with ESMTPSA id
 w9-20020ac87e89000000b002e039503dc7sm6673467qtj.18.2022.03.11.16.50.57
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:50:57 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH hardknott 2/2] ci: make get-binary-toolchain run per build
Date: Fri, 11 Mar 2022 19:50:56 -0500
Message-Id: <20220312005056.3864844-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220312005056.3864844-1-jon.mason@arm.com>
References: <20220312005056.3864844-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 00:50:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3161

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
index 102927db4f2a..2a55cd63abeb 100644
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


