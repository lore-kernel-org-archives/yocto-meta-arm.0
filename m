Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1FCC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:22:45 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.7941.1645496564889230195
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BAYsZ/Uw;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id b8so16884233pjb.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jNg8HsjittB3/HzHIH2sPB/YTnbtsr/1Irz+W2Ds08w=;
        b=BAYsZ/UwhTiyA9OcewKHyoKba7cFKRpftakzGCpzi4hPWoDWETjTLJpahIZShME3zA
         MRQ2iu0YrGdAPcjfRCw1j97MnHLbKz5bfh36l5hxZpLamRF2sFcnwKcVIEKv4IfO9N01
         vOf/jdkCnBTC2F/1V2BvDSb0ZNvwzYy6vXEitkG3GeyjgnjoPN/2YRgfItdG04XF1QTy
         GGei1fmY7NdpxpiGA1T5BDiFrYlcxb6dps6cAjJK2Qq9FV/M3lh10Bf2p4C8rlXSecpk
         vfn4J+wt8kPOaGNd0lodiW0MKRsN0VUZbqt4O9LtZ3SV9l0vtETE28MwW3tX9cTlLPsk
         JjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jNg8HsjittB3/HzHIH2sPB/YTnbtsr/1Irz+W2Ds08w=;
        b=h8zkiZvBjzjkKnD/9RThBpW1Q9HjUl8PjoXeg+lG9sVhO5WGKb+/U2sZQu1YJlc40m
         5048iQUR85iR9Wycufq2XcqvDP8ltHp48Go5upF21KCQlJSEG0kQrA+j5ZUfmUos9bXJ
         bGJqaV161SccsUNGDWZCNtTKwX7hNW0qMhj3CjI0XbQub72ptzrl2s3Lb09sscg63qQX
         8K81fr0MQXPF9MGZpnMcD1jwKqato+FX9YMTzPDqD1MjpRh/HlpNm/6s0RYlIg3jmj9X
         o4McWjVgGYs2EzSGFrcEaB+Qzgz4tFzppyjrrBX2VU1sLayzF3aWOQnMJ9Qge0i//RA+
         0JWw==
X-Gm-Message-State: AOAM531kLRAVLMQNpba6sAXMf5YzGbpt82gnthROJG262+aXFvNDAzLz
	X0S3LBDz2ZH7rXcG2V1Tmn56C2pKotvFy41M
X-Google-Smtp-Source: 
 ABdhPJyAVwrX2ffJPDbRGvuP8Hsif+WCoWTQUxLyE/bJOvNBOJUbJckdefhymMq3tT+gVNGqBDq2FQ==
X-Received: by 2002:a17:902:900c:b0:14d:81e9:75d with SMTP id
 a12-20020a170902900c00b0014d81e9075dmr21109150plp.69.1645496563952;
        Mon, 21 Feb 2022 18:22:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 s5sm13266188pgv.70.2022.02.21.18.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 18:22:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] meta-arm-toolchain: Use renamed BB_BASEHASH_IGNORE_VARS
 variable
Date: Mon, 21 Feb 2022 18:22:39 -0800
Message-Id: <20220222022241.1389914-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 02:22:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3031

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm-toolchain/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index fe23fd4..778910b 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "honister"
 BB_DANGLINGAPPENDS_WARNONLY = "true"
 
 # These variables are used for armcompiler license
-BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
+BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
-- 
2.35.1


