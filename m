Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A036CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 13:46:38 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37339.1779803197208568012
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 May 2026 06:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=trncJvNZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.44, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43b78b54dbdso2487422fac.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 May 2026 06:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779803196; cv=none;
        d=google.com; s=arc-20240605;
        b=SU9RUqOl8FkW+ECw1+OYrX71o8qTIjtAmHyVLbl3vU7RjDsc45GrnY4bxLM/QYDe+B
         ydECwnw2ZcjvzfLAwS73ihnLr1XWz1kLTQPv5g6VGqdKu3Q2ocl80+GGgCSL03FRQDif
         DvWX/6l4tZTK+06gXDxA/PFy22AORhhDjL6SK3wdlBPStBsDnuAlaXs8D9MvDtp1rRIO
         9Esl7dWSHacsP5NH5iTp6UE89JtcdhiLAsZ8L4ryWIXmI6+wpaaBwZknkIEpHH6Q8NnK
         eT8zXqIRMb2aydFiBLz09hwhIlD2pYzCF+RfgjJ0EJ86RfP4ajqSj1MpLFq51sEOVvw5
         37KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MSb9TRtImUt1LsL+wnaH05wlJmHyMR/eBQbav5IA6tI=;
        fh=ffPUG0C0lCHHl39SfsvHFYdNbwaJxVebJyTLlNknqG8=;
        b=BBHDJbrsuGY+U4+wGqsAxS9jEnqODo/Nb+jMJqimFQCT/FT9UBJ8BdgNyWdP3QWFk6
         lRVz3CmuKl0c/rmxyWD3fRD6uF8Ajxup/dE1edx0lmJk0RDHDt9yO5mHBqk20PpbHJ9p
         owpjYcINtoPWyBnFiSsZ8OpkYt+l0Bu4cLw2vT0w4/883i3qizpznluZuPrCt6SRT01a
         2dqpqL/E2YJIiG+2PEwZBzrhpS1a99A9DRPXf5xF3cxB8tW5nFZOcE55clZp2cmUYpg2
         uXMP6dXXXFPHsEhQh54zv7u1WTBkDycrslcVBQDgcjsDfIg9x+9/T3yUdPtwpy9Y48aJ
         yjbw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1779803196; x=1780407996; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSb9TRtImUt1LsL+wnaH05wlJmHyMR/eBQbav5IA6tI=;
        b=trncJvNZ1X/HxbjLQjxdqWjOtaqelt23p3IxV1SuHRYwLbgOxoysVu0oYDvrjoACRj
         Jpw0AA+TC8C64VXJ/NAqJOo0zn4Gp9ZFPQ0wWjt2FlPTI9G3ZyRUcyMACVZGkCUwAyON
         oneV/92NQQlEIlKiPLmD0ScQ2qghPntJmPqjIRYpA7JN4SPmOpbZoiqqZnzXg9JdSDP7
         /SDCeMzdVRvHKkXOA5xbO82pqgzVZ3dtviNd0CXfGm+lKkfG8aXh5+szz1Xl+4++fKd8
         AppRs/0AM4Mn77Ly/9jk8f7v3O7rIHc54HvL5tHR0X79rQo3RmPs/RzUPdFEbRvYcPr2
         9Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803196; x=1780407996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSb9TRtImUt1LsL+wnaH05wlJmHyMR/eBQbav5IA6tI=;
        b=rzR3hphi3SI1C+QVPvEPmIL41aKfC5nCAoihJUoQfzwYdPGOo9sUDSGJy0wV3/hzCM
         sQswTI4NTxz0ZzZSrQnXl5K6ydqnTQnyjbHA1fYCdtZQPO1EJUeMfCCCbLnU+UQ02S3K
         USeSS/ENFuYTDyBFoGW8vziPe+W9p1NAKoPnGKpMBuoR7KebFs9CvCt7/PGIbFlfWHRo
         1jWRVEeHZySjDM3jnkBx/A/yU98JlOzi++KOhmpfJKEURuK07UwpKYJM/hWqHhCh7LsQ
         V6p35M0/Zac7iz8HI8EPmlrMoga6RNCeFLXRDjyA0/dXyenqxLtd/t5sI7A/tmsIjhIn
         UDmg==
