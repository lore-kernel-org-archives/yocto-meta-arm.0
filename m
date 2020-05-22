Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.12278.1590152398433378526
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 May 2020 05:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dc6wDW32;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id b6so12537481ljj.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 May 2020 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nx99mpG2N94Lbe7HOzE+JfC1EVLgWAIJId17t1wrEhE=;
        b=dc6wDW32M2xS+S/n79n/nK2q3WuTTmL+lRkr7eBVKrBTX8AWlTuJN7Z6PVT9vUECC1
         n/VLd40VonhksJJK8j64NExhywJpqZSLwyzbKEVnNQH5detG+HA92fmDVhifOvO4MnTE
         uwb4LBp81bE88QYCFHqW1JEXHzaDiHLv93K447XFd6mA0+gz7Yd3y8lzv3YmShzQYaMc
         H4acIV7qV3uU+THbhNMWtNR0Bh7eMZPnXV9rvBiQM2KgCQmtugPJ4a3L/2u5R2AzMv+7
         jaGjLrAWDWethjSB2yd0IsASuqbu2cJkbweDCdvyaHdOj/Oa9K+EUhCzc3TiPOfvXw3A
         NMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nx99mpG2N94Lbe7HOzE+JfC1EVLgWAIJId17t1wrEhE=;
        b=L0VV2cfaCvuG2dDfpt4V+hAoZVyR3H/TwWEHmiX86QxXDg6gkbNhJ2ebiFEIqj84LG
         E3aX0h8HJxVrqGKLgYHyp8tHOFihkp9oXTqAAjJ7BBm0DDIm6zl144kivHa42Fc7xQCc
         cfWarCS2480L94jspkaA1uBqrOTHMhgBu7uk/GJw1MMAsVENOIfWy6M0w1O8dYrb65GV
         bgUL3vlO9OQexPHak0KLT4grtY5nOtprgEkSChD7BTlR1U6x6fQPpWFVcHW+reM9CrO6
         lkeYPO36IY/gNCJQ0E8p4W5LeHwk5irplHPSn29Fu0L/2l128vGwlWALBRSGy4774TpK
         AXsQ==
X-Gm-Message-State: AOAM532TLn9Wx5/40xAzMRVwx2eS4Bi6eiB2Dvx8SAKnnuMkdGIU1iK2
	6yANzaLxCv0CtaFLxOPcyCyEgzLp5akWKjrnB3BcMQ==
X-Google-Smtp-Source: ABdhPJzL1xpWjSfgGsPL0whP/UWx92utMET2CkvXOkV8mT4idk5YE9OMSF6wBLfRU0FxCsQFF8FrjzyIyVdneJy8EC4=
X-Received: by 2002:a2e:2e16:: with SMTP id u22mr1221712lju.4.1590152396305;
 Fri, 22 May 2020 05:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <CAFA6WYPcauZLJwH0vojE2e0oSzq1bgdOnqKxhVV1MKemSv96DQ@mail.gmail.com> <CAM9ZRVtwS9w4-nAYMxLCyu8BmJzf79gCwe6G4rSHj41HZyDJsg@mail.gmail.com>
In-Reply-To: <CAM9ZRVtwS9w4-nAYMxLCyu8BmJzf79gCwe6G4rSHj41HZyDJsg@mail.gmail.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 22 May 2020 18:29:44 +0530
Message-ID: <CAFA6WYNer30t=LMmoYOw8rqYYJ-mFRj+tqY1Z4nJ2OfxJJ-UKQ@mail.gmail.com>
Subject: Re: [meta-arm] External toolchain support
To: Paul Barker <pbarker@konsulko.com>
Cc: meta-arm@lists.yoctoproject.org, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2020 at 21:32, Paul Barker <pbarker@konsulko.com> wrote:
>
> (Re-sending to the list as I got "500 Internal error" from groups.io
> on the first attempt)
>
> On Wed, 20 May 2020 at 16:33, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Hi Paul,
> >
> > I think first we need to understand the implementation of this recipe.
> > The recipe itself does *not* fetch the pre-built toolchain by itself
> > but it is rather dependent on the user to download and install
> > toolchain on the host machine and thereby provide toolchain install
> > path via variable "EXTERNAL_TOOLCHAIN".
> >
> > In order to use any of pre-built Arm toolchain versions (8.2, 8.3 and
> > 9.2), a user just needs to specify following in conf/local.conf:
> >
> > TCMODE = "external-arm"
> > EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> >
> > - Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> > EXTERNAL_TOOLCHAIN =
> > "<installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu"
> >
> > - Eg. for AArch32 (eg. qemuarm machine in poky distro)
> > EXTERNAL_TOOLCHAIN =
> > "<installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf"
> >
> > So with the above framework, the toolchain recipe isn't tied to a
> > single version of pre-built toolchain (or single source for which
> > toolchain is built) but rather is flexible to support various
> > pre-built toolchains which can differ in following aspects:
> > - Host machine.
> > - Arm 32bit or 64bit toolchain.
> > - Multiple toolchain versions.
>
> This is fine, but the recipe still needs to allow common Yocto Project
> tasks to work such as using the archiver, keeping track of the
> licenses of the software that goes into an image, generating an SDK,
> etc.
>

