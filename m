Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7049DC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 20:50:22 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.1466.1653339015975679426
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 13:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ayUb7AIL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id cv1so769219qvb.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 13:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=imGAe5tAvhNcd+nV/rGkBIlFlQ/G1vr5AAN6QykpDjo=;
        b=ayUb7AILmVtm+eYn7dWZ6q5Oz3kjeWTvunCuYViXV1O9OAPH7kAzfr0VHP/3lWFYcE
         g8+fBSI+xSaKxPgPV19uI7NNvLjRbZMtrul86vvizZvTUfQxdTsQyZnKFnX9nQKzZ46/
         teOWDy9+fYegE0r7v8ShbAQplqlm0kSSbBOv65s7r8RM8nKAhh7I4Mxfpg+HxxIHbLbe
         Iq8H10zrgBg2j2xnE4Jiy7q/FFiqauIVKgCRVlKO+bSUuonvm+tbbfBFBAqUuuL/bCM2
         u6EdJapgw/FK7/57fc8iccv/98Yyzl8uf2vOxlcDA3mIEvvBOiZP8nakCk/8jHo5dmR6
         NM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=imGAe5tAvhNcd+nV/rGkBIlFlQ/G1vr5AAN6QykpDjo=;
        b=vJCN8sOMnz0tnTDIYnwTXTJDjWO4v1saxGYS2LSyHkYU/9vI9rOGF6SwNzh0aWhTVX
         nZXhpHLerXV9lcg07ItxMwUYnup+/+U9iWOAp/Y3pH022u2bOv2Y5z0Xn/igEtdnmkx/
         l/8zzx0xEoMZJXmMedyzXVLieBagbhrBGgAqJit1psM8mC5auZ/Qe7nCJJkpHHjwLot1
         6n0uUOm80FUa0//DUrOdwnlIiuIgbEMIwxqQb/zOTO+bZuo3FemLYr8np3IkUMZwGrXh
         HW1r/7fsuD3aoi4M0YeBfoQudfLgWSQqb7ba1ZEhRj7EInHjL0bHTWVNYj+0DqdCnQWi
         9Tgg==
X-Gm-Message-State: AOAM532BzLw38AQYHdW3SPnuEZFnKo0JA93CGoVZuXR7bRil0Tv4B0tv
	WDbvxquZ3LIOfu2DjCkjMpEgKg==
X-Google-Smtp-Source: 
 ABdhPJyZClUtFSVeiKNy78roHuAN0CAfaS33upG9nVP9mf05z7YeqJ75oDckFZb3yNbIdE1SSHOwIg==
X-Received: by 2002:a05:6214:234b:b0:461:f43b:cede with SMTP id
 hu11-20020a056214234b00b00461f43bcedemr18919027qvb.3.1653339015091;
        Mon, 23 May 2022 13:50:15 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c19-20020a05620a165300b0069fc13ce1e5sm4827035qko.22.2022.05.23.13.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 13:50:14 -0700 (PDT)
Date: Mon, 23 May 2022 16:50:13 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	meta-arm@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-arm] [PATCH] CI: make qemuarm-secureboot builds more
 thorough
Message-ID: <YovzhYdWAsgzBJgK@kudzu.us>
References: <20220511152401.10735-1-jon.mason@arm.com>
 <CAFA6WYP6M5iFaTsUtWYKS7jO08TzGWVr6+0x4fLhS5QnnQrLGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYP6M5iFaTsUtWYKS7jO08TzGWVr6+0x4fLhS5QnnQrLGw@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 20:50:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3462

On Thu, May 12, 2022 at 12:50:20PM +0530, Sumit Garg wrote:
> + Abdellatif (author of optee-spdevkit recipe), Khem
> 
> Hi Jon,
> 
> On Wed, 11 May 2022 at 20:54, Jon Mason <jon.mason@arm.com> wrote:
> >
> > Build all the things that qemuarm64-secureboot builds, removing those
> > that fail to compile (e.g., optee-spdevkit).
> 
> optee-spdevkit recipe seems to be based on non-upstream OP-TEE tree:
> 
> # spdevkit isn't yet merged to master
> SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
> SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
> PV = "3.10+git${SRCPV}"

Yes, we've recently discovered this too.  We'll start appling pressure
to get this rebased to the latest version of OPTEE, get it working on
arm32, and get it merged upstream.

Thanks,
Jon

> 
> Abdellatif,
> 
> Are you aware of any plans to support FFA based secure partitions on 32-bit Arm?
> 
> >  Unfortunately, clang
> > doesn't work at all.
> >
> 
> This looks related to regression reported by Khem here [1].
> 
> [1] https://lists.yoctoproject.org/g/meta-arm/topic/91003714#3373
> -Sumit
> 
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .gitlab-ci.yml            | 3 ++-
> >  ci/qemuarm-secureboot.yml | 6 ++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 40e00fc0..bc9f0801 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -191,7 +191,8 @@ qemuarm-secureboot:
> >    extends: .build
> >    parallel:
> >      matrix:
> > -      - TESTING: testimage
> > +      - TCLIBC: [glibc, musl]
> > +        TESTING: testimage
> >
> >  qemuarm:
> >    extends: .build
> > diff --git a/ci/qemuarm-secureboot.yml b/ci/qemuarm-secureboot.yml
> > index 2fa8ef08..044661cd 100644
> > --- a/ci/qemuarm-secureboot.yml
> > +++ b/ci/qemuarm-secureboot.yml
> > @@ -4,3 +4,9 @@ header:
> >      - ci/base.yml
> >
> >  machine: qemuarm-secureboot
> > +
> > +target:
> > +  - core-image-base
> > +  - optee-examples
> > +  - optee-test
> > +  - optee-os-tadevkit
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3384): https://lists.yoctoproject.org/g/meta-arm/message/3384
> > Mute This Topic: https://lists.yoctoproject.org/mt/91038263/1777089
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> 

