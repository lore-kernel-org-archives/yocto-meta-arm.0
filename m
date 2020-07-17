Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.10925.1594991736507108598
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 06:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=yufI+Ry1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id z63so8641686qkb.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=isEheKt+ZwMLgj2qrQh/kLeouXO4geeaW8FpsUelPlo=;
        b=yufI+Ry1WxPw4T9ekPjZpiuxKwRBrmcHJPU2xpXYlvsSq7d9VbZPs2TpEB7xbdX6Cm
         XyArHQNbEBJlHwwAO+IPk8i6RHV35eb04zMQhFYeLR5X/2xs/Rz9JoMMbkY90+OEnKAf
         U8NEDb9luUzKa6UKeWVLHEH/NoNgV7ceMLiMLKgxVRCjHM0Dc2yIte8SNkqCaVNoCmzb
         6ssIDimLicTizwOGRjn0YA4vZgEHU3L1fHHzgoNv4L6KloccEcQpxL8lQQcRt0yPSerM
         XQUbeI406Wzn8X/ZfAZHPLO+qCjSjGre05HhUWHIx+MSkawAB+/aWOdGpsVAc7fmLUe+
         6n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=isEheKt+ZwMLgj2qrQh/kLeouXO4geeaW8FpsUelPlo=;
        b=Fx/CGb9l/kKgwsH2N5QufvcxSlF1/LeQPajF858zur+TTmQR569aB1LUHZF8eULFqL
         54p0xfo1pLLzHlVriuLfU4QRzwWHyR1wzN8ICRsXjINBp3qzPMpDLJTgxbWBfyKncnUE
         sWGWhGjhqfF7oFJCAwgSCrmLBvJ81DW1NR2Jkf7JQe+8ZSe35s6JnQaWTtYWJw9/Tdkv
         SiVGC6ofGZCsJupr7YR/JbDEkfXB9AxtLqxf3mWbkfCazficZIelHF/qAEtA6mZ4VRwy
         zt7oKw30dXpl0PyPHDGHhtByG+4d98hXPQe9/fV42mjT89QIq8V2ngby+3vtFAdEatnI
         4ilQ==
X-Gm-Message-State: AOAM533SpDpG7J3U2i6FQ633/jf5GcHSX861BNoHFlH8ccxomKelkpEl
	xxE4ZP//Qf0ocjkJVVHt3YZ3+PuLr5YEaQ==
X-Google-Smtp-Source: ABdhPJw3JUQBrpsEFl8CwP0UPggadomVXFD9N9PoHNcwa7lE4EeG+8uH5Nl0KjplzEw0QYnI7w3R9w==
X-Received: by 2002:a37:44c4:: with SMTP id r187mr8897042qka.93.1594991735566;
        Fri, 17 Jul 2020 06:15:35 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id p63sm9835393qkc.80.2020.07.17.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:15:35 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:15:33 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: rename linux-yocto_5.4.bbappend for versatility
Message-ID: <20200717131533.GE26434@kudzu.us>
References: <20200715125921.3460-1-jon.mason@arm.com>
 <20200715125921.3460-2-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200715125921.3460-2-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2020 at 08:59:21AM -0400, Jon Mason wrote:
> There is nothing unique about the 5.4 version of linux-yocto.  Rename
> the file to allow for this to be applied against any version of
> linux-yocto.
> 
> Change-Id: I15e0c4509b237d29969105ac5942dd8079eaeee9
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../linux/{linux-yocto_5.4.bbappend => linux-yocto_%.bbappend}    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto_5.4.bbappend => linux-yocto_%.bbappend} (100%)
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_%.bbappend
> similarity index 100%
> rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_%.bbappend
> -- 
> 2.17.1
> 

> 

