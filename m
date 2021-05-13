Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.14635.1620917914393804780
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 May 2021 07:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TlSwUF2c;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id 1so19960788qtb.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 13 May 2021 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bvU4I6/2XJbjfweJy6xkRTYiN2w//ZNLL6059fwxHLI=;
        b=TlSwUF2c+iAL/iNWbr7/NNaVIUYVCyQNp1RhadTXLiIHvyAXq8yO55+cwwDgZ/+KCC
         U9opf0TjZfthgFT7AybQ6cYZyqBQlcOrxDWQoq7c+QJPwoUXoaMqCPfExFPM0+2y6AtP
         xKgUUtgb3Rl0ionxGf44Elj6gbeBZXYceRkfj/iOKpy6ZwmcK8hvybDipwK91Nt+zNal
         lDAEY91wkUqNKZ2DO+VuNCtnIx0cATGOGlSljkPmO4HnRd/c2Pqwko5MAzgZAEFhwh4S
         fMt0TQvn/4PDtYqVBrxT5+e9XTH6sKBMuftjzn1waMUAvpCzo00ugc3Vox1WFtXwU2mM
         kQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bvU4I6/2XJbjfweJy6xkRTYiN2w//ZNLL6059fwxHLI=;
        b=H+QRXIsA+dp7EN/Ey3u6LPRDTOv8GWVebXFPxYV0H+X2uCcpHg/u+9c4yffv6YRRBH
         XPgIYGFXaksZWhAUmr6cEEgNqjwpgRZePMKHqVfTdPgISuWuXdnjFtIRTGxRYAOUAtJN
         orddhWYh6yAzx0KpRdCJ/UWT0tNcBmhstR1EvZwFfUmzfpZesK2CUrUAyb9rKZl8meQ/
         fPXWY+eUizEoy9gRdWmpxxKuv0cyzFhnl6W48CPcJfJnc/y2B4QKYh2qwAUrnIX1tDuB
         +LBpIv799Lt7V6A+WGojGZJFbgwrt3lrvUOuKIudRaEIAk31Q+msDVSIEpHNE8uEzlvT
         e/pg==
X-Gm-Message-State: AOAM533+doK9uQppfAZ/HO6ZvJ4XD5O4nKnQuPBzGVjsBFMHSXN6Kbgu
	yi24dgv1f1xuAXgHZNv5nJqt2w==
X-Google-Smtp-Source: ABdhPJzlJ+qe5FmKu7x42XfvWT+LfIysnKXdFScMeti04DV99wCztK2uS5PVcJZH/8JBfRQmvVzrlg==
X-Received: by 2002:ac8:72ce:: with SMTP id o14mr39109677qtp.198.1620917913585;
        Thu, 13 May 2021 07:58:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:e8bd:c11d:5f1b:a555])
        by smtp.gmail.com with ESMTPSA id f66sm2500570qke.42.2021.05.13.07.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 07:58:33 -0700 (PDT)
Date: Thu, 13 May 2021 10:58:31 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: inhibit build dependencies
Message-ID: <20210513145831.GA11769@kudzu.us>
References: <20210510181635.3252727-1-ross.burton@arm.com>
 <CAFA6WYOd_hGzeP+CAvqb5Oih8aG1k4uLAeZTu8KC6OSUvXGy5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYOd_hGzeP+CAvqb5Oih8aG1k4uLAeZTu8KC6OSUvXGy5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 10:05:58AM +0530, Sumit Garg wrote:
> On Mon, 10 May 2021 at 23:46, Ross Burton <ross@burtonini.com> wrote:
> >
> > These recipes don't build anything, so there's no need to depend on a
> > toolchain.
> >
> > Change-Id: I49b641fb54839c30255a11a7c9d5798c8e4afd2a
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> 
> For the series:
> 
> Acked-by: Sumit Garg <sumit.garg@linaro.org>

Apologies, I was too quick with the trigger and pulled these in before
you acked.  In my defense, it did pass our internal build CI, and my
WIP testing. We're still working on a way to have it public, but here
is a preview of just the building:
https://gitlab.com/jonmason00/meta-arm/-/pipelines/298844578

You can see from the names that we are getting some coverage for
clang, Arm Binary toolchains, Arm GCC sources, and musl (for good
measure).  Not enough computing power currently for every possible
permutation, but if you can see any obvious coverage gaps, let me/us
know.

Thanks,
Jon

> 
> -Sumit
> 
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > index 2fbabfb..046ab62 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > @@ -1,3 +1,5 @@
> > +INHIBIT_DEFAULT_DEPS = "1"
> > +
> >  FILES_${PN} = "${datadir} ${bindir}"
> >
> >  BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
> > --
> > 2.25.1
> >
> >
> > 
> >

> 
> 
> 

