Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.2521.1615338760059713612
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 17:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FG3T2C3S;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id t4so15273608qkp.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Mar 2021 17:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0jYasivpP8ccpfxK24gvjvEtZBgUSZwn/RivUIe8SBA=;
        b=FG3T2C3S0d3LTgu5zycHRpyL5cLTMou7v+dkeo3xB8K7s3pNZ2N8GcTeRG/4aAUjA1
         LPk3EQwooSG9SAjp92ve4AGS1UyKHRaIHXiZhZTUshUtVlIjonXNryO50JhQ3kdBbuwq
         WbYd/Y+5rfq43YxH3i6C11pcol9wGVhmPkrWotRtfUQs5st+o1tv4iGPmBFYEGE/9ynC
         ILHXvgRMUUZbsXvR9G9eKwpwRieiGD8Wom/TxrjItQbMkWQpj2+TICZcPas33kHjEW/E
         h0go7dxVyECe4FkuVxYqjYUH0WI2ObauJiVgRoAQdPxbesvWwRm8FhlHJfOwqvbvN5s5
         F73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0jYasivpP8ccpfxK24gvjvEtZBgUSZwn/RivUIe8SBA=;
        b=m/B4C1+iTGw1t1Ump4ld8NZm2RC9f8bHxjA4CVoyuILkEm4AGmyDQsjD1iaHVPyJkm
         c0W+fYd5gXNUWQJqz1XVYYeKOeIaqVDDD3g00dFL2xVEipi+0Gw93CBCJydHkJ0iTLoJ
         tpyTCYO/mT6G2mVO/+dtzm9OCD4yYKNaYGcF4I5iVzDNlUKxfaLosOGoAI2ARktVn5Ez
         Wienzk/94c6G3ty9IdEfcmVkkisb89wV63c9fyAoFj7HQByml2C4JyGV3Nxi5oS03VsN
         96rBc7kTe7+0qNZQD28f4PmVki5XvIwkSwkOrsERJ9SGRv0NZ2VzESDkJDHvEaHiHmuq
         Em6g==
X-Gm-Message-State: AOAM533JSux5TFOCNvgSeYtzyebq149NtOxZE80LNx3cYSjRcNtXmJcP
	5pPCYxrboR5oRpPAgAREDL/aSA==
X-Google-Smtp-Source: ABdhPJyRqydhNm3CfG7iHw7pIhg1l6MuyahIxBGcMYNDpkkwlNT3RPLD4DVmNB0Irljk+f50UA9suA==
X-Received: by 2002:a37:a647:: with SMTP id p68mr453466qke.189.1615338759155;
        Tue, 09 Mar 2021 17:12:39 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:55e6:414f:4108:a7b])
        by smtp.gmail.com with ESMTPSA id o19sm11019592qtt.62.2021.03.09.17.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 17:12:39 -0800 (PST)
Date: Tue, 9 Mar 2021 20:12:37 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/n1sdp: Use anonymous function to set kernel provider
Message-ID: <20210310011237.GB1938@kudzu.us>
References: <20210309170026.3985947-1-peter.hoyes@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210309170026.3985947-1-peter.hoyes@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 05:00:25PM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Only set PREFERRED_PROVIDER_virtual/kernel in arm-autonomy to
> linux-linaro-arm if it is set to linux-yocto. Allows it to be
> modifed from local.conf, e.g. for RT builds.
> 
> Issue-Id: SCM-2185
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Ied871389ccaa017437babb4f0cb48d23862eb7bd
> ---

Series applied to master

Thanks,
Jon

>  .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc     | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> index f39e2ea..3612b2e 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> @@ -50,8 +50,11 @@ IMAGE_EFI_BOOT_FILES += "xen-n1sdp.efi;xen.efi"
>  IMAGE_EFI_BOOT_FILES += "${XEN_MOD_DEVICETREE_DTBS}"
>  
>  # Use 5.4 kernel until later versions have been validated for autonomy-host
> -PREFERRED_PROVIDER_virtual/kernel = "linux-linaro-arm"
> -PREFERRED_VERSION_linux-linaro-arm = "5.4%"
> +python() {
> +    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') == 'linux-yocto':
> +        d.setVar('PREFERRED_PROVIDER_virtual/kernel', 'linux-linaro-arm')
> +        d.setVar('PREFERRED_VERSION_linux-linaro-arm', '5.4%')
> +}
>  
>  # When alternate-kernel DISTRO_FEATURE is present we set the linux-linaro-arm-rt
>  # by default
> -- 
> 2.25.1
> 

> 
> 
> 

