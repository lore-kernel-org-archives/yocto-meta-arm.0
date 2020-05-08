Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.9986.1588943094027409467
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 06:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TozgDI+c;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id b1so337380qtt.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 May 2020 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Simgpht+EFJ7pYOlfOSzHY0zbWS4qKBDABx/vfw6Pzk=;
        b=TozgDI+c7bkvNUcPBCEyNTlNcRLDSmGnWMve3b7HCRzkfrPsf4TSuQRuwPt/+A98vF
         j+MNFVzPghWnzZp2fyXBFAi46LTmLGj8OIeLVk4hPpX92NvW+PxE0yvBgt7ApvAkHtPd
         J6YPxXrnm3h1OxJra/j16YH6ENLqXtveYQNJMFTlBdv11ERb7bVGy7oQG5Tqs44UWN9w
         Pqpt8mhBDgmq0CsDXAMR2FgVd6KR2hIHBSocATdlIBQLlup0GuzG07KVObvaV02nRNdb
         sWIGfVQGz+e5mCUHC03PeFbMxtpKeKKTJ8Xa8FSMvj69JEfLZTrCh6GO/1uW0U5f3Yrm
         8RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Simgpht+EFJ7pYOlfOSzHY0zbWS4qKBDABx/vfw6Pzk=;
        b=tYALVzHFK0rpywFgaVsABAADKwYiFPKkM7OXDh3C4LMtVcITR1xnm8E+eLjw2O1j5s
         VE1ydXtOvES4NAuM56M46tGAPZiiofTYoLkr3mioy5aim65TP+SAnCqyOSc2BdXV7BYL
         gnqnXssSKMYUB3BJB5B0cw0sqrnu0WHc9cC9kAsYkmAvwmf0GDXn3fDYIuNg+O/EoN+Q
         rI3R6rMcsstb0fwj4SHVAW3MtUePGM1V/s7Mok6wpVwJVlqSTqof14xqqGdhElCN1HDp
         936IzGM3GxD2Dt9vJFvFgTz/OEXl9fBzzPlc+6mrKMmKKC7WeabfzNYNSJVsG/5CdxfA
         nqPQ==
X-Gm-Message-State: AGi0PuaDEw2pCSiiuzKMmA8erRzb5uCsi7tu1N5wL+4Eups7uiqBYXDD
	bqq29l2WDpCM2N+sJEh5QCp8p6Iz4ORU2w==
X-Google-Smtp-Source: APiQypJFsVJPE5Qvsm/IK/sSQQyDk3oF82eLgg3fKuFG1PEY6nS+VXnK6I534s4OwY5qm266qSkyyA==
X-Received: by 2002:ac8:3808:: with SMTP id q8mr2897673qtb.245.1588943092749;
        Fri, 08 May 2020 06:04:52 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id z1sm1104921qkz.3.2020.05.08.06.04.52
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:04:52 -0700 (PDT)
Date: Fri, 8 May 2020 09:04:50 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] Move meta-arm-bsp machines settings to BBFILES_DYNAMIC
Message-ID: <20200508130450.GE32710@kudzu.us>
References: <20200507110355.38492-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507110355.38492-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 12:03:55PM +0100, Bertrand Marquis wrote:
> From: Diego Sueiro <diego.sueiro@arm.com>
> 
> All meta-arm-bsp machines specific settings should live at
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/ and only be included if
> meta-arm-bsp layer is present.
> 
> Change-Id: Ice8a301db85b5186384d602d9e3bedb909183320
> Issue-Id: SCM-984
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into the master branch.

Thanks,
Jon

