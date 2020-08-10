Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.959.1597092028014112161
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 13:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=P8VUvtjR;
 spf=pass (domain: burtonini.com, ip: 209.85.167.65, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f65.google.com with SMTP id v15so5441088lfg.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2020 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O49fkzr1zieOG39pBRXISKZIkrxz2Bh2zj5MLcl32OM=;
        b=P8VUvtjRpmLMH5xSXvBwJ9x00Q7J1JosQwxDysKxC7ldBPeuSWbXsIJwUvRZKZ/PMI
         b9KUiOvXFshUNnlYDin+ZCuTlQGo4uzluN4pkbhBNktCStPR1MMGL9ThDjEjeYUiBWgE
         UmieOn6JR7g7BumssAJyVEp46UuWZVPan554+3EJDYPccMpeh0I5Ql6eLQuSNcttrHJN
         c3mZ54T2u7X/cgNozH/Xo8dCzrwE2ALzBjJSeihluJU8h++RVOPmGCfWXVUQ7IL7xor4
         7bZjnVCbYD2JxmtNfaGDjs1PBFdm5LTleVwqTtaf+sq3kJAvCC3BhnNHck8CeORxPtP2
         TO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O49fkzr1zieOG39pBRXISKZIkrxz2Bh2zj5MLcl32OM=;
        b=cbkodwKITS6OUmJm+RXLqMAQDeSBlfc1F1WnvxDWWtpz5L8JDEhlJzW3vWvtTCn76i
         GhGZ0z+SwkO3RnZgTYEAeWbMZMouyGs4fWcOPEOYWsXYQyqauoK+mSnhhfQRzX5vtCd6
         Vbrj3d3MBMN67/zbabrxpkbsn2SscR1UO3r47YGxJT3s766dQUfNkzMcAYEmFoHPNtp3
         CxMxqZIfSpUEgU2VvUTx/1gY7P+F3eIpMOM7JU8wkqtTVetcwWx7Ihsmnm3TM41ph+sX
         +3vCfozsxqV45D/UnvDoAWZTEtaL1wdXUWli//KO4W8oRwS1OwUPiUbtdp/QX4xSZEuh
         quLQ==
X-Gm-Message-State: AOAM5320TG9gosIHh4s7PGpCaxkebfkhUbzVsugY6w4+P8dFI3Ga+8r9
	m3jYDAMXzKA9RkElnokFBLQ1SzNUDz9W1cHAJ9YwtQ==
X-Google-Smtp-Source: ABdhPJxJERkmIB//J28xRdSo0Id0Z0hJoU1olEil5cLnYqnuJBvuUeanADqAv+BHzwcbjhirITbtNILPaUmhdEsDhNQ=
X-Received: by 2002:ac2:598f:: with SMTP id w15mr1415449lfn.216.1597092025804;
 Mon, 10 Aug 2020 13:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200810030216.24798-1-damodar.santhapuri@arm.com>
 <20200810030216.24798-2-damodar.santhapuri@arm.com> <20200810152437.GJ17660@denix.org>
In-Reply-To: <20200810152437.GJ17660@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 10 Aug 2020 21:40:14 +0100
Message-ID: <CAAnfSTv1v7EofQZWiNGQHLA0QDM8=amy-H5_fJu3mDUhjHaCUA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-bsp/trusted-firmware-a: Add v2.3 support for juno platform
To: Denys Dmytriyenko <denis@denix.org>
Cc: Damodar Santhapuri <damodar.santhapuri@arm.com>, meta-arm@lists.yoctoproject.org, 
	nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

Some, yes, probably.  Others need a separate file as they do more,
like the a5ds file:

EXTRA_OEMAKE_append = " \
                    ARCH=aarch32 \
                    FVP_HW_CONFIG_DTS=fdts/a5ds.dts \
                    ARM_ARCH_MAJOR=7 \
                    AARCH32_SP=sp_min \
                    ARM_CORTEX_A5=yes \
                    ARM_XLAT_TABLES_LIB_V1=1 \
                    "

It would be awesome if TFA just built with a few variables, but right
now that's not the case.

Ross

On Mon, 10 Aug 2020 at 16:24, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Aug 10, 2020 at 08:32:16AM +0530, Damodar Santhapuri wrote:
> > Update machine/juno.conf to support tf-a v2.3
> >
> > Change-Id: Ieced15e83818687c879d927bce2c4604a72b9b1e
> > Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> > ---
> >  meta-arm-bsp/conf/machine/juno.conf                         | 2 +-
> >  .../trusted-firmware-a/trusted-firmware-a-juno.inc          | 2 +-
> >  .../trusted-firmware-a/trusted-firmware-a_2.1.bbappend      | 6 ------
> >  .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend      | 1 +
> >  4 files changed, 3 insertions(+), 8 deletions(-)
> >  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> >
> > diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
> > index 898a863..5f74535 100644
> > --- a/meta-arm-bsp/conf/machine/juno.conf
> > +++ b/meta-arm-bsp/conf/machine/juno.conf
> > @@ -20,7 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
> >  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
> >  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
> >  PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
> > -PREFERRED_VERSION_trusted-firmware-a ?= "2.1%"
> > +PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> >
> >  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> > index a6d8ded..c685d7d 100644
> > --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> > @@ -5,7 +5,7 @@ TFA_PLATFORM = "juno"
> >  TFA_DEBUG = "1"
> >  TFA_MBEDTLS = "1"
> >  TFA_UBOOT = "1"
> > -TFA_BUILD_TARGET = "bl1 fip"
> > +TFA_BUILD_TARGET = "bl1 bl2 bl31 fip dtbs"
>
> I was wondering - why these TFA_* variables can't be set in the corresponding
> machine config file, instead of creating these trusted-firmware-a-<machine>.inc
> include files?
>
>
> >  # Juno needs the System Control Processor Firmware
> >  DEPENDS += "virtual/control-processor-firmware"
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> > deleted file mode 100644
> > index f5f1632..0000000
> > --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -# Machine specific TFAs
> > -
> > -MACHINE_TFA_REQUIRE ?= ""
> > -MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
> > -
> > -require ${MACHINE_TFA_REQUIRE}
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> > index 6f67b49..8743ec5 100644
> > --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> > @@ -6,5 +6,6 @@ MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
> >  MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
> >  MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
> >  MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
> > +MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
> >
> >  require ${MACHINE_TFA_REQUIRE}
> > --
> > 2.17.1
> >
>
> >
>
> 
