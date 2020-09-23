Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.3275.1600825069996388386
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 18:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fc6EDsfb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id t138so21348093qka.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 22 Sep 2020 18:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Sh/u8pB0NTcF5vXDc5/L4WfvnJ75+kHLYHQVGx2uibw=;
        b=fc6EDsfb8ZAoJMPChy4W6SaL4KN0aEepT2RXXtoOpQC85SlshzyLBBOHcm5DmlLium
         pAcstzyAlxrRF63Ji7fm4WYVDfxJjvE9xrFNmvP9mFFbjOVez8yV7ClybaGhbg1k1eNp
         aVpb6dJvfhNyF1h9ffMcFFolYp+/1pHUrJxOZ3pvf2p3iFpZCQAvOs0UY1I0s13u7Pmu
         IdwhF6h7Ltd7DymG1UH0V8jMu8l9gV9emVw9I4Peo0CwfOa1D1QQxb3Q+ZD+DYMOl0La
         Tl2y23bzgqePuNVbUKzER68JH2WzPHjX71E6cJbqCdPuTK+dVehfTLIyqPJCO4vzw9SF
         AzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sh/u8pB0NTcF5vXDc5/L4WfvnJ75+kHLYHQVGx2uibw=;
        b=JzpyozQU9r+rp5RbqCeqii/6ERLlYFXGPvvL6DUuWpvHk2VYIlz5/nhyQDMC0el/gQ
         D9Qu5ihgObWbJ6RHrZbokruEmcczpqHuZKRcZ2TztFau71YTmHtuxWFEOrfzT5XcdPS0
         STtT/ONjyk8x+vCU6Y0h3GNEfHFbuY9rEE3BWRLE6vptwrorvvhLBgZJGZpQZeolKyba
         BAtDOz7XH6nC8TEULyAZ5p50MrofAyJdzvFDYpo9aLB6sOT+3f5JOrv6/9Hq842lhGH+
         HAn+WByZyiQuq6oKqu/OzcC7wZgmBsng3hgH9h0FZgWRwAw/LE4Ee8A5ib6RWjOZuJLM
         Htsg==
X-Gm-Message-State: AOAM532u6F3xfAMR6AKPmw8r6BrJMkvp8oOyJXutitou/ajYbeMRVmy9
	inbBXahzyT23nZLPpAN06T4purcQNTrjqpam
X-Google-Smtp-Source: ABdhPJyHG2fIL2B8glnQHUt6C7M1WjzRc6Uw6ygDqZ5/10EwwWKtll0SIR0iAAtisPyg6zEHXh4tWQ==
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr2552050qko.474.1600825069107;
        Tue, 22 Sep 2020 18:37:49 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id c28sm9939887qtk.18.2020.09.22.18.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 18:37:48 -0700 (PDT)
Date: Tue, 22 Sep 2020 21:37:44 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy/documentation: Update arm-autonomy-quickstart.md with dependencies
Message-ID: <20200923013743.GB19045@kudzu.us>
References: <20200922084639.15621-1-Nathan.Dunne@arm.com>
 <26152.1600764798711534379@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <26152.1600764798711534379@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2020 at 01:53:18AM -0700, Diego Sueiro wrote:
> On Tue, Sep 22, 2020 at 09:47 AM, Nathan Dunne wrote:
> 
> >
> > Added dependencies on meta-kernel and meta-arm/meta-arm-toolchain layers
> > to quick start guide instructions.
> > 
> > Change-Id: I7d5a3c631ccdcc7a39b8003a958d5f68ecb606c7
> > Issue-Id: SCM-1298
> > Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> > ---
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to master.

Thanks,
Jon

> 
> >  .../documentation/arm-autonomy-quickstart.md        | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> > b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> > index 2a457c1..eb02b3a 100644
> > --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> > +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> > @@ -26,6 +26,7 @@ First you must download the Yocto layers needed:
> >   - [poky](https://git.yoctoproject.org/poky)
> >   - [meta-virtualization](https://git.yoctoproject.org/meta-virtualization)
> >   - [meta-arm](https://git.yoctoproject.org/meta-arm)
> > + - [meta-kernel](https://gitlab.com/openembedded/community/meta-kernel.git)
> >   - all other layers you might want to use
> >
> >  For each of the downloaded layer make sure you checkout the release of Yocto
> > @@ -56,8 +57,9 @@ Here are the main steps to create an arm-autonomy project:
> >    bitbake-layers add-layer $LAYERDIR_BASE/meta-poky
> > $LAYERDIR_BASE/meta-yocto-bsp \
> >     $LAYERDIR_BASE/meta-openembedded/meta-oe
> > $LAYERDIR_BASE/meta-openembedded/meta-python \
> >     $LAYERDIR_BASE/meta-openembedded/meta-filesystems
> > $LAYERDIR_BASE/meta-openembedded/meta-networking \
> > -   $LAYERDIR_BASE/meta-virtualization
> > $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
> > -   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bsp
> > +   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-kernel \
> > +   $LAYERDIR_BASE/meta-arm/meta-arm
> > $LAYERDIR_BASE/meta-arm/meta-arm-toolchain \
> > +   $LAYERDIR_BASE/meta-arm/meta-arm-bsp
> > $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
> >    ```
> >
> >    Example of a `conf/bblayers.conf`:
> > @@ -71,12 +73,17 @@ Here are the main steps to create an arm-autonomy project:
> >      /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
> >      /home/user/arm-autonomy/meta-openembedded/meta-networking \
> >      /home/user/arm-autonomy/meta-virtualization \
> > -    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
> > +    /home/user/arm-autonomy/meta-kernel \
> >      /home/user/arm-autonomy/meta-arm/meta-arm \
> > +    /home/user/arm-autonomy/meta-arm/meta-arm-toolchain \
> >      /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
> > +    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
> >      "
> >    ```
> >
> > +  Be aware that changing the order may break some dependencies if editing the
> > +  config file manually.
> > +
> >  Those steps will have to be done for each project you will have to create.
> >
> >  Host project
> > -- 
> > 2.17.1
> > 
> >

> 
> 
> 

