Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B78DC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:42:21 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.15308.1721310138545588376
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 06:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eAarR/hF;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eede876fcbso9592621fa.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721310137; x=1721914937; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/shhQlkqxlG8mLSsWEdxp0crruvg58Rnl10L3e4o4h8=;
        b=eAarR/hFR2ItI7CO1dxI3B+2V1v7TU4vo/iMc8g7p+04mjxhnPkijHD3H8Ymx211RI
         nocPAO98aqVDEMfGrgwYu0bYqkHJTaDMNpyY/qZtkidJwTJsuaIKmuC/ZkcW2uAHKgOx
         TmWIgoAVWmHckAwDMDN7EkOl1qG01AKoJ3cC23qGYA9dY9+VBLaDo+yr+TmEQ+MVYtbz
         9VaN9d4YtpW++0py+6wAGNOSGtPFb/ckRd4v5p5q4UXIVoUuRommOh1A31PGjbq45y0c
         ckW4OxA0xnTKZGp3rvbGgwlt1UGHRPlpo5YyFiN/pXjifW+FDrKZQdM9Na4LgoznsEch
         jkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310137; x=1721914937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/shhQlkqxlG8mLSsWEdxp0crruvg58Rnl10L3e4o4h8=;
        b=VWUt+96uy43wltlqFGtima+TA1G+4T/u2BqcGgw4jiELr7rc0pEaDqu2lSO4msmc2i
         YTyfNxe2Xhv38+23Kv/GI2l3yaGZiYrRMwKHfn+R9V0PGNWACastoM0AA2apSFW/tqKu
         dZtGc0D6GUGETJ7zyg54HjknACQ6R4kIeduwSm3e0kqVcAwcrDKiuZ6z1T+AbHZievun
         TVTRAmoM3ZSF6GR7Q7NeWJPll722uQg3Gza1S5sNVVc3XgBmlKFS1M0CY+aR20gZkBpu
         LNAwKXOEEYKExQ39kxHTWlkZ0vI9VHrA6KJ5AXXyn5grnjzdRMPLB1wsqJInTWoMIgN/
         J8lw==
X-Gm-Message-State: AOJu0YygcObrBIltY9n05K3C6Nyjj4882kK7+SHJHiWyT+2+GvZn955i
	V2qoEZDj+IeZzxTbkDNQ7PQJTMBV9n5dbYNciRrrIvZXQOvVMQlSQ/wcRk0fkT1VsKZjTugR5eo
	w
X-Google-Smtp-Source: AGHT+IHRrdG/7xv+lY42S88CkrN5q8sPMrrBQgi1Tj/mqDk126P+4/yQ9SpeiQKE5eHd9tOVunn9UQ==
X-Received: by 2002:a05:651c:10d1:b0:2ec:3dd4:75f4 with SMTP id 38308e7fff4ca-2ef05d28010mr17604231fa.38.1721310136735;
        Thu, 18 Jul 2024 06:42:16 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef05c81865sm3219511fa.10.2024.07.18.06.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:42:16 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/4] optee-os-tadevkit: remove buildpaths INSANE_SKIP
Date: Thu, 18 Jul 2024 16:41:51 +0300
Message-ID: <20240718134152.38721-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718134152.38721-1-mikko.rapeli@linaro.org>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5897

Embedded build paths are now removed and test passes.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb
index 961d5251..2e43254a 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb
@@ -20,9 +20,6 @@ do_deploy() {
 
 FILES:${PN} = "${includedir}/optee/"
 
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev += "buildpaths"
-
 # Include extra headers needed by SPMC tests to TA DEVKIT.
 # Supported after op-tee v3.20
 EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spmc-test', \
-- 
2.34.1


