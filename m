Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.3405.1588780783285590687
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 08:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=lxBAo/JI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id x12so1770942qts.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KTUiznCQSphkjTvqx93w4KxzcVLc0SNlOO2Z+H26+7w=;
        b=lxBAo/JIo1/A939xigMOb9ac6gLvRHpq9bZAOl6K03t0K8uALstESjgeMuE+Qx/o8U
         B4OHM5whqRxozhHydvUvYxnHCjk3PzF+lTgzGHLinFFOjpeDU00AVNHIcbcs7uz0iU86
         /Aih5A4FEd0BA/xbsMpJu4NnsNYAheXcQVRwOeP5Ut36xPweT5bn5wSR9HTsQtRh5Kaa
         1XzToVCgpt1J970Y7+W7fEzEBnP5nLdASofufXKeR/UUjFXsPnR5igOixXCbs1oHi5Ku
         wY0WJp043wIUWPaODSArLU0jAtZwMe3NwGYRq2Mk0Amr86AtSoVsfC3FqPBkaB19+Wa7
         odnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KTUiznCQSphkjTvqx93w4KxzcVLc0SNlOO2Z+H26+7w=;
        b=OFaAsvYpkOmkigyqRCqCu/d2buaIL5YSZyGp5oupEurhx29GGvxGRt22P5iASeq0pT
         PJXTY0zARlg81lPmu2kXqa87kzEkir+Tyku10BhKRZIQV5ilM+1+OO4eP+vLyY9rS2OJ
         +OuhHz456qH5Axwg5xJqkJTkLmVee7GJnf0YpbWr+YoopcPVqfuOkAbXmdXsu/vliULn
         uIyBydhZQnDrDCtZEwW/gcFaStBbjUGhWex0FmCA0nSG2w3pJb2NJnT5QP4gAJ1Eu1DP
         pJVz7AvCn1BMTGNllSXc+EaWuu2nVija4K1zBGLfpvpZLXOGjU2pKlEu778ykEVmEenp
         OntQ==
X-Gm-Message-State: AGi0Pub8BEgjCsgCcPUUhLBA26WSoQFI8uULmjHUlUt0tpIGC+qm7UsO
	Pkykhp0mNUIbeyNmsc6rJOE20OtPMY5neg==
X-Google-Smtp-Source: APiQypLffIIzp5iFUXOzBuO7ywRvPqOX9YEFFFpejyCdLfLQulQ3dh5M96kPiKDpqRMvLbxqMTivQg==
X-Received: by 2002:ac8:35c7:: with SMTP id l7mr9073265qtb.156.1588780782244;
        Wed, 06 May 2020 08:59:42 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id a64sm2009969qkc.114.2020.05.06.08.59.41
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 08:59:41 -0700 (PDT)
Date: Wed, 6 May 2020 11:59:40 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee: Use softer assignment to "invalid" for COMPATIBLE_MACHINE
Message-ID: <20200506155939.GB22996@kudzu.us>
References: <1588252755-48172-1-git-send-email-diego.sueiro@arm.com>
 <4A699897-BCA5-46B2-B4C2-70913437C66A@arm.com>
MIME-Version: 1.0
In-Reply-To: <4A699897-BCA5-46B2-B4C2-70913437C66A@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 02:25:21PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 30 Apr 2020, at 14:19, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > To keep consistency with trusted-firmware-a recipe we should use
> > softer assignment to "invalid" for COMPATIBLE_MACHINE.
> > 
> > Change-Id: Ib05afcd62b6b2104188b90bad4d952eb055ae443
> > Issue-Id: SCM-888
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > meta-arm/recipes-security/optee/optee.inc | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> > index a12521d..b3e5271 100644
> > --- a/meta-arm/recipes-security/optee/optee.inc
> > +++ b/meta-arm/recipes-security/optee/optee.inc
> > @@ -1,2 +1,2 @@
> > -COMPATIBLE_MACHINE = "null"
> > -# Please add supported machines below
> > +COMPATIBLE_MACHINE ?= "invalid"
> > +# Please add supported machines below or set it in .bbappend or .conf
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

