Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.147.1592420291246494052
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 11:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KEozH4V4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id b27so3118325qka.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2020 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9/7keM09xrCpo86ieC7oSXsvUqYUFIIIgKOGrybyccg=;
        b=KEozH4V46X9bS1zNZf9NMCldc+bMBkBiYohnBAuQ9c/FL6OZeiPDj1Sz+xd3ivYcpp
         2ND3NYfktLiUTm31A4vPqyiky9j3XQ5GIABCxTzasMAE+08tsMNHyeDTEpFC7cwtkPTO
         ZHbJuZyUgOOyd8guHDWiGVMtwXWWmRvKYtgBv+ZqcDIBZeRZgVBFDK9NFDR3RXZ/e9/X
         T71U6XuwzLLzTw7DkQLBq+nOcrHfxhGAsEQcT5JHtSPhm16So3sWfxC4P9bWE5SSwlr6
         sp7UmS99Fts+H7Hwm4Am7QvJP6k1ldw3IXwNTubKTvh5qjtJp3Lv/p6GOnuqsVGgcMHK
         C2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9/7keM09xrCpo86ieC7oSXsvUqYUFIIIgKOGrybyccg=;
        b=DoZ5otqJYrAEy9bFAmxYolkqaFw8AY/fvEW+u4e0blzcBcTIP/2DP/VSqq2Gono8yb
         iALFaMeB4lxfnxgL9HiKEO7kCJKEsJWuTsIm7iO24Ns95HYnXJbtV/Co3FBGWZgOD6Pp
         4wB1WE/pDvYYBA9faWK+Gbu5egc6KgCxRMsaba2ySbOfSl+Ho1Nhl2FGw1E1tKAftUnO
         IrB6zDrcjrKoAtAcaGCCQR/+3YYYdp9DZDYRlbhlh81quS/KK/KCxz2dIgFwv2TbmvMI
         t3Frp9JD+5wtghsESiFSyP2rZ8KveTdoT5woXJbCMKcVAfw0rLwyrpkKhNrXaMS9cN/d
         hNFA==
X-Gm-Message-State: AOAM530uSVD2cXwFZkET1u4xv11oNeJ7umitrR4tN5dzAwWgFAim8mre
	tikf3Jc0E6UOQMppN6SmX/pF4g==
X-Google-Smtp-Source: ABdhPJzeoE2TEdVRgwwS9m5EOuRG54dcUoaQp4bZLLHXAvVu5ZKC7DCxVsnrY5PwqcgIU+DYwaM3Nw==
X-Received: by 2002:a37:9a57:: with SMTP id c84mr96619qke.248.1592420290285;
        Wed, 17 Jun 2020 11:58:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:94c6:6885:fd31:55fa])
        by smtp.gmail.com with ESMTPSA id m26sm779578qtm.73.2020.06.17.11.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 11:58:09 -0700 (PDT)
Date: Wed, 17 Jun 2020 14:58:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>,
	Denys Dmytriyenko <denis@denix.org>, wmills@ti.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [meta-arm] [PATCH v3 4/5] meta-arm-toolchain: Add README
Message-ID: <20200617185807.GB23329@kudzu.us>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-5-git-send-email-sumit.garg@linaro.org>
 <20200615181632.GA16788@kudzu.us>
 <CAFA6WYMtUoEz4x_pCmp_4AtE+oknZMfZ4HYXg30pHSuWutkVHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMtUoEz4x_pCmp_4AtE+oknZMfZ4HYXg30pHSuWutkVHg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 10:58:20AM +0530, Sumit Garg wrote:
