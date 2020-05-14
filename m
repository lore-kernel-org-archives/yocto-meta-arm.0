Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.11020.1589459557397050418
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 05:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=1p2e+3aQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id t25so2671455qtc.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A07yXjPIEk2tZonNyEUNWWZ/bbDbCB1jbG3ZoFs0aZ0=;
        b=1p2e+3aQ5sPgPA5VzQQmyC7B4g493ea99Xl8jx45jdyQKxyG8Mgbs2vCFTaopqkHuh
         u+1u8d7rq7fwRknJVMOBanLimZPJ62R9X9IdSSCZowlhzALdq+JVP5lswDbvuYhR6qqt
         BIRBQtajEhOATkfwghbPa6ALl5Cd9Qg5WcfBGgOPlAfKxNtf+urcDvLU8ZvIc7EVR28s
         +G3+wQFynaaXMj8KgtiTE/7sV7/n0jCOeboekhHfJ6CtFV1CVGN2hsLZ3ElbmEABWvQj
         OWNlhHeK+/Prxz3vULtpCiig9YBmUdPknZglKfY83NfQiou94zgm5UYWH9gCC+guXB+W
         wNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A07yXjPIEk2tZonNyEUNWWZ/bbDbCB1jbG3ZoFs0aZ0=;
        b=tmbHcbImrw/DChvkMzw6G7DwZDuhPS0qwcLsSsAduL3PnBsBmMWKgw5wl4FZaCP1ID
         Kf3NemaXIosVdbsoZAIWuMBNidrLZ8gYE/ACvvsrqVA1l+yOm6jvlZWD2ViNwLbZ3gFM
         AFcH1vojB/5fCmUGmBRD3jVB0twW5+8CrH+5nKGbRFOnYn1RrBFCtXJpAP7U5ING2ka7
         CYX1QMqgaHzRUpI8D1D9U6U/gxa228P9v0pjt7sc6yikfuCQn0bMLTK3mP3YMcUIygXb
         Ko6LD6WeOGW1ckFpMN6e2Ud3vFfKXAYBNNRd7vef3/pqOMlIAXx0WRbQyEU47AIOA2kq
         DNYg==
X-Gm-Message-State: AOAM532dI5mNSzxFO9xE7TjaKdUw4O5pLsTej7qRDbOWDNlELm4+ahMx
	d6ZYdqhjRy7LC1R43QQywbZv2Q==
X-Google-Smtp-Source: ABdhPJxbPf7F+EAzA4xcrORod7KSq7sSLLD79lSpFjJkykENujzJJ9WYeIIOXIpk96Dnc2VN8RIVdw==
X-Received: by 2002:ac8:74c6:: with SMTP id j6mr367544qtr.127.1589459556530;
        Thu, 14 May 2020 05:32:36 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:658c:9d8a:81ff:d57])
        by smtp.gmail.com with ESMTPSA id n20sm2347216qtk.89.2020.05.14.05.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 05:32:36 -0700 (PDT)
Date: Thu, 14 May 2020 08:32:34 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Message-ID: <20200514123233.GB22957@kudzu.us>
References: <20200514024932.19962-1-jdmason@kudzu.us>
 <CAFA6WYNWT3pAPSFEsUietGvfNiDx1qBsD2jpqXYZW=ioYFrsZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYNWT3pAPSFEsUietGvfNiDx1qBsD2jpqXYZW=ioYFrsZA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 10:33:58AM +0530, Sumit Garg wrote:
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
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> 
> This recipe seems to install the pre-built (external) GCC tool-set for
> Cortex-R and Cortex-M. So I would suggest you to import it under
> "meta-arm-toolchain/recipes-devtools/external-arm-toolchain/"
> directory rather than "meta-arm-toolchain/recipes-devtools/gcc/"
> directory as it is meant for recipes used to build ARM GCC tool-set
> from source.

Will move to the suggested location in v2.

Thanks,
Jon

> 
> -Sumit
> 
> > new file mode 100644
> > index 0000000..a0c832d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> > @@ -0,0 +1,37 @@
> > +# Copyright (C) 2019 Garmin Ltd. or its subsidaries
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +DESCRIPTION = "Baremetal GCC for ARM-R and ARM-M processors"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > +
> > +LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> > +
> > +PROVIDES = "virtual/arm-none-eabi-gcc"
> > +
> > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/${BPN}-${PV}-x86_64-linux.tar.bz2"
> > +
> > +SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
> > +SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> > +
> > +S = "${WORKDIR}/${BPN}-${PV}"
> > +
> > +inherit native
> > +
> > +COMPATIBLE_HOST = "x86_64.*-linux"
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
> > +INSANE_SKIP_${PN} = "already-stripped"
> > +
> > +INHIBIT_SYSROOT_STRIP = "1"
> > +INHIBIT_PACKAGE_STRIP = "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > --
> > 2.20.1
> >
> > 
