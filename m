Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF25C83F3C
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.24060.1724949140781561357
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S06zho2a;
 spf=pass (domain: linaro.org, ip: 209.85.128.179, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-68518bc1407so10860747b3.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949139; x=1725553939; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeS4H6a6NS9M4W+N5Tojf3l1adclhIcOrpM4ziZDDtQ=;
        b=S06zho2aLjZrmgADdj7wXDMJGyQpNzkhN+xj2P+D2crhPj2MfaSVrlkH276BW9EmG8
         3Ksr4eaL5otJ0RUIAokygsKQvVzOEutFLH+584P7OYQB1sXgqQ7q3MXHQC2JBfeEjaOs
         8FXFzlsJlh8EaOtovl/Pnsg3Rz1IBgn6WURtZbOz80sesjvyD3DD9tEFDlpOKxICEhqY
         WqY4Jqb9Op7ytBPArbgvTH4CPBw8FFgXmftj96gdSNfN5WuY+0MnPnsUMMPLtji+1gqt
         VIlBdGP+uJWrGgtc3HA6kamCzrW+Vds6fW999MRXC3UTJC/3sFwYll9uJ6cviTiBvQn4
         xImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949139; x=1725553939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeS4H6a6NS9M4W+N5Tojf3l1adclhIcOrpM4ziZDDtQ=;
        b=uy87T8uMJNLU7pELOaMlxohbe/QL8tl1t5OHmTIIHmUaIxgQE5hnpIkSgrWyP8zcV2
         DwpOO3LsdYlsUE39Ny9OF6lYUyf393bB3nwpbZtC1eNMpROHmRoA8b0BW9Q2j1WaUpLC
         jfDC2647Aoxnex2hEWHxhH/fVbF5BIChFGa1+HtK6Yd+AIjKxaHykj1gCv0AyE0xQCWT
         +qq+iDMFhrwiuazOfgzOSetxlbxaGYcc2p7S0YLmFnwNYGF32CzmjkKvvlC3MU+MFc9h
         iEEo5YLcuF4/dhZKujjE39AMIYVY0yr1BM8wqMv6Ecy2zY81+jBjzJKbyIoSzihv0RDF
         iR2w==
X-Gm-Message-State: AOJu0Yxt+KBNzPUWgymhcoVyYg/eTtZcpuY1S3eNJbRT5r2AQXl1OI4I
	OdXU5O+3zk8QhG1XJva0LA+b4lKrL/y9WEnLXTQ+HBO6zuBKwDdpzr8pSlV4gGOOd5I2SvQuhG3
	R
X-Google-Smtp-Source: AGHT+IGxY0E0Ub8B3wC25dZVODNbqFtTezzxJ4XDVgiy17r5QitEQ710StSFBPR/1aP2exI9MSpxRg==
X-Received: by 2002:a05:690c:3141:b0:64a:7040:2d8e with SMTP id 00721157ae682-6d2777774c8mr29816017b3.33.1724949139560;
        Thu, 29 Aug 2024 09:32:19 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:19 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 06/13] core-image-minimal: Inherit uefi-sb-keys
Date: Thu, 29 Aug 2024 10:32:02 -0600
Message-ID: <20240829163209.47945-7-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6016

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-core/images/core-image-minimal-uefi-secureboot.inc  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
index 351e9030..2232d3b3 100644
--- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
+++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
@@ -1 +1,3 @@
+inherit uefi-sb-keys
+
 WKS_FILE = "efi-disk-no-swap.wks.in"
-- 
2.46.0


