Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25731EE801D
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 16:32:50 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.1357.1694190766306693894
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 09:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FBuTCoVz;
 spf=pass (domain: linaro.org, ip: 209.85.167.178, mailfrom: javier.tia@linaro.org)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a9f88b657eso1462289b6e.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 Sep 2023 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694190765; x=1694795565; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqVeGbcPL+w/M+dx23nNYXWUO1c67DkhmgQWkgWFpNY=;
        b=FBuTCoVzWFASwO49CkDY4VoXog32T2Ggom9wBIMHRCLLOsRLZa8r6G+2gFlIjrQRyP
         T3ESP2F/bdCK2/uLI1TU/U6Oxvjc8uv2iua33I7W39IInVXnDpPD+jTw+D8+yI6/vaV3
         i//OsgnN+NK1rDSoJtVMb0IlwNgDX9BfF7y2d5NMwmYMDNJB2P1WGGQSpyMi+dXMxbed
         0/UYKo+HnRmLZgRhJMzpuRS+hJbpZLCL+DwSbXhlFMM+sXYXqpNXVlghB08hTYHvrT7V
         bhhginXMdwx6h6GYjTZFfGQTQ9sqTPhMJtoPfjg/4Tf/Ug9DJuym2wg39mVllUlT7vzq
         2YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694190765; x=1694795565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqVeGbcPL+w/M+dx23nNYXWUO1c67DkhmgQWkgWFpNY=;
        b=c9aT61xJSgK77yEOpYrV5SGAZCQy+XdKmgeudTuxDubNY6J11yX+gMcRiYTGtv4h4N
         mK7AC+4sTn33j0Cs7xgVk7rdmu0VD7Ljkm9UQV7BRWl9EDMK+0oUX7qJt8E/SBUUURSp
         CNMbcucaVAfcpITU2ccwtRxHS+C+/+TB7qEzNFu+Em1b37xK/bIB45OemrxrNvzJzNuY
         jgPuEFqvfTbp7mNstNZllIdiEmSfiBTgVoeDfpEt6UzO3hgdCggVSqYto6GXnn3bALaS
         WMMK75owgZXHk8vpKvkqeeULiwoerCRyTbQfV737oc2CzBKquD9qSsmgI07y2n8vC7jB
         NhWg==
X-Gm-Message-State: AOJu0Yx8IKsqDcHsnJiYuIklS8KHvwBS0TnMDJGx1jKr+QMVBFSadjNl
	FheqfA192mOiRQ0G8IFamgf2/tTsVc0u9Z25m0iTUw==
X-Google-Smtp-Source: AGHT+IFRWWUBVEqJS9Ojul0z8R5mxuHKYR8vBK767gfOhwOKIDT0Kq5DAwnhWYoMBMq8BShzic4nZA==
X-Received: by 2002:aca:170f:0:b0:3a7:44da:d5e6 with SMTP id j15-20020aca170f000000b003a744dad5e6mr2851816oii.38.1694190765378;
        Fri, 08 Sep 2023 09:32:45 -0700 (PDT)
Received: from jetm-rog-x670e-gene.ftth.telecablecr.com ([190.171.102.33])
        by smtp.gmail.com with ESMTPSA id o13-20020a67e14d000000b0044ed1d5b7f7sm374125vsl.34.2023.09.08.09.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 09:32:44 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] optee-client: Add path condition to tee-supplicant.service
Date: Fri,  8 Sep 2023 10:32:22 -0600
Message-ID: <20230908163222.2513036-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Sep 2023 16:32:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5023

Without /dev/teepriv[0-9]*, tee-supplicant.service will fail. Prevent
a failure with a condition to check if /dev/teepriv[0-9]* path exists.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-security/optee/optee-client/tee-supplicant.service   | 1 +
 .../recipes-security/optee/optee-client/tee-supplicant.service   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
index c273832d..6b00df74 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
+++ b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=TEE Supplicant
+ConditionPathExistsGlob=/dev/teepriv[0-9]*
 
 [Service]
 User=root
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
index c273832d..6b00df74 100644
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=TEE Supplicant
+ConditionPathExistsGlob=/dev/teepriv[0-9]*
 
 [Service]
 User=root
-- 
2.42.0


