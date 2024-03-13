Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C35C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:37:42 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.17130.1710337055682594946
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 06:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DbAxiOQr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-690be110d0dso6647666d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710337054; x=1710941854; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO4+JaDrDtbqzap3W60lQEFY6djOcvB3JmHiPHZXzl0=;
        b=DbAxiOQrHvymKqyfQ9V7XztajORpmx1DmgIaYg2l+Q4p5AtETZXKAVKmWXCg/jw+n+
         33ccq6nQP0cf2XkG4e5YR/3EzbTU9E/MD98EQvOcd0aaLEwx7KMTmlWbQKAVK8jSAtH9
         hhbEFhXCJyf7h9CtlICSngaEnU2g6RqDuIcDF2vRkG/XyGAZPgkBfpupYpe29R/0JY07
         I5KkqrPvwu5/J8bwayWxOYe+99EVwWUJ0JrfEfDugQ0RRus/5aEZMwZwAFn3WMPDSVkM
         IJWykY5JEEbgBZeO8kFYrcXgeZ0UfeKSDmM7ZMCIzLfaVS/m3HXYoKyPhtPCA0GgVnrs
         WkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710337054; x=1710941854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO4+JaDrDtbqzap3W60lQEFY6djOcvB3JmHiPHZXzl0=;
        b=fRPPjEump5AbbctmFglFK/eWA72aY0xn2WaQn+SAr6js7r+R0C3sf+hoZq56NHiyBI
         6kAOJklx+x8QjX60bCb2420+RUP8lTrdCNZXUPUq+7hVzbYL3MC0W2YA1fOKW0NrdT72
         ZEop5huZa73ax1+QDf4XpBEXLTiWN3fkq+s/Sa3zxLl4dI1lCmiiUR5EIkMXh+KZwUUg
         PR57f2heqoXtwlW1UwZKCzTkgJCwKU9KzJ92HZdLAY42XjbXntB002QLzCBgjqAiHBBT
         2gOmUnWK28yapT4mVjBVFrXXYW4kfUY8S6ab6HfGFbwXpan1aozGXFXxEDUcraegdTj1
         2sOw==
X-Gm-Message-State: AOJu0YzuJryFeLkKI1+U30aavwb5AS3g8dv5fq6W7A7C5M5BdfLkRwAD
	ylxzyNFtwRUZ4X1S73TCysUg2g8F5/Dx6IgNhQ/RsgP7CPd4g5RrnNMtPqsH8t9nh+NJyMANYYL
	Svw==
X-Google-Smtp-Source: AGHT+IFEmaiicutMh9peudpImoONV3Wxvwgg1evJpovwNIEBMYYhvSxdyTSlH/0cq4fmDfmA8vj3Gw==
X-Received: by 2002:a0c:eb04:0:b0:690:bb11:2a0 with SMTP id j4-20020a0ceb04000000b00690bb1102a0mr6980461qvp.10.1710337054683;
        Wed, 13 Mar 2024 06:37:34 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b15-20020a0cf04f000000b00690cedd5be9sm3250180qvl.125.2024.03.13.06.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:37:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH] optee-ftpm: fix EARLY_TA_PATHS passed to optee-os
Date: Wed, 13 Mar 2024 09:37:09 -0400
Message-Id: <171033703263.1772326.13840835656316469187.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240228160920.62705-1-alexander.sverdlin@siemens.com>
References: <20240228160920.62705-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 13:37:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5425


On Wed, 28 Feb 2024 17:09:17 +0100, A. Sverdlin wrote:
> Fix the build with DISTRO_FEATURES containing "usrmerge":
> make: *** No rule to make target '/.../optee-os/4.1.0/recipe-sysroot/lib/optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.stripped.elf', needed by '/.../optee-os/4.1.0/build/core/early_ta_bc50d971-d4c9-42c4-82cb-343fb7f37896.c'.  Stop.
> 
> 

Applied, thanks!

[1/1] optee-ftpm: fix EARLY_TA_PATHS passed to optee-os
      commit: a01f272149379085845e798dc46d31f680d7431d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

