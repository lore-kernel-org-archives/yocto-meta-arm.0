Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF04C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:12:56 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.8890.1647515576166796708
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 04:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dfgjYdgJ;
 spf=pass (domain: linaro.org, ip: 209.85.215.182,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f182.google.com with SMTP id q19so2410784pgm.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Q6S5lpcHhh7CKLItXqkpc53XuoQmiA+exWwVn4Oxic=;
        b=dfgjYdgJCnL+JMiwDjqSNH3X+S+wZ6gQGG2/1ohk6vo2qRdcSX9bTDSD65kjJLc/e0
         iU6Sz7Z0HcX6uhsEgHky46ZehpvaSpAeIKDmHnauLLHgo1hhWRyMUtB2bOiT4j0Ukytb
         +5irSR1FYdeFg2GKJeIWAfiPmReEf3GYSo7dA4OdOmUFpCUQcKJLsVj6Z2V8p1TvkduI
         Hs3srXTev5RzNZ7bJrnuo3QFEKwRwkAR3gjiFyFFOBlwjNDF8GDT361z7umSXaxxmy5g
         FSwGlgIqzcNINaX2NYWvdpEuhQCLagtK1mACyonIFCiIvAvFq1z7FqSw+y4MOPTf3Fkq
         bb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Q6S5lpcHhh7CKLItXqkpc53XuoQmiA+exWwVn4Oxic=;
        b=CXSM/5mTuszRfMxuvegEDfsp5vSCdLQLwLZZFz/52POt/ZkSm7yydmW0De6iSgkA7R
         pUTuKp1kiYR3Vpzd8XPDkYvMjQryvYlZpEeuAPo+kMhkEWmX9naVaFTuyQ3ekhUPUtzZ
         14fL8oRqYgaZ7WOvaZRbvM0+f6rAwPf4tFEce+ZIAEW1MdQ6AfIDzzhhYsE1+aKv/B8Y
         TyxpDCB+/OSId+7z69WE5QxhFMCt16MUFWZQu8o83fxqxnspkHLOwsVkvkB9RQLUmr/6
         xKLI6Xfy72ewc0IoFuoJ74b0xkTtNC8q/Y9fckTVPMl1NmYoUtGryS2h32F4Pygjf9M2
         lyXA==
X-Gm-Message-State: AOAM532wUxQ8dHKfCEFuL3tMhKgELE6RVom3qfNpI8SNF47v9RGeb23i
	iVNIaYnRPBkEJjrrlatStpsAPvjaDoJI8QVq
X-Google-Smtp-Source: 
 ABdhPJxICv+xsUc1G3M7XsYz59JoZlNmnQbzSRI3ljmb73diw7iPJFycStOLZF/J5L26hjL1sBvgjg==
X-Received: by 2002:a05:6a00:703:b0:4f7:299d:46af with SMTP id
 3-20020a056a00070300b004f7299d46afmr4466869pfl.25.1647515575362;
        Thu, 17 Mar 2022 04:12:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1c2a:216d:acc2:e79:3074:833e])
        by smtp.gmail.com with ESMTPSA id
 v23-20020a17090a521700b001bbfc181c93sm9170291pjh.19.2022.03.17.04.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:12:55 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denis@denix.org,
	daniel.thompson@linaro.org,
	ralph.siemsen@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 2/2] ci: update Arm source and binary gcc version to 10.3
Date: Thu, 17 Mar 2022 16:42:32 +0530
Message-Id: <20220317111232.488767-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317111232.488767-1-sumit.garg@linaro.org>
References: <20220317111232.488767-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Mar 2022 11:12:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3179

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 ci/armgcc.yml            |  2 +-
 ci/get-binary-toolchains | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/ci/armgcc.yml b/ci/armgcc.yml
index d63ae24..d46f0b3 100644
--- a/ci/armgcc.yml
+++ b/ci/armgcc.yml
@@ -3,4 +3,4 @@ header:
 
 local_conf_header:
   cc: |
-    GCCVERSION = "arm-10.3"
+    GCCVERSION = "arm-11.2"
diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 838342a..bfdd8c5 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u
 
 HOST_ARCH=$(uname -m)
-VER="10.3-2021.07"
+VER="11.2-2022.02"
 
 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
@@ -15,18 +15,18 @@ if [ $HOST_ARCH = "aarch64" ]; then
 	#AArch64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-none-linux-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
 elif [ $HOST_ARCH = "x86_64" ]; then
 	#x86_64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-linux-none-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
 else
 	echo "ERROR - Unknown build arch of $HOST_ARCH"
 	exit 1
-- 
2.17.1


