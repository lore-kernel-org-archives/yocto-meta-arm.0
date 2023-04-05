Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF7FC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 23:41:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.146250.1680738053077659558
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 16:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4199A40AC9;
	Wed,  5 Apr 2023 23:40:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Etm4ouae2KS2; Wed,  5 Apr 2023 23:40:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1A29406B5;
	Wed,  5 Apr 2023 23:40:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A51C91637F9; Wed,  5 Apr 2023 19:40:09 -0400 (EDT)
Date: Wed, 5 Apr 2023 19:40:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Adam Johnston <Adam.Johnston@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>,
	Jon Mason <Jon.Mason@arm.com>,
	Yocto TSC <tsc@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit
 to 3.20 for N1SDP
Message-ID: <20230405234009.GI9226@denix.org>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230404161414.GC9226@denix.org>
 <PAXPR08MB6432BA9D89EC85F016E440FDE9909@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230405150847.GD9226@denix.org>
 <ZC3IXbJDPZYoaVHh@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC3IXbJDPZYoaVHh@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 23:41:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4556

On Wed, Apr 05, 2023 at 03:13:33PM -0400, Jon Mason wrote:
> On Wed, Apr 05, 2023 at 11:08:47AM -0400, Denys Dmytriyenko wrote:
> > On Wed, Apr 05, 2023 at 08:02:52AM +0000, Adam Johnston wrote:
> > > Ross/Jon might be able to provide more insight here.
> > > 
> > > AFAIK they drive the versions supported based on what the component team (in 
> > > this case OP-TEE) have released.
> > > 
> > > The complexity for components like OP-TEE, which require platform 
> > > adaptation, is that updating the recipe for a specific platform is gated by 
> > > when the adaptation (or OoT patches) can be updated and validated by the 
> > > relevant platform team.
> > 
> > At the TSC meetings recently we've discussed the possibility of migrating 
> > Trusted Firmware and OP-TEE components from meta-arm to oe-core in order to 
> > reduce dependencies on these core components by other BSPs.
> >
> > In meta-ti BSP we've been updating OPTEE (and TF-A to a lesser extent) 
> > regularly to the very latest release and often ahead of meta-arm, even though 
> > meta-arm is upstream to meta-ti for those components - usually latest versions 
> > add new features or new platform support. TI policy for OPTEE and TF-A is to 
> > work directly with upstream and hence there are no local patches.
> 
> Please send patches when there is the delta you describe.  Or, let me
> know and I'll do the patches.  I try to stay on top of the latest
> releases as they come out, but sometimes I don't notice for a bit.
> 
> > I was wondering how ARM reference platforms in meta-arm-bsp and platforms in 
> > other BSPs handle this and whether there's extra work required updating local 
> > patches or adaptations for regular version bumps. If OPTEE and TF-A go to 
> > oe-core, would that negatively affect meta-arm?
> 
> It is not known by me who needs the latest versions of the packages in
> a cadence more frequent than what has been occurring.  To my
> knowledge, meta-arm always has the latest version when the releases
> are cut.  If this is not the case, please do hold me accountable.


Jon,

Version 3.20.0 of all the OPTEE components was released in January, but only 
optee-os got updated in meta-arm. Other components like optee-os-tadevkit, 
optee-client, optee-test and optee-examples were 2 versions behind on 3.18.0.

Patches are submitted here:
https://patchwork.yoctoproject.org/project/arm/list/?series=11813

Most of these updated components were tested on TI platforms, build-tested on 
qemuarm64 and qemuarm64-secureboot, so let me know if you see any issues.

-- 
Denys


