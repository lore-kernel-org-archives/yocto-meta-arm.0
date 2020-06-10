Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.4113.1591821666736650862
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 13:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Tp9tCq8K;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id w90so2917036qtd.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 13:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gIg6BJvGFIq7rkeNJZzgJe9ph7hxYpVZ3FCFZqF0WIk=;
        b=Tp9tCq8KP4wCLR5z6bM9/N3Ng3sNP3ts7t2BV8C1SxpZ4PbXcruS4Ww+5R+qxOEMvP
         WwZUyJ7kS+GXoNDFJ3wdYhPoPsEeI8X10FCvwL4FXzSmWo+b/reHq3JI04WunYKfg+H4
         4AHLh5G56/Snm/2qRzMSkVq4mEwK9kCI/dIDQY6gJ5YsKPID7PZ1SMtYgGTCYht9W3yg
         A//iCH9RcN4YfETMJ9U6D/DUegDpfyS/2Vh6q2WRqM4vmmq2hScgKqAq7vXmEWjqOCCR
         CJm5HLfBfitjkL3s4NSlCYrkb/OMnSn5cC09hpoLqtXyAyT5P5lXaNLzb6HtcB7qe7o6
         8Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gIg6BJvGFIq7rkeNJZzgJe9ph7hxYpVZ3FCFZqF0WIk=;
        b=Jlfoh839eZ3y4fhDB3g5AClrhewrHUx+szO65aelv8VZWal2d7vaE7L4DZJY8bMGxs
         PmRN3V5PUrZrfqUVxTv2CmMEBOn2ZHAw/+UN3z4cJRor4haBTv0KRPt6v4s77bkkPmLI
         RufFzyZlnz3+6yP/1M5r2kZkxOnSE/MD/URl9J3jq6NPsdHPVeFaBcZqrfzhS7Dq/2WU
         PWRCPljFk2IdvO6X68ezSm9XI8uTW8r0WP1a6bNBL+O1UeQCPpWZTqfx3k9vdlBiBoRL
         NATcEqr0wy6EMWpllb/uriP6V/AiGvwVqaeCMzwyCiqS+ipzGkU/mo9NnbIIDzHBRbQg
         PusA==
X-Gm-Message-State: AOAM531Q7S/l88r9Gx3rSfhb+sQyWxp0cbq2ta6la2s7nS8TY7qG93az
	s0BeUzRrTT09g7GaIfKEhu36TR2wlDg=
X-Google-Smtp-Source: ABdhPJywt5H4/x/JmWAj9wOJH4gHY7AU8OEYIDVCVgzbr/UbitpxnKSfD8ceGHg4Jg+dSN870uTG0w==
X-Received: by 2002:ac8:44da:: with SMTP id b26mr5297986qto.232.1591821665839;
        Wed, 10 Jun 2020 13:41:05 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:403d:d74f:c1dd:a98f])
        by smtp.gmail.com with ESMTPSA id p11sm727145qtq.75.2020.06.10.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:41:05 -0700 (PDT)
Date: Wed, 10 Jun 2020 16:41:03 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Add trusted firmware support for N1SDP
Message-ID: <20200610204102.GC25448@kudzu.us>
References: <20200602165152.27514-1-khasim.mohammed@arm.com>
 <20200608154950.GD15959@kudzu.us>
 <0902c05ab1ab7a6b8d36266904f766df69745e40.camel@arm.com>
MIME-Version: 1.0
In-Reply-To: <0902c05ab1ab7a6b8d36266904f766df69745e40.camel@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2020 at 10:02:56PM +0530, Khasim Mohammed wrote:
> Hi Jon,
> 
> On Mon, 2020-06-08 at 11:49 -0400, Jon Mason via lists.yoctoproject.org
> wrote:
> > On Tue, Jun 02, 2020 at 05:51:52PM +0100, Khasim Mohammed wrote:
> > > - Add new bbappend to fetch tfa ver 2.2 required for N1SDP
> > > - Apply additional patch required for N1SDP
> > > - Update machine conf to add image dependency for
> > >   trusted firmware component
> > > 
> > > Issue-Id: PLATFORMS-3134
> > > Change-Id: Ibf593c1818c9ea08acf71c6b5b80abc4aca79723
> > > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> > 
> > Pulled into master
> > 
> Can you please pull this on Dunfell branch as well ?

Done.

Thanks,
Jon

