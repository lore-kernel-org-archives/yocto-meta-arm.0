Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2662.1580172447731524609
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 16:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D802D40AD1
	for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2020 00:47:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEfJiKPg8svx for <meta-arm@lists.yoctoproject.org>;
	Tue, 28 Jan 2020 00:47:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C62F6409E7
	for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2020 00:47:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 201651743BD; Mon, 27 Jan 2020 19:47:26 -0500 (EST)
Date: Mon, 27 Jan 2020 19:47:26 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] Proposal to import ARM GCC toolchain recipes into meta-arm
Message-ID: <20200128004726.GJ4735@denix.org>
References: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
 <12230.1579827059785197376@lists.yoctoproject.org>
 <CAFA6WYMXaNgRgAJ_mC-TSYqgRBvZkVD4Le=qu-p4s-wZb9h25Q@mail.gmail.com>
 <CAPoiz9zfipHK4pf6ECt-f5Gq6w_cKwh=DdsTdHnE+ENh--7vCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoiz9zfipHK4pf6ECt-f5Gq6w_cKwh=DdsTdHnE+ENh--7vCw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 24, 2020 at 04:12:39PM -0500, Jon Mason wrote:
> On Fri, Jan 24, 2020 at 12:18 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > On Fri, 24 Jan 2020 at 06:21, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > As one of the original developers of the whole "external-toolchain" support[1] and still being an active contributor[2], spanning through CodeSourcery->Linaro->Arm recipes, I would certainly welcome this move!
> >
> > Thanks Denys for your contribution.
> >
> > >
> > > BTW, what is the branching strategy for this layer - will there be release branches, like thud, zeus, etc.?
> >
> > I would expect meta-arm tree to also support thud, warrior and zeus
> > branches since external-arm-toolchain support all these OE release
> > branches.
> 
> Our plan was only to support zeus and releases going forward.  This
> was to limit the releases we need to test on.  If there is a desire
> for more, then we can accommodate.
> 
> And to answer Denys' original question, yes we will create branches
> for each one.  Given that we are currently only supporting zeus, this
> is why we only have master now.  If there is a request for me (per
> above), then we will branch as needed.

Jon,

Thank you for the details. One more question - do Arm-originated patches go 
through the same public list or are they reviewed internally before merging? 
Thanks!

-- 
Denys


> > > [1] https://git.openembedded.org/openembedded/log/recipes/meta/external-toolchain-csl.bb
> > > [2] https://git.linaro.org/openembedded/meta-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Thu, Jan 23, 2020 at 02:39 AM, Sumit Garg wrote:
> > >
> > > Hi Jon and all,
> > >
> > > As you may be aware that Linaro used to maintain meta-linaro-toolchain
> > > layer [1] in meta-linaro tree for GCC tool-set releases from Linaro
> > > till GCC 7.
> > >
> > > And since GCC 8, the tool-set release and maintenance work was
> > > transferred to ARM. But meta-linaro-toolchain layer continued support
> > > for ARM GCC tool-set releases as well.
> > >
> > > In future, I think meta-arm tree [2] shall be an appropriate place to
> > > host ARM GCC toolchain recipes as an additional meta-arm-toolchain
> > > layer. Also, with the latest integration [3] for ARM GCC 9.2 toolchain
> > > in meta-linaro, recipes are well tested and seems to be stable. So I
> > > would like to propose import of ARM GCC toolchain recipes into
> > > meta-arm.
> > >
> > > I am looking forward to any comments or suggestions regarding this proposal.
> > >
> > > [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain
> > > [2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> > > [3] https://lists.yoctoproject.org/g/yocto/message/48094
> > >
> > > Regards,
> > > Sumit
> > >
> > >
> > 

> 

