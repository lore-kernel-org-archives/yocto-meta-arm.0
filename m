Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.44.1589391436352773746
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 10:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C61CE40B5A;
	Wed, 13 May 2020 17:37:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27wmzvOfCpmq; Wed, 13 May 2020 17:37:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A6C5E40951;
	Wed, 13 May 2020 17:37:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DC17F17314B; Wed, 13 May 2020 13:37:13 -0400 (EDT)
Date: Wed, 13 May 2020 13:37:13 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v3 1/2] trusted-firmware-a: Build out of tree
Message-ID: <20200513173713.GU11927@denix.org>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>
 <20200513154707.33747-2-JPEWhacker@gmail.com>
 <160EA693C79E8869.18093@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <160EA693C79E8869.18093@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 01:27:48PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 13, 2020 at 10:47:06AM -0500, Joshua Watt wrote:
> > Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates
> > the need to set the TFA_BUILD_DIR.
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> 
> What are the changes between v1, v2 and v3?

I only noticed cd $S; make split...

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> >  .../trusted-firmware-a/trusted-firmware-a.inc | 32 +++++++++++--------
> >  1 file changed, 18 insertions(+), 14 deletions(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index e6d48e4..febd8ce 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -15,12 +15,7 @@ TFA_PLATFORM ?= "invalid"
> >  # Build for debug (set TFA_DEBUG to 1 to activate)
> >  TFA_DEBUG ?= "0"
> >  
> > -# Sub-directory in which to build.
> > -# This must be coherent with BUILD_PLAT make parameter so that deploy can find
> > -# the produced binaries
> > -TFA_BUILD_DIR ?= "build-${TFA_PLATFORM}"
> > -# set BUILD_PLAT depending on configured BUILD_DIR
> > -EXTRA_OEMAKE += "BUILD_PLAT=${TFA_BUILD_DIR}"
> > +B = "${WORKDIR}/build"
> >  
> >  # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
> >  TFA_MBEDTLS ?= "0"
> > @@ -68,7 +63,7 @@ do_configure[noexec] = "1"
> >  DEPENDS_append = " dtc-native openssl-native"
> >  
> >  # Add platform parameter
> > -EXTRA_OEMAKE += "PLAT=${TFA_PLATFORM}"
> > +EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
> >  
> >  # Handle TFA_DEBUG parameter
> >  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
> > @@ -85,6 +80,8 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAG
> >  # TFA is forcing the host compiler and its flags in the Makefile using :=
> >  # assignment for GCC and CFLAGS.
> >  do_compile() {
> > +    cd ${S}
> > +
> >      # These changes are needed to have the fiptool compiling and executing properly
> >      sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},' ${S}/tools/fiptool/Makefile
> >      sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
> > @@ -92,8 +89,15 @@ do_compile() {
> >  
> >      oe_runmake ${TFA_BUILD_TARGET}
> >  }
> > +do_compile[cleandirs] = "${B}"
> >  
> >  do_install() {
> > +    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> > +        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
> > +    else
> > +        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
> > +    fi
> > +
> >      install -d -m 755 ${D}/firmware
> >      for atfbin in ${TFA_INSTALL_TARGET}; do
> >          if [ "$atfbin" = "all" ]; then
> > @@ -102,21 +106,21 @@ do_install() {
> >              bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
> >              bberror "rewrite or turn off do_install"
> >              exit 1
> > -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
> > +        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
> >              echo "Install $atfbin.bin"
> > -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
> > +            install -m 0644 $BUILD_PLAT/$atfbin.bin \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> > -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
> > +        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
> >              echo "Install $atfbin.elf"
> > -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
> > +            install -m 0644 $BUILD_PLAT/$atfbin.elf \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> > -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
> > +        elif [ -f $BUILD_PLAT/$atfbin ]; then
> >              echo "Install $atfbin"
> > -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
> > +            install -m 0644 $BUILD_PLAT/$atfbin \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> >          elif [ "$atfbin" = "dtbs" ]; then
> >              echo "dtbs install, skipped"
> > -        elif [ -f ${S}/tools/$atfbin/$atfbin ]; then
> > +        elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
> >              echo "Tools $atfbin install, skipped"
> >          else
> >              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
> > -- 
> > 2.17.1
> > 
> 
> > 
> 

> 

