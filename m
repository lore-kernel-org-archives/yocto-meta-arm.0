Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E6AC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:59:02 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32423.1784663941780435935
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 12:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=elT1qGGV;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6682259cae6so5879365d50.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784663941; cv=none;
        d=google.com; s=arc-20260327;
        b=rB29M+9p+dy7B3fTpQuGIOxDD2LNOo8iR1jAmDXhgZjHtwogfyZvNX3Y974QrK0tJo
         473TgeVh2jxeE8+WCuIW8P+zXpvyJMAZla2VKENf4ew+qhrgC0OmlRKfzH2KBuo25XSx
         yhVgad8TcbMV7DNZ/+pX4Ui7pqc1+sPsnpchOCMheZ8/MRjQaARHcN9yM/PRGIDvfK/I
         K9al1PGts8SYypm3gxVOHOb2lPhd8wbfaNq6mFd3Y2dOCSemLHb/wBLtm1aWpeX2aACk
         QASMIOI7lmgfYdgT4ao5vVdhcSV2dSR9GzPD/erwfEkLGbTc5i+QPtv9O8Qhed5QOwtX
         9Bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wnJMrB3QHQAYx0VUnU2ZRZGY9VGVx9PvyJkza5o/+8g=;
        fh=xfVClqZZKtrefx4EnYXRuHtsoWBelCp7KbDN74RlDkc=;
        b=BMnQYoXRNfzPhmwEOFPTDW/osWWULKBFyvr0czycqld4WHiIqZvsEIoS2/9JQOoUV1
         XjNN6ff6MNLgFBL2SVSjTfLog7l6n4VzuvgiKYb+RgQE9eMsByfYmpkymGtlHxWFuH3e
         0IMfnByASzIOFypVeovF9Lzkt0lxs3IPX74/jgHOFFycAO6hsadiPmiNmYhAlkHMLIGT
         OVk/TcmIdowxA8/rKUY6m0NGOc+mPsOhJhy16ZdBD2T1hgYUaLnRP7VeF39h6HMNFusK
         VPnQNnWayJ1ouY546KwHzU5XrE2JZNidNGOC6+CAmgZiuz+P2LyDHJN/CroFSw0paKJ/
         3/iA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663941; x=1785268741; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnJMrB3QHQAYx0VUnU2ZRZGY9VGVx9PvyJkza5o/+8g=;
        b=elT1qGGV8o19nIq+VYkrgriKOK6Jc5tXgtnzO8DNAu+y2CyaWQZ5MUEeOIhjO8EWzg
         rAPmQGzpMLXc7XP3edPF6absLmvKu0MQohmzSa38x0Ed+KAJzwVJ1eOWWQbg8jAGfVfK
         AOFtI04Fpilvg0ZE38OveJ0fgj+yU0IrgaKtMW0zF5SThhIp8cTvBE86eCPMRaoMUbvT
         FmY0mpEQEwJSuwkSJXRg37koODHrJ35YjvgkE8Ft69BCLGHhx+BFBYc8lmvQm7AjMlo8
         9FDJ2oCHuhJo5wiLSOv42MqJSgwohS6/hPVXCoo0k3TzMx3oKqU4PUQr2wbVssIZXcf6
         WzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663941; x=1785268741;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wnJMrB3QHQAYx0VUnU2ZRZGY9VGVx9PvyJkza5o/+8g=;
        b=tTb8R/GPLSlszlxQLivE0AektawemYNp+KdjWFoU52Z8jAOWWetR4jUcmBc+laruNl
         q7vKSKBGMk0K8mb0eL0WuRDoppmuxU+Bsl5HShVrFx69BPvaS+A5P6TWF3520BCij0E0
         ks8cCcpuR4qdAHInAZznOk9vdLdLq9nmMdABo2S7K4DqFouoM/T6w+k75PUf5+2mmGC5
         Yw6DumG60eBIgbpd2toEr+5N4YhDlSQD8jnqivj3hvA6671kuqV4tHDP+1jcawtL3U1a
         JRtl+yr4WHAgLwlasxbI/Udf5pO1MBvw3FHpWGOmTlMRHdl2YxXB4pQuhn7BSFbaAd/0
         2bZA==
X-Gm-Message-State: AOJu0YyWn8UTj//1G0+QXiBAHtp4D90RArlaiBB+KAURvdNc5yhqy6r0
	Qqx87V9+abtfnUofO1teTyQ1uCXNzGt2NVXM2AyvMp4IxpVF7vsGAruYBKFd2L4HV1ogWhbFNe6
	EceRtWeJPRdmiFPLnwJQClcIIspks5mYumQB0
X-Gm-Gg: AR+sD13oru6rjl2GtdIi5W34p67v4/zqqsp4l+1CJnzumoao9eEE4NA1H/SPmIZ1Rae
	Zix6daVRnViNXQpfRHw+fNr6ievQFQY91RU3Z3b73ycAcXiFJWHx1Err8r70qxIEbPQstkPWQXS
	y2h9c7MqRXoTYa4riWbJApNHbwIxZrDoyGhyQwYyH19L4EQ0TdG8uqEbQb2IQdSLgHZR5iaahEW
	dZmYxD9wSWd3xqTL38/D37191fkDsndbXd1YC53S/961ViU5w16XhzIg3ndFQvrJTFxUA1Ddog=
X-Received: by 2002:a53:500f:0:b0:667:b314:aeb8 with SMTP id
 956f58d0204a3-6683bbdf3a2mr4430661d50.8.1784663940493; Tue, 21 Jul 2026
 12:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260721130159.558910-1-ross.burton@arm.com>
