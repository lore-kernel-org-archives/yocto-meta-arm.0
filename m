Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.1313.1592459254501592503
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 22:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BRKHsR1f;
 spf=pass (domain: linaro.org, ip: 209.85.167.66, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f66.google.com with SMTP id c11so2717288lfh.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2020 22:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XtR6DO9kWD6qajayCDULX3KrPvf5NHa/bWaHvGG851E=;
        b=BRKHsR1f69qLOVOhTfu5QHGiLaBOvMAU9npawwTUr9qOlcLUuoemo0W80xgz+NXWVL
         9yDywMOsHf9mG9woVS/t7BOlr/HO//zUVynF6GF6tahAYut5YEt/INmDT/EbhBzmpFxj
         +nyPmlgCA02B2ygwnXcNPyAsM8nM2wQbEBXtEzV1eXLVcdWd1WpOUF5XQwda5XRM9DX1
         /uzq911OPvRP6wYd0LE3gkMuVmfxsiIeDYE2Ie9WsffnpMx3EdlBvy1nNnr7rv2a/qEY
         sOlZihYYCIRmNnccdzPRgUQ1LpbqAqUPC3uKVM68xaIjTfcBZbs4g4J8Y/80rKbyACUv
         CzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XtR6DO9kWD6qajayCDULX3KrPvf5NHa/bWaHvGG851E=;
        b=QG4MdXoEKR77vG2z2km97jzSQsGiAeSMg7hCmZz20NHW+n7k/1atHl+bx9stRKHY/q
         hceVm5btVUdqXWk3Cv+A8DRGdOrMmg2UB9ioyZ3eordCtG9tEGG+yU2N4uciGioC6yDm
         SCjfsik8tNf0RaFqbiP/hCO4TBbDDqLLlLSCMpWh1yjXWMTbUiH/UWSaunl9oPUfLrv2
         xhsKXgs8Q0xBtAVXAap9q5XIrW+xjmJxe0tMfUW0OZf3xrQqNujyI4ISLisO/e0gxWjI
         OpzgJ59TVVPfysyKDaXmOQIJ6GdL0x+ghN5A1yH93P2cpYWguyMGRug4lvp/Re3uCBLn
         sjWQ==
X-Gm-Message-State: AOAM531ZHoxsaIEt1jNhWe/hXyzfwK2MN39CbajmewLopQWhxNrG9q9G
	xO/QiH3jyi8B+J7+I7GD/ielDcsCp+atrrMlRqQ9Yw==
X-Google-Smtp-Source: ABdhPJy+s/kd0TD7a4wOXpy52eZIo4SE/O9uB2JiexOzU/Ra3V7OwKaJT8aE/7cO/rxHnTY5NkLd/l5SLwc1IIHUcwo=
X-Received: by 2002:ac2:44bb:: with SMTP id c27mr1416209lfm.59.1592459252479;
 Wed, 17 Jun 2020 22:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-5-git-send-email-sumit.garg@linaro.org> <20200615181632.GA16788@kudzu.us>
 <CAFA6WYMtUoEz4x_pCmp_4AtE+oknZMfZ4HYXg30pHSuWutkVHg@mail.gmail.com> <20200617185807.GB23329@kudzu.us>
In-Reply-To: <20200617185807.GB23329@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 18 Jun 2020 11:17:21 +0530
Message-ID: <CAFA6WYMvuoK6Gh4cAw_JxV_jyMb9FRBFbeT91bwq_cVxBk87VA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 4/5] meta-arm-toolchain: Add README
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, 
	Denys Dmytriyenko <denis@denix.org>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2020 at 00:28, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Jun 16, 2020 at 10:58:20AM +0530, Sumit Garg wrote:
