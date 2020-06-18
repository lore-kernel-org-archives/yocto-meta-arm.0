Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.5889.1592520811601219197
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 15:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=lsLbIukR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id i16so5846116qtr.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2020 15:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O647NhlyyD8AGwhesB5VjG1yrubNH4Hr6ENq/8mkljw=;
        b=lsLbIukRnITSvRtl/5ccaa2kNC8zESWnujQWDWeDlh9MQYW+tXJ2J0zPg3C0hOXfix
         q6dXDCn4BGkArNh+wAjIYzSizKUCJ3mp1d8VNWzdHsesxSDAtHOU4zY8Brh2G1pus7By
         aB91xh9adoQ7SNU4gZc6Spu2i8siBz+H4FGbDG/F1dqejnFQxLCdYN0gipYJxyy4JbLS
         g6cZJjVVRAK1oe414BCMiUvYwZNZzPTtF4OWfnzZDCagkZFSLR8nuEQINSG+t02914ZQ
         4cSnnpkIDN2SILerexlt3AQLpLVhWXhfdEu0g86u0FV6u1B7sLLbvf2u7kGREfDL37t9
         da8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O647NhlyyD8AGwhesB5VjG1yrubNH4Hr6ENq/8mkljw=;
        b=LvCwq31gpYib24P+8dqq4ixbcP5FWspfKn2+OwrYLa95Ie2hmsoKCDtWNDuQzyOviY
         BacZDbcP5dQrYQxC6tp0eqV0PLK94y0NQo7/FUm5ZYNlZmpokYaYdLrQl0+bULUzYp/U
         3rkeZJbZXX5Ik+7l5A8eTiQQw5ynAaf3NNCj/84JIAac5wblyWik+fS7yfhGvpVhrbmz
         U5dWpbv5VZuUO3wooCsV9l8mljRCEWhkf1I4J/1KwPq5bDlpe69RHmXNdEhbGxlNTDkr
         Fhvr1NtIw4CAE82+ZBi1yT3v80r5j6l4VI7j9zbNtmhzQhdHYmoaRDQMjUoQvDzYq2nr
         RgrA==
X-Gm-Message-State: AOAM533XW2sbOrdxOH6YCac7HLQKF9OiD7o97YBcykwff05QoaW+tL8L
	XtW9Wb8T7HPMAqU/a5hPT0v9sQ==
X-Google-Smtp-Source: ABdhPJzelKyzFkF3AYwAwHz/52fonuL7yapkCKtZ/+71WLheyXWCgb9OcGDxpHOnVkuSIUs37romYA==
X-Received: by 2002:ac8:458b:: with SMTP id l11mr576800qtn.111.1592520810492;
        Thu, 18 Jun 2020 15:53:30 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:f04f:fa6f:35e8:ae6f])
        by smtp.gmail.com with ESMTPSA id v3sm4379566qkh.130.2020.06.18.15.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 15:53:30 -0700 (PDT)
Date: Thu, 18 Jun 2020 18:53:28 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>,
	Denys Dmytriyenko <denis@denix.org>, wmills@ti.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [meta-arm] [PATCH v3 4/5] meta-arm-toolchain: Add README
Message-ID: <20200618225328.GE22389@kudzu.us>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-5-git-send-email-sumit.garg@linaro.org>
 <20200615181632.GA16788@kudzu.us>
 <CAFA6WYMtUoEz4x_pCmp_4AtE+oknZMfZ4HYXg30pHSuWutkVHg@mail.gmail.com>
 <20200617185807.GB23329@kudzu.us>
 <CAFA6WYMvuoK6Gh4cAw_JxV_jyMb9FRBFbeT91bwq_cVxBk87VA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMvuoK6Gh4cAw_JxV_jyMb9FRBFbeT91bwq_cVxBk87VA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2020 at 11:17:21AM +0530, Sumit Garg wrote:
