Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.4806.1618885821799260062
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 19:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=HKsHTy9z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id v7so9941338qkj.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Apr 2021 19:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NqAkdcoYwBkUa6OWctK4feIIYBYUE/XwhoIKZ3kDFAY=;
        b=HKsHTy9z0UvQaRN0A+ZFTntThGKy3RXWueM2pocc3z+ideqIO7acM+KDfGaVFL2v9w
         dcUL9PDx+ecjv3mHr9DP2xtJnGVVXmgw2jgLp514NVFE1IVgSV9Fv8eOzgfMmHIAIWe6
         hNa54bj0g55aOjOIEOG5RGT6DKc6kcJv2l/wkJme4Nf4BhLn1w42ieOeLUZ32Ny6erQU
         ZIct7/eQXYnD0cqmX8RoXgh8aIMWqs95/FGl72yIPEeE4bjRE8Wk7mVhRlq2QSln/ELO
         sviokQljVe71a8iNAXSviKpwpcsh2RsLXBkx+o85YpCUxBkBI8sHcNJAx4zFehUAGPi7
         YM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NqAkdcoYwBkUa6OWctK4feIIYBYUE/XwhoIKZ3kDFAY=;
        b=Vp8n73dpPBLx9PZAsUzKg/a6xoX7+ydrucVaY3Iroc0jTW0HODR9KpUFs2aAIVvk2s
         uRVopIfKX6sB5WmE+8A1btsr8nKFmE4dRJsNoEEys4g4jE/7elr/aRz0TtyxIXZjiJm9
         YW8H6cXUg5+LGtb8UGhIq89+0BUyA/AKbyzDTBebFRPhAIkUvQq7LH1JZFBpCO0vnBtf
         laem1YJ2MoaITtkai8LBRpImEo6p1aOKyh1n43F20QAV8eUMH+rjLZwHt4Bvwd3rfxd9
         gs7iTacF3BtzBo2KdcyGwMGfU7Gl2rPM42f1IsvotgwE0sj+7bJcwdMLZQR2NQxxwaZp
         VIyg==
X-Gm-Message-State: AOAM533b64u+223KavRg9Z2OnTlXtucB0ldJCjBCFP9Atrhx9lmKXivM
	7gdhGqquFO2re7VlHrWGg8qDjg==
X-Google-Smtp-Source: ABdhPJwPxk/C4IZJO1SoInt1JXbrN62OX77HYeKedABZGkStrB94jV7w7SIq3BcliGt0/8nMdkWo0g==
X-Received: by 2002:a37:43cc:: with SMTP id q195mr15501652qka.455.1618885821002;
        Mon, 19 Apr 2021 19:30:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4076:a42c:4488:e863])
        by smtp.gmail.com with ESMTPSA id s22sm2168725qkg.58.2021.04.19.19.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 19:30:20 -0700 (PDT)
Date: Mon, 19 Apr 2021 22:30:19 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Subject: Re: [meta-arm] [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
Message-ID: <20210420023019.GA27826@kudzu.us>
References: <20210414134726.4125294-1-yann@blade-group.com>
 <20210414134726.4125294-4-yann@blade-group.com>
MIME-Version: 1.0
In-Reply-To: <20210414134726.4125294-4-yann@blade-group.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I applied the series, but didn't catch the warning/error that Ross
emntioned.  So, I had to revert this patch.  Could you please correct
it and resubmit?

Thanks,
Jon

On Wed, Apr 14, 2021 at 03:47:23PM +0200, Yann Dirson wrote:
> From: Yann Dirson <yann@blade-group.com>
> 
> Integration of OP-TEE in the u-boot image is done with `TEE=tee.elf`,
> so this build artifact must be exported.
> 
> U-boot integration can now be done in a BSP layer with something like
> this in `u-boot_%.bbappend`:
> 
>  # OP-TEE, dependent on "optee" DISTRO_FEATURES
> 
>  OPTEE_OEMAKE ?= " TEE=${DEPLOY_DIR_IMAGE}/optee/tee.elf"
> 
>  EXTRA_OEMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
>  PACKAGECONFIG[optee] = "${OPTEE_OEMAKE},,optee-os"
>  PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'optee', d)}"
> 
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index 34f586a..08cc2f0 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -45,7 +45,7 @@ do_compile[cleandirs] = "${B}"
>  do_install() {
>      #install core in firmware
>      install -d ${D}${nonarch_base_libdir}/firmware/
> -    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
>  
>      #install TA devkit
>      install -d ${D}${includedir}/optee/export-user_ta/
> -- 
> 2.30.2
> 

> 
> 
> 

