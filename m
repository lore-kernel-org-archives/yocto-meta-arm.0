Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.4474.1592285313890847532
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 22:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gv9MTZ0q;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id c17so21924371lji.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2020 22:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+Ids5yVb/vjN25kRENUhw6jHSJk2Dko/ndNpRQ6naM=;
        b=gv9MTZ0qqTcSaHJi3Qazt1Sk0FE7krmYZPLO+pJ23MWTP1uZIISesYjEux7GImxGrT
         6ddIMy0gfFMTzJvybAAMAJpRFDlXea+2U+RkEkmmHVE05kj7ERX7HQR+K5cOazkvSH8h
         8mH+TmA5t/bwTdRGDBvhxoKE1aVkKpTnNXHt8DSiz6OBTh67sX9gaJSV3Gb56v7W99LO
         djSEYldVlULSZhjf2AM06CpGqXZTYqpCTbj8WNtUJOh3eEY6KSuzoLQyeIoYPEIBUwby
         frK3BJ6pYjQIHqeNjyxRNuDneu1VhO5blbb04g9m7oJyXMDmCbWsKlLhriATS4VFaUsZ
         JjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+Ids5yVb/vjN25kRENUhw6jHSJk2Dko/ndNpRQ6naM=;
        b=rXV2M23hw43jcT6+SkppwzeuRVdwvup8VCi+CoQ5xMbzkNf1et0Nn8xu+WMQFSG6mi
         5kY1k4HmW5TnLKr1ng7ojx0a26lZJajelaq9pko04RJ4ryznUndEb1WouiJ3x634OnOR
         hDPyAWe5SKbyVzQ/z9kCVcdE3yjXdlmaWTs60DxwdGJQwqOSlGD0Y3eQ1gfdmxSqc9w8
         Dqj1k9GdRKZAcdDzzKi/mgh12PKRU2QiysdXBZf0jYAZn5b5tkjOQ+Y19LPQIqi4Mh7G
         FYwk5yWaUsdBpxMirfRqyKwFE1yyycxnpvgD2OE/hFm30+OXNmVoIC0qWnC9wIfjyDdK
         Thiw==
X-Gm-Message-State: AOAM530W3XjAGOPDnYcRByqHy8mH2+nHFX4n5pXMy/cs7KM32Cs7XplQ
	Emw03XGDipRgOVCNxCbkeVx6rWP9tp/z9VBtWKO8Zg==
X-Google-Smtp-Source: ABdhPJyWsCw681nVysnwZUv9kslAZzw16jCIhBhoOsIQ+yNzRg+9AXwJZoiFSQXBaOVy/TszoKujp4gu/QH2bd8RhGo=
X-Received: by 2002:a2e:5c47:: with SMTP id q68mr585645ljb.30.1592285311851;
 Mon, 15 Jun 2020 22:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-5-git-send-email-sumit.garg@linaro.org> <20200615181632.GA16788@kudzu.us>
In-Reply-To: <20200615181632.GA16788@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 16 Jun 2020 10:58:20 +0530
Message-ID: <CAFA6WYMtUoEz4x_pCmp_4AtE+oknZMfZ4HYXg30pHSuWutkVHg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 4/5] meta-arm-toolchain: Add README
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, 
	Denys Dmytriyenko <denis@denix.org>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 23:46, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Jun 12, 2020 at 04:02:07PM +0530, Sumit Garg wrote:
> > Document usage details for GNU Arm toolchains which could either be built
> > from source or pre-built.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  meta-arm-toolchain/README.md | 113 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644 meta-arm-toolchain/README.md
> >
> > diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
> > new file mode 100644
> > index 0000000..e415136
> > --- /dev/null
> > +++ b/meta-arm-toolchain/README.md
> > @@ -0,0 +1,113 @@
> > +meta-arm-toolchain Yocto Layer
> > +==============================
> > +
> > +This layer contains recipes for GNU Arm toolchains which could either be built
> > +from source or pre-built toolchain binaries.
> > +
> > +Information regarding contributing, reporting bugs, etc can be found in the
> > +top-level meta-arm readme file.

