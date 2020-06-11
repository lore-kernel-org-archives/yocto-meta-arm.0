Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.8057.1591884203306786626
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 07:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mLJw/KZE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id cv17so2641946qvb.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hAbg4Zp7j+lDCdzJil74Pg4/JZR3JwGVG1MAUY4lXeg=;
        b=mLJw/KZEezx5RsQaPyjH57F0F/75l/UTUmeatYll/QgGFbUnWHKckODotTZ/0c0A9P
         5+CcMGnqfZL0zRMqYJ5RKIJque95omtzzvQeR/Z/dqPC0VLvTJZQKjqmbRhU+AvQ3cYv
         idMvbEgwnw3GLNVyCBJJpZXollv62wz6Yw2jJkq20K8ZsK7STZl5qv73Vrv1sTsaq6Vy
         nHWrLA5oo4PP2ldRm7wqRrl78dGFBK0zeEEQHdEnaN3pRNDLnpRUsg1jTQx2bdNJqDBu
         1OhUD/So1Bg/6JNQJUrZcquaktqTJ3Dge2M3DOuN+KDnDmQM5tH29qxaRKNc+wW38oEO
         3PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hAbg4Zp7j+lDCdzJil74Pg4/JZR3JwGVG1MAUY4lXeg=;
        b=PT8AoDHaOF+aW6JQo/9B7LNW3sKIp0QQNMT4D5r1Q+TaQXw3UyPkTXpRLiomBGfdAh
         H+lXc4FIXMXlN9TlH7TSmt5upwvbHQBy5woVr/tdehwpdDriowjX1PEvI7FmO+V82a+2
         XjY5Ju+7gvTwucOE8jZJu8YCKGznai56kAcOMQHI5Y9RBAPkvVYWAndYo06P5VFsN7Er
         8rWNtWxFZgZMC2dXXBVZPI9Ks6WoTPoLa43o7IgACHHlJ4QUjqsU6fyuN3Ws/uxcOHd5
         eVtlogx2/NaQxyaftNO/3dR8cdHURxDSbbTm+qK95Xu+Xa759QwHsvgPrLKEv45uKM18
         7fNQ==
X-Gm-Message-State: AOAM531qs8VvsJga45Xr7cF3cz47smfrWdLHniJg6tWmNoYa5Bq5v42G
	+u1Of6lED2BSifo6W1XxZTF4xvX+/tc=
X-Google-Smtp-Source: ABdhPJw+ToEQu6RsHJrYzfjQJOzY6J5kPhWt1PJ+Nuasc/sy4lfgN1f32Ky2Fp27RPQ4d9zDzvfnIg==
X-Received: by 2002:a0c:f84c:: with SMTP id g12mr7914538qvo.31.1591884201484;
        Thu, 11 Jun 2020 07:03:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e01b:52c7:6d78:8385])
        by smtp.gmail.com with ESMTPSA id 195sm2238466qkg.74.2020.06.11.07.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:03:21 -0700 (PDT)
Date: Thu, 11 Jun 2020 10:03:19 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp: Build UEFI EDK2 firmware for N1SDP
Message-ID: <20200611140319.GC17598@kudzu.us>
References: <20200610160841.9949-1-khasim.mohammed@arm.com>
 <3097.1591878072867663797@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <3097.1591878072867663797@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 05:21:12AM -0700, Diego Sueiro wrote:
> On Wed, Jun 10, 2020 at 05:09 PM, Khasim Mohammed wrote:
> 
> >
> > - Add bbappend recipe to configure N1SDP specifics
> > - Enable UEFI EDK2 firmware build for N1SDP.
> > - Update machine conf to add dependency
> >   for EDK2 firmware components
> > 
> > Change-Id: I89d41c176f31bce6f1df7f3b3a7cd624b46c05e1
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to the master branch.

Thanks,
Jon

> 
> > ---
> >  meta-arm-bsp/conf/machine/n1sdp.conf          |  3 +++
> >  .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  | 19 +++++++++++++++++++
> >  .../uefi/edk2-firmware_git.bbappend           |  7 +++++++
> >  3 files changed, 29 insertions(+)
> >  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> >  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> > 
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf
> > b/meta-arm-bsp/conf/machine/n1sdp.conf
> > index 133fb89..20eaf27 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -27,3 +27,6 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=
> > "trusted-firmware-a"
> >  PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
> >
> >  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
> > +
> > +#UEFI EDK2 firmware
> > +EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
> > diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > new file mode 100644
> > index 0000000..c8fc70a
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > @@ -0,0 +1,19 @@
> > +SRC_URI = "\
> > +   
> > git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1
> > \
> > +   
> > git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1
> > \
> > +"
> > +
> > +# TAGS and commit ID as per N1SDP-2020.03.26 release
> > +SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
> > +SRCREV_edk2-platforms = "b6bfc4417ff13168d69c4cbf2338f62c89c82dfd"
> > +
> > +# N1SDP specific EDK2 configurations
> > +EDK2_BUILD_RELEASE = "0"
> > +EDK2_PLATFORM      = "n1sdp"
> > +EDK2_PLATFORM_DSC  = "N1SdpPkg/N1SdpPlatform.dsc"
> > +EDK2_BIN_NAME      = "BL33_AP_UEFI.fd"
> > +EDK2_ARCH          = "AARCH64"
> > +
> > +COMPATIBLE_MACHINE = "n1sdp"
> > +
> > +PV ?= "201908+git${SRCPV}"
> > diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> > b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> > new file mode 100644
> > index 0000000..dfebd87
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> > @@ -0,0 +1,7 @@
> > +# Include machine specific configurations for UEFI EDK2
> > +
> > +MACHINE_EDK2_REQUIRE ?= ""
> > +
> > +MACHINE_EDK2_REQUIRE_n1sdp = "edk2-firmware-n1sdp.inc"
> > +
> > +require ${MACHINE_EDK2_REQUIRE}
> > -- 
> > 2.17.1
> > 
> >

> 

