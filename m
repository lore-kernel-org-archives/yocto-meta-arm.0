Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.100.1616542600244975284
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 16:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=2I+4KiNw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id y18so16313192qky.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Mar 2021 16:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YhSGg7lhwzv3W+vmjvVeKaXYQBdaijVuUpBO3uKfzv4=;
        b=2I+4KiNwzPa9np+FHjkS+1k+26pSKrUNduBuwpSWS72EaXLw1oDZo9cIS20zgdVEZF
         e0wqU/DjLMlfM1fYtLe+dbtlWr4g6E2crbVl+XVF+XtEyhs8nCnsIAuxPk6W00AWM1mg
         nMoM763yrFWTvzOdYkfVJUUyPdWhGeERqncNXqX64hX/fe9b/ote/Rxy2y44UvcR/oWg
         1XQ+LkjvC8L1qy0uPAmAo8hE/+IhVnPByHdyPKt/Y5oGp2lhkmg3qUyafZFerXUypyA2
         NL/JA5n2JG23xUpgLInm3kll2GMunhvjDTDNFEwDfkIPtd2tIpZxQFGtLqWDqRIrrPoJ
         jdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YhSGg7lhwzv3W+vmjvVeKaXYQBdaijVuUpBO3uKfzv4=;
        b=I3+PYj2Bn/BJEXRpfwPq7DMULS7F8+JMGKl0Ri1uBSKZWWb0Gd+kCPdZfKyDJKrjfM
         VBNe5l2Rb57lp8/otdP2+jBhFVUNClqZz4jntCc4uH5hbrIrqppNbFVKgNr3ua4kyjjK
         82taAirdBrx/8C4gTHorZmlJ5ZgTNBmbK9NY+q4dPFl3gWzM870fMnyYQYs4Abdm9d54
         XbFjpcrHjzmezBqUUWRaHylJ7rJVyjNAY/k7/XcerBLUFjPu346rDucxMAu3UHbFPzXV
         eYoh57ZdhU4p3sXTFlSFSx8ELuCAgWjfkK4R8U+ZevZWIHfp5vJ78YSFpZGzVBx/YkEl
         GWEg==
X-Gm-Message-State: AOAM5318IyIgux/DHLD9naGAgTODXx20ZTyQICBvxr0K3jGWT6xKvu3H
	CzaeZaIqleYn+0m3vEWORWpp/fZYQuiXRg==
X-Google-Smtp-Source: ABdhPJxDyR+4/T7sLwqVJUv2BrXXUHuf+27NJWPXotRL9Y1VjjCZrTBpbI4jdKZqxn56t4SPFDc2pw==
X-Received: by 2002:a05:620a:f95:: with SMTP id b21mr543191qkn.251.1616542599337;
        Tue, 23 Mar 2021 16:36:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:74fd:160b:ac3f:3b])
        by smtp.gmail.com with ESMTPSA id 18sm406701qkr.77.2021.03.23.16.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 16:36:39 -0700 (PDT)
Date: Tue, 23 Mar 2021 19:36:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/hafnium: refuse to build on non-x86-64 hosts
Message-ID: <20210323233637.GA9382@kudzu.us>
References: <20210322185951.2151143-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210322185951.2151143-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2021 at 06:59:51PM +0000, Ross Burton wrote:
> For reasons, hafnium doesn't use host binaries for stuff like GN, Ninja,
> Clang, GCC, or Qemu. Instead it ships binaries that it uses during the
> build, but these binaries are only available for x86-64.
> 
> Attempts to use external tools (so the recipe can just DEPENDS as usual)
> were not successful (clang being the problem) so just forcible stop the
> recipe building on anything but x86-64 for now.
> 
> Change-Id: I144309d15fa1265b2b105981cd2bfcd376aab7ad
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Included in the master branch.

Thanks,
Jon

>  meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
> index 3a52599..361d6db 100644
> --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
> @@ -72,3 +72,9 @@ do_deploy() {
>      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
>  }
>  addtask deploy after do_install
> +
> +python() {
> +    # https://developer.trustedfirmware.org/T898
> +    if d.getVar("BUILD_ARCH") != "x86_64":
> +        raise bb.parse.SkipRecipe("Cannot be built on non-x86-64 hosts")
> +}
> -- 
> 2.25.1
> 

> 
> 
> 

