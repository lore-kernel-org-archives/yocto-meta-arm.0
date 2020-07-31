Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.19247.1596204734192478266
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 07:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=1SpfVho8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id o2so14136397qvk.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JvJc748GLA/3FwFPRV7iwswfT8k3x1LX8Jb5AFPTI8Y=;
        b=1SpfVho8JskRWkMCSs31Es3bHWNGBXMI56VEJeJCn8oZPy6pQpbpsih8vcD0s2p7HC
         kqs3WuIEJPGyy1Ey50uYIrf4Ln0WG5GqohJ5fTD7/q6kYVMEkpnKoPJxC9o+oH9Wc6bi
         0n9saB+5qJBV19YmXw5QE5xszJbK9kpCqGnOY7SOUi3dDwS2PhSPl9pgh/UUqg4VAaz1
         zUEs6PvAgkytce5+dHcrXgPGMR5RcgtXOOd+B6CICFUktm5cdFj65XAG9dZ6cGP59dBY
         F/Iq6ktw+79BpVTdJ+ugD6rVPcu1u/9Tfd6DG8hMl4ZSxddZMOT8skmT8HoSApQhAATn
         Lf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JvJc748GLA/3FwFPRV7iwswfT8k3x1LX8Jb5AFPTI8Y=;
        b=gDOAd/BvqKSXn7t7Rc1s5xSW6s8KjqKwU+TUSm2sGM6HalF3XnQhd6LvFSpwQfjVJf
         PfJCw8wPoW2MGEujZ1145ebgZSsbr8LL67i67s15SdIpDO2NBGHkrlPc2Edk7w/L6GQ3
         XW76Ea56/CWB5c4a3X3ahNrdzlc6y0vVCRH/tb45aN4peb4v/Guw0++7K5Qw4ZjMG7lY
         FAoX7NtfZEzakNHiUU5ISpiulpuu908fN/F9ZccReHhPfpgJGNHQoluVqP+4mS0MKije
         za3gEM3GcZQRjpFZ3OXJVHWL5WWbIYimar5sNtTb7D+30dMU8gkoBJ42ZZEptytCuF08
         GYrA==
X-Gm-Message-State: AOAM531cDFDBjvzXuvRhOP3PML3uF4XwD4ieRQMenq5CrqdfoaJBHlVf
	x9zykvSc8ySlqnnhh6mQ56qkZw==
X-Google-Smtp-Source: ABdhPJy0e71pZ/l97Rw4Z3WHxMsfkiO/d7QXvrpT5uA6D9f0Y47G7YGdxzEiNlpUiYgsH8L+s2xVKQ==
X-Received: by 2002:a05:6214:290:: with SMTP id l16mr492909qvv.187.1596204733358;
        Fri, 31 Jul 2020 07:12:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:ad65:cfb8:9c11:f25c])
        by smtp.gmail.com with ESMTPSA id a20sm8984646qtw.54.2020.07.31.07.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:12:13 -0700 (PDT)
Date: Fri, 31 Jul 2020 10:12:11 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2] arm-bsp/wic: fix WKS dependencies for N1SDP components
Message-ID: <20200731141211.GE1853@kudzu.us>
References: <20200723115521.23703-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200723115521.23703-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2020 at 05:25:21PM +0530, Khasim Mohammed wrote:
> Add build-time dependencies to ensure the required components
> (TFA, SCP, UEFI EDK2) are built and available before
> the task to create wic image gets initiated.
> 
> Change-Id: I3789c8d1a44984a26d31ddd8ddd5d16f4d58c7d3
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 139f619..d651270 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -17,6 +17,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  
>  # Set default WKS
>  WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
> +WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
>  
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
> -- 
> 2.17.1
> 

> 

