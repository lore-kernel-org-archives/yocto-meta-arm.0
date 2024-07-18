Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2510CC41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:42:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.15369.1721310133337327446
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 06:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ymvYxNDt;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ee920b0781so10782561fa.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 06:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721310131; x=1721914931; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFF7A4QAOz5iQPx2n4jlT82zAlUAFLUarqvArz7D4RQ=;
        b=ymvYxNDtmLlkM+IluWFU6zqkWBVzkOJYfXpH55HR1sMAnTUXYWoIWmoosxkL281ryQ
         1FOHR9kcmBn16PlgsQvvcLe1diKLXFjMf+Z7v03OGOrxZYbYd6m51K8Xx7rNhIJcHjV/
         YZWERGQ1UeG2EsCl+idKq0v/6mI4P1v4vc4eArfZLtfV7C7SvmcEsHB1kT1ckIEDKTUU
         /ggbNoCDG9qQGZd6TyW1vjoGId6Yjb9pfIdf5zeTxKzrZpPHAQR9A2N7fsYcJdXs3e9d
         2Q8EmzSYPNU/S9LwhsNO+pxqr2dW9HhV26o9FLxvNTfEZAXUY+BymOlP2nDuHBFWphk0
         tESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310131; x=1721914931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFF7A4QAOz5iQPx2n4jlT82zAlUAFLUarqvArz7D4RQ=;
        b=TEkHvbDATIuBkmvuCUMCZqbig6KXCfKSzjKAz9YoWSkPWYxBk3SUbcUGVDUAWusAKj
         EgKz66m8DIvD5iWrI5Is+0HUk7lC2lnQcWQjLuFpxnxiBEnbdlm/AZ7n11Tbx1+gDyzY
         wbr9twsZSfOiSngD3i/89OO074fmy7dH6ovO+DVJeW4E9OCsIP6xoXfK85Er24JiFxhX
         kxrs523p49oti0xFE5MGKKmlZTrXoDUtJkGwDGa2zc35D4yX5Ywx3/SfvdY3jycGeRLh
         tKwl9MtsUdK2wCaANLZzR24d96zWTITNVZ4NEJqxKr2IQiPK+2b7RKMxuEPJNiLzp8TB
         my6w==
X-Gm-Message-State: AOJu0YyT7p2Ah0e5Ctho+9uOCYBl/Gv1rLFLhRvhPYr5krszUs3Ivegm
	GZ9Kzzf+B56VdOO5cIo+rJ19mNylYNlpljGgtKyo2lwTsXbZcB93SdO7pfk2d52dCVY3hOKlsEo
	g
X-Google-Smtp-Source: AGHT+IEkDakyu2Y+xJPtQHroQCZ4gfvhLNpmd2JEmXJCbo1RxF8ritpCUlb1fxbPGmA/vSsDqNgQPg==
X-Received: by 2002:a2e:bc0a:0:b0:2ee:dde7:899c with SMTP id 38308e7fff4ca-2ef05c73644mr21807991fa.17.1721310130397;
        Thu, 18 Jul 2024 06:42:10 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef05c81865sm3219511fa.10.2024.07.18.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:42:09 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/4] optee-os: asm debug prefix fixes
Date: Thu, 18 Jul 2024 16:41:49 +0300
Message-ID: <20240718134152.38721-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5895

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