In-Reply-To: <20260721130159.558910-1-ross.burton@arm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 21 Jul 2026 13:58:49 -0600
X-Gm-Features: AUfX_mwSEK2cHq-OuywT9VJqWl4_5SnwKMXgMY5LWMnHMqRTWhB8d9hThqh1flA
Message-ID: <CAJdd5GYn6LKUOiA+ZXzRL_V+EB0im6OcQUs5t98yskJ-1hRzXA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] recipes: port LICENSE to SPDX
To: ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000037755a065724744a"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 19:59:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7122

--00000000000037755a065724744a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 7:02=E2=80=AFAM Ross Burton via lists.yoctoproject.=
org
<ross.burton=3Darm.com@lists.yoctoproject.org> wrote:

> openembedded-core now parses the LICENSE field as a SPDX license
> expression[1], so convert the license statements.
>
> This is mostly replacing "&" with "AND", but we can also use "WITH" in
> the GCC recipes.
>
> [1] oe-core e9d424738d6 ("classes/conf/lib: Parse LICENSE as SPDX
> Expression")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb | 2 +-
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc  | 2 +-
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc  | 2 +-
>  .../external-arm-toolchain/gcc-aarch64-none-elf_15.3.rel1.bb    | 2 +-
>  .../external-arm-toolchain/gcc-arm-none-eabi_15.3.rel1.bb       | 2 +-
>  meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb                  | 2 +-
>  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc              | 2 +-
>  meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb    | 2 +-
>  meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb    | 2 +-
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 2 +-
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.bb | 2 +-
>  .../trusted-firmware-m/trusted-firmware-m-2.2.2-src.inc         | 2 +-
>  .../trusted-firmware-m/trusted-firmware-m-2.3.0-src.inc         | 2 +-
>  .../trusted-firmware-m/trusted-firmware-m-git-src.inc           | 2 +-
>  .../trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb          | 2 +-
>  meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb                     | 2 +-
>  meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb        | 2 +-
>  meta-arm/recipes-devtools/fvp/fvp-common.inc                    | 2 +-
>  meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb    | 2 +-
>  meta-arm/recipes-security/optee/optee-test.inc                  | 2 +-
>  .../recipes-security/trusted-services/trusted-services-src.inc  | 2 +-
>  meta-arm/recipes-security/trusted-services/trusted-services.inc | 2 +-
>  22 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/meta-arm-bsp/recipes-bsp/external-system/
> external-system_git.bb b/meta-arm-bsp/recipes-bsp/external-system/
> external-system_git.bb
> index ede5b80a76..87a8a34886 100644
> --- a/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
> +++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "Firmware to be loaded and run in Externa=
l
> System Harness in\
>  HOMEPAGE =3D "
> https://git.linaro.org/landing-teams/working/arm/external-system.git"
>  DEPENDS =3D "gcc-arm-none-eabi-native"
>  INHIBIT_DEFAULT_DEPS =3D "1"
> -LICENSE =3D "BSD-3-Clause & Apache-2.0"
> +LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De44b2531cd6ffe9dece394dbe988d=
9a0 \
>
>  file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c29e"
>
> diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc
> index d761a7ae63..c86d4a584e 100644
> ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc
> +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc
> @@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
>  # add MBEDTLS to our sources if activated
>  SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> '${SRC_URI_MBEDTLS}', '', d)}"
>  # Update license variables
> -LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> Apache-2.0', '', d)}"
> +LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND
> Apache-2.0', '', d)}"
>  LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '
> ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>  # add mbed TLS to version
>  SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1',
> '_mbedtls', '', d)}"
> diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc
> index 8010c523e1..408185e388 100644
> ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc
> +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc
> @@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
>  # add MBEDTLS to our sources if activated
>  SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> '${SRC_URI_MBEDTLS}', '', d)}"
>  # Update license variables
> -LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> Apache-2.0', '', d)}"
> +LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND
> Apache-2.0', '', d)}"
>  LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '
> ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>  # add mbed TLS to version
>  SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1',
> '_mbedtls', '', d)}"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_15.3.rel1.bb
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_15.3.rel1.bb
> index 447db59cd4..05d6a9f952 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_15.3.rel1.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_15.3.rel1.bb
> @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
>  COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
>
>  SUMMARY =3D "Arm GNU Toolchain - AArch64 bare-metal target
> (aarch64-none-elf)"
> -LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> +LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.=
1"
>

Per discussion, this should be "GPL-3.0-only AND GPL-3.0-or-later WITH
GCC-exception-3.1"

Ross, did the script auto change this one or did you hand edit it?


