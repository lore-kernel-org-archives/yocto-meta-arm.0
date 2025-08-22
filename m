Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CEFCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 13:20:14 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.9962.1755868810967501588
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 06:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=d+JNQtLH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.169, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-435de702f1fso1273395b6e.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755868810; x=1756473610; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCFSGfqLNtdum/9ORp6yn0YqGawwIuxYdoHwv2jFagA=;
        b=d+JNQtLHlCX2fBvD2t48lnAmsPMG/y+u3VQJyVhTuxpO0qvdcFByKBgVdtUyHkR8Uz
         mfbs0DULuJeHtNFWZtxiNIdcQ0kGVoEqk5ArKd1UAKqzmSmJhfLJe4N6TILbCHK3pxRs
         KBtW9fAddLEnhqI0NFHao2tI2VAYqk8pr+gz4CcQ4RAJ8Y9R/+pGlHQ+UceXUvjw2BvH
         ceXtn6QqYN6PfcJwh7KG0SOAfoCRVU7aiHUERlMQvPmUckD8w4e6L676NEU6ySuYfgMa
         cJ/XX2KC3JQhVeWSLyrJMJmAQ1WoGeIxAlLqS1Uz1akXzGlLO3bXo1qXujIWTUWGCKHD
         1fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868810; x=1756473610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCFSGfqLNtdum/9ORp6yn0YqGawwIuxYdoHwv2jFagA=;
        b=iTpnzYhbAGIKnNSgCl1/5Sp2Ydr5TNhWjYD/bOYPhf2TodACNtnBE5Ii0s2O2cHAoB
         IDrBL1DexsxFsZitwkB92PInGIO7b+2wLeCd9XSwVMugOp+Jnq790lRjEFbLTARhGq6Q
         wlffY02nGF0IuIDEGrVe1dnfO6rpR5+Gf8URVO3o2Nh4c+dUXNV8Lo3ZaQyxQBar+zBI
         AaWvlskaeIB09Q15TPLZCVb2jjPTXNJiWS2MJz+QFIluRah6nfD7KyLdUJ1OpOTiFvAe
         V29yeDfOCpCO811wQ5NPSpj4GdYw1RnI0KGe0GfXbgG+UV+Hn9a9UDXOyrvSTeEDQGZV
         2MVg==
X-Gm-Message-State: AOJu0YzF4SGtAlQ/JcO5Mt2YkPpMF2xF+L0t9qPmZXA1kDqYQiaVzVqZ
	Ng0+9Mjif8Kw74pSB4VhiDAzjBJ7X1rTyxDMrr2dpRns6LlJOWY7Ti2OGDtOh8u39qoJyY215pB
	JUxKUFdfqymCsQM79YvNkYcGBEYjJ0077oxa1Be1KQIsfhmz4Itk=
X-Gm-Gg: ASbGncvhkbqfrmo6ngGyLwUnILSQC8UOd0xP0hAsUgCJciPV0E0w9JpNO1+441ascO5
	EZlo5bW1J7DHBujCTiGNyXdjD45k1aGnMJIJwEqjMdTvIttJO+iUt2yDPp3hfn5AAQ8LQO2CYb0
	bv8WX67o0hZqZPKEVei/tgGcVvPd4ywevh++E/QjhWHHMWHV814vgX8fNen1CzsHdmf7vhUo6kL
	LpkYIg69CDB5Yv3Pw==
X-Google-Smtp-Source: AGHT+IFq4S3NR/pI2G78L4g9ODeCj5VpKXGRJeotqfkFnRTlWibHJQNVmMgrzirohb9OmYwgNfQtrbi9Ks1ob+omC6U=
X-Received: by 2002:a05:6808:2226:b0:434:e89:2fd0 with SMTP id
 5614622812f47-437852b91a2mr1404367b6e.30.1755868810069; Fri, 22 Aug 2025
 06:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250822131813.93724-1-jon.mason@arm.com>
In-Reply-To: <20250822131813.93724-1-jon.mason@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 22 Aug 2025 09:19:59 -0400
X-Gm-Features: Ac12FXz51cdjCa_2IiOR5ylutkduwJWtQIuXviR6SKJdLu7FNDRVevIsX89C_PI
Message-ID: <CAPoiz9xSRWqp9DkNRdUciS4pAm4d4ZSuhh9EpqW6jsWd5OgL3Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/6] arm/trusted-services: Fix trusted-service
 license file paths