> ---
>  .../xen-devicetree/files/xen-juno.dtsi        |  0
>  .../xen-devicetree/xen-devicetree.bbappend    |  0
>  ...e-number-of-interrupt-lines-for-dom0.patch |  0
>  .../recipes-extended/xen/files/fvp/defconfig  |  0
>  .../recipes-extended/xen/files/juno/defconfig |  0
>  .../recipes-extended/xen/xen_%.bbappend       | 27 +++++++++++++++++
>  .../xenguest/xenguest-manager.bbappend        |  0
>  .../xenguest/xenguest-network-bridge.bbappend |  0
>  .../arm-autonomy/disable-arm64-sve.cfg        |  0
>  .../arm-autonomy/disable-arm64-sve.scc        |  0
>  .../recipes-kernel/linux/linux-%.bbappend     | 17 +++++++++++
>  .../recipes-extended/xen/xen_%.bbappend       | 29 -------------------
>  .../linux/linux-arm-autonomy.inc              | 13 +--------
>  13 files changed, 45 insertions(+), 41 deletions(-)
>  rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen-devicetree/files/xen-juno.dtsi (100%)
>  rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen-devicetree/xen-devicetree.bbappend (100%)
>  rename meta-arm-autonomy/{recipes-extended/xen/files/4.12 => dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0}/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
>  rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen/files/fvp/defconfig (100%)
>  rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen/files/juno/defconfig (100%)
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
>  rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xenguest/xenguest-manager.bbappend (100%)
>  rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xenguest/xenguest-network-bridge.bbappend (100%)
>  rename meta-arm-autonomy/{recipes-kernel/linux/arm-autonomy-kmeta => dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra}/features/arm-autonomy/disable-arm64-sve.cfg (100%)
>  rename meta-arm-autonomy/{recipes-kernel/linux/arm-autonomy-kmeta => dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra}/features/arm-autonomy/disable-arm64-sve.scc (100%)
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-juno.dtsi
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-juno.dtsi
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> diff --git a/meta-arm-autonomy/recipes-extended/xen/files/4.12/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen/files/4.12/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> diff --git a/meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
> diff --git a/meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> new file mode 100644
> index 0000000..bac391c
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> @@ -0,0 +1,27 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +# Machine specific settings
> +XEN_CONFIG_EARLY_PRINTK_juno = "juno"
> +XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
> +XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
> +XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
> +
> +# Foundation-armv8 support
> +COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
> +
> +SRC_URI_append_foundation-armv8 = " file://fvp/defconfig"
> +
> +# FVP Base support
> +COMPATIBLE_MACHINE_fvp-base = "fvp-base"
> +
> +SRC_URI_append_fvp-base = " file://fvp/defconfig"
> +
> +# Juno support
> +COMPATIBLE_MACHINE_juno = "juno"
> +
> +SRC_URI_append_juno = " file://juno/defconfig"
> +
> +# Gem5 support
> +# Fix problem with number of interrupts on gem5
> +SRC_URI_append_gem5-arm64 = " file://4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
> similarity index 100%
> rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.cfg
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.scc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
> similarity index 100%
> rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.scc
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> new file mode 100644
> index 0000000..189645a
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
> @@ -0,0 +1,17 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}:"
> +
> +#
> +# arm-autonomy kmeta extra
> +#
> +SRC_URI_append = " file://arm-autonomy-kmeta-extra;type=kmeta;name=arm-autonomy-kmeta-extra;destsuffix=arm-autonomy-kmeta-extra"
> +
> +# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
> +# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
> +# register.
> +LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURES', \
> +                                         'arm-autonomy-host arm-autonomy-guest', \
> +                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
> +
> +KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> +KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> +KERNEL_FEATURES_append_foundation-armv8 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> index fb5962a..92348e6 100644
> --- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> @@ -1,37 +1,8 @@
> -# xen settings
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -
>  #
>  # Define early console based on board parameters
>  #
>  
>  XEN_CONFIG_EARLY_PRINTK ??= "disable"
>  
> -# Machine specific settings
> -XEN_CONFIG_EARLY_PRINTK_juno = "juno"
> -XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
> -XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
> -XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
> -
>  EXTRA_OEMAKE += "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disable', \
>      '', ' CONFIG_DEBUG=y CONFIG_EARLY_PRINTK=${XEN_CONFIG_EARLY_PRINTK}',d)}"
> -
> -# Foundation-armv8 support
> -COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
> -
> -SRC_URI_append_foundation-armv8 = " file://fvp/defconfig"
> -
> -# FVP Base support
> -COMPATIBLE_MACHINE_fvp-base = "fvp-base"
> -
> -SRC_URI_append_fvp-base = " file://fvp/defconfig"
> -
> -# Juno support
> -COMPATIBLE_MACHINE_juno = "juno"
> -
> -SRC_URI_append_juno = " file://juno/defconfig"
> -
> -# Gem5 support
> -# Fix problem with number of interrupts on gem5
> -SRC_URI_append_gem5-arm64 = " file://${XEN_REL}/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index bb48950..2763444 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -1,23 +1,12 @@
>  # Add arm-autonomy specific features to the kernel
>  
> -FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
> +FILESEXTRAPATHS_prepend := "${THISDIR}:"
>  
>  #
>  # arm-autonomy kmeta
>  #
>  SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
>  
> -# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
> -# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
> -# register.
> -LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURES', \
> -                                         'arm-autonomy-host arm-autonomy-guest', \
> -                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
> -
> -KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> -KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> -KERNEL_FEATURES_append_foundation-armv8 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> -
>  
>  # Add xen host drivers to kernel if arm-autonomy-host is activated
>  KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
> -- 
> 2.17.1
> 

> 