>
>  LIC_FILES_CHKSUM:aarch64 =3D
> "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d0002c6e=
"
>  LIC_FILES_CHKSUM:x86-64 =3D
> "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d0002c6e=
"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_15.3.rel1.bb
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_15.3.rel1.bb
> index 70a3a37289..db7a5dffa2 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_15.3.rel1.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_15.3.rel1.bb
> @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
>  COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
>
>  SUMMARY =3D "Arm GNU Toolchain - AArch32 bare-metal target (arm-none-eab=
i)"
> -LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> +LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.=
1"
>
>  LIC_FILES_CHKSUM:aarch64 =3D
> "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d0002c6e=
"
>  LIC_FILES_CHKSUM:x86-64 =3D
> "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d0002c6e=
"
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> b/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> index f8a374b7f0..0dfa2dace6 100644
> --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Hafnium"
>  DESCRIPTION =3D "A reference Secure Partition Manager (SPM) for systems
> that implement the Armv8.4-A Secure-EL2 extension"
>  DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-native
> openssl-native clang-native lld-native"
>
> -LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
> +LICENSE =3D "BSD-3-Clause AND GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5294672c500501edc=
103"
>
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> index 032445b3bd..495b0f2905 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "SCP and MCP Firmware"
>  DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
>  HOMEPAGE =3D "https://gitlab.arm.com/firmware/SCP-firmware"
>
> -LICENSE =3D "BSD-3-Clause & Apache-2.0"
> +LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d9300a6c3d15101b19731 \
>
>  file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c=
29e"
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
> b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
> index a65106f24e..e876bd1eaa 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
> -LICENSE =3D "BSD-3-Clause & NCSA"
> +LICENSE =3D "BSD-3-Clause AND NCSA"
>
>  LIC_FILES_CHKSUM +=3D
> "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a32aa0ee7d1b4a"
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
> b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
> index 8bd5dd5643..17951766e1 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
> -LICENSE =3D "BSD-3-Clause & NCSA"
> +LICENSE =3D "BSD-3-Clause AND NCSA"
>
>  LIC_FILES_CHKSUM +=3D
> "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a32aa0ee7d1b4a"
>
> diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 211196b5f8..1e06559ce2 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Trusted Firmware-A"
>  HOMEPAGE =3D "https://trustedfirmware-a.readthedocs.io/"
> -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2.0"
> +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT"
>
>  inherit firmware
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.14.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.14.2.bb
> index 3d0b80188e..9c70d0b581 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.b=
b
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.b=
b
> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
>  # add MBEDTLS to our sources if activated
>  SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> '${SRC_URI_MBEDTLS}', '', d)}"
>  # Update license variables
> -LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> Apache-2.0', '', d)}"
> +LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND
> Apache-2.0', '', d)}"
>  LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '
> ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>  # add mbed TLS to version
>  SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1',
> '_mbedtls', '', d)}"
> diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-src.in=
c
> b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-src.in=
c
> index ddaab88e8b..8fb0265e94 100644
> ---
> a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-src.in=
c
> +++
> b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-src.in=
c
> @@ -1,6 +1,6 @@
>  # Common src definitions for trusted-firmware-m and
> trusted-firmware-m-scripts
>
> -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
> +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
>
>  LIC_FILES_CHKSUM =3D
> "file://license.rst;md5=3D07f368487da347f3c7bd0fc3085f3afa \
>
>  file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69fb341=
1f390
> \
> diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-src.in=
c
> b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-src.in=
c
> index d3ab29d0e2..4ed6d8cb80 100644
> ---
> a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-src.in=
c
> +++
> b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-src.in=
c
> @@ -1,6 +1,6 @@
>  # Common src definitions for trusted-firmware-m and
> trusted-firmware-m-scripts
>
> -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
> +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
>
>  LIC_FILES_CHKSUM =3D
> "file://license.rst;md5=3D002a64dec64b82c58a203a94bee7b2a1 \
>
>  file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69fb341=
1f390
> \
> diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.inc
> b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.inc
> index 7bea317cf3..ffc6200e77 100644
> ---
> a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.inc
> +++
> b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.inc
> @@ -1,6 +1,6 @@
>  # Common src definitions for trusted-firmware-m and
> trusted-firmware-m-scripts
>
> -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
> +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
>
>  LIC_FILES_CHKSUM =3D
> "file://license.rst;md5=3D07f368487da347f3c7bd0fc3085f3afa \
>
>  file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69fb341=
1f390
> \
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/
> trusted-firmware-rmm_0.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm=
/
> trusted-firmware-rmm_0.6.0.bb
> index 60558b6bca..43585982e9 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-rmm/
> trusted-firmware-rmm_0.6.0.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/
> trusted-firmware-rmm_0.6.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "RMM Firmware"
>  DESCRIPTION =3D "RMM Firmware for Arm reference platforms"
> -LICENSE =3D "BSD-3-Clause & MIT"
> +LICENSE =3D "BSD-3-Clause AND MIT"
>
>  SRC_URI =3D "gitsm://
> git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3Dhttps;branch=3Dmain"
>  SRCREV =3D "7f6bc132caef3596fbb88d3a419c2a3cb499cde2"
> diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> index 6d4422f99a..1c4753cbb2 100644
> --- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> +++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> @@ -1,7 +1,7 @@
>  require recipes-bsp/uefi/edk2-firmware_202605.bb
>  PROVIDES:remove =3D "virtual/bootloader"
>
> -LICENSE +=3D "& Apache-2.0"
> +LICENSE +=3D "AND Apache-2.0"
>  LIC_FILES_CHKSUM +=3D
> "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=3D2a944942e1496af188=
6903d274dedb13"
>
>  SRC_URI +=3D "git://
> github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/ShellPkg/Application/s=
bsa-acs;protocol=3Dhttps;branch=3Dmaster;name=3Dacs
> \
> diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> index 3c41d05c54..3a4789c57f 100644
> --- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> +++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> @@ -1,6 +1,6 @@
>  require fvp-envelope.inc
>
> -LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-Clause & Unlicense=
"
> +LICENSE:append =3D " AND Artistic-2.0 AND BSL-1.0 AND BSD-2-Clause AND
> Unlicense"
>
>  SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture
> Envelope Model FVP"
>  LIC_FILES_CHKSUM =3D
> "file://license_terms/license_agreement.txt;md5=3D1a33828e132ba71861c1168=
8dbb0bd16
> \
> diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> index 5d87cef783..5059985563 100644
> --- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> +++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> @@ -1,7 +1,7 @@
>  HOMEPAGE =3D "
> https://developer.arm.com/tools-and-software/simulation-models/fixed-virt=
ual-platforms
> "
>
>  LICENSE_FLAGS =3D "Arm-FVP-EULA"
> -LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 &
> GPL-3.0-with-GCC-exception & Zlib & NCSA & LGPL-2.0-or-later & MIT &
> BSD-3-Clause"
> +LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND GPL-3.0-or-later WITH
> GCC-exception-3.1 AND LGPL-2.0-or-later AND MIT AND NCSA AND Python-2.0 A=
ND
> Zlib AND LicenseRef-Proprietary"
>
>  # FVP has an End User License Agreement. Add Arm-FVP-EULA to
>  # LICENSE_FLAGS_ACCEPTED if the EULA has been accepted, so it can
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> index ffd308fa95..84681b1585 100644
> --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "https://github.com/ARM-software/gator"
>  # configuration requirement specified here:
>  # https://github.com/ARM-software/gator#kernel-configuration
>
> -LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> +LICENSE =3D "Apache-2.0 AND GPL-2.0-only AND LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>
>  file://libsensors/COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516c \
>
>  file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc
> b/meta-arm/recipes-security/optee/optee-test.inc
> index bb9471bf88..8786d1bb5a 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "OP-TEE sanity testsuite"
>  DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test suit=
e"
>  HOMEPAGE =3D "https://www.op-tee.org/"
>
> -LICENSE =3D "BSD-2-Clause & GPL-2.0-only"
> +LICENSE =3D "BSD-2-Clause AND GPL-2.0-only"
>
>  inherit python3native ptest
>  inherit deploy
> diff --git
> a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> index 22cc76ef25..2519b4c297 100644
> --- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> +++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> @@ -1,6 +1,6 @@
>  # Define sources of Trusted Service and all external dependencies
>
> -LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
> +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND Zlib"
>
>
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> diff --git
> a/meta-arm/recipes-security/trusted-services/trusted-services.inc
> b/meta-arm/recipes-security/trusted-services/trusted-services.inc
> index bdfccc48fd..c40d70bf8a 100644
> --- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
> +++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
> @@ -1,7 +1,7 @@
>  SUMMARY ?=3D "The Trusted Services: framework for developing root-of-tru=
st
> services"
>  HOMEPAGE =3D "https://trusted-services.readthedocs.io/en/latest/index.ht=
ml"
>
> -LICENSE =3D "Apache-2.0 & BSD-3-Clause & Zlib"
> +LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND Zlib"
>
>  inherit python3native cmake pkgconfig
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7119):
> https://lists.yoctoproject.org/g/meta-arm/message/7119
> Mute This Topic: https://lists.yoctoproject.org/mt/120375922/3616693
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000037755a065724744a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21,=
 2026 at 7:02=E2=80=AFAM Ross Burton via <a href=3D"http://lists.yoctoproje=
