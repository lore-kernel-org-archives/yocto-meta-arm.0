Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14002.1591941732253969864
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 23:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C14240C37;
	Fri, 12 Jun 2020 06:02:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id islQgW8gk1yx; Fri, 12 Jun 2020 06:02:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 404A940AB5;
	Fri, 12 Jun 2020 06:02:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 00041173217; Fri, 12 Jun 2020 02:02:06 -0400 (EDT)
Date: Fri, 12 Jun 2020 02:02:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>,
	wmills@ti.com, Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [meta-arm] [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
Message-ID: <20200612060206.GM17660@denix.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <20200604230014.GH17660@denix.org>
 <CAFA6WYOQ4A9Wrqp9oAuZe+7k1CP3=8LTAhR1uUzt3SeDTZkNMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYOQ4A9Wrqp9oAuZe+7k1CP3=8LTAhR1uUzt3SeDTZkNMg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2020 at 04:56:54PM +0530, Sumit Garg wrote:
> On Fri, 5 Jun 2020 at 04:30, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Tue, Jun 02, 2020 at 04:34:50PM +0530, Sumit Garg wrote:
> > > Patch #1 and #2 adds impprovements in external-arm-toolchain recipe in order to
> > > support SDK generation. SDK generation has been tested using:
> > >
> > > $ bitbake core-image-base -c populate_sdk
> >
> > This just ensures that external-arm-toolchain doesn't get in the way of SDK
> > generation by avoiding any conflicts. The only re-use here is glibc. The rest
> > of pre-built Arm toolchain gets thrown out and rebuilt from sources - gcc,
> > binutils, gdb/gdbserver are all built from sources as TCMODE was not set and
> > falls back to "default".
> 
> Yes I noticed this as well. I guess we can improve this situation to
> package tools from pre-built toolchain only rather than building from
> source. Will explore options.
> 
> > Sure, pre-built Arm toolchain doesn't provide all
> > possible SDKMACHINE binaries, but for 90% cases of x86_64, there's very little
> > re-use...
> 
> Yes, but don't you think that having a common build environment using
> SDKs is still useful from the end user's perspective irrespective of
> underlying toolchain (built from source or pre-built)?

Just wanted to get back to this point.

Yes, in general that would be preferred (and exactly why OE insists on 
building everything, starting with the toolchain, compared to competitors 
that use prebuilt toolchains by default, like buildroot, etc).

But as you have seen from the discussion in the other thread, there are 
some legitimate (hopefully) reasons to re-use prebuilt binaries even for 
SDK - licensing, distribution and such...

Back in the day it was simpler - 32-bit x86 was dominant and what prebuilt 
toolchain supported as a host and being the default/only SDKMACHINE.

For some time Linaro toolchain supported both 32-bit and 64-bit x86 as a
host, so it was possible to support both of those SDKMACHINEs. These days 
32-bit x86 faded into obscurity. But on the other hand, aarch64 hosts are 
gaining traction, so targeting aarch64 SDKMACHINE from x86 host will be a 
problem with external-arm-toolchain w/o full rebuild of SDK toolchain...

So, hopefully this can be done optionally/conditionally to either re-use 
prebuilt binaries from external toolchain or build them from sources.

-- 
Denys
