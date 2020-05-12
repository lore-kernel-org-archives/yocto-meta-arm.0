Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.5069.1589242565160603139
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 17:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=PS6NgqJz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id 59so5586851qva.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 17:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EtpiWLEVw4969A9W7Iq6kn6EVXbyv5CjCWdL2d9tzpY=;
        b=PS6NgqJzMFQT8NZ0nISla03DAKikpR6F7CsuGuWeqB+0+RTlnIwLHKLQUVTAvUIKfE
         C+WixiHigmSYlgDqsbp1hxO/JUiuZjcpnsv5cOb1F3WjjRrTY3bbeUiFushp/B890W3m
         XUIe84j3tqaPj6Z6rfcSGIG6i+OvlAk51lqlixrsJNsJCBmVCLH0wKVvRNp85xYJ1DvY
         Tj3IuxpOkwKklkGfMdScJkkyz6Qp2k0UwAQhoLSb6vo+Rs3jPokW0rCnzEl4Rup7KQdp
         hcq5kI0z7ziK0O3nrrOSdPcAwig3xPOBkAZypuaEcSRLXrWfDLs/5GuKd3IFQylK0Fmy
         XrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EtpiWLEVw4969A9W7Iq6kn6EVXbyv5CjCWdL2d9tzpY=;
        b=qpCKATfdNPBunbcbsPSqLvlz1eJZ/r/ORocoCiEclGYt++euuJFmfmNFpDEs5vQKYO
         GFGl89/X1lTmC9ZzhdxvYCFKq3648oj+2zvOtTFNKbL0+rbvzAKk7AyILIWEgG5j/EOU
         hVV0CSxuHMzY7JbS51amGyfE0acBl7pTeDVAevO7/5l19NsWzDc2D+FX84A/Fbcl13wB
         tJNMDHh42CMHq5m5Z90Tn2tueEg52hoJavp/iGm35PJU2lfiKFlu2bdbPnRl3zcGK+Ur
         heNwxmrV4JObShN5O/Zi4zo5AKe2YOQJGvjb7Ob4ggYJ8wCW4cdNdJNQwDnwcYUL9aQ1
         BBNw==
X-Gm-Message-State: AGi0PuYOtZfZm9hZWSpDwfdv5toYMrD9ZUiITRAnsZt7SoIM7J+aEUpK
	pB1iUSaHe7SX/lCFStzzv0bNGQ==
X-Google-Smtp-Source: APiQypKLvwkLsuV/zm7dJh6mhlrCPQYZWhtJJJJAYPZeasB5QPeQVFrGdTIDbCM7TEdYxdGwkVYhUQ==
X-Received: by 2002:a0c:ff02:: with SMTP id w2mr13268020qvt.73.1589242564297;
        Mon, 11 May 2020 17:16:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a1b5:1e25:173e:a7bd])
        by smtp.gmail.com with ESMTPSA id j3sm1397012qkf.9.2020.05.11.17.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 17:16:03 -0700 (PDT)
