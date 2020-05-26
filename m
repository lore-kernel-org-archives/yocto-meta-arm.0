Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.50785.1590500421427771732
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 May 2020 06:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DFNS3Wbw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id q8so4068173qkm.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 May 2020 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Du5EJwi10A2XwnE2mXPmSrntv9+yXvSbmkUbZBv7sjg=;
        b=DFNS3WbwwPByjM38huY3yDba1WpIDEQYolDTUcpOzy1hm4382numv7muJv/DJXwK5Z
         3B8q6jQ8+HmOXXa3rNxWHKQv0eaW8BAEZ15hMxZYlt/OzHtvUJQaHA6T16f0IXGI+UIW
         xx7NdJ4SGjVYtk2sUMhMRnfNry+RS3vZW9A85GKBo8dcQCMY39XvZ1j/k9UuEiWkuExL
         bRiJECP6G9W6Ar4dRNWSQmlCqSdhWNxWcH08kneAEcTo6LzC9PF4BbawC7Q9KLhtapa6
         RlbBsROV4YUhrBaxmrMyst+3TSXgBl8abkxu9F3N+htjNdUNMoBM2Z9Mfdu+2t8PU18g
         lY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Du5EJwi10A2XwnE2mXPmSrntv9+yXvSbmkUbZBv7sjg=;
        b=mPsyFbrnx8wHaK6YPA1NJxzAt9g7GQrFDQ/SvJEqbiIDaPr3O9SAI7ZTQEKW+qs4wN
         U11DXvVeWr23749F/imK+NsIm+lRx8OAMp+kO1UWZ21ZDHwYD5SEkaPuboUC1hDw6A6I
         0cQUXmHT0/A4z9bDVJCuvUbeoIdjNC18PpCRCvxI7wrgzkVCma2c5ntYHdChQEsUqWJL
         eHpLlo0nAEN2jBsyYrUuImeZ2Pb82cnGmdudGpMbTu9G0aw0vbAYDsU4vbCORBPyiXC2
         qTKuUP5gAOEAGpK7txIeZWqEKKz6nk/SRY6MIizGmms4sHQCZ2tNVpsaX/Il4e3cqBXK
         IY5A==
X-Gm-Message-State: AOAM530tc4GCrVUjdA3qDbPA98vUdO2LmKVpe/HQXuhrV0o2BiVaJhGF
	5hPQ/5QJKsHGNV7x69VkXMT/1Q==
X-Google-Smtp-Source: ABdhPJwELbfV4Z3qa9UssJs2oS616BP9V0vIHBAZMWJgcWX7N2sO3kT0qa5haREhHgD2M8vfdMvF4Q==
X-Received: by 2002:a37:8807:: with SMTP id k7mr1323453qkd.226.1590500420305;
        Tue, 26 May 2020 06:40:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:340f:678d:bbc:4cb4])
        by smtp.gmail.com with ESMTPSA id x41sm6972198qtb.76.2020.05.26.06.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 06:40:20 -0700 (PDT)
Date: Tue, 26 May 2020 09:40:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-aarch64-none-elf: Add recipe
Message-ID: <20200526134018.GA32704@kudzu.us>
References: <1589964438-6924-1-git-send-email-denis@denix.org>
 <22524.1590037979741392604@lists.yoctoproject.org>
 <20200522231747.GD17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200522231747.GD17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 07:17:47PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 20, 2020 at 10:12:59PM -0700, Diego Sueiro wrote:
> > On Wed, May 20, 2020 at 09:47 AM, Denys Dmytriyenko wrote:
> > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > > @@ -0,0 +1,38 @@
> > > +# Copyright (C) 2020 Texas Instruments Inc.
> > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > +
> > > +SUMMARY = "Baremetal GCC for Aarch64 processors"
> > > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> 
> <snip>
> 
> > I see lots of commonalities (code duplication) with the 
> > gcc-arm-none-eabi_9-2019-q4-major.bb recipe. Isn't now a good opportunity to 
> > have a `.inc` to avoid this?
> 
> Yes, there's lots of duplication in those 2 recipes. Unfortunately, there's 
> copyright in the original one and I cannot touch it w/o a lawyer. That's why 
> I don't like copyrights in recipes (nothing much to copyright there anyway)

I'm confused.  You mean the MIT license in
gcc-arm-none-eabi_9-2019-q4-major.bb?  If so, is it not the same as
the license you reference above in your patch?

> > The path inside the do_install can be easily controlled by a variable set 
> > from the recipes that are including it.
> 
> Well, those are technical details I can handle quite easily - I've been doing 
> OE for 13+ years. But it is legal issues where I draw the line...

Assuming it's the MIT license, and you are unwilling to do it, I can
pull it in and make the common inc file.

Thanks,
Jon


> 
> -- 
> Denys

> 

