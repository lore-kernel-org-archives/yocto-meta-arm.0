Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30555C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 13:07:05 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.10719.1651583214938251837
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 06:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3Ur1Usce;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id o11so13204855qtp.13
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PknoLoQX0pE2NAz+KNUO1PVSK2B9B9ZM47b97zFHeo8=;
        b=3Ur1Uscetnl4pgjfWRF/V+0S39Wy1697C9mrAozhiLsIHlsikxCkd2gWoijm2Vd0pk
         3fWELDy/tyNweWa26kWiPFR5tm5aGRUpjE7ER810F/xFYzUrOWx96oo4+fPwuHBDY+8j
         X9W3DqbyJqbSS7RogiRz6phPifyr/XzTRgx/ceeV4FFMH2/e2FZEbGekJYM5ybwE/Oha
         K5v++CzncmHqDrF3VnxtJ/MCh4eLnMyOgygKJO2J+NRJpWnxOY+3WfVSHbOTH8/Ca9bM
         rdhdRbfR9Q1/UDj2WI92PPDHYwzXWJvvNHZxdmfN65kKNvyPtiB16Iaq0KXSBh4dJZXv
         B2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PknoLoQX0pE2NAz+KNUO1PVSK2B9B9ZM47b97zFHeo8=;
        b=hNAA5/uwMoCd9RQaiBIon2hnSGFReJI2YmlHbRBfijdQTlmQhACMM44VHC/nUPYCWT
         ZYwvPsmdxCoQ9bgaxseQfs1iNxFglmYXYsoN9slxsUqh9KzHA0Z7gb9a4dtJRXLq8lnJ
         GK77ZSY0hcxtHq2tNGHIHdcVWNwnNLjgX5b/1WXxEyaSYoVrwpiNZ+BXR3vna2OFpn+D
         zXkTVeD3XMYijh4tx1O8dxQg3KIul/JQKdORJ3iKoMGAGX9BtBkxWl6K5tzAyvCDqU+X
         GAOmuZcxnWvHfoS3glVU+8kgdsCYxeXz0AC7aGTphrhr2DMYVbTvgxbaITm26BPvDEXn
         hnfA==
X-Gm-Message-State: AOAM533/QEGF/CvMh1F5IQpCp5WWpfiF6h1hrap5qGSyPmMJ6/PCJCt9
	rGqwBTLiENj33JinJwI4Epu4+Q==
X-Google-Smtp-Source: 
 ABdhPJwDW6C7HSXdufNFnv0qGIiJkbbQC8e0sF9j4RsaSFL8kPxaD5p9HjZP8CAq2IeS9PaUN2gnKA==
X-Received: by 2002:a05:622a:34d:b0:2f3:44d9:41a8 with SMTP id
 r13-20020a05622a034d00b002f344d941a8mr14598066qtw.217.1651583213946;
        Tue, 03 May 2022 06:06:53 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 t28-20020a05620a035c00b0069fc13ce1f1sm5540175qkm.34.2022.05.03.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:06:53 -0700 (PDT)
Date: Tue, 3 May 2022 09:06:52 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] ffa-debugfs-mod: Do not build for TI SOCs
Message-ID: <YnEo7I/HCeTzmtBY@kudzu.us>
References: <20220501184731.3730441-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501184731.3730441-1-raj.khem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 13:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3338

On Sun, May 01, 2022 at 11:47:31AM -0700, Khem Raj wrote:
> The module can not be compiled without patching kernel 5.10
> This helps meta-ti to live in multi-BSP envs
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> index 4051c34..a4dd38c 100644
> --- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> +++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> @@ -27,6 +27,7 @@ do_install:append() {
>  }
>  
>  COMPATIBLE_HOST = "(arm|aarch64).*-linux"
> +COMPATIBLE_HOST:ti-soc = "null"

Shouldn't this live in meta-ti?

>  
>  # Kernel modules currently RDEPEND on the kernel, which is troublesome when you want to put a
>  # kernel module into a initramfs without pulling the kernel into the initramfs, which would be
> -- 
> 2.36.0
> 
> 

