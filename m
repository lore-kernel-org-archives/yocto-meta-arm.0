Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67444C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 01:02:00 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.1874.1645578119467658479
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 17:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1kdvAMr;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id k5so673806uao.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 17:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ko0de6As33cuOQ9lwYn3CTFhHBPyKzDi0fn2UhmgXEU=;
        b=X1kdvAMr2gpVSANC3mbG8eWAjS+JOggWF+6EiF3jrb10e87EEDSHBUvB7nyfc8okuc
         qSwjLMHWiHtRUyZ4VtQA47ZZWDoiA/p94FfoaSiqRu9RzNk84w1JBIDkivJqtGEx+cAk
         duOPd0CK9r9tpUboUV16Ilrut83wft/K/UROyHmDbPTWrc301CPfpSx1Qpgkc5+H8E2y
         gofN94bUTvJ8C4itvl5Zic8t5w22D2M2uRBS2xBiJ23qnfDIt7sbzk5FfT3iV8qt95pU
         Cm39k1VCXUTMgvxFX2WDHwMMLMU9Kcru+vVGR7r0m0bjYPBV7ah4N4jt1tqoAcNJ4x55
         muHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ko0de6As33cuOQ9lwYn3CTFhHBPyKzDi0fn2UhmgXEU=;
        b=l3WodPinT+v6JAA6hZuHx/7HFbIp8v//26UlDjIlQH6sjw5XffP5VAewjB9uMLQV3a
         sqRdWt8IbLLZhTXoXoR8rtbEUjjtqa0LgDw+LMBuzCrzb6b50Jet+FPP7nSife8yRZZ3
         ZzMybZEXnJi/sXK2KEwQyVCPTKUW7Q+xGeU2ZQIH4hgNR8fN+jeVOKd7xg0DNjbSlTWh
         xddca3wc0pUOrNBib6ik5ExaHRpZxeYFvaLyHOaTnaY/UFdd/JfVoX3erUaq65QZSqpH
         oam5jnef79OxoVRxc+zHdRarxK8RHF7WNWiYVqM7pgz03hbihdglW0fNM/qMziPPhVRP
         2Hpw==
X-Gm-Message-State: AOAM532nQXnGBGd1LQYhdJu7zlYFkPLYNnv+bHiKBxeWfF6qm2sGNIz8
	w1biuOs10jQjwWUH9kI9J0aIgwbYcZIFw87Bn+EqfanobwQ=
X-Google-Smtp-Source: 
 ABdhPJzu+6ISpXSizdpNe+DnRCHsTyoWiyh1sU1KPgJtYmmcsu8zP7Cg16x3XmfKccz2MgsnEdf5izGS4h6ylynK3P8=
X-Received: by 2002:ab0:3c4:0:b0:341:ef97:dc24 with SMTP id
 62-20020ab003c4000000b00341ef97dc24mr7575320uau.141.1645578118431; Tue, 22
 Feb 2022 17:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20220222140404.3526965-1-Martin.Jansa@gmail.com>
 <20220222204506.GR26229@denix.org>
In-Reply-To: <20220222204506.GR26229@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 23 Feb 2022 02:01:47 +0100
Message-ID: 
 <CA+chaQeA+KgunMT7yNUzFUH+4j3XbpZfQxBBrX0M5ibvYdeuHw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta: update license names
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003308cd05d8a5030a"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Feb 2022 01:02:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3041

--0000000000003308cd05d8a5030a
Content-Type: text/plain; charset="UTF-8"

I was just running the script, this version was already merged by Ross,
please send a patch for the rest which isn't covered by script.

