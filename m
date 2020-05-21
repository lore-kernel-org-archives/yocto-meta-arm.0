Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.6658.1590070388436401415
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 May 2020 07:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=V84y7col;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id l3so3108337qvo.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 May 2020 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Xv+6fLyzyncMCdY6QIlN/fl2cTTc528XDVlkHI2SDA=;
        b=V84y7colr8Vht3Ro6RBc/1x1Xgq/gaw2n2s7e511T2vDCgLWz3oHCboRyk/FFX7OGU
         kMjnJ1g+Mnr7JaIG00PFGGDL7MK4MAoxZfDN8ijiH0DO9c9xHxBI12qJ5l94pf1Lm2W3
         VhaUEKTeYpSjfJ/FdfnPmMLcvpuTAiowTNxTLkuAeva/K1JioYsulUqYEQkdVC8P3uPl
         Du9kK8/a0772huGspe0lmNviBXez4auBVHvGcBbASjrOj277QP4iIM9iJIu/4tOrgnn6
         czT2kzXlRvZ878uTbzzXYq7ljSANyo3BYBFB8BIIl/9+GxaeF+x6ohRHHGgK0gG/VXRE
         UTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Xv+6fLyzyncMCdY6QIlN/fl2cTTc528XDVlkHI2SDA=;
        b=k6Og3E6AZbtTbVtInlh48DuIBFlhjHoWEhPdDTuAyYKwpMRXvWIFTcpzDOdauVRM25
         N4I4fYwMD8/j/KIhrtFHH9ys0uYVxCfhqQmCK4VBg6sTU3DOqo11RkD1rRsJEjMpov36
         lU+AkHVssk3NhnB8Te6171/prxD2PtdF2fBG8/CAj98VKN9CkQKXPBg70J7XRMZ/F3Oz
         bSVNp2s5dvasuud4W6JaXf7Ailf9Zo433FrOPyJgmzUl8Vd7yDeZhcYvmNtzgQajK9Uw
         O/dMI+cg4OnguCs9+VWbW3Hp34f323AFAJz0GXA6Anl6GeCFDxrJI6XKMGE3SmC/2RnS
         rjWg==
X-Gm-Message-State: AOAM530uKp9rdYxX+6joatKs1kLU4OtlnD0CnsKDI9SLJaiaz4WXHmhw
	kWimDjj6H239lGek25O4s9TBiA==
X-Google-Smtp-Source: ABdhPJwv9HbqwxkiNaNGePDcIYPeAMBszULZmTFgXVDZYAVlKF+MO2KsII4/HKW26qzRbKehhL8nIQ==
X-Received: by 2002:ad4:4d44:: with SMTP id m4mr10334741qvm.236.1590070387504;
        Thu, 21 May 2020 07:13:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:3da7:ad88:8f07:8f48])
        by smtp.gmail.com with ESMTPSA id u16sm1333591qkm.107.2020.05.21.07.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 07:13:07 -0700 (PDT)
Date: Thu, 21 May 2020 10:13:05 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Diego Sueiro <diego.sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of packages
Message-ID: <20200521141304.GA25394@kudzu.us>
References: <1589870085-51773-1-git-send-email-denis@denix.org>
 <AM0PR08MB39871EB465BCFEF6BC70B17592B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
 <20200519151754.GA22197@kudzu.us>
 <20200519162653.GR11927@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200519162653.GR11927@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 12:26:53PM -0400, Denys Dmytriyenko wrote:
> On Tue, May 19, 2020 at 11:17:55AM -0400, Jon Mason wrote:
> > On Tue, May 19, 2020 at 09:12:41AM +0000, Diego Sueiro wrote:
> > > > -----Original Message-----
> > > > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > > > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > > > Sent: 19 May 2020 07:35
> > > > To: meta-arm@lists.yoctoproject.org
> > > > Cc: Denys Dmytriyenko <denys@ti.com>
> > > > Subject: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of
> > > > packages
> > > > 
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > 
> > > > There is no need to inherit nopackages. Even when the output binaries are
> > > > being consumed from deploy or sysroot, and the main binary package is not
> > > > meant to be installed in the rootfs, package generation is still useful for SDK
> > > > use cases and as a way to distribute sources (e.g. src.rpm/SRPM) in Distros.
> > > > 
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> > 
> > Pulled into the master branch.
> 
> Can this be backported to dunfell, please?
> Unfortunately, I missed this earlier, but it's required for out whole product, 
> which is beyond just rootfs and there is no easy way to un-inherit nopackages 
> from bbappend... Thanks.

Done.

Thanks,
Jon

> 
> 
> > Thanks,
> > Jon
> > 
> > > 
> > > > ---
> > > >  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > > index c9c5710..fe9a4e0 100644
> > > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > > @@ -5,7 +5,7 @@ PROVIDES = "virtual/trusted-firmware-a"
> > > > 
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > 
> > > > -inherit deploy nopackages
> > > > +inherit deploy
> > > > 
> > > >  COMPATIBLE_MACHINE ?= "invalid"
> > > > 
> > > > @@ -158,7 +158,10 @@ do_install() {
> > > >      done
> > > >  }
> > > > 
> > > > +FILES_${PN} = "/firmware"
> > > >  SYSROOT_DIRS += "/firmware"
> > > > +# Skip QA check for relocations in .text of elf binaries
> > > > +INSANE_SKIP_${PN} = "textrel"
> > > > 
> > > >  do_deploy() {
> > > >      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > > > --
> > > > 2.7.4
> > > 
> > 
> > > 
> > 
> 
> > 
> 
