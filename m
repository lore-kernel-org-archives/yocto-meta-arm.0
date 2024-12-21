Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50357E77184
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 13:20:50 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.6947.1734787249092941311
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 21 Dec 2024 05:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=L509FZBR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.46, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5f4ce54feb8so1315746eaf.3
        for <meta-arm@lists.yoctoproject.org>; Sat, 21 Dec 2024 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734787248; x=1735392048; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaAdWgxry18PORGyhbE9g5F+bb6MTAqyh+huYdrSs2Y=;
        b=L509FZBRECJJWN+lWcJzMf4TcA+EpRA3cTWnW1zrPTZ+/FZCzBKia88HxMePMM7d4v
         aTsM3EyQPYGs4oF+tXECV83J+HY/4NcyAxANm+LaSEG2fyGWBEbABRTPkgt7B8JXdvtD
         Fm0ly0fKDpvGZi+stNyesEYpUzQICmRbOzG2HpddNEa2ovwv6ew9MShb7PRvgUnyPs/t
         Iy/NItvvgUDCv3hvQT62AhI/sRkh9eEdZwQB+JXWEWU0ZS5f+OhRWqVaoKVQ45Fnnw6m
         8VS4xJ2R9iw+nCzkUQf9tdP2P6YqrCcqJKWdYgp39c5C5xlhPR5X2iyy9Hz/kZUHKoe1
         s/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734787248; x=1735392048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaAdWgxry18PORGyhbE9g5F+bb6MTAqyh+huYdrSs2Y=;
        b=D6GFuUudyw/8PW82S1E/RmJO2cHbvsoLJnS6WiQ1cNTTHWFAJmQ1i75FqxbETIgZi6
         kmOuV2hwk3Mg6CNp9hP/YZLLAeS9eSahf3TksYREAioR1idaWAP4hV4pgF4o9FCbvenG
         V5Zcqc/hDBpdTxf0zXo0bunETMglTsWkZFJEROYXU/20+IAKleqpS23g/zQt7/QobdgT
         fy4vR89tLS/KVuZR3bJOh9ydXyvHT7vw6JyWesXKfFxfEBehce/Pc2tNyCD0LkT6S/4r
         ymwF3O+UBMxr5NH076scebv6fs0FqQKmspUSvlKenyt54AXdOpGUhpucZ6AKRwHE0BkO
         CGBw==
X-Gm-Message-State: AOJu0YwKVsW7LrooLCPocrvBkUW6CrQ+5IjHsB681K0N9Wv0rlMPitO6
	6bzyBSV314Gr92KxdKa1UZuDL+FbFfw/N9mg4Rqj08MtTr51OhoeLWHK+OVnzvK53Akob4aJSqc
	/F8uHoTaQmA9wF61RqFEyHuGw+ZlCFoCRqEjB
X-Gm-Gg: ASbGnctltbNcD3YxfQmqwNt+EjAXk87GCzkGttOi6BX2c9BAJoBiAiPYs2flBRVxmSy
	TW65TwqDUzCe07lb7BnL4k90LoEs+h+3pD+g0
X-Google-Smtp-Source: AGHT+IHzVjYyTO7KcbyOVJCedXf3P0Gj4jYoUMY2CCLu8+mivKjLWUG56AXFZZc/la0F6ckJ5GTt+GCcOh+6FAoAmMY=
X-Received: by 2002:a05:6870:dc4b:b0:29f:bd6c:4b2a with SMTP id
 586e51a60fabf-2a7fb59c819mr3199570fac.42.1734787248242; Sat, 21 Dec 2024
 05:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20241217-tf-a-2-12-v1-1-cca762965260@cherry.de>
In-Reply-To: <20241217-tf-a-2-12-v1-1-cca762965260@cherry.de>
From: Jon Mason <jdmason@kudzu.us>
Date: Sat, 21 Dec 2024 08:20:35 -0500
Message-ID: <CAPoiz9wjKi+tD98g0BHPY_dezg9Us72VwfdAVPU_WsQmHmjVDw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/trusted-firmware-a: add support for 2.12.0
To: foss@0leil.net
Cc: meta-arm@lists.yoctoproject.org, Quentin Schulz <quentin.schulz@cherry.de>, 
	Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 21 Dec 2024 13:20:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6299

On Tue, Dec 17, 2024 at 10:06=E2=80=AFAM Quentin Schulz via
lists.yoctoproject.org <foss=3D0leil.net@lists.yoctoproject.org> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> Add support for TF-A version v2.12.0 and mbedtls 3.6.1.
>
> GCC-compiled boot tested on RK3588 Tiger, RK3399 Puma and PX30 Ringneck.
>
> 0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch is merged in
> 2.12.0 so no need to have it in SRC_URI as for 2.11.0 and earlier
> recipes.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Unfortunately, this isn't a simple upgrade.  There is now a hard
dependency on poetry.  See
https://gitlab.com/jonmason00/meta-arm/-/jobs/8666827497/viewer#L9246

I was seeing it on all my builds when I did the recipe bump a couple
weeks ago (but I did a replacement of the 2.11 recipe, not an
additional one).  So, this is going to need a poetry recipe to get
working, which is where I left my attempt :)

Thanks,
Jon

> ---
> This is interesting for meta-rockchip since it now has support for
> RK3588 and initial/incomplete support for RK356x (see
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/31265 for
> missing patch). I do not own RK356x devices so cannot test their
> support.
>
> Cc Trevor as maintainer of meta-rockchip as he could have interest
> making upstream TF-A the default for RK3588(s) instead of using
> Rockchip's blob.
>
> Cc: Trevor Woerner <twoerner@gmail.com>
>
> Tested on master branch of poky, meta-arm, meta-openembedded and
> meta-rockchip.
> ---
>  .../trusted-firmware-a/trusted-firmware-a_2.12.0.bb   | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.=
0.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..ceaac263fc7504a6c876eb7c2=
17027936a2889f9
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.0.b=
b
> @@ -0,0 +1,19 @@
> +require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +
> +# TF-A v2.12.0
> +SRCREV_tfa =3D "4ec2948fe3f65dba2f19e691e702f7de2949179c"
> +SRCBRANCH =3D "master"
> +
> +LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"
> +
> +# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
> +# mbedtls-3.6.1
> +SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-3.6"
> +SRCREV_mbedtls =3D "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
> +
> +LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
> +
> +# continue to boot also without TPM
> +SRC_URI +=3D "\
> +    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.pat=
ch \
> +"
>
> ---
> base-commit: b2c43dbf9b4e7c22038bdd5d01633962afe8f18f
> change-id: 20241217-tf-a-2-12-2e8004a4ffd3
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6296): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6296
> Mute This Topic: https://lists.yoctoproject.org/mt/110163862/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