On Tue, Feb 22, 2022 at 9:45 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, Feb 22, 2022 at 03:04:04PM +0100, Martin Jansa wrote:
> > * openembedded-core/scripts/contrib/convert-spdx-licenses.py .
> >   ...
> >   All files processed with version 0.01
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb         | 2 +-
> >  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb         | 2 +-
> >  .../gcc-aarch64-none-elf_10.3-2021.07.bb                  | 2 +-
> >  .../gcc-arm-none-eabi_10.3-2021.10.bb                     | 2 +-
> >  .../recipes-devtools/external-arm-toolchain/license.inc   | 8 ++++----
> >  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc  | 2 +-
> >  meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb               | 2 +-
> >  .../trusted-firmware-m/trusted-firmware-m_1.5.0.bb        | 2 +-
> >  meta-arm/recipes-devtools/fvp/fvp-common.inc              | 2 +-
> >  .../recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb   | 2 +-
> >  .../recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb   | 2 +-
> >  meta-arm/recipes-kernel/linux/linux-arm64-ack.inc         | 2 +-
> >  meta-arm/recipes-security/optee/optee-test.inc            | 2 +-
> >  meta-gem5/recipes-devtools/gem5/gem5-native.inc           | 2 +-
> >  14 files changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> > index 4dc4a2f..cf6b07f 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> > @@ -6,7 +6,7 @@ application code."
> >  SECTION = "bootloaders"
> >  DEPENDS += "flex-native bison-native"
> >
> > -LICENSE = "GPLv2+"
> > +LICENSE = "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =
> "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
> >  PE = "1"
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
> > index 2d3e95a..d117a88 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
> > @@ -6,7 +6,7 @@ application code."
> >  SECTION = "bootloaders"
> >  DEPENDS += "flex-native bison-native"
> >
> > -LICENSE = "GPLv2+"
> > +LICENSE = "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =
> "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
> >  PE = "1"
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.3-2021.07.bb
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.3-2021.07.bb
> > index c1758a3..02b5b43 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.3-2021.07.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.3-2021.07.bb
> > @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
> >  COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> >
> >  SUMMARY = "Baremetal GCC for Aarch64 processors"
> > -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> >
> >  LIC_FILES_CHKSUM =
> "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> >  LIC_FILES_CHKSUM:aarch64 =
> "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_10.3-2021.10.bb
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_10.3-2021.10.bb
> > index 4100372..ad7e816 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_10.3-2021.10.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-arm-none-eabi_10.3-2021.10.bb
> > @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
> >  COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> >
> >  SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> >
> >  LIC_FILES_CHKSUM =
> "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> >
> > diff --git
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > index 67daa41..10f2542 100644
> > ---
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > @@ -1,4 +1,4 @@
> > -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 &
> LGPLv2.1 & LGPLv2"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only &
> LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
> >
> >  EAT_BFD_LICENSE = "GPL-3.0"
> >  EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>
> You've missed an entire section here with per-package licenses:
>
> EAT_BFD_LICENSE = "GPL-3.0"
> EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> EAT_GDB_LICENSE = "GPL-3.0"
> EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
> EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
>
> At least EAT_GCC_LICENSE and EAT_LIBC_LICENSE need to be updated too.
>
>
> > @@ -73,7 +73,7 @@ LICENSE:libubsan-dev = "${EAT_GCC_LICENSE}"
> >  LICENSE:libubsan = "${EAT_GCC_LICENSE}"
> >  LICENSE:libubsan-staticdev = "${EAT_GCC_LICENSE}"
> >
> > -LICENSE:linux-libc-headers-dev = "GPLv2"
> > -LICENSE:linux-libc-headers = "GPLv2"
> > +LICENSE:linux-libc-headers-dev = "GPL-2.0-only"
> > +LICENSE:linux-libc-headers = "GPL-2.0-only"
> >
> > -LICENSE:gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> > +LICENSE:gdbserver = "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only &
> LGPL-3.0-only"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > index 19eb31b..20e6d3e 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > @@ -18,7 +18,7 @@ FILESEXTRAPATHS =.
> "${FILE_DIRNAME}/gcc-arm-${ARM_GCC_VERSION}:${FILE_DIRNAME}/g
> >  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> >  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native
> flex-native"
> >
> > -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> >
> >  LIC_FILES_CHKSUM = "\
> >      file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> > diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> > index 0452272..96e455f 100644
> > --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> > +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> > @@ -2,7 +2,7 @@ SUMMARY = "Hafnium"
> >  DESCRIPTION = "A reference Secure Partition Manager (SPM) for systems
> that implement the Armv8.4-A Secure-EL2 extension"
> >  DEPENDS = "gn-native ninja-native bison-native bc-native dtc-native
> openssl-native"
> >
> > -LICENSE = "BSD-3-Clause & GPLv2"
> > +LICENSE = "BSD-3-Clause & GPL-2.0-only"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=782b40c14bad5294672c500501edc103"
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.5.0.bb
> > index 619162b..8a1c8cc 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.5.0.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.5.0.bb
> > @@ -8,7 +8,7 @@ DESCRIPTION = "Trusted Firmware-M"
> >  HOMEPAGE = "https://git.trustedfirmware.org/trusted-firmware-m.git"
> >  PROVIDES = "virtual/trusted-firmware-m"
> >
> > -LICENSE = "BSD-3-Clause & Apachev2"
> > +LICENSE = "BSD-3-Clause & Apache-2.0"
> >
> >  LIC_FILES_CHKSUM =
> "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa \
> >
> file://../tf-m-tests/license.rst;md5=02d06ffb8d9f099ff4961c0cb0183a18 \
> > diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > index 3070c73..e9978c1 100644
> > --- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > +++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > @@ -4,7 +4,7 @@ HOMEPAGE = "
> https://developer.arm.com/tools-and-software/simulation-models/fixed
> >  # LICENSE_FLAGS_ACCEPTED if you agree to these terms.
> >  LICENSE_FLAGS = "Arm-FVP-EULA"
> >
> > -LICENSE = "Proprietary & Apache-2.0 & Python-2.0 &
> GPL-3.0-with-GCC-exception & Zlib & NCSA & LGPLv2+ & MIT & BSD-3-Clause"
> > +LICENSE = "Proprietary & Apache-2.0 & Python-2.0 &
> GPL-3.0-with-GCC-exception & Zlib & NCSA & LGPL-2.0-or-later & MIT &
> BSD-3-Clause"
> >
> >  COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> >  FVP_ARCH = "Linux64_GCC-6.4"
> > diff --git a/meta-arm/recipes-devtools/gator-daemon/
> gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/
> gator-daemon_7.7.0.bb
> > index 91b7d64..492d321 100644
> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> > @@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/ARM-software/gator"
> >  # configuration requirement specified here:
> >  # https://github.com/ARM-software/gator#kernel-configuration
> >
> > -LICENSE = "GPLv2 & LGPLv2.1+ & Apache-2.0"
> > +LICENSE = "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263
> \
> >
> file://libsensors/COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
> >
> file://mxml/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
> > diff --git a/meta-arm/recipes-kernel/ffa-debugfs/
> ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/
> ffa-debugfs-mod_2.1.0.bb
> > index 03ce013..4051c34 100644
> > --- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > +++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "FF-A Debugfs Linux kernel module"
> >  DESCRIPTION = "This out-of-tree kernel module exposes FF-A operations
> to user space \
> >  used for development purposes"
> > -LICENSE = "GPLv2"
> > +LICENSE = "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =
> "file://arm_ffa_user.c;beginline=1;endline=1;md5=fcab174c20ea2e2bc0be64b493708266"
> >
> >  SRC_URI = "git://
> git.gitlab.arm.com/linux-arm/linux-trusted-services.git;branch=main;protocol=https
> "
> > diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
> b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
> > index 261e08b..6266c80 100644
> > --- a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
> > +++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
> > @@ -5,7 +5,7 @@
> >
> >  DESCRIPTION = "Linux Android Common Kernel"
> >  SECTION = "kernel"
> > -LICENSE = "GPLv2"
> > +LICENSE = "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =
> "file://${S}/COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> >  require recipes-kernel/linux/linux-yocto.inc
> > diff --git a/meta-arm/recipes-security/optee/optee-test.inc
> b/meta-arm/recipes-security/optee/optee-test.inc
> > index 94cf46f..aada243 100644
> > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > @@ -2,7 +2,7 @@ SUMMARY = "OP-TEE sanity testsuite"
> >  DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
> >  HOMEPAGE = "https://www.op-tee.org/"
> >
> > -LICENSE = "BSD-2-Clause & GPLv2"
> > +LICENSE = "BSD-2-Clause & GPL-2.0-only"
> >  LIC_FILES_CHKSUM =
> "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
> >
> >  inherit python3native ptest
> > diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> > index 9c07aad..91a554b 100644
> > --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> > +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> > @@ -2,7 +2,7 @@
> >
> >  SUMMARY = "A modular platform for computer-system architecture research"
> >  HOMEPAGE = "http://gem5.org"
> > -LICENSE = "BSD-3-Clause & MIT & LGPLv2.1"
> > +LICENSE = "BSD-3-Clause & MIT & LGPL-2.1-only"
> >
> >  # Gem5 build and run parameter
> >
> > --
> > 2.35.1
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>

