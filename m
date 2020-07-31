Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.19230.1596204609372748213
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 07:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=X4Fviqdf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id ed14so14170416qvb.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rFPpx0pPxTUcp3mh3zEONzuuasP/5M0tWo1lYcmIA2k=;
        b=X4FviqdfddK+tfDK09OKnOON0p6ffR2dWxf8sSkX9tos7T/Ipp1BkIXqkPw5z4ecWF
         mPsDiuOYsZGK12mt+0+uejcjHt21piXAFW/JKipPAL0VTpsMwDpa0TU/lKAfaq52mhR8
         S2ni0QrK0bemaPZtJvPxU0jmWB4BmRgomTeKot+r3M1rvh/rLN8Vno96LgbHatFN/0Xt
         SZMjNTyltNL8uL0wZRrbN/TqbvexJYXw0zt9X7BDrfBVdzCFqL4jr11MP3ss1t7vJKOm
         kTaVcyqD2BmoXzk0twDreRrS1X5KJfxn4IWmdztuI9aYh2HHnxhX620vKbHbViaDi0aW
         OMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rFPpx0pPxTUcp3mh3zEONzuuasP/5M0tWo1lYcmIA2k=;
        b=T9V5lFIf6O8zYaJokD2i5d/XMCaRhpjCcufVqJUlBkxTgt5weL0K6zAhgmYLk6I6wK
         EQHTzMPj5WLgH/ygKSbdkxQwbDJUYhfqP9YNJbnD27QajlTVR1/+Ho8X5qv2cp1Tl4bn
         fBC+oE1TUMC5ikJyzmUTfD49bK6JhH9gYN6jFk6f2ZSCbXhqNoKUudARG2NXLX2bIeGi
         ct4cCBgM/GEU6KXMEXFcUl0gGsLaTb//Le4WXVmdTzmsaGTcHGqOcL+DqOsEkvtor7vB
         CHce0AGvrrDCwEiLwzYvLwSRIJeMAqZMSkfqk2onQomNBoSBscaqiAgkqHreNxpDEXN+
         7uTA==
X-Gm-Message-State: AOAM531kXa3FUkUVJM1sdNosRaAZY5CJiHGsv7jDu57Yx37kUkGk3G/O
	Fh0uiWhJkNwtd5x4MCuVDmEDOQ==
X-Google-Smtp-Source: ABdhPJwxY5hcPVd1Zhbma5JBnUdu+JV95PQbrhTVEKIQxzvl/GowOl/Gjsab1Jyx/ncKY7lqI0kj3g==
X-Received: by 2002:a05:6214:d46:: with SMTP id 6mr4318590qvr.240.1596204608400;
        Fri, 31 Jul 2020 07:10:08 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:ad65:cfb8:9c11:f25c])
        by smtp.gmail.com with ESMTPSA id n4sm8779526qtr.73.2020.07.31.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:10:07 -0700 (PDT)