X-Gm-Message-State: AOJu0YzxKX8GLav/rfGLFu7aiw0k+YfAbqbuwwBj02iocyh1dRHsbqFC
	UdRgahopq296jDRgJ10/cusxt0O6Tgp2LPKuvr0oI50cUojHBb6SQrS5eWn8YC/HYGAO4s38wwg
	N2+uwHI63u0BMrKNrpy2th3PnECxerPzVk97VpIdH
X-Gm-Gg: Acq92OHGO3Tw2ijcAg0j+asbvTRxr68SHo7uytnxw7sIV81VnGkAfRpRmY5yL954zr+
	1+JIlaMqKLzZ+xe38hk6N2/Ti2l73WMWxO4VA/bBEo/Gx5g6OM2XWoXxZnleU+F3ogA2qc3Ejsq
	HH6+VcCsJGzVLP9YKv9dl5d7CzzxPhjXK7yNq/fx1lIqx9Mt5Z0ldGgkSZKOIk/va9AMCdPGmtP
	WLY8NlBmQRGPouHn75yq2y64Ic78l+eddKvN/8oY11l2/2uFGLaRValOUHLppRgYSRTL93t0hvy
	R9unrPry7Ttz7BUp4w==
X-Received: by 2002:a05:6871:5294:b0:42c:ebc:7f53 with SMTP id
 586e51a60fabf-43b5aeb449amr11048092fac.37.1779803196355; Tue, 26 May 2026
 06:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260525130656.2119859-1-igor.opaniuk@foundries.io>
In-Reply-To: <20260525130656.2119859-1-igor.opaniuk@foundries.io>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 26 May 2026 09:46:24 -0400
X-Gm-Features: AVHnY4K9VvLx2pjQlzh2G9II7xvLd0sxoU1_z3OeuWhx-1apY6wzFJFjyRcCtgU
Message-ID: <CAPoiz9xSDLb53tCJ7jRmobO9F=7q9v-tRDUjj8mRo6tL0UdFWA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/edk2-basetools-native: add
 util-linux-native to DEPENDS
To: igor.opaniuk@foundries.io
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 May 2026 13:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7063

This issue was patched by Alex Chapman in
https://lists.yoctoproject.org/g/meta-arm/message/7057

Since that one looks more complete, I'm inclined to take that one.  If
you can verify and respond to it with your "Reviewed-by", then I'd be
appreciative (and you can get some credit for doing the work in the
git log).

Thanks,
Jon

On Mon, May 25, 2026 at 9:07=E2=80=AFAM Igor Opaniuk via
lists.yoctoproject.org
<igor.opaniuk=3Dfoundries.io@lists.yoctoproject.org> wrote:
>
> The C host tools GenFv and GenFfs include <uuid/uuid.h> from libuuid,
> which is provided by util-linux. Without an explicit dependency the
> build relies on the header being present in the host system, which
> breaks reproducible builds and fails on hosts without uuid-dev
> installed:
>
>   GenFvInternalLib.c:21:10: fatal error: uuid/uuid.h: No such file or dir=
ectory
>      21 | #include <uuid/uuid.h>
>         |          ^~~~~~~~~~~~~
>   compilation terminated.
>
> Add util-linux-native to DEPENDS so libuuid is staged into the native
> sysroot before compilation.
>
> Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> ---
>  meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
> index e2d927e2..35dc199c 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
> +++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
> @@ -25,6 +25,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d=
+)$"
>
>  inherit native
>
> +DEPENDS +=3D "util-linux-native"
> +
>  RDEPENDS:${PN} +=3D "python3-core"
>
>  do_compile() {
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7062): https://lists.yoctoproject.org/g/meta-arm/mess=
age/7062
> Mute This Topic: https://lists.yoctoproject.org/mt/119480149/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

