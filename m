Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7E2C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:25:29 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.14483.1722335126785123205
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 03:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ot+G03NC;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52efbb55d24so6595792e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335125; x=1722939925; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXuA7SxtFxgdzU0ho9XMm94Pn1rL+xqGX3FVBsNq3Ao=;
        b=Ot+G03NC5BcisiXTF0K6P3QP0iyg8sJw1BR8wqk9ZsEJSclZyA5tTazgAU9wfQpr2C
         /2en8P0nL2FyIMKgH+x7ugwsiq58y2qbxmedMwWteMqNaiVk6qI27Xu3A4hxPcEv1x96
         /tnsq8NsqSoST8CRaHYaviYeWwoRfH/2zSHeNnS0w+4IlP7sMjPVS/6+YsTol5NUl3vF
         WjIRKzCwnQD7WfTZQsEYksDfMWuWQul3UmVhNmPapmB3IG0zROSCS1kEZhDM4xjIE7nH
         lcQ9P3nhtErBi/NWyVoQJ1Zkq054MgQ5wK4pL/WPXKnByeQ+utvAlQRLn25hi81PMD/I
         AuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335125; x=1722939925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXuA7SxtFxgdzU0ho9XMm94Pn1rL+xqGX3FVBsNq3Ao=;
        b=j/NKMj22O2M8JYOV3igMwJ5DtuNkPIvNYt3WjlAEN2WGe8ccJbg1X6MijEFfnugBve
         mDaP5DykFx3cmaWPnKlvozmRsbKp3ibK+fPX07Eggl6udEfxbcPMyJNcaFeJhip3I5yU
         +NBEn5RNXhS6ieGiQKSKoPop9E12T1VXzw5WQPo8onqeo67iHUN5ympubIzMwr/wKOrs
         Imef8+EdSN+n54DwuHKMIuR626PvCvEx+CKGcJFLrFnKo7KdRz7qg/pBHl39gOonfRpu
         NWgQaKptEtSLHF6XW4ML/vDamhyQCtIsOb4A55yinyjNh5yrX6/80sQWm16JSDPuxB3w
         MQgQ==
X-Gm-Message-State: AOJu0YzXi4BYWcsdCEql2CrDd37JOe7gz9eCpq+0KeWEDCGzKJ1/W9pF
	affQ7my7O3K5j2+9namFDnd65u3h0X68ei03AZ/0Z4ISrPUbzBbKmJupYWka3C85+Dh8sLiOTlZ
	W
X-Google-Smtp-Source: AGHT+IF87fSFJebKkuTwdbd3idpKlAL2zNptGnq05wBP64WYU7L+BrEaN++V2lAHBGaZdDpbUNn5Vg==
X-Received: by 2002:a19:5f44:0:b0:52e:7df0:9a78 with SMTP id 2adb3069b0e04-5309b29c9a5mr8231294e87.32.1722335124817;
        Tue, 30 Jul 2024 03:25:24 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc4a46sm1861969e87.17.2024.07.30.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:25:24 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 4/4] optee-os: remove buildpaths INSANE_SKIP
Date: Tue, 30 Jul 2024 13:24:59 +0300
Message-ID: <20240730102459.148826-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730102459.148826-1-mikko.rapeli@linaro.org>
References: <20240730102459.148826-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 10:25:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5931

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