--0000000000003308cd05d8a5030a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was just running the script, this version was already me=
rged by Ross, please send a patch for the rest which isn&#39;t covered by s=
cript.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Feb 22, 2022 at 9:45 PM Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Tue, Feb 22, 2022 at 03:04:04PM +0100=
, Martin Jansa wrote:<br>
&gt; * openembedded-core/scripts/contrib/convert-spdx-licenses.py .<br>
&gt;=C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0All files processed with version 0.01<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2020.07=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2020.07.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2021.10=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2021.10.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../<a href=3D"http://gcc-aarch64-none-elf_10.3-2021.07.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-aarch64-none-elf_10.3-2021.07.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../<a href=3D"http://gcc-arm-none-eabi_10.3-2021.10.bb" rel=3D"=
noreferrer" target=3D"_blank">gcc-arm-none-eabi_10.3-2021.10.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 .../recipes-devtools/external-arm-toolchain/license.inc=C2=A0 =
=C2=A0| 8 ++++----<br>
&gt;=C2=A0 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc=C2=A0 |=
 2 +-<br>
&gt;=C2=A0 meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.6.bb" r=
el=3D"noreferrer" target=3D"_blank">hafnium_2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../trusted-firmware-m/<a href=3D"http://trusted-firmware-m_1.5.=
0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-m_1.5.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-arm/recipes-devtools/fvp/fvp-common.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../recipes-devtools/gator-daemon/<a href=3D"http://gator-daemon=
_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.7.0.bb</a>=
=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../recipes-kernel/ffa-debugfs/<a href=3D"http://ffa-debugfs-mod=
_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ffa-debugfs-mod_2.1.0.bb</a=
>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-arm/recipes-kernel/linux/linux-arm64-ack.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-arm/recipes-security/optee/optee-test.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-gem5/recipes-devtools/gem5/gem5-native.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 14 files changed, 17 insertions(+), 17 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_=
2020.07.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2020.07.bb</a> b/me=
ta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2020.07.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-boot_2020.07.bb</a><br>
&gt; index 4dc4a2f..cf6b07f 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2020.07=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2020.07.bb</a><br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2020.07=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2020.07.bb</a><br>
&gt; @@ -6,7 +6,7 @@ application code.&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;bootloaders&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;flex-native bison-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://Licenses/README;md5=3D30503fd3=
21432fc713238f582193b78e&quot;<br>
&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_=
2021.10.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2021.10.bb</a> b/me=
ta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2021.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-boot_2021.10.bb</a><br>
&gt; index 2d3e95a..d117a88 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2021.10=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2021.10.bb</a><br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/u-boot/<a href=3D"http://u-boot_2021.10=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2021.10.bb</a><br>
&gt; @@ -6,7 +6,7 @@ application code.&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;bootloaders&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;flex-native bison-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://Licenses/README;md5=3D5a7450c5=
7ffe5ae63fd732446b988025&quot;<br>
&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/<a href=3D"http://gcc-aarch64-none-elf_10.3-2021.07.bb" rel=3D"noreferrer=
" target=3D"_blank">gcc-aarch64-none-elf_10.3-2021.07.bb</a> b/meta-arm-too=
lchain/recipes-devtools/external-arm-toolchain/<a href=3D"http://gcc-aarch6=
4-none-elf_10.3-2021.07.bb" rel=3D"noreferrer" target=3D"_blank">gcc-aarch6=
4-none-elf_10.3-2021.07.bb</a><br>
&gt; index c1758a3..02b5b43 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a hr=
ef=3D"http://gcc-aarch64-none-elf_10.3-2021.07.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-aarch64-none-elf_10.3-2021.07.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a hr=
ef=3D"http://gcc-aarch64-none-elf_10.3-2021.07.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-aarch64-none-elf_10.3-2021.07.bb</a><br>
&gt; @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc<br>
&gt;=C2=A0 COMPATIBLE_HOST =3D &quot;(x86_64|aarch64).*-linux&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SUMMARY =3D &quot;Baremetal GCC for Aarch64 processors&quot;<br>
&gt; -LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<br>
&gt; +LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPL-3.0-only&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;${@d.getVar(d.expand(&quot;LIC_FILES_=
CHKSUM_${HOST_ARCH}&quot;))}&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM:aarch64 =3D &quot;file://share/doc/gcc/Copying.=
html;md5=3Dd06ace534ed0851debcb7140c5b5116e&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/<a href=3D"http://gcc-arm-none-eabi_10.3-2021.10.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-arm-none-eabi_10.3-2021.10.bb</a> b/meta-arm-toolchain=
/recipes-devtools/external-arm-toolchain/<a href=3D"http://gcc-arm-none-eab=
i_10.3-2021.10.bb" rel=3D"noreferrer" target=3D"_blank">gcc-arm-none-eabi_1=
0.3-2021.10.bb</a><br>
&gt; index 4100372..ad7e816 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a hr=
ef=3D"http://gcc-arm-none-eabi_10.3-2021.10.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-arm-none-eabi_10.3-2021.10.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a hr=
ef=3D"http://gcc-arm-none-eabi_10.3-2021.10.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-arm-none-eabi_10.3-2021.10.bb</a><br>
&gt; @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc<br>
&gt;=C2=A0 COMPATIBLE_HOST =3D &quot;(x86_64|aarch64).*-linux&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SUMMARY =3D &quot;Baremetal GCC for ARM-R and ARM-M processors&q=
uot;<br>
&gt; -LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<br>
&gt; +LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPL-3.0-only&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://share/doc/gcc-arm-none-eabi/li=
cense.txt;md5=3Dc18349634b740b7b95f2c2159af888f5&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/=
license.inc<br>
&gt; index 67daa41..10f2542 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/licen=
se.inc<br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/licen=
se.inc<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3 &amp; GPLv2 =
&amp; LGPLv3 &amp; LGPLv2.1 &amp; LGPLv2&quot;<br>
&gt; +LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPL-3.0-only &amp;=
 GPL-2.0-only &amp; LGPL-3.0-only &amp; LGPL-2.1-only &amp; LGPL-2.0-only&q=
