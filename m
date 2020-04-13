Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.220.1586815370610027734
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=s0yafjoL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id s18so5258044qvn.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Apr 2020 15:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4eEH0QW2xOfIaXO00B+74iTwooGNtWuVSuAEGJL+n50=;
        b=s0yafjoLmA4mj+b21SBeLIF3V/h3uT3UbGubrxS5J6gg1BRLLOPHyFEURvc1RDJ3ys
         AnYi7ILYJqCE8S849Cw6e9+KcIokfIjZXf0mie6ktsB7BaSgo5/B8nydUlTb9dq0qw1v
         E3+vDFQrjMNgsG1LlbgYYAAKg+ZRO6bsGgNr9gLowACWe7ClG33e63uQM8eegbpeCRG9
         4VGrJnZfclKDa7DJ26ELGwwh5UMpbFPpBOlfn+Cr0q5dIJ45soYthaI2QUJwCSC3MOWj
         ZSVNfi2pGGXZ5U3WaCc0sPRVlM07sW71tBXcPfCNSPus55rnc7wlUridkYdQ1wHGSCjV
         7vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4eEH0QW2xOfIaXO00B+74iTwooGNtWuVSuAEGJL+n50=;
        b=ZMFLP0RWkFbbnz9V8y4JWz1X1HgS7WQtZVf3CjUSIZmWwEadvBEBujalu9VqIm7YcE
         m4TDkoetWQ882oB7BvKwG+y03ZVcagZgHZ2mfkXx0CevavbxiwCAaZmWP/05mYIv/D3C
         0NdmfVTvs3fLfEO6/JJ2oGxh2vI+y0dFaNUP1I/dOab/jdwwhpVV3+yjAxXMpHCOXqKa
         x2zAb3sLE+AqS3v9c1/VmrOLiAL2GSPI2n1v2WoVhLL4rHqnBYPTzJxWPapbU4sMolKm
         25OYHmx25YgAGzKPLPo6Xb86ti9o2ziM5p35joMvw2z+P5KHa2yjIY7I2+DLVKKAVjvx
         a9Ng==
X-Gm-Message-State: AGi0PubTBNxVglk36TwX5NtgAH61mw+OA6GW0eckheWy7+y0dmDYD2o7
	7L+RXCpE2krr151BZ1vMeT+F6ysvDUkXAg==
X-Google-Smtp-Source: APiQypLo0X/e7VLZC/h/SL3arLxrTp2plgYjSEQfEfCrzraWh3lDVcsvLPe7j96lD7KPNbgT5hEBFA==
X-Received: by 2002:a05:6214:18d2:: with SMTP id cy18mr15728850qvb.30.1586815369248;
        Mon, 13 Apr 2020 15:02:49 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a879:c5d6:85ec:e8ee])
        by smtp.gmail.com with ESMTPSA id k35sm9899898qtc.28.2020.04.13.15.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 15:02:48 -0700 (PDT)
Date: Mon, 13 Apr 2020 18:02:47 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] optee-os: unbreak parsing when arch is not armv7a nor aarch64
Message-ID: <20200413220246.GA30105@kudzu.us>
References: <1586716262-14355-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1586716262-14355-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 12, 2020 at 02:31:02PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> When meta-arm is in the layer stack, parsing will break for unsupported archs,
> like armv5, armv6, etc. Unbreak parsing by defining null default OPTEE_ARCH.

You beat me to it.  Pulled into the master branch.

Thanks,
Jon

> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arm/recipes-security/optee/optee-os_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
> index 47ced12..3217498 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -22,6 +22,7 @@ S = "${WORKDIR}/git"
>  OPTEEMACHINE ?= "${MACHINE}"
>  OPTEEOUTPUTMACHINE ?= "${MACHINE}"
>  
> +OPTEE_ARCH = "null"
>  OPTEE_ARCH_armv7a = "arm32"
>  OPTEE_ARCH_aarch64 = "arm64"
>  OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
> -- 
> 2.7.4
> 

> 

