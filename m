Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7170.1589951899002624299
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 22:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 449DD40C14;
	Wed, 20 May 2020 05:18:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pj6B-nlNicRA; Wed, 20 May 2020 05:18:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 22EE3403F2;
	Wed, 20 May 2020 05:18:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 82B251731FD; Wed, 20 May 2020 01:18:16 -0400 (EDT)
Date: Wed, 20 May 2020 01:18:16 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Paul Barker <pbarker@konsulko.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] External toolchain support
Message-ID: <20200520051816.GB17660@denix.org>
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Paul,

We have had an extensive discussion on this topic over on irc earlier today. 
Yet, I see you went ahead with your rant without any of the clarifications we 
disucssed on irc. If it is all about simply bashing external toolchains, as 
Ross suggested, then knock yourself out - I won't mind as long as you don't 
drag me into it... :) Thanks.

Denys


On Tue, May 19, 2020 at 09:03:53PM +0100, Paul Barker wrote:
> Hi all,
> 
> As discussed on the Yocto Project call today it's great to see the ARM
> toolchain recipes moving forward under the new meta-arm layers. I've
> had some issues in the past with the external pre-built toolchain
> which really need fixing to properly integrate this toolchain into
> projects. I'm raising them here in the hopes that these can now be
> fixed.
> 
> 1) Maintaining GPL compliance while using an external toolchain
> 
> The Yocto Project has an archiver class which can be used to collect
> the source code of all packages built by bitbake which is a
> requirement for meeting the terms of the GPL. However for the external
> toolchain recipes the "source" is the pre-built toolchain archive
> downloaded from the ARM website. As the pre-built toolchain includes
> glibc (which is then distributed as part of the images we build) what
> we need is the actual source code used to build the various toolchain
> components.
> 
> The toolchain recipe needs to include some link to the actual upstream
> sources and the archiver class in oe-core probably needs extending to
> support this.
> 
> 2) Building an SDK/ESDK
> 
> If an SDK is generated for an image built with the pre-built toolchain
> then there can be some confusion about what exactly should provide the
> gcc binary and various headers. In the past I've had to hack
> components out of the SDK after it is built and then tell customers to
> install the pre-built toolchain alongside the SDK in order to get a
> working cross-compiler. Ideally everything should actually get
> packaged into the SDK so that only one download is needed and no
> hard-coded paths are used.
> 
> Additionally, running the populate_sdk task often fails due to missing
> packages (libatomic-dev right now) and it looks like the recipe
> bitrots fairly quickly after each fix. SDK generation needs to be
> regularly tested and it needs to be confirmed that these SDKs can
> actually cross-compile working binaries.
> 
> 3) Toolchain recipe is effectively split between meta-arm & meta-arago layers
> 
> The bbappends carried in meta-arago fix items which are missing from
> the external-arm-toolcahin recipe in meta-arg (e.g. the installation
> of the ldconfig binary). That effectively splits the recipe over
> multiple layers as these things are pretty fundamental parts of the
> external-arm-toolchain recipe. An effort needs to be made to merge all
> this together and have the base recipe well tested.
> 
> 4) No example configurations or visible test matrix
> 
> The meta-arm-toolchain layer lacks a README or other file providing
> some examples of working build configurations which use the pre-built
> toolchain. It's unclear which MACHINEs and DISTROs are regularly
> tested and are well supported. The best way to solve this would be to
> actually store the test scripts and configurations in this layer and
> use a publicly visible CI system like Travis, GitLab CI, etc to run
> the tests. That would increase confidence in the pre-built toolchain
> and make it clear what is supported and how frequently it's tested.
> 
> 5) LICENSE is incorrectly stated in the external-arm-toolchain recipe
> 
> The full license of the toolchain package needs to be specified. Right
> now all packages are marked as having the MIT license which is
> obviously not correct for most of them.
> 
> Apologies for the long rant but I hope this is useful to highlight
> some of the issues seen when trying to practically use the pre-built
> ARM toolchain.
> 
> Thanks,
> 
> -- 
> Paul Barker
> Konsulko Group

> 

