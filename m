Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.11656.1602936954277965506
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 17 Oct 2020 05:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=yvZQYQ1V;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.196, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f196.google.com with SMTP id l16so5549588ilt.13
        for <meta-arm@lists.yoctoproject.org>; Sat, 17 Oct 2020 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZezD6c6zk2El3uhIJNTriqb5WwWkfrSSwhOmf9cZp8I=;
        b=yvZQYQ1VNPfvyoNDfol0IDicpAx3rEvkHxnUkn+bUS8vwLuJLEaj6zme3A6arF9iyw
         RPZSAWS9OQ1NUt6+CgjJ2/DBRVkDscCZWUl4B5BBulNqEoZ1pq+MkSoJ0vJZytT3rR74
         5/Hzvv6/yrHNtbsO53pitw/b9l1wmq6hf0wFOYJAWvvOn78hisfi0flJdmXb1SKk9bJ5
         CBajZ1k018J/Jol81IWEkbASM+nyKQrDOH7pUnjYydz1Z6ltCRgy/wcJa/bRP80i74sp
         WPPFEeknfiQjU4IK8hQ+HnoytsDSZfXaEYypcfk1MdoLOYcCAtMpWGcMS9Umaa5sQ/uB
         vqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZezD6c6zk2El3uhIJNTriqb5WwWkfrSSwhOmf9cZp8I=;
        b=YMCqnVaZsZarhE+3cfeKnfpTLmCptgpUF2RD29K31X7HSXmdaSRNjkl+IUHzKmWjl+
         uDm4dUzrFSmP3t+IAn/PAaxB4HWrKfegKJ6HfM7a3JeP2D3DutehvSy44kKUsCCrsdFi
         kQ42y4xDprTsftOGEdJjtrk0RGWEh5jOhMjGk5xC8jG/7NS2AmAfziecQXnlZzJ6buYT
         SfEHdHd+cNGr3uFoctYVXR7FWq3Enkgx6SDRYT/mwJLuHBzZZ69tG/+fNg0fsdseIkkC
         iu0JcVxRFBfqrd+/CnFZQNMbChA/W3o/+5gjsp7oDNdgXbj4W8qxW1+trXZYoY2ljD4o
         GfpA==
X-Gm-Message-State: AOAM533tcrywvFmNokG64iKa9488qNfTQ5AgIY433lLOSEzWNDfTpz6C
	xDDMceNdg73gCWQq8WIGf+mFLA==
X-Google-Smtp-Source: ABdhPJwW6MQATfj2QLcwYqGVH5SVNyGZjDXPcNbqlXRIhF+18kvstClFFinWKqMezWuzW6uxE+BlXQ==
X-Received: by 2002:a92:d808:: with SMTP id y8mr5764344ilm.249.1602936953532;
        Sat, 17 Oct 2020 05:15:53 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id s10sm4941845ilh.33.2020.10.17.05.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 05:15:53 -0700 (PDT)
Date: Sat, 17 Oct 2020 08:15:32 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp: use pre-generated keys instead of haveged in FVP machines
Message-ID: <20201017121532.GC25594@kudzu.us>
References: <20201016181934.2017752-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201016181934.2017752-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 07:19:33PM +0100, Ross Burton wrote:
> As the FVP images won't be used in production there is no need to
> generate unique SSH keys on the first boot, which takes a long time in a
> FVP.
> 
> Instead of recommending haveged (from meta-oe) we can simply install
> pre-generated SSH keys. These keys are static so should not be used in
> production!
> 
> Change-Id: I6a538de6bee892a77816c1d938dd2b55c94257f4
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Both patches pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/fvp-common.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index 2279338..da45026 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -33,8 +33,8 @@ PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
>  
> -# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
> -# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
> -PACKAGE_EXCLUDE_append = " rng-tools"
> -MACHINE_EXTRA_RRECOMMENDS += "haveged"
> -
> +# As this is a virtual target that will not be used in the real world there is
> +# no need for real SSH keys.  Disable rng-tools (which takes too long to
> +# initialise) and install the pre-generated keys.
> +PACKAGECONFIG_remove_pn-openssh = "rng-tools"
> +MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
> -- 
> 2.25.1
> 

> 
> 
> 