ct.org">lists.yoctoproject.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.=
com@lists.yoctoproject.org">arm.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">openembedded-core=
 now parses the LICENSE field as a SPDX license<br>
expression[1], so convert the license statements.<br>
<br>
This is mostly replacing &quot;&amp;&quot; with &quot;AND&quot;, but we can=
 also use &quot;WITH&quot; in<br>
the GCC recipes.<br>
<br>
[1] oe-core e9d424738d6 (&quot;classes/conf/lib: Parse LICENSE as SPDX Expr=
ession&quot;)<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http://external-s=
ystem_git.bb" rel=3D"noreferrer" target=3D"_blank">external-system_git.bb</=
a> | 2 +-<br>
=C2=A0.../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc=C2=A0 =
| 2 +-<br>
=C2=A0.../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc=C2=A0 =
| 2 +-<br>
=C2=A0.../external-arm-toolchain/<a href=3D"http://gcc-aarch64-none-elf_15.=
3.rel1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-aarch64-none-elf_15.3.r=
el1.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../external-arm-toolchain/<a href=3D"http://gcc-arm-none-eabi_15.3.r=
el1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-arm-none-eabi_15.3.rel1.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.14.0.bb" rel=
=3D"noreferrer" target=3D"_blank">hafnium_2.14.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests_=
2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.14.0.bb</a>=C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests_=
2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.15.0.bb</a>=C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=C2=A0 =
| 2 +-<br>
=C2=A0.../recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-firmware=
-a_2.14.2.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-a_2.14.=
2.bb</a> | 2 +-<br>
=C2=A0.../trusted-firmware-m/trusted-firmware-m-2.2.2-src.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../trusted-firmware-m/trusted-firmware-m-2.3.0-src.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../trusted-firmware-m/trusted-firmware-m-git-src.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../trusted-firmware-rmm/<a href=3D"http://trusted-firmware-rmm_0.6.0=
.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-rmm_0.6.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_7.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">sbsa-acs_7.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-arm/recipes-devtools/fvp/<a href=3D"http://fvp-base-a-aem_11.31.=
28.bb" rel=3D"noreferrer" target=3D"_blank">fvp-base-a-aem_11.31.28.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-devtools/fvp/fvp-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-daemon=
_7.8.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.8.0.bb</a>=
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-arm/recipes-security/optee/optee-test.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../recipes-security/trusted-services/trusted-services-src.inc=C2=A0 =
| 2 +-<br>
=C2=A0meta-arm/recipes-security/trusted-services/trusted-services.inc | 2 +=
-<br>
=C2=A022 files changed, 22 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http://ext=
ernal-system_git.bb" rel=3D"noreferrer" target=3D"_blank">external-system_g=
it.bb</a> b/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http://exte=
rnal-system_git.bb" rel=3D"noreferrer" target=3D"_blank">external-system_gi=
t.bb</a><br>
index ede5b80a76..87a8a34886 100644<br>
--- a/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http://external-s=
ystem_git.bb" rel=3D"noreferrer" target=3D"_blank">external-system_git.bb</=
a><br>
+++ b/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http://external-s=
ystem_git.bb" rel=3D"noreferrer" target=3D"_blank">external-system_git.bb</=
a><br>
@@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;Firmware to be loaded and run in Exte=
rnal System Harness in\<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://git.linaro.org/landing-teams/wo=
rking/arm/external-system.git" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.linaro.org/landing-teams/working/arm/external-system.git</a>&quot;<br>
=C2=A0DEPENDS =3D &quot;gcc-arm-none-eabi-native&quot;<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause &amp; Apache-2.0&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De44b2531cd6ffe9dece39=
4dbe988d9a0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c29e&quot;<br=
>
<br>
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-rdn2.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
rdn2.inc<br>
index d761a7ae63..c86d4a584e 100644<br>
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.i=
nc<br>
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.i=
nc<br>
@@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D &quot;&quot;<br>
=C2=A0# add MBEDTLS to our sources if activated<br>
=C2=A0SRC_URI:append =3D &quot; ${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;,=
 &#39;1&#39;, &#39;${SRC_URI_MBEDTLS}&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0# Update license variables<br>
-LICENSE:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;, &#39;=
1&#39;, &#39; &amp; Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
+LICENSE:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;, &#39;=
1&#39;, &#39; AND Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0LIC_FILES_CHKSUM:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDT=
LS&#39;, &#39;1&#39;, &#39; ${LIC_FILES_CHKSUM_MBEDTLS}&#39;, &#39;&#39;, d=
)}&quot;<br>
=C2=A0# add mbed TLS to version<br>
=C2=A0SRCREV_FORMAT:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&=
#39;, &#39;1&#39;, &#39;_mbedtls&#39;, &#39;&#39;, d)}&quot;<br>
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-rdv2.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
rdv2.inc<br>
index 8010c523e1..408185e388 100644<br>
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.i=
nc<br>
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.i=
nc<br>
@@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D &quot;&quot;<br>
=C2=A0# add MBEDTLS to our sources if activated<br>
=C2=A0SRC_URI:append =3D &quot; ${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;,=
 &#39;1&#39;, &#39;${SRC_URI_MBEDTLS}&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0# Update license variables<br>
-LICENSE:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;, &#39;=
1&#39;, &#39; &amp; Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
+LICENSE:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;, &#39;=
1&#39;, &#39; AND Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0LIC_FILES_CHKSUM:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDT=
LS&#39;, &#39;1&#39;, &#39; ${LIC_FILES_CHKSUM_MBEDTLS}&#39;, &#39;&#39;, d=
)}&quot;<br>
=C2=A0# add mbed TLS to version<br>
=C2=A0SRCREV_FORMAT:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&=
#39;, &#39;1&#39;, &#39;_mbedtls&#39;, &#39;&#39;, d)}&quot;<br>
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a =
href=3D"http://gcc-aarch64-none-elf_15.3.rel1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-aarch64-none-elf_15.3.rel1.bb</a> b/meta-arm-toolchain/reci=
pes-devtools/external-arm-toolchain/<a href=3D"http://gcc-aarch64-none-elf_=
15.3.rel1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-aarch64-none-elf_15.=
3.rel1.bb</a><br>
index 447db59cd4..05d6a9f952 100644<br>
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a href=3D=
"http://gcc-aarch64-none-elf_15.3.rel1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcc-aarch64-none-elf_15.3.rel1.bb</a><br>
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a href=3D=
"http://gcc-aarch64-none-elf_15.3.rel1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcc-aarch64-none-elf_15.3.rel1.bb</a><br>
@@ -6,7 +6,7 @@ require arm-binary-toolchain.inc<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(x86_64|aarch64).*-linux&quot;<br>
<br>
=C2=A0SUMMARY =3D &quot;Arm GNU Toolchain - AArch64 bare-metal target (aarc=
h64-none-elf)&quot;<br>
-LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPL-3.0-only&quot;<br>
+LICENSE =3D &quot;GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception=
-3.1&quot;<br></blockquote><div><br></div><div>Per discussion, this should =
be &quot;GPL-3.0-only AND=C2=A0GPL-3.0-or-later WITH GCC-exception-3.1&quot=
;</div><div><br></div><div>Ross, did the script auto change this one or did=
 you hand edit it?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
