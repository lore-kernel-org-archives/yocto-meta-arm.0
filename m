Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3451.1618877881703303063
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 17:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 42E6F40C1D;
	Tue, 20 Apr 2021 00:18:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUSNDGuswPHd; Tue, 20 Apr 2021 00:18:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 103AF40B66;
	Tue, 20 Apr 2021 00:17:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 59B561745C6; Mon, 19 Apr 2021 20:17:56 -0400 (EDT)
Date: Mon, 19 Apr 2021 20:17:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: Yann Dirson <yann.dirson@blade-group.com>,
	meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Subject: Re: [meta-arm] [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
Message-ID: <20210420001756.GK15937@denix.org>
References: <20210414134726.4125294-1-yann@blade-group.com>
 <20210414134726.4125294-4-yann@blade-group.com>
 <CAAnfSTumRh_EaePZpxccodTmtTO=M0BqLHzfZn78iZXpVjhT=Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTumRh_EaePZpxccodTmtTO=M0BqLHzfZn78iZXpVjhT=Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 19, 2021 at 05:34:13PM +0100, Ross Burton wrote:
> This is causing the CI to break:
> 
> ERROR: optee-os-3.11.0-r0 do_package_qa: QA Issue: optee-os: ELF
> binary /lib/firmware/tee.elf has relocations in .text [textrel]
> 
> Can you either fix or add an INSANE_SKIP with a comment?

Ah, sorry, forgot to mention that textrel needs to be added to INSANE_SKIP now 
that tee.elf gets packaged.


> Ross
> 
> On Wed, 14 Apr 2021 at 14:48, Yann Dirson <yann.dirson@blade-group.com> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Integration of OP-TEE in the u-boot image is done with `TEE=tee.elf`,
> > so this build artifact must be exported.
> >
> > U-boot integration can now be done in a BSP layer with something like
> > this in `u-boot_%.bbappend`:
> >
> >  # OP-TEE, dependent on "optee" DISTRO_FEATURES
> >
> >  OPTEE_OEMAKE ?= " TEE=${DEPLOY_DIR_IMAGE}/optee/tee.elf"
> >
> >  EXTRA_OEMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
> >  PACKAGECONFIG[optee] = "${OPTEE_OEMAKE},,optee-os"
> >  PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'optee', d)}"
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > index 34f586a..08cc2f0 100644
> > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > @@ -45,7 +45,7 @@ do_compile[cleandirs] = "${B}"
> >  do_install() {
> >      #install core in firmware
> >      install -d ${D}${nonarch_base_libdir}/firmware/
> > -    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> > +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> >
> >      #install TA devkit
> >      install -d ${D}${includedir}/optee/export-user_ta/
> > --
> > 2.30.2
> >
> >
> > 
> >

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
