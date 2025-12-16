Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCE6D609CE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:48:17 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27406.1765903694312746109
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DR4ZV7GG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.52, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3e37ad3d95aso3473756fac.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1765903693; x=1766508493; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxMSR8IXE9TXnfZxCAbbNzxDxRd3FaXHffMlWvlqJQY=;
        b=DR4ZV7GGim+U8E6585KIbElmWG4gl1GlkBZdsHvPQVIHJif4drfE6tgyFefynnzBDi
         nVb+Ss3JC6H0864/agVCZyuuvC82KEyiRePWQSP3/J7ZIsqUNtgTQxWZ92wyJq6t7nF8
         KNfAJFEMNk3eu8EiTVoHr3waxpZFBfXuAP4ryLL+9FNxpo5flUvNSMmLJoFVNvgQVHzR
         dkoyvlSvxI7KR2cYAstqCXasCFVr/tcoSHqfYb07odyELxKpWRWCZYg9amjR2XWuQ4xp
         42jbwX04YgSjweZEr7veBb+oNXhzyWajLja5oyDlr5gtLiS8dOBrQ6yZzoY3kZiOiJd9
         lmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765903693; x=1766508493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxMSR8IXE9TXnfZxCAbbNzxDxRd3FaXHffMlWvlqJQY=;
        b=ebniGVbVZJdjKgTzY1J3o87kAZ1OSMKkUHh2j2ew3jesdsb9z5GZ0YLlCeGgX1sQF1
         xdvpwvbchNwOacTN5TidRqEvAnv5MPn1ooP6QYjHdr0Omx5j7di6Jm08aFYGmYBTFMbS
         8hvCN/6I6si7kHyvZyBqCG/Lr3Bh28241Qxw91LrjsMsAzKaR1Y/5lEk0Gu5BD/tj0Dn
         lkQDS9mq8KNAtq5x9RuU91M3hRj6RNNuEHvg9w5T143rZGg8Fuf8zHRgnU4ltlLtlTAi
         IwFrTDJIk3No5YkMK6OOa3VclO8VfjQd4LdX7K9NI5S/GxLhrMCAWVUuHAky4pCC0BuP
         C7fQ==
X-Gm-Message-State: AOJu0YzlDeAhTfQaI6TTpebUfvIFjVl2/ZHXblziYCkErHxUrHWy3MtU
	CvJfbrqIE6aZr0P0x3i3NcF9haKj/GMr3THzzYScS+LR04Sxuoj7c+co3OsB3Aa4F1h90pj8wSN
	NkLU1Qd9uECKXrF49ndrUjy1wrFxPCEnzZD3t5Lo3
X-Gm-Gg: AY/fxX682tKkbOGMmdsb9SwwPv+7ZPFG6t2HapawFjD9LAUED28Gqlcoj0BlB0VrEaA
	pnVHqh2wVqIDVJlIHTpHbrrMxe3T5tYSCsg2rbsY1Hl7+E5OFYQwiEou0QXaGqTrgxf8GPPAJNQ
	9+sHlcmKliOx3zNEGhc63/QOE9NxnJIG5ijRIj5n4WDijhsUHuM1qxBYWhK39jmZ3eM43Asgm5i
	ihtmJ+kydKL+tmJaqHQ/9DLKU7W1ICoPvsZ49x7nF2D9pkMyrgOQSAs5GCpdA/Hw2XBqns=
X-Google-Smtp-Source: AGHT+IHaQb3bJQ2Va2+vzOSDWTrCZkBHsBsmMTUk0Uen7aMBj+wYBBm1bdWeSRWBbbH3CdSDh7a01YbcKwrxaPrZK7g=
X-Received: by 2002:a05:6870:89a1:b0:2e9:93c6:6e4a with SMTP id
 586e51a60fabf-3f5f8c47dfcmr6878330fac.38.1765903693245; Tue, 16 Dec 2025
 08:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20251215180051.1476057-1-ross.burton@arm.com> <20251215180051.1476057-2-ross.burton@arm.com>
