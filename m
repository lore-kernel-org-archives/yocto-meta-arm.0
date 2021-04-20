Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.9361.1618918640370682773
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 04:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=sgx7ywRu;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so9813555wmf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8focbsxH1GDcXzEzOD42i+Hqvj7ath83OEZNdqfwqUU=;
        b=sgx7ywRu8TFsRKrxiYYVC4HWXgolO8YGwgJklU+fkwazwYgPOOcpmyD8eWH4vgxCkr
         RYfftV7z34jR7VZw33IcrXWzNYWreTC9BrB9LNCph2Rsalg/KlsTeAzCt0V7ElL+lNyB
         Z9tU7fqF3Cbb4VcAXwyYKhmaNclajkc0lHLYtcvePHbQanyvFgqBts4H0kGAQaydAvtb
         NQyzHZwHban5SrL8cySR+zpoX9UcIk0UBoRNGO92ERSmW5KBdtAKnJ0ECzKpQIw1thXo
         f2k/VMhi+RXzGZ8gZbh61co+4chArsvyFSWx1H73+7SNmdptCt0AOrrnUvWQjrIl3T+L
         Jgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8focbsxH1GDcXzEzOD42i+Hqvj7ath83OEZNdqfwqUU=;
        b=EarnsgQ6w+BSGA/I3KsrLBtcAf5g5mxGQdisp+QTmimyb/fH6zy+2FrchzyhJElL1K
         IDjAL5nyxet0QceWeC5mqYMJlz2HlfK5Wrx0IwJxlAsMkj8tvYq3w/JL1b+ljTTY6cwm
         a0HTzuXN7C0l2K8xpell0MpfIHwnXCKOZ2Mrfz8cejrk0TWJRWAcMEfty20pVyi+bsE7
         isOzccDVRxTxHSJIWJrpd4c5DvxlGvsFYlB3Ka75mFXjKxbtQVAWD9FInvNti76tJTwR
         MY+8/o1Wk0l9YFAYKAvcCQgG3tYeMsGHFpUgf/znfCMHXnl1xtFvUZTQj7Dxc2bWpF2+
         FC1g==
X-Gm-Message-State: AOAM5333KbuPcGsrHaaCJrNH8z1ygkvg17xXJuKm8IOAHfYSBWesymRK
	ag4L7Ok4E3+xovuL6hfpW05/P3afcMVf5G+BLXK7tQ==
X-Google-Smtp-Source: ABdhPJw2ZGuKq/EJ/9kFglUlN8b4MludII8lBG1OhbOFu9zQAkwgBelQHWiExO/Wp/MzHyt+tQzeXP29RfxslrFckOI=
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr4017570wmc.130.1618918638711;
 Tue, 20 Apr 2021 04:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210420110137.3361921-1-ross.burton@arm.com>
In-Reply-To: <20210420110137.3361921-1-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 20 Apr 2021 12:37:07 +0100
Message-ID: <CAAnfSTuZSUK=QQ=xvALUzAzhYxA99ppbRwm9FiudPvVOYVnphA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2] arm/optee-os: deploy tee.elf for u-boot
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

Ignore this, Yann sent one already.

On Tue, 20 Apr 2021 at 12:01, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
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
> Also add required INSANE_SKIP as tee.elf has relocations [RB]
>
> Change-Id: I29385c08c18b096438398c968440e5091cf222f8
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm/recipes-security/optee/optee-os.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index d3b8caa..d8dcb8f 100644
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
> @@ -68,6 +68,7 @@ SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
>  FILES_${PN} = "${nonarch_base_libdir}/firmware/"
>  FILES_${PN}-dev = "${includedir}/optee/"
>
> +INSANE_SKIP_${PN} += "textrel"
>  INSANE_SKIP_${PN}-dev = "staticdev"
>
>  INHIBIT_PACKAGE_STRIP = "1"
> --
> 2.25.1
>
>
> 
>
