Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D7AC5321E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.4039.1724291029752937295
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YYweEaUW;
 spf=pass (domain: linaro.org, ip: 209.85.128.179, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6c130ffa0adso4089787b3.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291029; x=1724895829; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4QveURaOEPjRXZzrUewBCfHkU+UFxipcUv9I+R+wcQ=;
        b=YYweEaUWZuLeUa8DNuvdoakxJEb6BppDYNrEPN2CRRqpvzEVyHdk1mY4wuNUfZ5cZa
         EthxdJoUV1foI08quvG8gJ3G/SvXfolOP+QoKyBGH0a1Qm8yOqMosj7gf87HgeQViwIr
         Vkp3lgK/l9pFEP8hRzqYsDbdUv6H7ShtcWarTVuA8OhYqkrOMY4WpYYHrjqrit+4GSbB
         iM/aWCqZdVw8iph26ohTKoecr3k+MfHCM4Bkc4BHIdN0V7IHx/ICR9nRcUQjbtWgAQEH
         Op2C4mFRMPT0Vk0cJbHGe9AGxkEn3MUTArX8yktB56pefu9TQRMhy15yAPCIgn5iXLjt
         q/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291029; x=1724895829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4QveURaOEPjRXZzrUewBCfHkU+UFxipcUv9I+R+wcQ=;
        b=m7inUFgOZ+s7NDyUYxy8LSkbbcmu73YwL+lO/uDJV/zTeF0Y3M5hsxwIwkKWRc8nHC
         bBGPQiSCCgffxCmOnbCnKwq0KJCqNxXYsjsJbSgapQjYWBeVXQBbwutHt/LNg7++BJve
         mK8BgO158yLMrj+1EW6Il3y5MnJ3G9XxhASPqwOcroIpd9mbDUdYfqXuoxW/VzMxAAxD
         KUkX8snbbuPw3pMHtrVjmzlLQAmSITzOBeTvPSIW/BWQtl2+OjEI/36ot09XD56F+r8/
         tVZCucv7X4yfaCis28oybVBxSiPp1OIA8sbJfYOQUICSuMszXQ2qgPicJBE2nxT9XwTB
         +24g==
X-Gm-Message-State: AOJu0YyII25joWPLuVJM1DU6uCVrlUZimz78yvm6BeLdU2NaoCzKoRNc
	AnUhgCptirnMZE/O/a6N+N3UE1hgDHcUe5kVjacrUU7StOUesXkSFoWFx3+rhHAmE4aYnyJyV/v
	x
X-Google-Smtp-Source: AGHT+IF1s6+yuQFPetnfl7rLSpxY4POrUFPU066x9thNcWb80eojxZbBgX+sUKUJbvhGOkiRiV6ZFQ==
X-Received: by 2002:a05:690c:18:b0:646:25c7:178e with SMTP id 00721157ae682-6c09c1c02d7mr54286587b3.5.1724291028738;
        Wed, 21 Aug 2024 18:43:48 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:48 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 06/13] core-image-base: Inherit uefi-sb-keys
Date: Wed, 21 Aug 2024 19:43:28 -0600
Message-ID: <20240822014335.3394568-7-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5996

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-bsp/images/core-image-base-uefi-secureboot.inc      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index 351e9030..2232d3b3 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -1 +1,3 @@
+inherit uefi-sb-keys
+
 WKS_FILE = "efi-disk-no-swap.wks.in"
-- 
2.46.0