See my response below.

> >
> > On Wed, 20 May 2020 at 01:34, Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > Hi all,
> > >
> > > As discussed on the Yocto Project call today it's great to see the ARM
> > > toolchain recipes moving forward under the new meta-arm layers. I've
> > > had some issues in the past with the external pre-built toolchain
> > > which really need fixing to properly integrate this toolchain into
> > > projects. I'm raising them here in the hopes that these can now be
> > > fixed.
> > >
> > > 1) Maintaining GPL compliance while using an external toolchain
> > >
> > > The Yocto Project has an archiver class which can be used to collect
> > > the source code of all packages built by bitbake which is a
> > > requirement for meeting the terms of the GPL. However for the external
> > > toolchain recipes the "source" is the pre-built toolchain archive
> > > downloaded from the ARM website. As the pre-built toolchain includes
> > > glibc (which is then distributed as part of the images we build) what
> > > we need is the actual source code used to build the various toolchain
> > > components.
> > >
> > > The toolchain recipe needs to include some link to the actual upstream
> > > sources and the archiver class in oe-core probably needs extending to
> > > support this.
> >
> > As I mentioned above, it's not the recipe which fetches the pre-built
> > toolchain but the user provides a path to the pre-installed toolchain.
> > And the user can easily navigate through the sources from where the
> > toolchain is built on the download page (see section "Sources" here
> > [1]) itself.
> >
> > [1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
>
> This needs to be supported by the recipe though - even if the source
> location is given as a path and the developer is responsible for
> downloading the toolchain source before running bitbake.
>
> The recipe does place GPL licensed components into an image so it
> really needs to work with the archiver to allow users to achieve GPL
> compliance.
>

See my response below.

> >
> > >
> > > 2) Building an SDK/ESDK
> > >
> > > If an SDK is generated for an image built with the pre-built toolchain
> > > then there can be some confusion about what exactly should provide the
> > > gcc binary and various headers. In the past I've had to hack
> > > components out of the SDK after it is built and then tell customers to
> > > install the pre-built toolchain alongside the SDK in order to get a
> > > working cross-compiler. Ideally everything should actually get
> > > packaged into the SDK so that only one download is needed and no
> > > hard-coded paths are used.
> >
> > As I mentioned above a hardcoded path is needed to provide flexibility
> > and to avoid having duplicate recipes for every pre-built toolchain
> > variant.
> >
> > AFAIK, with SDK all the headers and libraries should be pre-installed.
> > It's only the cross-compiler path which is derived from
> > EXTERNAL_TOOLCHAIN that needs to be specified in conf/local.conf.
> >
> > >
> > > Additionally, running the populate_sdk task often fails due to missing
> > > packages (libatomic-dev right now) and it looks like the recipe
> > > bitrots fairly quickly after each fix. SDK generation needs to be
> > > regularly tested and it needs to be confirmed that these SDKs can
> > > actually cross-compile working binaries.
> >
> > Did you give external-arm-toolchain a try? Simply do "bitbake
> > external-arm-toolchain" and you could see libatomic-dev package:
> >
> > tmp/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/pkgdata/runtime/libatomic-dev
> >
>
> I'm interested in building a real image (say core-image-base)

This is well tested and supported using external-arm-toolchain.

> then
> building an SDK (bitbake core-image-base -c populate_sdk) and then
> confirming that the SDK can be installed on a new host machine and
> used to cross-compile working binaries for the target.

