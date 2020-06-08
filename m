Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.32966.1591631200354788760
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 08:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=G+op5ia1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id c12so17645753qkk.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h86B+x0ajtEy1S7a+yNrr7RvFgmsEODvp2BPDnY69Es=;
        b=G+op5ia1And2YZ3LJeW0gzul07VeK6cSwe6XrEHPFKKaEqAablTHilqpYKbqB+GORI
         Y4X0Fejhy8gSFz7ZyGfYkI0Y0cbdvz0y0AM6nFUxNsBAIpmG091tC5xGjRys92wH7TW6
         QdudB8AoMQy3Iwy/ErwLIf6HzSXSNvFyFWogNtIWMp+onxIrooHqX0HewnEffGgX7lXe
         COAuWsaKTM+X5ClzS18MYYcWYpE2XnR+Xn5uFPC1zUCweLAGxbhdlVtjO1Ks5bewetYg
         vQ5aQZjxXRGTpiix4xZxiuVk225GC/xfO94KfegsvUFQyJZ2LgXTtC5AWyBj+AVd8iUU
         aJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h86B+x0ajtEy1S7a+yNrr7RvFgmsEODvp2BPDnY69Es=;
        b=RB1p/HBsR3Rg/GQmPuZx+OkddQqVuP8gHU/MIi3fzgtwKCSAHm1AUY89NQuwmQvGOg
         I0e/qpwCSFzcvslTVDIrKMyy6Qy7mZd6xbMMTQeq/SrJGqPGwpnLNsOXU/XyblN0zBxn
         W19khqrIRMAkgKKvoDyiftXziRFMAaox3gP1XCn6lWyFPVBPYr80gF+O008Qi6xTxsCG
         tsNJsdLyQulusb8BvfsVD112wD9UoHgCbIkQWZFOpdMVsWRdb8vqrFwnKH7XPO0hMyUI
         7nQVrFf46dpK3QE9FT+zMqDRvo2b0uIwl5YBGFXzD+QPJzYISxmcV5iYIehM6pB7nllj
         2peQ==
X-Gm-Message-State: AOAM530zsbgHHJhi5GWPW0rqJ9WMyFRAmB4UZfphCrTb8+bocToAwl1S
	tOA1MIKL//fCaUPPFEZFOL+AdQ==
X-Google-Smtp-Source: ABdhPJxD92ni6sJxnk0HuHPUyXKDXRQQYe0A6kaZoHI8OqL5Sa29anC2aFulk39xmULgEwTadGeAWA==
X-Received: by 2002:a37:ba84:: with SMTP id k126mr2298168qkf.500.1591631199364;
        Mon, 08 Jun 2020 08:46:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:b9b3:35e6:b1bd:2c87])
        by smtp.gmail.com with ESMTPSA id p4sm5785373qkf.53.2020.06.08.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 08:46:38 -0700 (PDT)
Date: Mon, 8 Jun 2020 11:46:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH 1/2] gcc-aarch64-none-elf: properly set ${S} that is different from default
Message-ID: <20200608154636.GA15959@kudzu.us>
References: <1591397830-45965-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1591397830-45965-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2020 at 06:57:09PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Also use ${BINNAME} and ${PV} variables for automatic substitution.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Pulled both of these patches into master

> ---
>  .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> index 1e4689c..91daf08 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5
>  
>  PROVIDES = "virtual/aarch64-none-elf-gcc"
>  
> -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-x86_64-${BINNAME}.tar.xz"
>  
>  SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
> +
> +S = "${WORKDIR}/gcc-arm-${PV}-x86_64-${BINNAME}"
> -- 
> 2.7.4
> 

> 

