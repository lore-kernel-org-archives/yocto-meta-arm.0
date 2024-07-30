Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7D2C3DA61
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:25:29 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.14481.1722335120832087798
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 03:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kpzqnF//;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f149845fbaso3537331fa.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335119; x=1722939919; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFF7A4QAOz5iQPx2n4jlT82zAlUAFLUarqvArz7D4RQ=;
        b=kpzqnF//PDJ7xhh6OknalVMNUvuGb61vvvadj4SzcqqBA1uGJPOHp2NdJGGLKpW0Ut
         PO6f/Y6GyAEIUVC2Tca5hI/zabDtxqDpcI6mV0jDTx2wMlMFViTs4u8Z7iAugGNBGMnb
         Doxc0d0o9jEsA0RKwmNBJAT6Yb+Mz5RPd6XyJ0QF5On7zKTJ89cEa9YNTNNO+U+tYKtP
         dHoy9Iayw1fzoG8Fb1BbM6jeLKN7/V2xbpGFI2QED0mEgTtQy1bSwCVOiuzgBPTq2mpU
         cB1rl2n2LM2riCvRR6rt1PIy6nofuIf1nvQGSVu3T2ioXke3nR3XS9hNRtd5YGC3fTXL
         X05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335119; x=1722939919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFF7A4QAOz5iQPx2n4jlT82zAlUAFLUarqvArz7D4RQ=;
        b=K0u6kjBIhTxsVi5AyIpTxFilOm42GEuv34XqOKFYaruVT6OE4IuwcZqgo8i8nXG3r7
         D8tagfS9w+Jm7Bqpxn53bIUQQhOU4C1XB2eTWi3IwONlMLCGQOuwiV8+rLrzA4E91Uc3
         P5jigDk98EbeTdC1tSUs+BloRLo/NWwgYtf7kx0jQ1zkmYkoFQS35K/75vI/oeoO4H16
         x/sDNhsHAFK0pBZhGpozrxGJSPuwNoUY5DjeVZpVhQjJqaPCs5iGbS1AT8uPY4GzK/Br
         l8kHlYN58Cqg4Q+fSzKQpa/oVZKY7qn0M+p953QDLaKemRLkCqlJUxLqfO3iRUT1+G8M
         U0Vw==
X-Gm-Message-State: AOJu0Yw7GnukjF0iTvdjUNSqLVSzUI+IgQNZ5Grm3eYaMxk2WDX/vGc7
	KFCuA9aeiHKc61E0q+lIGH6++9GTb3abk2SIern8DDGX2ZYyhHpsZOsKXS4JmHWFI6wL+/EvjqQ
	C
X-Google-Smtp-Source: AGHT+IFZNeyjgPYQfzZ7JLvICssDJO6pJ+QA0VaJFQLOGQgKpV/E6IWEZ4heOxfn4XZkciWNsFszUw==
X-Received: by 2002:a05:6512:3e0e:b0:52c:c9bb:2ba4 with SMTP id 2adb3069b0e04-5309b2b6e87mr8432830e87.46.1722335118605;
        Tue, 30 Jul 2024 03:25:18 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc4a46sm1861969e87.17.2024.07.30.03.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:25:18 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/4] optee-os: asm debug prefix fixes
Date: Tue, 30 Jul 2024 13:24:56 +0300
Message-ID: <20240730102459.148826-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 10:25:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5928

The .S files compiled by optee-os were including
absolute path of the recipe git tree. Fix this by
applying CFLAGS with correct debug prefix maps to AFLAGS
used by optee makefiles. Fixes optee-os and optee-os-tadevkit
buildpaths QA errors.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-security/optee/optee-os.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index e9f252e3..d5a12642 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -24,6 +24,7 @@ EXTRA_OEMAKE += " \
     CFG_${OPTEE_CORE}_core=y \
     CROSS_COMPILE_core=${HOST_PREFIX} \
     CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
+    AFLAGS="${CFLAGS}" \
     ta-targets=ta_${OPTEE_ARCH} \
     O=${B} \
 "
-- 
2.34.1


