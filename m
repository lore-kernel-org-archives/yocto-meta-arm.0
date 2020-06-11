Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.8308.1591884881228167089
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 07:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LChFdk/v;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id n23so7066777ljh.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVR5Z2CX4QLpytWKjIcVaIPxgM6eGPDPIIktAvFuHu0=;
        b=LChFdk/vB4EDN8eLkuCU0bpXrYlqt8jVacF+pc1X5J6y9zm37W3baYEPUVQ4ZnBGbG
         FSU04wjSHys7ZXFWSfBKkgI/dYpOYwRTwAQ0Hp2YtCV5TN4gUpIrRlXlsPff2+JGURd5
         je/j4DT66uDFgukVcYoJNR6cBP0vU15pW3rfNp0ndvTCvYyir/3K+Z+yHQUTxg2titH+
         +V1KdPGUIMYWtEZwGtEWGO/7qmHYuxeFog1t5emL1OebMWMpnPcHhi0DHh4vYNqDgf5u
         tNIWQ94229b6LCVDWa8SXTnHL+RDWz6ts4nEWKUadm0fF8qYGbKKLToYv3Iiu8r6VXBR
         YDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVR5Z2CX4QLpytWKjIcVaIPxgM6eGPDPIIktAvFuHu0=;
        b=lcDH+0lcrh741ajiHDAPOc6HjE+GXBgWoNaMwPNa2ie6Nk1n09qf2t8IFrVz9gE6Eb
         5RDyWBe2Sij8GCWk/OBWq3xATBZBXr76UoiWTjhOXnYpnJYPEPi7iIcqICUgQDnwdoR8
         hibTwvsBdlc6AhOw9qONDbhCR/Q4XjoXt+fX0c9Ajn1a6Wm5TAvU1hjqZMVGCebUV/I0
         BPeUJT2/MMxhddT7s6UiBiGnnLry7s37jo5jsBrbGyo08B6YVsbaz5CXR8RhpDCm/6FY
         0pIkotdgMaiIbooWcdyPdtIBFwAgFalfkI05dQifDg+g96qR+OIzwEtF7QB5kgUPEde1
         LcJw==
X-Gm-Message-State: AOAM530duo45dUVNGVVbveu47zsUxEZu3dNH26Elq1ynRb9Z0yFoWYih
	Kdn/eG5fW7MELpEWSSixAzYk4X/BcMtcoJUSLfikxw==
X-Google-Smtp-Source: ABdhPJyTvf2RdTsZ1vgY1zImWebdtYKIeFHD+uDyj66p+oL2wRlPKjB6EXw4mAcQJE5tuE1bw+nj+xCDPwx/I/M8jSI=
X-Received: by 2002:a05:651c:1103:: with SMTP id d3mr4770784ljo.110.1591884879159;
 Thu, 11 Jun 2020 07:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <20200611020138.GZ17660@denix.org>
In-Reply-To: <20200611020138.GZ17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 11 Jun 2020 19:44:26 +0530
Message-ID: <CAFA6WYMSM490DfAmv+tJG=Y2kp9uxL=kW=Mx-Sx3+Ssz+AWeHQ@mail.gmail.com>
Subject: Re: [meta-arm] External toolchain support
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2020 at 07:31, Denys Dmytriyenko <denis@denix.org> wrote:
>
> All,
>
> I know I said I wasn't going to participate in this discussion, but seeing
> where things are heading, I wanted to set some records straight... A brief
> history, that should explain few things the way they are now and I'll try to
> be brief and humble :) Also, I mean no disrespect or offense to anybody and am
> trying to be as polite and diplomatic as possible!
>
> Around 2007-2008 we migrated our Linux product to OpenEmbedded (Classic at the
> time) and we called it the Arago Project - one of the original requirements
> was the use of a prebuilt cross-compile toolchain. Back then CodeSourcery Lite
> was the most popular and free ARM cross-compile toolchain. So I had to add
> support for it to OpenEmbedded and maintain it for few years since 2009 [1].
> I used a basic stub from Poky as a starting point, but most of it was my own,
> like a single recipe supporting different toolchain versions, etc. I also had
> recipes for different OE-based Distro toolchains, like Angstrom...
>
> Late 2010, early 2011 saw 2 relevant major events happening - CodeSourcery was
> acquired by Mentor and eventually discontinued the free Lite tier; and the
> announcement of the Yocto Project and reaching agreement with OpenEmbedded
> (yeah, I was there :) While everyone started creating their own meta layers
> (meta-ti for our BSP and a pair of meta-arago for Apps and Distro), there was
> a void for a free prebuilt ARM cross-compile toolchain. That resulted in a
> public Arago toolchain release [2] that I built and maintained for few years
> (and the corresponding recipe). BTW, back then I had the correct per-component
> Licenses set based on the version [3].

Thanks for sharing this development history.

