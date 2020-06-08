Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.27917.1591615990342819743
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 04:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DlFy493J;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id e125so9991561lfd.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qLjWxzt6kESY3zdSF4LKoQnt5CNxUmFqOtOp8UjMyNU=;
        b=DlFy493J8RUffMtEHDLastbAZcxQ6tElkSvoM4QQHjzXQY3vm7NtmPWnxfZG4ES7db
         mORXjDueUZ4aowSGSkD15Dv2ztv8UlM6mAYeKPju1MAc0tC+zKLcsHhcJnVcY2l1HMA2
         NpmHaT8XDhlNJngsDnUrU/r1A2cmsedw+TVgyg6YNM+WGUVoMcQ0ROrMFmZOR/RqAo0B
         tOO9x64IIn6vrLQ0t+ZeHiicro0vryHIYWMWtLs7twPNPP4N+dESF1G3gdCbqOBdmb51
         Lj0jvYI6U+prqVH+ZvFUNx0RHmZIO6nRIZ2QANhiH5HQm+5Sv0uGQdzP+hueQbAof1wD
         OoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLjWxzt6kESY3zdSF4LKoQnt5CNxUmFqOtOp8UjMyNU=;
        b=ZsiszxIwhY7fCZ6wlM2OY/NxkJOmEiVM5uFe0N4k3W5SyaD6d/kG0aCKODmVpFOQg6
         flKs9O8manAFkVwfJbVnNf3256SKyl6ZmvlfPE4XjPc3ifJzrvmhZwg5ia4145rnL2f5
         pxsjbKBSEipaBIcvvakmZ0YuY+CM6SvO6uQg4bv/cQDjnJnFHlnHYIZq9h+2RV2EW6og
         VFPqaLXXMr3fBYS82EyznWO3GB11UNVvoH61U/U1d2eMI388xalow+XI1u5ZRVpo2WC4
         XfuXsI8RONxzJzYaMdNSgBmomSXDfJTPI5qt6GkyD2NDapIJyAmXMADmgcXlqTn9vBz2
         R3AA==
X-Gm-Message-State: AOAM531WmifXHUN4gQB2g32x6FxBqTUnPRU4G+bfsnU1p5PfycsIpGZm
	7eX+RNmybuCONV4Lb7A/2V/Sp/KdLQDq/c7kiomXMQ==
X-Google-Smtp-Source: ABdhPJyxLqAWbTBlg9A6A1HLC4uzELopHHjgYj/7aVwncM1UlP3rtS4iuvQw51ixi8Drvkd/7F7YkZFOLntR/fmRvls=
X-Received: by 2002:ac2:4567:: with SMTP id k7mr12354178lfm.122.1591615988396;
 Mon, 08 Jun 2020 04:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1615797D4B360D3B.26163@lists.yoctoproject.org> <20200604231042.GI17660@denix.org>
 <a29c212701e775eba31176cba697fdb30ba0c96a.camel@linuxfoundation.org>
 <CAFA6WYMTt_CGSUrXaTm=eJ5OYv_fH_QPngDKt=Bw5byXZkLmPw@mail.gmail.com> <20200605184014.GM17660@denix.org>
In-Reply-To: <20200605184014.GM17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 8 Jun 2020 17:02:56 +0530
Message-ID: <CAFA6WYP25kFOwMG-dJ5YMQt-x-+QzVmMhOf6UZG3CVZsRy1LCg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
To: Denys Dmytriyenko <denis@denix.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, meta-arm@lists.yoctoproject.org, 
	Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Jun 2020 at 00:10, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Jun 05, 2020 at 06:59:17PM +0530, Sumit Garg wrote:
