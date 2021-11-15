Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECBCC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:01:11 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.22760.1636984870095623270
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TXSdXoIA;
 spf=pass (domain: linaro.org, ip: 209.85.167.46,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id z34so43806703lfu.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mX/TJoDVH8v+7KzzzR+2FdEzoqUbPtpdLLYq0Qo6ens=;
        b=TXSdXoIAEbgkkTzCfWUcxtaApzfWIHbVR2M1Iz8M0HiTLl7ygdkqXCouPQyq3clkaC
         Mq6j3qBebrunz5XTeAMC7YyE3TFa0mdEdI7iocD5ajy1+LPT3EAM9QxEkalttx9rCi6d
         4PgZ/HjOULRSqJ/5Ek4wuNia8EfN+jontxrzoGGuNItqvghEl78U2xmx3zgDPgJ97D5X
         aTKudfiamu1ICCadJILKN27oNNkoKxR6bGbkYtqZjelcpC4kdKCR3u43XtBViIY/PJcF
         BUZXZ79t8U1HbbGFmfuK8CeAM6jpTS03k3qhXsLG5/mPjcOLzpS6oLUW8xTYf23MY+VA
         RUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mX/TJoDVH8v+7KzzzR+2FdEzoqUbPtpdLLYq0Qo6ens=;
        b=0QPNhQzJPw7em8SYyBCuJLlNPZhBfQawi99lBCgh51hG3n4gaeoAIHhblZ9mwONBm7
         QHgIQ+YuwAEQCt3W+rECyymRfSUjnzwS/bLZMAHHI65GZeKQN7KbVffGio32iZMOATRX
         /XSYM7sG/OjWMAldO7mb9/qRH0MdlZeiPqMfGe6ef+4Dz/3zAQM6U/+pOivsIUWgZASD
         NiDMxTiGoJVmU4dxxDLDCJPe5ZK1cAdjxv4Jy/ItMVU0ZmEmbPet9T6BGAUdU3+8C1ap
         +z5Y1al9xSO0iUYaVnl596i+o0O5H/nBbolrZO97S3LzLAzwNPua321AQErHRTNAbE7P
         876g==
X-Gm-Message-State: AOAM533PeiRhvs0CxhFB/xPulL9xVOvfeaump3xs1ODzmf3ZrA6UB2EF
	RNAa1E6haDgu3DQ25ywsr4EtbDT0t9VIxA==
X-Google-Smtp-Source: 
 ABdhPJxkvugzYQ5Ko0Xbt1zTWsaW8tcfgLlunkPWeC+gb+T0jOxNvu+8uPX7GOWqsVpvR08UjilbGg==
X-Received: by 2002:a19:5f0d:: with SMTP id
 t13mr34278208lfb.185.1636984866355;
        Mon, 15 Nov 2021 06:01:06 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 d3sm1513699ljl.93.2021.11.15.06.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:01:05 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv3 3/5] ci/qemuarm64-secureboot.yml: add optee and tf-a
Date: Mon, 15 Nov 2021 17:00:58 +0300
Message-Id: <20211115140100.24634-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115140100.24634-1-maxim.uvarov@linaro.org>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 14:01:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2386

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 ci/qemuarm64-secureboot.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b7f3cb4..a7e89d4 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -14,3 +14,5 @@ target:
   - core-image-base
   - perf
   - optee-examples
+  - optee-os
+  - trusted-firmware-a
-- 
2.17.1


