Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.425.1589835455746041310
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 13:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CDD0940AF3;
	Mon, 18 May 2020 20:57:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcd5rHllMHiN; Mon, 18 May 2020 20:57:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A0AB140A9E;
	Mon, 18 May 2020 20:57:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 68C6A17316D; Mon, 18 May 2020 16:57:32 -0400 (EDT)
Date: Mon, 18 May 2020 16:57:32 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Diego Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Message-ID: <20200518205732.GN11927@denix.org>
References: <1589506580-40706-1-git-send-email-denis@denix.org>
 <23216.1589528602075061452@lists.yoctoproject.org>
 <160FD0B211B491C0.9570@lists.yoctoproject.org>
 <DB8PR08MB496999D8C3226CA0370A8124FABB0@DB8PR08MB4969.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB8PR08MB496999D8C3226CA0370A8124FABB0@DB8PR08MB4969.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Khasim,

I don't think you are using it correctly, see below.

On Sun, May 17, 2020 at 02:43:44PM +0000, Khasim Mohammed wrote:
> > From: Jon Mason <jdmason@kudzu.us>
> >
> > Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> > and Cortex-M processors from ARM. This toolchain is required to build
> > Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> > some firmware for the M0 coprocessor.
> >
> > This was originally taken from meta-rockchip, but has been modified from
> > mailing list feedback.
> 
> > I observe one issue when building for n1sdp,
> > gcc-arm-none-eabi PROVIDES virtual/arm-none-eabi-gcc but was skipped: incompatible with host aarch64-poky-linux (not in COMPATIBLE_HOST)
> 
> Actually I found two issue
> 1) gcc-arm-none-eabi PROVIDES virtual/arm-none-eabi-gcc but was skipped: incompatible with host aarch64-poky-linux (not in COMPATIBLE_HOST)
> > +COMPATIBLE_HOST = "x86_64.*-linux"
> 
> changed to : "x86_64.*|aarch64.*" to build.

Are you trying to use it on aarch64 host?
Or are you trying to build ot for the target?

This is a prebuilt binary that only runs on x86_64.
And, obviously, it is not meant for the target - the error is correct, 
arm-none-eabi != aarch64-poky-linux


> 2) ERROR: gcc-arm-none-eabi-9-2019-q4-major-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> added below line to fix :
> 
> inherit native

If you check the list of v3 changes below, you'll see that inherit native was 
removed. It is not needed, due to BBCLASSEXTEND = "native nativesdk"
So, basically, this is not a proper cross toolchain recipe - it is a very 
simplistic native and nativesdk one. You shouldn't use it for any Linux 
builds, it's meant just for very limited bare-metal builds...


> > v3 changes:
> > * rename recipe to not contain -native in the name
> > * fix typo in "subsidiaries" word
> > * use SUMMARY instead of DESCRIPTION
> > * remove inherit native
> > * add FILES_${PN} for nativesdk package
> > * add extra INSANE_SKIP_${PN} due to prebuilt binary package

In other words, this is correct:
$ bitbake gcc-arm-none-eabi-native
$ bitbake nativesdk-gcc-arm-none-eabi

This is incorrect, and is blocked on purpose:
$ bitbake gcc-arm-none-eabi


> > +COMPATIBLE_HOST = "x86_64.*-linux"
> Can this be changed to : "x86_64.*|aarch64.*"

No, it should not - that would be incorrect!

-- 
Denys
