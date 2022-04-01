Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3C8C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 14:41:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.11654.1648824104302195226
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oqo5FU8W;
 spf=pass (domain: linaro.org, ip: 209.85.128.53,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id
 i132-20020a1c3b8a000000b0038ce25c870dso3661179wma.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QbKAncYfRxKjAu49RBbmIhuOOL/46sQdw1WLC7NALpg=;
        b=oqo5FU8WWaebzmEwgdC8m7tPFkYCIBE7mfW1w095iq8F/WWTuEe/jL5RpS+IGnadi7
         V3IEsEZYuxK06hNxblDzHjtwjvIxUd2IfBA5cYEEziBsvwNyOPDCA04fjK05CJp0wZ+u
         5/Za0joaRakfwlWA3T12TaHKkwh+Pz8ah52dgmS9hSuG9Biz1K4iiYa/RL9gvOgHepZe
         AeSOlb3OAfmcbs1PVEirih9tnFdZ9ncw68tUmmhBVUhoDIrsmX/imzQ6L8ufahjU8PRo
         +2Xhl7IwYeQjVtTh6FqaiKdpqo1byonR2LlZZBJVl9lDA5BJf7YyVBooB26Fp2+7uvgn
         UPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QbKAncYfRxKjAu49RBbmIhuOOL/46sQdw1WLC7NALpg=;
        b=gZVZQJdKQGRfozk5m6NuoaFT0olT5Eab4wjdmZe3LfImSqgdIdMKDv9ID6Pi0rCnNX
         zPX7xCPv4m/WOzhNGAHy2fSAXCi5X701fX3K55T+eaFygRa9kKKIrRmcPE5oc4tERBv7
         ECmbvL7IfBVmVcuzKWk06HMzlftMn5H3SIGTGf8paQ9b4+bWD335wEOKOhwlhDt5k5S9
         laSAQ8hRXCzQMY++iyTsJXVWMyRkLevgWN98fS4vwv9WrS4cVQV/kPeDQUD+79WYgv3d
         LJnf9ZCTy5yLW+8ZsgrxeZ+LK/FdP6PbdLqTR+r03HxHI2AuLrf6gh5esmUkhex1j7xN
         3Bnw==
X-Gm-Message-State: AOAM530VoFrpUi66kjtUCDdKSNnaQCJy8zbYxrE4qU6iktMkNgbtCDZp
	30BIlzVD9QBvd6P46A/k5EPSwv8TxigS+w==
X-Google-Smtp-Source: 
 ABdhPJxZ1hD0w9zWxWS/gx28Ah46sqe4AAyB/9s7DlUKCKNKeci3fmLwaeN7p6b17PE0VN5pDeHlSg==
X-Received: by 2002:a05:600c:ca:b0:38c:b426:3124 with SMTP id
 u10-20020a05600c00ca00b0038cb4263124mr9191779wmm.59.1648824102660;
        Fri, 01 Apr 2022 07:41:42 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b00203ff46f802sm3144144wrn.36.2022.04.01.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:41:42 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 4/4] arm-bsp/corstone500/docs: update for kas and runfvp
Date: Fri,  1 Apr 2022 15:41:28 +0100
Message-Id: <20220401144128.3517236-5-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401144128.3517236-1-rui.silva@linaro.org>
References: <20220401144128.3517236-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Apr 2022 14:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3229

Update corstone500 documentation to reflect the new build
infrastructure (kas) and the in tree run of the fvp using the
runfvp command.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/documentation/corstone500.md | 28 +++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone500.md b/meta-arm-bsp/documentation/corstone500.md
index 92f8a9842079..0f019611b728 100644
--- a/meta-arm-bsp/documentation/corstone500.md
+++ b/meta-arm-bsp/documentation/corstone500.md
@@ -3,22 +3,26 @@
 ## Howto Build and Run
 
 ### Configuration:
-In the local.conf file, MACHINE should be set as follow:
-MACHINE ?= "corstone500"
-DISTRO ?= "poky-tiny"
 
-Or set environment variables with that values:
-
-MACHINE "corstone500"
-DISTRO "poky-tiny"
+Use the kas
 
 ### Build:
-``bash$ bitbake arm-reference-image```
+
+``bash$ kas build kas/corstone500.yml
 
 ### Run:
-To run the result in a Fixed Virtual Platform please get:
-https://git.linaro.org/landing-teams/working/arm/model-scripts
 
-and follow the instructions in the readme.txt file in that
-repository.
+Building using kas should have fetch the Fixed Virtual Platform for this
+platform and installed at:
+
+build/tmp/sysroots-components/x86_64/fvp-corstone500-native/usr/bin/./FVP_Corstone-500
+
+with this in place is possible to launch the FVP using the runfvp inside the
+scripts directory:
+
+cd scripts
+
+./runfvp ../build/tmp/deploy/images/corstone500/core-image-minimal-corstone500.fvpconf --console
+
+this will output the console in the launching terminal
 
-- 
2.35.1


