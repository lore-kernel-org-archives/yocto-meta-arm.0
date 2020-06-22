Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.17726.1592833226827380082
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 06:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=oBKFtySb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id o38so3929692qtf.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Jun 2020 06:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M83uMjaSfiDfqlVYXW+z30gxMugmPKSKEbA0SfJRueo=;
        b=oBKFtySb23sxosHdtz66ClgVdyWPAnJVvnGhjEaRmZDeQxrIq6F7TczJyuJfKHlJMw
         SVefdJxPz7abkEmQTTtmLLVytB/EaPEqLsIW4m0l6E221ykxsuatJk3a2ewq9SskeSjv
         KgE5VxSY3Dl/1gi3PzsEjFrBl8zWN2YiAqdWVY5GhiO01nuO5ODhwO2QgLDqnQe3cS84
         97Km4/0BdEtbHEPL0PDQp6M4+I5dtwmCpCpTKg5QP4iCWFcD2LPdv5Rs/MfQ9y8iI4b7
         G1GRy2Vhv7w3IIMStogqI7dg2fqMausI/HKMQP6MVHabpSPLH5k9ni7DJ3edv8VO1CpM
         fKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M83uMjaSfiDfqlVYXW+z30gxMugmPKSKEbA0SfJRueo=;
        b=MWcvzjB6P8VcW5NzecS1/AInx8IyyQEzzPKidmMGK0KF9FVjmwIeJXqSq0yLxoC/+0
         7/EvjuLO8YDnpbGRHVRxehUTRCQms8imQFyi0WR0RHp1fDwSldCfKJiQf04wXn/iwGqr
         wtgi0UVUdKMoDO7R2pferCMYQLv9gB8Yam9ZtljpoQfVoCKpNuORGgo6RDEtnfUumeDm
         FNfMloq7thPDytpaTVqiJRdkhPIzMPkcixkecibjFkPCkuurXZlLVHBQcTEidsCklWLR
         BTt7t/W4qnCYrBGnl9FOO3dAQu8YL7GHIEjqK7e8HdZrdnob2n7R8Jm6xp32AqbN2uNW
         KzAQ==
X-Gm-Message-State: AOAM532oCJS24+ody08eXZfTtN51TnDPIaaZ8Cn1XX9TlnmmGTIRSoTK
	HtDHXuTP3fkvp8q3Z0qBnxdKt2MOrVDPcQ==
X-Google-Smtp-Source: ABdhPJxkw0bxEfyydyEA/m2u3RATAdPLRTpWnox7kAftg+sw6IguNBuIKGvoYXm7UAYGB9lP+aPf2g==
X-Received: by 2002:ac8:4507:: with SMTP id q7mr14956129qtn.142.1592833225839;
        Mon, 22 Jun 2020 06:40:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:88f7:4508:bede:db4e])
        by smtp.gmail.com with ESMTPSA id v45sm1590704qtv.47.2020.06.22.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 06:40:25 -0700 (PDT)
Date: Mon, 22 Jun 2020 09:40:23 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy, xenguest: Fail if Dom0 is not properly initialized
Message-ID: <20200622134022.GA14044@kudzu.us>
References: <20200618221917.GC22389@kudzu.us>
 <13446.1592543433908130464@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <13446.1592543433908130464@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2020 at 10:10:33PM -0700, Diego Sueiro wrote:
> On Thu, Jun 18, 2020 at 11:19 PM, Jon Mason wrote:
> 
> >
> > On Wed, Jun 17, 2020 at 07:02:23AM +0100, Diego Sueiro wrote:
> > > During the xenguest initialization and when invoking the
> > > xenguest-manager tool, abort the execution if Dom0 was not properly
> > > initialized on top of Xen and with the proper kernel configurations.
> > > 
> > > Change-Id: I307c03e58a266a943968df1bc5ba39951912d2cb
> > > Issue-Id: SCM-996
> > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > 
> > Series pulled in to the master branch.
> 
> Thanks. Can you please backport it to dunfell?

Done

> 
> > 
> > Thanks,
> > Jon
> > 
> > > ---
> > >  .../recipes-extended/xenguest/files/xenguest-init      |  3 +++
> > >  .../recipes-extended/xenguest/files/xenguest-manager   | 18
> > ++++++++++++++++++
> > >  2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> > b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> > > index 9563d2f..cd249cf 100755
> > > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> > > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> > > @@ -12,6 +12,9 @@ fi
> > >
> > >  source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
> > >
> > > +# Make sure we properly initialized the Dom0
> > > +/usr/bin/xenguest-manager check-xen || exit $?
> > > +
> > >  # Create guest list
> > >  guestlist=$(/usr/bin/xenguest-manager list)
> > >
> > > diff --git
> > a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > > index 99975a2..6a10d35 100755
> > > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > > @@ -566,6 +566,24 @@ case ${cmd} in
> > >          usage
> > >          exit 0
> > >          ;;
> > > +
> > > +esac
> > > +
> > > +# Check if we have a valid Dom0 booted with Xen
> > > +ERROR_MSG=$(xl info 2>&1)
> > > +if [ $? -ne 0 ]; then
> > > +    echo "ERROR: Xen environment is not valid!!!" | tee -a ${LOGFILE}
> > > +    echo "ERROR: Check if Xen has booted and the kernel configuration." \
> > > +        | tee -a ${LOGFILE}
> > > +    echo "ERROR: Output from 'xl info' command:" | tee -a ${LOGFILE}
> > > +    echo "$ERROR_MSG" | tee -a ${LOGFILE}
> > > +    exit 1
> > > +fi
> > > +
> > > +case ${cmd} in
> > > +    check-xen)
> > > +        exit 0
> > > +        ;;
> > >      create)
> > >          guestfile="${arg1}"
> > >          guestname="${arg2}"
> > > -- 
> > > 2.7.4
> > > 
> > 
> > > 
> > 
> >

> 