> > > ________________________________
> > > From: Denys Dmytriyenko <denis@denix.org>
> > > Sent: Tuesday, April 4, 2023 5:14:14 PM
> > > To: Adam Johnston <Adam.Johnston@arm.com>
> > > Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
> > > Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to 3.20 for N1SDP
> > > 
> > > On Tue, Apr 04, 2023 at 08:24:14AM +0000, Adam Johnston wrote:
> > > > The only other platform which also enables OP-TEE OS is Corstone-1000, but
> > > > they didn't enable OP-TEE OS TA Devkit (required for OP-TEE xtest)
> > > > I agree it would make sense to update/enable both at the same time for CI
> > > > (as long as it doesn't affect the Corstone-100 BSPs)
> > > 
> > > And there are downstream BSPs using meta-arm and consuming OPTEE (OS, client,
> > > xtest, etc)
> > > 
> > > It would be appreciated if generic recipes are also updated for everyone to
> > > use and not just platform-specific bbappends. Thanks.
> > > 
> > > --
> > > Denys
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: Denys Dmytriyenko <denis@denix.org>
> > > > Sent: Tuesday, April 4, 2023 1:06 AM
> > > > To: Adam Johnston <Adam.Johnston@arm.com>
> > > > Cc: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
> > > > Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to 3.20 for N1SDP
> > > >
> > > > On Mon, Apr 03, 2023 at 04:43:06PM +0100, Adam Johnston wrote:
> > > > > From: Adam Johnston <adam.johnston@arm.com>
> > > > >
> > > > > As optee-os for the N1SDP has been updated to 3.20 we need to do the
> > > > > same for optee-os-tavdekit. Otherwise errors will be seen if/when
> > > > > optee-os-tavdekit is built.
> > > >
> > > > So, why only update it for N1SDP and not for everyone globally in meta-arm?
> > > >
> > > >
> > > > > Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> > > > > ---
> > > > >  .../optee/optee-os-tadevkit_3.18.0.bbappend   |  1 -
> > > > >  .../optee/optee-os-tadevkit_3.20.0.bbappend   |  6 +++++
> > > > >  .../optee/optee-os-tadevkit_3.20.0.bb         | 24 +++++++++++++++++++
> > > > >  3 files changed, 30 insertions(+), 1 deletion(-)  create mode 100644
> > > > > meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappend
> > > > >  create mode 100644
> > > > > meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> > > > >
> > > > > diff --git
> > > > > a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> > > > > d
> > > > > b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> > > > > d
> > > > > index 9a210832..6a22d47e 100644
> > > > > ---
> > > > > a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> > > > > d
> > > > > +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bba
> > > > > +++ ppend
> > > > > @@ -2,6 +2,5 @@
> > > > >
> > > > >  MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?= ""
> > > > >  MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc = "optee-os-generic-tc.inc"
> > > > > -MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
> > > > >
> > > > >  require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
> > > > > diff --git
> > > > > a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappen
> > > > > d
> > > > > b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappen
> > > > > d
> > > > > new file mode 100644
> > > > > index 00000000..e09c4a5e
> > > > > --- /dev/null
> > > > > +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bba
> > > > > +++ ppend
> > > > > @@ -0,0 +1,6 @@
> > > > > +# Machine specific configurations
> > > > > +
> > > > > +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?= ""
> > > > > +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
> > > > > +
> > > > > +require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
> > > > > diff --git
> > > > > a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> > > > > b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> > > > > new file mode 100644
> > > > > index 00000000..202caa54
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> > > > > @@ -0,0 +1,24 @@
> > > > > +require optee-os_3.20.0.bb
> > > > > +
> > > > > +SUMMARY = "OP-TEE Trusted OS TA devkit"
> > > > > +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> > > > > +HOMEPAGE = "https://www.op-tee.org/"
> > > > > +
> > > > > +DEPENDS += "python3-pycryptodome-native"
> > > > > +
> > > > > +do_install() {
> > > > > +    #install TA devkit
> > > > > +    install -d ${D}${includedir}/optee/export-user_ta/
> > > > > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > > > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > > > +    done
> > > > > +}
> > > > > +
> > > > > +do_deploy() {
> > > > > +   echo "Do not inherit do_deploy from optee-os."
> > > > > +}
> > > > > +
> > > > > +FILES:${PN} = "${includedir}/optee/"
> > > > > +
> > > > > +# Build paths are currently embedded
> > > > > +INSANE_SKIP:${PN}-dev += "buildpaths"
> > > > > --
> > > > > 2.38.1

