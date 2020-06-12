Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14644.1591945586500386003
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 00:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CADF040C37;
	Fri, 12 Jun 2020 07:06:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IupvGZxCmAnP; Fri, 12 Jun 2020 07:06:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5EE1940AB5;
	Fri, 12 Jun 2020 07:06:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1CB64173217; Fri, 12 Jun 2020 03:06:22 -0400 (EDT)
Date: Fri, 12 Jun 2020 03:06:22 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>
Subject: Re: [meta-arm] External toolchain support
Message-ID: <20200612070622.GO17660@denix.org>
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <20200611020138.GZ17660@denix.org>
 <CAFA6WYMSM490DfAmv+tJG=Y2kp9uxL=kW=Mx-Sx3+Ssz+AWeHQ@mail.gmail.com>
 <1617B50A09B8150A.14082@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1617B50A09B8150A.14082@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 01:34:02AM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 11, 2020 at 07:44:26PM +0530, Sumit Garg wrote:
> > On Thu, 11 Jun 2020 at 07:31, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > and no public review
> > > of Linaro-originated changes by using internal gerrit instead of public
> > > mailing list. The last one I didn't realize until later time. Often I would
> > > get an unnoticed run-time breakage introduced by some recent change in the
> > > recipe that didn't account for all our extensive downstream use cases. As
> > > there were no patches on the list, no reviews, no heads-up, I would scramble
> > > around in order to fix new breakages and in most cases would try to submit the
> > > fix upstream. Only to get them broken later due to the mentioned process
> > > downsides. I did mention couple of such instances recently [6][7]...
> > 
> > I guess it would have been better if you had added a complete feature
> > in upstream (say to support SDK or native compilation) instead which
> > could be tested standalone using external-toolchain recipe rather than
> > fragile dependencies that could only be tested with your downstream
> > project.
> 
> Well, it's not like I didn't try... :)
> 
> Some things were more straightforward and I had those upstreamed for the most 
> part. But other things were more controversial, when I was discussing those 
> back in the day, like external runtime + internal compiler or OE-built SDK + 
> external compiler. From OE perspective external toolchains are evil (or at 
> least a very foreign concept), so once you start mixing things, people get 
> upset, hence the pushback. That made those features scattered between upstream 
> and downstream, unfortunately.

Oh, forgot to mention! To support those extra features, changes had to be made 
outside of external-toolchain recipe, which may have contributed to them being 
considered controversial...

For example, external-arm-toolchain recipe only packages runtimes (headers, 
libs, stubs, target binaries), but not the host/cross binaries, as it 
basically extends glibc-package.inc from OE-Core. I have an additional recipe 
called external-arm-sdk-toolchain (not the best name), that packages prebuilt 
gcc, gdb, binutils binaries from EAT into proper *-cross-canadian-$ARCH 
packages, which could then be easily pulled into SDK.

We've been using meta-toolchain way of building SDKs from the early days, 
before "<rootfs> -c populate_sdk" was introduced. Some of the toolchain/SDK 
interaction and processing was added there, like packaging SDK w/o the 
toolchain, or establishing some symlinks between OE compiler and EAT runtime. 
Those don't make sense for the rootfs, hence meta-toolchain based SDK remained 
in use for us. Plus we build multiple rootfs images with different content, 
but a single complete SDK to cover them all, so "<rootfs> -c populate_sdk" to 
match the rootfs didn't make sense for our product...

I don't mean this to block a more appropriate re-implementation upstream, if 
needed, of course. I'm open to collaboration and re-design, but would like 
this to be a two-way road. Thanks.


> Plus I had some setbacks with aforementioned breakages...
> 
> But I still plan to contribute and if we find a consensus, I'd be happy to get 
> the rest of the features upstreamed.

-- 
Denys
