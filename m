Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.7311.1589870459340836670
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 23:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AEAB140C06;
	Tue, 19 May 2020 06:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJrntja7E3GN; Tue, 19 May 2020 06:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 738D140A9E;
	Tue, 19 May 2020 06:40:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 374C3173170; Tue, 19 May 2020 02:40:56 -0400 (EDT)
Date: Tue, 19 May 2020 02:40:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries artefacts to sysroot/firmware
Message-ID: <20200519064056.GQ11927@denix.org>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
 <1587454435-46370-3-git-send-email-diego.sueiro@arm.com>
 <20200519040543.GP11927@denix.org>
 <AM0PR08MB39876088695CD79E3EECB31E92B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB39876088695CD79E3EECB31E92B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 06:10:46AM +0000, Diego Sueiro wrote:
> > -----Original Message-----
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > Sent: 19 May 2020 05:06
> > To: meta-arm@lists.yoctoproject.org
> > Cc: nd <nd@arm.com>; Diego Sueiro <Diego.Sueiro@arm.com>
> > Subject: Re: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries
> > artefacts to sysroot/firmware
> > 
> > On Tue, Apr 21, 2020 at 08:33:52AM +0100, Diego Sueiro wrote:
> > > Make usage of the do_install task to deliver binaries artefacts to the
> > > `sysroot/firmware` path, making it easier for other recipes that
> > > depends on it to make usage of those binaries instead of copying them
> > > from the DEPLOY_DIR_IMAGE.
> > >
> > > This recipe still deploys its artefacts to DEPLOY_DIR_IMAGE.
> > >
> > > Change-Id: I97b97f90b23746557e981f8de10159c5f475becd
> > > Issue-Id: SCM-888
> > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > ---
> > >  .../trusted-firmware-a/trusted-firmware-a-fvp.inc  |  7 +++--
> > >  .../trusted-firmware-a/trusted-firmware-a.inc      | 31 +++++++++++++-------
> > --
> > >  2 files changed, 21 insertions(+), 17 deletions(-)
> > >
> > > diff --git
> > > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.i
> > > nc
> > > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.i
> > > nc
> > > index 6e7eba3..3e58ecf 100644
> > > ---
> > > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.i
> > > nc
> > > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-f
> > > +++ vp.inc
> > > @@ -12,9 +12,9 @@ TFA_MBEDTLS = "1"
> > >  TFA_UBOOT = "1"
> > >  TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fiptool"
> > >
> > > -do_deploy[depends] += "virtual/kernel:do_deploy"
> > > +do_install[depends] += "virtual/kernel:do_deploy"
> > >
> > > -do_deploy_append() {
> > > +do_install_append() {
> > >      ./tools/fiptool/fiptool create \
> > >          --tb-fw ${S}/${TFA_BUILD_DIR}/bl2.bin \
> > >          --soc-fw ${S}/${TFA_BUILD_DIR}/bl31.bin \ @@ -26,6 +26,5 @@
> > > do_deploy_append() {
> > >
> > >      ./tools/fiptool/fiptool info fip.bin
> > >
> > > -    install -m 0644 ${S}/fip.bin ${DEPLOYDIR}/fip-fvp.bin
> > > +    install -m 0644 ${S}/fip.bin ${D}/firmware/fip-fvp.bin
> > >  }
> > > -
> > > diff --git
> > > a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > index d7c4fbf..93ca199 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > @@ -5,7 +5,7 @@ PROVIDES = "virtual/trusted-firmware-a"
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > > -inherit deploy
> > > +inherit deploy nopackages
> > 
> > I totally missed this ^^^ - may I ask why nopackages was added here?
> 
> Because this recipe is not generating packages to be installed in the rootfs.

So does u-boot, grub, efi, systemd-boot, ovmf, opensbi, optee-os and many 
other recipes that deploy binaries outside of the rootfs. And yet, they do 
not inherit nopackages, because packages are useful for many things besides 
just rootfs...


> > >  COMPATIBLE_MACHINE ?= "invalid"
> > >
> > > @@ -42,12 +42,12 @@ SRCREV_FORMAT_append =
> > > "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',  TFA_UBOOT ?=
> > "0"
> > >
> > >  # What to build
> > > -# By default we only build bl1, do_deploy will install
> > > +# By default we only build bl1, do_deploy will copy
> > >  # everything listed in this variable (by default bl1.bin)
> > > TFA_BUILD_TARGET ?= "bl1"
> > >
> > >  # What to install
> > > -# do_deploy will install everything listed in this
> > > +# do_install and do_deploy will install everything listed in this
> > >  # variable. It is set by default to TFA_BUILD_TARGET
> > > TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
> > >
> > > @@ -60,9 +60,8 @@ LDFLAGS[unexport] = "1"
> > >  AS[unexport] = "1"
> > >  LD[unexport] = "1"
> > >
> > > -# No configure or install
> > > +# No configure
> > >  do_configure[noexec] = "1"
> > > -do_install[noexec] = "1"
> > >
> > >  # We need dtc for dtbs compilation
> > >  # We need openssl for fiptool
> > > @@ -87,27 +86,27 @@ do_compile() {
> > >      oe_runmake ${TFA_BUILD_TARGET}
> > >  }
> > >
> > > -do_deploy() {
> > > -    install -d -m 755 ${DEPLOYDIR}
> > > +do_install() {
> > > +    install -d -m 755 ${D}/firmware
> > >      for atfbin in ${TFA_INSTALL_TARGET}; do
> > >          if [ "$atfbin" = "all" ]; then
> > >              # Target all is not handled by default
> > > -            bberror "all as TFA_INSTALL_TARGET is not handled by do_deploy"
> > > +            bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
> > >              bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
> > > -            bberror "rewrite or turn off do_deploy"
> > > +            bberror "rewrite or turn off do_install"
> > >              exit 1
> > >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
> > >              echo "Install $atfbin.bin"
> > >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
> > > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.bin
> > > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> > >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
> > >              echo "Install $atfbin.elf"
> > >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
> > > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.elf
> > > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> > >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
> > >              echo "Install $atfbin"
> > >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
> > > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}
> > > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}
> > >          elif [ "$atfbin" = "dtbs" ]; then
> > >              echo "dtbs install, skipped"
> > >          elif [ -f ${S}/tools/$atfbin/$atfbin ]; then @@ -118,4
> > > +117,10 @@ do_deploy() {
> > >          fi
> > >      done
> > >  }
> > > -addtask deploy before do_build after do_compile
> > > +
> > > +SYSROOT_DIRS += "/firmware"
> > > +
> > > +do_deploy() {
> > > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/ } addtask deploy after
> > > +do_install
> > > --
> > > 2.7.4
> > >
> > 
> > >
> 
