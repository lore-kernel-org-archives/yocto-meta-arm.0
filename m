Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.18270.1590689599776330955
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 May 2020 11:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B3D040A93;
	Thu, 28 May 2020 18:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWgBnVns3toQ; Thu, 28 May 2020 18:13:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1867E409E7;
	Thu, 28 May 2020 18:13:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 00400173205; Thu, 28 May 2020 14:13:11 -0400 (EDT)
Date: Thu, 28 May 2020 14:13:11 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-aarch64-none-elf: Add recipe
Message-ID: <20200528181311.GQ17660@denix.org>
References: <1589964438-6924-1-git-send-email-denis@denix.org>
 <22524.1590037979741392604@lists.yoctoproject.org>
 <20200522231747.GD17660@denix.org>
 <20200526134018.GA32704@kudzu.us>
 <20200527025934.GJ17660@denix.org>
 <20200528133559.GA25502@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200528133559.GA25502@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 09:36:00AM -0400, Jon Mason wrote:
> On Tue, May 26, 2020 at 10:59:34PM -0400, Denys Dmytriyenko wrote:
> > On Tue, May 26, 2020 at 09:40:18AM -0400, Jon Mason wrote:
> > > On Fri, May 22, 2020 at 07:17:47PM -0400, Denys Dmytriyenko wrote:
> > > > On Wed, May 20, 2020 at 10:12:59PM -0700, Diego Sueiro wrote:
> > > > > On Wed, May 20, 2020 at 09:47 AM, Denys Dmytriyenko wrote:
> > > > > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > > > > > @@ -0,0 +1,38 @@
> > > > > > +# Copyright (C) 2020 Texas Instruments Inc.
> > > > > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > > > > +
> > > > > > +SUMMARY = "Baremetal GCC for Aarch64 processors"
> > > > > > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > > 
> > > > <snip>
> > > > 
> > > > > I see lots of commonalities (code duplication) with the 
> > > > > gcc-arm-none-eabi_9-2019-q4-major.bb recipe. Isn't now a good opportunity to 
> > > > > have a `.inc` to avoid this?
> > > > 
> > > > Yes, there's lots of duplication in those 2 recipes. Unfortunately, there's 
> > > > copyright in the original one and I cannot touch it w/o a lawyer. That's why 
> > > > I don't like copyrights in recipes (nothing much to copyright there anyway)
> > > 
> > > I'm confused.  You mean the MIT license in
> > > gcc-arm-none-eabi_9-2019-q4-major.bb?  If so, is it not the same as
> > > the license you reference above in your patch?
> > > 
> > > > > The path inside the do_install can be easily controlled by a variable set 
> > > > > from the recipes that are including it.
> > > > 
> > > > Well, those are technical details I can handle quite easily - I've been doing 
> > > > OE for 13+ years. But it is legal issues where I draw the line...
> > > 
> > > Assuming it's the MIT license, and you are unwilling to do it, I can
> > > pull it in and make the common inc file.
> > 
> > I've been discussing this with Joshua offline lately - give me a bit more time 
> > to sort it out, hopefully I can come up with a solution. If not, I'll let you 
> > know. Thanks.
> > 
> > -- 
> > Denys
> 
> 100% untested, but I think the following might work

Thanks, Jon. This is a step in the right direction, but I see you define NAME 
variable and a common do_install that uses it, but you didn't remove specific 
do_install versions from the corresponding recipes...
Also, for this commit you'd have to accept my original patch submission to add 
aarch64 version. Or do you plan to squash them?

Denys

> commit aa673cf5cb64ddb7d91a6281556e9d02daa78546
> Author: Jon Mason <jdmason@kudzu.us>
> Date:   Thu May 28 09:33:17 2020 -0400
> 
>     Unification of recipes
>     
>     Signed-off-by: Jon Mason <jdmason@kudzu.us>
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> index 2ec0f9c..dfb6180 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> @@ -14,7 +14,6 @@ SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de3
>  
>  S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
>  
> -COMPATIBLE_HOST = "x86_64.*-linux"
>  
>  do_install() {
>      install -d ${D}${datadir}/aarch64-none-elf/
> @@ -27,12 +26,3 @@ do_install() {
>      done
>  }
>  
> -FILES_${PN} = "${datadir} ${bindir}"
> -
> -INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> -
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> index 84f6dba..4368e85 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> @@ -13,10 +13,6 @@ SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${B
>  SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
>  SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
>  
> -S = "${WORKDIR}/${BPN}-${PV}"
> -
> -COMPATIBLE_HOST = "x86_64.*-linux"
> -
>  do_install() {
>      install -d ${D}${datadir}/arm-none-eabi/
>      cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> @@ -27,13 +23,3 @@ do_install() {
>          lnr $f ${D}${bindir}/$(basename $f)
>      done
>  }
> -
> -FILES_${PN} = "${datadir} ${bindir}"
> -
> -INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> -
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> new file mode 100644
> index 0000000..67dbd19
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> @@ -0,0 +1,27 @@
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +COMPATIBLE_HOST = "x86_64.*-linux"
> +
> +FILES_${PN} = "${datadir} ${bindir}"
> +
> +NAME = "${BPN}".strip("gcc-")
> +
> +do_install() {
> +    install -d ${D}${datadir}/${NAME}/
> +    cp -r ${S}/. ${D}${datadir}/${NAME}/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/${NAME}/bin/${NAME}-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
