Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFD0C433FE
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 16:32:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.69.1636993953461048763
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4993940C24;
	Mon, 15 Nov 2021 16:32:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thB7eO-n2Y0z; Mon, 15 Nov 2021 16:32:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BBBB400CF;
	Mon, 15 Nov 2021 16:32:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DB6981746CD; Mon, 15 Nov 2021 11:32:27 -0500 (EST)
Date: Mon, 15 Nov 2021 11:32:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com, Ross.Burton@arm.com
Subject: Re: [meta-arm] [PATCHv2 1/3] optee: updae optee-os.inc to support
 external TAs
Message-ID: <20211115163227.GU10132@denix.org>
References: <20211111131615.16972-1-maxim.uvarov@linaro.org>
 <CAPoiz9w+dmYeUwqiVf9d95xfOo1MBP5GjSbSN3WKWLDyikkVAA@mail.gmail.com>
 <CAD8XO3b1FfKNq1n8hjR-jkE5ND2xSefnvstKxnzqzAnfYzm7KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAD8XO3b1FfKNq1n8hjR-jkE5ND2xSefnvstKxnzqzAnfYzm7KA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 16:32:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2395

On Mon, Nov 15, 2021 at 09:28:08AM +0300, Maxim Uvarov wrote:
> On Mon, 15 Nov 2021 at 06:52, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Thu, Nov 11, 2021 at 8:16 AM Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > >
> > > Separate recipe for TA devkit is needed to solve
> > > circular dependency to build TAs withthe devkit
> > > and integrate it inside optee-os.
> > >
> > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> >
> > On this series, I'm seeing:
> > ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but
> > /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > DEPENDS on or otherwise requires it)
> > optee-os-tadevkit was skipped: incompatible with machine tc0 (not in
> > COMPATIBLE_MACHINE)
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328692
> >
> > Issue on tc0, tc1, and corstone1000 (and check-patch)
> >
> 
> This should be fixed in v3 with adding conditions.
> 
> > I'm also seeing:
> > ERROR: Nothing PROVIDES 'compiler-rtoptee-ftpm' (but
> > /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > DEPENDS on or otherwise requires it)
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328682
> >
> > Issue on qemuarm64-secureboot
> >
> 
> That is interesting. I also built a qemuarm64-secureboot. Might be
> some changes in the current master for that.

That is due to a missing space in bbappend:
+DEPENDS:append = "optee-ftpm"

Resulting in optee-ftpm being concatenated to compiler-rt in DEPENDS:
> ERROR: Nothing PROVIDES 'compiler-rtoptee-ftpm' (but

Similar to the one I reported about EXTRA_OEMAKE in the same bbappend...

-- 
Denys


> > Thanks,
> > Jon
> >
> >
> >
> >
> >
> >
> > > ---
> > >  .../recipes-security/optee/optee-examples.inc |  2 +-
> > >  .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
> > >  meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
> > >  3 files changed, 21 insertions(+), 8 deletions(-)
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > >
> > > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> > > index 921fa18..656722e 100644
> > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > > @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> > >  LICENSE = "BSD-2-Clause"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> > >
> > > -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> > > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> > >
> > >  inherit python3native
> > >
> > > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > new file mode 100644
> > > index 0000000..0d37a52
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > @@ -0,0 +1,20 @@
> > > +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> > > +require optee-os_3.14.0.bb
> > > +
> > > +SUMMARY = "OP-TEE Trusted OS TA devkit"
> > > +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> > > +HOMEPAGE = "https://www.op-tee.org/"
> > > +
> > > +do_install() {
> > > +    #install TA devkit
> > > +    install -d ${D}${includedir}/optee/export-user_ta/
> > > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > +    done
> > > +}
> > > +
> > > +do_deploy() {
> > > +       echo "Do not inherit do_deploy from optee-os."
> > > +}
> > > +
> > > +FILES:${PN} = "${includedir}/optee/"
> > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > > index 277646e..1506a58 100644
> > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > @@ -46,12 +46,6 @@ do_install() {
> > >      #install core in firmware
> > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > >      install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> > > -
> > > -    #install TA devkit
> > > -    install -d ${D}${includedir}/optee/export-user_ta/
> > > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > -    done
> > >  }
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > @@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
> > >  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> > >
> > >  FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> > > -FILES:${PN}-dev = "${includedir}/optee/"
> > >
> > >  # note: "textrel" is not triggered on all archs
> > >  INSANE_SKIP:${PN} = "textrel"
> > > --
> > > 2.17.1
> > >
> > >
> > > 
> > >

