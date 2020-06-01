Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.40781.1591027990079629513
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 09:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=RycUKwQ6;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id u10so7593829ljj.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yh9FVuXonFeHuwnTStQASTvQsY2efxf62t9Dat3ig2I=;
        b=RycUKwQ6COi5B9DzjtYkmBmXLh7sahv56qjQEAb/qY+oCphvMe30+CBAJ+nko+pFo4
         45hKmyZGvwQW+5cs6FKqGKjaRtsECMOP2uEm/Y/+++sNB9EWBigfSvcvxzdLeKmlrsqE
         Gp+Wxusf6E1LTF1eGIxUzbsxv27oE8i2yYGU2PUJpsB4OBF4TYsuCNexTyqzMUHV2pjc
         1a6z6ZHDHhdTfTbYumMnuKs5pC7t0riGHBFguJ6hBdv4k3jviM90er8oz0t4p78hOi+Y
         GH7v4POa3o/8rpegbMH6QeXkYE/BD3PVKqj3OBCfHsUVlT2wBFLUMtBNQI/hjycI2Su8
         bAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yh9FVuXonFeHuwnTStQASTvQsY2efxf62t9Dat3ig2I=;
        b=WxToAfHEwwZp2E2OznBqGtstNJLLfg1mBXxm5fgxwPtV1NDbGnPBQV1ZaLaZiKPHH7
         GEldaiKKUnfLcGD5I8HkiH2SEBVi2WGbvUz2M4C/7VOcH30Zcpi/d86NliuiTVIDLD7r
         D275viPVwt5DWQ8UZ/4mYQf/2oRnwf8OugQMKesjJ8CaC+3EwX0CaoZgy42cVv6+IKT9
         l7/Pc58+5kRH0loXmEqo82m9sfx6VkUnN7Nz8oBgtXVXwfbti+8pXTGypEJEFohqHWT9
         cyim+HkdsJXtDRukEzTPbfuSH/gHtmRC9mLvCPSs8ZIBBASqJkGKOshfC/mRlhjKAUm2
         rRWg==
X-Gm-Message-State: AOAM530QR6L8Wnqcc77LKNDkIOyuma0wetdSoCjdyacdU7K15yniuJaU
	lg81xAZDVvXbdhDOGKOKcVwLVvoGJLuV5yZkYdn0hA==
X-Google-Smtp-Source: ABdhPJwJ/BpZGw2e1Ev4dS5RgRgFyvfClE2FC3qrEtW4UFPhwGejbd0akbE2xvMAc7hZfOfseh2aL9ot8L36GhL+H3M=
X-Received: by 2002:a05:651c:2dc:: with SMTP id f28mr10715030ljo.36.1591027988082;
 Mon, 01 Jun 2020 09:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200528233224.28139-1-jdmason@kudzu.us>
In-Reply-To: <20200528233224.28139-1-jdmason@kudzu.us>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 1 Jun 2020 17:12:57 +0100
Message-ID: <CAAnfSTtp6Nw9Wm4UrYvSDYY2mnpeTPfROdZLGWMO=dS6RzH7QA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: merge binary toolchain recipes
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 May 2020 at 00:32, Jon Mason <jdmason@kudzu.us> wrote:
> -
> -S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
> -
> -COMPATIBLE_HOST = "x86_64.*-linux"
> -
> -do_install() {
> -    install -d ${D}${datadir}/aarch64-none-elf/
> -    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
> -
> -    install -d ${D}${bindir}
> -    # Symlink all executables into bindir
> -    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
> -        lnr $f ${D}${bindir}/$(basename $f)
> -    done
> -}
> -
> -FILES_${PN} = "${datadir} ${bindir}"
> -
> -INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> -
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"

Forgot to include the include file.

> +S = "${WORKDIR}/${BPN}-${PV}"

That's the default value.

> +NAME = "${BPN}".strip("gcc-")

That is a syntax error.  Looking at the repetition below, maybe this
would be better (untested):

BINPATH="${datadir}${@d.getVar("BPN").strip("gcc-")}"

Ross
