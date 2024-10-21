Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95658D17143
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 21:53:50 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.4468.1729547621472965299
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 14:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Fb093X+i;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460d1145cd8so18378081cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1729547620; x=1730152420; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rF02FHzBn6mmIZAdcE5EsjodvOr8Aw5cb8s+bG8UKV4=;
        b=Fb093X+iBqZecz6RwSmmF2GSCkCvNb6oExa6+0qKLZUkWffS1Rjr2KlA2OOU2qNUW5
         19mtzo3aRPZpJgrpvlypizWRzkMgZECCMnV1iTPbVx6YHtjZzFZF0EzhIbE+V57Konkq
         VLoSX6lWVKgB3Kki+ZpDllkR+8NDIdltRHLo/fq8AGfCIJh3gTY1vPzKTZaOgIO1k5rD
         2Gik+oLd2n0B4h2CMVxqUrVUPDF/J0XKiI5l/7Y8xGrOQ8sIkINB53zl2QOgwmiMvNN2
         2SgLea+FL2CY3ozlsZbecafi9whyCHG+JT0uV6GykQ12LWDi+qg3sv86BghEbOwI4QH5
         E/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729547620; x=1730152420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rF02FHzBn6mmIZAdcE5EsjodvOr8Aw5cb8s+bG8UKV4=;
        b=h88d4KxsRgsCxWjfJgXfG0kiRIfqEdT2d7p5x0cRf6IkUNzE+kvsjVsxo7HiDx5/yU
         17aIbZ5QFd3xnU057mxiQ7ru0Bo7ul7tUrtbHF6wmOiac9z19qUx4gwBRZKJFsreZg2Z
         0a2KG54B7wE+NfyJt4jrzn3Sw+3L8PjnvR1R8wXyV/9BrrnhetxORC4fVOJ0V2wPrzK+
         97iv40mNPA+IN7DhmEhLUh2H0KtPebhkxDLvZzj6wLXjdwbsU4hCNf/DIjjBDwA8OnBX
         D9YtRW1LkZ5wt1ljaNp9+NE3StbHZFUhZSp2mw5y3SeR1cwlYiybqfewn8aJ7sLhcPUJ
         qwzA==
X-Gm-Message-State: AOJu0YwhVLGLdAQ9DWoBzBEuGz5r1w57ia3g5MO9WsNiugM2jh/MLP/s
	D2NNFbX1w41yZslCwh2U0cE4oK1tjUKaXSxNJvbEXhK/2+YAmgSHG7Y2ws6jzQ==
X-Google-Smtp-Source: AGHT+IFpGD0iHZ33eg9GzUswtUxupmsU+jL5jPayIbLgz3DXDcAoaJl+YptlgDckj5e0IL8wBL5qxw==
X-Received: by 2002:a05:622a:508:b0:460:9e94:d742 with SMTP id d75a77b69052e-460f9e36639mr32548941cf.34.1729547620346;
        Mon, 21 Oct 2024 14:53:40 -0700 (PDT)
Received: from kudzu.us ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3ce42a2sm22796851cf.57.2024.10.21.14.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 14:53:40 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:53:38 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Romain Naour <romain.naour@smile.fr>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com
Subject: Re: [PATCH] CI: test external-arm-toolchain with usrmerge enabled
Message-ID: <ZxbNYoVv2bZbPcI5@kudzu.us>
References: <20241021143841.110336-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021143841.110336-1-romain.naour@smile.fr>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 21:53:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6219

On Mon, Oct 21, 2024 at 04:38:41PM +0200, Romain Naour wrote:
> We want to test meta-arm-toolchain layer with usrmerge enabled [1]
> since it produce some breakage with current external ARM toolchains [2].
> 
> Instead of using a custom setting (poky + usrmerge enabled), use the
> existing poky-altcfg provided by Yocto. poky-altcfg uses systemd as
> init system and imply usermerge being enabled since Yocto scarthgap
> (new systemd v255 requirement) [3].
> 
> Note: It must be a 32bit machine, since there are currently no aarch64
> host toolchains for aarch64 (some gitlab runner used by meta-arm are
> aarch64 host) [4].
> 
> [1] https://docs.yoctoproject.org/scarthgap/ref-manual/features.html?highlight=usrmerge#distro-features
> [2] https://lists.yoctoproject.org/g/meta-arm/message/5557
> [3] https://git.openembedded.org/openembedded-core/commit/?id=802e853eeddf16d73db1900546cc5f045d1fb7ed
> [4] 4bfa191ada5c44baaa1f4b8aabbeb314961c0134
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

This change fails CI.  

meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
is trying to copy 3 files which do not exist.

cp: cannot stat '/builder/meta-arm/build/toolchains/arm/lib/gcc/arm-none-linux-gnueabihf/13.3.1/include/ssp': No such file or directory
cp: cannot stat '/builder/meta-arm/build/toolchains/arm/lib/gcc/arm-none-linux-gnueabihf/13.3.1/include/sanitizers': No such file or directory
cp: cannot stat '/builder/meta-arm/build/toolchains/arm/lib/gcc/arm-none-linux-gnueabihf/13.3.1/include/quadmath*': No such file or directory

See https://gitlab.com/jonmason00/meta-arm/-/jobs/8143315096

It's fairly trivial to duplicate locally.  Just run:
./ci/get-binary-toolchains
kas build ci/qemuarm-secureboot.yml:ci/external-gccarm.yml:ci/poky-altcfg.yml:ci/testimage.yml

Thanks,
Jon

> ---
>  .gitlab-ci.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f211ea97..0e9ad688 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -295,7 +295,8 @@ qemuarm-secureboot:
>          TOOLCHAINS: [gcc, clang]
>          TCLIBC: [glibc, musl]
>          TESTING: testimage
> -      - TOOLCHAINS: external-gccarm
> +      - DISTRO: [poky, poky-altcfg]
> +        TOOLCHAINS: external-gccarm
>          TESTING: testimage
>        - KERNEL: linux-yocto-dev
>          TESTING: testimage
> -- 
> 2.45.0
> 
> 

