Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.3694.1591867682076390259
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 02:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GaI47d+I;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id c194so4831749oig.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2csgRKnR1ohr9RldbG5uPunwjWFRo3dfEz4Y4C3s00=;
        b=GaI47d+IYbvH6dvMcbDhPg8971rZTLW2W+uvcupOkYDXC7ZO9fk685Mze8MqMI/wKi
         MlxjWK+tSPPAKQeLvDzazUY9l2FSYbBM7NCCjvpoSOqx5RLOxZYLQARawk+C0JxOgPWC
         F6mCzfgNYzjGMLkIGke+5PkIGz+hdMLUlRAX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2csgRKnR1ohr9RldbG5uPunwjWFRo3dfEz4Y4C3s00=;
        b=k6Uht7HBiKwQEz6bLz8KH3gchBdsb1UiodEE92dmlfyXKEDytiCU72sbe2fZX5+wIp
         lq4rkIuUPOsEBVlFDkYBo8jKqz0URikJFh8pxhRZd2c/5kHz92NGvDYQy6dyTG6TB+J8
         NqrXvf6XzW2IphhpMOvSEOtrq00b/sQ3wbVmhXGs6pRV4HjwuT4xLf/b8Vfut/Cix6DS
         fpzE15m0uG7V4Z+nLObDnWrdHq+jZO8ITzqwBw+x86fqC6qnhUSDON9NtI2VBgyRs5AK
         gv8a09Rr+lvrIesak1ei16SPAknbK3+Vt9VXbBsbu1wrz86yN9obs6EQy39GDHERHkFR
         RvAQ==
X-Gm-Message-State: AOAM530xXk17oajPVw6z9szOWdZ6OZIpzrQkacYMwTWUXpgHIcedbovK
	Zv2O+YGJWLjvBbp8CtpLrC/l1Hu2l1jB7PpWI3k2DvMHF5E=
X-Google-Smtp-Source: ABdhPJxXJv12ywQe1FrkC5xgJntP9lBM5TrlzRPqepk4KTkjGIMp1+awsRO6qx39dDQpTd88ELrE4jZ2g+ZM0RznYPI=
X-Received: by 2002:aca:df04:: with SMTP id w4mr5480272oig.27.1591867681198;
 Thu, 11 Jun 2020 02:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <20200611020138.GZ17660@denix.org>
In-Reply-To: <20200611020138.GZ17660@denix.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 11 Jun 2020 10:27:50 +0100
Message-ID: <CAM9ZRVsT0nuMen2zC_L=+nadg5w0=xj2m8Tp7GR1xL-txzhbjQ@mail.gmail.com>
Subject: Re: [meta-arm] External toolchain support
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2020 at 03:01, Denys Dmytriyenko <denis@denix.org> wrote:
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
> And while Linaro already had their gcc team working on ARM enhancements, they
> didn't have any releases for few years. Thanks to Bill and others, by 2013
> that got corrected and OE recipes based on existing old work were added to
> support the new Linaro toolchain releases. But it only addressed the basic
> cross-compiling of target binaries - no SDK support, no native on-target
> compilation, no extras. Still, it was time to switch to the new Linaro
> toolchain releases. And meta-linaro was quite open and receptive to patches
> from outside, so I started submitting fixes and enhancements I had accumulated
> in meta-arago over the years. I also had an open communication channel with
> Koen, so that was also helpful to push changes in.
>
> But in recent years things weren't as rosy as they were before - toolchain
> release ownership has changed, there was no clear owner for the recipe to go
> along, so I had to step up my game [5], although I raised the question few
> times whether I should just take over and take the recipe back...
>
> Also, 2 major downsides surfaced with meta-linaro process itself - lack of
> testing of external-toolchain use in OE (besides basics) and no public review
> of Linaro-originated changes by using internal gerrit instead of public
> mailing list. The last one I didn't realize until later time. Often I would
> get an unnoticed run-time breakage introduced by some recent change in the
> recipe that didn't account for all our extensive downstream use cases. As
> there were no patches on the list, no reviews, no heads-up, I would scramble
> around in order to fix new breakages and in most cases would try to submit the
> fix upstream. Only to get them broken later due to the mentioned process
> downsides. I did mention couple of such instances recently [6][7]...
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
> form of existing products and multiple use cases he is not considering. Plus,
> it was never clear if there are any other users or consumers of
> external-toolchain, especially to the extent we use it in the Arago Project as
> part of TI SDK products, which means changing things in incompatible way
> breaks the only major consumer of this feature. I fear if we cannot find a
> reasonable technical and architectural consensus for these changes, it may
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

Denys,

Thanks for the context here, it's really valuable to understand how
things have developed. I'd prefer that things improve slowly than that
we have a breaking fork.

Can we identify which of the proposed changes can be made with low
risk? I think fixing the readme and licensing at least should be
straightforward.

I'll look at the archiver support myself and see if I can find a
solution for that.

Thanks,

-- 
Paul Barker
Konsulko Group
