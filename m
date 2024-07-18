Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3315FC3DA70
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:42:21 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.15309.1721310140171988893
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 06:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HiivrIfJ;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eefc3d707dso10393121fa.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721310138; x=1721914938; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXuA7SxtFxgdzU0ho9XMm94Pn1rL+xqGX3FVBsNq3Ao=;
        b=HiivrIfJGA4NC2Or4cvVBMkrcGt+1A/8MJeKvQ4MkbQcoGAxImelmgdFxsJc8MvqBj
         wL0o5z+Jp7hyT8cIfrys7YzlcM0dgOxXc0rOcxwa2VI3wgR3V7xrCwek9kgj7KiGsn2L
         ja0+OcSxHp1MfA6Eda89gCHEFTiu9iSwTOIAbJH3WDObT3iof/JVL9TlYtRSKdsfuESx
         h5JAafxOCe9OnV37zhNRhiFuOuWZExk28GZxnBM/xr4lfcSYU6KoLaUw/QgasVA4xtS4
         5K4QN+lHNVvV6u+ybjo2sfBAx7q3os+ufdr1/U0LWWxTAz50hqosOCx3CLCBWrTAlO44
         XwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310138; x=1721914938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXuA7SxtFxgdzU0ho9XMm94Pn1rL+xqGX3FVBsNq3Ao=;
        b=YEHeEoA83UgKoPk6hzgVfR7rC+YFLHAFAuEuB0eGrj/9E7A3TlbZ6I2dwobbJ1llg9
         u43ieM655Mjv0cTMLjYkCELIZPNu11M8Fg6NUi3mcbBzV3IUIZEBQOCljwlvSS1oBWUg
         O2OXEAcaenS2vp8o9IoclDoubAwTFvU1cdCAuwVflO7RrwascEexY+q0xNg+A+Gbjhnf
         boBJ/RBSPoWRrAmdwNqlx+ahHZdhs58E2OOfcmO1mXocPSqXQBq8YQWhFUQ9OplhORx1
         K4AdU0WuK4s8DjF4Y+xCxRT6mCEMybsubMGOvOtndfKuNUAPNh9ct2qx25G3t7rO8otK
         gBQg==
X-Gm-Message-State: AOJu0Yx/2YwS+4y4GxmtP85v0XXy62KX1r4dv8zvbAz+XuefPKRq2fv5
	RppEB00LlqJfpwed/ZPgIE0AV0uN75yrvNn18dPV2dtK24QLkm/RN6uyCjMCJOc7eo7TuWSVkIf
	+
X-Google-Smtp-Source: AGHT+IHJKeIEXZ4NXtGM1A/W3P4QBMPAH9YUuX8r4a8SiNrBRsH6HDfc+qgLVC5jUKOQ6q6EkSHkUQ==
X-Received: by 2002:a2e:a794:0:b0:2ee:87ef:825b with SMTP id 38308e7fff4ca-2ef05d4390amr20109031fa.40.1721310138462;
        Thu, 18 Jul 2024 06:42:18 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef05c81865sm3219511fa.10.2024.07.18.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:42:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/4] optee-os: remove buildpaths INSANE_SKIP
Date: Thu, 18 Jul 2024 16:41:52 +0300
Message-ID: <20240718134152.38721-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718134152.38721-1-mikko.rapeli@linaro.org>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5898

Embedded build paths are now removed and test passes.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index d5a12642..5a89e5ba 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -76,7 +76,5 @@ FILES:${PN}-ta = "${nonarch_base_libdir}/optee_armtz/*"
 
 # note: "textrel" is not triggered on all archs
 INSANE_SKIP:${PN} = "textrel"
-# Build paths are currently embedded
-INSANE_SKIP:${PN} += "buildpaths"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.34.1


