Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.38113.1599225089789964855
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Sep 2020 06:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EanqbWyf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id o64so6157311qkb.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Sep 2020 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X8eSpNtLnl0GJ8koGo+2LgBIJW5SM2PNCXY2xtudDK0=;
        b=EanqbWyflcu/kUevpmBkVoLuNM4p168jXLDM6idO6C1i1AMlQtCOtsoTtsddgGpPul
         TyhYulK1IxkrrHtAicgin3Qzx+UiFxpjjkQMY3Uo9+HVvAjcx84lSJm+biGQzbEOrw0I
         PCxIjBt6XrlaM+CXm48gFR9QjnCxByvTrSlMlSquwQDscQOTc6eIm+ot3Exm8RhMPZEg
         wz0e8l1h53xmYQEaub08DEJIKjZdBPwUGs53m46Mv/62HG2oW57pnAOE/Uesju8wJt86
         Q/XAIuZcT6CRBaObJKehG2+gAsr8Z/r72UoQjRJUbV7guGI/kg9N07YapU/V6oR4AuE6
         WqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X8eSpNtLnl0GJ8koGo+2LgBIJW5SM2PNCXY2xtudDK0=;
        b=gUmLGBkPyHprbtkQCAoIntCKHY3dFBkqMDEr6QzQiUPleMVp+8pfJOferLqQnXcjN5
         Ht6/KVFV7Fs9srJne1IjJhz9oCueHE42xGa+UHnjFwVjsjCtUyctsZ/ym0dteFPGYhuM
         hgdvQZWFdQyqRJv+L0dayzT42LhERYel6MyCbk8WlrNtie3pSxpVFPEzqD/iPPiz/9bK
         nK93Aso5nDJ7O+ewzakFeU7XcCmpvRDu6ZvTGG2TpHzT2D+zqJkw+Io/7J3Gyue+a0Zu
         gMptldh+7JgleQxyANpD2ViJPhEH/i3IDW5xzOco+u4h7wk5pW6jvUIb+c6M/bfCV7WD
         SKAg==
X-Gm-Message-State: AOAM5330JQVq7ehOkFhVmbosBd4b528lfidtYhTBXniHSokRlsWKnstm
	3I1NATqflHRzKsOfXDbVEfDSmg==
X-Google-Smtp-Source: ABdhPJyPOC2K3+m9Fg0J5BC8BZRcx01iqZu7sHqzTSKpTvSmbvzO535wg/G8Le8hAIaiZPPupXwqhw==
X-Received: by 2002:a37:a98c:: with SMTP id s134mr4662934qke.487.1599225088734;
        Fri, 04 Sep 2020 06:11:28 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id j31sm4568792qtc.33.2020.09.04.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 06:11:28 -0700 (PDT)
