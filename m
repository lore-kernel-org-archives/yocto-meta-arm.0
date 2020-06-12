Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.13746.1591940047093077905
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 22:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5F3C140C37;
	Fri, 12 Jun 2020 05:34:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fk5dhMM6NZj0; Fri, 12 Jun 2020 05:34:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B667640A46;
	Fri, 12 Jun 2020 05:34:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5C5A2173217; Fri, 12 Jun 2020 01:34:02 -0400 (EDT)
Date: Fri, 12 Jun 2020 01:34:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>
Subject: Re: [meta-arm] External toolchain support
Message-ID: <20200612053402.GL17660@denix.org>
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <20200611020138.GZ17660@denix.org>
 <CAFA6WYMSM490DfAmv+tJG=Y2kp9uxL=kW=Mx-Sx3+Ssz+AWeHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMSM490DfAmv+tJG=Y2kp9uxL=kW=Mx-Sx3+Ssz+AWeHQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 07:44:26PM +0530, Sumit Garg wrote:
> On Thu, 11 Jun 2020 at 07:31, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > We had additional requirements for our products to support on-target native
> > compilation (external runtime + internal compiler), as well as SDK
> > cross-compiling while re-using the same external toolchain (with the option of
> > getting standalone toolchain separately from SDK). A lot of extras has been
> > added on top of the initial external-toolchain recipe. Most of that was inside
> > the Arago Project code base, as that's where it originated. And I have given
> > several presentations around that time and following years at conferences on
> > the use of external toolchains in OpenEmbedded, using same external toolchains
> > in SDKs, dealing with relocation issues, etc. [4] Those weren't very popular
> > topics among OE/Yocto crowd, as that camp prefers building toolchains from
> > sources :) But our non-OE developers and users demanded prebuilt toolchains
> > and maximum re-use of corresponding components, while being flexible shipping
> > OE SDK w/o the toolchain pre-integrated due to license restrictions...
> 
> Okay, I see the reasoning behind toolchain being distributed separately.

Correct. While runtime is mostly fine (L/GPLv2 for glibc and RLE exception for 
libgcc/libstdc++, which makes GPLv3 bearable) it is not the case for gcc, gdb 
and binutils binaries, which are mostly GPLv3 now. Originally we were avoiding 
distributing GPLv3 components, but eventually that got sorted out. Hence the 
requirement to be able to distribute OE SDK w/o pre-integrated toolchain. That 
way customers can download the toolchain on their own to use with that SDK.


> > And while Linaro already had their gcc team working on ARM enhancements, they
> > didn't have any releases for few years. Thanks to Bill and others, by 2013
> > that got corrected and OE recipes based on existing old work were added to
> > support the new Linaro toolchain releases. But it only addressed the basic
> > cross-compiling of target binaries - no SDK support, no native on-target
> > compilation, no extras.
> 
> Yes, external-{linaro/arm}-toolchain only provided cross-compilation
> of target binaries and corresponding run-time environment as a
> replacement of OE toolchain built from source until now when I started
> looking at SDK support.
> 
> Although, I agree that your downstream project had the complete
> feature-set that only re-uses external-{linaro/arm}-toolchain recipe.
> 
> > But in recent years things weren't as rosy as they were before - toolchain
> > release ownership has changed, there was no clear owner for the recipe to go
> > along, so I had to step up my game [5], although I raised the question few
> > times whether I should just take over and take the recipe back...
> >ipe
> > Also, 2 major downsides surfaced with meta-linaro process itself - lack of
> > testing of external-toolchain use in OE (besides basics)
> 
> I would like to understand what exactly was missing from the testing
> perspective regarding supported features?

Well, supported basic features were fine with gcc9 upgrade, it was much worse 
with gcc8 upgrade, for example:
https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=a8ce3dc47f3be9f98abc6ac98a849f918386cf9f


> If you are talking about bits [1] that you added to support native and
> SDK compilation in your downstream project then I think they were
> essentially broken/partial features from standalone external-toolchain
> perspective which can't be tested until one uses your downstream
> project.
> 
> [1] https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
> 
> > and no public review
> > of Linaro-originated changes by using internal gerrit instead of public
> > mailing list. The last one I didn't realize until later time. Often I would
> > get an unnoticed run-time breakage introduced by some recent change in the
> > recipe that didn't account for all our extensive downstream use cases. As
> > there were no patches on the list, no reviews, no heads-up, I would scramble
> > around in order to fix new breakages and in most cases would try to submit the
> > fix upstream. Only to get them broken later due to the mentioned process
> > downsides. I did mention couple of such instances recently [6][7]...
> 
> I guess it would have been better if you had added a complete feature
> in upstream (say to support SDK or native compilation) instead which
> could be tested standalone using external-toolchain recipe rather than
> fragile dependencies that could only be tested with your downstream
> project.

Well, it's not like I didn't try... :)

Some things were more straightforward and I had those upstreamed for the most 
part. But other things were more controversial, when I was discussing those 
back in the day, like external runtime + internal compiler or OE-built SDK + 
external compiler. From OE perspective external toolchains are evil (or at 
least a very foreign concept), so once you start mixing things, people get 
upset, hence the pushback. That made those features scattered between upstream 
and downstream, unfortunately.

Plus I had some setbacks with aforementioned breakages...

But I still plan to contribute and if we find a consensus, I'd be happy to get 
the rest of the features upstreamed.


> > That "activated" Sumit :) and I understand his position very well and
> > appreciate his energy! He's been given a problem and is trying to solve it,
> > but he's changing some fundamentals as he's not bound by many use cases.
> > Changing those fundamentals actually breaks bunch of my use cases that I'm
> > bound to by our product. So, on one hand he's changing things upstream and
> > I'm downstream and am supposed to adapt. But on the other hand, I've been
> > maintaining and supporting this for 11-12 years and I have tons of baggage in
> > form of existing products and multiple use cases he is not considering.
> 
> For sure we wouldn't like to break downstream use-cases but I would
> like to understand the fundamentals you are referring too and
> use-cases which are affected by mine changes.
> 
> Patch #1, after discussions from v1, it seems to be already part of
> downstream which we can always get rid-off once we have proper glibc
> locale packaging support. Is there anything else I missed?
> Patch #2, I think it just corrects packaging of libraries and headers
> in intended packages rather than in external-arm-toolchain-dev
> package.
> Patch #3, new patch in v2, is it the contentious one? Is your
> downstream project expecting libraries/headers packaged corresponding
> to EAT_TARGET_SYS? If yes then I think in order to make it a
> compatible change we could try to package corresponding to both
> EAT_TARGET_SYS and TARGET_SYS?
> Patch #4 and #5, I think they shouldn't be affecting any of your
> use-cases, correct?

Yeah, #3 will be the most problematic - I did provide more details to the 
patch itself.


> > Plus,
> > it was never clear if there are any other users or consumers of
> > external-toolchain, especially to the extent we use it in the Arago Project as
> > part of TI SDK products, which means changing things in incompatible way
> > breaks the only major consumer of this feature. I fear if we cannot find a
> > reasonable technical and architectural consensus for these changes,
> 
> I am very much in favour of making compatible and gradual changes. So
> I think we should atleast try to reach a consensus prior to predicting
> outcomes.

Sorry, didn't mean to be so dramatic. The main goal of my post was to add 
perspective and highlight my use cases. I was worried my review comments and 
any negative feedback could have been considered baseless. Hopefully this now 
clarifies few things and provides previously missing reasoning and context. 
And I'd be happy to answer any remaining questions.

-- 
Denys