> 
> Regards,
> Khasim
> 
> > Thanks,
> > Jon
> > 
> > > ---
> > >  meta-arm-bsp/conf/machine/n1sdp.conf          |  6 +++
> > >  ...able-workaround-for-N1-Erratum-13157.patch | 46
> > > +++++++++++++++++++
> > >  .../trusted-firmware-a-n1sdp.inc              | 13 ++++++
> > >  .../trusted-firmware-a_2.2.bbappend           | 11 +++++
> > >  4 files changed, 76 insertions(+)
> > >  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-
> > > a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > > 13157.patch
> > >  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-
> > > a/trusted-firmware-a-n1sdp.inc
> > >  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-
> > > a/trusted-firmware-a_2.2.bbappend
> > > 
> > > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-
> > > bsp/conf/machine/n1sdp.conf
> > > index 5fddcad..133fb89 100644
> > > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > > @@ -21,3 +21,9 @@ PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
> > >  
> > >  # RTL8168E Gigabit Ethernet Controller is attached to the PCIe
> > > interface
> > >  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
> > > +
> > > +# Trusted firmware v2.2 version
> > > +PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-
> > > firmware-a"
> > > +PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
> > > +
> > > +EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
> > > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-
> > > a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > > 13157.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-
> > > a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > > 13157.patch
> > > new file mode 100644
> > > index 0000000..53a6616
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-
> > > n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch
> > > @@ -0,0 +1,46 @@
> > > +From 76847eb46e77d094eb8611760dd1ab880f617321 Mon Sep 17 00:00:00
> > > 2001
> > > +From: James Yang <James.Yang@arm.com>
> > > +Date: Wed, 4 Sep 2019 10:49:45 -0500
> > > +Subject: [PATCH] n1sdp/arm-tf: disable workaround for N1 Erratum
> > > 1315703 and
> > > + Spectre v4
> > > +
> > > +This patch disables the workaround for Erratum 1315703 so that the
> > > N1 CPU
> > > +performance in the N1 SDP better reflects that of released
> > > versions of the
> > > +N1 for software that does not require mitigation for Spectre
> > > Variant 4.
> > > +
> > > +N1 SDP uses N1 version r1p0, which is affected by Erratum 1315703,
> > > which
> > > +is fixed in N1 r3p1.  The workaround for r1p0 disables the CPU
> > > performance
> > > +feature of bypassing of stores by younger loads.  This can
> > > significantly
> > > +affect performance.  The Erratum is classified "Cat A (Rare)" and
> > > requires
> > > +a specific sequence of events to occur.
> > > +
> > > +Disabling this CPU performance feature is also the mitigation for
> > > Spectre
> > > +Variant 4 (CVE-2018-3639).  On CPUs that provide the PSTATE.SBSS
> > > feature,
> > > +the OS selectively applies the mitigation only to programs that
> > > require it,
> > > +leaving the performance of other programs unaffected.  However, N1
> > > r1p0
> > > +does not have the PSTATE.SBSS feature (which is introduced in N1
> > > r3p1), and
> > > +Arm-TF does not provide the interface to to dynamically disable
> > > the CPU
> > > +performance feature.  Therefore, applying the workaround penalizes
> > > ALL
> > > +software running on N1 SDP, including those that do not require
> > > mitigation.
> > > +
> > > +This patch is meant for performance evaluation purposes ONLY and
> > > should not
> > > +be used for software that requires a seccomp computing
> > > environment.
> > > +
> > > +Signed-off-by: James Yang <James.Yang@arm.com>
> > > +---
> > > + plat/arm/board/n1sdp/platform.mk | 2 ++
> > > + 1 file changed, 2 insertions(+)
> > > +
> > > +diff --git a/plat/arm/board/n1sdp/platform.mk
> > > b/plat/arm/board/n1sdp/platform.mk
> > > +index 986bd70a..7e30c857 100644
> > > +--- a/plat/arm/board/n1sdp/platform.mk
> > > ++++ b/plat/arm/board/n1sdp/platform.mk
> > > +@@ -66,3 +66,5 @@ include plat/arm/common/arm_common.mk
> > > + include plat/arm/css/common/css_common.mk
> > > + include plat/arm/board/common/board_common.mk
> > > + 
> > > ++# N1SDP: disable workaround for Errata 1315703 and global Spectre
> > > v4 mitigation
> > > ++override ERRATA_N1_1315703 := 0
> > > +-- 
> > > +2.17.1
> > > +
> > > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-
> > > firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-
> > > a/trusted-firmware-a-n1sdp.inc
> > > new file mode 100644
> > > index 0000000..ad4af5a
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-
> > > a-n1sdp.inc
> > > @@ -0,0 +1,13 @@
> > > +# N1SDP specific TFA support
> > > +
> > > +COMPATIBLE_MACHINE = "n1sdp"
> > > +TFA_PLATFORM       = "n1sdp"
> > > +TFA_BUILD_TARGET   = "bl31"
> > > +TFA_DEBUG          = "1"
> > > +TFA_MBEDTLS        = "0"
> > > +TFA_UBOOT          = "0"
> > > +
> > > +FILESEXTRAPATHS_prepend := "${THISDIR}/files/n1sdp:"
> > > +SRC_URI_append = " \
> > > +    file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > > 13157.patch \
> > > +    "
> > > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-
> > > firmware-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-
> > > firmware-a/trusted-firmware-a_2.2.bbappend
> > > new file mode 100644
> > > index 0000000..a87999f
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-
> > > a_2.2.bbappend
> > > @@ -0,0 +1,11 @@
> > > +# Machine specific TFAs
> > > +
> > > +MACHINE_TFA_REQUIRE ?= ""
> > > +MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
> > > +
> > > +require ${MACHINE_TFA_REQUIRE}
> > > +
> > > +# TFA referred in release tag N1SDP-2020.03.26
> > > +SRCREV_tfa_n1sdp = "cfb3f73344217aa000aaff9d84baad7527af75bf"
> > > +
> > > +PV_n1sdp = "2.2+git${SRCPV}"
> > > -- 
> > > 2.17.1
> > > 
> > > 
> > 
> > 
> 