uot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EAT_BFD_LICENSE =3D &quot;GPL-3.0&quot;<br>
&gt;=C2=A0 EAT_GCC_LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3=
&quot;<br>
<br>
You&#39;ve missed an entire section here with per-package licenses:<br>
<br>
EAT_BFD_LICENSE =3D &quot;GPL-3.0&quot;<br>
EAT_GCC_LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<br>
EAT_GDB_LICENSE =3D &quot;GPL-3.0&quot;<br>
EAT_LIBC_LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
EAT_RLE_LICENSE =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
<br>
At least EAT_GCC_LICENSE and EAT_LIBC_LICENSE need to be updated too.<br>
<br>
<br>
&gt; @@ -73,7 +73,7 @@ LICENSE:libubsan-dev =3D &quot;${EAT_GCC_LICENSE}&qu=
ot;<br>
&gt;=C2=A0 LICENSE:libubsan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt;=C2=A0 LICENSE:libubsan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br=
>
&gt;=C2=A0 <br>
&gt; -LICENSE:linux-libc-headers-dev =3D &quot;GPLv2&quot;<br>
&gt; -LICENSE:linux-libc-headers =3D &quot;GPLv2&quot;<br>
&gt; +LICENSE:linux-libc-headers-dev =3D &quot;GPL-2.0-only&quot;<br>
&gt; +LICENSE:linux-libc-headers =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE:gdbserver =3D &quot;GPLv2 &amp; GPLv3 &amp; LGPLv2 &amp; LGPL=
v3&quot;<br>
&gt; +LICENSE:gdbserver =3D &quot;GPL-2.0-only &amp; GPL-3.0-only &amp; LGP=
L-2.0-only &amp; LGPL-3.0-only&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc =
b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc<br>
&gt; index 19eb31b..20e6d3e 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc<br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc<br>
&gt; @@ -18,7 +18,7 @@ FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-arm-$=
{ARM_GCC_VERSION}:${FILE_DIRNAME}/g<br>
&gt;=C2=A0 DEPENDS =3D+ &quot;mpfr gmp libmpc zlib flex-native&quot;<br>
&gt;=C2=A0 NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-n=
ative flex-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<br>
&gt; +LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPL-3.0-only&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \<br>
&gt; diff --git a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.=
6.bb" rel=3D"noreferrer" target=3D"_blank">hafnium_2.6.bb</a> b/meta-arm/re=
cipes-bsp/hafnium/<a href=3D"http://hafnium_2.6.bb" rel=3D"noreferrer" targ=
et=3D"_blank">hafnium_2.6.bb</a><br>
&gt; index 0452272..96e455f 100644<br>
&gt; --- a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.6.bb" r=
el=3D"noreferrer" target=3D"_blank">hafnium_2.6.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.6.bb" r=
el=3D"noreferrer" target=3D"_blank">hafnium_2.6.bb</a><br>
&gt; @@ -2,7 +2,7 @@ SUMMARY =3D &quot;Hafnium&quot;<br>
&gt;=C2=A0 DESCRIPTION =3D &quot;A reference Secure Partition Manager (SPM)=
 for systems that implement the Armv8.4-A Secure-EL2 extension&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;gn-native ninja-native bison-native bc-native =
