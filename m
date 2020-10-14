Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.9354.1602672881181285025
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 03:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=lcsnP3LU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id a23so2270200qkg.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LtcylR2Z8sxggtZoFV5zjQzfLQC3uwuNIlYnay+jg1A=;
        b=lcsnP3LUKjhlB1tmEpQFWk0GKBFXSgG8JpguzdR14ngqLXBFiP1Cek6ykJkzPAl4Xb
         qp96CtL5HCNy1tNy7nXcfx2tCKQSIgU4dFwCMYtnWjcv6N2Zol8XSXIb3IVUXx3IbMEi
         tMoX5GM3raYguiUsv2dOrQC7F5925JqD9WAtqnfIUPynCOlbe2pQzhh7PO1aAGkQUqPh
         H7N80m7jjZAZT1B4plGPdXoRNE1uEPNX1aBi5JyyETfrNfvrge0mUPMR0D2lijlMhAad
         N8IbZ8oZzqE9t2pphOJIhFzdVZgVug/R3AvdMZGAwp9VHKvEgnV+4THMhTVeMB0UmD0G
         u7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LtcylR2Z8sxggtZoFV5zjQzfLQC3uwuNIlYnay+jg1A=;
        b=oPoktHjVXIxaasjP7HhvmSLmyqKp5Kfe0GZY+zNH/P5sUl2XSwJjIGcJxWwqHHRrFS
         3E6nsJAg5AimrabBAXF5cgICKb+Unbf3KBrtwq/YZ1hdZLZcn1a69oPyl6AF0sGaTuY1
         Sq4us397Rnw5mbPoU4Phxp5z25j5EegBmPDrJNF+btCQfVEXG3+d2ONXhH9UDpBljiSM
         8kcnbI19XP5PbVaSid5ou9Cuo5WFRcg/z8oQDI9T/zhHDo6nVLql3BieSXUDCXpZxDDt
         wpnkkZxytNKmcedSTJcaQckXtIAjsm/2xnjFOwAxWT9vxG0pKb4W5KIntzFjP9Z5EB0G
         dw/g==
X-Gm-Message-State: AOAM533rc0xCv+T8BHZsq95OgnKUVURHaeq+J69W4hsscJKfjybA45tM
	xBi3rOYwhHYxcPFEOsBdI1C+KA==
X-Google-Smtp-Source: ABdhPJyZJFCXjZERneMmzyyYVZYkXU+FS8YRrZ9MeRMWhgUtJBXjkxWELJ78iCP+Q3Ay/EgjCVtfpA==
X-Received: by 2002:a37:79c6:: with SMTP id u189mr4395478qkc.74.1602672880246;
        Wed, 14 Oct 2020 03:54:40 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d10sm1050269qkl.73.2020.10.14.03.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 03:54:39 -0700 (PDT)
Date: Wed, 14 Oct 2020 06:54:35 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy: Drop foundation-armv8 support
Message-ID: <20201014105434.GB5538@kudzu.us>
References: <20201013094546.11726-1-Nathan.Dunne@arm.com>
 <25751.1602582506599242033@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <25751.1602582506599242033@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2020 at 02:48:26AM -0700, Diego Sueiro wrote:
> On Tue, Oct 13, 2020 at 10:46 AM, Nathan Dunne wrote:
> 
> >
> > Remove foundation-armv8 overrides from arm-autonomy recipes.
> > 
> > Change-Id: I7913ccdb3383bdf40b608fc852428716e1538318
> > Issue-Id: SCM-1525
> > Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> > ---
> >  .../xen-devicetree/xen-devicetree.bbappend                 | 4 ----
> >  .../xen/files/{fvp => fvp-base}/early-printk.cfg           | 0
> >  .../meta-arm-bsp/recipes-extended/xen/xen_%.bbappend       | 7 +------
> >  .../recipes-extended/xenguest/xenguest-manager.bbappend    | 3 +--
> >  .../recipes-extended/xenguest/xenguest-network.bbappend    | 2 --
> >  .../meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend     | 1 -
> >  6 files changed, 2 insertions(+), 15 deletions(-)
> >  rename
> > meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/{fvp
> > => fvp-base}/early-printk.cfg (100%)
> > 
> > diff --git
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> > index 8284c63..2c875a9 100644
> > ---
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Both patches pulled into master.

Thanks,
Jon
 
> > a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> > +++
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> > @@ -21,7 +21,3 @@ XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart
> > dtuart=serial0 boots
> >
> >  XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda2"
> >  XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart dtuart=serial0
> > bootscrub=0"
> > -
> > -XEN_DEVICETREE_DOM0_BOOTARGS_append_foundation-armv8 = " root=/dev/vda2"
> > -XEN_DEVICETREE_XEN_BOOTARGS_append_foundation-armv8 = " console=dtuart
> > dtuart=serial0 bootscrub=0"
> > -
> > diff --git
> > a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp-base/early-printk.cfg
> > similarity index 100%
> > rename from
> > meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
> > rename to
> > meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp-base/early-printk.cfg
> > diff --git
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> > index 89130a6..ef3cc23 100644
> > ---
> > a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> > +++
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> > @@ -1,11 +1,6 @@
> > -# Foundation-armv8 support
> > -COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
> > -FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp:"
> > -SRC_URI_append_foundation-armv8 = " file://early-printk.cfg"
> > -
> >  # FVP Base support
> >  COMPATIBLE_MACHINE_fvp-base = "fvp-base"
> > -FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp:"
> > +FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files:"
> >  SRC_URI_append_fvp-base = " file://early-printk.cfg"
> >
> >  # Juno support
> > diff --git
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
> > index 874cfed..d9c88fb 100644
> > ---
> > a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
> > +++
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
> > @@ -1,6 +1,5 @@
> >  # Board specific configuration for the manager
> >
> > -# FVP and Foundation are using vda as hard drive and partition 2 is the
> > +# FVP uses vda as hard drive and partition 2 is the
> >  # default rootfs, so use vda3 for guest lvm
> > -XENGUEST_MANAGER_VOLUME_DEVICE_foundation-armv8 ?= "/dev/vda3"
> >  XENGUEST_MANAGER_VOLUME_DEVICE_fvp-base ?= "/dev/vda3"
> > diff --git
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
> > index 1efd7c6..1698d23 100644
> > ---
> > a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
> > +++
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
> > @@ -2,7 +2,5 @@ XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?= "eth0"
> >
> >  XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?= "eth0"
> >
> > -XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?= "eth0"
> > -
> >  # Juno board has 2 network interfaces, add both of them to the bridge
> >  XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
> > diff --git
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> > index 5231f51..c8eaad7 100644
> > ---
> > a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> > +++
> > b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> > @@ -13,4 +13,3 @@ LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE =
> > "${@bb.utils.contains_any('DISTRO_FEATURE
> >                                           '
> > features/arm-autonomy/disable-arm64-sve.scc','',d)}"
> >
> >  KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> > -KERNEL_FEATURES_append_foundation-armv8 =
> > "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> > -- 
> > 2.17.1
> > 
> >

> 
> 
> 