Building an SDK isn't supported and tested as of now. So I gave it a
try and it seems to be minor dependency issues which we should be able
to fix. I will try to find some time next week in order to fix those
but in case you already have corresponding fixes then I would be happy
to review them too.

> Is that
> supported and regularly tested for the pre-built toolchain?
>
> > >
> > > 3) Toolchain recipe is effectively split between meta-arm & meta-arago layers
> > >
> > > The bbappends carried in meta-arago fix items which are missing from
> > > the external-arm-toolcahin recipe in meta-arg (e.g. the installation
> > > of the ldconfig binary). That effectively splits the recipe over
> > > multiple layers as these things are pretty fundamental parts of the
> > > external-arm-toolchain recipe. An effort needs to be made to merge alls
> > > this together and have the base recipe well tested.
> > >
> >
> > I am not sure from where you got the reference that meta-arago is
> > needed to build external-arm-toolchain. external-arm-toolchain is an
> > independent recipe and any fixes should be pushed to meta-arm only.
> >
> > Regarding ldconfig, did you give external-arm-toolchain a try? I could
> > see it being packaged here:
> >
> > tmp/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/pkgdata/runtime/ldconfig
>
> As there's no README file or anything else to suggest how to use the
> pre-built toolchain, I have only tested the toolchain in the Arago
> distro where the toolchain is enabled by default. If some
> documentation is added which lists machines, distros and images that
> are supported then I'd be willing to try a build and report back on
> what I find.
>

external-arm-toolchain is meant to be distro and machine agnostic as
long as you are cross-compiling for arm/arm64 architectures. It is
just a replacement of the OE toolchain built from source with a
pre-built toolchain.

But yes I agree with you that we need a README for
external-arm-toolchain to list its usage and supported features. Will
add it.

> >
> > > 4) No example configurations or visible test matrix
> > >
> > > The meta-arm-toolchain layer lacks a README or other file providing
> > > some examples of working build configurations which use the pre-built
> > > toolchain. It's unclear which MACHINEs and DISTROs are regularly
> > > tested and are well supported. The best way to solve this would be to
> > > actually store the test scripts and configurations in this layer and
> > > use a publicly visible CI system like Travis, GitLab CI, etc to run
> > > the tests. That would increase confidence in the pre-built toolchain
> > > and make it clear what is supported and how frequently it's tested.
> >
> > I agree with you here that we atleast need a CI system to test every
> > fix that goes in external-arm-toolchain in order to maintain quality.
> >
> > It's only two variables "TCMODE" and "EXTERNAL_TOOLCHAIN" for a
> > particular build to use a pre-built toolchain. We can have a README to
> > describe their purpose as well.
> >
> > Regarding MACHINEs and DISTROs testing, I would like to point to ARM
> > GCC 9.2 integration release announcement [1] where you could find the
> > test status just prior to when we made this recipe import from
> > meta-linaro to meta-arm.
> >
> > [1] https://lists.yoctoproject.org/g/yocto/message/48094
>
> This information belongs in the repository in a readme file not just
> in an old email.
>
> >
> > >
> > > 5) LICENSE is incorrectly stated in the external-arm-toolchain recipe
> > >
> > > The full license of the toolchain package needs to be specified. Right
> > > now all packages are marked as having the MIT license which is
> > > obviously not correct for most of them.
> >
> > I guess you missed below comment:
> >
> > # License applies to this recipe code, not the toolchain itself.
> >
> > How do you envision to have a separate license file for every package
> > provided by a single recipe "external-arm-toolchain.bb"? Also, given
> > there is single "EULA" file available from the downloads page [1].
> >
> > [1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
>
> The LICENSE field is explicitly there to record the license of the
> packages generated from the recipe, not of the recipe code itself.
> There are many examples in openembedded-core and other layers of using
> LICENSE_subpackage to set the license of "subpackage" within the
> recipe. See https://www.yoctoproject.org/docs/3.1/mega-manual/mega-manual.html#var-LICENSE
> for more info.
>

I think your above and this concern should be addressed with a
license.inc file listing licenses for all sub-packages. If yes, then I
will post a patch for the same.

-Sumit

> Regards,
>
> --
> Paul Barker
> Konsulko Group
> 