Date: Mon, 11 May 2020 20:16:02 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Add support for N1SDP
Message-ID: <20200512001601.GB8026@kudzu.us>
References: <1589202990-52145-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1589202990-52145-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 02:16:30PM +0100, Diego Sueiro wrote:
> This patch includes the following changes for n1sdp:
> 
> * Add the Xen defconfig and early printk setting;
> * Setting the proper Xen device-tree boot args;
> * Remove some entries in xen devicetree (PM and SMMU) to make is
> compatible with XEN and extra registers settings required for PCI
> quirks to communicate with SCP.
> 
> Change-Id: Ic968728115787de8d9bfcaaf883fd8573ff6c9c9
> Issue-Id: SCM-888
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> ---
>  .../xen-devicetree/files/xen-n1sdp.dtsi            |  39 ++++++++
>  .../xen-devicetree/xen-devicetree.bbappend         |   7 ++
>  .../recipes-extended/xen/files/n1sdp/defconfig     | 100 +++++++++++++++++++++
>  .../recipes-extended/xen/xen_%.bbappend            |   5 ++
>  4 files changed, 151 insertions(+)
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
> 
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> new file mode 100644
> index 0000000..01ec14a
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> @@ -0,0 +1,39 @@
> +/*
> + * Modify N1SDP DTB to work properly when Xen is used
> + */
> +
> +/ {
> +
> +    /*
> +     * pmu is using PPI interrupts which are reserved by xen
> +     * remove pm nodes
> +     */
> +    /delete-node/ pmu;
> +    /delete-node/ spe-pmu;
> +
> +    /*
> +     * disable IOMMU until we have a proper support in xen
> +     */
> +    /delete-node/ iommu@4f000000;
> +    /delete-node/ iommu@4f400000;
> +
> +    /*
> +     * Set extra registers required for PCI quirks to communicate with SCP
> +     * and remove invalid properties due to removal
> +     */
> +    pcie@68000000 {
> +        reg = <0 0x68000000 0 0x1200000>,
> +                <0 0x06000000 0 0x80000>,
> +                <0 0x62000000 0 0x80000>;
> +        /delete-property/ msi-map;
> +        /delete-property/ iommu-map;
> +    };
> +
> +    pcie@70000000 {
> +        reg = <0 0x70000000 0 0x1200000>,
> +                <0 0x06000000 0 0x80000>,
> +                <0 0x60000000 0 0x80000>;
> +        /delete-property/ msi-map;
> +        /delete-property/ iommu-map;
> +    };
> +};
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> index 191cb13..006d0b7 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> @@ -6,10 +6,17 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  SRC_URI_append_juno = " file://xen-juno.dtsi"
>  XEN_DEVICETREE_DTSI_MERGE_append_juno = " xen-juno.dtsi"
>  
> +# Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP
> +SRC_URI_append_n1sdp = " file://xen-n1sdp.dtsi"
> +XEN_DEVICETREE_DTSI_MERGE_append_n1sdp = " xen-n1sdp.dtsi"
> +
>  # Board specific configs
>  XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
>  XEN_DEVICETREE_XEN_BOOTARGS_append_juno = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
>  
> +XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp = " root=/dev/sda1 rootwait"
> +XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
> +
>  XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda2"
>  XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart dtuart=serial0 bootscrub=0"
>  
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
> new file mode 100644
> index 0000000..e8a88c1
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
> @@ -0,0 +1,100 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Xen/arm 4.12.2 Configuration
> +#
> +CONFIG_64BIT=y
> +CONFIG_ARM_64=y
> +CONFIG_ARM=y
> +CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
> +
> +#
> +# Architecture Features
> +#
> +CONFIG_NR_CPUS=128
> +CONFIG_ACPI=y
> +CONFIG_GICV3=y
> +CONFIG_HAS_ITS=y
> +CONFIG_HVM=y
> +# CONFIG_NEW_VGIC is not set
> +CONFIG_SBSA_VUART_CONSOLE=y
> +CONFIG_ARM_SSBD=y
> +CONFIG_HARDEN_BRANCH_PREDICTOR=y
> +
> +#
> +# ARM errata workaround via the alternative framework
> +#
> +CONFIG_ARM64_ERRATUM_827319=y
> +CONFIG_ARM64_ERRATUM_824069=y
> +CONFIG_ARM64_ERRATUM_819472=y
> +CONFIG_ARM64_ERRATUM_832075=y
> +CONFIG_ARM64_ERRATUM_834220=y
> +CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
> +CONFIG_ALL_PLAT=y
> +# CONFIG_QEMU is not set
> +# CONFIG_RCAR3 is not set
> +# CONFIG_MPSOC is not set
> +# CONFIG_NO_PLAT is not set
> +CONFIG_ALL64_PLAT=y
> +# CONFIG_ALL32_PLAT is not set
> +CONFIG_MPSOC_PLATFORM=y
> +
> +#
> +# Common Features
> +#
> +CONFIG_HAS_ALTERNATIVE=y
> +CONFIG_HAS_DEVICE_TREE=y
> +# CONFIG_MEM_ACCESS is not set
> +CONFIG_HAS_PDX=y
> +# CONFIG_TMEM is not set
> +CONFIG_XSM=y
> +CONFIG_XSM_FLASK=y
> +CONFIG_XSM_FLASK_AVC_STATS=y
> +# CONFIG_XSM_FLASK_POLICY is not set
> +CONFIG_XSM_SILO=y
> +# CONFIG_XSM_DUMMY_DEFAULT is not set
> +# CONFIG_XSM_FLASK_DEFAULT is not set
> +CONFIG_XSM_SILO_DEFAULT=y
> +# CONFIG_ARGO is not set
> +
> +#
> +# Schedulers
> +#
> +CONFIG_SCHED_CREDIT=y
> +CONFIG_SCHED_CREDIT2=y
> +CONFIG_SCHED_RTDS=y
> +# CONFIG_SCHED_ARINC653 is not set
> +CONFIG_SCHED_NULL=y
> +# CONFIG_SCHED_CREDIT_DEFAULT is not set
> +CONFIG_SCHED_CREDIT2_DEFAULT=y
> +# CONFIG_SCHED_RTDS_DEFAULT is not set
> +# CONFIG_SCHED_NULL_DEFAULT is not set
> +CONFIG_SCHED_DEFAULT="credit2"
> +# CONFIG_LIVEPATCH is not set
> +CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
> +CONFIG_CMDLINE=""
> +CONFIG_DOM0_MEM=""
> +
> +#
> +# Device Drivers
> +#
> +CONFIG_HAS_NS16550=y
> +CONFIG_HAS_CADENCE_UART=y
> +CONFIG_HAS_MVEBU=y
> +CONFIG_HAS_PL011=y
> +CONFIG_HAS_SCIF=y
> +CONFIG_HAS_PASSTHROUGH=y
> +CONFIG_ARM_SMMU=y
> +CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
> +
> +#
> +# Debugging Options
> +#
> +# CONFIG_DEBUG is not set
> +CONFIG_DEBUG_INFO=y
> +# CONFIG_FRAME_POINTER is not set
> +# CONFIG_COVERAGE is not set
> +# CONFIG_LOCK_PROFILE is not set
> +# CONFIG_PERF_COUNTERS is not set
> +CONFIG_VERBOSE_DEBUG=y
> +# CONFIG_DEVICE_TREE_DEBUG is not set
> +# CONFIG_SCRUB_DEBUG is not set
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> index bac391c..bdcb75f 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> @@ -5,6 +5,7 @@ XEN_CONFIG_EARLY_PRINTK_juno = "juno"
>  XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
>  XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
>  XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
> +XEN_CONFIG_EARLY_PRINTK_n1sdp = "pl011,0x2a400000"
>  
>  # Foundation-armv8 support
>  COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
> @@ -25,3 +26,7 @@ SRC_URI_append_juno = " file://juno/defconfig"
>  # Fix problem with number of interrupts on gem5
>  SRC_URI_append_gem5-arm64 = " file://4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
>  
> +# N1SDP support
> +COMPATIBLE_MACHINE_n1sdp = "n1sdp"
> +
> +SRC_URI_append_n1sdp = " file://n1sdp/defconfig"
> -- 
> 2.7.4
> 

> 

