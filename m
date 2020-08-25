Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.567.1598389837680715245
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 14:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D3F8B40C48;
	Tue, 25 Aug 2020 21:10:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAS6chLlyE5k; Tue, 25 Aug 2020 21:10:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F18C40A55;
	Tue, 25 Aug 2020 21:10:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0CFC4174463; Tue, 25 Aug 2020 17:10:33 -0400 (EDT)
Date: Tue, 25 Aug 2020 17:10:33 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm: trusted-firmware-a variable name misuse
Message-ID: <20200825211032.GT17660@denix.org>
References: <20200825023220.27193-1-jon.mason@arm.com>
 <20200825201141.GA24495@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200825201141.GA24495@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2020 at 04:11:41PM -0400, Jon Mason wrote:
> On Mon, Aug 24, 2020 at 10:32:19PM -0400, Jon Mason wrote:
> > "processes" should be "processed" in trusted-firmware-a.inc, as it
> > signifies if the relevant part has been installed/processed.
> > 
> > Change-Id: I2d1ffbb0c6d14d280b6f9c9cc45c04c7c32409a7
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> Pulled into master.

Thanks! Again, sorry for making this typo in the first place :)
Do you want to backport this to dunfell?


> Thanks,
> Jon
> 
> > ---
> >  .../trusted-firmware-a/trusted-firmware-a.inc        | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 4956c4f..e1cffdf 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -136,7 +136,7 @@ do_compile_append_aarch64_qemuall() {
> >  do_install() {
> >      install -d -m 755 ${D}/firmware
> >      for atfbin in ${TFA_INSTALL_TARGET}; do
> > -        processes="0"
> > +        processed="0"
> >          if [ "$atfbin" = "all" ]; then
> >              # Target all is not handled by default
> >              bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
> > @@ -150,32 +150,32 @@ do_install() {
> >              install -m 0644 ${BUILD_DIR}/$atfbin.bin \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> >              ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
> > -            processes="1"
> > +            processed="1"
> >          fi
> >          if [ -f ${BUILD_DIR}/$atfbin/$atfbin.elf ]; then
> >              echo "Install $atfbin.elf"
> >              install -m 0644 ${BUILD_DIR}/$atfbin/$atfbin.elf \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> >              ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
> > -            processes="1"
> > +            processed="1"
> >          fi
> >          if [ -f ${BUILD_DIR}/$atfbin ]; then
> >              echo "Install $atfbin"
> >              install -m 0644 ${BUILD_DIR}/$atfbin \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> >              ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
> > -            processes="1"
> > +            processed="1"
> >          fi
> >          if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
> >              echo "Install $atfbin.dtb"
> >              install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
> >                  "${D}/firmware/$atfbin.dtb"
> > -            processes="1"
> > +            processed="1"
> >          elif [ "$atfbin" = "dtbs" ]; then
> >              echo "dtbs install, skipped: set dtbs in TFA_INSTALL_TARGET"
> >          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
> >              echo "Tools $atfbin install, skipped"
> > -        elif [ "$processes" = "0" ]; then
> > +        elif [ "$processed" = "0" ]; then
> >              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
> >              exit 1
> >          fi
> > -- 
> > 2.17.1
> > 
> 
> > 
> 

> 

