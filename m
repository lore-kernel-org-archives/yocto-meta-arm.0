Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.269.1586815522575125642
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=nkfe6QJA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id s30so8565325qth.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Apr 2020 15:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SpByIZcIfXhNnGYByRx/yNQw4BeSDNfBRt75L8Y4rts=;
        b=nkfe6QJAhpLQyurv+KSwYRSGFvn7DUEVZhkiDJ5t849gN1nBVTlvhZOUoJLOElbGBO
         YGW3kqXKFa839CoeBqFJ2pAn8fIsRdd/bBeOTzsYypIPJKagxSN0pljgLiEXH3jwGLsM
         W3MNOI7AfOjWNFYu9ZErQfMuFNquxQxXMPK3ZayQeBZdMzeYYJB6z4k9ToWqpUlENwsf
         bTF8cvmEpqoZPqQ5Nr3kGQahLJZZlsXDEfWF01RvBR3Pb09rPuN3t28E/5TaJUZNmXII
         SJJhKgV6Xjk3hxIiJIgOxN13kqpH8ozamX/fd4pzbM75FORdq+D/KK1RWMcABhPKDFA8
         DRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SpByIZcIfXhNnGYByRx/yNQw4BeSDNfBRt75L8Y4rts=;
        b=LFv9pj3fLrVDIeWZnS6MRbnC3vz3urDpzTOgfMfuc5jEndEFGrTpnbLwlHk4Bb8Wdz
         idjsXWXeJLzSA7vowaaD/4/dhuwZQvbO0l55hmXnfxDMNUOjIB7B9Cvd6g0q13InJKoL
         z2PyvgMgrmndXUTX08XPnNVdgS4FYwrSQudU/WktD99HFftVq232ov6gsN3QXA0AIbeF
         ilVCRSJiyKYTmrW5C9EPlMZYtUhIkaZNAuS/uVSM1FHfTykaa9VLNypJo8MMPRuPbPsW
         8N2m7XtLujCrqSw9n82Y5oRTb5bQjP3vszra3snRKJds17sMwADrVExMIEw0bUU+axqW
         0qwg==
X-Gm-Message-State: AGi0Puahj/MXNn0PidDDVOfhq9Rfo/v9ir3xPBTzUdXoTIVea68F267G
	3Ritu1jF0FU9HpqxQ7FCGCQYqJer5/F1Yg==
X-Google-Smtp-Source: APiQypKPeuZmQJ1MxTTuGAdQMeQSsI9MFdl3A0Ak9DsxRYioW3k6O09CutDAxeDYPGugOz+sM5md5w==
X-Received: by 2002:ac8:7246:: with SMTP id l6mr13422574qtp.298.1586815521558;
        Mon, 13 Apr 2020 15:05:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a879:c5d6:85ec:e8ee])
        by smtp.gmail.com with ESMTPSA id u17sm635225qka.0.2020.04.13.15.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 15:05:21 -0700 (PDT)
Date: Mon, 13 Apr 2020 18:05:19 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
Message-ID: <20200413220519.GD30105@kudzu.us>
References: <20200412054531.1804159-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200412054531.1804159-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 11, 2020 at 10:45:31PM -0700, Khem Raj wrote:
> all arm SOCs may not support optee and there are non-arm machines too
> this makes this recipe fit into mutli-BSP environments, platforms which
> support optee should be specifically called out via COMPATIBLE_MACHINE,
> for general case it remains 'null'

Pulled into the master branch.

Thanks,
Jon

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm/recipes-security/optee/optee-client_git.bb   | 2 ++
>  meta-arm/recipes-security/optee/optee-examples_git.bb | 2 ++
>  meta-arm/recipes-security/optee/optee-os_git.bb       | 1 +
>  meta-arm/recipes-security/optee/optee-test_git.bb     | 1 +
>  meta-arm/recipes-security/optee/optee.inc             | 2 ++
>  5 files changed, 8 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee.inc
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
> index a25d343..bae7b20 100644
> --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  
>  PV = "3.8.0+git${SRCPV}"
>  
> +require optee.inc
> +
>  inherit python3native systemd
>  
>  SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
> index 768a55b..996e2cd 100644
> --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> @@ -11,6 +11,8 @@ DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  
>  inherit python3native
>  
> +require optee.inc
> +
>  SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
>  SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
>  
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
> index 47ced12..5c420b7 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
>  PV = "3.8.0+git${SRCPV}"
>  
>  inherit deploy python3native
> +require optee.inc
>  
>  DEPENDS = "python3-pycrypto-native python3-pyelftools-native python3-pycryptodomex-native"
>  
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
> index 752d75d..ee73a2c 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_git.bb
> @@ -6,6 +6,7 @@ LICENSE = "BSD & GPLv2"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
>  
>  inherit python3native
> +require optee.inc
>  
>  DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  
> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> new file mode 100644
> index 0000000..a12521d
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -0,0 +1,2 @@
> +COMPATIBLE_MACHINE = "null"
> +# Please add supported machines below
> -- 
> 2.26.0
> 

> 

