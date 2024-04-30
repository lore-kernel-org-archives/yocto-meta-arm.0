Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A20C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:38:08 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.14061.1714480680365086300
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hwB7cojV;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so7141017e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480678; x=1715085478; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bm0ACvILN0Tla9Oid2skd8x4lZ4y+re3OtEzY3GdDk=;
        b=hwB7cojVIKj5G3b9jxXM9vsYYnj/tr+Tb/MA/LlagARux2c+FPtp4YFLl9iGa7E7wF
         p0645YGLG3Hm44AwSrttb8w+0oy4q1nxAehauPLlIiVnTQ2zPP1gxF4IICOVQoaqsbuv
         /ZDczjtnpInEI2B6/1tXSHKSwoLAO1Ld8raTMDIGeJYyugWh6cRATdelaxro2RCIGs2x
         BayWygen/e/C195/W9p6NRcTXhe0dFkbdIkkEhsA+Ym0iahi7+izSwdBs4rkuL9sMsMD
         TiZlFG5Sz17cFGSOuD63wi3wj7yYrq9b5NHivawm6e2H0XKJ31l8VA+AoqUlo5u9b01I
         hnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480678; x=1715085478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bm0ACvILN0Tla9Oid2skd8x4lZ4y+re3OtEzY3GdDk=;
        b=TEoR93ylZC1YsVZqU5FdbnLPZjWvsTWrpFRiytInwZM379fpyHeIetJefhIlTSGM27
         4X/IOT7wotR0XuYuAFQwLJZ1A/WRXzoLwPBJ7pRxjuoPmKGDrmVKd6iM//1KYyC9srR/
         6vI8RAT30goOpXWlpLwixxuZXoAgOX7bRAGW8SQcPhizW0eYvAEp82As0m4pMV5I2NQd
         KMXqSYdhHD9SZDd8scDZYvkFF2uRmSwhOXf15ZmKtGOjoq0Q9MhavDZTJp5lo7zg/BsM
         pUZKVGGYCwI0EhOqzCOMeZ2KFj8ll7ax/ETe4nqlmwbaoCRYBP03bVofA+5s+Lxn6fe6
         faRw==
X-Gm-Message-State: AOJu0YwllHFSc4fv4+UC7Ox4sDS56g+3Kxj65f3P/WEe+VKMvnfut5+O
	k01/W+DhZ7M9B7DlPF3SUJMCTlIShp/BwoNEXs4vKEUQTswu4v0f8N8KoHiCkW5uCeuojfGXvPb
	pG6U=
X-Google-Smtp-Source: AGHT+IGcKrXAG5CGk3Bs+BqD6COKAdIbHmMT7VLSUvLNQzMh9nBGJJC8OrogZa4atFtHIGeVhtlJpw==
X-Received: by 2002:a05:6512:4013:b0:51d:2056:efaa with SMTP id br19-20020a056512401300b0051d2056efaamr7125399lfb.32.1714480676646;
        Tue, 30 Apr 2024 05:37:56 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0051b41844048sm3011149lfb.285.2024.04.30.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:37:56 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 6/6] ci/qemuarm-secureboot.yml: install optee and test both optee and ftpm
Date: Tue, 30 Apr 2024 15:37:32 +0300
Message-Id: <20240430123732.534277-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
References: <20240430123732.534277-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:38:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5647

optee-os test xtest needs additional test trusted applications (TA) from
optee-os-ta package to pass. Execution time for ftpm test is around 21
seconds and 596 seconds for optee-test/xtest on an x86_64 build machine.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ci/qemuarm-secureboot.yml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/ci/qemuarm-secureboot.yml b/ci/qemuarm-secureboot.yml
index 97e99039..f0d136c8 100644
--- a/ci/qemuarm-secureboot.yml
+++ b/ci/qemuarm-secureboot.yml
@@ -7,6 +7,8 @@ machine: qemuarm-secureboot
 
 target:
   - core-image-base
-  - optee-examples
-  - optee-test
-  - optee-os-tadevkit
+
+local_conf_header:
+  optee: |
+    IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
+    TEST_SUITES:append = " optee ftpm"
-- 
2.34.1


