Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA36C433FE
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 09:49:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.4512.1651657741786320112
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 02:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=O9ofHx19;
 spf=pass (domain: linaro.org, ip: 209.85.215.175,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f175.google.com with SMTP id 7so739709pga.12
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sc6mBF83C83WYOZlyFL5T1pNpEjogHUJuRXKDM1cTk8=;
        b=O9ofHx19+ByZIHyEFVifTmEq7qvtLNK2OcoBBeIyFxtweecvu78uq1DDEjUnlVuu4m
         cGIOdr+QQJyl+XECc0tc8VhNIF09ad6giP65dcAo7O9cINus9dZoRUvNVcrRP8ly08M8
         BJ8umqgkkMqcN522+QNvgfjYrrEqa8Bk+JH7JrMEcoSlSprwzKOfDd3FeeNDh45Rsonu
         xZkNIxi7OEEga+FdS7HvkMByKWbNZCaTr0MZrmzM+aWkzXBjRlZ1J++LZa5hhDgbFNtx
         ngynde1Bgaqkv/rUU1L5hzCV5SvAlpYhopHFAfQ/jN/S1hjIsDx4m0WZfW6KDQaoV+uT
         2zJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sc6mBF83C83WYOZlyFL5T1pNpEjogHUJuRXKDM1cTk8=;
        b=nPCNZ6OedS/Wo3DRxSvZk55KAxKB0+hRJQYwt+3IS4VrUAnJg1Rv+bbCNWLKE/4diA
         wcPsrldDOItBkyG2jjtawt14C2Twp5ToOBKPMouaUv92SUElF04jsgJHleLxbPnOyqu6
         ncyhocKBHzNT6jpGB6T4YGn917XQ86iJuh3COXpIx5XT1PUevytayEZUBov7FlYhINSl
         KmQ3g5wTRfQ8CWSR4BwQ4yjHxApJasWyy/l1aNFCg4J2Sva2oFmRTCei0yfrhlEPLOnT
         zLmSziJfEI+hi2OyYCUBdQnEQu5difrlxUPyIcJ0cwncUVlI456R3FFkg2TXxuPmZQ/b
         EJZg==
X-Gm-Message-State: AOAM532L18cskiBbdXEGJVr7ybtyugCWmpdOIE3fAFiHh63ANfVuVJiS
	XIhwAGEJhJQAr6V68hJIYDszwZsV0zj0Bw==
X-Google-Smtp-Source: 
 ABdhPJz+yBzMVg/4+gul6D3DMZj6AbfGhhAPyL232D4RC9mYgcA5S1PmsWx4Lt/ytqsFoMSTCkvoEw==
X-Received: by 2002:aa7:88d1:0:b0:510:3ee2:3f25 with SMTP id
 k17-20020aa788d1000000b005103ee23f25mr1793638pff.41.1651657741112;
        Wed, 04 May 2022 02:49:01 -0700 (PDT)
Received: from localhost.localdomain ([223.177.214.13])
        by smtp.gmail.com with ESMTPSA id
 s6-20020aa78286000000b0050dc76281d1sm8063172pfm.171.2022.05.04.02.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 02:49:00 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 2/2] linux-yocto: tee.cfg: Enable TEE based fTPM driver
Date: Wed,  4 May 2022 15:18:51 +0530
Message-Id: <20220504094851.201843-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504094851.201843-1-sumit.garg@linaro.org>
References: <20220504094851.201843-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 09:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3351

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
index 3de03bf..9a25cd5 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/tee.cfg
@@ -8,3 +8,5 @@ CONFIG_OPTEE=y
 CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=1
 # end of TEE drivers
 
+CONFIG_TCG_TPM=y
+CONFIG_TCG_FTPM_TEE=y
-- 
2.17.1


