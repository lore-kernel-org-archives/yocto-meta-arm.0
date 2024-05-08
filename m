Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90072C19F4F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 08:32:51 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.7377.1715157164141502197
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 May 2024 01:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bz9L5ksq;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso77884681fa.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715157162; x=1715761962; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7elZM+oBt02PoL09Nlp3hQ9LmHrgoteEv7kCh4abQko=;
        b=bz9L5ksq0tabChAJelf9VXb7PE0uQFK54724ai1PUpEx4Ieh3JSFnfdnYT78KWt95i
         +PEMOJmJ4khvWoP1E5LswEzLqaVGEEe97QiOIw6bQvJHClTZ+5h/I+x+tmVNLxcR+CU9
         lZc87PQL/a3gPKAULmlAseW70I5d7EchH19bxAnX1FkOmm7JR276QnychisytsaZxVD8
         XbWL2VlMDC+Jtlntt2VmrtHXLL8qq6780jrScBzxNmNgBgzDLeL9TCRTIu6whu9vi+Mt
         ZcICrT5ehddMbDucd/P6DOTsvrDlZ7BeYaIEGXwA512z3PaYfkI275BcKXdafKDsr8lI
         LePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715157162; x=1715761962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7elZM+oBt02PoL09Nlp3hQ9LmHrgoteEv7kCh4abQko=;
        b=L/qg6dkkIfSkxOAV7Rn0V9mfhyWR2zSCHR9kWi9VKV1MUB8Z6IQ7CU7t2uzib6AQCS
         RpTrYHFJxs3yFao0PjDrKMoPzQYC0Y3KOvtS+96sErWxMN33CL8F41ix0ArkYZ9nLtPZ
         8Lh0s87ADImHa6nUMwNRLwSTCYICtYva0ehHfDdyh77et80vtD5mne8d5DQYr135+X+p
         NOnCtRlyWa8APc7kiv7WGP3xpM2Bn+jfzMTaZOTdHPUl3KPzhhphEiLm3uHRF4zLI5bk
         1ORXbxXAPFGpOLblJD4PvgB906KaY5QU4aZ5llHDK5oBVJrtk2PunlSBHIe3oK+NtrZ+
         AkvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqrhn/guQ7HJx89TbPKH9whSB/1UHpLgqiMQnRl5O7MvjzUX+Bxrl23HWzwA4SupPjtq/ewVQA2+m+jAk0LrattvBnBVz67/Z//W9Q2h1L
X-Gm-Message-State: AOJu0Yxa9zlGUANdHqRhp2rziTJ2MfYoFZNYH+s/5AjOdxM32/BTDqYd
	k7CZLIwTYNs/w1s7YXTfOt3IZmklpxGiJ12qNh4+48gQCncsRQtEJTzjJilkLTI=
X-Google-Smtp-Source: AGHT+IGc1MCSXCGuVSn+i33IPq5tpO6wfH0+r7W5NPPFH1rEOqzON28pckYon8hnl35rBShmKw9ohQ==
X-Received: by 2002:ac2:44cb:0:b0:51d:1c56:b0f1 with SMTP id 2adb3069b0e04-5217c56715fmr1552460e87.17.1715157161888;
        Wed, 08 May 2024 01:32:41 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b00518a91331b1sm2404232lfo.184.2024.05.08.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:32:41 -0700 (PDT)
Date: Wed, 8 May 2024 11:32:39 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: jdmason@kudzu.us, Jon Mason <jon.mason@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 6/6] arm/oeqa: increase optee test timeout
Message-ID: <Zjs4p5vDd9AhPI0v@nuoska>
References: <20240507173313.50788-1-jon.mason@arm.com>
 <20240507173313.50788-6-jon.mason@arm.com>
 <ZjpxMOWWTU2y4+qs@kudzu.us>
 <17CD74F8C81EDD3F.8817@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17CD74F8C81EDD3F.8817@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 08:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5706

Hi,

On Wed, May 08, 2024 at 11:07:20AM +0300, Mikko Rapeli via lists.yoctoproject.org wrote:
> Hi,
> 
> On Tue, May 07, 2024 at 02:21:36PM -0400, Jon Mason via lists.yoctoproject.org wrote:
> > On Tue, May 07, 2024 at 01:33:13PM -0400, Jon Mason wrote:
> > > OPTEE tests are failing in CI on slower systems due to timing out, but
> > > actually finish when given enough time to complete.  Increase the
> > > timeout value to be roughly 100 seconds longer than the time it is
> > > currently taking to finish on the slower systems.
> > > 
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > 
> > This should have:
> > Fixes: d4507866677c ("oeqa runtime: add optee.py test")
> 
> Yes, the optee xtest execution time depends heavily on the target machine,
> real or emulated with qemu. Also, the number of tests and thus execution time
> are increasing in every optee release.
> 
> Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Maybe worth mentioning that with our Trusted Substrate firmware

https://gitlab.com/Linaro/trustedsubstrate/meta-ts/

which has TPM support and UEFI secure boot configured with tf-a, u-boot etc
for multiple boards, compared to qemuarm64-secureboot and qemuarm-secureboot
in meta-arm, we had some hangs with this test under oeqa and qemu.
Same hangs did not happen on real HW. Something to do with serial port
handling in qemu and how oeqa python framework uses them. Thus we set the timeouts
to be quite close to the real execution time to avoid long delays in detecting the
error situation. Good thing is that optee xtest does allow to skip/filter out tests
which are known to cause problems.

https://gitlab.com/Linaro/trusted-reference-stack/trs/-/blob/main/meta-trs/lib/oeqa/runtime/cases/opteetest.py?ref_type=heads

Cheers,

-Mikko

