Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.346.1591892906719017005
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 09:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=UcV8UlDg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id g62so5004033qtd.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 09:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cQ4mC8EGUIgUVRP6h4HI0ECXJ+If1pu4wP7hzOIbbfo=;
        b=UcV8UlDg2LuD7NBt90196y4qNJn0yRg8j+3kBrsJpndiikC8nOeVuzbHPOZjaWCFjO
         TJk+EylTQL1nNESiqTtoTlP58p9yPSj4nOdbfQzzNwQztXwLiM07FQl+UHQYPwOYSiee
         647n8HuGoq0wFWh7FYBtD80dRF6lKeqQqd8tRotnZG6XVXlObm1mvf5NV8uUe0XjadwE
         Z1WhFDw6I+tZxLaFCAsZrl7KsFwAMYvrOKFR38I+9BcREgC77IDP3qnrPqAz34gPORgz
         OOW4kNN46RpzyQpd+NfsKpqBxd++kP4MOBnX+RzwSE3mj+G/T6ZMcyLQX3oGoMwmaKEZ
         +RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cQ4mC8EGUIgUVRP6h4HI0ECXJ+If1pu4wP7hzOIbbfo=;
        b=pg5mXiaOA3hpc2sFVmc0YgFkOfl07Znh7YPLVGFR2XWyXzyQJ0V3r83EOk571Y3i1X
         VaKfZmX+GAKWfZnz8oaku/mPogQnicHXFkqwfih1rKG8yFd2IbLWb0CxA6u/SR2maOtS
         SxEgbrkKU0YTESH+z+2VTlrO9SEi7Jwec/VrgTJiOfSHOggFytFUuZwF2RgxrVcOEsNO
         dFVorxsIZFCJ3pkEyS1RWCGJf6LLz+avVreR4YvKGiciQGjfjbDRnNN8KBcB/SRR0F8q
         hxV2I/2SYDnP8Blx2znG22oegTRcasSwVrTs5B3d/YFw4KB2C9RlNewtZtORGVcx+fce
         myXA==
X-Gm-Message-State: AOAM533+jmm0l5pQXzlPjzdnItoDwQUnmaSBWFn7VTGxzHGKNWwmQDoB
	+Qex99umSBOiOI6bn77FOmIQHA==
X-Google-Smtp-Source: ABdhPJySF7+kk7MANKB4eIbNcJ7iA+PqwH0VRFXqFZ1brgSDtoDTpqMmy4rA2kxVwM/i6FtIvc+5KA==
X-Received: by 2002:ac8:7683:: with SMTP id g3mr9375635qtr.240.1591892905425;
        Thu, 11 Jun 2020 09:28:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e01b:52c7:6d78:8385])
        by smtp.gmail.com with ESMTPSA id 130sm2443276qko.113.2020.06.11.09.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 09:28:25 -0700 (PDT)
Date: Thu, 11 Jun 2020 12:28:23 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp, gem5-arm64: Update to v20 version
Message-ID: <20200611162822.GB20403@kudzu.us>
References: <20200611140214.GA17598@kudzu.us>
 <26867.1591885151713883678@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <26867.1591885151713883678@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 07:19:11AM -0700, Diego Sueiro wrote:
> On Thu, Jun 11, 2020 at 03:02 PM, Jon Mason wrote:
> 
> >
> > On Thu, Jun 11, 2020 at 07:56:08AM +0000, Bertrand Marquis wrote:
> > > 
> > > 
> > > > On 11 Jun 2020, at 08:52, Diego Sueiro via lists.yoctoproject.org
> > <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > > > 
> > > > This patch updates gem5-aarch64-bootloader and gem5-aarch64-native to
> > > > the release tag v20.0.0.1.
> > > > 
> > > > Also apply populate the right compiler and linker flags to get
> > > > gem5-aarch64-native properly building
> > > > 
> > > > Change-Id: Icc2203163105373cf030975c1b12f1d4f2fcb03c
> > > > Issue-Id: SCM-1014
> > > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Applied to the master branch
> 
> Can you please apply to dunfell as well?

Done

> 

