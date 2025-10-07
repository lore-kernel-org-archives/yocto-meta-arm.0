Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8B2CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:28:03 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.17501.1759840078912220366
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Oct 2025 05:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WQ0o8RdK;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso63976941fa.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Oct 2025 05:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759840077; x=1760444877; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qfa6fYAMJWaiajq+QnyNIQP4JPlty3K+7H+G4DgcuuQ=;
        b=WQ0o8RdK4BjizvgGELlIa4Tizu/nJJOptOL+Q80yDe4L5/q4oHMOw2joOkPDkaMDUK
         D/AHp+iyOHB6g9LnhFpIB4JzoRAA2kgFdWBzUZX1uv+bKu+0dhENT8ZKaLaVo+sHinft
         QkRiEUjOhfGrcNDJ36AhhFqurMZveSlg8ml+3v9ugGLVF2M+io1m/qQkW9qhYFsIBAzd
         0D2MLsFBfYDYg35HZAB+ytp4PBJBUnpbbxHEF8+JcJ266rex09/XhqnAsGLUynmmSKv7
         KQITpD70AE7j+cV0jTBHv5ELOq1VpJZ373L9yJM8VO7GNiwIguEHxAfjO3bU3+X1Ad7J
         +TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840077; x=1760444877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfa6fYAMJWaiajq+QnyNIQP4JPlty3K+7H+G4DgcuuQ=;
        b=mTha2bjUV2x+cbT+y1GlsBJ+8W4kZlJ4YwCkbZkFWunxvD5byF5DISGHowQgn8m/Sq
         780LgZlYMlWSjcOORG1+MSDx4eGKDClrov7Mt5/mdfaWsskrMyMhS4rmmnXaJy34s5FN
         EmRFFOhsFJP18Sn3vVMPqVDbMOnY8a7k/id9kC0wTcOHqICEMPPzXd4y4VGzK0cbvNxe
         TuDEkJFiNgaesXl3Y99IDlvP0jRvMHYHvJY/UkkSnsevjA/FusVNwpJe6Y+QrLOXy216
         SJArhQvTcH2hPghlFznHkz5nbbIeEveDsMk0ksaXv8CNUb3n0XiG9P3JR7/2HDrH96nX
         UVuA==
X-Gm-Message-State: AOJu0YxXXnf1NLUPGN8WR3N8jt6TG3D/2S8t1kI3hpBMUk78gbr15Coy
	4oXlO/ZU4RwV+JymrzUKqZy9haYy/L71AhC1mywIp3TPdr3ri0nialoi4tLqDtwwbrg=
X-Gm-Gg: ASbGnctfiIXj3Ms4TWmS2DGXCu+39iTgwrPT7/adUwcKKHKHEt4aRBn93NEvL8SAl3L
	bsoMUftY2zRHvjB8/w7ukqnNds2uGXdUGq5I20MigR9pnQ2z6+UoPgJtdWfCoolA3z11Zyn5RQs
	6z/I57YINEOcs2HF9HjY0FyeXyRu77EMDHQYmAvNfRxKnrrBawn9duB/hxSyZoOPH86xxXULB1k
	SUHalZMcQiWbnbjZRlT331nB34UFA9EIN9qHkz/U1rcUkcZB+JnXGcdu14pgiQAMAd6/q3O9LFI
	MzfGy/KVpr2T4GrYR03vvo57wDnoDQw9GXSykLy6X2+N6nL1HsA+jThS7dtVhr6ugX/CKP26jzF
	RYX9xiHoEm/MvgLE57y0zd1EI5Mq9axP2puNlYB+PU7MXOo2Z7qT90msvBXL37BZGz0ZxQF7gmF
	a4o0beUCK1
X-Google-Smtp-Source: AGHT+IEpqWLhv68WMbxvwfBiUd5tkEnXsP2dvqLcAP6b6NzcnhYs/GyVHVI8mN4De8m2BFXkrYOTWA==
X-Received: by 2002:a05:651c:988:b0:375:db6e:fac9 with SMTP id 38308e7fff4ca-375db6efb3dmr22092321fa.31.1759840076809;
        Tue, 07 Oct 2025 05:27:56 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375ff13e292sm3764231fa.3.2025.10.07.05.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:27:56 -0700 (PDT)
Date: Tue, 7 Oct 2025 15:27:55 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: tanguy.raufflet@savoirfairelinux.com
Cc: meta-arm@lists.yoctoproject.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	=?iso-8859-1?B?Suly9G1l?= Forissier <jerome.forissier@linaro.org>
Subject: Re: [meta-arm] Question regarding optee-ftpm TA recipe
Message-ID: <aOUHS2cM-dPlLrXI@nuoska>
References: <957048281.3165100.1759839079101.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <957048281.3165100.1759839079101.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Oct 2025 12:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6727

Hi,

Adding OP-TEE maintainers to Cc:

On Tue, Oct 07, 2025 at 08:11:19AM -0400, Tanguy Raufflet via lists.yoctoproject.org wrote:
> Hello, 
> 
> I recently updated my BSP to a more recent version of Kirktone 
> which leads me to use the new optee-ftpm_git recipe. This one is based 
> on Microsoft/ms-tpm-20-ref while the older recipe was using MSRsec 
> (changes introduced by [1]). 
> 
> After this change I could not boot my target anymore and had no 
> meaningful errors. I finally figured out that one of the 4 
> "Authentication passed" messages was missing compared to the secure-boot 
> documentation from TI regarding the AM64x [2]. 
> I manage to link this to a problem with the bl32.bin file, which is 
> actually much smaller when using the new version of the optee-ftpm 
> recipe (0.7MiB against 1.2MiB with the recipe using MSRsec). I solved my 
> issue by reverting [1], but I would prefer not to do so since MSRsec 
> looks to be not maintained anymore. 
> 
> When looking at the MSRsec repo, we can see it uses ms-tpm-20-ref as a 
> submodule, so I wonder if we can really use ms-tpm-20-ref alone as is 
> currently done. In addition, I saw that the recipe from the master 
> branch has changed to introduce the new optee_ftpm from OP-TEE in 
> addition to ms-tpm-20-ref. 
> 
> Do you know if the recipe from the Kirktone branch is applicable in my 
> case (AM64) or if I absolutely need to backport the recipe from master 
> to make the fTPM work? 

The answer depends. I think the ftpm version from meta-arm kirkstone branch
is too old to ship in new products because the ftpm tree is no longer maintained.
I think it would be better to make the new ftpm version from meta-arm master
branch work but that may mean updating also to newer OP-TEE version as well.
At least this version of ftpm is now maintained by the OP-TEE developers.

I think your boot issue is not fully resolved yet. I would enable logging
from OP-TEE to figure out why the boot is hanging. It is possible that
this is a configuration issue with OP-TEE, e.g. new ftpm using some calls/APIs
which don't exist in the old OP-TEE version. It is possible that your firmware
needs an update to ftpm, OP-TEE, TF-A etc to get all versions in sync and working
with each other.

Cheers,

-Mikko

> [1]: optee-ftpm: Use the latest fTPM sources 
> commit: 3ee7d019898854f776f95ed31f4b7ea8c8a73dfe 
> [2]: https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/latest/exports/docs/linux/Foundational_Components_Secure_Boot.html#secure-boot-flow 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6726): https://lists.yoctoproject.org/g/meta-arm/message/6726
> Mute This Topic: https://lists.yoctoproject.org/mt/115634462/7159507
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