Date: Fri, 4 Sep 2020 09:11:25 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/9] arm-autonomy/xen: Update EARLY_PRINTK support and remove custom defconfigs
Message-ID: <20200904131125.GA693@kudzu.us>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 12:40:22PM +0100, Diego Sueiro wrote:
> From Xen 4.14 version, the CONFIG_EARLY_PRINTK setting was moved from the
> make define setting in xen/arch/arm/Rules.mk to the Kconfig infrastructure.
> Hence, we need to make usage of config fragments to add this option to the
> supported machines.
> 
> Also, remove the custom machines defconfigs and rely on the Xen in tree
> defconfig.
> 
> Change-Id: Ibd6058c4808eeea6ad1260ba558468a64877b231
> Issue-Id: SCM-1197
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  .../recipes-extended/xen/files/fvp/defconfig       |  73 ---------------
>  .../xen/files/fvp/early-printk.cfg                 |   2 +
>  .../recipes-extended/xen/files/juno/defconfig      |  73 ---------------
>  .../xen/files/juno/early-printk.cfg                |   2 +
>  .../recipes-extended/xen/files/n1sdp/defconfig     | 100 ---------------------
>  .../xen/files/n1sdp/early-printk.cfg               |   3 +
>  .../recipes-extended/xen/files/n1sdp/n1sdp.cfg     |   5 ++
>  .../recipes-extended/xen/xen_%.bbappend            |  25 ++----
>  .../recipes-extended/xen/xen_%.bbappend            |   9 --
>  9 files changed, 21 insertions(+), 271 deletions(-)
>  delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
>  delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg
>  delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg
> 
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
> deleted file mode 100644
> index f13327c..0000000
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -#
> -# Automatically generated file; DO NOT EDIT.
> -# Xen/arm 4.12.0 Configuration
> -#
> -CONFIG_64BIT=y
> -CONFIG_ARM_64=y
> -CONFIG_ARM=y
> -CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
> -
> -#
> -# Architecture Features
> -#
> -CONFIG_NR_CPUS=128
> -CONFIG_GICV3=y
> -CONFIG_HVM=y
> -# CONFIG_NEW_VGIC is not set
> -CONFIG_SBSA_VUART_CONSOLE=y
> -CONFIG_ARM_SSBD=y
> -CONFIG_HARDEN_BRANCH_PREDICTOR=y
> -
> -#
> -# ARM errata workaround via the alternative framework
> -#
> -CONFIG_ARM64_ERRATUM_827319=y
> -CONFIG_ARM64_ERRATUM_824069=y
> -CONFIG_ARM64_ERRATUM_819472=y
> -CONFIG_ARM64_ERRATUM_832075=y
> -CONFIG_ARM64_ERRATUM_834220=y
> -CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
> -CONFIG_ALL_PLAT=y
> -# CONFIG_QEMU is not set
> -# CONFIG_RCAR3 is not set
> -# CONFIG_MPSOC is not set
> -# CONFIG_NO_PLAT is not set
> -CONFIG_ALL64_PLAT=y
> -# CONFIG_ALL32_PLAT is not set
> -CONFIG_MPSOC_PLATFORM=y
> -
> -#
> -# Common Features
> -#
> -CONFIG_HAS_ALTERNATIVE=y
> -CONFIG_HAS_DEVICE_TREE=y
> -CONFIG_MEM_ACCESS=y
> -CONFIG_HAS_PDX=y
> -# CONFIG_XSM is not set
> -CONFIG_SCHED_CREDIT=y
> -CONFIG_SCHED_CREDIT2=y
> -CONFIG_SCHED_RTDS=y
> -# CONFIG_SCHED_ARINC653 is not set
> -CONFIG_SCHED_NULL=y
> -CONFIG_SCHED_DEFAULT="credit2"
> -# CONFIG_LIVEPATCH is not set
> -CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
> -CONFIG_CMDLINE=""
> -CONFIG_DOM0_MEM=""
> -
> -#
> -# Device Drivers
> -#
> -CONFIG_HAS_NS16550=y
> -CONFIG_HAS_CADENCE_UART=y
> -CONFIG_HAS_MVEBU=y
> -CONFIG_HAS_PL011=y
> -CONFIG_HAS_SCIF=y
> -CONFIG_HAS_PASSTHROUGH=y
> -CONFIG_ARM_SMMU=y
> -CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
> -
> -#
> -# Debugging Options
> -#
> -# CONFIG_DEBUG is not set
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
> new file mode 100644
> index 0000000..590ae3a
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_DEBUG=y
> +CONFIG_EARLY_PRINTK_FASTMODEL=y
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
> deleted file mode 100644
> index f13327c..0000000
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -#
> -# Automatically generated file; DO NOT EDIT.
> -# Xen/arm 4.12.0 Configuration
> -#
> -CONFIG_64BIT=y
> -CONFIG_ARM_64=y
> -CONFIG_ARM=y
> -CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
> -
> -#
> -# Architecture Features
> -#
> -CONFIG_NR_CPUS=128
> -CONFIG_GICV3=y
> -CONFIG_HVM=y
> -# CONFIG_NEW_VGIC is not set
> -CONFIG_SBSA_VUART_CONSOLE=y
> -CONFIG_ARM_SSBD=y
> -CONFIG_HARDEN_BRANCH_PREDICTOR=y
> -
> -#
> -# ARM errata workaround via the alternative framework
> -#
> -CONFIG_ARM64_ERRATUM_827319=y
> -CONFIG_ARM64_ERRATUM_824069=y
> -CONFIG_ARM64_ERRATUM_819472=y
> -CONFIG_ARM64_ERRATUM_832075=y
> -CONFIG_ARM64_ERRATUM_834220=y
> -CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
> -CONFIG_ALL_PLAT=y
> -# CONFIG_QEMU is not set
> -# CONFIG_RCAR3 is not set
> -# CONFIG_MPSOC is not set
> -# CONFIG_NO_PLAT is not set
> -CONFIG_ALL64_PLAT=y
> -# CONFIG_ALL32_PLAT is not set
> -CONFIG_MPSOC_PLATFORM=y
> -
> -#
> -# Common Features
> -#
> -CONFIG_HAS_ALTERNATIVE=y
> -CONFIG_HAS_DEVICE_TREE=y
> -CONFIG_MEM_ACCESS=y
> -CONFIG_HAS_PDX=y
> -# CONFIG_XSM is not set
> -CONFIG_SCHED_CREDIT=y
> -CONFIG_SCHED_CREDIT2=y
> -CONFIG_SCHED_RTDS=y
> -# CONFIG_SCHED_ARINC653 is not set
> -CONFIG_SCHED_NULL=y
> -CONFIG_SCHED_DEFAULT="credit2"
> -# CONFIG_LIVEPATCH is not set
> -CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
> -CONFIG_CMDLINE=""
> -CONFIG_DOM0_MEM=""
> -
> -#
> -# Device Drivers
> -#
> -CONFIG_HAS_NS16550=y
> -CONFIG_HAS_CADENCE_UART=y
> -CONFIG_HAS_MVEBU=y
> -CONFIG_HAS_PL011=y
> -CONFIG_HAS_SCIF=y
> -CONFIG_HAS_PASSTHROUGH=y
> -CONFIG_ARM_SMMU=y
> -CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
> -
> -#
> -# Debugging Options
> -#
> -# CONFIG_DEBUG is not set
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg
> new file mode 100644
> index 0000000..35b4741
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_DEBUG=y
> +CONFIG_EARLY_PRINTK_JUNO=y
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
> deleted file mode 100644
> index e8a88c1..0000000
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -#
> -# Automatically generated file; DO NOT EDIT.
> -# Xen/arm 4.12.2 Configuration
> -#
> -CONFIG_64BIT=y
> -CONFIG_ARM_64=y
> -CONFIG_ARM=y
> -CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
> -
> -#
> -# Architecture Features
> -#
> -CONFIG_NR_CPUS=128
> -CONFIG_ACPI=y
> -CONFIG_GICV3=y
> -CONFIG_HAS_ITS=y
> -CONFIG_HVM=y
> -# CONFIG_NEW_VGIC is not set
> -CONFIG_SBSA_VUART_CONSOLE=y
> -CONFIG_ARM_SSBD=y
> -CONFIG_HARDEN_BRANCH_PREDICTOR=y
> -
> -#
> -# ARM errata workaround via the alternative framework
> -#
> -CONFIG_ARM64_ERRATUM_827319=y
> -CONFIG_ARM64_ERRATUM_824069=y
> -CONFIG_ARM64_ERRATUM_819472=y
> -CONFIG_ARM64_ERRATUM_832075=y
> -CONFIG_ARM64_ERRATUM_834220=y
> -CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
> -CONFIG_ALL_PLAT=y
> -# CONFIG_QEMU is not set
> -# CONFIG_RCAR3 is not set
> -# CONFIG_MPSOC is not set
> -# CONFIG_NO_PLAT is not set
> -CONFIG_ALL64_PLAT=y
> -# CONFIG_ALL32_PLAT is not set
> -CONFIG_MPSOC_PLATFORM=y
> -
> -#
> -# Common Features
> -#
> -CONFIG_HAS_ALTERNATIVE=y
> -CONFIG_HAS_DEVICE_TREE=y
> -# CONFIG_MEM_ACCESS is not set
> -CONFIG_HAS_PDX=y
> -# CONFIG_TMEM is not set
> -CONFIG_XSM=y
> -CONFIG_XSM_FLASK=y
> -CONFIG_XSM_FLASK_AVC_STATS=y
> -# CONFIG_XSM_FLASK_POLICY is not set
> -CONFIG_XSM_SILO=y
> -# CONFIG_XSM_DUMMY_DEFAULT is not set
> -# CONFIG_XSM_FLASK_DEFAULT is not set
> -CONFIG_XSM_SILO_DEFAULT=y
> -# CONFIG_ARGO is not set
> -
> -#
> -# Schedulers
> -#
> -CONFIG_SCHED_CREDIT=y
> -CONFIG_SCHED_CREDIT2=y
> -CONFIG_SCHED_RTDS=y
> -# CONFIG_SCHED_ARINC653 is not set
> -CONFIG_SCHED_NULL=y
> -# CONFIG_SCHED_CREDIT_DEFAULT is not set
> -CONFIG_SCHED_CREDIT2_DEFAULT=y
> -# CONFIG_SCHED_RTDS_DEFAULT is not set
> -# CONFIG_SCHED_NULL_DEFAULT is not set
> -CONFIG_SCHED_DEFAULT="credit2"
> -# CONFIG_LIVEPATCH is not set
> -CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
> -CONFIG_CMDLINE=""
> -CONFIG_DOM0_MEM=""
> -
> -#
> -# Device Drivers
> -#
> -CONFIG_HAS_NS16550=y
> -CONFIG_HAS_CADENCE_UART=y
> -CONFIG_HAS_MVEBU=y
> -CONFIG_HAS_PL011=y
> -CONFIG_HAS_SCIF=y
> -CONFIG_HAS_PASSTHROUGH=y
> -CONFIG_ARM_SMMU=y
> -CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
> -
> -#
> -# Debugging Options
> -#
> -# CONFIG_DEBUG is not set
> -CONFIG_DEBUG_INFO=y
> -# CONFIG_FRAME_POINTER is not set
> -# CONFIG_COVERAGE is not set
> -# CONFIG_LOCK_PROFILE is not set
> -# CONFIG_PERF_COUNTERS is not set
> -CONFIG_VERBOSE_DEBUG=y
> -# CONFIG_DEVICE_TREE_DEBUG is not set
> -# CONFIG_SCRUB_DEBUG is not set
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg
> new file mode 100644
> index 0000000..56ab0e2
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg
> @@ -0,0 +1,3 @@
> +CONFIG_DEBUG=y
> +CONFIG_EARLY_UART_CHOICE_PL011=y
> +CONFIG_EARLY_UART_BASE_ADDRESS=0x2a400000
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg
> new file mode 100644
> index 0000000..d4d7c60
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg
> @@ -0,0 +1,5 @@
> +CONFIG_EXPERT=y
> +# Enable ACPI support
> +CONFIG_ACPI=y
> +# Enable ARM Interrupt Translation Service (ITS) emulation
> +CONFIG_HAS_ITS=y
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> index 5e58ab1..89130a6 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> @@ -1,27 +1,20 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -
> -# Machine specific settings
> -XEN_CONFIG_EARLY_PRINTK_juno = "juno"
> -XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
> -XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
> -XEN_CONFIG_EARLY_PRINTK_n1sdp = "pl011,0x2a400000"
> -
>  # Foundation-armv8 support
>  COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
> -
> -SRC_URI_append_foundation-armv8 = " file://fvp/defconfig"
> +FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp:"
> +SRC_URI_append_foundation-armv8 = " file://early-printk.cfg"
>  
>  # FVP Base support
>  COMPATIBLE_MACHINE_fvp-base = "fvp-base"
> -
> -SRC_URI_append_fvp-base = " file://fvp/defconfig"
> +FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp:"
> +SRC_URI_append_fvp-base = " file://early-printk.cfg"
>  
>  # Juno support
>  COMPATIBLE_MACHINE_juno = "juno"
> -
> -SRC_URI_append_juno = " file://juno/defconfig"
> +FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files:"
> +SRC_URI_append_juno = " file://early-printk.cfg"
>  
>  # N1SDP support
>  COMPATIBLE_MACHINE_n1sdp = "n1sdp"
> -
> -SRC_URI_append_n1sdp = " file://n1sdp/defconfig"
> +FILESEXTRAPATHS_prepend_n1sdp := "${THISDIR}/files:"
> +SRC_URI_append_n1sdp = " file://n1sdp.cfg \
> +                         file://early-printk.cfg"
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> index 846d244..c7f3643 100644
> --- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> @@ -1,12 +1,3 @@
> -#
> -# Define early console based on board parameters
> -#
> -
> -XEN_CONFIG_EARLY_PRINTK ??= "disable"
> -
> -EXTRA_OEMAKE += "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disable', \
> -    '', ' CONFIG_DEBUG=y CONFIG_EARLY_PRINTK=${XEN_CONFIG_EARLY_PRINTK}',d)}"
> -
>  # Make Xen machine specific
>  # This ensures that sstate is properly handled and that each machine can have
>  # its own configuration
> -- 
> 2.7.4
> 

> 