> > On Fri, 5 Jun 2020 at 11:54, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2020-06-04 at 19:10 -0400, Denys Dmytriyenko wrote:
> > > > On Thu, Jun 04, 2020 at 07:00:14PM -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, Jun 02, 2020 at 04:34:50PM +0530, Sumit Garg wrote:
> > > > > > Patch #1 and #2 adds impprovements in external-arm-toolchain
> > > > > > recipe in order to
> > > > > > support SDK generation. SDK generation has been tested using:
> > > > > >
> > > > > > $ bitbake core-image-base -c populate_sdk
> > > > >
> > > > > This just ensures that external-arm-toolchain doesn't get in the
> > > > > way of SDK
> > > > > generation by avoiding any conflicts. The only re-use here is
> > > > > glibc. The rest
> > > > > of pre-built Arm toolchain gets thrown out and rebuilt from sources
> > > > > - gcc,
> > > > > binutils, gdb/gdbserver are all built from sources as TCMODE was
> > > > > not set and
> > > > > falls back to "default". Sure, pre-built Arm toolchain doesn't
> > > > > provide all
> > > > > possible SDKMACHINE binaries, but for 90% cases of x86_64, there's
> > > > > very little
> > > > > re-use...
> > > >
> > > > And I wonder is the resulting SDK was even tested:
> > > >
> > > > $ . environment-setup-armv7at2hf-neon-oe-linux-gnueabi
> > > >
> > > > $ arm-none-linux-gnueabihf-gcc -o hello hello.c
> > > > hello.c:1:10: fatal error: stdio.h: No such file or directory
> > > >     1 | #include <stdio.h>
> > > >       |          ^~~~~~~~~
> > > > compilation terminated.
> > > >
> > > > $ arm-none-linux-gnueabihf-g++ -o hello++ hello.cpp
> > > > hello.cpp:1:10: fatal error: iostream: No such file or directory
> > > >     1 | #include <iostream>
> > > >       |          ^~~~~~~~~~
> > > > compilation terminated.
> >
> > I guess you missed the basics to use the installed SDK as you haven't
> > provided a proper sysroot path. See expansion of "$CC" below:
> >
> > $ . environment-setup-aarch64-poky-linux
> > $ echo $CC
> > aarch64-none-linux-gnu-gcc -march=armv8-a+crc
> > --sysroot=/home/sumit.garg/temp/oe_sdk/sysroots/aarch64-poky-linux
>
> Sorry, it was too late here and I sent the wrong logs...

No worries.

> Yes, I'm aware of
> using $CC and $CXX instead of calling binaries directly.
>
> The correct logs I wanted to send are there:
>
> $ $CC -o hello hello.c
> /tmp/armsdk/sysroots/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/9.2.1/real-ld: cannot find crtbegin.o: No such file or directory
> /tmp/armsdk/sysroots/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/9.2.1/real-ld: cannot find -lgcc
> /tmp/armsdk/sysroots/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/9.2.1/real-ld: cannot find -lgcc
> collect2: error: ld returned 1 exit status
>
> $ $CXX -o hello++ hello.cpp
> In file included from hello.cpp:1:
> /tmp/armsdk/sysroots/armv7at2hf-neon-oe-linux-gnueabi/usr/include/c++/9.2.1/iostream:38:10: fatal error: bits/c++config.h: No such file or directory
>    38 | #include <bits/c++config.h>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
>

These are the same errors that I noticed with testsdk as well. So I
think testsdk should be a good enough sanity testing tool to say SDK
is generated properly.

>
> The first one you can recognize is due to missing libgcc.a, which should be
> fixed by my patch.

Yeah.

>
> And I know the reason for the second one two - I've been fixing these for
> years. I need to send the fixes...
>

Okay, let me wait for your fixes in order to avoid duplicate work. In
the meantime, will explore pre-built tools packaging from external
toolchain.

-Sumit

>
> > > If you've done "bitbake core-image-base -c populate_sdk" to build it,
> > > you can do "bitbake core-image-base -c testsdk" to test it as we have
> > > basic automated QA tests for that.
> >
> > Thanks for this pointer. There are test cases which are failing, will fix them.
> >
> > -Sumit
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
> > >
> > >
> >
