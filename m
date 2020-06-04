Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.289.1591312248158270115
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 16:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D9A440C2E;
	Thu,  4 Jun 2020 23:10:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09cdbSNq0NAb; Thu,  4 Jun 2020 23:10:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0E96840B89;
	Thu,  4 Jun 2020 23:10:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7666817320C; Thu,  4 Jun 2020 19:10:42 -0400 (EDT)
Date: Thu, 4 Jun 2020 19:10:42 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	daniel.thompson@linaro.org
Subject: Re: [meta-arm] [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
Message-ID: <20200604231042.GI17660@denix.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1615797D4B360D3B.26163@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1615797D4B360D3B.26163@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2020 at 07:00:14PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jun 02, 2020 at 04:34:50PM +0530, Sumit Garg wrote:
> > Patch #1 and #2 adds impprovements in external-arm-toolchain recipe in order to
> > support SDK generation. SDK generation has been tested using:
> > 
> > $ bitbake core-image-base -c populate_sdk
> 
> This just ensures that external-arm-toolchain doesn't get in the way of SDK 
> generation by avoiding any conflicts. The only re-use here is glibc. The rest 
> of pre-built Arm toolchain gets thrown out and rebuilt from sources - gcc, 
> binutils, gdb/gdbserver are all built from sources as TCMODE was not set and 
> falls back to "default". Sure, pre-built Arm toolchain doesn't provide all 
> possible SDKMACHINE binaries, but for 90% cases of x86_64, there's very little 
> re-use...

And I wonder is the resulting SDK was even tested:

$ . environment-setup-armv7at2hf-neon-oe-linux-gnueabi

$ arm-none-linux-gnueabihf-gcc -o hello hello.c 
hello.c:1:10: fatal error: stdio.h: No such file or directory
    1 | #include <stdio.h>
      |          ^~~~~~~~~
compilation terminated.

$ arm-none-linux-gnueabihf-g++ -o hello++ hello.cpp 
hello.cpp:1:10: fatal error: iostream: No such file or directory
    1 | #include <iostream>
      |          ^~~~~~~~~~
compilation terminated.


> > Patch #3 adds a README to describe usage details of pre-built Arm tool-set.
> > 
> > Patch #4 adds package specific licences for external-arm-toolchain recipe.
> > 
> > Sumit Garg (4):
> >   external-arm-toolchain: Remove glibc locale dependency
> >   external-arm-toolchain: Refine dev libraies packaging
> >   external-arm-toolchain: Add README
> >   external-arm-toolchain: Add package specific licenses
> > 
> >  .../conf/distro/include/tcmode-external-arm.inc    |  1 +
> >  .../external-arm-toolchain/README.md               | 50 ++++++++++++++
> >  .../external-arm-toolchain.bb                      | 29 ++++++++-
> >  .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
> >  4 files changed, 154 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > 
> > -- 
> > 2.7.4
> > 

> 