In-Reply-To: <20251215180051.1476057-2-ross.burton@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 16 Dec 2025 11:48:02 -0500
X-Gm-Features: AQt7F2pjm947t0DNOkPzjvZ67DACVIagR-BnUZi6bIobyMZGU_3o_d8I52UnwaY
Message-ID: <CAPoiz9x6NcyVKq7FSeo751aQJAPv6sHx1SrU37TbzD-wKptDrA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm/trusted-firmware-m: update _git recipe
 to 2.2.2-rc1
To: ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:48:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6805

Per offline discussion, dropping this one from the series (as it
causes problems with the others queued).

On Mon, Dec 15, 2025 at 1:00=E2=80=AFPM Ross Burton via lists.yoctoproject.=
org
<ross.burton=3Darm.com@lists.yoctoproject.org> wrote:
>
> This is not git master, but it's a lot newer and gives a baseline to
> test from further.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../trusted-firmware-m-git-src.inc             | 18 ++++++++++--------
>  .../trusted-firmware-m-scripts-native_git.bb   |  6 ++++++
>  2 files changed, 16 insertions(+), 8 deletions(-)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_git.bb
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git=
-src.inc
> index bf3a07d218..c3adc2e7d8 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
> @@ -30,25 +30,27 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
>              ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
>              "
>
> +PV =3D "2.2.2~rc1"
> +
>  # The required dependencies are documented in tf-m/config/config_base.cm=
ake
>  # latest (25 April 2025)
> -SRCBRANCH_tfm ?=3D "main"
> -SRCREV_tfm =3D "1e77550712f35730e8807fd1091fdac243d1b15a"
> +SRCBRANCH_tfm ?=3D "release/2.2.x"
> +SRCREV_tfm =3D "4706d567a2e5c2d88067370c5347ae5bbe59bcc6"
>  # latest (7 April 2025)
>  SRCBRANCH_tfm-extras ?=3D "main"
> -SRCREV_tfm-extras =3D "8679c4c26091d19807eb68a1bd4b75fb2b6685bc"
> -# latest (30 April 2025)
> +SRCREV_tfm-extras =3D "3e6ac492b913c4c681e1dbc1f90c38cd765170ab"
> +# From lib/ext/tf-m-tests/version.txt
>  SRCBRANCH_tfm-tests ?=3D "main"
> -SRCREV_tfm-tests =3D "96c110a7a70bdb28bdf0e56dcf791c37fedb20ad"
> +SRCREV_tfm-tests =3D "e21dbfbb0c3b5e9758733793d834c55a2f280f25"
>  # CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
>  SRCBRANCH_cmsis ?=3D "main"
>  SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
> -# mbedtls-3.6.3 (+2 commits), value from MBEDCRYPTO_VERSION(-ish)
> +# mbedtls-3.6.5, value from MBEDCRYPTO_VERSION(-ish)
>  SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
> -SRCREV_mbedtls =3D "8cf5666a174237998a7965e284d7ba8c1655d16d"
> +SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
>  # mcuboot v2.2.0-rc1+ (intermediate SHA), value from MCUBOOT_VERSION
>  SRCBRANCH_mcuboot ?=3D "main"
> -SRCREV_mcuboot =3D "6071ceb1d0d955b6ff4745499a0ff3ac7d79f24b"
> +SRCREV_mcuboot =3D "2d61c318933819a0f4954fb2a5a957a62c6128ce"
>  # QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
>  SRCBRANCH_qcbor ?=3D "master"
>  SRCREV_qcbor =3D "92d3f89030baff4af7be8396c563e6c8ef263622"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_git.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firm=
ware-m-scripts-native_git.bb
> new file mode 100644
> index 0000000000..752a56f989
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_git.bb
> @@ -0,0 +1,6 @@
> +require recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.inc
> +require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
> +
> +# Not a release recipe, try our hardest to not pull this in implicitly
> +DEFAULT_PREFERENCE =3D "-1"
> +UPSTREAM_CHECK_COMMITS =3D "1"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6799): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6799
> Mute This Topic: https://lists.yoctoproject.org/mt/116796748/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

