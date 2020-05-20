Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.15187.1589988796380766848
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 May 2020 08:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zk2jugvI;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id b6so4292629ljj.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 20 May 2020 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lob0zudjJZt+ZQ3kYaRL8/Ldj+qQ/y14yEdMrFguxng=;
        b=zk2jugvI6hnYRpGu0KXf9PQFnUQyfFQLj1rEQXTAy5DpLTNJkFbhEI6Wf1gvdP6UGy
         pzi7K/QOYvxwpHv36i9hySglaUS+i8Q0EBwvC0lmkuTScX3Xet9DaHI6A7ibFEW6LGID
         DQdAJAjgQ3Z3b7+ii6RtD2M/VSeCoWusCd1wcuZuBz1Gku9U2sngHF+KrsJGIcbG/JQM
         c7TZ1bbIubEbOH0eIMrlhi2RuFv5KTk9n6BnXIrkjYJN53WG6NZKw44axo19++V3mxEd
         0shmUUqELB5PhN5lbMJ9dYOZ+6sK4xL/B1BgCGbBijTlTO+qLIt8U//IWC50bYj05qJt
         GC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lob0zudjJZt+ZQ3kYaRL8/Ldj+qQ/y14yEdMrFguxng=;
        b=GSbCuRAV5YIuyu8f2hyDLMXAvzVNMLaeJ/PP0F9448dvsVpRWLnLfxXOE5+taWSGPj
         UHunhtS49Q5wn/cnNXXkr91SYXG0utIYm4eFBUR4ZwlaueSh8rk+wtQ2JB5468f6ck07
         tw3zxUJzJZy7QtvfClFKIt4m23TmVvGkVjP9CBFTGtfRELoM71oHYhvwc675TFXfLiJv
         +IVawRmy39FuBYHb429Gy732B6dNjQMrfjCanLso7CHEfnC3HttY2KQr2HOYHh3mpqnN
         inlTgwmuox+Gt5Ma5rAVvIDpW2NYToztWVmO+czuxIj3s/WRvpgRRjTUx1wVe4xFVuoH
         ALnA==
X-Gm-Message-State: AOAM532K+6xsqVG0lZFeN3PyFw+05YU3m5eFlYCvpca6/Uel8Gz1oXJs
	cytT2odH5etronFYJoSabpHmaeVXls0kdb4YU0tcUQ==
X-Google-Smtp-Source: ABdhPJwRv6OCMWd1mSs0PTbbMVkC26AGnnXsH/SRk+RNOB4X3s4/5IyPH/LcFRMWwdI+tWqfdU3lbxXhycxL+CNiBlo=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr3006103ljk.4.1589988794204;
 Wed, 20 May 2020 08:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
In-Reply-To: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Wed, 20 May 2020 21:03:02 +0530
Message-ID: <CAFA6WYPcauZLJwH0vojE2e0oSzq1bgdOnqKxhVV1MKemSv96DQ@mail.gmail.com>
Subject: Re: [meta-arm] External toolchain support
To: Paul Barker <pbarker@konsulko.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

I think first we need to understand the implementation of this recipe.
The recipe itself does *not* fetch the pre-built toolchain by itself
but it is rather dependent on the user to download and install
toolchain on the host machine and thereby provide toolchain install
path via variable "EXTERNAL_TOOLCHAIN".

In order to use any of pre-built Arm toolchain versions (8.2, 8.3 and
9.2), a user just needs to specify following in conf/local.conf:

TCMODE = "external-arm"
EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"

- Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
EXTERNAL_TOOLCHAIN =
"<installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu"

- Eg. for AArch32 (eg. qemuarm machine in poky distro)
EXTERNAL_TOOLCHAIN =
"<installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf"

So with the above framework, the toolchain recipe isn't tied to a
single version of pre-built toolchain (or single source for which
toolchain is built) but rather is flexible to support various
pre-built toolchains which can differ in following aspects:
- Host machine.
- Arm 32bit or 64bit toolchain.
- Multiple toolchain versions.

On Wed, 20 May 2020 at 01:34, Paul Barker <pbarker@konsulko.com> wrote:
>
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

As I mentioned above, it's not the recipe which fetches the pre-built
toolchain but the user provides a path to the pre-installed toolchain.
And the user can easily navigate through the sources from where the
toolchain is built on the download page (see section "Sources" here
[1]) itself.

[1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads

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

As I mentioned above a hardcoded path is needed to provide flexibility
and to avoid having duplicate recipes for every pre-built toolchain
variant.

AFAIK, with SDK all the headers and libraries should be pre-installed.
It's only the cross-compiler path which is derived from
EXTERNAL_TOOLCHAIN that needs to be specified in conf/local.conf.

>
> Additionally, running the populate_sdk task often fails due to missing
> packages (libatomic-dev right now) and it looks like the recipe
> bitrots fairly quickly after each fix. SDK generation needs to be
> regularly tested and it needs to be confirmed that these SDKs can
> actually cross-compile working binaries.

Did you give external-arm-toolchain a try? Simply do "bitbake
external-arm-toolchain" and you could see libatomic-dev package:

tmp/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/pkgdata/runtime/libatomic-dev

>
> 3) Toolchain recipe is effectively split between meta-arm & meta-arago layers
>
> The bbappends carried in meta-arago fix items which are missing from
> the external-arm-toolcahin recipe in meta-arg (e.g. the installation
> of the ldconfig binary). That effectively splits the recipe over
> multiple layers as these things are pretty fundamental parts of the
> external-arm-toolchain recipe. An effort needs to be made to merge alls
> this together and have the base recipe well tested.
>

I am not sure from where you got the reference that meta-arago is
needed to build external-arm-toolchain. external-arm-toolchain is an
independent recipe and any fixes should be pushed to meta-arm only.

Regarding ldconfig, did you give external-arm-toolchain a try? I could
see it being packaged here:

tmp/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/pkgdata/runtime/ldconfig

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

I agree with you here that we atleast need a CI system to test every
fix that goes in external-arm-toolchain in order to maintain quality.

It's only two variables "TCMODE" and "EXTERNAL_TOOLCHAIN" for a
particular build to use a pre-built toolchain. We can have a README to
describe their purpose as well.

Regarding MACHINEs and DISTROs testing, I would like to point to ARM
GCC 9.2 integration release announcement [1] where you could find the
test status just prior to when we made this recipe import from
meta-linaro to meta-arm.

[1] https://lists.yoctoproject.org/g/yocto/message/48094

>
> 5) LICENSE is incorrectly stated in the external-arm-toolchain recipe
>
> The full license of the toolchain package needs to be specified. Right
> now all packages are marked as having the MIT license which is
> obviously not correct for most of them.

I guess you missed below comment:

# License applies to this recipe code, not the toolchain itself.

How do you envision to have a separate license file for every package
provided by a single recipe "external-arm-toolchain.bb"? Also, given
there is single "EULA" file available from the downloads page [1].

[1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads

-Sumit

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