This comment.

> > +
> > +Source Arm toolchain for Linux development
> > +------------------------------------------
> > +
> > +Recipes for GNU Arm toolchain built from source are provided under
> > +``recipes-devtools/gcc/``. In order to use Arm toolchain instead of OE core
> > +toolchain, one just needs to override ``GCCVERSION`` in corresponding distro
> > +conf file.
> > +
> > +-  Eg. to use GNU Arm toolchain version ``9.2``
> > +   GCCVERSION = "arm-9.2"
> > +
> > +Pre-built Arm toolchain for Linux development
> > +---------------------------------------------
> > +
> > +Recipes for pre-built GNU Arm toolchain for Linux development are provided under
> > +``recipes-devtools/external-arm-toolchain/``.
> > +
> > +external-arm-toolchain.bb
> > +~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This recipe provides support for pre-built GNU toolchains targeting processors
> > +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> > +
> > +Usage
> > +^^^^^
> > +
> > +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> > +on), a user needs to download and untar tool-set on host machine at a particular
> > +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> > +in ``conf/local.conf`` in order to replace OE toolchain with pre-built GNU-A
> > +toolchain:
> > +
> > +TCMODE = "external-arm"
> > +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> > +
> > +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> > +   EXTERNAL_TOOLCHAIN = "\
> > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> > +   "
> > +
> > +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> > +   EXTERNAL_TOOLCHAIN = "\
> > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> > +   "
> > +
> > +Supported distros and machines
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> > +meant to be distro and machine agnostic as long as one is cross-compiling for
> > +Arm A-profile architecture.
> > +
> > +Tested distro and machines (for zeus stable release):
> > +1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
> > +2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
> > +3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for following
> > +    layers:
> > +    - poky/meta
> > +    - poky/meta-poky
> > +    - poky/meta-yocto-bsp
> > +    - meta-openembedded/meta-oe
> > +    - meta-openembedded/meta-python
> > +    - meta-openembedded/meta-networking
> > +
> > +SDK support
> > +^^^^^^^^^^^
> > +
> > +Pre-built toochain provides support to build OE SDK which has been tested using
> > +following commands:
> > +
> > +$ bitbake core-image-base -c populate_sdk
> > +$ bitbake core-image-base -c testsdk
> > +
> > +Note: Currently generated SDK only uses glibc provided by pre-built toolchain.
> > +      The cross compiler, binutils, gdb/gdbserver etc. are built from source.
> > +      This is something we would like to improve in future in order to package
> > +      most of the components from pre-built toolchain instead.
> > +
> > +Pre-built Arm toolchain for bare-metal development
> > +--------------------------------------------------
> > +
> > +Recipes for pre-built GNU Arm toolchain for bare-metal development are provided
> > +under ``recipes-devtools/external-arm-toolchain/``.
> > +
> > +gcc-arm-none-eabi_<version>.bb
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> > +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> > +Cortex-R and Cortex-M processors.
> > +
> > +Supported version: 9-2019-q4-major
> > +
> > +gcc-aarch64-none-elf_<version>.bb
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This recipe provides support for pre-built GNU Arm toolchain for bare-metal
> > +software development on devices based on 64-bit Arm Cortex-A processors.
> > +
> > +Supported version: 9.2-2019.12
> > +
> > +Layer maintainer(s)
> > +-------------------
> > +* Sumit Garg <sumit.garg@linaro.org>
>
> Linaro is the origin of this code, and I think it is important to
> recognize this.

Thanks.

>  However, I would like some clarification as to what
> this role is recognized to be and how interactions with the community
> will occur.
>
> Specifically, I want all patches on the list and no pull requests.
> This is an active community, and I want to guarantee that all voices
> are heard, and comments addressed.  I'm fairly sure you are in
> agreement with this, as this is what you've been doing already.

Yes I am in agreement with this.

> But
> since we are formalizing this with the above entry, I want it to be
> written somewhere  :)

Isn't the comment on top of this README above sufficient to formalize this?

-Sumit

>
> Thanks,
> Jon
>
>
>
> > --
> > 2.7.4
> >
>
> > 
>