dtc-native openssl-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;BSD-3-Clause &amp; GPLv2&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause &amp; GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D782b40c14bad5294=
672c500501edc103&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/<a href=3D"http:/=
/trusted-firmware-m_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-=
firmware-m_1.5.0.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-m/<a href=
=3D"http://trusted-firmware-m_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank=
">trusted-firmware-m_1.5.0.bb</a><br>
&gt; index 619162b..8a1c8cc 100644<br>
&gt; --- a/meta-arm/recipes-bsp/trusted-firmware-m/<a href=3D"http://truste=
d-firmware-m_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmwar=
e-m_1.5.0.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/trusted-firmware-m/<a href=3D"http://truste=
d-firmware-m_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmwar=
e-m_1.5.0.bb</a><br>
&gt; @@ -8,7 +8,7 @@ DESCRIPTION =3D &quot;Trusted Firmware-M&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://git.trustedfirmware.org/tr=
usted-firmware-m.git" rel=3D"noreferrer" target=3D"_blank">https://git.trus=
tedfirmware.org/trusted-firmware-m.git</a>&quot;<br>
&gt;=C2=A0 PROVIDES =3D &quot;virtual/trusted-firmware-m&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;BSD-3-Clause &amp; Apachev2&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause &amp; Apache-2.0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://license.rst;md5=3D07f368487da3=
47f3c7bd0fc3085f3afa \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://../tf-m-tests/license.rst;md5=3D02d06ffb8d9f099ff4961c0cb0183=
a18 \<br>
&gt; diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/r=
ecipes-devtools/fvp/fvp-common.inc<br>
&gt; index 3070c73..e9978c1 100644<br>
&gt; --- a/meta-arm/recipes-devtools/fvp/fvp-common.inc<br>
&gt; +++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc<br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://developer.arm.co=
m/tools-and-software/simulation-models/fixed" rel=3D"noreferrer" target=3D"=
_blank">https://developer.arm.com/tools-and-software/simulation-models/fixe=
d</a><br>
&gt;=C2=A0 # LICENSE_FLAGS_ACCEPTED if you agree to these terms.<br>
&gt;=C2=A0 LICENSE_FLAGS =3D &quot;Arm-FVP-EULA&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;Proprietary &amp; Apache-2.0 &amp; Python-2.0 &amp;=
 GPL-3.0-with-GCC-exception &amp; Zlib &amp; NCSA &amp; LGPLv2+ &amp; MIT &=
