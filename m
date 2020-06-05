Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1587.1591382422114052210
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 11:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4882C40C36;
	Fri,  5 Jun 2020 18:40:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkZEQVqmpfi1; Fri,  5 Jun 2020 18:40:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB0D240AD5;
	Fri,  5 Jun 2020 18:40:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 260B3173209; Fri,  5 Jun 2020 14:40:14 -0400 (EDT)
Date: Fri, 5 Jun 2020 14:40:14 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>,
	wmills@ti.com, Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [meta-arm] [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
Message-ID: <20200605184014.GM17660@denix.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1615797D4B360D3B.26163@lists.yoctoproject.org>
 <20200604231042.GI17660@denix.org>
 <a29c212701e775eba31176cba697fdb30ba0c96a.camel@linuxfoundation.org>
 <CAFA6WYMTt_CGSUrXaTm=eJ5OYv_fH_QPngDKt=Bw5byXZkLmPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMTt_CGSUrXaTm=eJ5OYv_fH_QPngDKt=Bw5byXZkLmPw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2020 at 06:59:17PM +0530, Sumit Garg wrote:
> On Fri, 5 Jun 2020 at 11:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2020-06-04 at 19:10 -0400, Denys Dmytriyenko wrote:
> > > On Thu, Jun 04, 2020 at 07:00:14PM -0400, Denys Dmytriyenko wrote:
> > > > On Tue, Jun 02, 2020 at 04:34:50PM +0530, Sumit Garg wrote:
> > > > > Patch #1 and #2 adds impprovements in external-arm-toolchain
> > > > > recipe in order to
> > > > > support SDK generation. SDK generation has been tested using:
> > > > >
> > > > > $ bitbake core-image-base -c populate_sdk
> > > >
> > > > This just ensures that external-arm-toolchain doesn't get in the
> > > > way of SDK
> > > > generation by avoiding any conflicts. The only re-use here is
> > > > glibc. The rest
> > > > of pre-built Arm toolchain gets thrown out and rebuilt from sources
> > > > - gcc,
> > > > binutils, gdb/gdbserver are all built from sources as TCMODE was
> > > > not set and
> > > > falls back to "default". Sure, pre-built Arm toolchain doesn't
> > > > provide all
> > > > possible SDKMACHINE binaries, but for 90% cases of x86_64, there's
> > > > very little
> > > > re-use...
> > >
> > > And I wonder is the resulting SDK was even tested:
> > >
> > > $ . environment-setup-armv7at2hf-neon-oe-linux-gnueabi
> > >
> > > $ arm-none-linux-gnueabihf-gcc -o hello hello.c
> > > hello.c:1:10: fatal error: stdio.h: No such file or directory
> > >     1 | #include <stdio.h>
> > >       |          ^~~~~~~~~
> > > compilation terminated.
> > >
> > > $ arm-none-linux-gnueabihf-g++ -o hello++ hello.cpp
> > > hello.cpp:1:10: fatal error: iostream: No such file or directory
> > >     1 | #include <iostream>
> > >       |          ^~~~~~~~~~
> > > compilation terminated.
> 
> I guess you missed the basics to use the installed SDK as you haven't
> provided a proper sysroot path. See expansion of "$CC" below:
> 
> $ . environment-setup-aarch64-poky-linux
> $ echo $CC
> aarch64-none-linux-gnu-gcc -march=armv8-a+crc
> --sysroot=/home/sumit.garg/temp/oe_sdk/sysroots/aarch64-poky-linux

Sorry, it was too late here and I sent the wrong logs... Yes, I'm aware of 
using $CC and $CXX instead of calling binaries directly.

The correct logs I wanted to send are there:

$ $CC -o hello hello.c
/tmp/armsdk/sysroots/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/9.2.1/real-ld: cannot find crtbegin.o: No such file or directory
/tmp/armsdk/sysroots/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/9.2.1/real-ld: cannot find -lgcc
/tmp/armsdk/sysroots/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/9.2.1/real-ld: cannot find -lgcc
collect2: error: ld returned 1 exit status

$ $CXX -o hello++ hello.cpp 
In file included from hello.cpp:1:
/tmp/armsdk/sysroots/armv7at2hf-neon-oe-linux-gnueabi/usr/include/c++/9.2.1/iostream:38:10: fatal error: bits/c++config.h: No such file or directory
   38 | #include <bits/c++config.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.


The first one you can recognize is due to missing libgcc.a, which should be 
fixed by my patch.

And I know the reason for the second one two - I've been fixing these for 
years. I need to send the fixes...


> > If you've done "bitbake core-image-base -c populate_sdk" to build it,
> > you can do "bitbake core-image-base -c testsdk" to test it as we have
> > basic automated QA tests for that.
> 
> Thanks for this pointer. There are test cases which are failing, will fix them.
> 
> -Sumit
> 
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >
> 
