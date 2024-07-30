Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4DAC49EA1
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:25:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.14644.1722335125187628913
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 03:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MBPKl/Xv;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so9874307e87.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335123; x=1722939923; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/shhQlkqxlG8mLSsWEdxp0crruvg58Rnl10L3e4o4h8=;
        b=MBPKl/XvC2IiaJTju8FMetSHWeiKHglwad4Bq9MLB2B74x8TJLKJRtgzAWSpikWhMU
         EVQKvFtGgX7xOSQU6IOoyQcu6goEhBlepIWGpQ34AICj6IM1RcDrlXZzBW8UTl0tQ3VR
         Nf32a4ecpvdaPgdq/1qY71owRCaPspeosuoHR/vQDpxOkOLq0VqesM1Ly9KwePAxZP5+
         DkRNwfTqPtxjB2G8ynmI7skBORUCd97+b9mFFHKJ/CjhRrt7GRsM1FpCA7qmkvYs253+
         8oyWZYlNMqWIxI5c+yvgqSMR4Qd1U93/7kPLZi+m37Gog+S9vTTwFmf3gNQEyFcF6aGm
         +8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335123; x=1722939923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/shhQlkqxlG8mLSsWEdxp0crruvg58Rnl10L3e4o4h8=;
        b=oMIVDedcaEzLwM3bXqUGJj9x8U/arr4OKMbVii0l4EOIyn8PSlwhYBS9FCIbP0dA5/
         oa3vsNBRL5INc1YrMZZOhASakWhcymK2hlfILXzVQVX3YPJXxu4hNVx9ooz/8NPbqCy1
         +ssWL2vZi0bFo/dw2km2EFS0lSz9EbJIuGs9PN4Sal7b56w7q0qjRni/QQCCgosuNJU+
         C73w60ZwywjPEL2sPnv38iTEvmabWs3c0SHtY3mdMUcZIOBvWDDXjOKRpl3LtGrlKo6h
         SYMkxyv+aKBMoXtA/dFRZqSnfbbVf6J5JgbWZ6T4189FWq/yp1vuP+MpK5ljWOnZkIQs
         /2tA==
X-Gm-Message-State: AOJu0YwzG2melny1fIpUbbUqAbPG5YD0EugHlo/uxnjojy3fWdndrw24
	Tlbz2/is80mLY47iIEYS4r8B4mFcJ38bJ51TGFnpVxWK3HxsQu3ZChOyoaAFggQTkvYFfLNl/Sf
	g
X-Google-Smtp-Source: AGHT+IEAny64e0b3pZnjlQMbzIHSsVa3XfpY3C4HbM2fq2GxiPdap/yENUwG0LLhgiu5n9cmosKKhw==
X-Received: by 2002:a05:6512:1296:b0:52e:933f:f1fa with SMTP id 2adb3069b0e04-5309b2e0b62mr9216514e87.61.1722335123150;
        Tue, 30 Jul 2024 03:25:23 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc4a46sm1861969e87.17.2024.07.30.03.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:25:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 3/4] optee-os-tadevkit: remove buildpaths INSANE_SKIP
Date: Tue, 30 Jul 2024 13:24:58 +0300
Message-ID: <20240730102459.148826-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730102459.148826-1-mikko.rapeli@linaro.org>
References: <20240730102459.148826-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 10:25:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5930

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


