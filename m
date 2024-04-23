Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE40BC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 18:18:15 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.2479.1713896285681957204
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 11:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=L1dMMMrf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.50, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ea2436de79so3175666a34.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713896285; x=1714501085; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9w2orlt6WsK4bo46jjkHnlewpTL2lzu0Ldv2z2fjoc=;
        b=L1dMMMrf/SX8gU1YEzg4CYebiP5O5icP1fOqhI0/xl9BuCr/+oUHhlvaei2vu6E+8J
         m0FgR0uNcazO9vT8fs/WIER7t5LJmBjLp6nD7Op4k227Uj/KBaifO/aeWUg9UkGVfCQd
         fycIABv9FGfeN6un1/t29DpRQM/Q+7ICaoAdlxzVCrtp+qSNXKMeBMu5x3B4+pyr7q3b
         tg5up5YGHOfuRh7VXZAa5wYEJy2LgQ+n2TPs67OFCXgsvqnw+erpfuNRyZSkF995ITOE
         ew9GIkbVtIuBsbMXiZZRIg5uH20cebazZ1SZz4SQddAF9slqQ9RP7NSbyDVf/Usr1RwD
         bgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713896285; x=1714501085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9w2orlt6WsK4bo46jjkHnlewpTL2lzu0Ldv2z2fjoc=;
        b=KNTp+had1plqrxQf2Wy6rJXTUIvHDBMhdJT1v64EUacNoK3cKaSubHeDZ9r+InqNeB
         eZENDYNGzYMklrbhopQMGNf6oDWjsuwrHQbmrujvgqUv39eWLrS8oc7ro1Bg3pIMWHwX
         XDPquVkB01r01ngpq1Jvh8+Fxo2trR80nCCMEtVZX703fbgSUskeSC/lUzeowiIs3q80
         vhBrw64K7eVmCn9VqXdvCpW3semMBKtaGQcLkp53vq22ECA7siasXznB4dXpc5on5qdh
         dxempZ/FzKUJi9mqWcJ6KowPObTy3yPpTzKFhuYYJfTloqnF48MTnHXzqJsHJy8+KTTv
         N7FQ==
X-Gm-Message-State: AOJu0YzNm59B5u8NccrNVcRf7+iqxXhD03+Hl9GhHre9VBd+p3eSi1m0
	gXiCTdJNL8uv/u2V6YR8NU4xCk/tJvRQbd9VyUIREMf5s64gBsrJhvc+QT1h/qF5fTdCH9EMsZU
	=
X-Google-Smtp-Source: AGHT+IFh9tB/z9A8CW3CfMFsoDLk5wbtXsWUzyGKjpyzpqELmpQ7oP73E+kT7wN1K5bNReK0xHxa3Q==
X-Received: by 2002:a9d:6755:0:b0:6ea:23af:2bcb with SMTP id w21-20020a9d6755000000b006ea23af2bcbmr385655otm.32.1713896284891;
        Tue, 23 Apr 2024 11:18:04 -0700 (PDT)
Received: from kudzu.us ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dc29-20020a05620a521d00b0078f060405a3sm5477467qkb.80.2024.04.23.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 11:18:04 -0700 (PDT)
Date: Tue, 23 Apr 2024 14:17:58 -0400
From: Jon Mason <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org, bence.balogh@arm.com
Subject: Re: [PATCH 0/3] Use U-Boot tools for capsule generation
Message-ID: <Zif7VqPUZ/kzE5aG@kudzu.us>
References: <20240416161446.217376-1-bence.balogh@arm.com>
 <171365299875.816258.18229094767079242253.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171365299875.816258.18229094767079242253.b4-ty@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 18:18:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5596

On Sat, Apr 20, 2024 at 06:43:18PM -0400, Jon Mason wrote:
> 
> On Tue, 16 Apr 2024 18:14:43 +0200, bence.balogh@arm.com wrote:
> > From: Bence Balogh <bence.balogh@arm.com>
> > 
> > The existing capsule generation class was modified to use the
> > tools provided by U-Boot.
> > The intermediate nopt image generation was added to Corstone-1000.
> > 
> > Bence Balogh (3):
> >   arm-bsp/corstone1000-flash-firmware-image: add nopt generation
> >   arm/uefi_capsule: use U-Boot for capsule generation
> >   arm-bsp/documentation: corstone1000: update capsule generation steps
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] arm-bsp/corstone1000-flash-firmware-image: add nopt generation
>       commit: e6ff022d6d3d6cbcbd9b30006a75be69f7d35c29
> [2/3] arm/uefi_capsule: use U-Boot for capsule generation
>       commit: d0d1b96b0a39b973b6b882e561752c1fd7065fc7
> [3/3] arm-bsp/documentation: corstone1000: update capsule generation steps
>       commit: 527475c354d8897d96eb7cb7248f4207cd8f44f8
> 
> Best regards,
> -- 
> Jon Mason <jon.mason@arm.com>
> 

Reverting this series, as there are issues (which have been
communicated to you in another channel).

Thanks,
Jon

