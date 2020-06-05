Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.10813.1591363771162576323
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 06:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jSw8Gx7E;
 spf=pass (domain: linaro.org, ip: 209.85.208.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f195.google.com with SMTP id z9so11706558ljh.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jun 2020 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8lUQkFb1PeIWHbatqZ+YdacH/zHDD9RbEc4zJWI3Jr8=;
        b=jSw8Gx7EPoEBhvqKh07m9I6URmsG2DxFUa8Uy8bB9PnHL08/SuF8O39a7g30+Df4sX
         Skv48i+YJbLie9KmUl/uQz3e+frJ6KWIrzIj4GLGzXE7YyirwEw5JicDQ1tKBMtK2jCU
         J8TSqeMbl8068x9JR4C+gDKelD8B/OQI2jHHPQ2aBvl0PGTNaM7Ig253fM/4N1oKyy+U
         iYH4DvDqK7zBagLroIhoQhuqAY9eR2ert6HHyaYsy/V3faQ76XwwVcLfDhYqirkNf1wu
         h/y+Fc19u2PatoP+GmGhVYGohfm2Gxh52zpCMA+KRE6LMQaLnI1UEiTCXlN+3OOMwY/3
         YUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8lUQkFb1PeIWHbatqZ+YdacH/zHDD9RbEc4zJWI3Jr8=;
        b=cBvrGXe9mw4kVFZYOYsf2mzaoVW6Kq1hFSEPauNlg/UN2MEaSOBSArolpJ1BcoM8ui
         1UVywFIFXV+fpJVAJBtIVV8XJjdvuHIFvBBZ17a0m7Fv/NcqmRR5vCam76Lh7T4AUoPw
         07lcv2ImelZzdBdFJCmFvrkdfwUfN/1Ids+iH82fcC3n3ZqCIZH+oyHETQqRJUQ8qTVH
         OSf+ZVuHb7UWIjxXzzQwu8Ekzcrxkz6EKgXmvc2mEY5z12jKeorj426b1T2jlzGNNW/Z
         m/TFZpOSPNGVZS6ku2Lb/8ipEM6ZicgXSE2QryqyJhhs1U/bDYZQv6fVilLwknspKwBT
         fYMQ==
X-Gm-Message-State: AOAM532WyqpJ1eNh+hOL+gvZQqvjt4Ngcsuux32MOyt0XCTa9oEef7No
	28XkhrUXzt7AHGXRhUh7PZxagksAYCkmpQ8hjAzCew==
X-Google-Smtp-Source: ABdhPJx+iPGAgxnLy6IcbDKsLxVwyHcC8x0wJn9xHP1Fdq3dCleRAsdS76M167LjUPdb18kDFhl9VtbiUiPVvSVTsOA=
X-Received: by 2002:a2e:9e19:: with SMTP id e25mr5130960ljk.30.1591363769242;
 Fri, 05 Jun 2020 06:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1615797D4B360D3B.26163@lists.yoctoproject.org> <20200604231042.GI17660@denix.org>
 <a29c212701e775eba31176cba697fdb30ba0c96a.camel@linuxfoundation.org>
In-Reply-To: <a29c212701e775eba31176cba697fdb30ba0c96a.camel@linuxfoundation.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 5 Jun 2020 18:59:17 +0530
Message-ID: <CAFA6WYMTt_CGSUrXaTm=eJ5OYv_fH_QPngDKt=Bw5byXZkLmPw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
To: Denys Dmytriyenko <denis@denix.org>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2020 at 11:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-06-04 at 19:10 -0400, Denys Dmytriyenko wrote:
> > On Thu, Jun 04, 2020 at 07:00:14PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, Jun 02, 2020 at 04:34:50PM +0530, Sumit Garg wrote:
> > > > Patch #1 and #2 adds impprovements in external-arm-toolchain
> > > > recipe in order to
> > > > support SDK generation. SDK generation has been tested using:
> > > >
> > > > $ bitbake core-image-base -c populate_sdk
> > >
> > > This just ensures that external-arm-toolchain doesn't get in the
> > > way of SDK
> > > generation by avoiding any conflicts. The only re-use here is
> > > glibc. The rest
> > > of pre-built Arm toolchain gets thrown out and rebuilt from sources
> > > - gcc,
> > > binutils, gdb/gdbserver are all built from sources as TCMODE was
> > > not set and
> > > falls back to "default". Sure, pre-built Arm toolchain doesn't
> > > provide all
> > > possible SDKMACHINE binaries, but for 90% cases of x86_64, there's
> > > very little
> > > re-use...
> >
> > And I wonder is the resulting SDK was even tested:
> >
> > $ . environment-setup-armv7at2hf-neon-oe-linux-gnueabi
> >
> > $ arm-none-linux-gnueabihf-gcc -o hello hello.c
> > hello.c:1:10: fatal error: stdio.h: No such file or directory
> >     1 | #include <stdio.h>
> >       |          ^~~~~~~~~
> > compilation terminated.
> >
> > $ arm-none-linux-gnueabihf-g++ -o hello++ hello.cpp
> > hello.cpp:1:10: fatal error: iostream: No such file or directory
> >     1 | #include <iostream>
> >       |          ^~~~~~~~~~
> > compilation terminated.

I guess you missed the basics to use the installed SDK as you haven't
provided a proper sysroot path. See expansion of "$CC" below:

$ . environment-setup-aarch64-poky-linux
$ echo $CC
aarch64-none-linux-gnu-gcc -march=armv8-a+crc
--sysroot=/home/sumit.garg/temp/oe_sdk/sysroots/aarch64-poky-linux

>
> If you've done "bitbake core-image-base -c populate_sdk" to build it,
> you can do "bitbake core-image-base -c testsdk" to test it as we have
> basic automated QA tests for that.

Thanks for this pointer. There are test cases which are failing, will fix them.

-Sumit

>
> Cheers,
>
> Richard
>
>
>
>
>
>
