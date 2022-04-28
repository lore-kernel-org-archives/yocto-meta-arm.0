Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F819C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:36:37 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.9496.1651149394055935667
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 05:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mglP6hei;
 spf=pass (domain: linaro.org, ip: 209.85.215.178,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f178.google.com with SMTP id z21so3886146pgj.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TWdVuUQ/ozHwAcG49pHX1nmZrFTUeDoyTkXw8GqnXVY=;
        b=mglP6heiBM6UOkY5fThAg/PeeVhUqduUfaW/FyjPIFjWELrhQcaJqT1XD83duRNguV
         vkBIbMxM9+EyIvXA/eSoHDysQ3TXkT7Ymfimi0OwNUnNL12hnoD2wR3GqHpDbndQTaUQ
         PqH39/y0arO+045lYYPLlHgPfTy6sKLjuz8Li6/ZbL3aziGdZsmQccHsvhSOkq32r46N
         JCtqExyd6ps6WTgk7tENi+cOcz7JaqC4N2bOnvpFyftSpslUFCHslBDmrNRJ5wm9dcn7
         duuVVBepsTf8i/weMNLRA7R9zYGv/X+SvAO02EUMvy/xHpDd4arVz4e87bsy1Y7GBt5Q
         IO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TWdVuUQ/ozHwAcG49pHX1nmZrFTUeDoyTkXw8GqnXVY=;
        b=6FnBN7dZost2T3x49aUtiMin5UVe+9iQD3RHzJtRtrUuSwqVfN8LKs1gZq1swBbQ7d
         1CfX0tPVg2Bfk4aG+v0hOUL26iRPkg+axk/uGCSL47NIs47UMQW2wHKxv13Tko2qjVYv
         KdMMUYA6L6UCb/i7ehGv3xGj5T9Zr6RNMw1OMlpa2KjTF6q0JnS+f6Ks2DzXj9B1sFyj
         juZX5KQNxotxCx8iaqWN7p9xgU9nKsbDpUAQtA2nTuNjc0fx1EzxrwD9ka9B4S5Haale
         3uvtvZXJL7zwwILByO3j15rB6CxBLeBxynN3qe982nztEAIqv61M17x+GDUIZ8CcOsZI
         IXCg==
X-Gm-Message-State: AOAM533SzKf5miER3xVhOJAIki0lLmfl7ajnfXIkDMOx2sTkv3HNC+nr
	ZZrOgUBvQHRbQ1p4AEw+jc0n6bwUpghDntgYGPLQaA==
X-Google-Smtp-Source: 
 ABdhPJyE2pNacWGhDYl05cErDMrmKRGDcwrd9uqu4OtSmBC6NV/GDN8AgTtUgjhnYMFEF7oXKllpe34bd3dMIDPwkX4=
X-Received: by 2002:a05:6a00:198f:b0:50d:4279:3320 with SMTP id
 d15-20020a056a00198f00b0050d42793320mr20071555pfl.22.1651149393194; Thu, 28
 Apr 2022 05:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220322134327.4090222-1-jon.mason@arm.com>
 <20220322173040.GJ23554@denix.org>
 <CAPoiz9y0MxwurDc0_mHV5_J6knjUW0AAsuyztggvuj_nFsY5cg@mail.gmail.com>
 <20220322192750.GM23554@denix.org>
 <CAPoiz9w50dFv5nJFoPMwkZbsGWF+2ZwfEcbinD0EMw-wKCpxYg@mail.gmail.com>
 <20220330201525.GD23554@denix.org>
 <CAFA6WYMEjPQigWceDmU4EomLZPRzGP1_peR7iDS2ib+HThsSJA@mail.gmail.com>
 <Yk8EhTrO6FxY8XbW@kudzu.us>
In-Reply-To: <Yk8EhTrO6FxY8XbW@kudzu.us>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 Apr 2022 18:06:21 +0530
Message-ID: 
 <CAFA6WYPNuZoc9Tu+om9JVnXeU2MXKVkGJZ=yunZjGOmqD_+7UA@mail.gmail.com>
Subject: Re: [meta-arm] [RFC] arm-toolchain: upgrade toolchains to
 11.2-2002.02
To: Jon Mason <jdmason@kudzu.us>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Apr 2022 12:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3324

Hi Jon,

On Thu, 7 Apr 2022 at 21:04, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Apr 04, 2022 at 07:14:45PM +0530, Sumit Garg wrote:
> > Hi Denys and Jon,
> >
> > On Thu, 31 Mar 2022 at 01:45, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Tue, Mar 22, 2022 at 05:08:41PM -0400, Jon Mason wrote:
> > > > On Tue, Mar 22, 2022 at 3:27 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > > >
> > > > > On Tue, Mar 22, 2022 at 03:20:37PM -0400, Jon Mason wrote:
> > > > > > After a minor change and using -M25%
> > > > >
> > > > > Thanks! The patch is obviously malformed as it was sent as a reply, but
> > > > > otherwise looks good to me.
> > > > >
> > > > > Feel free to add to the real patch:
> > > > >
> > > > > Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> > >
> > > I have to retract my Reviewed-by, as the patch seems incorrect.
> > >
> > >
> > > > If only this one worked.  I'm still seeing the error with do_install
> > > > https://gitlab.com/jonmason00/meta-arm/-/jobs/2236954115
> > > >
> > > > And no actual error in the log, and I'm not sure where to begin
> > > > debugging it without an error in the log.  You can pull the code down
> > > > from my gitlab
> > > > https://gitlab.com/jonmason00/meta-arm/
> > > > branch dev3
> > > >
> > > > I would really appreciate your reviewed-by for the other patch (as I
> > > > can actually confirm it works in our CI, and I'd like to get it in
> > > > before the code freeze at the end of the month).
> > > > https://lists.yoctoproject.org/g/meta-arm/message/3191
> > >
> > > Here's the thing - you are updating baremetal toolchain recipes, which
> > > download their release tarballs on their own and not by CI.
> > >
> > > You are also changing CI part that downloads Linux toolchain used by
> > > external-toolchain, not by baremetal toolchains.
> > >
> > > So, you are feeding newer 11.2 Linux toolchain release to external-toolchain
> > > recipe that might need updating also due to subtle changes in their release
> > > structure.
> > >
> > > There are 3 different types of toolchains in meta-arm-toolchain:
> > >
> > > 1. ARM Linux toolchain built from sources, then used to build the rest of the
> > > Linux system - recipes-devtool/gcc
> > >
> > > 2. ARM Linux toolchain using prebuilt binaries, expects those binaries to
> > > exist on the host (downloaded by CI) and the recipe then scrapes required
> > > pieces into sysroot, which then used to build the rest of the Linux system -
> > > recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> >
> > Earlier I guessed that it should work without any changes but it looks
> > like GNU-A and GNU-RM merge led to significant changes in libc
> > packaging, see below.
> >
> > >
> > > 3. ARM baremetal toolchains used to build firmware and non-Linux components,
> > > recipes are self-contained and download their binaries on their own -
> > > recipes-devtools/external-arm-toolchain/gcc-$arch-none-{elf/eabi}_*.bb
> > >
> > > All 3 are independent of each other and have no re-use between them, as they
> > > are different. And thus can have different versions. #1 and #2 are mutually
> > > exclusive, as that's your main Linux toolchain. #3 can co-exist with either
> > > one of those two as it's for baremetal components.
> > >
> > >
> > > So, Sumit's first patch updated #1 - source Linux toolchain. His second patch
> > > tried to update CI for #2 - external prebuilt Linux toolchain. That's where
> > > the error is coming from.
> > >
> > > You then re-spinned the patch and besides updating CI for #2 toolchain, also
> > > bumped up #3 baremetal toolchains. The error is still there though and is in
> > > external prebuilt Linux toolchain (#2), not in baremetal toolchains (#3).
> > >
> > > As I said earlier, it seems external-arm-toolchain also needs some adjustments
> > > for 11.2 besides pulling new tarballs in CI.
> > >
> > > I might be able to find some time and look into fixing external-arm-toolchain
> > > to work with 11.2 prebuilt binary release in the next couple days.
> >
> > It looks like there have been a lot of changes to how glibc is
> > packaged into the toolchain. As an example we can no longer find any
> > symlinks to "lib*-${EAT_VER_LIBC}.so" in 11.2 prebuilt toolchain. So I
> > will try to add corresponding support but it may take time with
> > testing involved.
> >
> > > Worst case
> > > scenario - split your patch and only merge baremetal update, leaving CI at
> > > 10.3 for now for external-arm-toolchain...
> >
> > We should go ahead with this strategy.
>
> I would very much like both of the toolchains at the same version, but
> I understand this might not be possible with release schedules being
> what they are and the need for testing.  While waiting for this, we'll
> stick with the split.

Now I am done with the changes involved to support 11.2 binary
toolchain along with testing. Here [1] [2] are corresponding patches.

[1] https://lists.yoctoproject.org/g/meta-arm/message/3322
[2] https://lists.yoctoproject.org/g/meta-arm/message/3323

>
> I appreciate everyone trying to get this done and I'm happy to help in
> any way I can.

Thanks for your offer, really appreciated.

-Sumit

>
> Thanks,
> Jon
>
> >
> > -Sumit
> >
> > >
> > >
> > > PS. it appears Patchwork is missing some patches, specifically both Sumit's
> > > first version to update #1, as well as your second re-spin for the same.
> > > Wonder if it's due to the patch size...
> > >
> > > --
> > > Denys
> > >
> > >
> > > > > > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > > > > > index 838342a1c572..394ce4131b9f 100755
> > > > > > --- a/ci/get-binary-toolchains
> > > > > > +++ b/ci/get-binary-toolchains
> > > > > > @@ -2,7 +2,7 @@
> > > > > >  set -u
> > > > > >
> > > > > >  HOST_ARCH=$(uname -m)
> > > > > > -VER="10.3-2021.07"
> > > > > > +VER="11.2-2022.02"
> > > > > >
> > > > > >  DOWNLOAD_DIR=$1
> > > > > >  TOOLCHAIN_DIR=$2
> > > > > > @@ -15,18 +15,21 @@ if [ $HOST_ARCH = "aarch64" ]; then
> > > > > >         #AArch64 Linux hosted cross compilers
> > > > > >
> > > > > >         #AArch32 target with hard float (arm-none-linux-gnueabihf)
> > > > > > -       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > > +       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > > +
> > > > > > +       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > > > > +       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > > >  elif [ $HOST_ARCH = "x86_64" ]; then
> > > > > >         #x86_64 Linux hosted cross compilers
> > > > > >
> > > > > >         #AArch32 target with hard float (arm-linux-none-gnueabihf)
> > > > > > -       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > > +       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > >
> > > > > >         #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > > > > -       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > > > +       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > > >
> > > > > >         #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> > > > > > -       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > > > > > +       wget -P $DOWNLOAD_DIR -nc
> > > > > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > > > > >  else
> > > > > >         echo "ERROR - Unknown build arch of $HOST_ARCH"
> > > > > >         exit 1
> > > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > > > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > > similarity index 61%
> > > > > > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > > > > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > > index 02b5b43bdd7e..a9e6b581a50e 100644
> > > > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > > @@ -9,16 +9,16 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
> > > > > >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > > > > >
> > > > > >  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > > > > -LIC_FILES_CHKSUM:aarch64 =
> > > > > > "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
> > > > > > -LIC_FILES_CHKSUM:x86-64 =
> > > > > > "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> > > > > > +LIC_FILES_CHKSUM:aarch64 =
> > > > > > "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > > > > +LIC_FILES_CHKSUM:x86-64 =
> > > > > > "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > > > > >
> > > > > > -PROVIDES = "virtual/aarch64-none-elf-gcc"
> > > > > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > > > > >
> > > > > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > > > > -SRC_URI[gnu-a-aarch64.sha256sum] =
> > > > > > "768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
> > > > > > -SRC_URI[gnu-a-x86_64.sha256sum] =
> > > > > > "6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
> > > > > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > > > > +SRC_URI[gnu-a-aarch64.sha256sum] =
> > > > > > "3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
> > > > > > +SRC_URI[gnu-a-x86_64.sha256sum] =
> > > > > > "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"
> > > > > >
> > > > > >  S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > > > > >
> > > > > > -UPSTREAM_CHECK_URI =
> > > > > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
> > > > > > +UPSTREAM_CHECK_URI =
> > > > > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > > > > >  UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > > similarity index 35%
> > > > > > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > > index ad7e81617d74..930bb5261be8 100644
> > > > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > > @@ -8,13 +8,17 @@ COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > > > > >  SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > > > > >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > > > > >
> > > > > > -LIC_FILES_CHKSUM =
> > > > > > "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> > > > > > +LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > > > > +LIC_FILES_CHKSUM:aarch64 =
> > > > > > "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > > > > +LIC_FILES_CHKSUM:x86-64 =
> > > > > > "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > > > > >
> > > > > > -PROVIDES = "virtual/arm-none-eabi-gcc"
> > > > > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > > > > >
> > > > > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
> > > > > > -SRC_URI[gnu-rm-aarch64.sha256sum] =
> > > > > > "f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
> > > > > > -SRC_URI[gnu-rm-x86_64.sha256sum] =
> > > > > > "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
> > > > > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-rm-${HOST_ARCH}"
> > > > > > +SRC_URI[gnu-rm-aarch64.sha256sum] =
> > > > > > "dd861d188f4061a7ef3857c948376f84ef1dfb88a32aded7c336ed7e47e60970"
> > > > > > +SRC_URI[gnu-rm-x86_64.sha256sum] =
> > > > > > "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"
> > > > > >
> > > > > > -UPSTREAM_CHECK_URI =
> > > > > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
> > > > > > -UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
> > > > > > +S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > > > > > +
> > > > > > +UPSTREAM_CHECK_URI =
> > > > > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > > > > > +UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Tue, Mar 22, 2022 at 1:30 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > > >
> > > > > > > On Tue, Mar 22, 2022 at 09:43:27AM -0400, Jon Mason wrote:
> > > > > > > > There is a new and unified version of the toolchains (no longer the RM
> > > > > > > > and A toolchain split).  Update the paths and SHAs to reflect the new
> > > > > > > > location.
> > > > > > > >
> > > > > > > > NOTE: with this change, the binary toolchains do not appear to work
> > > > > > > >
> > > > > > > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > > > > > > ---
> > > > > > > >  ci/get-binary-toolchains                      | 13 ++++++----
> > > > > > > >  ...b => gcc-aarch64-none-elf_11.2-2022.02.bb} | 14 +++++------
> > > > > > > >  .../gcc-arm-none-eabi_10.3-2021.10.bb         | 20 ----------------
> > > > > > > >  .../gcc-arm-none-eabi_11.2-2022.02.bb         | 24 +++++++++++++++++++
> > > > > > > >  4 files changed, 39 insertions(+), 32 deletions(-)
> > > > > > > >  rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-aarch64-none-elf_10.3-2021.07.bb => gcc-aarch64-none-elf_11.2-2022.02.bb} (61%)
> > > > > > > >  delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > > > >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > > >
> > > > > > > Any chance to lower the similarity threshold to make it a diff for review,
> > > > > > > instead of remove/add?
> > > > > > >
> > > > > > >
> > > > > > > > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > > > > > > > index 838342a1c572..394ce4131b9f 100755
> > > > > > > > --- a/ci/get-binary-toolchains
> > > > > > > > +++ b/ci/get-binary-toolchains
> > > > > > > > @@ -2,7 +2,7 @@
> > > > > > > >  set -u
> > > > > > > >
> > > > > > > >  HOST_ARCH=$(uname -m)
> > > > > > > > -VER="10.3-2021.07"
> > > > > > > > +VER="11.2-2022.02"
> > > > > > > >
> > > > > > > >  DOWNLOAD_DIR=$1
> > > > > > > >  TOOLCHAIN_DIR=$2
> > > > > > > > @@ -15,18 +15,21 @@ if [ $HOST_ARCH = "aarch64" ]; then
> > > > > > > >       #AArch64 Linux hosted cross compilers
> > > > > > > >
> > > > > > > >       #AArch32 target with hard float (arm-none-linux-gnueabihf)
> > > > > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > > > > +
> > > > > > > > +     #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > > > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > > > > >  elif [ $HOST_ARCH = "x86_64" ]; then
> > > > > > > >       #x86_64 Linux hosted cross compilers
> > > > > > > >
> > > > > > > >       #AArch32 target with hard float (arm-linux-none-gnueabihf)
> > > > > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > > > >
> > > > > > > >       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > > > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > > > > >
> > > > > > > >       #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> > > > > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > > > > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > > > > > > >  else
> > > > > > > >       echo "ERROR - Unknown build arch of $HOST_ARCH"
> > > > > > > >       exit 1
> > > > > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > > > > similarity index 61%
> > > > > > > > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > > > > > > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > > > > index 02b5b43bdd7e..a9e6b581a50e 100644
> > > > > > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > > > > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > > > > @@ -9,16 +9,16 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
> > > > > > > >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > > > > > > >
> > > > > > > >  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > > > > > > -LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
> > > > > > > > -LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> > > > > > > > +LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > > > > > > +LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > > > > > > >
> > > > > > > > -PROVIDES = "virtual/aarch64-none-elf-gcc"
> > > > > > > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > > > > > > >
> > > > > > > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > > > > > > -SRC_URI[gnu-a-aarch64.sha256sum] = "768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
> > > > > > > > -SRC_URI[gnu-a-x86_64.sha256sum] = "6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
> > > > > > > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > > > > > > +SRC_URI[gnu-a-aarch64.sha256sum] = "3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
> > > > > > > > +SRC_URI[gnu-a-x86_64.sha256sum] = "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"
> > > > > > > >
> > > > > > > >  S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > > > > > > >
> > > > > > > > -UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
> > > > > > > > +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > > > > > > >  UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > > > > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > > > > deleted file mode 100644
> > > > > > > > index ad7e81617d74..000000000000
> > > > > > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > > > > +++ /dev/null
> > > > > > > > @@ -1,20 +0,0 @@
> > > > > > > > -# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> > > > > > > > -# Released under the MIT license (see COPYING.MIT for the terms)
> > > > > > > > -
> > > > > > > > -require arm-binary-toolchain.inc
> > > > > > > > -
> > > > > > > > -COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > > > > > > > -
> > > > > > > > -SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > > > > > > > -LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > > > > > > > -
> > > > > > > > -LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> > > > > > > > -
> > > > > > > > -PROVIDES = "virtual/arm-none-eabi-gcc"
> > > > > > > > -
> > > > > > > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
> > > > > > > > -SRC_URI[gnu-rm-aarch64.sha256sum] = "f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
> > > > > > > > -SRC_URI[gnu-rm-x86_64.sha256sum] = "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
> > > > > > > > -
> > > > > > > > -UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
> > > > > > > > -UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
> > > > > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..4e9fe35789f9
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > > > > @@ -0,0 +1,24 @@
> > > > > > > > +# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> > > > > > > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > > > > > > +
> > > > > > > > +require arm-binary-toolchain.inc
> > > > > > > > +
> > > > > > > > +COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > > > > > > > +
> > > > > > > > +SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > > > > > > > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > > > > > > +
> > > > > > > > +LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > > > > > > +LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > > > > > > +LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > > > > > > > +
> > > > > > > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > > > > > > > +
> > > > > > > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-rm-${HOST_ARCH}"
> > > > > > > > +SRC_URI[gnu-rm-aarch64.sha256sum] = "dd861d188f4061a7ef3857c948376f84ef1dfb88a32aded7c336ed7e47e60970"
> > > > > > > > +SRC_URI[gnu-rm-x86_64.sha256sum] = "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"
> > > > > > > > +
> > > > > > > > +S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > > > > > > > +
> > > > > > > > +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > > > > > > > +UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > > > > > > > --
> > > > > > > > 2.30.2
> >

