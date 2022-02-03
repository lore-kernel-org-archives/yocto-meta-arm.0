Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24021C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 16:30:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.11581.1643905817342373806
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 08:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=RXPp+c0D;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id u15so6127398wrt.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UFCeyYaO/DKWKCwnkej/mQTmpEr8CbFXctUnba7cnf4=;
        b=RXPp+c0DV2+v83HZuWQzReL1gY72XNe4uLAv7Jc4Uepy5NYAnZBqghBWQRsfzX5Jnc
         /i4uPiYhAFAYwXeT1KqSNsrKpyWs15pm3gFDuITOAHGlMm+S/f1HsAfihGine5dRi3ev
         c2XaOdHZ2uprhlUfPLbKV9whElx8NQqJLaVeTuH52scq0SQrcXHZ9x144zJHuea9pLVd
         bG4HF/takTo4KFQG5SdV5oCXiSnd/NUPqhApHyl6LWThzkqUdyC6pWMx+yM8v79EUzoM
         UOR4/wuBWXMXwuJILNL9ijNTG6gSLGB49xP+qe59vYHh/ozKY3SFXaFOcDUmYDXEA2nm
         73gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFCeyYaO/DKWKCwnkej/mQTmpEr8CbFXctUnba7cnf4=;
        b=MJ3y8JhEzkjBYsUSrO2TucaGY254w4yy0R8322IxaBEu78sGzBM7pVIAgLPrtxiRyG
         UbUyNgBEwDdVzc3gt1OX0yvIRdNnwVPbDU3sY1AW2tyXCZR1PaCdrskqnvpPzMp18n58
         JlkwoI+1Da0GARl09rWpj0TKq12NR5UmPvp9ZY8TUHp4JWSMfidqRPpFD/ISQLgklAga
         EHFUIpW9hUyMGxvXBQqrbCv9QPHsKx5UPuqCl2eOYjxUoxoL7ldBlPSAVSpqfNP1ZD2Y
         h8koIvRfAHAAf83uJGvh2I2zXWWIU4+aOKcaOfR2gPTO0Dj+FEHjUPUSme7oWs94qOmW
         71og==
X-Gm-Message-State: AOAM5329px+GtEIX8MmIJ1bj6kjtug8D+OXyjyHY6aOsj/pM1pzZC/hY
	ESpCH2KYGGBwPxzdI+Ixxht8dVSL9WgJyFfue0AKTzGODf+eYgNU
X-Google-Smtp-Source: 
 ABdhPJwAztJsZijxntlntuMN23fR8ju4Y+W2ld4xVtswAKVKezzRovh6236abQAfEf/dEfi+u2O63iOUt2qRGrjWtsE=
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr8111812wrt.497.1643905815213;
 Thu, 03 Feb 2022 08:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20220203123839.33950-1-emekcan.aras@arm.com>
 <20220203123839.33950-2-emekcan.aras@arm.com>
In-Reply-To: <20220203123839.33950-2-emekcan.aras@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 3 Feb 2022 16:30:04 +0000
Message-ID: 
 <CAAnfSTtm0vQKa0uGyA6akLg2-Ht8oFWgSmRx9EvyUVPRWzS-mQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/psa-arch-tests: corstone1000:
 fetching linux-trusted-services repo
To: meta-arm@lists.yoctoproject.org
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Emekcan Aras <emekcan.aras@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Feb 2022 16:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2945

This fails for me locally:

| CMake Error at
mbedtls-subbuild/mbedtls-populate-prefix/tmp/mbedtls-populate-gitclone.cmake:31
(message):
|   Failed to clone repository: 'https://github.com/ARMmbed/mbedtls.git'

Can someone suggest that maybe trusted-services should use git submodules?

Ross

On Thu, 3 Feb 2022 at 12:38, <emekcan.aras@arm.com> wrote:
>
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>
> Fetching the repo at fetch task level. This makes sure CMake
> does not fetch the code by its own.
>
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>  .../trusted-services/psa-arch-tests-corstone1000.inc     | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
> index da619d4..46bcda0 100644
> --- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
> +++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
> @@ -7,17 +7,26 @@ CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, True)}"
>
>  COMPATIBLE_MACHINE = "corstone1000"
>
> +SRC_URI:append = " git://git.gitlab.arm.com/linux-arm/linux-trusted-services.git;protocol=https;branch=main;name=linuxffauser;destsuffix=git/linux_ffa_user "
> +
>  SRC_URI:append = "\
>      file://0001-psa-arch-test-sysroot_compiler_flags_fix.patch \
>      file://0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch \
>      file://0003-corstone1000-port-crypto-config.patch;patchdir=../psa-arch-tests \
>      "
>
> +LIC_FILES_CHKSUM:append = " file://../linux_ffa_user/Makefile;md5=a786a5cc7a7e0f02b6071ddc23d29111"
> +
> +# v2.1.0
> +SRCREV_linuxffauser = "77967912d033144aff2695cecbd52d3be450deaa"
> +
>  FILES:${PN} += "${libdir}/libts.so*  ${libdir}/deployments  ${bindir}/psa-*"
>  FILES:${PN}-dev = "${includedir}/deployments/psa-api-test/"
>
>  INSANE_SKIP:${PN} += "rpaths"
>
> +export LINUX_FFA_USER_SHIM_DIR = "${S}/../linux_ffa_user"
> +
>  do_configure() {
>      for PSA_API_TEST in ${PSA_API_TESTS}; do
>          cmake \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2943): https://lists.yoctoproject.org/g/meta-arm/message/2943
> Mute This Topic: https://lists.yoctoproject.org/mt/88881480/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

