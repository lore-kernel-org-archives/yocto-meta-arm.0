Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.8212.1591251202613609089
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 23:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tfD+D/z1;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id n23so5766561ljh.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Jun 2020 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QsROVGgoc3UopnnXXjsMMDQ7i49a6SH17dv/KZnMmOI=;
        b=tfD+D/z1wYZxP6Cjj1IGNcpa7SHTEai0TapBm8E9mBqwwzL/mfdNvHc98ZOICZf93b
         J30ZvxmSrXQtMIu7gFFyC3gyl8f9sh7KVjbjsS1tccMs4Un9U+YxMVehWPH+QL+RssCD
         32rYtROYGrOFOw+MvE0FXf5ss35czu2H6agt66qDdjF6PjakK49AELsGdKEuMr4wx94O
         YCD80YSexI0v704kH2qzSLigiUy17ROUaZ+QLnnYS8AJSUjdegROqtxNlWN0eEE+3SEd
         mv22Prtv0N2ina1SCAdn/IYEudLvAzKfyzzgB9AnRjwA2qQqboIexloIY6ZKEHSDflEx
         L32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QsROVGgoc3UopnnXXjsMMDQ7i49a6SH17dv/KZnMmOI=;
        b=P3jbYKDTNIJVwspAkR70CWMGhBCxCVWm4XdcJBZhf3Lo7uaYsfsi+WBEos5NLG9+Oj
         M9mIeHcxUsUvbZ0NRdNJK+4qmU3M3nwN7gT+O6qY41CAy/fa0lmiIVocK2DfPohbtr2o
         o0vYfz4Ls+DBoIY99GBO9/h/wIUlzcei0DquNFWCMn2RtB5PIi3JAmmemq7DxlCix5Zn
         5uDLDsBMBZ4tXYC38qLaht3LSXb0VnMCK415SsmsNtt37nAEUecI96TQYgzmwJvm2L3u
         Tuz8Ro+ItmYcaAKuVZuheeZ7hdWrXQVsb2xLDlcoz40jFpZu3AvUcSs/b1ebuwcnoTRz
         hkng==
X-Gm-Message-State: AOAM5321mvbI3GaY3xW1YkN2l5yqTb2zPSbjDdKwxytCKoLlL9P435Ol
	GmUzqCKVoUAxu1OOoYgdsvTuKtzg0r9Bh+1DePP9lQ==
X-Google-Smtp-Source: ABdhPJzFELAk2nzV61b50xA206et06Bah+EsezoiZUFp0nMTORckuRa40w6XNK/0UbBSEMOTsXjYPeFqiviqdMaWTZ0=
X-Received: by 2002:a05:651c:1103:: with SMTP id d3mr1421738ljo.110.1591251200450;
 Wed, 03 Jun 2020 23:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <1591230242-20553-1-git-send-email-denis@denix.org>
In-Reply-To: <1591230242-20553-1-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 4 Jun 2020 11:43:08 +0530
Message-ID: <CAFA6WYPQFSvzh9S-vF0Ap2h4fzr0dnwDr8hCDdJ7CLXo2mX4=w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: un-break target compilation
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2020 at 05:54, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Compiling on the target using runtime libs from external-arm-toolchain
> requires libgcc.a, as libgcc_s.so explains:
>
> /* GNU ld script
>    Use the shared library, but some functions are only in
>    the static library.  */
> GROUP ( libgcc_s.so.1 -lgcc )
>
> Otherwise it results in errors like:
> | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> | collect2: error: ld returned 1 exit status
>

Ah I see, so libgcc.a is mandatory for aarch32 but that isn't the case
for aarch64 where only having a shared library seems to be sufficient.

> This already has been fixed before in this commit:
> https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
>

There were mainly two reasons to revert libgcc static library packaging:

1. It was done improperly earlier leading to following QA issues:

ERROR: external-arm-toolchain-2019.12-r0 do_package_qa: QA Issue: non
-staticdev package contains static .a library: libgcc-dev path
'/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/packages-split/libgcc-dev/usr/lib/aarch64-none-linux-gnu/9.2.1/libgcc_eh.a'
non -staticdev package contains static .a library: libgcc-dev path
'/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/packages-split/libgcc-dev/usr/lib/aarch64-none-linux-gnu/9.2.1/libgcc.a'
[staticdev]
ERROR: external-arm-toolchain-2019.12-r0 do_package_qa: QA run found
fatal errors. Please consider fixing them.
ERROR: Logfile of failure stored in:
/home/sumit.garg/T2502/poky/build/tmp/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/temp/log.do_package_qa.8281
ERROR: Task (/home/sumit.garg/T2502/poky/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_package_qa)
failed with exit code '1'

2. There wasn't any motivation mentioned in your earlier commit
message like this commit does to include libgcc static library.

> But then it got broken/undone here w/o due review:
> https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=b43d5f0ce431ba1e242504641266a63293ded5db
>
> Even though it's a static library, we want it to be in libgcc-dev as it's
> not optional, but rather required for development.

Yeah it's required for aarch32 but optional for aarch64.

So you could elaborate more in the commit message that this change is
specifically required for arm32.

With that, feel free to add:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb  | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 04d8923..8cfc208 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -117,7 +117,7 @@ do_install() {
>         sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
>
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> -
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> @@ -310,6 +310,7 @@ INSANE_SKIP_${PN}-utils += "ldflags"
>  INSANE_SKIP_libstdc++ += "ldflags"
>  INSANE_SKIP_libgfortran += "ldflags"
>  INSANE_SKIP_libgcc += "ldflags dev-deps"
> +INSANE_SKIP_libgcc-dev += "staticdev"

This change was missing from your earlier commit.

-Sumit

>  INSANE_SKIP_libgfortran += "ldflags dev-deps"
>  INSANE_SKIP_libstdc++ += "ldflags dev-deps"
>  INSANE_SKIP_libatomic += "ldflags"
> --
> 2.7.4
>
> 