> > On Mon, 15 Jun 2020 at 23:46, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Fri, Jun 12, 2020 at 04:02:07PM +0530, Sumit Garg wrote:
> > > > Document usage details for GNU Arm toolchains which could either be built
> > > > from source or pre-built.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > ---
> > > >  meta-arm-toolchain/README.md | 113 +++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 113 insertions(+)
> > > >  create mode 100644 meta-arm-toolchain/README.md
> > > >
> > > > diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
> > > > new file mode 100644
> > > > index 0000000..e415136
> > > > --- /dev/null
> > > > +++ b/meta-arm-toolchain/README.md
> > > > @@ -0,0 +1,113 @@
> > > > +meta-arm-toolchain Yocto Layer
> > > > +==============================
> > > > +
> > > > +This layer contains recipes for GNU Arm toolchains which could either be built
> > > > +from source or pre-built toolchain binaries.
> > > > +
> > > > +Information regarding contributing, reporting bugs, etc can be found in the
> > > > +top-level meta-arm readme file.
> >
> > This comment.
> >
> > > > +
> > > > +Source Arm toolchain for Linux development
> > > > +------------------------------------------
> > > > +
> > > > +Recipes for GNU Arm toolchain built from source are provided under
> > > > +``recipes-devtools/gcc/``. In order to use Arm toolchain instead of OE core
> > > > +toolchain, one just needs to override ``GCCVERSION`` in corresponding distro
> > > > +conf file.
> > > > +
> > > > +-  Eg. to use GNU Arm toolchain version ``9.2``
> > > > +   GCCVERSION = "arm-9.2"
> > > > +
> > > > +Pre-built Arm toolchain for Linux development
> > > > +---------------------------------------------
> > > > +
> > > > +Recipes for pre-built GNU Arm toolchain for Linux development are provided under
> > > > +``recipes-devtools/external-arm-toolchain/``.
> > > > +
> > > > +external-arm-toolchain.bb
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +This recipe provides support for pre-built GNU toolchains targeting processors
> > > > +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> > > > +
> > > > +Usage
> > > > +^^^^^
> > > > +
> > > > +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> > > > +on), a user needs to download and untar tool-set on host machine at a particular
> > > > +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> > > > +in ``conf/local.conf`` in order to replace OE toolchain with pre-built GNU-A
> > > > +toolchain:
> > > > +
> > > > +TCMODE = "external-arm"
> > > > +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> > > > +
> > > > +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> > > > +   EXTERNAL_TOOLCHAIN = "\
> > > > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> > > > +   "
> > > > +
> > > > +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> > > > +   EXTERNAL_TOOLCHAIN = "\
> > > > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> > > > +   "
> > > > +
> > > > +Supported distros and machines
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> > > > +meant to be distro and machine agnostic as long as one is cross-compiling for
> > > > +Arm A-profile architecture.
> > > > +
> > > > +Tested distro and machines (for zeus stable release):
> > > > +1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
> > > > +2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
> > > > +3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for following
> > > > +    layers:
> > > > +    - poky/meta
> > > > +    - poky/meta-poky
> > > > +    - poky/meta-yocto-bsp
> > > > +    - meta-openembedded/meta-oe
> > > > +    - meta-openembedded/meta-python
> > > > +    - meta-openembedded/meta-networking
> > > > +
> > > > +SDK support
> > > > +^^^^^^^^^^^
> > > > +
> > > > +Pre-built toochain provides support to build OE SDK which has been tested using
> > > > +following commands:
> > > > +
> > > > +$ bitbake core-image-base -c populate_sdk
> > > > +$ bitbake core-image-base -c testsdk
> > > > +
> > > > +Note: Currently generated SDK only uses glibc provided by pre-built toolchain.
> > > > +      The cross compiler, binutils, gdb/gdbserver etc. are built from source.
> > > > +      This is something we would like to improve in future in order to package
> > > > +      most of the components from pre-built toolchain instead.
> > > > +
> > > > +Pre-built Arm toolchain for bare-metal development
> > > > +--------------------------------------------------
> > > > +
> > > > +Recipes for pre-built GNU Arm toolchain for bare-metal development are provided
> > > > +under ``recipes-devtools/external-arm-toolchain/``.
> > > > +
> > > > +gcc-arm-none-eabi_<version>.bb
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> > > > +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> > > > +Cortex-R and Cortex-M processors.
> > > > +
> > > > +Supported version: 9-2019-q4-major
> > > > +
> > > > +gcc-aarch64-none-elf_<version>.bb
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +This recipe provides support for pre-built GNU Arm toolchain for bare-metal
> > > > +software development on devices based on 64-bit Arm Cortex-A processors.
> > > > +
> > > > +Supported version: 9.2-2019.12
> > > > +
> > > > +Layer maintainer(s)
> > > > +-------------------
> > > > +* Sumit Garg <sumit.garg@linaro.org>
> > >
> > > Linaro is the origin of this code, and I think it is important to
> > > recognize this.
> >
> > Thanks.
> >
> > >  However, I would like some clarification as to what
> > > this role is recognized to be and how interactions with the community
> > > will occur.
> > >
> > > Specifically, I want all patches on the list and no pull requests.
> > > This is an active community, and I want to guarantee that all voices
> > > are heard, and comments addressed.  I'm fairly sure you are in
> > > agreement with this, as this is what you've been doing already.
> >
> > Yes I am in agreement with this.
> >
> > > But
> > > since we are formalizing this with the above entry, I want it to be
> > > written somewhere  :)
> >
> > Isn't the comment on top of this README above sufficient to formalize this?
>
> It is sufficient for me.
>
> For giggles, I did a quick look at the contributors since it was
> added.
>
> $ git log meta-arm-toolchain/ | grep Author | sort | uniq -c
>      14 Author: Denys Dmytriyenko <denys@ti.com>
>       2 Author: Jon Mason <jdmason@kudzu.us>
>       1 Author: Ralph Siemsen <ralph.siemsen@linaro.org>
>       2 Author: Sumit Garg <sumit.garg@linaro.org>
>
> It looks like Denys should probably be a maintainer too.  Given that
> he has a unique use case and is testing this throughly (as he's found
> my patches to be very lacking).  I don't know if he is interested in
> the extra burden of this, but I think you two would make a good pair
> and help give some validity to this being a group project.
>

It's fine with me. Could you make the corresponding change while
applying or would you like me to spin up the next version?

-Sumit

> Anyway, I'll pull this series in now.
>
> Thanks,
> Jon
>
> >
> > -Sumit
> >
> > >
> > > Thanks,
> > > Jon
> > >
> > >
> > >
> > > > --
> > > > 2.7.4
> > > >
> > >
> > > > 
> > >
