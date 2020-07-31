Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.19148.1596204359698628636
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 07:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=cQk5o3J4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id 11so28880895qkn.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ecrol4GfvU4IS1LYY2ZXT+gqYGGKGNEbLkqBndykYuI=;
        b=cQk5o3J48MPbs07x5KT3UyXnLR05nR7Ox/cku3w34GzJOR8V7HWxPqLUi6evsE1Vvy
         ARCw3pD9exyoz+1D7Dj2vIVwjpIGOCbLUQNv5lVErBPYdnEVg4i+uSmgckx6YLvX+7av
         pBRTXEWs8rZdQKoOUWy2f0JfFfEtzNKkeVbrF/TOtqeejUU6PQCM4g0dNE4cKNUk34Nj
         qs3Ugy7MsPQ/RCbf5llwTTLKr4cHuU+aw1i99ig/bc7S/4oFsu18EZgHY47g9JqRjaq0
         Kd4IAtKyGzSg0Oila+hWwppfOEu/F6fT24wsJGIGC1mcBGgnIPFaHvFjRi+059m1baMP
         Jmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ecrol4GfvU4IS1LYY2ZXT+gqYGGKGNEbLkqBndykYuI=;
        b=MI74vKU4XliHW/8z6XOhWGq8QwGGbzyCLw9ObXqt1I6I8sTr0VegzqXjoxs8s1Scuv
         brHZFLDRMkx3Xo49BePuTYCHyKOVATZRMykGsfBzy1AFJfDvYMx2IDJWZZgeb5K50lIM
         wIt7aKeIA0PAc3OdI6UnPhqmtn+dAzPwAyABllemyFX3obUVTGo0mY5mkfGHT4jOvY1W
         78g0tDjzAVuNAbVRS35dkoGGdHnIZa5jymXnsOXyNkp5Q6MdWAtKbTWljW9obCrukWUt
         Vslb/ilo/k+LsexnUvJiDcUaFlJphuu5tiaZfX46eOc1P5ZcS4velw02GMrrFIUcCHWo
         BlgA==
X-Gm-Message-State: AOAM5303tA8SwdITvmS7SwamtrikqOKqPyduXiMUICxIv/u9WDJJGcGl
	jHF2hwqW6yiJ9GsZRyWDGJeIlnnGkN/eEg==
X-Google-Smtp-Source: ABdhPJxzDJVSM6OTLzKHqtlcRojtPPN7mfxPyNyAd603bnLWWgRBjDu++rdZva2bNzt7YgpZQfGuKA==
X-Received: by 2002:a37:8e42:: with SMTP id q63mr4163369qkd.16.1596204358760;
        Fri, 31 Jul 2020 07:05:58 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:ad65:cfb8:9c11:f25c])
        by smtp.gmail.com with ESMTPSA id p189sm7972852qkb.61.2020.07.31.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:05:58 -0700 (PDT)
Date: Fri, 31 Jul 2020 10:05:56 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-os: replace old pycrypto with pycryptodome - a drop-in replacement
Message-ID: <20200731140556.GA1853@kudzu.us>
References: <1589502694-24528-1-git-send-email-denis@denix.org>
 <6362.1589528670740992908@lists.yoctoproject.org>
 <20200519152013.GD22197@kudzu.us>
 <16247F3E9F1124DB.7156@lists.yoctoproject.org>
 <1625AFED0AD12072.11956@lists.yoctoproject.org>
 <20200729205454.GW17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200729205454.GW17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2020 at 04:54:54PM -0400, Denys Dmytriyenko wrote:
> On Mon, Jul 27, 2020 at 02:37:51PM -0400, Denys Dmytriyenko wrote:
> > On Thu, Jul 23, 2020 at 05:34:31PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, May 19, 2020 at 11:20:14AM -0400, Jon Mason wrote:
> > > > On Fri, May 15, 2020 at 12:44:30AM -0700, Diego Sueiro wrote:
> > > > > On Fri, May 15, 2020 at 01:31 AM, Denys Dmytriyenko wrote:
> > > > > 
> > > > > >
> > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > > 
> > > > > > While pycryptodome is a drop-in replacement for the old pycrypto module,
> > > > > > pycryptodomex uses a separate namespace to not confict with pycrypto.
> > > > > > Unfortunately, optee-os uses both namespaces, hence both variants of
> > > > > > pycryptodome and pycryptodomex are needed.
> > > > > > 
> > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > 
> > > > > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> > > > 
> > > > Pulled in to the master branch.
> > > 
> > > Can you please also backport this to dunfell - it is also needed to fully drop 
> > > dependency on meta-python in dunfell. Thanks!
> > > 
> > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=06b648821aa3fbbdf7c00724cf3c3cedbb4f0546
> > 
> > Ping.
> 
> Just wanted to check if there are any concerns with this backport. Thanks.
> 
> Denys

Terribly sorry in the delay.  This caused a discussion internally and
got lost in the shuffle.  I'll sanity check agin shortly, but there
was no issues on dunfell with the patch.  However in testing it, we
found that there are still python dependencies in master.  So, I think
we can apply to dunfell, but need to revert in master.  I'm currently
looking for alternatives to the revert in master.

Thanks,
Jon

> 
> 
> > > > > > ---
> > > > > >  meta-arm/recipes-security/optee/optee-os_git.bb | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > index dfff6d1..c9847b5 100644
> > > > > > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > @@ -10,7 +10,7 @@ PV = "3.8.0+git${SRCPV}"
> > > > > >  inherit deploy python3native
> > > > > >  require optee.inc
> > > > > >
> > > > > > -DEPENDS = "python3-pycrypto-native python3-pyelftools-native
> > > > > > python3-pycryptodomex-native"
> > > > > > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native
> > > > > > python3-pyelftools-native"
> > > > > >
> > > > > >  SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> > > > > >  SRC_URI = " \
> > > > > > -- 
> > > > > > 2.7.4
> > > > > > 
> > > > > >
> > > > 
> > > > > 
> > > > 
> > > 
> > > > 
> > > 
> > 
> > > 
> > 
> 
> > 
> 

> 

