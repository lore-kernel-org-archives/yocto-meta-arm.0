Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2937CC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:49:11 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.4059.1651103341958367507
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3SDRTisx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id y6so360633qke.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BdGj0pWVl2n9/+Va+nl5qm37JLPebL2eBvxndExTy70=;
        b=3SDRTisxQOXNT47z95n+m/QmigrrL0g8BxVCEZPp/zHqBZqfq2NgQbB2p9rst/9ret
         EFTxIDZIiVHKCKgdwvDKL6yNts5PKyjxl6AgXJAOcDjbyjd36gFyAswUwh9JWyGwc5EA
         24/Qk5EJrJ1A2BXa/7Iv2L08xWs+Zy53dVskM1yA7rSbob6+rwPS/+MLq0dCr9s8CTPO
         8Q0l2nrve6yovnkMiae0qN1XDdUA1+QRWwUTEBYYyvDG2NA76GcGgiFdVTebokFaaWko
         OTzowAanSxuLQvj4lTJwEJJ7pn+Pndwx/jAO02/0iy8rUKJNLT4ySLDQ2e34xFnWzbWS
         ZG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BdGj0pWVl2n9/+Va+nl5qm37JLPebL2eBvxndExTy70=;
        b=3UnULvjJECD+zwFAk9NJe/7DgrDnCqh69+FKkAH8HUQnsko0GyN6HteWQ7M597jAsn
         0kJk91Pp8xFmjNMW48nM2NFKgRzLSPy6TmqVshX6/kl0jYxCJcTRpcrqt8MdH/Pj5aRL
         PkyHv4QAUqkE1BVg/lLKz3ZwbdBKM7WPbQmo3/ZlwCydfykOAl2vJV1PQUodNii3RPuQ
         Pvs/O4N9rvG0Q+OhutuJYu7JPtELdfV9i7bG4Ja4CeEEsCPzxPrrKiuDjSqgtW7z6ZzT
         iAulYKfkrgCYHPWuRGIG4jOZcH6QG00PZjaCXvH6Bv3pcH1c4SoF2ta/lqmlsMsiNj3d
         qrLw==
X-Gm-Message-State: AOAM531W3sfcBPUeCjSTMBb+RwkTT/FyxGDF15CDC/fp/cpWp818E5mM
	5L5miIgOFbsomL7Q+jRsSlSNTbS6R513zQ==
X-Google-Smtp-Source: 
 ABdhPJwuQLyLmq3nSrfmuprKg7u6tNfVIOufv3JHl5XXwSSvYAysgXvPZeQtnXwoiGyMRZytp2eQ4Q==
X-Received: by 2002:a37:f519:0:b0:69c:29e0:f740 with SMTP id
 l25-20020a37f519000000b0069c29e0f740mr18029594qkk.652.1651103341029;
        Wed, 27 Apr 2022 16:49:01 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 e23-20020a05620a12d700b0069ec181a0b2sm8388803qkl.69.2022.04.27.16.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:49:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] optee-ftpm: Install artifacts into nonarch_base_libdir
Date: Wed, 27 Apr 2022 19:48:38 -0400
Message-Id: <165110331935.2615227.10633798721967240364.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425174204.377056-1-raj.khem@gmail.com>
References: <20220425174204.377056-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:49:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3320

On Mon, 25 Apr 2022 10:42:04 -0700, Khem Raj wrote:
> This ensures that builds do not break with usrmerge distro feature
> 
> Fixes
> ERROR: QA Issue: optee-ftpm: Files/directories were installed but not shipped in any package:
>   /lib
>   /lib/optee_armtz
>   /lib/optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.ta
>   /lib/optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.stripped.elf

Applied, thanks!

[1/1] optee-ftpm: Install artifacts into nonarch_base_libdir
      commit: 6a105f47b920ae02a4dd5d0949a192382ac1d5cc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

