Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.11158.1589459512183591972
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 05:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=n+wLQS8n;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id f189so2730562qkd.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GP8SiUwnJMNc2ZQtxrm490VvpZRXFstLgBToZdDazOg=;
        b=n+wLQS8nxQHf2dhFT8KpDtLgjfG7NNm+JzDWXcyK1ci1GSIH+1hMwlXXXbFqDHIsZp
         KKDZl8mE/LE9c2HVVCUyYIc4362e58e0/PYqnLD4YkUU1OgX1hOqbXtyJEJ8aAqyLlBg
         ikX+ldTU+PwcemZ885O9JcKQ2DoCCXHstDrpIgME04VGH8HEencDdoPYYnKy5sXKKDoc
         ZZT0jyDwCEw6T22KPXKTsd5/hUYwkEISG54jcPy557acOUb29l3f39coP3gDA9xVzLZj
         KqaBuxfRb3GKFTULP5Sttzw3O3xaETkEEFhIGv/6y5kolN/5TRYwfDY1KfxlRPaFfDRC
         ZH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GP8SiUwnJMNc2ZQtxrm490VvpZRXFstLgBToZdDazOg=;
        b=romO6vlb+JxtDTs2oq6KfYiDZtPmPEWrWL5JOnGOSpGCq2qYZyykUnl9S/LbABInGY
         hlnFUImztqzLHIz/x/xFS3z/9SZ3sEahfTlir8qbk3mue6D8qwtsV3fBRNM0K6G6BVEf
         QkIJCNxw9R84N1u10yo0I1Em91qzsurlkOauM9zoY4oRDPnuW0ecgxXEifLKArxUNXlm
         zEHE9vxaUA+QewEOs1Cal2BmKyYmToQsIF+se53loVETbJ/cs5EkeJmJxo5FQkYYjOzB
         TKbV6U0hfkCRbu/wHE1VF5TM9p2IUF8wuPfwcvgKi2CONOs9SJFhIZd6TdS/lh7K1icr
         2/gw==
X-Gm-Message-State: AOAM532G00tydk2p2FTA0uUMpkU9KO1pX1dZ/VRSMhP0+TL0vQ6rzWEh
	6/d3zw8vFAyR0SKhUfli18hhiA==
X-Google-Smtp-Source: ABdhPJzSPnne7jMnqYNaDNhD62ZpLaVm0Jr6LHIvvn97DIpoFHgh3Hzwli+oJzi/80X6OBxStfhYWA==
X-Received: by 2002:a37:a455:: with SMTP id n82mr4748596qke.258.1589459511266;
        Thu, 14 May 2020 05:31:51 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:658c:9d8a:81ff:d57])
        by smtp.gmail.com with ESMTPSA id n206sm2415715qke.20.2020.05.14.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 05:31:50 -0700 (PDT)
Date: Thu, 14 May 2020 08:31:49 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Message-ID: <20200514123148.GA22957@kudzu.us>
References: <20200514024932.19962-1-jdmason@kudzu.us>
 <20200514042513.GY11927@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200514042513.GY11927@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 12:25:13AM -0400, Denys Dmytriyenko wrote:
> On Wed, May 13, 2020 at 10:49:32PM -0400, Jon Mason wrote:
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
> 
> Why does it have "major" in the version? I know we (TI) previosuly had 
> "update" there, but if we are trying to unify, let's do it properly.
> 
> Another issue - one of our recipes had native and nativesdk support. This 
> seems to be only native.
> 
> 
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> > new file mode 100644
> > index 0000000..a0c832d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> > @@ -0,0 +1,37 @@
> > +# Copyright (C) 2019 Garmin Ltd. or its subsidaries
> 
> Ouch!

This is a 100% copy of what is in meta-rockchip.  See
https://git.yoctoproject.org/cgit/cgit.cgi/meta-rockchip/tree/recipes-devtools/gcc-arm-none-eabi/gcc-arm-none-eabi-native_9-2019-q4-major.bb

So, they should get the credit for actually doing the work.  I'll
modify to incorporate the suggestions, assuming JPEW is in agreement.

> 
> 
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
> 
> This doesn't seem like a final release, does it?

Looks like it should be (based on the website)
https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2

I'll come out with a v2 shortly.  Thanks for the feedback.

Thanks,
Jon


> 
> 
> > +SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
> > +SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> > +
> > +S = "${WORKDIR}/${BPN}-${PV}"
> > +
> > +inherit native
> 
> BBCLASSEXTEND?
> 
> 
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
> 
> What the hell is "lnr"? :) What am I missing?
> 
>  
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
> 
> > 
> 
