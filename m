Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2753.1591840901936241167
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 19:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E7F840B7F;
	Thu, 11 Jun 2020 02:01:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2vWZXjcy-PR; Thu, 11 Jun 2020 02:01:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9399F40B30;
	Thu, 11 Jun 2020 02:01:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EE88517320F; Wed, 10 Jun 2020 22:01:38 -0400 (EDT)
Date: Wed, 10 Jun 2020 22:01:38 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: Re: [meta-arm] External toolchain support
Message-ID: <20200611020138.GZ17660@denix.org>
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

All,

I know I said I wasn't going to participate in this discussion, but seeing 
where things are heading, I wanted to set some records straight... A brief 
history, that should explain few things the way they are now and I'll try to 
be brief and humble :) Also, I mean no disrespect or offense to anybody and am 
trying to be as polite and diplomatic as possible!

Around 2007-2008 we migrated our Linux product to OpenEmbedded (Classic at the 
time) and we called it the Arago Project - one of the original requirements 
was the use of a prebuilt cross-compile toolchain. Back then CodeSourcery Lite 
was the most popular and free ARM cross-compile toolchain. So I had to add 
support for it to OpenEmbedded and maintain it for few years since 2009 [1]. 
I used a basic stub from Poky as a starting point, but most of it was my own, 
like a single recipe supporting different toolchain versions, etc. I also had 
recipes for different OE-based Distro toolchains, like Angstrom...

Late 2010, early 2011 saw 2 relevant major events happening - CodeSourcery was 
acquired by Mentor and eventually discontinued the free Lite tier; and the 
announcement of the Yocto Project and reaching agreement with OpenEmbedded 
(yeah, I was there :) While everyone started creating their own meta layers 
(meta-ti for our BSP and a pair of meta-arago for Apps and Distro), there was 
a void for a free prebuilt ARM cross-compile toolchain. That resulted in a 
public Arago toolchain release [2] that I built and maintained for few years 
(and the corresponding recipe). BTW, back then I had the correct per-component 
Licenses set based on the version [3].

We had additional requirements for our products to support on-target native 
compilation (external runtime + internal compiler), as well as SDK 
cross-compiling while re-using the same external toolchain (with the option of 
getting standalone toolchain separately from SDK). A lot of extras has been 
added on top of the initial external-toolchain recipe. Most of that was inside 
the Arago Project code base, as that's where it originated. And I have given 
several presentations around that time and following years at conferences on 
the use of external toolchains in OpenEmbedded, using same external toolchains 
in SDKs, dealing with relocation issues, etc. [4] Those weren't very popular 
topics among OE/Yocto crowd, as that camp prefers building toolchains from 
sources :) But our non-OE developers and users demanded prebuilt toolchains 
and maximum re-use of corresponding components, while being flexible shipping 
OE SDK w/o the toolchain pre-integrated due to license restrictions...

And while Linaro already had their gcc team working on ARM enhancements, they 
didn't have any releases for few years. Thanks to Bill and others, by 2013 
that got corrected and OE recipes based on existing old work were added to 
support the new Linaro toolchain releases. But it only addressed the basic 
cross-compiling of target binaries - no SDK support, no native on-target 
compilation, no extras. Still, it was time to switch to the new Linaro 
toolchain releases. And meta-linaro was quite open and receptive to patches 
from outside, so I started submitting fixes and enhancements I had accumulated 
in meta-arago over the years. I also had an open communication channel with 
Koen, so that was also helpful to push changes in.

But in recent years things weren't as rosy as they were before - toolchain 
release ownership has changed, there was no clear owner for the recipe to go 
along, so I had to step up my game [5], although I raised the question few 
times whether I should just take over and take the recipe back...

Also, 2 major downsides surfaced with meta-linaro process itself - lack of 
testing of external-toolchain use in OE (besides basics) and no public review 
of Linaro-originated changes by using internal gerrit instead of public 
mailing list. The last one I didn't realize until later time. Often I would 
get an unnoticed run-time breakage introduced by some recent change in the 
recipe that didn't account for all our extensive downstream use cases. As 
there were no patches on the list, no reviews, no heads-up, I would scramble 
around in order to fix new breakages and in most cases would try to submit the 
fix upstream. Only to get them broken later due to the mentioned process 
downsides. I did mention couple of such instances recently [6][7]...

So, when earlier this year I started working with meta-arm, I was very pleased 
with the open process, where all internal and external patches go to the list 
for review. And I was happy to see OPTEE and ARM toolchain recipes migrating 
there as well [8], so in the past several months I cleaned up and upstreamed 
many hacks and enhancements there from meta-arago [9]. Of course, few were 
still remaining, but the plan was always to get everything upstream. 
Unfortunately, Paul wasn't willing to wait much longer... :)

That "activated" Sumit :) and I understand his position very well and 
appreciate his energy! He's been given a problem and is trying to solve it, 
but he's changing some fundamentals as he's not bound by many use cases. 
Changing those fundamentals actually breaks bunch of my use cases that I'm 
bound to by our product. So, on one hand he's changing things upstream and 
I'm downstream and am supposed to adapt. But on the other hand, I've been 
maintaining and supporting this for 11-12 years and I have tons of baggage in 
form of existing products and multiple use cases he is not considering. Plus, 
it was never clear if there are any other users or consumers of 
external-toolchain, especially to the extent we use it in the Arago Project as 
part of TI SDK products, which means changing things in incompatible way 
breaks the only major consumer of this feature. I fear if we cannot find a 
reasonable technical and architectural consensus for these changes, it may 
result in the opposite outcome from what Paul was seeking - a major fork with 
2 separate external-toolchain supports. And I'm not trying to make any 
excuses, but the fact that I'm severely burned out right now only exacerbates 
the whole situation, sorry...


[1] https://git.openembedded.org/openembedded/log/recipes/meta/external-toolchain-csl.bb
[2] http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html
[3] http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-extras/recipes-core/meta/external-arago-toolchain.inc;h=da0d9abd77a17f2334cdea8b5f05ef43a550eaaf;hb=90dc157478439b2facc87a47d8ba8abb596edc6e
[4] https://elinux.org/images/c/c8/ExternalToolchainsInYocto.pdf
[5] https://git.linaro.org/openembedded/meta-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
[6] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchain?id=efd07731659f2e8e8970f1a26e8dacfbd19ce832
[7] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchain?id=7765d89009f9ace12e600d9e6650fa8f019ba034
[8] https://lists.yoctoproject.org/g/meta-arm/message/13
[9] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/log/meta-arm-toolchain


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

