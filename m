Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.16878.1591956100917431143
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 03:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JIM59ct/;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 82so5167022lfh.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ozJtRZbACkjRyTjYVFnNX4ICT8i0VeoZrDdlkA0IAWU=;
        b=JIM59ct/YyMO8mYCfnNc2CwYvyEaj1WL7gkWk+MB0QHj5IsoWn3Hkkwjus1TpIX4P6
         c9sjIgLH1cS0pRzB07GEyBpdCMD1X5a/gAcS9a7kCpLi6qN2o/XDvcrKM5gg3dca+qlO
         yirTfaQoQbCoI5dez8V94N0/lFmaSHa3z9y9omFOKrA1o2LvFgqnfJHSs5FXGLhXzshY
         ouhN9VfxcdFJGqNxaLsZYo8/QM3TMTUSKkZFUOGzfG+O9BekMzIaqaqROrdKaPyJFDj9
         9IBXzxXp7zlSxMrj8y9sB+5337E4Sk8S763KT8Xar+SuZX+aBsHUkSXcfG4qPxD7+0yn
         Q1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozJtRZbACkjRyTjYVFnNX4ICT8i0VeoZrDdlkA0IAWU=;
        b=Im2+orhU37eNh+AOmeMTeCVXxhDicMu/mup01nT005Iw/tYqzCrAzGWiP00QUjb0Dr
         Ujwg4a5PWk/dzV5YifmMsDsEyicQpmjEy3zIUVhOJ2zsoadiA76KRT0jEcoVhIlT1ArN
         vMJhGBt6hC1Q+n5MHDXlwaO3DZcOpTsTXIAUkG7ZZy6A0SZ/uOu78vFMAJVZv0q78oGN
         42CBppJAnojbnxmmPGUvSfAjyYv3uji8WXBHu+d0nGG7DuAZJbPanJFZQH9gbjmlE4jm
         t2dHvRahUbdmfBxTVPu2k24L/MDnKR3oGQJ7qtOed3UiNluE8nlhwbXqdhWi6c6oIYkn
         QKYA==
X-Gm-Message-State: AOAM533HuH2d9//myi/wCTHYhOk2z9vtoP8/YofQUdw64agroRcGW6eh
	cONon6IirNA7gQ9Jp/WpWIV/KGuBHPx7BDMqvfJj4w==
X-Google-Smtp-Source: ABdhPJzvk2udgCHdPeCQOqbvHnMURoPGVC6rAVf4zcPFx+OjnIEMZCYGYytiL3CzzE08wdMqpTxJ0FnAy5P30TbiG3g=
X-Received: by 2002:ac2:4567:: with SMTP id k7mr6399260lfm.122.1591956098961;
 Fri, 12 Jun 2020 03:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <20200611020138.GZ17660@denix.org> <CAFA6WYMSM490DfAmv+tJG=Y2kp9uxL=kW=Mx-Sx3+Ssz+AWeHQ@mail.gmail.com>
 <1617B50A09B8150A.14082@lists.yoctoproject.org> <20200612070622.GO17660@denix.org>
In-Reply-To: <20200612070622.GO17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 12 Jun 2020 15:31:27 +0530
Message-ID: <CAFA6WYPdxwiH9WiXa+yd5Xy9R8914vLiVD7m0sQiy3Sd+Uvvyw@mail.gmail.com>
Subject: Re: [meta-arm] External toolchain support
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2020 at 12:36, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Jun 12, 2020 at 01:34:02AM -0400, Denys Dmytriyenko wrote:
> > On Thu, Jun 11, 2020 at 07:44:26PM +0530, Sumit Garg wrote:
> > > On Thu, 11 Jun 2020 at 07:31, Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > and no public review
> > > > of Linaro-originated changes by using internal gerrit instead of public
> > > > mailing list. The last one I didn't realize until later time. Often I would
> > > > get an unnoticed run-time breakage introduced by some recent change in the
> > > > recipe that didn't account for all our extensive downstream use cases. As
> > > > there were no patches on the list, no reviews, no heads-up, I would scramble
> > > > around in order to fix new breakages and in most cases would try to submit the
> > > > fix upstream. Only to get them broken later due to the mentioned process
> > > > downsides. I did mention couple of such instances recently [6][7]...
> > >
> > > I guess it would have been better if you had added a complete feature
> > > in upstream (say to support SDK or native compilation) instead which
> > > could be tested standalone using external-toolchain recipe rather than
> > > fragile dependencies that could only be tested with your downstream
> > > project.
> >
> > Well, it's not like I didn't try... :)
> >
> > Some things were more straightforward and I had those upstreamed for the most
> > part. But other things were more controversial, when I was discussing those
> > back in the day, like external runtime + internal compiler or OE-built SDK +
> > external compiler. From OE perspective external toolchains are evil (or at
> > least a very foreign concept), so once you start mixing things, people get
> > upset, hence the pushback. That made those features scattered between upstream
> > and downstream, unfortunately.
>
> Oh, forgot to mention! To support those extra features, changes had to be made
> outside of external-toolchain recipe, which may have contributed to them being
> considered controversial...
>
> For example, external-arm-toolchain recipe only packages runtimes (headers,
> libs, stubs, target binaries), but not the host/cross binaries, as it
> basically extends glibc-package.inc from OE-Core. I have an additional recipe
> called external-arm-sdk-toolchain (not the best name), that packages prebuilt
> gcc, gdb, binutils binaries from EAT into proper *-cross-canadian-$ARCH
> packages, which could then be easily pulled into SDK.
>
> We've been using meta-toolchain way of building SDKs from the early days,
> before "<rootfs> -c populate_sdk" was introduced. Some of the toolchain/SDK
> interaction and processing was added there, like packaging SDK w/o the
> toolchain, or establishing some symlinks between OE compiler and EAT runtime.
> Those don't make sense for the rootfs, hence meta-toolchain based SDK remained
> in use for us. Plus we build multiple rootfs images with different content,
> but a single complete SDK to cover them all, so "<rootfs> -c populate_sdk" to
> match the rootfs didn't make sense for our product...
>
> I don't mean this to block a more appropriate re-implementation upstream, if
> needed, of course. I'm open to collaboration and re-design, but would like
> this to be a two-way road. Thanks.
>

Thanks for the detailed insights on this. Yes I think we should be
able to support both ways of SDK packaging.

-Sumit

>
> > Plus I had some setbacks with aforementioned breakages...
> >
> > But I still plan to contribute and if we find a consensus, I'd be happy to get
> > the rest of the features upstreamed.
>
> --
> Denys
