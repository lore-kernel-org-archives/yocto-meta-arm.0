Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.7562.1623316432577794268
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 02:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Z+pniVrr;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id i94so1404469wri.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Jun 2021 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FsxmQPqqPdakhOYjVGrerDdAJ6Fn/WuN3gQnLNiJpBY=;
        b=Z+pniVrr7aBpAb0WFrB/AS6JGDqfbNuoJM+bsWFKW1qzT0UK/GdenTKrHYS/4QymND
         XnEBaD2AUkHCncc4FiDgj/kN25S/0uC/Udaupd6bzg8zy2IxXxximAFSgJ59oBWTMZEX
         I1Vk4iFGQLtKmmEGIVw+RuOliXnctiOYLtSZ1eloMWdXNJjC+MPsh6MKJtS8PA0E8Dya
         p+IoR8tQE+WYDYnkJzZb4JUPc8Tt5j2YKJ94jehxOtXD7IZOt5k6l21QFyuu2WU/Lj0F
         aV2Prb0aGfegR1ES4EIIr5IfyhGkwcalQrH3dHDvOG5hjoubEfd/UaENICx/h8SDaD3R
         2Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FsxmQPqqPdakhOYjVGrerDdAJ6Fn/WuN3gQnLNiJpBY=;
        b=aJrYn32GKQIDCjgm8xvfE1RkS1pIPUGw9YCWyeeF/9gA0bTN/IhyPGWmiyiF5MzVGo
         kibng+KpdFTAO/0eOgMFlRE3BAh719PKlfpd/iSQIrsuKMmUD5HUY37ohBOIPayrQOTW
         8HVZwFmen0S88O5c49eaKHq+IovNNUDbV3iDSSALP4bCb2fR+7COiVqbWpDeLJN+o1vw
         U+Ka1H1ttoHTk4vv9mMprhZl4uNOOVf2CcTDrWbfnjeVW897RJptRjlvJlJEH0g45Gzy
         B4h/op/TlOc2sB7snbr6ffS9zTdwHICZ/Wzx05nQiy2tTUJMlhUGsdk7SqstlNZT0hvt
         i7og==
X-Gm-Message-State: AOAM531hREqv1GyCvyOO0508u566WXjbn0xZKQAdE/a2syogVpxlC8Q+
	HYNiGckP7TEXeYPGIMbc6r/uPFS9I9lWiojKYmc8dA==
X-Google-Smtp-Source: ABdhPJyKv9kmfU/US3Oj64n75IvjoP14LDlfcqa+0bUqdHG9h1bXiznojJ20Z2I5IRoh9eA8uA0diP5yujjzFcufvhQ=
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr4277531wrv.109.1623316430672;
 Thu, 10 Jun 2021 02:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210610072255.2136693-1-raj.khem@gmail.com>
In-Reply-To: <20210610072255.2136693-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 10 Jun 2021 10:13:40 +0100
Message-ID: <CAAnfSTvnnEAoE2v4Uk+0szLuwu3Q0m1kfVG=58a9byh4AXfXqA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] sbsa-acs: Adjust target tuple for clang
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

As those files are part of EDK2 not ACS, this should be in the
edk2-firmware recipe itself.

Which leads to the questions 1) why is this a problem on acs and not
edk2-firmware, and 2) how can we fix this upstream?

Ross

On Thu, 10 Jun 2021 at 08:22, Khem Raj <raj.khem@gmail.com> wrote:
>
> Current settings assume glibc tuples and hence when building with musl C
> library clang can not find correct cross tools and system headers and
> libraries
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jon Mason <jon.mason@arm.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> index 173cfa7..20d6534 100644
> --- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> +++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> @@ -24,6 +24,11 @@ EDK2_EXTRA_BUILD = "--module ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf"
>
>  PACKAGES_PATH .= ":${S}/edk2-libc"
>
> +do_configure_prepend_libc-musl() {
> +    sed -i -e "s/-target arm-linux-gnueabi/-target arm-linux-musleabi/g" ${S}/BaseTools/Conf/tools_def.template
> +    sed -i -e "s/-target aarch64-linux-gnu/-target aarch64-linux-musl/g" ${S}/BaseTools/Conf/tools_def.template
> +}
> +
>  do_install() {
>      install -d ${D}/firmware
>      install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/*/Sbsa.efi ${D}/firmware/
> --
> 2.32.0
>
>
> 
>
