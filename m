Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.4476.1588243327718725287
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 03:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S6gJA9Bk;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id g4so5964580ljl.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+as28R5Ljea/aruk6g7cfFzvK7Xj2hEWFuwjtXa92gI=;
        b=S6gJA9BkbFGIqDWNd2Gmkd1jzuegw8ko0QJcmCBodVnxBCWmUvlRWd/APtg6Whpydg
         liiSwbO5nV0B/Tz6f3b1aaOrVABW3KUpPSkHXqXYYC0SFhbO21ADim3sC2xxMxhq/Ox7
         GVFC+XVIXNxezHOIRKl55b+hNWVIs10yjogkOefrN+OUVcw8ulO0flFTRqo15x8Zmszy
         PoxiFH2XNEjwCSxl30FAjMaUAwMwuBB71xlgcTiBoIfS4bwaHk8BZvQWsY7z4eGC/+1b
         S7rcQetDwKw3IGJeoJEDnZnIbV5pwnhvNPem28BWaRQRWZiORgYGf1d/K2d+tQ5LyyJm
         LEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+as28R5Ljea/aruk6g7cfFzvK7Xj2hEWFuwjtXa92gI=;
        b=FXFlCNLRl9NmEj07HA15MBhqaNVuRUy6IRD9xTHwD+KRiuqgekDRIXyun7QZrIYyKs
         nU2rp83Mnq1MGjQvYJu7MDDQv9d6Zb8x7GzJRgC5MBvSeqKFOouCYjp+N6tLgHKpl85w
         UNErFSH2S+SFm76PxNEG2UMvvTiKmK93V0DirFPxTbQA0G0o+5EBIROkrBiAejFXvudW
         g5QDedq9a3Czz2bheqRE2mnH6rLzzLwDeuQZjBlDCWVX38pkp8mBEv0hoyg+fbmpV/oi
         r9mFNAEQPdCzjrO8Q/vVOVAGP0ALTeYHBgf6/cJDTbunyYwaJVS3FaV9qrLIp3h9TDts
         6+PQ==
X-Gm-Message-State: AGi0Pub8Aq1DdrtleZNR0B9Jdfw1yfGKxtq7ZBQzavXX9I3oltfSfn7q
	WSlMfRIkP2E2DJWv7wrZDqip+DwV31RdSNaaHwL0m1N3vBA=
X-Google-Smtp-Source: APiQypK7gQCEIOIL9toucgGOJRGRyVf9J1vTEKJ/rVOi0NNi6LpsQ/fLIY2XicuM/BJrypMsECxlWG9e6Hk79L3geWI=
X-Received: by 2002:a05:651c:230:: with SMTP id z16mr1753440ljn.185.1588243325542;
 Thu, 30 Apr 2020 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <1588219828-34791-1-git-send-email-denis@denix.org> <1588219828-34791-4-git-send-email-denis@denix.org>
In-Reply-To: <1588219828-34791-4-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 30 Apr 2020 16:11:52 +0530
Message-ID: <CAFA6WYPpDzS7nv6q9bqfE8rLkQba99n6bs9tMV2OK_f1U8Gs_w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/4] external-arm-toolchain: drop unnecessary RDEPENDS on bash
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2020 at 09:40, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> The 2 scripts that still have /bin/bash shebang are ldd and tzselect. But
> it seems upstream had fixed all bashisms in those scripts in recent years
> and OE-Core versions of those scripts use /bin/sh already.
>
> Dropping these unnecessary RDEPENDS on bash actually significantly prunes
> dependency tree for simple BSP builds like u-boot, etc.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb                 | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index adb2fdd..af75e6a 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -114,6 +114,8 @@ do_install() {
>         rm -rf ${D}${bindir}/gdbserver
>         sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzselect
>         sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
> +       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
> +       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
>
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>
> @@ -421,9 +423,6 @@ FILES_libsegfault = "${base_libdir}/libSegFault*"
>  FILES_catchsegv = "${bindir}/catchsegv"
>  RDEPENDS_catchsegv = "libsegfault"
>
> -RDEPENDS_ldd = "bash"
> -RDEPENDS_tzcode = "bash"
> -
>  # From libgfortran.inc:
>
>  FILES_libgfortran = "${libdir}/libgfortran.so.*"
> --
> 2.7.4
>
> 