amp; BSD-3-Clause&quot;<br>
&gt; +LICENSE =3D &quot;Proprietary &amp; Apache-2.0 &amp; Python-2.0 &amp;=
 GPL-3.0-with-GCC-exception &amp; Zlib &amp; NCSA &amp; LGPL-2.0-or-later &=
amp; MIT &amp; BSD-3-Clause&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 COMPATIBLE_HOST =3D &#39;(x86_64|i.86).*-linux&#39;<br>
&gt;=C2=A0 FVP_ARCH =3D &quot;Linux64_GCC-6.4&quot;<br>
&gt; diff --git a/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://=
gator-daemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.=
7.0.bb</a> b/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator=
-daemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.7.0.b=
b</a><br>
&gt; index 91b7d64..492d321 100644<br>
&gt; --- a/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-d=
aemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.7.0.bb<=
/a><br>
&gt; +++ b/meta-arm/recipes-devtools/gator-daemon/<a href=3D"http://gator-d=
aemon_7.7.0.bb" rel=3D"noreferrer" target=3D"_blank">gator-daemon_7.7.0.bb<=
/a><br>
&gt; @@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/ARM-s=
oftware/gator" rel=3D"noreferrer" target=3D"_blank">https://github.com/ARM-=
software/gator</a>&quot;<br>
&gt;=C2=A0 # configuration requirement specified here:<br>
&gt;=C2=A0 # <a href=3D"https://github.com/ARM-software/gator#kernel-config=
uration" rel=3D"noreferrer" target=3D"_blank">https://github.com/ARM-softwa=
re/gator#kernel-configuration</a><br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1+ &amp; Apache-2.0&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-or-later &amp; Apache-2=
.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://libsensors/COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516=
c \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \<br>
&gt; diff --git a/meta-arm/recipes-kernel/ffa-debugfs/<a href=3D"http://ffa=
-debugfs-mod_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ffa-debugfs-mod=
_2.1.0.bb</a> b/meta-arm/recipes-kernel/ffa-debugfs/<a href=3D"http://ffa-d=
ebugfs-mod_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ffa-debugfs-mod_2=
.1.0.bb</a><br>
&gt; index 03ce013..4051c34 100644<br>
&gt; --- a/meta-arm/recipes-kernel/ffa-debugfs/<a href=3D"http://ffa-debugf=
s-mod_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ffa-debugfs-mod_2.1.0.=
bb</a><br>
&gt; +++ b/meta-arm/recipes-kernel/ffa-debugfs/<a href=3D"http://ffa-debugf=
s-mod_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ffa-debugfs-mod_2.1.0.=
bb</a><br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;FF-A Debugfs Linux kernel module&quot;<br>
&gt;=C2=A0 DESCRIPTION =3D &quot;This out-of-tree kernel module exposes FF-=
A operations to user space \<br>
&gt;=C2=A0 used for development purposes&quot;<br>
&gt; -LICENSE =3D &quot;GPLv2&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://arm_ffa_user.c;beginline=3D1;e=
ndline=3D1;md5=3Dfcab174c20ea2e2bc0be64b493708266&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.gitlab.arm.com/lin=
ux-arm/linux-trusted-services.git;branch=3Dmain;protocol=3Dhttps" rel=3D"no=
referrer" target=3D"_blank">git.gitlab.arm.com/linux-arm/linux-trusted-serv=
ices.git;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
&gt; diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc b/meta-=
arm/recipes-kernel/linux/linux-arm64-ack.inc<br>
&gt; index 261e08b..6266c80 100644<br>
&gt; --- a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc<br>
&gt; +++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc<br>
&gt; @@ -5,7 +5,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DESCRIPTION =3D &quot;Linux Android Common Kernel&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;kernel&quot;<br>
&gt; -LICENSE =3D &quot;GPLv2&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${S}/COPYING;md5=3D6bc538ed5bd=
9a7fc9398086aedcd7e46&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require recipes-kernel/linux/linux-yocto.inc<br>
&gt; diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm=
/recipes-security/optee/optee-test.inc<br>
&gt; index 94cf46f..aada243 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/optee-test.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee-test.inc<br>
&gt; @@ -2,7 +2,7 @@ SUMMARY =3D &quot;OP-TEE sanity testsuite&quot;<br>
&gt;=C2=A0 DESCRIPTION =3D &quot;Open Portable Trusted Execution Environmen=
t - Test suite&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://www.op-tee.org/" rel=3D"no=
referrer" target=3D"_blank">https://www.op-tee.org/</a>&quot;<br>
&gt;=C2=A0 <br>
&gt; -LICENSE =3D &quot;BSD-2-Clause &amp; GPLv2&quot;<br>
&gt; +LICENSE =3D &quot;BSD-2-Clause &amp; GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE.md;md5=3Ddaa2bccc=
c666345ab8940aab1315a4fa&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit python3native ptest<br>
&gt; diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-ge=
m5/recipes-devtools/gem5/gem5-native.inc<br>
&gt; index 9c07aad..91a554b 100644<br>
&gt; --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc<br>
&gt; +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc<br>
&gt; @@ -2,7 +2,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SUMMARY =3D &quot;A modular platform for computer-system archite=
cture research&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://gem5.org" rel=3D"noreferrer=
" target=3D"_blank">http://gem5.org</a>&quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause &amp; MIT &amp; LGPLv2.1&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause &amp; MIT &amp; LGPL-2.1-only&quot;<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Gem5 build and run parameter<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <br>
<br>
-- <br>
Regards,<br>
Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">=
denis@denix.org</a>&gt;<br>
PGP: 0x420902729A92C964 - <a href=3D"https://denix.org/0x420902729A92C964" =
rel=3D"noreferrer" target=3D"_blank">https://denix.org/0x420902729A92C964</=
a><br>
Fingerprint: 25FC E4A5 8A72 2F69 1186=C2=A0 6D76 4209 0272 9A92 C964<br>
</blockquote></div>

--0000000000003308cd05d8a5030a--

