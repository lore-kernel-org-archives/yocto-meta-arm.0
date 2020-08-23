Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.182618.1598216079421892311
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 23 Aug 2020 13:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=U7zJnu/a;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id k18so4885871qtm.10
        for <meta-arm@lists.yoctoproject.org>; Sun, 23 Aug 2020 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i+gFJR7P+jbISmV4tuknMk4FRYO13eLU+/AJXRBlc4M=;
        b=U7zJnu/aT0dGzZ1AcC3/MRcACu4/O+v2NTghhIh+yRzeQeIXLER/JJV2mLUotCNGdA
         5UXymRdNGNoHhkLB/XTW4iU0/jIxoTUHdz5I50Ng8uiEASwvSolZ+xaJsFuxhnZI2/aU
         L0i9vyFbF7qgSC8J092opTnjFyrgA1F9/j19uR9NqbYHdWREJuBOhtuZa84obFQ0zeCN
         3AoyhJRn754pg5RKf6TjF8Z4WJF/VU5TV2yko91oHwo2DXFv8FxEthhJiTnIGXqtThiV
         C/+qh2bkZ4UlHjJBJTNqYUOcVs2AwBHrtgfXW2cIFwuPMOlg1DLOW2ZflRjbpFP7kDek
         g0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i+gFJR7P+jbISmV4tuknMk4FRYO13eLU+/AJXRBlc4M=;
        b=jYOiWOrNomIgMlsWIETqQ2mfmMfy2ICjJh8576qczHTGYhZerewZgUb42G5+0Is/sk
         WkPB3JMY/83pNn063N2bREAzA0bv3orVBoTDaVusg8DNE1ZAhINmEhjwKSc1PPRvMIxd
         vz+2hkUdwzPRu7sAmK0XFghaHRAsPrEFolZ5eC2B4v7xAQTnYuRuu3Xc7EJr8IPIkYH4
         55RZk3336lDtbudA53iBFm3A68Cl9dMsCjcNClHjT6NfAIpLV+WlcvqPVo6d7JwYKTm2
         +yuqYVzkuCvA1CK8jkrv7han7+u9qtfiR2B8MT61Wxu5ViPl7DAdaaLHeHD35ngBvAuD
         aBbw==
X-Gm-Message-State: AOAM531i9d3YRnA+5CIisZ+8L8Dq8xh2qz8JIfShQ3/phX6ipZRcghNX
	f5JR1TePtjj2lNUY4pne+V6UqNTiNGUNBn3r
X-Google-Smtp-Source: ABdhPJyKFGaDgeOQlhBWsRHZB9aK99AE4KmfnhclphnMZ8suwCCUy5d5FUOaDhEZY2NCLR4gwV65yQ==
X-Received: by 2002:ac8:3f93:: with SMTP id d19mr2279206qtk.163.1598216078539;
        Sun, 23 Aug 2020 13:54:38 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id c9sm7789543qkm.44.2020.08.23.13.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:54:38 -0700 (PDT)
Date: Sun, 23 Aug 2020 16:54:35 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Khasim Mohammed <khasim.mohammed@arm.com>,
	meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2 1/3] arm/trusted-firmware-a: fix variable name typo
Message-ID: <20200823205434.GA25261@kudzu.us>
References: <20200821160927.10598-1-khasim.mohammed@arm.com>
 <20200822002818.GN17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200822002818.GN17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2020 at 08:28:18PM -0400, Denys Dmytriyenko wrote:
> On Fri, Aug 21, 2020 at 09:39:25PM +0530, Khasim Mohammed wrote:
> > Variable name "processes" is wrongly mentioned as "processed", this patch
> > fixes the same.
> 
> Heh, I believe it was meant to be called "processed", i.e. when at least one 
> of the checks matches and gets processed, the final condition is not met. So, 
> it results in an error only when none of them gets processed.
> 
> But looks like I copied and pasted the version with the typo all over the 
> place, while using the correct name in the final "if" statement:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc?id=01825739a4a49d857f7b1a839374da4381b92c2e
> 
> Sorry about that. Using the correct name would require fixing it in 4 places 
> instead of one. So not sure if it's worth it...

Yeah, I was of the same opinion.  It should be "processed", but don't
feel live a v3 of this patch is needed for just that.  I'll do a
follow-on patcch to clean it up :)

Thanks,
Jon

> 
> 
> > Change-Id: Id9362f514861c75f8f6a727582e11b0e65736349
> > Issue-Id: PLATFORMS-3971
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> > ---
> >  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 4362882..e4847b5 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -171,7 +171,7 @@ do_install() {
> >              echo "dtbs install, skipped"
> >          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
> >              echo "Tools $atfbin install, skipped"
> > -        elif [ "$processed" = "0" ]; then
> > +        elif [ "$processes" = "0" ]; then
> >              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
> >              exit 1
> >          fi
> > -- 
> > 2.17.1
> > 
> 
> > 
> 

> 

