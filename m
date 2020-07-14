Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.1477.1594747433905216690
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 10:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=dpdQrH4D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id 6so13437816qtt.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PRJt8ftMPO07FDLQ0hWym/lzosLLfny2FhWaNztBsTE=;
        b=dpdQrH4D1Ke65WB+YG+1VxtEVPO6KUy/BcfePD/DIgvlsZzSxsVSc5BQrXnqG5kA9i
         vT7ntdSHX8kchkuu/RvkheDjzmnBmqjdQP74dTF5u58g/JB+UUbbc/8muZUgzepfYiB4
         ckSSHnmnkvmU4LBN1EHtarpNlzU87ccAW1dPhwkiSEP+UU8R5yg1qv5r9d65+qTwtz0L
         EEqk3ZX3mS3gD8By98oTU1g/jyDPxr4CDz7HowKtncuupnveW+o7OIBax2IHWVmzktcJ
         crqAhhE/Pxha7PnpuUlgkGrH4fjiAuchGTZj+W8qfIhzuwVom8rEtBmmDGSPtKbVocSB
         j43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PRJt8ftMPO07FDLQ0hWym/lzosLLfny2FhWaNztBsTE=;
        b=W0Y7DSDNYQo7nQlLyxmmz5D9rNEx6/Z55Dg4UsGcYlNk06auhywiQ9i+v23sdsplhQ
         2w6yYBBNR5SvSwbtRIeIzDvxnICcddPM+oUxeeOZt6K7IDNc5MhKONTzQU2Wn2SqWn0a
         BMlAYqZ57mhi02LRiTU8hfVVJLROVQavCm+6tLjPOzonW7OX75ouna7htV72jl6EEnQI
         S7bFlV0QDJFY1ADo0+NQcljeG51sEtdOBY81fI8oaV+xJ4TLo1e0B1e0SBsRKBpnMj5s
         /voiJf1fgvoPto775ZWHZznDKRNxwLrQbPVQ3wHnnRGh+Cvwwy4d7qFn4X1+2HT7Mx9M
         51QQ==
X-Gm-Message-State: AOAM533ix/A3L82XKcURg87Z7Z1MvuMFhBxvrNF+ZJqfUgYP+WrZWZVl
	mc6gqrp+W4C2Vu1xrP7n04j9tw==
X-Google-Smtp-Source: ABdhPJw4DoJUPQop3G8KB58OhScVuy9a7bIZyKaN3q/1jhHNpXoI1v51FUlel6TgmZVczKpm1FZDYA==
X-Received: by 2002:ac8:4c86:: with SMTP id j6mr5789781qtv.56.1594747432551;
        Tue, 14 Jul 2020 10:23:52 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d523:4dcb:5d9f:3d2])
        by smtp.gmail.com with ESMTPSA id r35sm24795407qtb.11.2020.07.14.10.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 10:23:52 -0700 (PDT)
Date: Tue, 14 Jul 2020 13:23:50 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 4/4] arm-bsp: remove unused bbappend
Message-ID: <20200714172349.GA17632@kudzu.us>
References: <20200714125834.31338-1-jon.mason@arm.com>
 <20200714125834.31338-4-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200714125834.31338-4-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 08:58:34AM -0400, Jon Mason wrote:
> linux-yocto_5.4.bbappend is currently referencing a non-existing file.
> It's not breaking the build because no one is using it.  Instead of
> fixing it, it is better to remove it and re-add if/when it is used
> again.
> 
> Change-Id: Icc6d4b2a3d42981dac884600a351c267ac346246
> Signed-off-by: Jon Mason <jon.mason@arm.com>

This is now being used by Anders' most recent patch.  Dropping.

Thanks,
Jon

> ---
>  meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend | 3 ---
>  1 file changed, 3 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> deleted file mode 100644
> index ed6fbc3..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Add support for Arm Platforms (boards or simulators)
> -
> -require linux-yocto-arm-platforms.inc
> -- 
> 2.17.1
> 

> 