=C2=A0LIC_FILES_CHKSUM:aarch64 =3D &quot;file://share/doc/gcc/Copying.html;=
md5=3D90014a59d1783b37a10240d4d0002c6e&quot;<br>
=C2=A0LIC_FILES_CHKSUM:x86-64 =3D &quot;file://share/doc/gcc/Copying.html;m=
d5=3D90014a59d1783b37a10240d4d0002c6e&quot;<br>
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a =
href=3D"http://gcc-arm-none-eabi_15.3.rel1.bb" rel=3D"noreferrer" target=3D=
"_blank">gcc-arm-none-eabi_15.3.rel1.bb</a> b/meta-arm-toolchain/recipes-de=
vtools/external-arm-toolchain/<a href=3D"http://gcc-arm-none-eabi_15.3.rel1=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-arm-none-eabi_15.3.rel1.bb</a=
><br>
index 70a3a37289..db7a5dffa2 100644<br>
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a href=3D=
"http://gcc-arm-none-eabi_15.3.rel1.bb" rel=3D"noreferrer" target=3D"_blank=
">gcc-arm-none-eabi_15.3.rel1.bb</a><br>
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a href=3D=
"http://gcc-arm-none-eabi_15.3.rel1.bb" rel=3D"noreferrer" target=3D"_blank=
">gcc-arm-none-eabi_15.3.rel1.bb</a><br>
@@ -6,7 +6,7 @@ require arm-binary-toolchain.inc<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(x86_64|aarch64).*-linux&quot;<br>
<br>
=C2=A0SUMMARY =3D &quot;Arm GNU Toolchain - AArch32 bare-metal target (arm-=
none-eabi)&quot;<br>
-LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPL-3.0-only&quot;<br>
+LICENSE =3D &quot;GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception=
-3.1&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM:aarch64 =3D &quot;file://share/doc/gcc/Copying.html;=
md5=3D90014a59d1783b37a10240d4d0002c6e&quot;<br>
=C2=A0LIC_FILES_CHKSUM:x86-64 =3D &quot;file://share/doc/gcc/Copying.html;m=
d5=3D90014a59d1783b37a10240d4d0002c6e&quot;<br>
diff --git a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.14.0.=
bb" rel=3D"noreferrer" target=3D"_blank">hafnium_2.14.0.bb</a> b/meta-arm/r=
ecipes-bsp/hafnium/<a href=3D"http://hafnium_2.14.0.bb" rel=3D"noreferrer" =
target=3D"_blank">hafnium_2.14.0.bb</a><br>
index f8a374b7f0..0dfa2dace6 100644<br>
--- a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.14.0.bb" rel=
=3D"noreferrer" target=3D"_blank">hafnium_2.14.0.bb</a><br>
+++ b/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.14.0.bb" rel=
=3D"noreferrer" target=3D"_blank">hafnium_2.14.0.bb</a><br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;Hafnium&quot;<br>
=C2=A0DESCRIPTION =3D &quot;A reference Secure Partition Manager (SPM) for =
systems that implement the Armv8.4-A Secure-EL2 extension&quot;<br>
=C2=A0DEPENDS =3D &quot;gn-native ninja-native bison-native bc-native dtc-n=
ative openssl-native clang-native lld-native&quot;<br>
<br>
-LICENSE =3D &quot;BSD-3-Clause &amp; GPL-2.0-only&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause AND GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D782b40c14bad5294672c5=
00501edc103&quot;<br>
<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-arm/=
recipes-bsp/scp-firmware/scp-firmware.inc<br>
index 032445b3bd..495b0f2905 100644<br>
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc<br>
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc<br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;SCP and MCP Firmware&quot;<br>
=C2=A0DESCRIPTION =3D &quot;Firmware for SCP and MCP software reference imp=
lementation&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://gitlab.arm.com/firmware/SCP-fir=
mware" rel=3D"noreferrer" target=3D"_blank">https://gitlab.arm.com/firmware=
/SCP-firmware</a>&quot;<br>
<br>
-LICENSE =3D &quot;BSD-3-Clause &amp; Apache-2.0&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://license.md;beginline=3D5;md5=3D9db9=
e3d2fb8d9300a6c3d15101b19731 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c=
29e&quot;<br>
<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a=
-tests_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.14.0.bb=
</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests=
_2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.14.0.bb</a><b=
r>
index a65106f24e..e876bd1eaa 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests_=
2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.14.0.bb</a><br=
>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests_=
2.14.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.14.0.bb</a><br=
>
@@ -1,5 +1,5 @@<br>
=C2=A0DESCRIPTION =3D &quot;Trusted Firmware-A tests(aka TFTF)&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause &amp; NCSA&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause AND NCSA&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM +=3D &quot;file://docs/license.rst;md5=3D6175cc0aa2e=
63b6d21a32aa0ee7d1b4a&quot;<br>
<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a=
-tests_2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.15.0.bb=
</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests=
_2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.15.0.bb</a><b=
r>
index 8bd5dd5643..17951766e1 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests_=
2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.15.0.bb</a><br=
>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tf-a-tests_=
2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">tf-a-tests_2.15.0.bb</a><br=
>
@@ -1,5 +1,5 @@<br>
=C2=A0DESCRIPTION =3D &quot;Trusted Firmware-A tests(aka TFTF)&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause &amp; NCSA&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause AND NCSA&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM +=3D &quot;file://docs/license.rst;md5=3D6175cc0aa2e=
63b6d21a32aa0ee7d1b4a&quot;<br>
<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=
 b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
