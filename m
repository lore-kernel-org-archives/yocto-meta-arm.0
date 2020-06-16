Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.10350.1592313819423142373
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=2AgH7hMX;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id s1so23531631ljo.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jun 2020 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wpsprodmi6o2SZhfwjqwF8NbUkQIcib5O2y2k59bPG8=;
        b=2AgH7hMXh/No97MGtrTqmu24TxxWao5G4kqpUQXf8IK9GB7Tg0ksbB5zjMvEcM979S
         ufJDU4xkFf5Z64T0gtkOTUs29190o4xsTt/rA84FUXHQQIAofPxTk6opETKV+21LGp29
         qofYMy1ECcYiVKZheukHf86fTc9gj8q8MG6E6QVKPdAPn+KoCaUNJwHiWY4fRUTltLpD
         0pFCvqsJJR5H3oT4BaPg9sIrK5hGelWYw7zh7LbiSf8qWF+WW5n6bK+GDFrjLmgFGM4Q
         oktpcFM4DtCjihAsbbHG/rm55SGa8jnDVzIxT9wPVGDKoN8eNGGL6cmSG7ZCArRSv/FB
         ttPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpsprodmi6o2SZhfwjqwF8NbUkQIcib5O2y2k59bPG8=;
        b=KTZnT7qFXwh8d6zQwW596pGIzzQ7qMFl1Ahi+tZ4ZbfdSnL+zyDS38QPWqzeUR1IpB
         ZUGsutcsZsc0GEngRadj0lb1kKtHlwhErChDB8PTMd9A3gbJbP9YiVlB7ntWkkVk6QNl
         +th2RDYU86AP0qy/i061BggbjCKW32xKykNm3mbnVtSB2MDs2Ly9bkIOYPDMXnSJ6JFl
         /WFxsEh8OiylNKa+HQgvEDEDeyx0ApLsMIS9FwVKZGHW1i1pEdnEX9Tsu0OPN5VSsd69
         uiWRRCF7fn5kb019DaXnkdoQC34GAo3IrNx/yhcry3ROmRiQrWK51dhevFDg+4ZfXUiS
         lXpQ==
X-Gm-Message-State: AOAM531tXvcqmof1Za0mJf+D3hFMkU67pyYGwdffCIv5oEr92LOuEiXA
	RvUFMzx9pvGfMpSfYIhQhT60puS5luq3DYGwYzSH+g==
X-Google-Smtp-Source: ABdhPJzX5CuYx+Ztn7a/VK1kVT8Hrl2ScyQIQMD0Fsej8UZ+jpCuKhuShlgYZKmmWI7vReU4G9SNTd95WC71P4+Lw6k=
X-Received: by 2002:a2e:a0c8:: with SMTP id f8mr1358384ljm.352.1592313817444;
 Tue, 16 Jun 2020 06:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200615162727.8810-1-khasim.mohammed@arm.com>
In-Reply-To: <20200615162727.8810-1-khasim.mohammed@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 16 Jun 2020 14:23:26 +0100
Message-ID: <CAAnfSTt8i86vxZqerhk_iT377UC0WBWKxZXezKc7pF9F_h_TYA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta-arm: Fix passing of linker flags
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com, 
	Diego Sueiro <diego.sueiro@arm.com>
Content-Type: text/plain; charset="UTF-8"

Commit summary should be something like:

"arm/edk2-firmware: fix passing of linker flags"

(yes, Diego was asking about commit message guidelines yesterday, and
I have a patch queued to document this)

Ross

On Mon, 15 Jun 2020 at 17:27, Khasim Mohammed <khasim.mohammed@arm.com> wrote:
>
> The build initially worked because host machine had
> util-linux-dev installed, the build failed otherwise.
> This patch will fix the passing of linker flags.
>
> Change-Id: If2f31e8e31109b9c8fd62b32d2f80902a1dd3cfd
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 7b9327c..6696768 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -48,6 +48,9 @@ python __anonymous() {
>  }
>
>  do_compile() {
> +    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
> +    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
> +
>      # Copy the templates as we don't run envsetup
>      cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
>      cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
> --
> 2.17.1
>
> 
