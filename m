Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.18214.1611691118003150452
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jan 2021 11:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=PfjMd4pl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id v3so13179611qtw.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 Jan 2021 11:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N++lhxTl/jPu/3mYn+F7eHlvSTkrMip8uZMK7prHgWw=;
        b=PfjMd4plW8cQxEzKhNv4kSsZ07d4caB6GICFZi3xr2Df4vhPlS9uZS8mTOU52/IsxW
         irCFrNwQ/pJQA0A07mInp1UlImeIO+KE4II7yUeQjaVWaQjz1LNiMPWPucAx6hWyNjHb
         kbrMuimAfe+YzDwxRoYw/SPB2+py3+y7mYN3iW/uyU9fQ3kkHWDwUk+skYR7NkQEqXvj
         flqlEYnqQA2dN1QJFnD/U8mFPTiEvW0mZCbA5gR0wH2XEW6o7KRr5VWaD8XDgJkD7JpI
         uX29UopknpHemn9d/X/htGgEM1d0w3TSErIOKosmNoUYk3HL4RKJS571s2GAWwlPTKRt
         kcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N++lhxTl/jPu/3mYn+F7eHlvSTkrMip8uZMK7prHgWw=;
        b=VOGR3qzYybq3iUfXQbB6ZYe1T/Ww8jC/NjcZw7bUZaKOiuZw5aXVaJgUeV2XESbeuY
         ww1WF8eLaKF2bbjautOUZ+PZc1KBNjWdcpe32L1efakX8VHdiizOwfJ/fm4tNWlkmHRO
         0oZWymbW5wArQ6bX7B7+hWgELHcLVfs7ATk2CTWm4B37qrh492AptPAp7cBLBeoxM219
         tbodl8dkxCABMCOUFy+V0NPo8e2HeoqbY4f7nNX1JCxHlEq7RbShI1GGefXLSZ3oDVVu
         o7NajmAX7XiXb13B0jp80veNi2eecpCT5EemIP/wsLHDvU6+8r5m88RMnnYRCvISzI1T
         LHzQ==
X-Gm-Message-State: AOAM533wRrv6SKnQ8NoVAmdPgrH3qf9X88J1tqbgcKe2BnIdSHz6Zw2/
	B0Nlrw68kvXfSY5akI45x4KSB0fAH28xkw==
X-Google-Smtp-Source: ABdhPJwAarMvHNuuVOBbJ4B2JB3PpMeZ8clG7EbfVIh05U2hJhln2w7bPZv+uk7ACBFlLgzG8scTLg==
X-Received: by 2002:a05:622a:183:: with SMTP id s3mr2512524qtw.223.1611691117214;
        Tue, 26 Jan 2021 11:58:37 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:2831:137d:6845:b616])
        by smtp.gmail.com with ESMTPSA id a11sm4597861qkc.111.2021.01.26.11.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:58:37 -0800 (PST)
Date: Tue, 26 Jan 2021 14:58:35 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Use 5.10 kernel for autonomy-guest
Message-ID: <20210126195835.GB7069@kudzu.us>
References: <20210125102549.110517-1-peter.hoyes@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210125102549.110517-1-peter.hoyes@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 25, 2021 at 10:25:49AM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Issue-Id: SCM-2054
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I8bcb464f0fd960cd01cce328c51be538cc705e84
> ---

Patch included in master branch

Thanks,
Jon

>  meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
> index 8b32fa7..097b382 100644
> --- a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
> +++ b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
> @@ -11,7 +11,7 @@ KERNEL_IMAGETYPE = "Image"
>  IMAGE_FSTYPES += "tar.bz2"
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
> -PREFERRED_VERSION_linux-yocto ?= "5.4%"
> +PREFERRED_VERSION_linux-yocto ?= "5.10%"
>  
>  DISTRO_FEATURES += "arm-autonomy-guest"
>  
> -- 
> 2.25.1
> 

> 
> 
> 

