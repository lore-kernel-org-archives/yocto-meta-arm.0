Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.645.1610117236486319178
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Jan 2021 06:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RIUzn9b2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.43, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f43.google.com with SMTP id w18so10027494iot.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 Jan 2021 06:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oBH+9NYvFMp6lQG00tV4tMxAwg9wjG2lr+rZ51Di2ts=;
        b=RIUzn9b20iqqc42zjMq4CxHgk4mMg95dyi0/r5usKkZp2EqlbZHPGctCfo9K67g0fo
         RklD/BLbTESLecPMpQFizitzoqY40exngpRo/Un5w5rfdNxWxlmpcBgINIE33UX1MQWQ
         cuVEppKrdDmhv++X8jZ+MB36sUpI9KLn+GWg+6oji+Xno5dyu9ehIiTyHWExOQxw/Uwd
         1tHMm32+S2FfwwJ9LvlzwbfSzjbmm2BIoJ6aB5vr2rm7XlMQo1c/ggBBLKuXXPE+3ToI
         O4A9/RfypMXUaNv8lRtvJx0awDbRqP6K9u1UXCgm6VxrLrVDUYLsD3qYug4jZoEYOics
         KdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oBH+9NYvFMp6lQG00tV4tMxAwg9wjG2lr+rZ51Di2ts=;
        b=ITlRprr1oy+DlylH06fmMJn5ZuFS6zm+Xs5B2UudYcb/mlRb1Q0dH9PoXTAs53E88u
         d72T11KcAVx4UXHAyF9fdAe5DXWx/AI7qjp1QXSO276DaYlSiXiy5V1SKkuSw+l9IX6H
         DPnA25+gRqCE8v5pgPJ7t3R8PtVZqIPv05B93NbvBGFAdKfP1tfmo1ibDLqfOUnCxLR/
         wCJE7YtRSFsfc2ua/PAZVxT9tDvqq4DG3xsMesYWk4QPUnyKRmq869FG1mqXMMBCcwIn
         rxzUy7byImuMpA+cGoeWyH5HxfXLkFx1WHrbBD4hKqHJSLXUM9dtqtOnXu0RuVl+XPv4
         uDgg==
X-Gm-Message-State: AOAM533iX7TMjZSB9x7cKoticcxU3KqUxAJHM5WYKig2/wDqN+h9k+GU
	HvAZ8Pv/r16ZdEdZ8sNhTR7rBg==
X-Google-Smtp-Source: ABdhPJzaYRx92JH/Kwd0Wq8R+XJlL6UUy1XAfmn4P4OBDZIuJ19Yci7CSCH86BmgQAy493tBu10DsA==
X-Received: by 2002:a02:ce2c:: with SMTP id v12mr3738326jar.60.1610117235930;
        Fri, 08 Jan 2021 06:47:15 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:10b9:360:420b:282e])
        by smtp.gmail.com with ESMTPSA id z18sm7167729ilb.26.2021.01.08.06.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 06:47:15 -0800 (PST)
Date: Fri, 8 Jan 2021 09:47:13 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] meta-arm-toolchain updates and removal of legacy versions
Message-ID: <20210108144713.GA29567@kudzu.us>
References: <20201209160139.GF12460@kudzu.us>
 <16507BD31EF07BD0.20968@lists.yoctoproject.org>
 <CAFA6WYMvv7bD-fE08VL5gGODCJJzVrMuj+Pu2T-uXZPPdEtBzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMvv7bD-fE08VL5gGODCJJzVrMuj+Pu2T-uXZPPdEtBzg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2021 at 07:26:24PM +0530, Sumit Garg wrote:
> Hi Jon,
> 
> On Mon, 14 Dec 2020 at 10:16, Sumit Garg via lists.yoctoproject.org
> <sumit.garg=linaro.org@lists.yoctoproject.org> wrote:
> > On Wed, 9 Dec 2020 at 21:31, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > Hey Sumit and Denys,
> > > We are in the process of updating recipes for the meta-arm hardknott
> > > release.  The intention of doing so early is to give everything
> > > sufficient time to soak and test (and downstream users time to complain
> > > if we break them).  To this end, I see that there are updated versions
> > > of the external toolchains, and I wanted to know:
> > >
> > > 1.  Is anyone currently working on updating the recipes to the very
> > > recently released version
> > > (https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)?
> > >
> >
> > There are two ways to use GNU-A Arm toolchain in OE:
> >
> > 1. As pre-built external toolchain
> >
> > -> Ideally the latest 10.2 release should work out-of-box without any
> > need for changes but requires testing.
> 
> Pre-built GCC 10.2 toolchain works pretty well after this minor fixup [1].
> 
> [1] https://lists.yoctoproject.org/g/meta-arm/message/1590
> 
> >
> > 2. As built from source
> >
> > -> This requires support to be added for 10.2 release. I would like
> > this support to be added but currently I am busy with some other high
> > priority work and I could try to schedule this work next month. In the
> > meantime, contributions are pretty much welcome and I would be happy
> > to review patches and provide feedback.
> 
> This [2] patch adds support for GCC 10.2 toolchain release built from source.
> 
> [2] https://lists.yoctoproject.org/g/meta-arm/message/1586
> 
> >
> > > 2.  Are there any plans to remove the versions that are no longer
> > > in-use/supported?
> > >
> >
> > I would be in favor of removing older toolchain version support from
> > master branch. As we should always try to use the same or closer major
> > version to the OE base toolchain and there's always a possibility of
> > breakage while using an older toolchain with the OE master.
> >
> > >
> > > Everyone else,
> > > Related to #2, what versions are people using that they would like us
> > > to keep (or add if not currently present in meta-arm-toolchain)?
> > >
> > > I don't want to break anyone or remove useful functionality, but I do
> > > have concerns that there could be uncorrected GCC CVEs present in
> > > older toolchains, and by continuing to make them available, we are
> > > enabling this exposure.
> > >
> >
> > Agree, let's wait till beginning next month. If we don't hear any
> > requirements for the older versions then I will go ahead and remove
> > them.
> 
> This [3] patch drops support for legacy 8.x toolchain.
> 
> [3] https://lists.yoctoproject.org/g/meta-arm/message/1587
> 
> -Sumit

Thanks for doing this Sumit

Thanks,
Jon

> 
> >
> > > Thanks,
> > > Jon
> >
> > 
> >
