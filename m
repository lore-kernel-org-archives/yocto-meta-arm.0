Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E58DC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:49:01 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.3921.1651103331456794178
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=JZkncwGC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id f186so2495321qke.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M4kZTdojZ6EwoA9DYQTNdzZzFt0MxfqjsKzTss3DD+s=;
        b=JZkncwGC1/tR0LFIWyo3oOrIDOBqm3TwlryvPGoO0tjy22HFzdToRbnuPecRTbFD7Q
         tg+3wCxuIAz24tGkbnRiqZWAyMkbsDcNvdm2TEUw+bsNdw3cDiHVzRPtOBPA8akA1KYI
         9CIveFleKs2qoGsIfRAd1gz7idx6y0tCM+lQ1jjCR5bLCgaa33PYZsWLF9pVYm4AkG00
         PAk2hU9T/o/cNRzrCDSw/XNJYd+Ou1V6GaGsjDnWCWbx3HAZm2XTZuUwoyOHMdqrRosa
         PBiAMFHOrSFldUegOE81kSn20zwb91YC/gzd3hkTyTGsmCIPqB52x4FFxtZFQnTTqBDP
         F6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M4kZTdojZ6EwoA9DYQTNdzZzFt0MxfqjsKzTss3DD+s=;
        b=bXdgnpmbd+00HQSll/awykf2UdADwWkwu0682EjZa/OmxMjE8ys/1h7QrhViZwUS6r
         CJoYjJ9MG+PTU7wSUxsjndBW00d91xlttpTq2ry/uFKtyLbhXxPy0tMGRGoWnwjwU6XT
         kRyBh6x/AMNDZ3z3trVtrPamvDadG0+48R4NASR7/rk6pxIXlUGoAgXE0e8jXssU/UKl
         5V1rSSWTebzkDJyQHpjYWxdhykzI1hvybC89Z8Pec9H/oYUINjamjzD3lWGgDRU7HUAb
         q/lnCH9xZ7UI92mJYlKyTVzyRjhLwRs75KNZT9jlSQbWjPGD2CtTFnJfkrRD3D7j4aln
         a40A==
X-Gm-Message-State: AOAM532uZLhP45RmhJAaHu9/IefzkGbgmFic7hdFHInlAnJFkfmZZoEZ
	PWMJnrZ2jCqpCc/7FPnW76Ad9HM/oQknLQ==
X-Google-Smtp-Source: 
 ABdhPJzUP+KS/pOMSx2EmLsJPUrKm7pkP3D0LVr3whw7iU1ahgfZBSkIgjfH5NEEkqxQkrQUEGLm1Q==
X-Received: by 2002:a05:620a:4310:b0:67b:3fc1:86eb with SMTP id
 u16-20020a05620a431000b0067b3fc186ebmr13437196qko.495.1651103330503;
        Wed, 27 Apr 2022 16:48:50 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 k14-20020ac85fce000000b002f344fc0e0bsm11342609qta.38.2022.04.27.16.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:48:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH 1/6] arm/fvp-base-r-aem: Automatically download FVP
 tarball
Date: Wed, 27 Apr 2022 19:48:36 -0400
Message-Id: <165110331935.2615227.6339215366269360650.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422160900.1861031-1-peter.hoyes@arm.com>
References: <20220422160900.1861031-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3318

On Fri, 22 Apr 2022 17:08:55 +0100, Peter Hoyes wrote:
> The FVP_Base_AEMv8R tarball is now available to download directly from
> developer.arm.com without logging in. Therefore, remove the
> FVP_BASE_R_AEM_TARBALL_URI env var (and references in the documentation)
> and update the SRC_URI in the recipe.
> 
> Move fvpboot and userNetPorts to the machine conf, now that the
> FVP configuration is no longer dependent on an external tarball.
> 
> [...]

Applied, thanks!

[1/6] arm/fvp-base-r-aem: Automatically download FVP tarball
      commit: 627f8b9f7d2b5a93c87facda8aa3cc8cbcac26a0
[2/6] ci,arm-bsp/conf: Add testimage for fvp-baser-aemv8r64
      commit: 1a684977718fc18b1eb0805753d45e4ed86cf89f
[3/6] arm-bsp/boot-wrapper-aarch64,u-boot: Clarify fvp-baser Upstream-Status
      commit: f2898f5c56a518f53168ebfeae11379b7fdfb391
[4/6] arm-bsp/boot-wrapper-aarch64: Add fvp-baser support for EL2 SMP payloads
      commit: 8c063543e087bf20378850aff191013e0af9a8cc
[5/6] arm-bsp/u-boot: Fix fvp-baser-aemv8r64 fdt memory configuration issue
      commit: d412c2a3fd70a2377e177fccb65ad6571abb665b
[6/6] arm-bsp/u-boot: Enable fdt overlays for fvp-baser-aemv8r64
      commit: c713908b7feb31067601e335222725e5ddcb6668

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

