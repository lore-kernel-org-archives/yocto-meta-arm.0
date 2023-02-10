Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B9AC636D7
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 20:46:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5647.1676062007397587218
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 12:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7F6E040C24;
	Fri, 10 Feb 2023 20:46:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBr6T_Dc0mTJ; Fri, 10 Feb 2023 20:46:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37BFF40BA8;
	Fri, 10 Feb 2023 20:46:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A22DE163758; Fri, 10 Feb 2023 15:46:20 -0500 (EST)
Date: Fri, 10 Feb 2023 15:46:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Suresh Kumar <Gowtham.SureshKumar@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm/edk2-basetools: Add edk2 base tool
 native recipe
Message-ID: <20230210204620.GB22689@denix.org>
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
 <20230127192122.19338-2-gowtham.sureshkumar@arm.com>
 <20230127212741.GI22689@denix.org>
 <AS8PR08MB717386476034CAB055FE3E2EE0DE9@AS8PR08MB7173.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR08MB717386476034CAB055FE3E2EE0DE9@AS8PR08MB7173.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Feb 2023 20:46:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4378

On Fri, Feb 10, 2023 at 12:24:56AM +0000, Gowtham Suresh Kumar wrote:
> Hello Denys,
> 
> I do not see any warnings related to host contamination when I use the 
> recipe. Can you please provide more details on it? If you are referring to 
> the ownership issue with cp command, does it also affect native recipes? 

Correct, the ownership issue won't affect the native recipe. But you are 
not adding native-only recipe, you are adding a regular target recipe and 
extending it to also provide a native variant.

If you only intend to use this in a native environment exclusively and it 
doesn't make sense for a target or nativesdk variants, you should make the 
recipe native-only. By naming it edk2-basetools-native_202211.bb, having 
"inherit native" line and dropping BBCLASSEXTEND = "native"


> This recipe is just populating the required edk2 tools to the native staging 
> directory to use for UEFI capsule image generation.
> 
> Best regards,
> Gowtham Suresh Kumar
> ________________________________
> From: Denys Dmytriyenko <denis@denix.org>
> Sent: Friday, January 27, 2023 9:27 PM
> To: Gowtham Suresh Kumar <Gowtham.SureshKumar@arm.com>
> Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
> Subject: Re: [meta-arm] [PATCH 1/3] arm/edk2-basetools: Add edk2 base tool native recipe
> 
> On Fri, Jan 27, 2023 at 07:21:20PM +0000, Gowtham Suresh Kumar wrote:
> > From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
> >
> > The native recipe installs the UEFI capsule generation tool
> > along with the other base tools to native sysroot.
> >
> > Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
> > ---
> >  .../edk2-basetools/edk2-basetools_202211.bb   | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
> >
> > diff --git a/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
> > new file mode 100644
> > index 00000000..c80fdae2
> > --- /dev/null
> > +++ b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
> > @@ -0,0 +1,24 @@
> > +# Install EDK2 Base Tools in native sysroot. Currently the BaseTools are not
> > +# built, they are just copied to native sysroot. This is sufficient for
> > +# generating UEFI capsules as it only depends on some python scripts. Other
> > +# tools need to be built first before adding to sysroot.
> > +
> > +DESCRIPTION = "EDK2 Base Tools"
> 
> This ^ should be SUMMARY
> 
> 
> > +LICENSE = "BSD-2-Clause-Patent"
> > +
> > +# EDK2
> > +SRC_URI = "git://github.com/tianocore/edk2.git;branch=master;protocol=https"
> > +LIC_FILES_CHKSUM = "file://License.txt;md5=2b415520383f7964e96700ae12b4570a"
> > +
> > +SRCREV = "fff6d81270b57ee786ea18ad74f43149b9f03494"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +RDEPENDS:${PN} += "python3-core"
> > +
> > +do_install () {
> > +    mkdir -p ${D}${bindir}/edk2-BaseTools
> > +    cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk2-BaseTools/
> 
> You could potentially have a host contamination warning here.
> 
> 
> > +}
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 2.17.1
> >

