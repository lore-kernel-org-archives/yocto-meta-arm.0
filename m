Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FADC83F38
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.24053.1724949143857707270
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sZeAzMch;
 spf=pass (domain: linaro.org, ip: 209.85.128.179, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6d0e7dfab60so10461787b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949143; x=1725553943; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHIEeal/qm8neCiYLbjWIFzTsAvAxeXL3BZdH5PBRSg=;
        b=sZeAzMchRY0wihqGNaGQvgXleOXq5Rl4qcCVw+JDCnR2LUGImZFWPHrWPyL/Uq24EG
         XPQQ11ImnqYiIydYEoFCdArLJ3XwDncd05uwIlDMS/8aYJ3jmy+/+UWjZEYOe3aBYJYi
         t3405q+bfIbYfx6lOeAb90YT3oVyT6N2MWUJc/iSrjukJANMwuGQAI69+jDBn2nkrPlf
         lXPMFXn1TxJcWra50fq1O3g+VB/kcaeJJBEKznOddrwgECt2P/iMzccX+Xz4bZD9J3Tw
         C1oeAbxz49BrDsbF/h7WAi612ZQBT2zAMS8dPLice4lpgAakppl/rlD36TUzo5OI0TMb
         K+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949143; x=1725553943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHIEeal/qm8neCiYLbjWIFzTsAvAxeXL3BZdH5PBRSg=;
        b=slUbImzmafEFXPoGE1qa2+LOaUiWi+OkqUD+yg+39FAIo/Bbm1w10zDBp8DOVCDf1y
         +xPW50Mf6qrnel1rMlE6ZtK/abs6S1bLoerG6h2E9ML2Vac25zlapvRlOqFDhOVWM/Rn
         kQWkSAITAvIDtzpdsvxnfY1RuOyl8ShVpyxNod83tD7GZF78lRIuy6e0Pk1wc2ZsmPLK
         L9ur1cXpQgoZ9/5ya+3xiPAKcwc0dlKPmkUFP8vVvW3hRJSIcgT3IBuBf6da1UHZDcxm
         CGR8Xj6bVh8W35/OdFbhJinEBVaL/7mIQ+CozsiN9QO+eCvDxhFotYVB1YfJD5AtDEGZ
         PJ4w==
X-Gm-Message-State: AOJu0Yy+m6NwDCeDwv+jZpb7hcbVvTMs/v8iwvrfcu0ADopMiUa5N+mF
	f7Vv7X5UesvV3REUBhnkfPeq+p1d2z2e1uwknqa5GjbGOEpUJ5SyyqjKIk26KnVfWa5+l3H6bPt
	w
X-Google-Smtp-Source: AGHT+IH3HM5OvJqktGfTxX1Ic1R92koHfGJHgIGYWvlIPiyNKcFxVy05XG+TXPXm5xB4C2ZyduHF8w==
X-Received: by 2002:a05:690c:d85:b0:665:54fa:5abf with SMTP id 00721157ae682-6d27595e2f3mr38156687b3.2.1724949142831;
        Thu, 29 Aug 2024 09:32:22 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:22 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 09/13] qemuarm64-secureboot: Add meta-secure-core layer as dependency
Date: Thu, 29 Aug 2024 10:32:05 -0600
Message-ID: <20240829163209.47945-10-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6019

meta-secure-core is required because of sbsigntool.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index fdde1e79..03281a08 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -4,13 +4,15 @@ header:
   version: 14
   includes:
     - ci/base.yml
-
-machine: qemuarm64-secureboot
+    - ci/meta-openembedded.yml
+    - ci/meta-secure-core.yml
 
 local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
 
+machine: qemuarm64-secureboot
+
 target:
   - core-image-minimal
-- 
2.46.0


