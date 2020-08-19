Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.95574.1597863751302527082
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 12:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=CjLfyNUb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id b79so22578193qkg.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Aug 2020 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1HMhH3lH8Y056dngAtw2jOucN2jDLGkxvhYZdoJrVhc=;
        b=CjLfyNUbsHsDjc2PWQXxuwvbHt7ctSDRsDr18nvDpE1zsz/pE4+XlnJrcxtfWCBedm
         hRIgtiEspg74vIXhoMD+0G8mNts9HUPwCF8szfyi5rpf+XLH6n/O+ChKS5Rs/Dn20RJM
         5LFQut18szfTPK4p9f4ojkKXCvHEumHEM1MT4Sti4lfEx59GivtuGtISdG2Z4jUsSLP0
         ZzziZDYRWYRjFz0AkQM5JToPbOAuSYCrxKq/8HeP+I9/3or2Hs4FLJilNaz6n4vK5+mO
         GmNeKdhI06Tj5h4AdetR6KbiyZashDESkDfW6vHUxdmKrJkzjYm+UBlSi1AYYiXAkQyG
         05zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1HMhH3lH8Y056dngAtw2jOucN2jDLGkxvhYZdoJrVhc=;
        b=sU71oQkTmgNtmXewvjvL59HtNXx8Sosccage6B+NIQRJa/V4n6DOAGmeTgt8g7Vphg
         q+sN9tqOQOa+ogbdEmrB2KwkF0N67+sefkgrOWS7toK6nyUCDdewrUvSSFfDEcyrSt84
         i2fWSbFf7LddzAmZiUD2+clGOMIm7ablEVcADEiHZ1CGgr/nMmwoyRrafB7w49IM/3nz
         2hJgqLbxsmAZv4LZ5bcQXdYRmPprlHTXnfP9jtOo/FxjidQQ99MFVeiGtUUUshQ3kFer
         ma18Nry1EX3l9CXTNzyBLwzMJNP6higrcxD/KnIcFL1vX0Xi49XdEWi+SK02hCpsI/+T
         848Q==
X-Gm-Message-State: AOAM532ZfBU085Pnni4dPn6hWsq2bvFUd1I7Olm6FLpsyHIUzOLKHoV/
	YNmfmBAvOpruRVAoAbhJur4GrdhcdADCoN1E
X-Google-Smtp-Source: ABdhPJxzjfFiykcPkBbshkSLnl1tko4Epi9rJ6c2Kmj6OedJ7ZZT2DrGC2+swRMSXX36CyNkib5AjQ==
X-Received: by 2002:a05:620a:21d1:: with SMTP id h17mr22389697qka.292.1597863750470;
        Wed, 19 Aug 2020 12:02:30 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:85c0:21f7:2371:875f])
        by smtp.gmail.com with ESMTPSA id q126sm24215481qke.34.2020.08.19.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 12:02:30 -0700 (PDT)
Date: Wed, 19 Aug 2020 15:02:28 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Remove unused kernel recipe
Message-ID: <20200819190228.GB17082@kudzu.us>
References: <20200819125755.23051-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200819125755.23051-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2020 at 08:57:54AM -0400, Jon Mason wrote:
> Change-Id: I4203a6d4536702a701055b511fc2b9a27868082f
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../recipes-kernel/linux/linux-linaro-arm_4.19.bb     |  7 -------
>  .../linux/linux-linaro-arm_4.19.bbappend              | 11 -----------
>  2 files changed, 18 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
> deleted file mode 100644
> index df8ba4d..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -SRCREV ?= "e97e8d868aba53467039dbef3b7436c857433ae3"
> -SRCREV_meta ?= "69022e62eb6c7046c84dace4af66ee8a30865865"
> -
> -KBRANCH ?= "latest-4.19-armlt-19.01"
> -KMETA_BRANCH ?= "yocto-4.19"
> -
> -require linux-linaro-arm.inc
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
> deleted file mode 100644
> index b1bc72e..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# Add support for Arm Platforms (boards or simulators)
> -
> -require linux-arm-platforms.inc
> -
> -KCONF_BSP_AUDIT_LEVEL = "2"
> -
> -# Functionality flags
> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> -KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> -- 
> 2.17.1
> 

> 

