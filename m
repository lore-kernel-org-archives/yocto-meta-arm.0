Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFECC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 07:16:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.25697.1664176578893419410
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 00:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lvVsseDX;
 spf=pass (domain: linaro.org, ip: 209.85.210.179,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f179.google.com with SMTP id d82so5763196pfd.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8AbV3Oc0wLDiFl6MJjuTsBGl2IYrU3ft8/cJ36jPObU=;
        b=lvVsseDXjjWvYffg7oT54N8rCh0n8G3ws/h4TqlFhE7TsMNZJ4q6fkwUtuy5v9gysd
         IBmbMApkWOnlxXml0cPIfc39j1DxFBeMsXa1m3ug4WW3pUyeQi4XgOPLdAhVRfL4AcIi
         6m9UDxgdlgntEPhrNNJCoMtHIW8BcmLY5OfQKG8cs1ZtZWUVc19c86wAr6BtedK/6hac
         NCySZ6wYsFE9vLSUEN8b7+kd+SDXZGzEeLIKqNcKZgAJqHjD0sORFmj1aZcFgo7CeOls
         L0Ta7Valo+36MxBUS0Sxkol1k2A0lMhobwTujiOAumZxw+smzO0P1eJICvF9ACKXsoaC
         u9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8AbV3Oc0wLDiFl6MJjuTsBGl2IYrU3ft8/cJ36jPObU=;
        b=H1mMRDBpKrzEW1Vqkw1yfyIbjLekFFcpmun9XXIr9FGqTA86AGFQywxewIpwSozzkF
         qDmVGaVVexqK2mPgjTHyTKAEFmBVsN+7VRi8AXFhD+TlDLWfJxRG5LVtUwgvdNrTGhR+
         F6WNoNTZn7tYObvqoc724dLr7h4pTpl/Hrq6862f3FYeKueSATEOT6I8pL0jFbS4VYiR
         L1YmxY/RdWaZoxS470H5q0epXQx9ObSs1StgpH/iPlFHJOTlxev9yP1cmThy3fQTnvSr
         zphivIVMh/dYZrz5EuUjb+dwOddd6//UzXlCEGtclzO214jhZve1+HcuM6IASRKcwN3s
         SnBA==
X-Gm-Message-State: ACrzQf3NUxcpUV03RD986zo988omL0rhvXWRNFph68WS8I3cEpnqXhjG
	o1pa7TlWOJ9CYOlmd9vrg41/QsxcL00FiA==
X-Google-Smtp-Source: 
 AMsMyM6QgJEL2BixIcIjq+KVcqYH06S2hn4SZiauMU8JmiA2xkKNZlNLSKeoKnG67i4P6g1+sxeyoA==
X-Received: by 2002:a63:a556:0:b0:439:f022:426a with SMTP id
 r22-20020a63a556000000b00439f022426amr18522792pgu.120.1664176577899;
        Mon, 26 Sep 2022 00:16:17 -0700 (PDT)
Received: from sumit-X1.. ([223.178.208.81])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a170902714b00b00176dac464e5sm10401408plm.173.2022.09.26.00.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:16:17 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denis@denix.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 2/2] external-arm-toolchain: Enable 11.3.rel1 support
Date: Mon, 26 Sep 2022 12:46:05 +0530
Message-Id: <20220926071605.123085-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926071605.123085-1-sumit.garg@linaro.org>
References: <20220926071605.123085-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 07:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3830

Enable support for 11.3.rel1 binary toolchain release. Also, update CI
to use it.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 ci/get-binary-toolchains                       | 18 +++++++++---------
 .../external-arm-toolchain-versions.inc        |  7 +++++--
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index bfdd8c57..ed334bf3 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u
 
 HOST_ARCH=$(uname -m)
-VER="11.2-2022.02"
+VER="11.3.rel1"
 
 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
@@ -15,32 +15,32 @@ if [ $HOST_ARCH = "aarch64" ]; then
 	#AArch64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-none-linux-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
 elif [ $HOST_ARCH = "x86_64" ]; then
 	#x86_64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-linux-none-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
 else
 	echo "ERROR - Unknown build arch of $HOST_ARCH"
 	exit 1
 fi
 
 for i in arm aarch64 aarch64_be; do
-	if [ ! -d $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*/ ]; then
-		if [ ! -f $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
+	if [ ! -d $TOOLCHAIN_DIR/arm-gnu-toolchain-$VER-$HOST_ARCH-$i-none-linux-gnu*/ ]; then
+		if [ ! -f $DOWNLOAD_DIR/arm-gnu-toolchain-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
 			continue
 		fi
 
-		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz
+		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/arm-gnu-toolchain-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz
 	fi
 
 	# Setup a link for the toolchain to use local to the building machine (e.g., not in a shared location)
-	ln -s $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu* $TOOLCHAIN_LINK_DIR/$i
+	ln -s $TOOLCHAIN_DIR/arm-gnu-toolchain-$VER-$HOST_ARCH-$i-none-linux-gnu* $TOOLCHAIN_LINK_DIR/$i
 done
diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index 244de26a..92fb038c 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -23,12 +23,15 @@ def eat_get_version(d):
         last_line = stderr.splitlines()[-1]
         return last_line
 
-# Extract the YYYY.MM version
+# Extract the YYYY.MM or release version
 def eat_get_main_version(d):
     version = eat_get_version(d)
     bb.debug(2, 'Trying for parse version info from: %s' % version)
     if version != 'UNKNOWN':
-        if version.split()[4] == '(GNU':
+        if version.split()[4] == '(Arm':
+            # gcc version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)
+            return version.split()[7].split(')')[0]
+        elif version.split()[4] == '(GNU':
             # gcc version 9.2.1 20191025 (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10))
             # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26))
             return version.split()[10].split('-')[1]
-- 
2.17.1