>
> We had additional requirements for our products to support on-target native
> compilation (external runtime + internal compiler), as well as SDK
> cross-compiling while re-using the same external toolchain (with the option of
> getting standalone toolchain separately from SDK). A lot of extras has been
> added on top of the initial external-toolchain recipe. Most of that was inside
> the Arago Project code base, as that's where it originated. And I have given
> several presentations around that time and following years at conferences on
> the use of external toolchains in OpenEmbedded, using same external toolchains
> in SDKs, dealing with relocation issues, etc. [4] Those weren't very popular
> topics among OE/Yocto crowd, as that camp prefers building toolchains from
> sources :) But our non-OE developers and users demanded prebuilt toolchains
> and maximum re-use of corresponding components, while being flexible shipping
> OE SDK w/o the toolchain pre-integrated due to license restrictions...
>

Okay, I see the reasoning behind toolchain being distributed separately.

> And while Linaro already had their gcc team working on ARM enhancements, they
> didn't have any releases for few years. Thanks to Bill and others, by 2013
> that got corrected and OE recipes based on existing old work were added to
> support the new Linaro toolchain releases. But it only addressed the basic
> cross-compiling of target binaries - no SDK support, no native on-target
> compilation, no extras.

Yes, external-{linaro/arm}-toolchain only provided cross-compilation
of target binaries and corresponding run-time environment as a
replacement of OE toolchain built from source until now when I started
looking at SDK support.

Although, I agree that your downstream project had the complete
feature-set that only re-uses external-{linaro/arm}-toolchain recipe.

> Still, it was time to switch to the new Linaro
> toolchain releases. And meta-linaro was quite open and receptive to patches
> from outside, so I started submitting fixes and enhancements I had accumulated
> in meta-arago over the years. I also had an open communication channel with
> Koen, so that was also helpful to push changes in.

Thanks for all your contributions.

>
> But in recent years things weren't as rosy as they were before - toolchain
> release ownership has changed, there was no clear owner for the recipe to go
> along, so I had to step up my game [5], although I raised the question few
> times whether I should just take over and take the recipe back...
>ipe
> Also, 2 major downsides surfaced with meta-linaro process itself - lack of
> testing of external-toolchain use in OE (besides basics)

I would like to understand what exactly was missing from the testing
perspective regarding supported features?

If you are talking about bits [1] that you added to support native and
SDK compilation in your downstream project then I think they were
essentially broken/partial features from standalone external-toolchain
perspective which can't be tested until one uses your downstream
project.

[1] https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce

> and no public review
> of Linaro-originated changes by using internal gerrit instead of public
> mailing list. The last one I didn't realize until later time. Often I would
> get an unnoticed run-time breakage introduced by some recent change in the
> recipe that didn't account for all our extensive downstream use cases. As
> there were no patches on the list, no reviews, no heads-up, I would scramble
> around in order to fix new breakages and in most cases would try to submit the
> fix upstream. Only to get them broken later due to the mentioned process
> downsides. I did mention couple of such instances recently [6][7]...

I guess it would have been better if you had added a complete feature
in upstream (say to support SDK or native compilation) instead which
could be tested standalone using external-toolchain recipe rather than
fragile dependencies that could only be tested with your downstream
project.

>
> So, when earlier this year I started working with meta-arm, I was very pleased
> with the open process, where all internal and external patches go to the list
> for review. And I was happy to see OPTEE and ARM toolchain recipes migrating
> there as well [8], so in the past several months I cleaned up and upstreamed
> many hacks and enhancements there from meta-arago [9]. Of course, few were
> still remaining, but the plan was always to get everything upstream.
> Unfortunately, Paul wasn't willing to wait much longer... :)
>
> That "activated" Sumit :) and I understand his position very well and
> appreciate his energy! He's been given a problem and is trying to solve it,
> but he's changing some fundamentals as he's not bound by many use cases.
> Changing those fundamentals actually breaks bunch of my use cases that I'm
> bound to by our product. So, on one hand he's changing things upstream and
> I'm downstream and am supposed to adapt. But on the other hand, I've been
> maintaining and supporting this for 11-12 years and I have tons of baggage in
> form of existing products and multiple use cases he is not considering.

For sure we wouldn't like to break downstream use-cases but I would
like to understand the fundamentals you are referring too and
use-cases which are affected by mine changes.

Patch #1, after discussions from v1, it seems to be already part of
downstream which we can always get rid-off once we have proper glibc
locale packaging support. Is there anything else I missed?
Patch #2, I think it just corrects packaging of libraries and headers
in intended packages rather than in external-arm-toolchain-dev
package.
Patch #3, new patch in v2, is it the contentious one? Is your
downstream project expecting libraries/headers packaged corresponding
to EAT_TARGET_SYS? If yes then I think in order to make it a
compatible change we could try to package corresponding to both
EAT_TARGET_SYS and TARGET_SYS?
Patch #4 and #5, I think they shouldn't be affecting any of your
use-cases, correct?