To: jon.mason@arm.com
Cc: meta-arm@lists.yoctoproject.org, Norbert Kocsis <norbert.kocsis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 13:20:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6679

Sorry all, I forgot to rebase my branch before sending.  Disregard
this series of emails.

Thanks,
Jon

On Fri, Aug 22, 2025 at 9:18=E2=80=AFAM Jon Mason via lists.yoctoproject.or=
g
<jon.mason=3Darm.com@lists.yoctoproject.org> wrote:
>
> From: Norbert Kocsis <norbert.kocsis@arm.com>
>
> Use UNPACKDIR instead of relative paths.
>
> Signed-off-by: Norbert Kocsis <norbert.kocsis@arm.com>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../trusted-services/trusted-services-src.inc        | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src.i=
nc
> index e9235cf721d7..50e111172539 100644
> --- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> +++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> @@ -24,32 +24,32 @@ UPSTREAM_CHECK_COMMITS =3D "1"
>  # DTC, tag "v1.6.1"
>  SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;protocol=3Dhttps;b=
ranch=3Dmain;destsuffix=3Ddtc"
>  SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
> -LIC_FILES_CHKSUM +=3D "file://../dtc/README.license;md5=3Da1eb22e37f09df=
5b5511b8a278992d0e"
> +LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/dtc/README.license;md5=3Da1eb=
22e37f09df5b5511b8a278992d0e"
>
>  # MbedTLS, tag "v3.6.0"
>  SRC_URI +=3D "gitsm://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;prot=
ocol=3Dhttps;branch=3Dmaster;destsuffix=3Dmbedtls"
>  SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
> -LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1=
ef1630d341e026d"
> +LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/mbedtls/LICENSE;md5=3D379d581=
9937a6c2f1ef1630d341e026d"
>
>  # Nanopb, tag "nanopb-0.4.8" plus some further fixes
>  SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=
=3Dhttps;branch=3Dmaster;destsuffix=3Dnanopb"
>  SRCREV_nanopb =3D "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
> -LIC_FILES_CHKSUM +=3D "file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a399=
4384112efcdb37c01f"
> +LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/nanopb/LICENSE.txt;md5=3D9db4=
b73a55a3994384112efcdb37c01f"
>
>  # qcbor, tag "v1.0.0"
>  SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.git;name=3Dqcbor;=
protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dqcbor"
>  SRCREV_qcbor =3D "56b17bf9f74096774944bcac0829adcd887d391e"
> -LIC_FILES_CHKSUM +=3D "file://../qcbor/README.md;md5=3De8ff2e88a722cdc55=
eddd0bb9aeca002"
> +LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/qcbor/README.md;md5=3De8ff2e8=
8a722cdc55eddd0bb9aeca002"
>
>  # T_Cose
>  SRC_URI +=3D "git://github.com/laurencelundblade/t_cose.git;name=3Dtcose=
;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dtcose"
>  SRCREV_tcose =3D "fc3a4b2c7196ff582e8242de8bd4a1bc4eec577f"
> -LIC_FILES_CHKSUM +=3D "file://../tcose/LICENSE;md5=3Db2ebdbfb82602b97aa6=
28f64cf4b65ad"
> +LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/tcose/LICENSE;md5=3Db2ebdbfb8=
2602b97aa628f64cf4b65ad"
>
>  # CppUTest,  tag "v3.8"
>  SRC_URI +=3D "git://github.com/cpputest/cpputest.git;name=3Dcpputest;pro=
tocol=3Dhttps;branch=3Dmaster;destsuffix=3Dcpputest"
>  SRCREV_cpputest =3D "e25097614e1c4856036366877a02346c4b36bb5b"
> -LIC_FILES_CHKSUM +=3D "file://../cpputest/COPYING;md5=3Dce5d5f1fe02bcd13=
43ced64a06fd4177"
> +LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/cpputest/COPYING;md5=3Dce5d5f=
1fe02bcd1343ced64a06fd4177"
>
>  SRCREV_FORMAT =3D "trusted-services_dtc_mbedtls_nanopb_qcbor_tcose_cpput=
est"
>
> --
> 2.39.5 (Apple Git-154)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6674): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6674
> Mute This Topic: https://lists.yoctoproject.org/mt/114834935/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

