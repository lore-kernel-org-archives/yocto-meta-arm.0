Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD89BC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 10:37:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.89999.1638355027500368866
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 02:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=tQSinG8j;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id l16so51114771wrp.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=thiEhxDh1EfkxiAKRllJxqhLcM6QzznNo+ktwPjTbPk=;
        b=tQSinG8j6ZoZNC+kpo7M6zgeLTpPBkXVnqqkkC21LdfUf/iUlduSMu4YfV72Voaw/B
         psuv8VeHi/5R+2WdsPAOdaAmV+uHxuVe9lbId6MvEQEZHRDTTIT9e8JJPK3IlwieAoiJ
         LAyCqtJJmGoi2LQtYSVGdnCEm9MXRQ2X/h/nloOkGukb3cX30bUJl2IQWckKody3rtzN
         x9d6O2O6m/ib0U+/fip5AyfhA72ZzkLVsb+CitrwknsH2xm6xrHVOdnH3Ma8KlYbTbsD
         FFbapAH/iLGoQxKmBtLqTQ2RKijJ4Xv7RxF9PpI84tyeL52KV+y0WCqg0CE4MnoYqt6h
         G86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thiEhxDh1EfkxiAKRllJxqhLcM6QzznNo+ktwPjTbPk=;
        b=3grrMiwIbWm7wHjD8slS0v50ahsqPl4uhTP1G6UaLQByjR/GuWXR8SHyegE+X7EUrr
         I7i69d9qMUGYcXWevDzrxpRBSqDVqrxv0FsAa32wHerkrmMFnYIcyEp/JXSpjWf5REZm
         sz9SB35T5ZkJL03CqNtmJ1/jUXZQdrU6WLQnk9XKBy0QvzieBHBDYZfQM5kgnIe0sa8D
         4Zgb+IzMQQeOMw0Dxm37gvbTeC9Oj3upGfRb5Z/+TgW0Uw+DEh26gQq9t9VTwAv4nXId
         n571A7s168rv5ilKK9AtovdXFa+aQvXHynB5jRp719d/zU83EGyoEm7b05CnWwhH+txk
         Xmvw==
X-Gm-Message-State: AOAM533e5dDNTPlsJ48qZlpm7eglQtUZ++nPsDDYX3yEqCETjf8vMXVb
	5HVuUCzlyHPg17BGIgpmU3txVxcq3j9WbqLb0xHf8g==
X-Google-Smtp-Source: 
 ABdhPJwsqOn4nHNRbUfgY/4a1e4RnA1hMPKYCml2dOS5Q3KImK3kV7klmBZAUs7SwnQue51RlkMlgWBap2cv0QF93bU=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr5850457wri.376.1638355025638;
 Wed, 01 Dec 2021 02:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20211201024555.1102657-1-raj.khem@gmail.com>
In-Reply-To: <20211201024555.1102657-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 1 Dec 2021 10:36:54 +0000
Message-ID: 
 <CAAnfSTtFMaWHesACnK2g2BuY123qhci3J-Sxjx0B72jL5CakYQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] edk2-firmware: Use --platform option only
 when EDK2_PLATFORM_DSC is set
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 10:37:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2497

My understanding is that --platform is pretty much mandatory.  The
recipe shouldn't be built if those are unset, so I'll add blanket
COMPATIBLE_MACHINES to the base recipe instead.

Ross

On Wed, 1 Dec 2021 at 02:45, Khem Raj <raj.khem@gmail.com> wrote:
>
> This ensures that --platform is not left dangling for platforms which do
> not set EDK2_PLATFORM_DSC
>
> Fixes build errors like
> build.exe: error: --platform option requires 1 argument
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 66e0cc3..0a1275e 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -29,8 +29,8 @@ EDK2_PLATFORM_DSC  = ""
>  EDK2_BIN_NAME      = ""
>  # build --arch
>  EDK2_ARCH          = ""
> -# Extra arguments passed to build
> -EDK2_EXTRA_BUILD   = ""
> +# Extra arguments passed to build. Pass --platform if it is set
> +EDK2_EXTRA_BUILD:append   = "${@' --platform ${EDK2_PLATFORM_DSC}' if '${EDK2_PLATFORM_DSC}' else ''}"
>
>  # build --buildtarget
>  EDK2_BUILD_MODE ?= "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
> @@ -84,7 +84,6 @@ do_compile() {
>         --arch "${EDK2_ARCH}" \
>         --buildtarget ${EDK2_BUILD_MODE} \
>         --tagname ${EDK_COMPILER} \
> -       --platform ${EDK2_PLATFORM_DSC} \
>         ${EDK2_EXTRA_BUILD}
>  }
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2495): https://lists.yoctoproject.org/g/meta-arm/message/2495
> Mute This Topic: https://lists.yoctoproject.org/mt/87419544/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