Date: Fri, 31 Jul 2020 10:10:06 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2] arm-autonomy: Move gem5-arm64 to dynamic-layers/meta-gem5
Message-ID: <20200731141005.GC1853@kudzu.us>
References: <1596193925-20213-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1596193925-20213-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 12:12:05PM +0100, Diego Sueiro wrote:
> Since gem5-arm64 machine implementation was moved from meta-arm-bsp to
> meta-gem5, we need to move the specific machine settings to
> meta-arm-autonomy/dynamic-layers/meta-gem5.
> 
> Change-Id: I773189e7e1ee2ca77e569dcec2d92ecfb93d3719
> Issue-Id: SCM-1133
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-autonomy/conf/layer.conf                  |  1 +
>  ...ap-the-number-of-interrupt-lines-for-dom0.patch | 44 ----------------------
>  .../recipes-extended/xen/xen_%.bbappend            |  5 ---
>  .../xenguest/xenguest-network.bbappend             |  2 -
>  .../recipes-kernel/linux/linux-%.bbappend          |  1 -
>  .../boot-wrapper-aarch64_%.bbappend                |  0
>  .../meta-gem5/recipes-extended/xen/xen_%.bbappend  |  2 +
>  .../xenguest/xenguest-network.bbappend             |  1 +
>  .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 ++
>  .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
>  .../recipes-kernel/linux/linux-%.bbappend          | 15 ++++++++
>  11 files changed, 26 insertions(+), 52 deletions(-)
>  delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
>  rename meta-arm-autonomy/dynamic-layers/{meta-arm-bsp => meta-gem5}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
> 
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
> index 5c13596..2b9e94d 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -31,4 +31,5 @@ USER_CLASSES_append = " arm-autonomy-features"
>  
>  BBFILES_DYNAMIC += " \
>      meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
> +    meta-gem5:${LAYERDIR}/dynamic-layers/meta-gem5/*/*/*.bbappend \
>  "
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> deleted file mode 100644
> index 792bc9e..0000000
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From a41feccdb6c03f12bddb4fb650a0465f0ed6eeca Mon Sep 17 00:00:00 2001
> -From: Lukas Juenger <juenger@ice.rwth-aachen.de>
> -Date: Fri, 5 Apr 2019 15:54:04 +0200
> -Subject: [PATCH] xen/arm: Cap the number of interrupt lines for dom0
> -
> -Dom0 vGIC will use the same number of interrupt lines as the hardware GIC.
> -While the hardware GIC can support up to 1020 interrupt lines,
> -the vGIC is only supporting up to 992 interrupt lines.
> -This means that Xen will not be able to boot on platforms where the hardware
> -GIC supports more than 992 interrupt lines.
> -While it would make sense to increase the limits in the vGICs, this is not
> -trivial because of the design choices.
> -At the moment, only models seem to report the maximum of interrupt lines.
> -They also do not have any interrupt wired above the 992 limit.
> -So it should be fine to cap the number of interrupt lines for dom0 to 992 lines.
> -
> -Signed-off-by: Lukas Juenger <juenger@ice.rwth-aachen.de>
> -Acked-by: Julien Grall <julien.grall@arm.com>
> ----
> - xen/arch/arm/setup.c | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> -index 444857a967..ccb0f181ea 100644
> ---- a/xen/arch/arm/setup.c
> -+++ b/xen/arch/arm/setup.c
> -@@ -888,7 +888,13 @@ void __init start_xen(unsigned long boot_phys_offset,
> -     /* Create initial domain 0. */
> -     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> -     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> --    dom0_cfg.arch.nr_spis = gic_number_lines() - 32;
> -+    /*
> -+     * Xen vGIC supports a maximum of 992 interrupt lines.
> -+     * 32 are substracted to cover local IRQs.
> -+     */
> -+    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
> -+    if ( gic_number_lines() > 992 )
> -+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
> -     dom0_cfg.max_vcpus = dom0_max_vcpus();
> - 
> -     dom0 = domain_create(0, &dom0_cfg, true);
> --- 
> -2.17.1
> -
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> index bdcb75f..5e58ab1 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> @@ -2,7 +2,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  
>  # Machine specific settings
>  XEN_CONFIG_EARLY_PRINTK_juno = "juno"
> -XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
>  XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
>  XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
>  XEN_CONFIG_EARLY_PRINTK_n1sdp = "pl011,0x2a400000"
> @@ -22,10 +21,6 @@ COMPATIBLE_MACHINE_juno = "juno"
>  
>  SRC_URI_append_juno = " file://juno/defconfig"
>  
> -# Gem5 support
> -# Fix problem with number of interrupts on gem5
> -SRC_URI_append_gem5-arm64 = " file://4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
> -
>  # N1SDP support
>  COMPATIBLE_MACHINE_n1sdp = "n1sdp"
>  
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
> index de88cce..1efd7c6 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
> @@ -4,7 +4,5 @@ XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?= "eth0"
>  
>  XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?= "eth0"
>  
> -XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?= "eth0"
> -
>  # Juno board has 2 network interfaces, add both of them to the bridge
>  XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> index 189645a..5231f51 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> @@ -12,6 +12,5 @@ LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURE
>                                           'arm-autonomy-host arm-autonomy-guest', \
>                                           ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
>  
> -KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
>  KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
>  KERNEL_FEATURES_append_foundation-armv8 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
> new file mode 100644
> index 0000000..9e7ba45
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
> @@ -0,0 +1,2 @@
> +# Machine specific settings
> +XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
> new file mode 100644
> index 0000000..0283702
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
> @@ -0,0 +1 @@
> +XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?= "eth0"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
> new file mode 100644
> index 0000000..7e87cab
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
> @@ -0,0 +1,4 @@
> +# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
> +# Linux kernel with a coredump while trying to access ZEN bit of CPACR1 core
> +# register.
> +# CONFIG_ARM64_SVE is not set
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
> new file mode 100644
> index 0000000..6bc769c
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
> @@ -0,0 +1,3 @@
> +define KFEATURE_DESCRIPTION "Disable SVE support"
> +
> +kconf non-hardware disable-arm64-sve.cfg
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
> new file mode 100644
> index 0000000..0d0047a
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
> @@ -0,0 +1,15 @@
> +FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}:"
> +
> +#
> +# arm-autonomy kmeta extra
> +#
> +SRC_URI_append_gem5-arm64 = " file://arm-autonomy-kmeta-extra-gem5;type=kmeta;name=arm-autonomy-kmeta-extra-gem5;destsuffix=arm-autonomy-kmeta-extra-gem5"
> +
> +# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
> +# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
> +# register.
> +LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE_gem5-arm64 = "${@bb.utils.contains_any('DISTRO_FEATURES', \
> +                                         'arm-autonomy-host arm-autonomy-guest', \
> +                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
> +
> +KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> -- 
> 2.7.4
> 

> 

