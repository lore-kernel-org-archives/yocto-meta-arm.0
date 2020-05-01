Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.128.1588355228600708182
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 10:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A66840B6D;
	Fri,  1 May 2020 17:47:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3HVAj48Iixq; Fri,  1 May 2020 17:47:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D05CF409E7;
	Fri,  1 May 2020 17:47:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9358B172D11; Fri,  1 May 2020 13:47:05 -0400 (EDT)
Date: Fri, 1 May 2020 13:47:05 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jdmason@kudzu.us>
Subject: Re: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary CPPFLAGS and LDFLAGS adjustments
Message-ID: <20200501174705.GY11927@denix.org>
References: <1588219828-34791-1-git-send-email-denis@denix.org>
 <AM0PR08MB398746628A1C3F2836A3FAEF92AB0@AM0PR08MB3987.eurprd08.prod.outlook.com>
 <20200501140314.GC13726@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200501140314.GC13726@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2020 at 10:03:15AM -0400, Jon Mason wrote:
> On Fri, May 01, 2020 at 06:46:08AM +0000, Diego Sueiro wrote:
> > > -----Original Message-----
> > > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > > Sent: 30 April 2020 05:10
> > > To: meta-arm@lists.yoctoproject.org
> > > Cc: Denys Dmytriyenko <denys@ti.com>
> > > Subject: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary
> > > CPPFLAGS and LDFLAGS adjustments
> > > 
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > These were there from the very beginning and they were used as crutches to
> > > prop up the build by pointing directly to the external toolchain location, in
> > > case early versions of external-arm-toolchain missed staging/packaging
> > > something from there.
> > > 
> > > First of all, it is unnecessary to adjust CPPFLAGS and LDFLAGS in this way, as
> > > external-arm-toolchain is supposed to stage everything needed from the
> > > toolchain in internal sysroot.
> > > 
> > > And second, these settings can be harmful and conflict with component's
> > > own CPPFLAGS/LDFLAGS. For example, OpenCV 4.1 fails to link internal
> > > libraries because of incorrect -Wl,-rpath-link passed down the build.
> > > 
> > > After dropping these, I was able to verify that everything still builds, including
> > > BSP, Wayland/Weston, Qt5, gstreamer, OpenCV, etc for Aarch64 and Armv7a
> > > platforms.
> > > 
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Series (except the patch you said to ignore) pulled into the master branch.

Thanks, Jon!

I don't see them in master, though:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/

Denys


> > > ---
> > >  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > > b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > > index 8ddaf53..9171380 100644
> > > --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > > +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > > @@ -44,8 +44,6 @@ PREFERRED_PROVIDER_glibc-thread-db = "external-
> > > arm-toolchain"
> > >  PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
> > >  PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
> > >  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
> > > -TARGET_CPPFLAGS_prepend = " -
> > > isystem${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include "
> > > -TARGET_LDFLAGS_prepend = " -
> > > L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib -Wl,-rpath-
> > > link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
> > > 
> > >  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
> > > 
> > > --
> > > 2.7.4
> > 
> 
> > 
> 

> 

