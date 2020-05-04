Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.14708.1588623154290828312
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 May 2020 13:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bpi+hbns;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: daniel.diaz@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id y4so11027656ljn.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 04 May 2020 13:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=MNul8BlsUBbyzeXseR2zMTVf5wtakAb544F1Gg1GGDI=;
        b=bpi+hbnszU1QRzdcObfOA8D1eMrU2NtX0A/BWFXUJcYND6PFirYD0d+ZAItWhWKwQW
         4/cPYJTaX7IOfKyGyxoRHjgosNVNlejs40tEBFeLN8ZajHWFL65d7kOYGxKOJNTw88Mx
         nKDv17XuLsQ0Rcn3weDiZadZ1bvgwdDKpVfi66x0574aKjlyBMlwIa9PDSoDCqJUcxTC
         TzBiapricUhxgow9sGACrUxjzRStIPsk0R5E2rxoOzRI1zwh80P90VVqvV2wlX/11CEk
         jHdhAkARic6LBPbzmC2iR9DeG/C7K9w7bVfXMc5NvJLgLSnxoQ1vvpnFmGtA1Rj4gCT5
         rBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=MNul8BlsUBbyzeXseR2zMTVf5wtakAb544F1Gg1GGDI=;
        b=VTJH9szcDMIRRoP8HxxH6FoS9B0CRGdTnsSw0cXfIppYL8YbDVTQ4YvTZobibqiweu
         w/ogOwebkWklIcCUKCtZpyffxOTJ0d7hhuxC0P4HUPg7P30f+wIma4y1wffnHfQePYAO
         fxT2GZeNqvSYNr8kHC/pS9cqWsOCYi79sJy9Hw+wV/pkGuMY2y5HGV0+m/Xj4U/XU3FZ
         9db7kt5TdOacx9v1OKN0WOpTNoR0tvmbnC8muik2kwNP2C2vvmZZVJjRfJozn22MiMbd
         c0RnfvzZENA4n6k9JkmsS6VkdT3W6wlsLMOiBgVN8iBdAZf+X6SId99f2OsjJMTpHupq
         11xA==
X-Gm-Message-State: AGi0PubduyUxexhI+ratmLera/kCQ4qvzomuthwpdKeLQhf/g/sFADAd
	dWlonRTqasODGej59/o5K2QR487O0lqICi77Cf7kZ/pcgYmS+g==
X-Google-Smtp-Source: APiQypJyFZDxEw/3Unn4NE+/7ZX1LCek0UIxJC6tD4b8pOfyYi9dMrbaEVh325zTq58C4FcqH502XSOx+2KuMT4Nhd4=
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr11330347ljc.86.1588623151924;
 Mon, 04 May 2020 13:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200425225727.GL11927@denix.org> <CAP71Wjy84MgZdC+j4WxysbH2wJuLrkBe1DNUFRxDAMwhknNtCQ@mail.gmail.com>
 <20200501132838.GA13726@kudzu.us>
In-Reply-To: <20200501132838.GA13726@kudzu.us>
From: "Daniel D?az" <daniel.diaz@linaro.org>
Date: Mon, 4 May 2020 15:12:19 -0500
Message-ID: <CAEUSe79UZYrKt2W23YYqLkCBZLL6dBFp+zr=pPmFWeBHVnXZoA@mail.gmail.com>
Subject: Re: [meta-arm] Couple questions about Dunfell
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, 1 May 2020 at 08:28, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Apr 29, 2020 at 11:31:57AM +0200, Nicolas Dechesne wrote:
> > hi,
> >
> > On Sun, Apr 26, 2020 at 12:57 AM Denys Dmytriyenko <denis@denix.org> wr=
ote:
> >
> > > Hi, Jon,
> > >
> > > I had couple questions:
> > >
> > > 1. What is the time frame for branching off Dunfell?
>
> TL;DR:  Mid-May
>
> We have a chicken-egg problem with the Gem5 support and Python2.
> We've been doing all of our testing (until recently) on zeus.  This is
> because we wanted to make sure any issues we encountered were ours and
> not an upstream issue.  For dunfell, the current Gem5 support has a
> requirement for meta-python2.  To add this to our internal git repos
> and test infrastructure would be painful.  However, the upcoming
> release for Gem5 removes such a dependency.  This release is scheduled
> for May 15th.  So, we can either go through a bunch of work that will
> be thrown away or wait a couple extra weeks.  We chose the latter.
>
> As a stop gap, we are using the beta version of the new Gem5 release
> to make sure everything is in working order and we should be able to
> cut a release very quickly once it is out.

Do you have a branch for that? We're currently using the master branch
(meta-arm and meta-arm-bsp) and there are a few issues that can be
ironed out:

1) There are dependencies expressed for Python2, without the layer
depending on meta-python2. Files:
meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
  meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
  meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
Needless to say, it would be even better if the layers could be used
without Python2.

2) There are bbappends for packages that do not exist:
  /poky/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
  /poky/meta-arm/meta-arm-bsp/recipes-kernel/linux/linux-yocto_4.19.bbappen=
d

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
