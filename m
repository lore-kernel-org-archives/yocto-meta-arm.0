Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.637.1588356466337373643
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 11:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A970E40B6D
	for <meta-arm@lists.yoctoproject.org>; Fri,  1 May 2020 18:07:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qR5CefQ-idu for <meta-arm@lists.yoctoproject.org>;
	Fri,  1 May 2020 18:07:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98DDE409E7
	for <meta-arm@lists.yoctoproject.org>; Fri,  1 May 2020 18:07:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 004C3172D11; Fri,  1 May 2020 14:07:44 -0400 (EDT)
Date: Fri, 1 May 2020 14:07:44 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] Couple questions about Dunfell
Message-ID: <20200501180744.GZ11927@denix.org>
References: <20200425225727.GL11927@denix.org>
 <CAP71Wjy84MgZdC+j4WxysbH2wJuLrkBe1DNUFRxDAMwhknNtCQ@mail.gmail.com>
 <20200501132838.GA13726@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200501132838.GA13726@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2020 at 09:28:39AM -0400, Jon Mason wrote:
> On Wed, Apr 29, 2020 at 11:31:57AM +0200, Nicolas Dechesne wrote:
> > hi,
> > 
> > On Sun, Apr 26, 2020 at 12:57 AM Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > > Hi, Jon,
> > >
> > > I had couple questions:
> > >
> > > 1. What is the time frame for branching off Dunfell?
> 
> TL;DR:  Mid-May
> 
> We have a chicken-egg problem with the Gem5 support and Python2.
> We've been doing all of our testing (until recently) on zeus.  This is
> because we wanted to make sure any issues we encountered were ours and
> not an upstream issue.  For dunfell, the current Gem5 support has a
> requirement for meta-python2.  To add this to our internal git repos
> and test infrastructure would be painful.  However, the upcoming
> release for Gem5 removes such a dependency.  This release is scheduled
> for May 15th.  So, we can either go through a bunch of work that will
> be thrown away or wait a couple extra weeks.  We chose the latter.
> 
> As a stop gap, we are using the beta version of the new Gem5 release
> to make sure everything is in working order and we should be able to
> cut a release very quickly once it is out.
> 
> > > 2. What is the policy for backporting to Dunfell?
> > 
> > I am definitely interested in these questions, or rather in the answers to
> > these questions! Since dunfell is LTS, I would expect a dunfell branch to
> > be maintained in meta-arm.
> 
> The dunfell branch is planned to be a stable branch.   Only bug fixes,
> no features.  If an exception is to be made (which I really, really
> don't want to do), then it would be predicated on getting the relevant
> parts into the master branch of meta-arm.

Thanks for the details!


> > > I've got several patches in the pipeline that I'm testing and wanted to
> > > know
> > > my options.
> 
> More than what you've already pushed?

Yeah, few more. Mostly fixes and cleanups for toolchain and gcc.


> Thanks,
> Jon
> 
> > >
> > > Thanks.
> > >
> > > --
> > > Denys
> > > 
> > >
> 
> > 
> 

> 