> On Thu, 18 Jun 2020 at 00:28, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Tue, Jun 16, 2020 at 10:58:20AM +0530, Sumit Garg wrote:
> > > On Mon, 15 Jun 2020 at 23:46, Jon Mason <jdmason@kudzu.us> wrote:
> > > >
> > > > On Fri, Jun 12, 2020 at 04:02:07PM +0530, Sumit Garg wrote:
> > > > > Document usage details for GNU Arm toolchains which could either be built
> > > > > from source or pre-built.
> > > > >
> > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > ---
> > > > >  meta-arm-toolchain/README.md | 113 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 113 insertions(+)
> > > > >  create mode 100644 meta-arm-toolchain/README.md
> > > > >
> > > > > diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
> > > > > new file mode 100644
> > > > > index 0000000..e415136
> > > > > --- /dev/null
> > > > > +++ b/meta-arm-toolchain/README.md
> > > > > @@ -0,0 +1,113 @@
> > > > > +meta-arm-toolchain Yocto Layer
> > > > > +==============================
> > > > > +
> > > > > +This layer contains recipes for GNU Arm toolchains which could either be built
> > > > > +from source or pre-built toolchain binaries.
> > > > > +
> > > > > +Information regarding contributing, reporting bugs, etc can be found in the
> > > > > +top-level meta-arm readme file.
> > >
> > > This comment.
> > >
> > > > > +
> > > > > +Source Arm toolchain for Linux development
> > > > > +------------------------------------------
> > > > > +
> > > > > +Recipes for GNU Arm toolchain built from source are provided under
> > > > > +``recipes-devtools/gcc/``. In order to use Arm toolchain instead of OE core
> > > > > +toolchain, one just needs to override ``GCCVERSION`` in corresponding distro
> > > > > +conf file.
> > > > > +
> > > > > +-  Eg. to use GNU Arm toolchain version ``9.2``
> > > > > +   GCCVERSION = "arm-9.2"
> > > > > +
> > > > > +Pre-built Arm toolchain for Linux development
> > > > > +---------------------------------------------
> > > > > +
> > > > > +Recipes for pre-built GNU Arm toolchain for Linux development are provided under
> > > > > +``recipes-devtools/external-arm-toolchain/``.
> > > > > +
> > > > > +external-arm-toolchain.bb
> > > > > +~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > +
> > > > > +This recipe provides support for pre-built GNU toolchains targeting processors
> > > > > +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> > > > > +
> > > > > +Usage
> > > > > +^^^^^
> > > > > +
> > > > > +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> > > > > +on), a user needs to download and untar tool-set on host machine at a particular
> > > > > +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> > > > > +in ``conf/local.conf`` in order to replace OE toolchain with pre-built GNU-A
> > > > > +toolchain:
> > > > > +
> > > > > +TCMODE = "external-arm"
> > > > > +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> > > > > +
> > > > > +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> > > > > +   EXTERNAL_TOOLCHAIN = "\
> > > > > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> > > > > +   "
> > > > > +
> > > > > +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> > > > > +   EXTERNAL_TOOLCHAIN = "\
> > > > > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> > > > > +   "
> > > > > +
> > > > > +Supported distros and machines
> > > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > > +
> > > > > +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> > > > > +meant to be distro and machine agnostic as long as one is cross-compiling for
> > > > > +Arm A-profile architecture.
> > > > > +
> > > > > +Tested distro and machines (for zeus stable release):
> > > > > +1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
> > > > > +2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
> > > > > +3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for following
> > > > > +    layers:
> > > > > +    - poky/meta
> > > > > +    - poky/meta-poky
> > > > > +    - poky/meta-yocto-bsp
> > > > > +    - meta-openembedded/meta-oe
> > > > > +    - meta-openembedded/meta-python
> > > > > +    - meta-openembedded/meta-networking
> > > > > +
> > > > > +SDK support
> > > > > +^^^^^^^^^^^
> > > > > +
> > > > > +Pre-built toochain provides support to build OE SDK which has been tested using
> > > > > +following commands:
> > > > > +
> > > > > +$ bitbake core-image-base -c populate_sdk
> > > > > +$ bitbake core-image-base -c testsdk
> > > > > +
> > > > > +Note: Currently generated SDK only uses glibc provided by pre-built toolchain.
> > > > > +      The cross compiler, binutils, gdb/gdbserver etc. are built from source.
> > > > > +      This is something we would like to improve in future in order to package
> > > > > +      most of the components from pre-built toolchain instead.
> > > > > +
> > > > > +Pre-built Arm toolchain for bare-metal development
> > > > > +--------------------------------------------------
> > > > > +
> > > > > +Recipes for pre-built GNU Arm toolchain for bare-metal development are provided
> > > > > +under ``recipes-devtools/external-arm-toolchain/``.
> > > > > +
> > > > > +gcc-arm-none-eabi_<version>.bb
> > > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > +
> > > > > +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> > > > > +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> > > > > +Cortex-R and Cortex-M processors.
> > > > > +
> > > > > +Supported version: 9-2019-q4-major
> > > > > +
> > > > > +gcc-aarch64-none-elf_<version>.bb
> > > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > +
> > > > > +This recipe provides support for pre-built GNU Arm toolchain for bare-metal
> > > > > +software development on devices based on 64-bit Arm Cortex-A processors.
> > > > > +
> > > > > +Supported version: 9.2-2019.12
> > > > > +
> > > > > +Layer maintainer(s)
> > > > > +-------------------
> > > > > +* Sumit Garg <sumit.garg@linaro.org>
> > > >
> > > > Linaro is the origin of this code, and I think it is important to
> > > > recognize this.
> > >
> > > Thanks.
> > >
> > > >  However, I would like some clarification as to what
> > > > this role is recognized to be and how interactions with the community
> > > > will occur.
> > > >
> > > > Specifically, I want all patches on the list and no pull requests.
> > > > This is an active community, and I want to guarantee that all voices
> > > > are heard, and comments addressed.  I'm fairly sure you are in
> > > > agreement with this, as this is what you've been doing already.
> > >
> > > Yes I am in agreement with this.
> > >
> > > > But
> > > > since we are formalizing this with the above entry, I want it to be
> > > > written somewhere  :)
> > >
> > > Isn't the comment on top of this README above sufficient to formalize this?
> >
> > It is sufficient for me.
> >
> > For giggles, I did a quick look at the contributors since it was
> > added.
> >
> > $ git log meta-arm-toolchain/ | grep Author | sort | uniq -c
> >      14 Author: Denys Dmytriyenko <denys@ti.com>
> >       2 Author: Jon Mason <jdmason@kudzu.us>
> >       1 Author: Ralph Siemsen <ralph.siemsen@linaro.org>
> >       2 Author: Sumit Garg <sumit.garg@linaro.org>
> >
> > It looks like Denys should probably be a maintainer too.  Given that
> > he has a unique use case and is testing this throughly (as he's found
> > my patches to be very lacking).  I don't know if he is interested in
> > the extra burden of this, but I think you two would make a good pair
> > and help give some validity to this being a group project.
> >
> 
> It's fine with me. Could you make the corresponding change while
> applying or would you like me to spin up the next version?

I took the silence on this series as an implicit ack and pushed it
this morning before seeing the new comments.  Sorry about that.

Given the above, I committed a single line patch to add Denys as a
co-maintainer and pushed it to master.

So, hopefully no one is pissed off too much with both of the above.
If so, please respond to patches with
"Hold off.  I want to review this before committing".  Otherwise, I'll
take silence as an ack.

Thanks,
Jon


> 
> -Sumit
> 
> > Anyway, I'll pull this series in now.
> >
> > Thanks,
> > Jon
> >
> > >
> > > -Sumit
> > >
> > > >
> > > > Thanks,
> > > > Jon
> > > >
> > > >
> > > >
> > > > > --
> > > > > 2.7.4
> > > > >
> > > >
> > > > > 
> > > >