index 211196b5f8..1e06559ce2 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0DESCRIPTION =3D &quot;Trusted Firmware-A&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://trustedfirmware-a.readthedocs.i=
o/" rel=3D"noreferrer" target=3D"_blank">https://trustedfirmware-a.readthed=
ocs.io/</a>&quot;<br>
-LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause &amp; MIT &amp; Apache-2=
.0&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT&quo=
t;<br>
<br>
=C2=A0inherit firmware<br>
<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trus=
ted-firmware-a_2.14.2.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firm=
ware-a_2.14.2.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"h=
ttp://trusted-firmware-a_2.14.2.bb" rel=3D"noreferrer" target=3D"_blank">tr=
usted-firmware-a_2.14.2.bb</a><br>
index 3d0b80188e..9c70d0b581 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fir=
mware-a_2.14.2.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-a_=
2.14.2.bb</a><br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fir=
mware-a_2.14.2.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-a_=
2.14.2.bb</a><br>
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D &quot;&quot;<br>
=C2=A0# add MBEDTLS to our sources if activated<br>
=C2=A0SRC_URI:append =3D &quot; ${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;,=
 &#39;1&#39;, &#39;${SRC_URI_MBEDTLS}&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0# Update license variables<br>
-LICENSE:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;, &#39;=
1&#39;, &#39; &amp; Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
+LICENSE:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;, &#39;=
1&#39;, &#39; AND Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0LIC_FILES_CHKSUM:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDT=
LS&#39;, &#39;1&#39;, &#39; ${LIC_FILES_CHKSUM_MBEDTLS}&#39;, &#39;&#39;, d=
)}&quot;<br>
=C2=A0# add mbed TLS to version<br>
=C2=A0SRCREV_FORMAT:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&=
#39;, &#39;1&#39;, &#39;_mbedtls&#39;, &#39;&#39;, d)}&quot;<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2=
.2-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2=
.2-src.inc<br>
index ddaab88e8b..8fb0265e94 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-src.=
inc<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-src.=
inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0# Common src definitions for trusted-firmware-m and trusted-firmware-=
m-scripts<br>
<br>
-LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause &amp; Apache-2.0&quot;<b=
r>
+LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://license.rst;md5=3D07f368487da347f3c=
7bd0fc3085f3afa \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69fb341=
1f390 \<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3=
.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3=
.0-src.inc<br>
index d3ab29d0e2..4ed6d8cb80 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-src.=
inc<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-src.=
inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0# Common src definitions for trusted-firmware-m and trusted-firmware-=
m-scripts<br>
<br>
-LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause &amp; Apache-2.0&quot;<b=
r>
+LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://license.rst;md5=3D002a64dec64b82c58=
a203a94bee7b2a1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69fb341=
1f390 \<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git=
-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-s=
rc.inc<br>
index 7bea317cf3..ffc6200e77 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.in=
c<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.in=
c<br>
@@ -1,6 +1,6 @@<br>
=C2=A0# Common src definitions for trusted-firmware-m and trusted-firmware-=
m-scripts<br>
<br>
-LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause &amp; Apache-2.0&quot;<b=
r>
+LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://license.rst;md5=3D07f368487da347f3c=
7bd0fc3085f3afa \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69fb341=
1f390 \<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/<a href=3D"http://tr=
usted-firmware-rmm_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-f=
irmware-rmm_0.6.0.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-rmm/<a hre=
f=3D"http://trusted-firmware-rmm_0.6.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">trusted-firmware-rmm_0.6.0.bb</a><br>
index 60558b6bca..43585982e9 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/<a href=3D"http://trusted-f=
irmware-rmm_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware=
-rmm_0.6.0.bb</a><br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/<a href=3D"http://trusted-f=
irmware-rmm_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware=
-rmm_0.6.0.bb</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0SUMMARY =3D &quot;RMM Firmware&quot;<br>
=C2=A0DESCRIPTION =3D &quot;RMM Firmware for Arm reference platforms&quot;<=
br>
-LICENSE =3D &quot;BSD-3-Clause &amp; MIT&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause AND MIT&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;gitsm://<a href=3D"http://git.trustedfirmware.org/T=
F-RMM/tf-rmm.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=
=3D"_blank">git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3Dhttps;bran=
ch=3Dmain</a>&quot;<br>
=C2=A0SRCREV =3D &quot;7f6bc132caef3596fbb88d3a419c2a3cb499cde2&quot;<br>
diff --git a/meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_7.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">sbsa-acs_7.2.2.bb</a> b/meta-arm/reci=
pes-bsp/uefi/<a href=3D"http://sbsa-acs_7.2.2.bb" rel=3D"noreferrer" target=
=3D"_blank">sbsa-acs_7.2.2.bb</a><br>
index 6d4422f99a..1c4753cbb2 100644<br>
--- a/meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_7.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">sbsa-acs_7.2.2.bb</a><br>
+++ b/meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_7.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">sbsa-acs_7.2.2.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require recipes-bsp/uefi/<a href=3D"http://edk2-firmware_202605.bb" r=
el=3D"noreferrer" target=3D"_blank">edk2-firmware_202605.bb</a><br>
=C2=A0PROVIDES:remove =3D &quot;virtual/bootloader&quot;<br>
<br>
-LICENSE +=3D &quot;&amp; Apache-2.0&quot;<br>
+LICENSE +=3D &quot;AND Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM +=3D &quot;file://ShellPkg/Application/sbsa-acs/LICE=
NSE.md;md5=3D2a944942e1496af1886903d274dedb13&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/ARM-software/sb=
sa-acs;destsuffix=3Dedk2/ShellPkg/Application/sbsa-acs;protocol=3Dhttps;bra=
nch=3Dmaster;name=3Dacs" rel=3D"noreferrer" target=3D"_blank">github.com/AR=
M-software/sbsa-acs;destsuffix=3Dedk2/ShellPkg/Application/sbsa-acs;protoco=
l=3Dhttps;branch=3Dmaster;name=3Dacs</a> \<br>
diff --git a/meta-arm/recipes-devtools/fvp/<a href=3D"http://fvp-base-a-aem=
_11.31.28.bb" rel=3D"noreferrer" target=3D"_blank">fvp-base-a-aem_11.31.28.=
bb</a> b/meta-arm/recipes-devtools/fvp/<a href=3D"http://fvp-base-a-aem_11.=
31.28.bb" rel=3D"noreferrer" target=3D"_blank">fvp-base-a-aem_11.31.28.bb</=
a><br>
index 3c41d05c54..3a4789c57f 100644<br>
--- a/meta-arm/recipes-devtools/fvp/<a href=3D"http://fvp-base-a-aem_11.31.=
28.bb" rel=3D"noreferrer" target=3D"_blank">fvp-base-a-aem_11.31.28.bb</a><=
br>
+++ b/meta-arm/recipes-devtools/fvp/<a href=3D"http://fvp-base-a-aem_11.31.=
28.bb" rel=3D"noreferrer" target=3D"_blank">fvp-base-a-aem_11.31.28.bb</a><=
br>
@@ -1,6 +1,6 @@<br>
=C2=A0require fvp-envelope.inc<br>
<br>
-LICENSE:append =3D &quot; &amp; Artistic-2.0 &amp; BSL-1.0 &amp; BSD-2-Cla=
use &amp; Unlicense&quot;<br>
+LICENSE:append =3D &quot; AND Artistic-2.0 AND BSL-1.0 AND BSD-2-Clause AN=
D Unlicense&quot;<br>
<br>
=C2=A0SUMMARY =3D &quot;Arm Fixed Virtual Platform - Armv-A Base RevC Archi=
tecture Envelope Model FVP&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://license_terms/license_agreement.txt=
;md5=3D1a33828e132ba71861c11688dbb0bd16 \<br>
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/recipe=
s-devtools/fvp/fvp-common.inc<br>
index 5d87cef783..5059985563 100644<br>
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc<br>
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://developer.arm.com/tools-and-sof=
tware/simulation-models/fixed-virtual-platforms" rel=3D"noreferrer" target=
=3D"_blank">https://developer.arm.com/tools-and-software/simulation-models/=
fixed-virtual-platforms</a>&quot;<br>
<br>
=C2=A0LICENSE_FLAGS =3D &quot;Arm-FVP-EULA&quot;<br>
-LICENSE =3D &quot;Proprietary &amp; Apache-2.0 &amp; Python-2.0 &amp; GPL-=
3.0-with-GCC-exception &amp; Zlib &amp; NCSA &amp; LGPL-2.0-or-later &amp; =
MIT &amp; BSD-3-Clause&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-3-Clause AND GPL-3.0-or-later WITH GC=
C-exception-3.1 AND LGPL-2.0-or-later AND MIT AND NCSA AND Python-2.0 AND Z=
lib AND LicenseRef-Proprietary&quot;<br>
<br>
=C2=A0# FVP has an End User License Agreement. Add Arm-FVP-EULA to<br>
=C2=A0# LICENSE_FLAGS_ACCEPTED if the EULA has been accepted, so it can<br>
diff --git a/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator=
-daemon_7.8.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.8.0.b=
b</a> b/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-daem=
on_7.8.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.8.0.bb</a>=
<br>
index ffd308fa95..84681b1585 100644<br>
--- a/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-daemon=
_7.8.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.8.0.bb</a><b=
r>
+++ b/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-daemon=
_7.8.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.8.0.bb</a><b=
r>
@@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/ARM-softwa=
re/gator" rel=3D"noreferrer" target=3D"_blank">https://github.com/ARM-softw=
are/gator</a>&quot;<br>
=C2=A0# configuration requirement specified here:<br>
=C2=A0# <a href=3D"https://github.com/ARM-software/gator#kernel-configurati=
on" rel=3D"noreferrer" target=3D"_blank">https://github.com/ARM-software/ga=
tor#kernel-configuration</a><br>
<br>
-LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-or-later &amp; Apache-2.0&qu=
ot;<br>
+LICENSE =3D &quot;Apache-2.0 AND GPL-2.0-only AND LGPL-2.1-or-later&quot;<=
br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://libsensors/COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516c \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \<br>
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/reci=
pes-security/optee/optee-test.inc<br>
index bb9471bf88..8786d1bb5a 100644<br>
--- a/meta-arm/recipes-security/optee/optee-test.inc<br>
+++ b/meta-arm/recipes-security/optee/optee-test.inc<br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;OP-TEE sanity testsuite&quot;<br>
=C2=A0DESCRIPTION =3D &quot;Open Portable Trusted Execution Environment - T=
est suite&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://www.op-tee.org/" rel=3D"norefer=
rer" target=3D"_blank">https://www.op-tee.org/</a>&quot;<br>
<br>
-LICENSE =3D &quot;BSD-2-Clause &amp; GPL-2.0-only&quot;<br>
+LICENSE =3D &quot;BSD-2-Clause AND GPL-2.0-only&quot;<br>
<br>
=C2=A0inherit python3native ptest<br>
=C2=A0inherit deploy<br>
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-sr=
c.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc=
<br>
index 22cc76ef25..2519b4c297 100644<br>
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc<b=
r>
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc<b=
r>
@@ -1,6 +1,6 @@<br>
=C2=A0# Define sources of Trusted Service and all external dependencies<br>
<br>
-LICENSE =3D &quot;Apache-2.0 &amp; BSD-3-Clause &amp; BSD-2-Clause &amp; Z=
lib&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND Zlib&qu=
ot;<br>
<br>
<br>
=C2=A0FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files:&quot;<br>
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.in=
c b/meta-arm/recipes-security/trusted-services/trusted-services.inc<br>
index bdfccc48fd..c40d70bf8a 100644<br>
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc<br>
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY ?=3D &quot;The Trusted Services: framework for developing roo=
t-of-trust services&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://trusted-services.readthedocs.io=
/en/latest/index.html" rel=3D"noreferrer" target=3D"_blank">https://trusted=
-services.readthedocs.io/en/latest/index.html</a>&quot;<br>
<br>
-LICENSE =3D &quot;Apache-2.0 &amp; BSD-3-Clause &amp; Zlib&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-3-Clause AND Zlib&quot;<br>
<br>
=C2=A0inherit python3native cmake pkgconfig<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7119): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/7119" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/7119</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/120375922/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/120375922/3616693</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEW=
hacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000037755a065724744a--

