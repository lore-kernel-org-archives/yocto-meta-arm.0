Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.1810.1591686241178598924
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jun 2020 00:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WTEEs9QU;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id z9so23616433ljh.13
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jun 2020 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wR4eUtilLnPFBV7aRV6TrVo2uyLYE/s3rdZ8TvOXT48=;
        b=WTEEs9QUlRl0D2EYuNNdi1Lp6MopQLx8KdWOGcMxbR70NMhDL0FI4jLCBIzFKICkCJ
         aE/sHUrLI+RhJ7LXLCcnbaLcmbW+GjyRPhxsdlZVEZ0sxbMd7Szh8L+UYGWzwju3gQFp
         +HkpEbSfPSesv4cWQBzT6UnHSatGyhb4ZYh4expk+Mmt0OzPtQ+gwKN5xKRP5E6b6JdR
         qmPtMKnvfkndSeVionj/cr62RTmbkGwCJIMLeQimu1fZSsgwHW7Kzp/0E2opqHNlNKye
         eOwel/i0FNu9qJYwFwNl8wCZigOwAMJpsyJEytKF6aS2EUVDkOdffhcwbi5LRMbG15Qw
         MAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wR4eUtilLnPFBV7aRV6TrVo2uyLYE/s3rdZ8TvOXT48=;
        b=rPa5SLaGxn8rouMwy4V2QvoehaeZP9nH32KOlQfRXVIqkG78bSOGB1gpU+2POv0hHV
         FxfO9c2pwNVjH2Ho7QxOemjgnixdzOz9ftGZFZmHpBGPCPpltvYTdYxZOF/vOWK/XC3m
         vhDNFGHyh8OAUx+nV2t/pB/OsCh68XfuFMmVyzLmuD/KSpUJ4+Iqg0JuKVQnqsduBcJn
         GMtlsDADe6YaKOEcMRCUzZ2L/WgShg/fnZzV+Gkfweu/4N7MrRZg8ANnr+c8XjhnJax1
         Jyz3y2W3LJVHqspILuicAs4C1556fiYsrFXD9SgR5sFJMwYy659JyGwimQS9yl9GbJUU
         i5NQ==
X-Gm-Message-State: AOAM5314bRvWbUrktLU7lRyUNog+90hb2casPQ6hoFOYYfSiLyhiJH/b
	tzJGF6upKlbZ+Za4YlsaXPN6Np9Bf95hp5gqqDPY8g==
X-Google-Smtp-Source: ABdhPJzpDVwN8RFmaVjl17yFEdjFy16ltVaqWxzKBVTXX90CHliYtFox4E3MTJcX+Ryj/nA/SwPXgw94g93EL8zB9vM=
X-Received: by 2002:a05:651c:1103:: with SMTP id d3mr13549729ljo.110.1591686239205;
 Tue, 09 Jun 2020 00:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-4-git-send-email-sumit.garg@linaro.org> <CAM9ZRVs7xbAbw+6tNGuU7WQsHvO8-F4AF67XYMGtqu9Wjohxtg@mail.gmail.com>
In-Reply-To: <CAM9ZRVs7xbAbw+6tNGuU7WQsHvO8-F4AF67XYMGtqu9Wjohxtg@mail.gmail.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 9 Jun 2020 12:33:46 +0530
Message-ID: <CAFA6WYOrqOHU+5+jXDsqwEuFDXfYX1mzbz-DKP7x3vOJj7KtVQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] external-arm-toolchain: Add README
To: Paul Barker <pbarker@konsulko.com>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2020 at 17:38, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Tue, 2 Jun 2020 at 12:05, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Document usage details for pre-built Arm toolchains.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  .../external-arm-toolchain/README.md               | 50 ++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> > new file mode 100644
> > index 0000000..65d1a42
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> > @@ -0,0 +1,50 @@
> > +Pre-built Arm toolchain recipes
> > +===============================
>
> I'd recommend saying explicitly in this readme file that info on
> contributing, reporting bugs, etc can be found in the top-level
> meta-arm readme file.
>

Okay.

> > +
> > +Introduction
> > +------------
> > +This layer contains recipes for pre-built Arm toolchain recipes as follows:
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
> > +in ``conf/local.conf`` in order to replace OE toolcahin with pre-built GNU-A
>
> Typo: "toolcahin" should be "toolchain".
>
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
>
> This section should cover what is actually tested. For example, let's
> say I have a custom distro & machine and I see some weird behaviour
> from the ARM toolchain. I'd like to know which distro & machine
> combination is known to be good so that I can see if it reproduces the
> same errors. That would allow me to determine if the error is in
> meta-arm-toolchain or if it is my own layers.

How about the following add-on?

Tested distro and machines (for zeus stable release):
1. Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
2. Distro: RPB; machines: dragonboard-410c (build and boot tested)
3. Distro: world; machines: qemuarm and qemuarm64. Build tested for
following layers:
    - poky/meta
    - poky/meta-poky
    - poky/meta-yocto-bsp
    - meta-openembedded/meta-oe
    - meta-openembedded/meta-python
    - meta-openembedded/meta-networking

-Sumit

>
> > +
> > +gcc-arm-none-eabi_<version>.bb
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> > +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> > +Cortex-R and Cortex-M processors.
> > +
> > +Supported version: 9-2019-q4-major
> > --
> > 2.7.4
> >
>
>
> --
> Paul Barker
> Konsulko Group