> On Mon, 15 Jun 2020 at 23:46, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Fri, Jun 12, 2020 at 04:02:07PM +0530, Sumit Garg wrote:
> > > Document usage details for GNU Arm toolchains which could either be built
> > > from source or pre-built.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  meta-arm-toolchain/README.md | 113 +++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 113 insertions(+)
> > >  create mode 100644 meta-arm-toolchain/README.md
> > >
> > > diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
> > > new file mode 100644
> > > index 0000000..e415136
> > > --- /dev/null
> > > +++ b/meta-arm-toolchain/README.md
> > > @@ -0,0 +1,113 @@
> > > +meta-arm-toolchain Yocto Layer
> > > +==============================
> > > +
> > > +This layer contains recipes for GNU Arm toolchains which could either be built
> > > +from source or pre-built toolchain binaries.
> > > +
> > > +Information regarding contributing, reporting bugs, etc can be found in the
> > > +top-level meta-arm readme file.
> 
> This comment.
> 
> > > +
> > > +Source Arm toolchain for Linux development
> > > +------------------------------------------
> > > +
> > > +Recipes for GNU Arm toolchain built from source are provided under
> > > +``recipes-devtools/gcc/``. In order to use Arm toolchain instead of OE core
> > > +toolchain, one just needs to override ``GCCVERSION`` in corresponding distro
> > > +conf file.
> > > +
> > > +-  Eg. to use GNU Arm toolchain version ``9.2``
> > > +   GCCVERSION = "arm-9.2"
> > > +
> > > +Pre-built Arm toolchain for Linux development
> > > +---------------------------------------------
> > > +
> > > +Recipes for pre-built GNU Arm toolchain for Linux development are provided under
> > > +``recipes-devtools/external-arm-toolchain/``.
> > > +
> > > +external-arm-toolchain.bb
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +This recipe provides support for pre-built GNU toolchains targeting processors
> > > +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> > > +
> > > +Usage
> > > +^^^^^
> > > +
> > > +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> > > +on), a user needs to download and untar tool-set on host machine at a particular
> > > +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> > > +in ``conf/local.conf`` in order to replace OE toolchain with pre-built GNU-A
> > > +toolchain:
> > > +
> > > +TCMODE = "external-arm"
> > > +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> > > +
> > > +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> > > +   EXTERNAL_TOOLCHAIN = "\
> > > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> > > +   "
> > > +
> > > +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> > > +   EXTERNAL_TOOLCHAIN = "\
> > > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> > > +   "
> > > +
> > > +Supported distros and machines
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> > > +meant to be distro and machine agnostic as long as one is cross-compiling for
> > > +Arm A-profile architecture.
> > > +
> > > +Tested distro and machines (for zeus stable release):
> > > +1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
> > > +2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
> > > +3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for following
> > > +    layers:
> > > +    - poky/meta
> > > +    - poky/meta-poky
> > > +    - poky/meta-yocto-bsp
> > > +    - meta-openembedded/meta-oe
> > > +    - meta-openembedded/meta-python
> > > +    - meta-openembedded/meta-networking
> > > +
> > > +SDK support
> > > +^^^^^^^^^^^
> > > +
> > > +Pre-built toochain provides support to build OE SDK which has been tested using
> > > +following commands:
> > > +
> > > +$ bitbake core-image-base -c populate_sdk
> > > +$ bitbake core-image-base -c testsdk
> > > +
> > > +Note: Currently generated SDK only uses glibc provided by pre-built toolchain.
> > > +      The cross compiler, binutils, gdb/gdbserver etc. are built from source.
> > > +      This is something we would like to improve in future in order to package
> > > +      most of the components from pre-built toolchain instead.
> > > +
> > > +Pre-built Arm toolchain for bare-metal development
> > > +--------------------------------------------------
> > > +
> > > +Recipes for pre-built GNU Arm toolchain for bare-metal development are provided
> > > +under ``recipes-devtools/external-arm-toolchain/``.
> > > +
> > > +gcc-arm-none-eabi_<version>.bb
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> > > +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> > > +Cortex-R and Cortex-M processors.
> > > +
> > > +Supported version: 9-2019-q4-major
> > > +
> > > +gcc-aarch64-none-elf_<version>.bb
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +This recipe provides support for pre-built GNU Arm toolchain for bare-metal
> > > +software development on devices based on 64-bit Arm Cortex-A processors.
> > > +
> > > +Supported version: 9.2-2019.12
> > > +
> > > +Layer maintainer(s)
> > > +-------------------
> > > +* Sumit Garg <sumit.garg@linaro.org>
> >
> > Linaro is the origin of this code, and I think it is important to
> > recognize this.
> 
> Thanks.
> 
> >  However, I would like some clarification as to what
> > this role is recognized to be and how interactions with the community
> > will occur.
> >
> > Specifically, I want all patches on the list and no pull requests.
> > This is an active community, and I want to guarantee that all voices
> > are heard, and comments addressed.  I'm fairly sure you are in
> > agreement with this, as this is what you've been doing already.
> 
> Yes I am in agreement with this.
> 
> > But
> > since we are formalizing this with the above entry, I want it to be
> > written somewhere  :)
> 
> Isn't the comment on top of this README above sufficient to formalize this?

It is sufficient for me.

For giggles, I did a quick look at the contributors since it was
added.

$ git log meta-arm-toolchain/ | grep Author | sort | uniq -c
     14 Author: Denys Dmytriyenko <denys@ti.com>
      2 Author: Jon Mason <jdmason@kudzu.us>
      1 Author: Ralph Siemsen <ralph.siemsen@linaro.org>
      2 Author: Sumit Garg <sumit.garg@linaro.org>

It looks like Denys should probably be a maintainer too.  Given that
he has a unique use case and is testing this throughly (as he's found
my patches to be very lacking).  I don't know if he is interested in
the extra burden of this, but I think you two would make a good pair
and help give some validity to this being a group project.

Anyway, I'll pull this series in now.

Thanks,
Jon

> 
> -Sumit
> 
> >
> > Thanks,
> > Jon
> >
> >
> >
> > > --
> > > 2.7.4
> > >
> >
> > > 
> >
