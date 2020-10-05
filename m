Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.34701.1601903361842108984
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 06:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=pyYR1+Bd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id j22so9437710qtj.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 05 Oct 2020 06:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EsRdj3driNcqOqAwv3vpQdAygnVTm6lABenUJl2/CKA=;
        b=pyYR1+Bd3JrqlRoq/1/5GFbo0u9gp9mD0kenxBkNQgZl1rhCV3TvZ5yVY4k3yYr+JE
         2nfRe7TAGd6xJqPKAQpzP8dwLttPZsPNRdDNiVGcghPpKMpbJ43kgzjsCFrXbJdEYKOg
         PAHCMVypGnQzDsLzDaS+sOOMhqT4LhUtB++G4LZxJEAHh9S7FgdDhCnJmc41wCt0hobY
         Iz6sKW9Bxqom3/Te+i2T3xTy7hNvidoy0w/uy/WXmkJYCy1QKs3IpLk1H5yxo9godUNk
         s+QG1460oYX7fwXtaDI1iLrBxjQBeKf+kGvAq1kmVan7rU+T8/t//M4iwEwdpkCcv5oP
         dtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EsRdj3driNcqOqAwv3vpQdAygnVTm6lABenUJl2/CKA=;
        b=S2sGsX+gL10r3xnuQr8MLBAPdm/XplcPJQytIebRQdRQ6EMjbXbs5mpr0aaNjJ5rpn
         BTFrwhb+cUydTb5rC6Irvx3rLNF3JcO7QQsBvg9kf45xqRHfAHHOgWXGR97ypr6ha7uQ
         ErVEtGdZJQ2I/VZvPghnHpsn8gZFqJrgO6yB/6u/PX6JqSHM4emGz9LueU1qTAYHq/sv
         R50IwzFedf8SBjehogH3IeNFJJw+gYu8DvLOIyEDHM9OjO4iFYTVXojLphKUl8jdtNAm
         1k7sXTE7ZmOrZ0VPLwyHNa0fkTBX0KTGoWj9bIzxXY6QfqnNKD+tftOT9LpTFlCI63y5
         gf0Q==
X-Gm-Message-State: AOAM531n8eUyDEquULXWBpeDdHahMLqJFM+eEjRAnY4e8upYzYrsB3vt
	IpmYh8732TwqmWZcpovWoL8x3A==
X-Google-Smtp-Source: ABdhPJwXWDmgEy3N+/Lewnl0vEvk5BhShEZ5lmkpx60TsVTn5EhPbPeFer6D+St3sCmHjEp1zGoaCg==
X-Received: by 2002:ac8:2612:: with SMTP id u18mr15069823qtu.363.1601903360526;
        Mon, 05 Oct 2020 06:09:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id x43sm7783467qtx.40.2020.10.05.06.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:09:20 -0700 (PDT)
Date: Mon, 5 Oct 2020 09:09:15 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/7] arm-bsp: Remove references to meta-arm-platforms
Message-ID: <20201005130914.GA11922@kudzu.us>
References: <20201002140405.7896-1-jon.mason@arm.com>
 <CAAnfSTszczMU=Ac-2ZrPvzTA9EyUQk5n4NnLwNNwTMV=kWTspQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTszczMU=Ac-2ZrPvzTA9EyUQk5n4NnLwNNwTMV=kWTspQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 03, 2020 at 09:24:04AM +0100, Ross Burton wrote:
> +1 to the whole series.
> 
> Ross


Pulled in to master.

Thanks,
Jon

> 
> On Fri, 2 Oct 2020 at 15:49, Jon Mason <jon.mason@arm.com> wrote:
> >
> > meta-arm-platforms does not exist.  Change to meta-arm-bsp.
> >
> > Change-Id: Iacf74f2ec2d5cd2ddaa3a952e9190e71822bd9f5
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta-arm-bsp/documentation/a5ds.md             | 2 +-
> >  meta-arm-bsp/documentation/foundation-armv8.md | 2 +-
> >  meta-arm-bsp/documentation/fvp-base-arm32.md   | 2 +-
> >  meta-arm-bsp/documentation/fvp-base.md         | 2 +-
> >  meta-arm-bsp/documentation/juno.md             | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-arm-bsp/documentation/a5ds.md b/meta-arm-bsp/documentation/a5ds.md
> > index 9f88abc..38c719a 100644
> > --- a/meta-arm-bsp/documentation/a5ds.md
> > +++ b/meta-arm-bsp/documentation/a5ds.md
> > @@ -1,4 +1,4 @@
> > -# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-platforms
> > +# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-bsp
> >
> >  ## Howto Build and Run
> >
> > diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/documentation/foundation-armv8.md
> > index 7e73da5..dacdce3 100644
> > --- a/meta-arm-bsp/documentation/foundation-armv8.md
> > +++ b/meta-arm-bsp/documentation/foundation-armv8.md
> > @@ -1,4 +1,4 @@
> > -# Armv8-A Base Platform Support in meta-arm-platforms
> > +# Armv8-A Base Platform Support in meta-arm-bsp
> >
> >  ## Howto Build and Run
> >
> > diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/documentation/fvp-base-arm32.md
> > index 363e6b2..52ca1a4 100644
> > --- a/meta-arm-bsp/documentation/fvp-base-arm32.md
> > +++ b/meta-arm-bsp/documentation/fvp-base-arm32.md
> > @@ -1,4 +1,4 @@
> > -# Armv7-A Base Platform FVP Support in meta-arm-platforms
> > +# Armv7-A Base Platform FVP Support in meta-arm-bsp
> >
> >  ## How to build and run
> >
> > diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/documentation/fvp-base.md
> > index 58604e1..17c28c2 100644
> > --- a/meta-arm-bsp/documentation/fvp-base.md
> > +++ b/meta-arm-bsp/documentation/fvp-base.md
> > @@ -1,4 +1,4 @@
> > -# Armv8-A Base Platform FVP Support in meta-arm-platforms
> > +# Armv8-A Base Platform FVP Support in meta-arm-bsp
> >
> >  ## Howto Build and Run
> >
> > diff --git a/meta-arm-bsp/documentation/juno.md b/meta-arm-bsp/documentation/juno.md
> > index cc5a272..69e56bc 100644
> > --- a/meta-arm-bsp/documentation/juno.md
> > +++ b/meta-arm-bsp/documentation/juno.md
> > @@ -1,4 +1,4 @@
> > -# Juno Development Platform Support in meta-arm-platforms
> > +# Juno Development Platform Support in meta-arm-bsp
> >
> >  ## Howto Build and Run
> >
> > --
> > 2.17.1
> >
> >
> > 
> >

> 
> 
> 

