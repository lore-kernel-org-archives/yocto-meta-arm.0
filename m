Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.5069.1592518353762286342
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 15:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=yK5RDiQv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id b27so7199019qka.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2020 15:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xkOA4bZLbeVqsFfQstNq9hG0Qo6jupXLuT4LbAwqRzw=;
        b=yK5RDiQvDSDuTcQkdVsTXXd3PZCiamzUtgp2vh8c3Svq1WZx2ILng0RKGN6fTECMpM
         evgeiMa7Bq2vYhEevYEznTQnYcVYvDxxb3ehw010KqVx5vj0MimTnjoyOr1NRpZVFYPk
         MadXphikaGBP3SVsRkZr8K3JhTIm6VHMwK+7N+WvfD80ctg2pixX2ZCDVSUU+4Kg7QP1
         LiXDgbvspguTjneFLFBlD00xfjJCqEU3FeatVAcyM6izvj5AJortghIdduAGikWe9Bi9
         U6eBzMcUzC7wmUhvL1KXNEpgvp9qLo/VhNc+klZj6r5+xzqU5KDzYcCIf8Vvp9PzNalw
         IAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xkOA4bZLbeVqsFfQstNq9hG0Qo6jupXLuT4LbAwqRzw=;
        b=oqn6nyYNFPsQMuZxNHs1r8LrOium4NzV5Fucmwm7Y51Ck7R66Y9NmBBNuo2jqwA9fa
         Iwr09et6mSltcOFmm6zEgymCIfYcvibhAQQq8CoJJ0S2TrNL5S8pcuLPsIBfYAEK7g0L
         UzhxKgyq8EsP9SxTcCVIRzX1uM1HN/KMSn4+hzn/CM7Td4Xv32KyhpPaxksoZyl3niRi
         8jz1kX/vdCbzObCMDbMz3CXF43dnZ1Dop4/zHnuB47tqRCEnJhIhro0jugdKxgdRNdLI
         KbxLX9qVnoP3XPlUJ4BK5SJi9vACpaU8KeO4HZ7pnJyNeDnJRSqFCoWnqpEc9uxJins7
         qM+A==
X-Gm-Message-State: AOAM530eIs65ozC/hNLf7/Dmdv4Hvl5Hv/NHoS+Vajinetv0tNaa8kg8
	h8y3uO7zajlP3sH5zJDfD42j3w==
X-Google-Smtp-Source: ABdhPJzq7jNJm0i8Y8dkYYQJ2oAcViONu1YqhiDtyntplbkSiDwK2dzlTncV9/UpmsYIraAu6ro9ew==
X-Received: by 2002:a37:9342:: with SMTP id v63mr538157qkd.221.1592518352890;
        Thu, 18 Jun 2020 15:12:32 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:f04f:fa6f:35e8:ae6f])
        by smtp.gmail.com with ESMTPSA id 19sm1495917qke.44.2020.06.18.15.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 15:12:32 -0700 (PDT)
Date: Thu, 18 Jun 2020 18:12:30 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: Khasim Mohammed <khasim.mohammed@arm.com>,
	meta-arm@lists.yoctoproject.org, nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH v2] arm-bsp/edk2-firmware: fix destsuffix and PV for recursion error
Message-ID: <20200618221229.GA22389@kudzu.us>
References: <20200617081702.18172-1-khasim.mohammed@arm.com>
 <CAAnfSTsPRZdrhxib7LBy0ZmeQnUPUgdVPK7MvAoJ4hS7t=vH5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTsPRZdrhxib7LBy0ZmeQnUPUgdVPK7MvAoJ4hS7t=vH5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 02:11:04PM +0100, Ross Burton wrote:
> +1.
> 
> Ross

You should probably add your "Reviewed-by" in the future. If you are
going to do the work, you should get some credit.  :)

Pulled in to master.

Thanks,
Jon

> 
> On Wed, 17 Jun 2020 at 09:17, Khasim Mohammed <khasim.mohammed@arm.com> wrote:
> >
> > Use relative paths in destsuffix as the paths are relative
> > to ${WORKDIR} and turn the existing PV ?= into PV =
> >
> > Change-Id: Ib9367a15dde611e5b74c11eeff330d0b5a3de75d
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > index c8fc70a..832b226 100644
> > --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > @@ -1,6 +1,6 @@
> >  SRC_URI = "\
> > -    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1 \
> > -    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1 \
> > +    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=git/edk2;nobranch=1 \
> > +    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=git/edk2/edk2-platforms;nobranch=1 \
> >  "
> >
> >  # TAGS and commit ID as per N1SDP-2020.03.26 release
> > @@ -16,4 +16,4 @@ EDK2_ARCH          = "AARCH64"
> >
> >  COMPATIBLE_MACHINE = "n1sdp"
> >
> > -PV ?= "201908+git${SRCPV}"
> > +PV = "201908+git${SRCPV}"
> > --
> > 2.17.1
> >
> > 

> 

