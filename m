Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABD2C41513
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:37:58 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.14055.1714480671765846615
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y47OvMUH;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51abf1a9332so7687439e87.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480670; x=1715085470; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lEGINr9IXckZcAjij86rQAiYwUSXXLm6Z1SZB3hHek=;
        b=Y47OvMUHciiMb2c836aPpxyMhVLPHMklAqBRGwr3poPx0Am1fPPFt/cJaqfNZcLblQ
         gnW9CfOvGtZmsbtXyVdmTXcLRmSOiEeKcebtJmgUlJqheaq70sp/AGxyFavH2rWVwR78
         RuaSodmKCBh1ykeVyiqnmK9ztlDGDJ3EeU1O3//IWWHIdtREWpVV5am2eEAWYcAyE0OF
         cjSmY2cC03U8spEkJ0vtI0dXLhi/vtu0Icvgv9Nt94oOUT2JHxKNPzGgF1RFWA5ef6MC
         28bpaS+b+aWlmw0vrukXQtecDm/EA/JDNPqk0MlNS2LRMZpQWm0dOdznP0nOjEmAw8ZH
         Q6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480670; x=1715085470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lEGINr9IXckZcAjij86rQAiYwUSXXLm6Z1SZB3hHek=;
        b=pZnY4zwnJFYiWjq5N66Q+sHjOmMELfGeYvvenDUwmzUhoN54ME3cHUGWP03FZ+H+GT
         sWmIkJoA3T25ItausbsHnFuG+eF45xBfcsBzpEKunJYNgtoQJii9vQkV1a6Y4Q/aFuwk
         uGstmLSBaYsnq5GsmJcrG3mq8XgKKmf6FBhuj5y3a59vdKo8zytoepAa9Pub39368gDG
         HL9fai+QCHq/sreu/778wRf+AF0/YcUC2v4qU0preH+f28gp9l7WLTcUbBpxxu4XBw/h
         XZeeK2tGN/pPiiVoPdryqJf4lpdFjgYZorYsD0lYUFsTNh0qbi38v7rtwKtuB9dTwSOG
         PrYQ==
X-Gm-Message-State: AOJu0Yx08idIfmAki9NBbFu4kOcScDfg+to1imEDhF+f+2Qdx1zkC7Ua
	zQuQ1s3kWOkw+OKjxLZEd4dHFFMGzduLJhI6LRhAAW7VdDLLbFYc207J5vzL7q7sG1sqZlKieGY
	/XoE=
X-Google-Smtp-Source: AGHT+IE9h84N85KnUKcvR6mPLEgk+6rToyx+fabmpf8wkv6hQSWga/tE2MVF3njks0ATgmuze6mtIg==
X-Received: by 2002:ac2:4436:0:b0:51c:deb0:fc14 with SMTP id w22-20020ac24436000000b0051cdeb0fc14mr6713953lfl.24.1714480669981;
        Tue, 30 Apr 2024 05:37:49 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0051b41844048sm3011149lfb.285.2024.04.30.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:37:49 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/6] optee-os: inrease heap size with fTPM
Date: Tue, 30 Apr 2024 15:37:28 +0300
Message-Id: <20240430123732.534277-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
References: <20240430123732.534277-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5643

If firmware TPM TA is compiled into optee, it needs a bit more
heap to pass optee-test/xtest suite.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../optee-ftpm/optee-os_%.bbappend               | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 4829bc10..31be0e8f 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -1,15 +1,11 @@
 FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
 DEPENDS:append = "\
-                  ${@bb.utils.contains('MACHINE_FEATURES', \
-                 'optee-ftpm', \
-                 'optee-ftpm', \
-                 '' , \
-                 d)}"
+    ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'optee-ftpm', '' , d)} \
+"
 
 EXTRA_OEMAKE:append = "\
-                       ${@bb.utils.contains('MACHINE_FEATURES', \
-                      'optee-ftpm', \
-                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"', \
-                      '', \
-                      d)} "
+    ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
+        'CFG_CORE_HEAP_SIZE=131072 CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"', \
+        '', d)} \
+"
-- 
2.34.1


