Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web12.654.1610117359720736599
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Jan 2021 06:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=GOTIAiCA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.177, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f177.google.com with SMTP id w17so10466359ilj.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 Jan 2021 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3EkofLouOnvFCfl7/DX6Pg10cRCNz+wqTWgBT5R3D54=;
        b=GOTIAiCAyE7fWYmaP23/8u8P4NLNWy+S6zPEfP2YgTbmCjs1c8Xu5/DpHJUnPKybDX
         X1EMsq7dEoShXdudxJLcG20W9mjv5JBM2MaT9opLjTGgoVcfJt+6OUvQOWJneLD6XFCw
         yWHO1N/jQeojV6knTKcvPmeufv8MMBxD3o/x/cjTYENmrJrlemxZuHVDgerWef29OqDl
         Mf5NevG+aoBqwBMjzBS5YhROgY9mMVINPb6EYm0BfpnllsKp3w3Kmlhu2G/sTV5wj8G/
         MQr+HVNjEHuR+GVqd1Pk06X0T6fSLNM5TYbafcnNaiWEPDPRA+Dd1/st+4GQfgp3a8uL
         WtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3EkofLouOnvFCfl7/DX6Pg10cRCNz+wqTWgBT5R3D54=;
        b=RrRy2wjGwmA+d4U/I7i/Y7mBODXFXtlDINdJ8YCQPgH5roSslz4rigHzX5WLygM1yC
         qx9+RQRKFscszSwybmxLOL1t9fiZxKzQ0JWw5qpObNCDdDMpxdrIOXdS7QVh3vypLZpr
         +3YXk6zRlENPeLHylm2HgCJ/jUuIaMwaH9OaZjm6knJuVWYwGCrUnuwxFPXvIIJ6I+71
         mLw1h18gsV2isKdYuyYeDO5RUsTsavrGQBQ0PMY5ywBIL0b6l3e0OWUo3Gzge0bh4BJm
         H855PW26DRriXMLQwbjJ59VGSDqYBDiVB5d2EasjSDrf/WVy9ONXWJQn887/rHw0DLLn
         6b1Q==
X-Gm-Message-State: AOAM531nOYtHUgMHNBl+kXUv5gk3KOKrRVDmqIs4RuyqOkJFXBUqlO1d
	a/umZuo4eWv4ezKGF54hHF4UFMV+u5jQWQ==
X-Google-Smtp-Source: ABdhPJz8ICyYfD+N5lHy8Ri5Wxv0gAFLk5IlvfRohDnVjqG0HRXv3KN9afxQ9hbauT18CtxtbqUSag==
X-Received: by 2002:a05:6e02:1c8d:: with SMTP id w13mr400493ill.301.1610117359195;
        Fri, 08 Jan 2021 06:49:19 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:10b9:360:420b:282e])
        by smtp.gmail.com with ESMTPSA id p5sm7224006ilm.80.2021.01.08.06.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 06:49:18 -0800 (PST)
Date: Fri, 8 Jan 2021 09:49:17 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain/external-arm-toolchains: add upstream checking information
Message-ID: <20210108144916.GF29567@kudzu.us>
References: <20210107142543.3871962-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210107142543.3871962-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2021 at 02:25:43PM +0000, Ross Burton wrote:
> Change-Id: I08168f5369eafb590d7cdbc972320c852d4252b3
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Pulled into master.

Thanks,
Jon

>  .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb | 3 +++
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb                       | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> index 221c07a..5df3727 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> @@ -19,3 +19,6 @@ SRC_URI[gnu-a-x86_64.sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee
>  SRC_URI[gnu-a-aarch64.sha256sum] = "041ca53bdd434b1a48f32161e957da1b84543c373d1881e2fd84a1579f87f243"
>  
>  S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> +
> +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
> +UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> index ede9ae9..a9f8079 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> @@ -15,3 +15,6 @@ PROVIDES = "virtual/arm-none-eabi-gcc"
>  SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
>  SRC_URI[gnu-rm-x86_64.sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
>  SRC_URI[gnu-rm-aarch64.sha256sum] = "1f5b9309006737950b2218250e6bb392e2d68d4f1a764fe66be96e2a78888d83"
> +
> +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
> +UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
> -- 
> 2.25.1
> 

> 
> 
> 

