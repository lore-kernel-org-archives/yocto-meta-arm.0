Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F1AC5472C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:44 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.1045.1724094281609132225
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=B2B1l/L9;
 spf=pass (domain: linaro.org, ip: 209.85.210.49, mailfrom: javier.tia@linaro.org)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7093b53f315so1699079a34.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094281; x=1724699081; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4QveURaOEPjRXZzrUewBCfHkU+UFxipcUv9I+R+wcQ=;
        b=B2B1l/L9ZieQKhmtI9InrwVXIcJ6C9/kxxu94hIluItPbO0uyXCmA6TPogu/6mU7nf
         ZMeimhzVaMTAJKyzKFjBBss54COlM+bT3Tjoz2PmiZS7g2HXtpNz9mq0BoMOW1g5K4g7
         GVVfgR7aoZYA22cmj5OJuDgJ3arPjtmpziMNdrcVv6dXlQQEBEQQVzLk61WVFNpOzPz0
         beR5qJ1OLIzrNvYVMVpV8EAR1eliqPwfwa+WeZ8ZJBwnUNlNJ4JrBd7+7OO2CuVrGGK0
         EOMpImgcynO+bZSZaFbvbXXZ3fmJLq3eK3VLxDIglcX6U6FF0KaSYpfmsqO/zA8bAPnA
         m01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094281; x=1724699081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4QveURaOEPjRXZzrUewBCfHkU+UFxipcUv9I+R+wcQ=;
        b=CcSn41OuMsJKisI8cDElQ6ZsO7EfoWoSblCw+TLk6v+Jwftq18I9zrYFFiqnAiOcj8
         qoQDURjzynokGfadO0+zjt6yY5zWIRuRZ254bCkLEAkDfXD7VVhjljw5TN6xPInxnO2y
         YRN8Eg7FO+H/fnohG4t+Z45XCofQ1Eia6lvN88Yyrs68F5JVwzpdQ8K9TCWIoTHa1gZY
         z22j6NTCwM9RWPLwBVGb1u3RGlIlZSlvvEQ1AaLk1PxodAwt3wK/Pbt/2+PoiCFTM+ol
         7PgU+/Ta8qClXl/LA0WCM6uhewAcPDOjUalzwdmqMfmpg2Yi3K86O1IplPo0PHQLS98g
         RuYA==
X-Gm-Message-State: AOJu0YzDZk0a4755tNKt9a2uqxwi+2Jr+elMwYdSXRuwiYA4vSLRZjSZ
	ymh5Yb2ua/pwHrBGyQX+fCEju7k/MNk4z1LxoCn/eNjN6B6PqxegoDMYD8QNjbqHUPv0uzdGaqI
	I
X-Google-Smtp-Source: AGHT+IETqu+4IhTh3XYa8bl0TYN7HzgRJGBNjibvzIcKEqCuCriezTRK7fMwCIuJp9hiqFChINXzUw==
X-Received: by 2002:a05:6830:6388:b0:704:4abf:c0d6 with SMTP id 46e09a7af769-70cac86e087mr14557849a34.20.1724094280668;
        Mon, 19 Aug 2024 12:04:40 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:40 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 06/14] core-image-base: Inherit uefi-sb-keys
Date: Mon, 19 Aug 2024 13:04:21 -0600
Message-ID: <20240819190429.2897888-7-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5972

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