> Plus,
> it was never clear if there are any other users or consumers of
> external-toolchain, especially to the extent we use it in the Arago Project as
> part of TI SDK products, which means changing things in incompatible way
> breaks the only major consumer of this feature. I fear if we cannot find a
> reasonable technical and architectural consensus for these changes,

I am very much in favour of making compatible and gradual changes. So
I think we should atleast try to reach a consensus prior to predicting
outcomes.

-Sumit

> it may
> result in the opposite outcome from what Paul was seeking - a major fork with
> 2 separate external-toolchain supports. And I'm not trying to make any
> excuses, but the fact that I'm severely burned out right now only exacerbates
> the whole situation, sorry...
>
>
> [1] https://git.openembedded.org/openembedded/log/recipes/meta/external-toolchain-csl.bb
> [2] http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html
> [3] http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-extras/recipes-core/meta/external-arago-toolchain.inc;h=da0d9abd77a17f2334cdea8b5f05ef43a550eaaf;hb=90dc157478439b2facc87a47d8ba8abb596edc6e
> [4] https://elinux.org/images/c/c8/ExternalToolchainsInYocto.pdf
> [5] https://git.linaro.org/openembedded/meta-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> [6] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchain?id=efd07731659f2e8e8970f1a26e8dacfbd19ce832
> [7] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchain?id=7765d89009f9ace12e600d9e6650fa8f019ba034
> [8] https://lists.yoctoproject.org/g/meta-arm/message/13
> [9] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/log/meta-arm-toolchain
>
>
> On Tue, May 19, 2020 at 09:03:53PM +0100, Paul Barker wrote:
> > Hi all,
> >
> > As discussed on the Yocto Project call today it's great to see the ARM
> > toolchain recipes moving forward under the new meta-arm layers. I've
> > had some issues in the past with the external pre-built toolchain
> > which really need fixing to properly integrate this toolchain into
> > projects. I'm raising them here in the hopes that these can now be
> > fixed.
> >
> > 1) Maintaining GPL compliance while using an external toolchain
> >
> > The Yocto Project has an archiver class which can be used to collect
> > the source code of all packages built by bitbake which is a
> > requirement for meeting the terms of the GPL. However for the external
> > toolchain recipes the "source" is the pre-built toolchain archive
> > downloaded from the ARM website. As the pre-built toolchain includes
> > glibc (which is then distributed as part of the images we build) what
> > we need is the actual source code used to build the various toolchain
> > components.
> >
> > The toolchain recipe needs to include some link to the actual upstream
> > sources and the archiver class in oe-core probably needs extending to
> > support this.
> >
> > 2) Building an SDK/ESDK
> >
> > If an SDK is generated for an image built with the pre-built toolchain
> > then there can be some confusion about what exactly should provide the
> > gcc binary and various headers. In the past I've had to hack
> > components out of the SDK after it is built and then tell customers to
> > install the pre-built toolchain alongside the SDK in order to get a
> > working cross-compiler. Ideally everything should actually get
> > packaged into the SDK so that only one download is needed and no
> > hard-coded paths are used.
> >
> > Additionally, running the populate_sdk task often fails due to missing
> > packages (libatomic-dev right now) and it looks like the recipe
> > bitrots fairly quickly after each fix. SDK generation needs to be
> > regularly tested and it needs to be confirmed that these SDKs can
> > actually cross-compile working binaries.
> >
> > 3) Toolchain recipe is effectively split between meta-arm & meta-arago layers
> >
> > The bbappends carried in meta-arago fix items which are missing from
> > the external-arm-toolcahin recipe in meta-arg (e.g. the installation
> > of the ldconfig binary). That effectively splits the recipe over
> > multiple layers as these things are pretty fundamental parts of the
> > external-arm-toolchain recipe. An effort needs to be made to merge all
> > this together and have the base recipe well tested.
> >
> > 4) No example configurations or visible test matrix
> >
> > The meta-arm-toolchain layer lacks a README or other file providing
> > some examples of working build configurations which use the pre-built
> > toolchain. It's unclear which MACHINEs and DISTROs are regularly
> > tested and are well supported. The best way to solve this would be to
> > actually store the test scripts and configurations in this layer and
> > use a publicly visible CI system like Travis, GitLab CI, etc to run
> > the tests. That would increase confidence in the pre-built toolchain
> > and make it clear what is supported and how frequently it's tested.
> >
> > 5) LICENSE is incorrectly stated in the external-arm-toolchain recipe
> >
> > The full license of the toolchain package needs to be specified. Right
> > now all packages are marked as having the MIT license which is
> > obviously not correct for most of them.
> >
> > Apologies for the long rant but I hope this is useful to highlight
> > some of the issues seen when trying to practically use the pre-built
> > ARM toolchain.
> >
> > Thanks,
> >
> > --
> > Paul Barker
> > Konsulko Group
>
> >
>
> 
