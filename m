Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF184C10F15
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 08:13:20 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.13309.1713773590168168862
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 01:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KMGP1puW;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5196c755e82so5721733e87.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713773588; x=1714378388; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ/4KfceF3Hbrnm2ULTh66D8lgC4E9yG3+qKSicNn4g=;
        b=KMGP1puWSacww/K+tzVd4IMpwiuEhkozHUOqcagDgOGz3WmigJBJdBp7tx8tT51XlH
         k1RLybtjL0KC2A+mRiHH6ZW/GQwXKVW3EAw/Vu9aJDsF/Ojl2HS328PSH4o5zQ8123qJ
         E1ldCF4s4JR9J27SGcLCP/Y648rfRJGri7cjJOmNhmozoDvpiv1joC6nRox9Pf4/uZvi
         +KtKKan3l2mYQ2BIxLZOeGYY5juqAQPCxzWEoeWWiswrwiaTxChrMY37iv5RQLE+1PAB
         PHV6n0V4HsPlyzNytOa/VeJxFQYcRJ6tXefccFgf90WYWx7oGu3nlr5Se+cRco/5Ydxb
         8O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773588; x=1714378388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ/4KfceF3Hbrnm2ULTh66D8lgC4E9yG3+qKSicNn4g=;
        b=KKtFZ6kpHmr/WcyQy/ZceygBnEO6LBstQodzLSr0+pQnSoPVOFliIz6cpdvI5XHHoY
         cTEI7TDoMvZ39OpEyWDYGBWn4orSvsbc6Pw4A63B5VnlIG7YM+Ell5uDuxEN61bLGjoU
         uLGZU/Y1bLfNDfE4AAxJXMcRlmG4eWD/Oethdvp0FASpQC1B1qpk+fUKltb9gKwuZhN7
         o6Y94ajIAvdt1ABlvnBag+ndEW69/sGkvN7cJ2/d5iThMs7iO3MSM9rLjRBKUmfA0WmO
         GsnYecpS2YdkX2eVx5sD2tiXCSEtjYyIu/SRZzPsALj9gbtNNIxuSfTtpPu/8JfZx+kt
         MfVw==
X-Gm-Message-State: AOJu0Yz83K4gWRW8qRGAHdbkF6k9IVdiVxh3bNBQ+4ZfLorCZ0tNdtQE
	Hk48LxN94MwK2iW5NDCWYtsbhsxEcRsxohgGX4aOxk1KfN62880/pDrsi32xhbw=
X-Google-Smtp-Source: AGHT+IGYbq3AstGzppwYdhRSzNXE2KtmEOFwDmG9p2EfS884cilgIdbK08sUR9l0mUZ4vsX9nZCYwg==
X-Received: by 2002:a05:6512:34ca:b0:514:cbee:a261 with SMTP id w10-20020a05651234ca00b00514cbeea261mr5159828lfr.27.1713773587950;
        Mon, 22 Apr 2024 01:13:07 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id g25-20020a0565123b9900b0051af630d0d4sm616365lfv.192.2024.04.22.01.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:13:07 -0700 (PDT)
Date: Mon, 22 Apr 2024 11:13:05 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/2] optee-ftpm: enumerate also without
 tee-supplicant
Message-ID: <ZiYcEcLpKX9DDjpd@nuoska>
References: <20240417110722.283283-1-mikko.rapeli@linaro.org>
 <20240417110722.283283-2-mikko.rapeli@linaro.org>
 <CAFA6WYMk9vA429qR4jQ=TW5Odj9T3mnFQF_yzVCTdYhPKCX04g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYMk9vA429qR4jQ=TW5Odj9T3mnFQF_yzVCTdYhPKCX04g@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 08:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5576

Hi,

On Mon, Apr 22, 2024 at 01:02:49AM -0700, Sumit Garg wrote:
> Hi Mikko,
> 
> On Wed, 17 Apr 2024 at 04:08, Mikko Rapeli via lists.yoctoproject.org
> <mikko.rapeli=linaro.org@lists.yoctoproject.org> wrote:
> >
> > Userspace like systemd boot manager would need to know
> > how to find TPM and fTPM devices for rootfs encryption.
> > Thus expose an fTPM TA enumeration also without tee-supplicant
> 
> fTPM TA due to secure storage requirements needs a tee-supplicant to
> be up and running for a successful kernel driver probe. So CI failure
> is expected as you see in the other thread.
> 
> So it's a chicken and egg situation for your rootfs encryption
> use-case. I suppose once the RPMB subsystem [1] makes its way into the
> mainline kernel then the dependency on tee-supplicant can be dropped.
> 
> [1] https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfirmware.org/thread/6A62HMDQST2O3T2UGGN6UPXZKLKLUNM4/

Yes, optee and kernel RPMB support without tee-supplicant in userspace are
the reason why I'm testing changes like this. I actually have both the
optee and kernel changes applied in the setup I'm testing and am trying to
upstream some of the changes. It can be that this fTPM enumeration change
doesn't work without the optee and kernel RPMB changes. For testing
purposes the tf-a change is very nice to have so that qemu boot with
and without swtpm can be tested. I'll look into details of this fTPM enumeration
related error.

Cheers,

-Mikko

