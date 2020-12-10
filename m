Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web08.13578.1607608976059313094
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 06:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sp2egeZl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id b9so3668071qtr.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vRUYX6MAxAJWHc0+H0l+3Z3f4wYLFxWYC5BDtsezBsg=;
        b=sp2egeZlXWkadhE9LVp6h/YXRSTJdrXVtWxaXpvi4ZZ/b8CImZy5C+P5ozL//u+ufg
         D4suS41h3Y8w/h0MR0S8PY96Ex021Nhum02StQNyBTA6i/W2VFZ0Mxb8STqz0hR/B55X
         dn78hS6xl+HgU5wzvj1rbl6439vYtszLQZZEDs0KGI4ApO++EQ35YzoSDlsrJNmik/U2
         gqL5hnhwKTgD7XW3klFcGaviyqJebRcs0N61fUYixzlgTdz4k5IEPst1ZyTtFIvpkpS0
         w8ADEjeWzfTJIF/1QBSRja86yRlXBC9FGdtB7OcUvARWlIyAMdkyoX9xg5HZvO0JwDh1
         kqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vRUYX6MAxAJWHc0+H0l+3Z3f4wYLFxWYC5BDtsezBsg=;
        b=QW3MOT0HtNiMN7EsbbJtJ+F6TobNo+wlKWsYkSNCLNCHQ5RrptjgqtBG6vK1tJJXQs
         ZNOBvV+WkJIhcnm3YMvDfo3cNfDMZQLolmvPjttpNNNJg8o1og+GCY4xEZ7y91X+vP7n
         alijARTVT/npUXQMGTrBBRb7G1jaX5DqaWPSwYODHUKrewSX/IsP+90Na3pIGxzQ3Bc9
         2O8QzoiHPJbEXkpFE/CPCEIR7v+SvP9C4H99IZgWZY1cH5pBhNNEx0yiD6/xBmMwb9LY
         WqfaV9+wRY+OZmHdN80CeQiDjWcjsc0owUTxC9UnaFGzkEfxywf3hjBOaHCqwRHwFd/3
         uTAg==
X-Gm-Message-State: AOAM532Oxqj/jB+PciB5TA1pAyBYLPSLYw2qShQE6rgUOlk66stT2ENS
	wig54UONQByN3dB8I1T3fdIqFg==
X-Google-Smtp-Source: ABdhPJx4Mlyxh/usaI5emkbRxnVOdwb50uFh+BrZBzO0OHhJfKEWcEYG2MgEQ6X0HsLOKOzq+v9rvg==
X-Received: by 2002:ac8:44b5:: with SMTP id a21mr9060500qto.104.1607608975164;
        Thu, 10 Dec 2020 06:02:55 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:8083:6d46:abe1:7466])
        by smtp.gmail.com with ESMTPSA id t30sm3575689qkj.29.2020.12.10.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 06:02:54 -0800 (PST)
Date: Thu, 10 Dec 2020 09:02:53 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: don't use -dev kernel
Message-ID: <20201210140252.GC27847@kudzu.us>
References: <20201209105714.4193993-1-ross.burton@arm.com>
 <be56ddd3-9dd2-bc30-358d-b228bc63c18d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <be56ddd3-9dd2-bc30-358d-b228bc63c18d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2020 at 02:17:26PM -0600, Joshua Watt wrote:
> 
> On 12/9/20 4:57 AM, Ross Burton wrote:
> > According to the comment linux-yocto-dev was being used to get a 5.5
> > kernel as 5.4 was panicking on boot.  Now linux-yocto defaults to 5.8
> > so just use the standard kernel instead.
> > 
> > Change-Id: Id382c69f16f2ff4b2cbc63be94a645e56616549d
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   meta-arm/conf/machine/qemuarm64-secureboot.conf | 5 -----
> >   1 file changed, 5 deletions(-)
> > 
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > index f2c15e6..fe19ed2 100644
> > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -6,10 +6,6 @@ KMACHINE = "qemuarm64"
> >   UBOOT_MACHINE = "qemu_arm64_defconfig"
> > -# The 5.4 kernel panics when booting, so use the development kernel until the
> > -# default kernel is upgraded (5.5. supposedly works)
> > -PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
> > -
> 
> 
> Seems reasonable to me. Thanks for following up!

We're using the crap out of this.  Very happy that you did it!

Thanks,
Jon

> 
> 
> >   QB_MACHINE = "-machine virt,secure=on"
> >   QB_OPT_APPEND += "-no-acpi"
> >   QB_MEM = "-m 1024"
> > @@ -23,4 +19,3 @@ IMAGE_FSTYPES += "wic wic.qcow2"
> >   WKS_FILE ?= "qemuarm64.wks"
> >   WKS_FILE_DEPENDS = "trusted-firmware-a"
> >   IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> > -
> > 
> > 
> > 

> 
> 
> 

