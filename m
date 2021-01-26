Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.18341.1611691104326134178
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jan 2021 11:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=AHMjB1Kg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id t63so4567828qkc.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 Jan 2021 11:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4U++gNDeHzw0Dj2qz7zFDHtZD9aGCjqHSZvaoawwoSI=;
        b=AHMjB1Kg71CvN3zk49ihZUYbj22ObNakja+m6Vo+qCd08VgIGhfXD0L48VhV3f/Cbb
         AySx9lim+kzKFx1gmiAy4MIcSnuZSNxvT6zF7Sw+FHmp1CXS0MnyPP+QOyVfCRUlpnfN
         SrZkTkFRulKPx5tOYFBm1iCrNKHvdVdAmDW/VTlRaDNte3GdRZxfkK4uuahiagWfbkX8
         Y4jUcoioh/jnozdkV9EASqKZFAmjZGgpzwu+X+ZpOtCH4UYoaJlbSH2hY6CnzN90oPks
         E53ySgxQOxoxlWJoxt1lPUxy0fe6YU/0R+efZwlTgT8THUj8IOy1cDv0NboFlM/hsPLO
         uISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4U++gNDeHzw0Dj2qz7zFDHtZD9aGCjqHSZvaoawwoSI=;
        b=Mf8Ipy3Q//0uU0MBPejNsFliZxvix+rfBjFgt3eMObjZ8EK8Iq70zkSLylR83RBneE
         qEuvt0IMHhwbv1MV2J3EwWPGiCpoQo6igVc13elJLoEFJ6an4sHieFTY4vnBIp64HIp0
         hLVLYx+4CWlbYiupkf4nZ4or6m9cALOU5yFpq4Un062JdnbA7tN/faYQGDNTIpTkOy6A
         WU/xWp/KTa4tHkQBwisbWaZvW4x+IbvDLleLWJs26AwYBpcSdCaa6coGQWJWjuuy4dqj
         6ekJRqx5ww/YTqBUz28/hOrVPDQPRQJbUvI/vpCD1NAXvt6HXMYkIqi5OgfcnzeFwsF5
         Uglw==
X-Gm-Message-State: AOAM5310B7l1VOY+uHwDCKG2L3A8Xfi9ujesZzZ3UmMpBDoNLjGEXOTa
	e3GVfjjG3W6Y2lyTPTDqdTjhXQ==
X-Google-Smtp-Source: ABdhPJyFBZDVttD/unCyUgfsSOAoL2a61K6116l3aNwAydvm7fqQRywr6LSX5OVUeuitE7zfjf+uag==
X-Received: by 2002:a37:8445:: with SMTP id g66mr7265927qkd.453.1611691103489;
        Tue, 26 Jan 2021 11:58:23 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:2831:137d:6845:b616])
        by smtp.gmail.com with ESMTPSA id k190sm2895457qke.10.2021.01.26.11.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:58:23 -0800 (PST)
Date: Tue, 26 Jan 2021 14:58:21 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/n1sdp: Use 5.4 kernel for autonomy n1sdp builds
Message-ID: <20210126195820.GA7069@kudzu.us>
References: <20210125102407.109406-1-peter.hoyes@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210125102407.109406-1-peter.hoyes@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 25, 2021 at 10:24:07AM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> meta-arm-bsp has been updated to use 5.10 kernel but further validation
> required before upgrading the autonomy n1sdp kernel.
> 
> Issue-Id: SCM-2053
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I3848a03d7d01dc3a1c27530ec395e1db083a9e35
> ---

Patch included in master branch

Thanks,
Jon

>  .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> index 977efc5..f39e2ea 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> @@ -49,6 +49,10 @@ do_image_wic[depends] += "xen:do_deploy"
>  IMAGE_EFI_BOOT_FILES += "xen-n1sdp.efi;xen.efi"
>  IMAGE_EFI_BOOT_FILES += "${XEN_MOD_DEVICETREE_DTBS}"
>  
> +# Use 5.4 kernel until later versions have been validated for autonomy-host
> +PREFERRED_PROVIDER_virtual/kernel = "linux-linaro-arm"
> +PREFERRED_VERSION_linux-linaro-arm = "5.4%"
> +
>  # When alternate-kernel DISTRO_FEATURE is present we set the linux-linaro-arm-rt
>  # by default
>  PREFERRED_PROVIDER_alternate/kernel ?= "\
> -- 
> 2.25.1
> 

> 
> 
> 

