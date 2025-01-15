Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9810DC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 09:02:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.16873.1736931753349092710
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 01:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gftGYqHV;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f22fd6832so6545899e87.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 01:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736931751; x=1737536551; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9cFalWKhNNu21ONFW1SjvQpFlpN1yCSdjFm6VWXWdIs=;
        b=gftGYqHVVZNXqspaUIbXe8pXJ2TF7FqeBy282cwBdpowZmySpJxbXKu/jtKOg9mFoS
         xAbmORO5AR8GS0JCqhKHgNBY5P/yH0IPHLIAru4jpr1PyFrYQQAPVSyMvKvOO/Uv4/fB
         nKKxQC4uzdjdp2LgS0pKRDi3ReLq0HkGxxgw+nJ25d2EJ6BTcPmrDevoqxH/TqFJFYjt
         yobF/ZCoFgo681jsDQLX8aaTnG6rl/Y/nocHda8BgCh/kgJBHkZIy8zm7E2JHrrPaoRS
         M8bw/yIA9m9xQGz4Ip8lLDUaKnsvABKwIzl/4htmKLybFvvXq92Zn6wQRQ1Amz4dd+88
         2pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931751; x=1737536551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cFalWKhNNu21ONFW1SjvQpFlpN1yCSdjFm6VWXWdIs=;
        b=bj6bVs6cId0jnYSHNh2P4e15eQ/rA4j8VoCSrkw3uNuN2J+O/71gAqiNhCNgM8wq2c
         BpVY6cobf6pfN2HIV8vx16DBpJw7U0Ay/CwVyKGdzAfVlcvU9Y370ZuEvdaigGJ58fTw
         8lY+j9bTFBV3Vsxx2HjNl6jz1UouWf0jbUQmNrOBQfFaHQ/2jcSTCZ/MY5Iklk6O4oVo
         E+Y3wVVz/9MsvKa9nQNBfCYS3HxmIBq4gISqqltnvtECiO84aGSU3SeqEqoAAQkDK+Zr
         7eXy503DVddt3l1/G62CLjFP1nKLne0gjJMv7ezEsMW+4wvAAetf1INu348En1fK3uqI
         lBjQ==
X-Gm-Message-State: AOJu0Yw2RY5W27c71nE52wYUOY2TGpn7MLhBxesMTHkFljqpStnqXnU8
	ZnGI5DWV/8Zde00sEC68tfxQ6FQ6YOG/0XYgM5+JroLtSj6Z6XfaShJUF2BjxJA=
X-Gm-Gg: ASbGncvbVQyeOD+I43NGZ07L+82XM0fo20wEqxXDVC3BsMRMxTEtdBXjMNuwWDz0TED
	VfAneIVX0FpIKrH5Up13xhlzfltGr3DIc7wGT3BXCeX6SuLLk3d08vepjFTQky+4aFUVDpro3tt
	A9Fhz7wCH+HHLVEw5TDT87qsvIeUVt64C64puKC+GxTrXnWAHPfuzk8fFnFNMMHaGOjBCogTaVI
	rTNEnqtgpnfhtw/DiUJF6T1q5bRYjx8QOGLJtKPDYMnNqLgTpRoNAvQCHmCD4fCpj1SfJlHuYer
	rsb8pg==
X-Google-Smtp-Source: AGHT+IGLZCvykYqiNT6OK/JtS4p3UQsP5jr6fyCfb6AQGSi9crbVw1S7fd7ZWuYxdWhTkwfSYJwNmw==
X-Received: by 2002:a05:6512:23a7:b0:542:6f78:2ace with SMTP id 2adb3069b0e04-5428481cd5amr9942761e87.47.1736931751174;
        Wed, 15 Jan 2025 01:02:31 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becb186sm1948961e87.242.2025.01.15.01.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:02:30 -0800 (PST)
Date: Wed, 15 Jan 2025 11:02:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: jdmason@kudzu.us
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] edk2-firmware: fix
 PlatformStandaloneMmRpmb.dsc build
Message-ID: <Z4d5pFLUhg7emCYx@nuoska>
References: <20250114094154.304900-1-mikko.rapeli@linaro.org>
 <Z4Zxr3b2FZ__mn8R@kudzu.us>
 <Z4Z3-bsTlysMbOiH@nuoska>
 <CAPoiz9xB6rP9mQxdsJUJrCoW7c8-J8bak_YjNL1kBSLvJ2EqEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPoiz9xB6rP9mQxdsJUJrCoW7c8-J8bak_YjNL1kBSLvJ2EqEQ@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 09:02:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6325

Hi,

On Tue, Jan 14, 2025 at 10:20:09AM -0500, Jon Mason via lists.yoctoproject.org wrote:
> On Tue, Jan 14, 2025 at 9:43 AM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > On Tue, Jan 14, 2025 at 09:16:15AM -0500, Jon Mason wrote:
> > > On Tue, Jan 14, 2025 at 11:41:54AM +0200, Mikko Rapeli wrote:
> > > > With backported patch from upstream. Error was:
> > > >
> > > > | build.py...
> > > > | /home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/edk2-platforms/Platform/StandaloneMm/PlatformS
> > > > tandaloneMmPkg/PlatformStandaloneMmRpmb.dsc(...): error 4000: Instance of library class [HobPrintLib] is not found
> > > > |       in [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core/StandaloneMmCor
> > > > e.inf] [AARCH64]
> > > > |       consumed by module [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core
> > > > /StandaloneMmCore.inf]
> > > >
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > >
> > > I'm seeing this patch fail to apply (as part of the edk2 build
> > > process) on every edk2 platform
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673217
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673227
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673281
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673312
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673331
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673346
> >
> > Oh, I did not see this. I will try to reproduce. Seems to be line ending
> > issue. edk2 sources use Windows ones. I hope mailing list patch doesn't change
> > something...
> 
> Talking to Ross, and he reminded me that email messes up edk2 patches
> (specifically).  Do you have a git tree with this patch that I can
> cherry-pick from?

Yes, git repo https://gitlab.com/mikko.rapeli/meta-arm.git and branch
edk2-firmware_rpmb_fix has commit 8a3cef62ad33fdc91f6be84331cae1171211feb5

Cheers,

-Mikko

