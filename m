Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.792.1589406594379557808
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 14:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=U2eTPL0X;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id a136so1008075qkg.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 14:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4pxbUxZ4j5YILhJbUGhLkBzbxG1Hp2UwrHvHKs0T0rI=;
        b=U2eTPL0XUGfn56OfhFkd0f8kGgyHAPam3WUawZviqD0+01SbOz8oWxDHsLbbQYUSAD
         bhY5+j39/KgvkcQW7PVAVNnGZte50Ug9tD6linh7sND8wzRo1ta6+Y70ScboU0aBROts
         A+T15ID/fA8N2N1xS0uq5Q6n/HwNz3ZGkUSXCmSC20+SumSSDfQFi0q5T6oMHyCV8dBi
         NVG069jr5j2B8GzWL+O/UZi3hBzc+b6EjqQstILX3fPSvBxLtcoB97aTtdNBt/bWzMIB
         CcZx8JgwYkegJAuI41EY1XDKdFzQEVrWDn0MSFD0xjBRFxLCq/eVpSmyPOYEHgA0Sz4u
         yPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4pxbUxZ4j5YILhJbUGhLkBzbxG1Hp2UwrHvHKs0T0rI=;
        b=aoBUI7IYv+U6aFqmCb6dyl4Dw3AXjuSPywGV86a6DpEP0EOt7W+wer426RN/VCfGJc
         sJlRJLvD3YcDNvIpG2+OqNrHFfDDjmw1SqXVMBgjVfy84YynnPBvKFB89+kWCFoGcTSC
         NHlrpt2RnT09ZMy5nw22RVpUbl3di0MOtF5BvpPxs+kqwkRGteab0DRkZ9HFMwMaMWyV
         ULpfbh9bbV3Xq6kB+2stIteQxvUawM0MizcN7dEQC+1wDAmRIh+cEExwniefVOOnjQ8T
         nNZdmfc1VQGrfm3LDAlfBgQJIqS8QuCV/Uy1KYNXdV/cLfSOyT6EaKztXSQzB125+2Bh
         tLcg==
X-Gm-Message-State: AOAM533nGVzggtN7zGxRrrxM2youQ0XWHkd2NnsrjpToAn7lnLfx1R4o
	O5/IzGepazcIlrYEzG+7UwArCQ==
X-Google-Smtp-Source: ABdhPJwWsrQc/DMT5JpLqOQZNAxQc7sQqKyisoehYZW40btH9YFPkTq8sBqtpzC0WkSsEy1fhLlp/w==
X-Received: by 2002:a37:9105:: with SMTP id t5mr1968642qkd.202.1589406593458;
        Wed, 13 May 2020 14:49:53 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:658c:9d8a:81ff:d57])
        by smtp.gmail.com with ESMTPSA id o23sm859936qtf.53.2020.05.13.14.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:49:53 -0700 (PDT)
Date: Wed, 13 May 2020 17:49:51 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v3 1/2] trusted-firmware-a: Build out of tree
Message-ID: <20200513214950.GA5761@kudzu.us>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>
 <20200513154707.33747-2-JPEWhacker@gmail.com>
 <160EA693C79E8869.18093@lists.yoctoproject.org>
 <20200513173713.GU11927@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200513173713.GU11927@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 01:37:13PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 13, 2020 at 01:27:48PM -0400, Denys Dmytriyenko wrote:
> > On Wed, May 13, 2020 at 10:47:06AM -0500, Joshua Watt wrote:
> > > Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates
> > > the need to set the TFA_BUILD_DIR.
> > > 
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > 
> > What are the changes between v1, v2 and v3?
> 
> I only noticed cd $S; make split...
> 
> Reviewed-by: Denys Dmytriyenko <denys@ti.com>

Pulled in to the master branch.

Thanks,
Jon

> 
> 
> > >  .../trusted-firmware-a/trusted-firmware-a.inc | 32 +++++++++++--------
> > >  1 file changed, 18 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > index e6d48e4..febd8ce 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > @@ -15,12 +15,7 @@ TFA_PLATFORM ?= "invalid"
> > >  # Build for debug (set TFA_DEBUG to 1 to activate)
> > >  TFA_DEBUG ?= "0"
> > >  
> > > -# Sub-directory in which to build.
> > > -# This must be coherent with BUILD_PLAT make parameter so that deploy can find
> > > -# the produced binaries
> > > -TFA_BUILD_DIR ?= "build-${TFA_PLATFORM}"
> > > -# set BUILD_PLAT depending on configured BUILD_DIR
> > > -EXTRA_OEMAKE += "BUILD_PLAT=${TFA_BUILD_DIR}"
> > > +B = "${WORKDIR}/build"
> > >  
> > >  # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
> > >  TFA_MBEDTLS ?= "0"
> > > @@ -68,7 +63,7 @@ do_configure[noexec] = "1"
> > >  DEPENDS_append = " dtc-native openssl-native"
> > >  
> > >  # Add platform parameter
> > > -EXTRA_OEMAKE += "PLAT=${TFA_PLATFORM}"
> > > +EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
> > >  
> > >  # Handle TFA_DEBUG parameter
> > >  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
> > > @@ -85,6 +80,8 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAG
> > >  # TFA is forcing the host compiler and its flags in the Makefile using :=
> > >  # assignment for GCC and CFLAGS.
> > >  do_compile() {
> > > +    cd ${S}
> > > +
> > >      # These changes are needed to have the fiptool compiling and executing properly
> > >      sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},' ${S}/tools/fiptool/Makefile
> > >      sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
> > > @@ -92,8 +89,15 @@ do_compile() {
> > >  
> > >      oe_runmake ${TFA_BUILD_TARGET}
> > >  }
> > > +do_compile[cleandirs] = "${B}"
> > >  
> > >  do_install() {
> > > +    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> > > +        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
> > > +    else
> > > +        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
> > > +    fi
> > > +
> > >      install -d -m 755 ${D}/firmware
> > >      for atfbin in ${TFA_INSTALL_TARGET}; do
> > >          if [ "$atfbin" = "all" ]; then
> > > @@ -102,21 +106,21 @@ do_install() {
> > >              bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
> > >              bberror "rewrite or turn off do_install"
> > >              exit 1
> > > -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
> > > +        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
> > >              echo "Install $atfbin.bin"
> > > -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
> > > +            install -m 0644 $BUILD_PLAT/$atfbin.bin \
> > >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> > > -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
> > > +        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
> > >              echo "Install $atfbin.elf"
> > > -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
> > > +            install -m 0644 $BUILD_PLAT/$atfbin.elf \
> > >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> > > -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
> > > +        elif [ -f $BUILD_PLAT/$atfbin ]; then
> > >              echo "Install $atfbin"
> > > -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
> > > +            install -m 0644 $BUILD_PLAT/$atfbin \
> > >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> > >          elif [ "$atfbin" = "dtbs" ]; then
> > >              echo "dtbs install, skipped"
> > > -        elif [ -f ${S}/tools/$atfbin/$atfbin ]; then
> > > +        elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
> > >              echo "Tools $atfbin install, skipped"
> > >          else
> > >              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
> > > -- 
> > > 2.17.1
> > > 
> > 
> > > 
> > 
> 
> > 
> 

> 

