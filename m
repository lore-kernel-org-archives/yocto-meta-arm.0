Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6DDECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 09:12:37 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.9606.1663665151573752979
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 02:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WjTSj0y0;
 spf=pass (domain: linaro.org, ip: 209.85.167.49,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id u18so2686680lfo.8
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 02:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UBA8LPrnv1/hk3dEaTZX+gZbBScRcslPSXirZ67WtdQ=;
        b=WjTSj0y0arhn6+wtguXK7ItLV7vPs2KxnnWXkNGMF4OGqCpq3tG2D8jbHED4EMza7x
         lG5Nq3B87Ji9iaF9R7rkTSpM2iWqnEwvfbz4txo8pX4QIVa57Ul6KK9pzZ794KooPzTl
         DsYsMuetlQqlkQ4Kv3TE9SlvwnTDnpwHqdCbBBsXqwz+FHnOjMbFnqpukDOpCxOY3w92
         r4uj1GpuMwPkLI3Kgpa9ZHAmWJyj7PjZCjng2vaeAQrpc1FG/E+/HVu3SFgeMRn/ssen
         SPOpoB+IEOMkSi8EK1X2We+AkNhxaCRr2n13rULC1jDfpe2TABGjCyMxjmTwveZEHvoo
         jlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UBA8LPrnv1/hk3dEaTZX+gZbBScRcslPSXirZ67WtdQ=;
        b=kStU7DMmeorxWEku2PNX6YhhToh5L9JzpvKWmT/+Mebq+XBTAWzRSLMLxrUaqGcxeq
         KIPYSHM8qkP3WU8qKAkd8Q8T3wU8c2soHtQwqj0g25cUDD2EfQX3p6e79rRgRrnit1nt
         9xNA8PTusUEzV/Wx0PFj/os+SqIkgsR1GDNPseoqPXYdGtOUWThvrKZoDg5zEM8mtKl8
         +BsQvesGN52G8zT25eSTCZvXqIAha0YnjEBDKMOtTn11P24ngDdjEXe0Z1mTF/TGvVx6
         zwCASzrFjmt4N4GAjesT/gE7KLVL40NU4+dhpoNCm83FqKrexpMg/jMf9htsstLgeAIf
         TY4Q==
X-Gm-Message-State: ACrzQf1Ssbxuj3CykKXNMrK8QGxccn7370u1xN/7sjmZzzWujivgg8na
	aFpDQjBCgfXfOCCB7qqxp13QjAPY5HfjuNEJ3qYstg==
X-Google-Smtp-Source: 
 AMsMyM4vVJ1c++AMHkstvaidfcNj47SwGp83mwIIAehGw4yMGbfLekRydP88ifpY1m82bQYabRou1K+6kSMyT4vttTQ=
X-Received: by 2002:ac2:429a:0:b0:49f:9c71:50b6 with SMTP id
 m26-20020ac2429a000000b0049f9c7150b6mr3772513lfh.349.1663665149662; Tue, 20
 Sep 2022 02:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220909200436.1728775-1-denis@denix.org>
In-Reply-To: <20220909200436.1728775-1-denis@denix.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Sep 2022 14:42:18 +0530
Message-ID: 
 <CAFA6WYNfM6yejkr_MSgzX9h5xzbR_Y-WVfz40nOUSpZThy7D6Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain/gcc,external-arm-toolchain:
 resolve conflict with gcc headers
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Sep 2022 09:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3789

On Sat, 10 Sept 2022 at 01:34, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Historically external-arm-toolchain recipe packaged all gcc headers from
> ${libdir}/gcc/${TARGET_SYS}/${BINV}/include - some would be picked up by
> packages like gcc-sanitizers, libssp-dev. libquadmath-dev or libgomp-dev.
> The rest would fall into catch-all libgcc-dev package.
>
> Unfortunately, that could result in a conflict with a target gcc, which
> also packages some of those files, like unwind.h or stddef.h, among others.
>
> The conflict could be seen with this config:
>
> EXTRA_IMAGE_FEATURES += "dev-pkgs tools-sdk"
> TCMODE = "external-arm"
> EXTERNAL_TOOLCHAIN = "/OE/toolchains/gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu"
>
> And the error message is:
>
> Error: Transaction test error:
>   file /usr/lib/gcc/aarch64-poky-linux/11.2.1/include/stddef.h conflicts between attempted installs of libgcc-s-dev-11.2.1-r0.1.cortexa57 and gcc-arm+11.2-r2022.02.1.cortexa57
>   file /usr/lib/gcc/aarch64-poky-linux/11.2.1/include/unwind.h conflicts between attempted installs of libgcc-s-dev-11.2.1-r0.1.cortexa57 and gcc-arm+11.2-r2022.02.1.cortexa57
>
>
> Modify external-arm-toolchain recipe according to how libgcc in OE-Core
> handles those header files by removing and not packaging them:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/libgcc-common.inc#n40
>
> Also need to adjust gcc recipe to pick up unwind.h from EXTERNAL_TOOLCHAIN
> location now, since libgcc-dev no longer carries it, and install it into
> STAGING_LIBDIR_NATIVE, where OE-Core gcc-target.inc expects it from
> gcc-cross:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/gcc-target.inc#n164
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb     | 9 ++++++---
>  .../recipes-devtools/gcc/gcc-arm-common.inc              | 2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>

Apologies for the delayed response as I was at plumbers last week.
BTW, thanks for the fix, it looks good to me.

-Sumit

> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index dcc8ebf..fab1761 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -75,7 +75,7 @@ do_install() {
>         install -d ${D}${includedir}
>         install -d ${D}/include
>         install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
> -       install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
> +       install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include
>
>         CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
> @@ -104,7 +104,11 @@ do_install() {
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> -       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/ssp ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/sanitizers ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/quadmath* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/omp.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/openacc.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
>         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
>
>         # fix up the copied symlinks (they are still pointing to the multiarch directory)
> @@ -495,7 +499,6 @@ FILES:libgcc-dev = "\
>      ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
>      ${libdir}/${TARGET_SYS}/${BINV}* \
>      ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include \
>  "
>
>  FILES:linux-libc-headers = ""
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> index d7cc4e7..fa23e84 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> @@ -12,7 +12,7 @@
>  do_install:prepend:class-target () {
>         if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
>                 install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> -               install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> +               install ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
>         fi
>  }
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3760): https://lists.yoctoproject.org/g/meta-arm/message/3760
> Mute This Topic: https://lists.yoctoproject.org/mt/93581613/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

