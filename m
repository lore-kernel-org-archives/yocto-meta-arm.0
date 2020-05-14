Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.9716.1589453582920690213
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 03:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lz115COV;
 spf=pass (domain: linaro.org, ip: 209.85.167.65, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f65.google.com with SMTP id c21so2235743lfb.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qqw5nJI99KNcu94pbpJEjSl1YxhjiNDAKoqilmK6HPM=;
        b=lz115COVAS/V5kyjFbRwPaBknpmYJ38+r8KS+w334GKfGdn/btg3uij7NHUdgLKoFW
         gObChIftgMuOpEGLoOhoRk1y/kOodKemcESFppeHsWPZfYOdo8tz7hF4kDyvrB8UcHOl
         E2mqioCI8t/K7OY5bHcCgxwsmm/5J6EyPhk79+WUmb8vuveQ29MLdkMF491F/467Xk5f
         qnVoUG6yA2P1K3qOYYCSdYB7D7PVi35XslL5TgCiCqKTQKfAOqm33WDa7dLe4C3Q4Lqr
         T44GYDfWDN2SO11gN2PtIxX/hkY/jz7uvRmvfxlavFb4XOIrxyKuMxmG52o/AAf+CsV9
         ZX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qqw5nJI99KNcu94pbpJEjSl1YxhjiNDAKoqilmK6HPM=;
        b=WO8zGggaB0xXD81BE+TL3ynIf8Ta02a/LKiTPMwsattxoa+iMqMfdWdRJBqaw/Y2O4
         CQSD0n14pS0zsyDQFtbxxEYmiAZzQQ357QzE1u8EL94CLfXwaFS9yPlR2bycg+j+Mpzg
         3FB0ctuBakubTjD02F9SOiRKC2HtbSqWRwqIEhxzv1vK6lRIOQAXDGlJXyqXEY3ujLE0
         RvKpvLTQWjRHvIflDneAEvrXQaN4CL1kBFR0b27eCVlAHz4cDGNyvliP6acQUEpjnH5o
         EN9NIFa0LPvRoHFL514qJeQIls6cV2whLvtEh+XbxTuGLDaUcAAO9cyf4T8uTclhWnbB
         8PxA==
X-Gm-Message-State: AOAM532f1SSDzJDf0LCRWV7qEWhBQfXAVmHugZxWQvUnaRjPxJ633Q4s
	qfQbnBbhl5LASr7je6soSdECjlhZmuLCyV+sOTpi1g==
X-Google-Smtp-Source: ABdhPJxcDVC+ppyBCpQQ96u8/xHZVcgQfRIbVFGw/q8KGny6grEdv6wRoShkn+fkZJwUXOO1nE5PqIKcBCnHUzirSrc=
X-Received: by 2002:ac2:4293:: with SMTP id m19mr2946875lfh.204.1589453581029;
 Thu, 14 May 2020 03:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200514024932.19962-1-jdmason@kudzu.us> <CAFA6WYNWT3pAPSFEsUietGvfNiDx1qBsD2jpqXYZW=ioYFrsZA@mail.gmail.com>
 <DB8PR08MB4969B9107EA587468CEBD944FABC0@DB8PR08MB4969.eurprd08.prod.outlook.com>
In-Reply-To: <DB8PR08MB4969B9107EA587468CEBD944FABC0@DB8PR08MB4969.eurprd08.prod.outlook.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 14 May 2020 16:22:49 +0530
Message-ID: <CAFA6WYM71pk+b_JcjU6FvN1TroPESmyDTmUpnVRKOZm9aFD7qw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
To: Khasim Mohammed <Khasim.Mohammed@arm.com>
Cc: Jon Mason <jdmason@kudzu.us>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khasim,

On Thu, 14 May 2020 at 13:27, Khasim Mohammed <Khasim.Mohammed@arm.com> wro=
te:
>
> Hi Sumit / all
>
> <replying inline>
> ________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> o=
n behalf of Sumit Garg via lists.yoctoproject.org <sumit.garg=3Dlinaro.org@=
lists.yoctoproject.org>
> Sent: Thursday, May 14, 2020 10:33 AM
> To: Jon Mason <jdmason@kudzu.us>
> Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Jo=
shua Watt <JPEWhacker@gmail.com>
> Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: =
Add recipe
>
> Hi Jon,
>
> On Thu, 14 May 2020 at 08:19, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> > and Cortex-M processors from ARM. This toolchain is required to build
> > Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> > some firmware for the M0 coprocessor.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-non=
e-eabi-native_9-2019-q4-major.bb
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-=
native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm=
-none-eabi-native_9-2019-q4-major.bb
>
> > This recipe seems to install the pre-built (external) GCC tool-set for
> > Cortex-R and Cortex-M. So I would suggest you to import it under
> > "meta-arm-toolchain/recipes-devtools/external-arm-toolchain/"
> > directory rather than "meta-arm-toolchain/recipes-devtools/gcc/"
> > directory as it is meant for recipes used to build ARM GCC tool-set
> > from source.
>
> Isn't the external folder importing meta-linaro which is again building f=
rom source ? Please correct me if I am wrong here.

external-arm-toolchain folder is only meant to support prebuilt
toolchains from ARM only. Currently it supports toolchains for
Cortex-A and we can easily extend it to support Cortex-M and Cortex-R.

In case people are interested in using Linaro toolchains then they
should use meta-linaro rather than meta-arm.

>
> So, should we introduce another folder to differentiate the bb recipes th=
at are pulling prebuilt toolchains released by ARM ?

I don't think we need any new folder. But while at it and looking at
various other conversations regarding embed toolchain version
compatibility problems. I would suggest to follow how this has already
been addressed with Cortex-A toolchains. Following is brief
description how prebuilt toolchains are used for Cortex-A:

- A user just downloads a particular version of prebuilt toolset, say
GCC 9.2-2019.12 and simply installs it in "/opt/toolchain/".
- Configures EXTERNAL_TOOLCHAIN=3D/opt/toolchain/gcc-arm-9.2-2019.12-x86_64=
-aarch64-none-linux-gnu/
in local.conf file.

So using the "EXTERNAL_TOOLCHAIN" variable, we don't have to bind the
user to use a particular version of a prebuilt toolchain but the user
is free to choose a prebuilt ARM toolset based on requirement.

I think in similar manner we can depend on "EXTERNAL_EMBED_TOOLCHAIN"
variable to provide embed toolchain path and use that in a common
recipe named "external-arm-embed-toolchain.bb". And relative paths
within this directory are generally fixed which can be used to install
toolchain components to relevant destination folders.

I hope above proposal makes sense and useful.

-Sumit

>
> arm-embedded-gcc-arm-none-eabi  < include bb recipes to fetch ARM prebuil=
t toolchains>
> external-arm-toolchain   <include recipes for toolchains built by third p=
arties>
> gcc <include recipes for building toolchain from source >
>
> -Sumit
>
> Regards,
> Khasim
>
>
>
> > new file mode 100644
> > index 0000000..a0c832d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_=
9-2019-q4-major.bb
> > @@ -0,0 +1,37 @@
> > +# Copyright (C) 2019 Garmin Ltd. or its subsidaries
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +DESCRIPTION =3D "Baremetal GCC for ARM-R and ARM-M processors"
> > +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> > +
> > +LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eabi/license.txt;m=
d5=3Dc18349634b740b7b95f2c2159af888f5"
> > +
> > +PROVIDES =3D "virtual/arm-none-eabi-gcc"
> > +
> > +SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/=
9-2019q4/RC2.1/${BPN}-${PV}-x86_64-linux.tar.bz2"
> > +
> > +SRC_URI[md5sum] =3D "fe0029de4f4ec43cf7008944e34ff8cc"
> > +SRC_URI[sha256sum] =3D "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25=
271e83ec4ff41d177a"
> > +
> > +S =3D "${WORKDIR}/${BPN}-${PV}"
> > +
> > +inherit native
> > +
> > +COMPATIBLE_HOST =3D "x86_64.*-linux"
> > +
> > +do_install() {
> > +    install -d ${D}${datadir}/arm-none-eabi/
> > +    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> > +
> > +    install -d ${D}${bindir}
> > +    # Symlink all executables into bindir
> > +    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> > +        lnr $f ${D}${bindir}/$(basename $f)
> > +    done
> > +}
> > +
> > +INSANE_SKIP_${PN} =3D "already-stripped"
> > +
> > +INHIBIT_SYSROOT_STRIP =3D "1"
> > +INHIBIT_PACKAGE_STRIP =3D "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > --
> > 2.20.1
> >
> >
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
