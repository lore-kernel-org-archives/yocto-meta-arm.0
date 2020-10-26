Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web09.3839.1603745043677916595
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 13:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MjAGOnmb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id w5so4989591qvn.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1KILKucysOC9F/mjofuGCawAak71OzKXyNxoOb+vs0w=;
        b=MjAGOnmbmdYt8TLOKk0vs3n5dmu/oblU3oYpiRGWaW5YndJ2ZSOm/qJqjmH08aMT/s
         IXE3Vr53D8vDiSs48ic0dpkluZrwWBCEDsz12czMmB6am8pTJGgYHEY7CBdAEJCe2WjX
         OJRC8jS+BavmeKZYh98Xa1br/tC/9vgHgbvgY7vVO7cMYW6LIo0DYLOFoRmJnFlBLms0
         V8+Ny35lEtABLS36KDqcvS38NTfjFX2JeWgDnRwE+DbHIx9w1DmX35btKcm8dUgWjupw
         gFY4UYaw+D7WJRQ4uJ6PTyXwp065qcd2IPC2Xopgo4+9kRSE1PiTZHrWmjlnyxm+l4i5
         xZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1KILKucysOC9F/mjofuGCawAak71OzKXyNxoOb+vs0w=;
        b=Xlx9N7NdEYDTXop9ig42TtztfR7Ti0bwa2aRx9IZiumOh2A/EH7GTIwk8Eg2oNGMtb
         IwVY8yh08ZEozdqZLqPjJ4/7BV5HLzpInXSv+7XX7ZL2UUV0iAikgWSQW+B1cmlKw9h4
         9yZEOoDZTAUfgWffynU/CTUSjySYHel1ujVlbLzmWAdRqDhAAbFWsk0fJzuMYOwp3Uda
         +9nRxBK20cMmYDWn7bFItKbkdTjzcmIejNEwW9gJnpKQQWuNvsWYlAEMq4p+kFUPrjUT
         Bf/btJGWZTP7PeKuTxJMT7ZZH2GfsGs/u0HgW2BH1qysNPHuVkUJpql0/2wzk3FjfbG7
         ChkA==
X-Gm-Message-State: AOAM533o4uHb/XWVEoTukpV05g+33oHMu1+0qqPGyC+1Zad3NLYUgltJ
	iQdnl99CqjdRtdGepU3+hn5JZw==
X-Google-Smtp-Source: ABdhPJxZMkIUnm6/oO6vU/5JguMHpfpZ7uG0ECA1Y912rBY7fn/e32HBFLz/u8RVSgOavJp0W4kwcw==
X-Received: by 2002:a05:6214:11e4:: with SMTP id e4mr14298244qvu.61.1603745042744;
        Mon, 26 Oct 2020 13:44:02 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id j2sm7514460qtp.27.2020.10.26.13.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 13:44:02 -0700 (PDT)
Date: Mon, 26 Oct 2020 16:43:57 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/8] arm/edk2-firmware: add variables to ease SRC_URI changes
Message-ID: <20201026204357.GA14261@kudzu.us>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 09:32:05AM +0000, Ross Burton wrote:
> Some platforms may want to switch the edk2 or edk2-platform SRC_URI to
> for example the landing-teams staging repository.  Add variables for the
> base URLs so this can be done surgically.
> 
> Change-Id: I32612d164f77f9e63e8498c129b512c353b04eaa
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> index 39a041f..f3fb491 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> @@ -11,10 +11,15 @@ LIC_FILES_CHKSUM = "file://License.txt;md5=2b415520383f7964e96700ae12b4570a"
>  # EDK2 Platforms
>  LIC_FILES_CHKSUM += "file://edk2-platforms/License.txt;md5=2b415520383f7964e96700ae12b4570a"
>  
> +# These can be overridden as needed
> +EDK2_SRC_URI = "gitsm://github.com/tianocore/edk2.git"
> +EDK2_PLATFORMS_SRC_URI = "git://github.com/tianocore/edk2-platforms.git"
> +
>  SRC_URI = "\
> -    gitsm://github.com/tianocore/edk2.git;name=edk2;destsuffix=edk2;nobranch=1 \
> -    git://github.com/tianocore/edk2-platforms.git;name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
> +    ${EDK2_SRC_URI};name=edk2;destsuffix=edk2;nobranch=1 \
> +    ${EDK2_PLATFORMS_SRC_URI};name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
>  "
> +
>  SRCREV_edk2           ?= "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
>  SRCREV_edk2-platforms ?= "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
>  SRCREV_FORMAT         = "edk2_edk2-platforms"
> -- 
> 2.25.1
> 

> 
> 
> 

