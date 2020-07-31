Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.19220.1596204668568737675
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 07:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DxDQsI1y;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id e13so28845606qkg.5
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cyAiFH9G5AT+Rkm7JhgdROTh1FdTjpQAZo8hQlrCAVA=;
        b=DxDQsI1yOqPzy3zOfUyAL84xBMetpnORPVU2NklbD3N+4LAXdF81MDanlmXYbO0VX7
         GrawC8Mj8TUD2zkRQIkVo5Lk64GWIHb5okg55N+VAQvoXFJWqCRx4v0cjCO+hPMVi4M8
         1ue0tpjAH87/kG2xjmDMusMa+xHqhMtUgMGJNLQaDDd851ZPJC4Vnj/Ngo1TkHYCmkcL
         lNMhgElUAhaVV5j4cWOty8X1h9VBbnd4h5ixa9gkNrWcyelWkYLA2m7WgjS+5JWMDVX3
         jL5iZmzIVQh3J/PXvMVU+eraoSVDlmjXVsbTTRKJ/b+ZwzX+rf5ufNIEHCconW0zECUI
         +MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cyAiFH9G5AT+Rkm7JhgdROTh1FdTjpQAZo8hQlrCAVA=;
        b=kaegDxj8mscnWu7USScyPATTHsOmiGVe6i4//ssQME7T1iC7wgBUTnkpjlFhQ3ok7q
         x1A7gCGNmP5WmIhAoB/VESYMrMqf6yLzpbS44ib9pJ2kEuNWokxazy4I/Rl1aOxbh5Du
         04PdDzZNaUTZ0gibD9KoLJn0HwVDZGYYQMLjCztch+4RrIoRZd/lhFPyrE2OIaZC2yb/
         tG1weRPbQVThTmMoxR7HUTy+USSOaQg/8QwWHsUwiOsB4k2wsvg4JDzPR0CAIVVRPtdh
         wHKb7Q4LRubXFu0Jair5gYwliUI8DzUAhXyAJ6O0jBe3qIiJWwEMJNYh3Rs6inl1FLjF
         GUow==
X-Gm-Message-State: AOAM531YOQ7LyliKlO5IBHO9OB40vCVi6kPhjE/rVvoFfCQSIpKkkJ3f
	rLkyvOctkV5DeuWZnvf0mY/VSA==
X-Google-Smtp-Source: ABdhPJwLZf8cdzA4YpF6eEufXL3FLKw8j5KbFVyMKs+2wHr3egGZUfTUg0HTEu2m/w5sGTT6/B+Cgg==
X-Received: by 2002:a37:8a42:: with SMTP id m63mr3940571qkd.441.1596204667734;
        Fri, 31 Jul 2020 07:11:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:ad65:cfb8:9c11:f25c])
        by smtp.gmail.com with ESMTPSA id g129sm8569695qkb.39.2020.07.31.07.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:11:07 -0700 (PDT)
Date: Fri, 31 Jul 2020 10:11:05 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v2] arm-bsp/wic: fix WKS dependencies for N1SDP components
Message-ID: <20200731141104.GD1853@kudzu.us>
References: <16245FA85AB8779A.27593@lists.yoctoproject.org>
 <AM0PR08MB4963425D98D65B5E63BDE965FA4E0@AM0PR08MB4963.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB4963425D98D65B5E63BDE965FA4E0@AM0PR08MB4963.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 07:26:48AM +0000, Khasim Mohammed wrote:
> Hi Jon Mason,
> 
> Can you please apply this patch as well ?

Sorry, this got lost in the shuffle.

> 
> Regards,
> Khasim
> 
> ________________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on behalf of Khasim Mohammed via lists.yoctoproject.org <khasim.mohammed=arm.com@lists.yoctoproject.org>
> Sent: Thursday, July 23, 2020 5:25 PM
> To: meta-arm@lists.yoctoproject.org
> Cc: nd; Khasim Mohammed
> Subject: [meta-arm] [PATCH v2] arm-bsp/wic: fix WKS dependencies for N1SDP components
> 
> Add build-time dependencies to ensure the required components
> (TFA, SCP, UEFI EDK2) are built and available before
> the task to create wic image gets initiated.
> 
> Change-Id: I3789c8d1a44984a26d31ddd8ddd5d16f4d58c7d3
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
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

