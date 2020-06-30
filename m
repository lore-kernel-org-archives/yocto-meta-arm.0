Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.17500.1593530793465175676
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2020 08:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ORHTzEK3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id x62so15866917qtd.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2020 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LeaWhI+rFBgTTZWDmLT9Zzsrto1cJsRWh+Tjc98BqgQ=;
        b=ORHTzEK3ZfuJC4qT7poCuK/Xwaj280oyNlE20fP9Vcf0PFZs0r/fg5YhTMdettqbS9
         4xdwHGX2aWalD8ewT/0mAkigBwaYXhN8K6muk464PrSnuKon46jxzd3minr4XIlWYMsy
         zQjWe9PQyVCbGTiN7ynQ0H9ah7QVT9v3uPUHO8sjr/sKMU1QT6A5o+LPMgG+UxIXqD88
         izI8+T1hxw2lqMlS9AxxhUs+F3GrCQPp0zXxqWBMJEvmVzovOnowQO9Pm1X1tXB2sjZE
         qNCDbuOGD0pOwDntK3S3Uz03eUWok963sJmDTZzzvX3nad2IyRlQgAGUWKpQAJnEIWvu
         1TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LeaWhI+rFBgTTZWDmLT9Zzsrto1cJsRWh+Tjc98BqgQ=;
        b=Ehuq3lCnKk+NvaCQb1YAesfTXIUB0S11Fz1w3mSptnrkmVUmmXaSe0ZU8pDYvcni2l
         nN+DwHq827RU3Ng+DuPOqpViQgWxwYxhsjmOd85xjoqvi4BX5uP8ukeBk82ukZ9Ih1gV
         cE3J1g4tZug2qzq4lCaOZUyuw2z4dnIB4d3fCLcNHaH07yJGgeDzYI73QaKPVwrSDZdO
         jnRwO/fgbu3qbE5RsHmveeGPIj8hVuLcMWhU4kKVq5Cn2bvRvlIM3cCDnRO9v8IQwMM8
         kPzMrpFYoqIawGvLqgHDUzgah9e5ULJFCu5iuV6RwIrzgShklszaF8ps5GZNEZSxPjSH
         dlng==
X-Gm-Message-State: AOAM533+xot4VntASYbTYbftLuZZb3HCNN/f3AjA4ZL2Dep+QpbYhMj8
	xZ8q+ibpJsI8ffmRbJF3lF0t5aSfMa+LHQ==
X-Google-Smtp-Source: ABdhPJx5kP5TLdorYDNLz721VeXxKKjrY1hcTSVtEdUJ6mASJYwcLN2r+IqtnjNEOCHpN/vU29862Q==
X-Received: by 2002:ac8:4714:: with SMTP id f20mr21216074qtp.141.1593530791838;
        Tue, 30 Jun 2020 08:26:31 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:74a6:65bf:873f:d519])
        by smtp.gmail.com with ESMTPSA id z17sm3833825qth.24.2020.06.30.08.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 08:26:31 -0700 (PDT)
Date: Tue, 30 Jun 2020 11:26:29 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH RESEND 2/2] arm-bsp : Introduce TC0 platform and BSP
Message-ID: <20200630152629.GA11599@kudzu.us>
References: <20200629154124.9825-2-teo.coupriediaz@arm.com>
 <15141.1593504832077339029@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15141.1593504832077339029@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 01:13:52AM -0700, Diego Sueiro wrote:
> On Mon, Jun 29, 2020 at 04:41 PM, Teo Couprie Diaz wrote:
> 
> >
> > This patch introduces the Total Compute platform.
> > It adds support for the TC0 platform to the Android Common Kernel and
> > allows building all binaries needed to run Android on TC0.
> > It adds patches specific to TC0 for TF-A, SCP and U-Boot.
> > 
> > Change-Id: Ia83b79571c7381967c7449db031e3177b1990546
> > Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> > Signed-off-by: Usama Arif <usama.arif@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Series applied to master.

NOTE: there is corruption to the patch files in this series.  It
appears to be a problem with the SMTP servers from Arm.  Behind the
scenes work is being done to resolve it.

Thanks,
Jon

> 
> > ---
> >  meta-arm-bsp/conf/machine/tc0.conf            |  27 +
> >  .../scp-firmware/scp-firmware-tc0.inc         |  13 +
> >  .../scp-firmware/scp-firmware_git.bbappend    |   1 +
> >  .../trusted-firmware-a-tc0.inc                |  23 +
> >  .../trusted-firmware-a_2.3.bbappend           |   6 +
> >  .../tc0/tc0-config-and-android-boot.patch     | 160 ++++
> >  .../recipes-bsp/u-boot/u-boot-tc0.inc         |   6 +
> >  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   4 +
> >  .../recipes-kernel/linux/files/tc0/defconfig  | 906 ++++++++++++++++++
> >  ...m-Add-component-aware-simple-encoder.patch | 368 +++++++
> >  ...-red-and-blue-colors-in-HDLCD-driver.patch |  43 +
> >  .../linux/linux-arm64-ack-tc0.inc             |  15 +
> >  .../linux/linux-arm64-ack_4.19.bbappend       |   6 +
> >  13 files changed, 1578 insertions(+)
> >  create mode 100644 meta-arm-bsp/conf/machine/tc0.conf
> >  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> >  create mode 100644
> > meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
> >  create mode 100644
> > meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> >  create mode 100644
> > meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
> >  create mode 100644
> > meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
> >  create mode 100644
> > meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> >  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
> >  create mode 100644
> > meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> > 
> > diff --git a/meta-arm-bsp/conf/machine/tc0.conf
> > b/meta-arm-bsp/conf/machine/tc0.conf
> > new file mode 100644
> > index 0000000..9b4f1ae
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/tc0.conf
> > @@ -0,0 +1,27 @@
> > +# Configuration for TC0
> > +
> > +#@TYPE: Machine
> > +#@NAME: TC0
> > +#@DESCRIPTION: Machine configuration for TC0
> > +
> > +TUNE_FEATURES = "aarch64"
> > +
> > +require conf/machine/include/arm/arch-armv8a.inc
> > +
> > +# Das U-boot
> > +UBOOT_MACHINE ?= "total_compute_defconfig"
> > +
> > +# Trusted firmware A v2.3
> > +PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
> > +PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> > +
> > +EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
> > +
> > +PREFERRED_PROVIDER_virtual/kernel ?= "linux-arm64-ack"
> > +
> > +# Cannot use the default zImage on arm64
> > +KERNEL_IMAGETYPE = "Image"
> > +KERNEL_BOOTCMD = "booti"
> > +IMAGE_FSTYPES += "cpio.gz.u-boot"
> > +
> > +SERIAL_CONSOLES = "115200;ttyAMA0"
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> > b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> > new file mode 100644
> > index 0000000..5b29305
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> > @@ -0,0 +1,13 @@
> > +# TC0 specicif SCP configuration
> > +
> > +# Intermediate SHA with 2.6 baseline version
> > +SRCREV_scp    = "ba1db5fb0ee4a520836722f7a694177d461ab716"
> > +# 5.2.0 tag commit
> > +SRCREV_cmsis  = "80cc44bba16cb4c8f495b7aa9709d41ac50e9529"
> > +
> > +COMPATIBLE_MACHINE = "tc0"
> > +
> > +SCP_PLATFORM = "tc0"
> > +FW_TARGETS = "scp"
> > +
> > +PV = "2.6+git${SRCPV}"
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > index 53bd022..33ae7fe 100644
> > --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> > @@ -3,5 +3,6 @@
> >  MACHINE_SCP_REQUIRE ?= ""
> > 
> >  MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
> > +MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
> > 
> >  require ${MACHINE_SCP_REQUIRE}
> > diff --git
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
> > new file mode 100644
> > index 0000000..555fb1d
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
> > @@ -0,0 +1,23 @@
> > +# TCO specific TFA configuration
> > +
> > +# Intermediate SHA with 2.3 baseline version
> > +SRCREV_tfa = "2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537"
> > +# mbedtls-2.16.4 tag commit
> > +SRCREV_mbedtls = "39e2c0eeb6501980764793e8d54c49c0a42bde48"
> > +
> > +SRC_URI_append = " ${SRC_URI_MBEDTLS}"
> > +
> > +DEPENDS += "scp-firmware"
> > +
> > +COMPATIBLE_MACHINE = "tc0"
> > +
> > +TFA_PLATFORM = "tc0"
> > +TFA_BUILD_TARGET = "all fip"
> > +TFA_UBOOT = "1"
> > +TFA_INSTALL_TARGET = "bl1 fip"
> > +TFA_MBEDTLS = "1"
> > +TFA_DEBUG = "1"
> > +
> > +EXTRA_OEMAKE += "SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
> > +EXTRA_OEMAKE += "MBEDTLS_DIR=mbedtls TRUSTED_BOARD_BOOT=1 GENERATE_COT=1
> > ARM_ROTPK_LOCATION=devel_rsa \
> > +
> > ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
> > diff --git
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> > new file mode 100644
> > index 0000000..b642708
> > --- /dev/null
> > +++
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> > @@ -0,0 +1,6 @@
> > +# Machine specific TFAs
> > +
> > +MACHINE_TFA_REQUIRE ?= ""
> > +MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
> > +
> > +require ${MACHINE_TFA_REQUIRE}
> > diff --git
> > a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch
> > b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch
> > new file mode 100644
> > index 0000000..a66898e
> > --- /dev/null
> > +++
> > b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch
> > @@ -0,0 +1,160 @@
> > +From 0867e715d3563b0bc0ee7e04f9ec6b615de626b2 Mon Sep 17 00:00:00 2001
> > +From: Usama Arif <usama.arif@arm.com>
> > +Date: Thu, 04 Jun 2020 14:16:02 +0100
> > +Subject: [PATCH] Introduce Total Compute platform
> > +
> > +This is based off vexpress64 platform. It includes support for
> > +NOR flash and has bootargs setup for android boot.
> > +
> > +Change-Id: I965c81001a1c4a1a6788106f0ba2ca577dee4096
> > +Signed-off-by: Usama Arif <usama.arif@arm.com>
> > +Upstream-Status: Pending
> > +Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> > +---
> > +
> > +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > +index 21df1c4..c208a40 100644
> > +--- a/arch/arm/Kconfig
> > ++++ b/arch/arm/Kconfig
> > +@@ -1174,6 +1174,14 @@
> > +       select USB
> > +       select DM_USB
> > +
> > ++config TARGET_TOTAL_COMPUTE
> > ++      bool "Support Total Compute Platform"
> > ++      select ARM64
> > ++      select PL01X_SERIAL
> > ++      select DM
> > ++      select DM_SERIAL
> > ++      select DM_ETH
> > ++
> > + config TARGET_LS2080A_EMU
> > +       bool "Support ls2080a_emu"
> > +       select ARCH_LS2080A
> > +diff --git a/board/armltd/vexpress64/Kconfig
> > b/board/armltd/vexpress64/Kconfig
> > +index 1d13f54..d59769f 100644
> > +--- a/board/armltd/vexpress64/Kconfig
> > ++++ b/board/armltd/vexpress64/Kconfig
> > +@@ -1,4 +1,4 @@
> > +-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
> > ++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO ||
> > TARGET_TOTAL_COMPUTE
> > +
> > + config SYS_BOARD
> > +       default "vexpress64"
> > +diff --git a/configs/total_compute_defconfig
> > b/configs/total_compute_defconfig
> > +new file mode 100644
> > +index 0000000..1faeb36
> > +--- /dev/null
> > ++++ b/configs/total_compute_defconfig
> > +@@ -0,0 +1,40 @@
> > ++CONFIG_ARM=y
> > ++CONFIG_TARGET_TOTAL_COMPUTE=y
> > ++CONFIG_SYS_TEXT_BASE=0xe0000000
> > ++CONFIG_SYS_MALLOC_F_LEN=0x2000
> > ++CONFIG_ENV_SIZE=0x10000
> > ++CONFIG_NR_DRAM_BANKS=2
> > ++CONFIG_DISTRO_DEFAULTS=y
> > ++CONFIG_BOOTDELAY=1
> > ++CONFIG_USE_BOOTARGS=y
> > ++CONFIG_BOOTARGS="console=ttyAMA0 debug user_debug=31
> > earlycon=pl011,0x7ff80000 loglevel=9 androidboot.hardware=total_compute
> > video=640x480-32@60 root=/dev/vda2 ip=dhcp androidboot.selinux=permissive"
> > ++# CONFIG_USE_BOOTCOMMAND is not set
> > ++# CONFIG_DISPLAY_CPUINFO is not set
> > ++# CONFIG_DISPLAY_BOARDINFO is not set
> > ++CONFIG_SYS_PROMPT="TOTAL_COMPUTE# "
> > ++# CONFIG_CMD_CONSOLE is not set
> > ++# CONFIG_CMD_XIMG is not set
> > ++# CONFIG_CMD_EDITENV is not set
> > ++CONFIG_CMD_MEMTEST=y
> > ++CONFIG_SYS_MEMTEST_START=0x80000000
> > ++CONFIG_SYS_MEMTEST_END=0xff000000
> > ++CONFIG_CMD_ARMFLASH=y
> > ++# CONFIG_CMD_LOADS is not set
> > ++# CONFIG_CMD_ITEST is not set
> > ++# CONFIG_CMD_SETEXPR is not set
> > ++# CONFIG_CMD_NFS is not set
> > ++CONFIG_CMD_CACHE=y
> > ++# CONFIG_CMD_MISC is not set
> > ++CONFIG_CMD_UBI=y
> > ++# CONFIG_ISO_PARTITION is not set
> > ++# CONFIG_EFI_PARTITION is not set
> > ++# CONFIG_MMC is not set
> > ++CONFIG_MTD=y
> > ++CONFIG_MTD_NOR_FLASH=y
> > ++CONFIG_FLASH_CFI_DRIVER=y
> > ++CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
> > ++CONFIG_SYS_FLASH_PROTECTION=y
> > ++CONFIG_SYS_FLASH_CFI=y
> > ++CONFIG_SMC911X=y
> > ++CONFIG_SMC911X_32_BIT=y
> > ++CONFIG_OF_LIBFDT=y
> > +diff --git a/include/configs/vexpress_aemv8a.h
> > b/include/configs/vexpress_aemv8a.h
> > +index 09cdd3d..e39699e 100644
> > +--- a/include/configs/vexpress_aemv8a.h
> > ++++ b/include/configs/vexpress_aemv8a.h
> > +@@ -13,7 +13,7 @@
> > + #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> > + /* ATF loads u-boot here for BASE_FVP model */
> > + #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
> > +-#elif CONFIG_TARGET_VEXPRESS64_JUNO
> > ++#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
> > defined(CONFIG_TARGET_TOTAL_COMPUTE)
> > + #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff0)
> > + #endif
> > +
> > +@@ -40,7 +40,7 @@
> > + #define V2M_KMI0                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(6))
> > + #define V2M_KMI1                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(7))
> > +
> > +-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
> > ++#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
> > defined(CONFIG_TARGET_TOTAL_COMPUTE)
> > + #define V2M_UART0                     0x7ff80000
> > + #define V2M_UART1                     0x7ff70000
> > + #else /* Not Juno */
> > +@@ -79,7 +79,7 @@
> > + #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> > + #define GICD_BASE                     (0x2f000000)
> > + #define GICC_BASE                     (0x2c000000)
> > +-#elif CONFIG_TARGET_VEXPRESS64_JUNO
> > ++#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
> > defined(CONFIG_TARGET_TOTAL_COMPUTE)
> > + #define GICD_BASE                     (0x2C010000)
> > + #define GICC_BASE                     (0x2C02f000)
> > + #endif
> > +@@ -88,14 +88,19 @@
> > + /* Size of malloc() pool */
> > + #define CONFIG_SYS_MALLOC_LEN         (CONFIG_ENV_SIZE + (8 << 20))
> > +
> > ++#ifdef CONFIG_TARGET_TOTAL_COMPUTE
> > ++#define CONFIG_SMC911X_BASE           0x18000000
> > ++#else
> > ++
> > + #ifndef CONFIG_TARGET_VEXPRESS64_JUNO
> > + /* The Vexpress64 simulators use SMSC91C111 */
> > + #define CONFIG_SMC91111                       1
> > + #define CONFIG_SMC91111_BASE          (0x01A000000)
> > + #endif
> > +
> > ++#endif
> > + /* PL011 Serial Configuration */
> > +-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
> > ++#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
> > defined(CONFIG_TARGET_TOTAL_COMPUTE)
> > + #define CONFIG_PL011_CLOCK            7372800
> > + #else
> > + #define CONFIG_PL011_CLOCK            24000000
> > +@@ -189,8 +194,17 @@
> > +                               "fi"
> > +
> > +
> > +-#endif
> > ++#elif CONFIG_TARGET_TOTAL_COMPUTE
> > ++#define CONFIG_EXTRA_ENV_SETTINGS     \
> > ++                              "kernel_addr_r=0x80080000\0"    \
> > ++                              "initrd_addr_r=0x88000000\0"    \
> > ++                              "fdt_addr_r=0x83000000\0"       \
> > ++                              "fdt_high=0xffffffffffffffff\0" \
> > ++                              "initrd_high=0xffffffffffffffff\0"
> > +
> > ++#define CONFIG_BOOTCOMMAND    "booti ${kernel_addr_r} ${initrd_addr_r}
> > ${fdt_addr_r}"
> > ++
> > ++#endif
> > + /* Monitor Command Prompt */
> > + #define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size */
> > + #define CONFIG_SYS_MAXARGS            64      /* max command args */
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
> > b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
> > new file mode 100644
> > index 0000000..6c2ed5f
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
> > @@ -0,0 +1,6 @@
> > +# TC0 specific Das U-Boot configuration and patch
> > +
> > +SRC_URI_append = ' file://tc0-config-and-android-boot.patch'
> > +
> > +# v2020.07-rc3 tag commit
> > +SRCREV = "8c48bb21bd6a1778d1f299de30ff62c07929702b"
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > index 20133a4..0df13a4 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > @@ -5,4 +5,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"
> >  SRC_URI_append_a5ds = " file://0001-armv7-add-mmio-timer.patch \
> >                     
> > file://0002-board-arm-add-designstart-cortex-a5-board.patch"
> > 
> > +MACHINE_UBOOT_REQUIRE ?= ""
> > 
> > +MACHINE_UBOOT_REQUIRE_tc0 = "u-boot-tc0.inc"
> > +
> > +require ${MACHINE_UBOOT_REQUIRE}
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
> > b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
> > new file mode 100644
> > index 0000000..f981b3f
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
> > @@ -0,0 +1,906 @@
> > +CONFIG_POSIX_MQUEUE=y
> > +CONFIG_AUDIT=y
> > +CONFIG_NO_HZ=y
> > +CONFIG_HIGH_RES_TIMERS=y
> > +CONFIG_PREEMPT=y
> > +CONFIG_IRQ_TIME_ACCOUNTING=y
> > +CONFIG_BSD_PROCESS_ACCT=y
> > +CONFIG_BSD_PROCESS_ACCT_V3=y
> > +CONFIG_TASKSTATS=y
> > +CONFIG_TASK_DELAY_ACCT=y
> > +CONFIG_TASK_XACCT=y
> > +CONFIG_TASK_IO_ACCOUNTING=y
> > +CONFIG_PSI=y
> > +CONFIG_IKCONFIG=y
> > +CONFIG_IKCONFIG_PROC=y
> > +CONFIG_NUMA_BALANCING=y
> > +CONFIG_MEMCG=y
> > +CONFIG_MEMCG_SWAP=y
> > +CONFIG_BLK_CGROUP=y
> > +CONFIG_RT_GROUP_SCHED=y
> > +CONFIG_CGROUP_PIDS=y
> > +CONFIG_CGROUP_FREEZER=y
> > +CONFIG_CGROUP_HUGETLB=y
> > +CONFIG_CPUSETS=y
> > +CONFIG_CGROUP_DEVICE=y
> > +CONFIG_CGROUP_CPUACCT=y
> > +CONFIG_CGROUP_PERF=y
> > +CONFIG_CGROUP_BPF=y
> > +CONFIG_SCHED_AUTOGROUP=y
> > +CONFIG_SCHED_TUNE=y
> > +CONFIG_BLK_DEV_INITRD=y
> > +# CONFIG_FHANDLE is not set
> > +CONFIG_KALLSYMS_ALL=y
> > +CONFIG_BPF_SYSCALL=y
> > +CONFIG_BPF_JIT_ALWAYS_ON=y
> > +CONFIG_EMBEDDED=y
> > +# CONFIG_COMPAT_BRK is not set
> > +CONFIG_PROFILING=y
> > +CONFIG_ARCH_SUNXI=y
> > +CONFIG_ARCH_ALPINE=y
> > +CONFIG_ARCH_BCM2835=y
> > +CONFIG_ARCH_BCM_IPROC=y
> > +CONFIG_ARCH_BERLIN=y
> > +CONFIG_ARCH_BRCMSTB=y
> > +CONFIG_ARCH_EXYNOS=y
> > +CONFIG_ARCH_K3=y
> > +CONFIG_ARCH_LAYERSCAPE=y
> > +CONFIG_ARCH_LG1K=y
> > +CONFIG_ARCH_HISI=y
> > +CONFIG_ARCH_MEDIATEK=y
> > +CONFIG_ARCH_MESON=y
> > +CONFIG_ARCH_MVEBU=y
> > +CONFIG_ARCH_QCOM=y
> > +CONFIG_ARCH_ROCKCHIP=y
> > +CONFIG_ARCH_SEATTLE=y
> > +CONFIG_ARCH_SYNQUACER=y
> > +CONFIG_ARCH_RENESAS=y
> > +CONFIG_ARCH_R8A7795=y
> > +CONFIG_ARCH_R8A7796=y
> > +CONFIG_ARCH_R8A77965=y
> > +CONFIG_ARCH_R8A77970=y
> > +CONFIG_ARCH_R8A77980=y
> > +CONFIG_ARCH_R8A77990=y
> > +CONFIG_ARCH_R8A77995=y
> > +CONFIG_ARCH_STRATIX10=y
> > +CONFIG_ARCH_TEGRA=y
> > +CONFIG_ARCH_SPRD=y
> > +CONFIG_ARCH_THUNDER=y
> > +CONFIG_ARCH_THUNDER2=y
> > +CONFIG_ARCH_UNIPHIER=y
> > +CONFIG_ARCH_VEXPRESS=y
> > +CONFIG_ARCH_XGENE=y
> > +CONFIG_ARCH_ZX=y
> > +CONFIG_ARCH_ZYNQMP=y
> > +CONFIG_PCI=y
> > +CONFIG_PCI_IOV=y
> > +CONFIG_HOTPLUG_PCI=y
> > +CONFIG_HOTPLUG_PCI_ACPI=y
> > +CONFIG_PCI_AARDVARK=y
> > +CONFIG_PCI_TEGRA=y
> > +CONFIG_PCIE_RCAR=y
> > +CONFIG_PCI_HOST_GENERIC=y
> > +CONFIG_PCI_XGENE=y
> > +CONFIG_PCI_HOST_THUNDER_PEM=y
> > +CONFIG_PCI_HOST_THUNDER_ECAM=y
> > +CONFIG_PCIE_ROCKCHIP_HOST=m
> > +CONFIG_PCI_LAYERSCAPE=y
> > +CONFIG_PCI_HISI=y
> > +CONFIG_PCIE_QCOM=y
> > +CONFIG_PCIE_ARMADA_8K=y
> > +CONFIG_PCIE_KIRIN=y
> > +CONFIG_PCIE_HISI_STB=y
> > +CONFIG_ARM64_VA_BITS_48=y
> > +CONFIG_SCHED_MC=y
> > +CONFIG_NUMA=y
> > +CONFIG_SECCOMP=y
> > +CONFIG_KEXEC=y
> > +CONFIG_CRASH_DUMP=y
> > +CONFIG_XEN=y
> > +CONFIG_ARM64_SW_TTBR0_PAN=y
> > +CONFIG_RANDOMIZE_BASE=y
> > +CONFIG_COMPAT=y
> > +CONFIG_HIBERNATION=y
> > +CONFIG_PM_DEBUG=y
> > +CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
> > +CONFIG_ENERGY_MODEL=y
> > +CONFIG_ARM_CPUIDLE=y
> > +CONFIG_CPU_FREQ=y
> > +CONFIG_CPU_FREQ_STAT=y
> > +CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
> > +CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> > +CONFIG_CPU_FREQ_GOV_USERSPACE=y
> > +CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> > +CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> > +CONFIG_CPUFREQ_DT=y
> > +CONFIG_ACPI_CPPC_CPUFREQ=m
> > +CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
> > +CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
> > +CONFIG_ARM_SCPI_CPUFREQ=y
> > +CONFIG_ARM_TEGRA186_CPUFREQ=y
> > +CONFIG_ARM_SCPI_PROTOCOL=y
> > +CONFIG_RASPBERRYPI_FIRMWARE=y
> > +CONFIG_EFI_CAPSULE_LOADER=y
> > +CONFIG_ACPI=y
> > +CONFIG_ACPI_APEI=y
> > +CONFIG_ACPI_APEI_GHES=y
> > +CONFIG_ACPI_APEI_MEMORY_FAILURE=y
> > +CONFIG_ACPI_APEI_EINJ=y
> > +CONFIG_VIRTUALIZATION=y
> > +CONFIG_KVM=y
> > +CONFIG_ARM64_CRYPTO=y
> > +CONFIG_CRYPTO_SHA1_ARM64_CE=y
> > +CONFIG_CRYPTO_SHA2_ARM64_CE=y
> > +CONFIG_CRYPTO_SHA512_ARM64_CE=m
> > +CONFIG_CRYPTO_SHA3_ARM64=m
> > +CONFIG_CRYPTO_SM3_ARM64_CE=m
> > +CONFIG_CRYPTO_GHASH_ARM64_CE=y
> > +CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
> > +CONFIG_CRYPTO_CRC32_ARM64_CE=m
> > +CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
> > +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
> > +CONFIG_CRYPTO_CHACHA20_NEON=m
> > +CONFIG_CRYPTO_AES_ARM64_BS=m
> > +CONFIG_KPROBES=y
> > +CONFIG_JUMP_LABEL=y
> > +CONFIG_MODULES=y
> > +CONFIG_MODULE_UNLOAD=y
> > +CONFIG_MODVERSIONS=y
> > +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> > +CONFIG_MEMORY_FAILURE=y
> > +CONFIG_TRANSPARENT_HUGEPAGE=y
> > +CONFIG_CMA=y
> > +CONFIG_NET=y
> > +CONFIG_PACKET=y
> > +CONFIG_UNIX=y
> > +CONFIG_XFRM_USER=y
> > +CONFIG_XFRM_INTERFACE=y
> > +CONFIG_XFRM_STATISTICS=y
> > +CONFIG_NET_KEY=y
> > +CONFIG_INET=y
> > +CONFIG_IP_MULTICAST=y
> > +CONFIG_IP_ADVANCED_ROUTER=y
> > +CONFIG_IP_MULTIPLE_TABLES=y
> > +CONFIG_IP_PNP=y
> > +CONFIG_IP_PNP_DHCP=y
> > +CONFIG_IP_PNP_BOOTP=y
> > +CONFIG_NET_IPGRE_DEMUX=y
> > +CONFIG_NET_IPVTI=y
> > +CONFIG_INET_ESP=y
> > +CONFIG_INET_UDP_DIAG=y
> > +CONFIG_INET_DIAG_DESTROY=y
> > +CONFIG_IPV6_ROUTER_PREF=y
> > +CONFIG_IPV6_ROUTE_INFO=y
> > +CONFIG_IPV6_OPTIMISTIC_DAD=y
> > +CONFIG_INET6_ESP=y
> > +CONFIG_INET6_IPCOMP=y
> > +CONFIG_IPV6_MIP6=y
> > +CONFIG_IPV6_VTI=y
> > +CONFIG_IPV6_MULTIPLE_TABLES=y
> > +CONFIG_NETFILTER=y
> > +CONFIG_NF_CONNTRACK=y
> > +CONFIG_NF_CONNTRACK_SECMARK=y
> > +CONFIG_NF_CONNTRACK_EVENTS=y
> > +CONFIG_NF_CONNTRACK_AMANDA=y
> > +CONFIG_NF_CONNTRACK_FTP=y
> > +CONFIG_NF_CONNTRACK_H323=y
> > +CONFIG_NF_CONNTRACK_IRC=y
> > +CONFIG_NF_CONNTRACK_NETBIOS_NS=y
> > +CONFIG_NF_CONNTRACK_PPTP=y
> > +CONFIG_NF_CONNTRACK_SANE=y
> > +CONFIG_NF_CONNTRACK_TFTP=y
> > +CONFIG_NF_CT_NETLINK=y
> > +CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
> > +CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
> > +CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
> > +CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=y
> > +CONFIG_NETFILTER_XT_TARGET_CT=y
> > +CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
> > +CONFIG_NETFILTER_XT_TARGET_LOG=m
> > +CONFIG_NETFILTER_XT_TARGET_MARK=y
> > +CONFIG_NETFILTER_XT_TARGET_NFLOG=y
> > +CONFIG_NETFILTER_XT_TARGET_NFQUEUE=y
> > +CONFIG_NETFILTER_XT_TARGET_TPROXY=y
> > +CONFIG_NETFILTER_XT_TARGET_TRACE=y
> > +CONFIG_NETFILTER_XT_TARGET_SECMARK=y
> > +CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
> > +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> > +CONFIG_NETFILTER_XT_MATCH_BPF=y
> > +CONFIG_NETFILTER_XT_MATCH_COMMENT=y
> > +CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
> > +CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
> > +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
> > +CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=y
> > +CONFIG_NETFILTER_XT_MATCH_HELPER=y
> > +CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
> > +CONFIG_NETFILTER_XT_MATCH_LENGTH=y
> > +CONFIG_NETFILTER_XT_MATCH_LIMIT=y
> > +CONFIG_NETFILTER_XT_MATCH_MAC=y
> > +CONFIG_NETFILTER_XT_MATCH_MARK=y
> > +CONFIG_NETFILTER_XT_MATCH_OWNER=y
> > +CONFIG_NETFILTER_XT_MATCH_POLICY=y
> > +CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
> > +CONFIG_NETFILTER_XT_MATCH_QUOTA=y
> > +CONFIG_NETFILTER_XT_MATCH_QUOTA2=y
> > +CONFIG_NETFILTER_XT_MATCH_SOCKET=y
> > +CONFIG_NETFILTER_XT_MATCH_STATE=y
> > +CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
> > +CONFIG_NETFILTER_XT_MATCH_STRING=y
> > +CONFIG_NETFILTER_XT_MATCH_TIME=y
> > +CONFIG_NETFILTER_XT_MATCH_U32=y
> > +CONFIG_IP_NF_IPTABLES=y
> > +CONFIG_IP_NF_MATCH_ECN=y
> > +CONFIG_IP_NF_MATCH_TTL=y
> > +CONFIG_IP_NF_FILTER=y
> > +CONFIG_IP_NF_TARGET_REJECT=y
> > +CONFIG_IP_NF_NAT=y
> > +CONFIG_IP_NF_TARGET_MASQUERADE=y
> > +CONFIG_IP_NF_TARGET_NETMAP=y
> > +CONFIG_IP_NF_TARGET_REDIRECT=y
> > +CONFIG_IP_NF_MANGLE=y
> > +CONFIG_IP_NF_RAW=y
> > +CONFIG_IP_NF_SECURITY=y
> > +CONFIG_IP_NF_ARPTABLES=y
> > +CONFIG_IP_NF_ARPFILTER=y
> > +CONFIG_IP_NF_ARP_MANGLE=y
> > +CONFIG_IP6_NF_IPTABLES=y
> > +CONFIG_IP6_NF_MATCH_RPFILTER=y
> > +CONFIG_IP6_NF_FILTER=y
> > +CONFIG_IP6_NF_TARGET_REJECT=y
> > +CONFIG_IP6_NF_MANGLE=y
> > +CONFIG_IP6_NF_RAW=y
> > +CONFIG_L2TP=y
> > +CONFIG_BRIDGE=m
> > +CONFIG_BRIDGE_VLAN_FILTERING=y
> > +CONFIG_VLAN_8021Q=m
> > +CONFIG_VLAN_8021Q_GVRP=y
> > +CONFIG_VLAN_8021Q_MVRP=y
> > +CONFIG_NET_SCHED=y
> > +CONFIG_NET_SCH_HTB=y
> > +CONFIG_NET_SCH_NETEM=y
> > +CONFIG_NET_SCH_INGRESS=y
> > +CONFIG_NET_CLS_U32=y
> > +CONFIG_NET_CLS_BPF=y
> > +CONFIG_NET_EMATCH=y
> > +CONFIG_NET_EMATCH_U32=y
> > +CONFIG_NET_CLS_ACT=y
> > +CONFIG_BPF_JIT=y
> > +CONFIG_BT=m
> > +CONFIG_BT_HIDP=m
> > +# CONFIG_BT_HS is not set
> > +# CONFIG_BT_LE is not set
> > +CONFIG_BT_LEDS=y
> > +# CONFIG_BT_DEBUGFS is not set
> > +CONFIG_BT_HCIBTUSB=m
> > +CONFIG_BT_HCIUART=m
> > +CONFIG_BT_HCIUART_LL=y
> > +CONFIG_BT_HCIUART_BCM=y
> > +CONFIG_CFG80211=m
> > +CONFIG_MAC80211=m
> > +CONFIG_MAC80211_LEDS=y
> > +CONFIG_RFKILL=m
> > +CONFIG_NET_9P=y
> > +CONFIG_NET_9P_VIRTIO=y
> > +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> > +CONFIG_DEVTMPFS=y
> > +CONFIG_DEVTMPFS_MOUNT=y
> > +CONFIG_DMA_CMA=y
> > +CONFIG_CMA_SIZE_MBYTES=32
> > +CONFIG_HISILICON_LPC=y
> > +CONFIG_SIMPLE_PM_BUS=y
> > +CONFIG_MTD=y
> > +CONFIG_MTD_BLOCK=y
> > +CONFIG_MTD_M25P80=y
> > +CONFIG_MTD_NAND=y
> > +CONFIG_MTD_NAND_DENALI_DT=y
> > +CONFIG_MTD_NAND_MARVELL=y
> > +CONFIG_MTD_NAND_QCOM=y
> > +CONFIG_MTD_SPI_NOR=y
> > +CONFIG_BLK_DEV_LOOP=y
> > +CONFIG_BLK_DEV_NBD=m
> > +CONFIG_BLK_DEV_RAM=y
> > +CONFIG_BLK_DEV_RAM_SIZE=8192
> > +CONFIG_VIRTIO_BLK=y
> > +CONFIG_BLK_DEV_NVME=m
> > +CONFIG_SRAM=y
> > +CONFIG_UID_SYS_STATS=y
> > +CONFIG_EEPROM_AT25=m
> > +# CONFIG_SCSI_PROC_FS is not set
> > +CONFIG_BLK_DEV_SD=y
> > +CONFIG_SCSI_SAS_ATA=y
> > +CONFIG_SCSI_HISI_SAS=y
> > +CONFIG_SCSI_HISI_SAS_PCI=y
> > +CONFIG_SCSI_UFSHCD=m
> > +CONFIG_SCSI_UFSHCD_PLATFORM=m
> > +CONFIG_SCSI_UFS_QCOM=m
> > +CONFIG_SCSI_UFS_HISI=m
> > +CONFIG_ATA=y
> > +CONFIG_SATA_AHCI=y
> > +CONFIG_SATA_AHCI_PLATFORM=y
> > +CONFIG_AHCI_CEVA=y
> > +CONFIG_AHCI_MVEBU=y
> > +CONFIG_AHCI_XGENE=y
> > +CONFIG_AHCI_QORIQ=y
> > +CONFIG_SATA_SIL24=y
> > +CONFIG_SATA_RCAR=y
> > +CONFIG_PATA_PLATFORM=y
> > +CONFIG_PATA_OF_PLATFORM=y
> > +CONFIG_MD=y
> > +CONFIG_BLK_DEV_DM=y
> > +CONFIG_DM_CRYPT=y
> > +CONFIG_DM_SNAPSHOT=y
> > +CONFIG_DM_UEVENT=y
> > +CONFIG_DM_VERITY=y
> > +CONFIG_DM_VERITY_FEC=y
> > +CONFIG_DM_BOW=y
> > +CONFIG_NETDEVICES=y
> > +CONFIG_MACVLAN=m
> > +CONFIG_MACVTAP=m
> > +CONFIG_TUN=y
> > +CONFIG_VETH=m
> > +CONFIG_VIRTIO_NET=y
> > +CONFIG_AMD_XGBE=y
> > +CONFIG_NET_XGENE=y
> > +CONFIG_ATL1C=m
> > +CONFIG_MACB=y
> > +CONFIG_THUNDER_NIC_PF=y
> > +CONFIG_HIX5HD2_GMAC=y
> > +CONFIG_HNS_DSAF=y
> > +CONFIG_HNS_ENET=y
> > +CONFIG_E1000E=y
> > +CONFIG_IGB=y
> > +CONFIG_IGBVF=y
> > +CONFIG_MVNETA=y
> > +CONFIG_MVPP2=y
> > +CONFIG_SKY2=y
> > +CONFIG_QCOM_EMAC=m
> > +CONFIG_RAVB=y
> > +CONFIG_SMC91X=y
> > +CONFIG_SMSC911X=y
> > +CONFIG_SNI_AVE=y
> > +CONFIG_SNI_NETSEC=y
> > +CONFIG_STMMAC_ETH=m
> > +CONFIG_MDIO_BUS_MUX_MMIOREG=y
> > +CONFIG_AT803X_PHY=m
> > +CONFIG_MARVELL_PHY=m
> > +CONFIG_MARVELL_10G_PHY=m
> > +CONFIG_MESON_GXL_PHY=m
> > +CONFIG_MICREL_PHY=y
> > +CONFIG_REALTEK_PHY=m
> > +CONFIG_ROCKCHIP_PHY=y
> > +CONFIG_PPP=y
> > +CONFIG_PPP_BSDCOMP=y
> > +CONFIG_PPP_DEFLATE=y
> > +CONFIG_PPP_MPPE=y
> > +CONFIG_PPTP=y
> > +CONFIG_PPPOL2TP=y
> > +CONFIG_USB_PEGASUS=m
> > +CONFIG_USB_RTL8150=m
> > +CONFIG_USB_RTL8152=y
> > +CONFIG_USB_LAN78XX=m
> > +CONFIG_USB_USBNET=y
> > +CONFIG_USB_NET_DM9601=m
> > +CONFIG_USB_NET_SR9800=m
> > +CONFIG_USB_NET_SMSC75XX=m
> > +CONFIG_USB_NET_SMSC95XX=m
> > +CONFIG_USB_NET_PLUSB=m
> > +CONFIG_USB_NET_MCS7830=m
> > +CONFIG_ATH10K=m
> > +CONFIG_ATH10K_PCI=m
> > +CONFIG_BRCMFMAC=m
> > +CONFIG_MWIFIEX=m
> > +CONFIG_MWIFIEX_PCIE=m
> > +CONFIG_WL18XX=m
> > +CONFIG_WLCORE_SDIO=m
> > +CONFIG_INPUT_EVDEV=y
> > +CONFIG_KEYBOARD_ADC=m
> > +CONFIG_KEYBOARD_GPIO=y
> > +CONFIG_KEYBOARD_CROS_EC=y
> > +# CONFIG_INPUT_MOUSE is not set
> > +CONFIG_INPUT_JOYSTICK=y
> > +CONFIG_JOYSTICK_XPAD=y
> > +CONFIG_JOYSTICK_XPAD_FF=y
> > +CONFIG_JOYSTICK_XPAD_LEDS=y
> > +CONFIG_INPUT_TABLET=y
> > +CONFIG_TABLET_USB_ACECAD=y
> > +CONFIG_TABLET_USB_AIPTEK=y
> > +CONFIG_TABLET_USB_GTCO=y
> > +CONFIG_TABLET_USB_HANWANG=y
> > +CONFIG_TABLET_USB_KBTAB=y
> > +CONFIG_INPUT_TOUCHSCREEN=y
> > +CONFIG_TOUCHSCREEN_ATMEL_MXT=m
> > +CONFIG_INPUT_MISC=y
> > +CONFIG_INPUT_PM8941_PWRKEY=y
> > +CONFIG_INPUT_UINPUT=y
> > +CONFIG_INPUT_HISI_POWERKEY=y
> > +# CONFIG_SERIO_SERPORT is not set
> > +CONFIG_SERIO_AMBAKMI=y
> > +# CONFIG_VT is not set
> > +# CONFIG_LEGACY_PTYS is not set
> > +# CONFIG_DEVMEM is not set
> > +CONFIG_SERIAL_8250=y
> > +CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_EXTENDED=y
> > +CONFIG_SERIAL_8250_SHARE_IRQ=y
> > +CONFIG_SERIAL_8250_BCM2835AUX=y
> > +CONFIG_SERIAL_8250_DW=y
> > +CONFIG_SERIAL_8250_MT6577=y
> > +CONFIG_SERIAL_8250_UNIPHIER=y
> > +CONFIG_SERIAL_OF_PLATFORM=y
> > +CONFIG_SERIAL_AMBA_PL011=y
> > +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> > +CONFIG_SERIAL_MESON=y
> > +CONFIG_SERIAL_MESON_CONSOLE=y
> > +CONFIG_SERIAL_SAMSUNG=y
> > +CONFIG_SERIAL_SAMSUNG_CONSOLE=y
> > +CONFIG_SERIAL_TEGRA=y
> > +CONFIG_SERIAL_SH_SCI=y
> > +CONFIG_SERIAL_MSM=y
> > +CONFIG_SERIAL_MSM_CONSOLE=y
> > +CONFIG_SERIAL_XILINX_PS_UART=y
> > +CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
> > +CONFIG_SERIAL_MVEBU_UART=y
> > +CONFIG_SERIAL_DEV_BUS=y
> > +CONFIG_VIRTIO_CONSOLE=y
> > +CONFIG_TCG_TPM=y
> > +CONFIG_TCG_TIS_I2C_INFINEON=y
> > +CONFIG_I2C_CHARDEV=y
> > +CONFIG_I2C_MUX_PCA954x=y
> > +CONFIG_I2C_BCM2835=m
> > +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> > +CONFIG_I2C_IMX=y
> > +CONFIG_I2C_MESON=y
> > +CONFIG_I2C_MV64XXX=y
> > +CONFIG_I2C_PXA=y
> > +CONFIG_I2C_QUP=y
> > +CONFIG_I2C_RK3X=y
> > +CONFIG_I2C_SH_MOBILE=y
> > +CONFIG_I2C_TEGRA=y
> > +CONFIG_I2C_UNIPHIER_F=y
> > +CONFIG_I2C_VERSATILE=y
> > +CONFIG_I2C_RCAR=y
> > +CONFIG_I2C_CROS_EC_TUNNEL=y
> > +CONFIG_SPI=y
> > +CONFIG_SPI_ARMADA_3700=y
> > +CONFIG_SPI_BCM2835=m
> > +CONFIG_SPI_BCM2835AUX=m
> > +CONFIG_SPI_MESON_SPICC=m
> > +CONFIG_SPI_MESON_SPIFC=m
> > +CONFIG_SPI_ORION=y
> > +CONFIG_SPI_PL022=y
> > +CONFIG_SPI_ROCKCHIP=y
> > +CONFIG_SPI_QUP=y
> > +CONFIG_SPI_S3C64XX=y
> > +CONFIG_SPI_SPIDEV=m
> > +CONFIG_SPMI=y
> > +CONFIG_PINCTRL_SINGLE=y
> > +CONFIG_PINCTRL_MAX77620=y
> > +CONFIG_PINCTRL_IPQ8074=y
> > +CONFIG_PINCTRL_MSM8916=y
> > +CONFIG_PINCTRL_MSM8994=y
> > +CONFIG_PINCTRL_MSM8996=y
> > +CONFIG_PINCTRL_QDF2XXX=y
> > +CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
> > +CONFIG_PINCTRL_MT7622=y
> > +CONFIG_GPIO_DWAPB=y
> > +CONFIG_GPIO_MB86S7X=y
> > +CONFIG_GPIO_PL061=y
> > +CONFIG_GPIO_RCAR=y
> > +CONFIG_GPIO_UNIPHIER=y
> > +CONFIG_GPIO_XGENE=y
> > +CONFIG_GPIO_XGENE_SB=y
> > +CONFIG_GPIO_PCA953X=y
> > +CONFIG_GPIO_PCA953X_IRQ=y
> > +CONFIG_GPIO_MAX77620=y
> > +CONFIG_POWER_AVS=y
> > +CONFIG_ROCKCHIP_IODOMAIN=y
> > +CONFIG_POWER_RESET_MSM=y
> > +CONFIG_POWER_RESET_XGENE=y
> > +CONFIG_POWER_RESET_SYSCON=y
> > +CONFIG_SYSCON_REBOOT_MODE=y
> > +CONFIG_BATTERY_SBS=m
> > +CONFIG_BATTERY_BQ27XXX=y
> > +CONFIG_SENSORS_ARM_SCPI=y
> > +CONFIG_SENSORS_LM90=m
> > +CONFIG_SENSORS_RASPBERRYPI_HWMON=m
> > +CONFIG_SENSORS_INA2XX=m
> > +CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
> > +CONFIG_CPU_THERMAL=y
> > +CONFIG_THERMAL_EMULATION=y
> > +CONFIG_ROCKCHIP_THERMAL=m
> > +CONFIG_RCAR_GEN3_THERMAL=y
> > +CONFIG_ARMADA_THERMAL=y
> > +CONFIG_BRCMSTB_THERMAL=m
> > +CONFIG_EXYNOS_THERMAL=y
> > +CONFIG_TEGRA_BPMP_THERMAL=m
> > +CONFIG_QCOM_TSENS=y
> > +CONFIG_UNIPHIER_THERMAL=y
> > +CONFIG_WATCHDOG=y
> > +CONFIG_ARM_SP805_WATCHDOG=y
> > +CONFIG_S3C2410_WATCHDOG=y
> > +CONFIG_MESON_GXBB_WATCHDOG=m
> > +CONFIG_MESON_WATCHDOG=m
> > +CONFIG_RENESAS_WDT=y
> > +CONFIG_UNIPHIER_WATCHDOG=y
> > +CONFIG_BCM2835_WDT=y
> > +CONFIG_MFD_BD9571MWV=y
> > +CONFIG_MFD_AXP20X_RSB=y
> > +CONFIG_MFD_CROS_EC=y
> > +CONFIG_MFD_CROS_EC_CHARDEV=m
> > +CONFIG_MFD_EXYNOS_LPASS=m
> > +CONFIG_MFD_HI6421_PMIC=y
> > +CONFIG_MFD_HI655X_PMIC=y
> > +CONFIG_MFD_MAX77620=y
> > +CONFIG_MFD_SPMI_PMIC=y
> > +CONFIG_MFD_RK808=y
> > +CONFIG_MFD_SEC_CORE=y
> > +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> > +CONFIG_REGULATOR_AXP20X=y
> > +CONFIG_REGULATOR_BD9571MWV=y
> > +CONFIG_REGULATOR_FAN53555=y
> > +CONFIG_REGULATOR_GPIO=y
> > +CONFIG_REGULATOR_HI6421V530=y
> > +CONFIG_REGULATOR_HI655X=y
> > +CONFIG_REGULATOR_MAX77620=y
> > +CONFIG_REGULATOR_PWM=y
> > +CONFIG_REGULATOR_QCOM_SMD_RPM=y
> > +CONFIG_REGULATOR_QCOM_SPMI=y
> > +CONFIG_REGULATOR_RK808=y
> > +CONFIG_REGULATOR_S2MPS11=y
> > +CONFIG_REGULATOR_VCTRL=m
> > +CONFIG_RC_CORE=m
> > +CONFIG_RC_DECODERS=y
> > +CONFIG_RC_DEVICES=y
> > +CONFIG_IR_MESON=m
> > +CONFIG_MEDIA_SUPPORT=y
> > +CONFIG_MEDIA_CAMERA_SUPPORT=y
> > +CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> > +CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> > +CONFIG_MEDIA_CONTROLLER=y
> > +CONFIG_VIDEO_V4L2_SUBDEV_API=y
> > +# CONFIG_DVB_NET is not set
> > +CONFIG_MEDIA_USB_SUPPORT=y
> > +CONFIG_USB_VIDEO_CLASS=m
> > +CONFIG_V4L_MEM2MEM_DRIVERS=y
> > +CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
> > +CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> > +CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
> > +CONFIG_VIDEO_RENESAS_FCP=m
> > +CONFIG_VIDEO_RENESAS_VSP1=m
> > +CONFIG_DRM=y
> > +CONFIG_DRM_LOAD_EDID_FIRMWARE=y
> > +CONFIG_DRM_I2C_NXP_TDA998X=y
> > +CONFIG_DRM_HDLCD=y
> > +CONFIG_DRM_NOUVEAU=m
> > +CONFIG_DRM_VIRT_ENCODER=y
> > +CONFIG_DRM_EXYNOS=m
> > +CONFIG_DRM_EXYNOS5433_DECON=y
> > +CONFIG_DRM_EXYNOS7_DECON=y
> > +CONFIG_DRM_EXYNOS_DSI=y
> > +# CONFIG_DRM_EXYNOS_DP is not set
> > +CONFIG_DRM_EXYNOS_HDMI=y
> > +CONFIG_DRM_EXYNOS_MIC=y
> > +CONFIG_DRM_ROCKCHIP=m
> > +CONFIG_ROCKCHIP_ANALOGIX_DP=y
> > +CONFIG_ROCKCHIP_CDN_DP=y
> > +CONFIG_ROCKCHIP_DW_HDMI=y
> > +CONFIG_ROCKCHIP_DW_MIPI_DSI=y
> > +CONFIG_ROCKCHIP_INNO_HDMI=y
> > +CONFIG_DRM_RCAR_DU=m
> > +CONFIG_DRM_RCAR_LVDS=m
> > +CONFIG_DRM_TEGRA=m
> > +CONFIG_DRM_PANEL_SIMPLE=m
> > +CONFIG_DRM_I2C_ADV7511=m
> > +CONFIG_DRM_VC4=m
> > +CONFIG_DRM_HISI_HIBMC=m
> > +CONFIG_DRM_HISI_KIRIN=m
> > +CONFIG_DRM_MESON=m
> > +CONFIG_FB_ARMCLCD=y
> > +CONFIG_BACKLIGHT_GENERIC=m
> > +CONFIG_BACKLIGHT_PWM=m
> > +CONFIG_BACKLIGHT_LP855X=m
> > +CONFIG_LOGO=y
> > +# CONFIG_LOGO_LINUX_MONO is not set
> > +# CONFIG_LOGO_LINUX_VGA16 is not set
> > +CONFIG_SOUND=y
> > +CONFIG_SND=y
> > +CONFIG_SND_SOC=y
> > +CONFIG_SND_BCM2835_SOC_I2S=m
> > +CONFIG_SND_SOC_ROCKCHIP=m
> > +CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
> > +CONFIG_SND_SOC_ROCKCHIP_RT5645=m
> > +CONFIG_SND_SOC_RK3399_GRU_SOUND=m
> > +CONFIG_SND_SOC_SAMSUNG=y
> > +CONFIG_SND_SOC_RCAR=m
> > +CONFIG_SND_SOC_AK4613=m
> > +CONFIG_SND_SIMPLE_CARD=m
> > +CONFIG_SND_AUDIO_GRAPH_CARD=m
> > +CONFIG_HIDRAW=y
> > +CONFIG_UHID=y
> > +CONFIG_HID_A4TECH=y
> > +CONFIG_HID_ACRUX=y
> > +CONFIG_HID_ACRUX_FF=y
> > +CONFIG_HID_APPLE=y
> > +CONFIG_HID_BELKIN=y
> > +CONFIG_HID_CHERRY=y
> > +CONFIG_HID_CHICONY=y
> > +CONFIG_HID_PRODIKEYS=y
> > +CONFIG_HID_CYPRESS=y
> > +CONFIG_HID_DRAGONRISE=y
> > +CONFIG_DRAGONRISE_FF=y
> > +CONFIG_HID_EMS_FF=y
> > +CONFIG_HID_ELECOM=y
> > +CONFIG_HID_EZKEY=y
> > +CONFIG_HID_HOLTEK=y
> > +CONFIG_HID_KEYTOUCH=y
> > +CONFIG_HID_KYE=y
> > +CONFIG_HID_UCLOGIC=y
> > +CONFIG_HID_WALTOP=y
> > +CONFIG_HID_GYRATION=y
> > +CONFIG_HID_TWINHAN=y
> > +CONFIG_HID_KENSINGTON=y
> > +CONFIG_HID_LCPOWER=y
> > +CONFIG_HID_LOGITECH=y
> > +CONFIG_HID_LOGITECH_DJ=y
> > +CONFIG_LOGITECH_FF=y
> > +CONFIG_LOGIRUMBLEPAD2_FF=y
> > +CONFIG_LOGIG940_FF=y
> > +CONFIG_HID_MAGICMOUSE=y
> > +CONFIG_HID_MICROSOFT=y
> > +CONFIG_HID_MONTEREY=y
> > +CONFIG_HID_MULTITOUCH=y
> > +CONFIG_HID_NTRIG=y
> > +CONFIG_HID_ORTEK=y
> > +CONFIG_HID_PANTHERLORD=y
> > +CONFIG_PANTHERLORD_FF=y
> > +CONFIG_HID_PETALYNX=y
> > +CONFIG_HID_PICOLCD=y
> > +CONFIG_HID_PRIMAX=y
> > +CONFIG_HID_ROCCAT=y
> > +CONFIG_HID_SAITEK=y
> > +CONFIG_HID_SAMSUNG=y
> > +CONFIG_HID_SONY=y
> > +CONFIG_HID_SPEEDLINK=y
> > +CONFIG_HID_SUNPLUS=y
> > +CONFIG_HID_GREENASIA=y
> > +CONFIG_GREENASIA_FF=y
> > +CONFIG_HID_SMARTJOYPLUS=y
> > +CONFIG_SMARTJOYPLUS_FF=y
> > +CONFIG_HID_TIVO=y
> > +CONFIG_HID_TOPSEED=y
> > +CONFIG_HID_THRUSTMASTER=y
> > +CONFIG_HID_WACOM=y
> > +CONFIG_HID_WIIMOTE=y
> > +CONFIG_HID_ZEROPLUS=y
> > +CONFIG_HID_ZYDACRON=y
> > +CONFIG_USB_HIDDEV=y
> > +CONFIG_I2C_HID=m
> > +CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> > +CONFIG_USB_OTG=y
> > +CONFIG_USB_XHCI_HCD=y
> > +CONFIG_USB_XHCI_TEGRA=y
> > +CONFIG_USB_EHCI_HCD=y
> > +CONFIG_USB_EHCI_EXYNOS=y
> > +CONFIG_USB_EHCI_HCD_PLATFORM=y
> > +CONFIG_USB_OHCI_HCD=y
> > +CONFIG_USB_OHCI_EXYNOS=y
> > +CONFIG_USB_OHCI_HCD_PLATFORM=y
> > +CONFIG_USB_RENESAS_USBHS=m
> > +CONFIG_USB_STORAGE=y
> > +CONFIG_USB_MUSB_HDRC=y
> > +CONFIG_USB_MUSB_SUNXI=y
> > +CONFIG_USB_DWC3=y
> > +CONFIG_USB_DWC2=y
> > +CONFIG_USB_CHIPIDEA=y
> > +CONFIG_USB_CHIPIDEA_UDC=y
> > +CONFIG_USB_CHIPIDEA_HOST=y
> > +CONFIG_USB_ISP1760=y
> > +CONFIG_USB_HSIC_USB3503=y
> > +CONFIG_NOP_USB_XCEIV=y
> > +CONFIG_USB_ULPI=y
> > +CONFIG_USB_GADGET=y
> > +CONFIG_USB_RENESAS_USBHS_UDC=m
> > +CONFIG_USB_RENESAS_USB3=m
> > +CONFIG_USB_CONFIGFS=y
> > +CONFIG_USB_CONFIGFS_UEVENT=y
> > +CONFIG_USB_CONFIGFS_F_FS=y
> > +CONFIG_USB_CONFIGFS_F_ACC=y
> > +CONFIG_USB_CONFIGFS_F_AUDIO_SRC=y
> > +CONFIG_USB_CONFIGFS_F_MIDI=y
> > +CONFIG_MMC=y
> > +CONFIG_MMC_BLOCK_MINORS=32
> > +CONFIG_MMC_ARMMMCI=y
> > +CONFIG_MMC_SDHCI=y
> > +CONFIG_MMC_SDHCI_ACPI=y
> > +CONFIG_MMC_SDHCI_PLTFM=y
> > +CONFIG_MMC_SDHCI_OF_ARASAN=y
> > +CONFIG_MMC_SDHCI_OF_ESDHC=y
> > +CONFIG_MMC_SDHCI_CADENCE=y
> > +CONFIG_MMC_SDHCI_TEGRA=y
> > +CONFIG_MMC_SDHCI_F_SDH30=y
> > +CONFIG_MMC_MESON_GX=y
> > +CONFIG_MMC_SDHCI_MSM=y
> > +CONFIG_MMC_SPI=y
> > +CONFIG_MMC_SDHI=y
> > +CONFIG_MMC_DW=y
> > +CONFIG_MMC_DW_EXYNOS=y
> > +CONFIG_MMC_DW_HI3798CV200=y
> > +CONFIG_MMC_DW_K3=y
> > +CONFIG_MMC_DW_ROCKCHIP=y
> > +CONFIG_MMC_SUNXI=y
> > +CONFIG_MMC_BCM2835=y
> > +CONFIG_MMC_SDHCI_XENON=y
> > +CONFIG_LEDS_GPIO=y
> > +CONFIG_LEDS_PWM=y
> > +CONFIG_LEDS_SYSCON=y
> > +CONFIG_LEDS_TRIGGER_DISK=y
> > +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> > +CONFIG_LEDS_TRIGGER_CPU=y
> > +CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
> > +CONFIG_LEDS_TRIGGER_PANIC=y
> > +CONFIG_EDAC=y
> > +CONFIG_EDAC_GHES=y
> > +CONFIG_RTC_CLASS=y
> > +CONFIG_RTC_DRV_MAX77686=y
> > +CONFIG_RTC_DRV_RK808=m
> > +CONFIG_RTC_DRV_S5M=y
> > +CONFIG_RTC_DRV_DS3232=y
> > +CONFIG_RTC_DRV_EFI=y
> > +CONFIG_RTC_DRV_CROS_EC=y
> > +CONFIG_RTC_DRV_S3C=y
> > +CONFIG_RTC_DRV_PL031=y
> > +CONFIG_RTC_DRV_SUN6I=y
> > +CONFIG_RTC_DRV_ARMADA38X=y
> > +CONFIG_RTC_DRV_TEGRA=y
> > +CONFIG_RTC_DRV_XGENE=y
> > +CONFIG_DMADEVICES=y
> > +CONFIG_DMA_BCM2835=m
> > +CONFIG_K3_DMA=y
> > +CONFIG_MV_XOR_V2=y
> > +CONFIG_PL330_DMA=y
> > +CONFIG_TEGRA20_APB_DMA=y
> > +CONFIG_QCOM_BAM_DMA=y
> > +CONFIG_QCOM_HIDMA_MGMT=y
> > +CONFIG_QCOM_HIDMA=y
> > +CONFIG_RCAR_DMAC=y
> > +CONFIG_RENESAS_USB_DMAC=m
> > +CONFIG_VFIO=y
> > +CONFIG_VFIO_PCI=y
> > +CONFIG_VIRTIO_PCI=y
> > +CONFIG_VIRTIO_BALLOON=y
> > +CONFIG_VIRTIO_MMIO=y
> > +CONFIG_XEN_GNTDEV=y
> > +CONFIG_XEN_GRANT_DEV_ALLOC=y
> > +CONFIG_STAGING=y
> > +CONFIG_ASHMEM=y
> > +CONFIG_ION=y
> > +CONFIG_CROS_EC_I2C=y
> > +CONFIG_CROS_EC_SPI=y
> > +CONFIG_COMMON_CLK_RK808=y
> > +CONFIG_COMMON_CLK_SCPI=y
> > +CONFIG_COMMON_CLK_CS2000_CP=y
> > +CONFIG_COMMON_CLK_S2MPS11=y
> > +CONFIG_CLK_QORIQ=y
> > +CONFIG_COMMON_CLK_PWM=y
> > +CONFIG_COMMON_CLK_QCOM=y
> > +CONFIG_QCOM_CLK_SMD_RPM=y
> > +CONFIG_IPQ_GCC_8074=y
> > +CONFIG_MSM_GCC_8916=y
> > +CONFIG_MSM_GCC_8994=y
> > +CONFIG_MSM_MMCC_8996=y
> > +CONFIG_HWSPINLOCK=y
> > +CONFIG_HWSPINLOCK_QCOM=y
> > +CONFIG_ARM_MHU=y
> > +CONFIG_PLATFORM_MHU=y
> > +CONFIG_BCM2835_MBOX=y
> > +CONFIG_QCOM_APCS_IPC=y
> > +CONFIG_ROCKCHIP_IOMMU=y
> > +CONFIG_TEGRA_IOMMU_SMMU=y
> > +CONFIG_ARM_SMMU=y
> > +CONFIG_ARM_SMMU_V3=y
> > +CONFIG_QCOM_IOMMU=y
> > +CONFIG_RPMSG_QCOM_GLINK_RPM=y
> > +CONFIG_RPMSG_QCOM_SMD=y
> > +CONFIG_RASPBERRYPI_POWER=y
> > +CONFIG_QCOM_SMEM=y
> > +CONFIG_QCOM_SMD_RPM=y
> > +CONFIG_QCOM_SMP2P=y
> > +CONFIG_QCOM_SMSM=y
> > +CONFIG_ROCKCHIP_PM_DOMAINS=y
> > +CONFIG_ARCH_TEGRA_132_SOC=y
> > +CONFIG_ARCH_TEGRA_210_SOC=y
> > +CONFIG_ARCH_TEGRA_186_SOC=y
> > +CONFIG_ARCH_TEGRA_194_SOC=y
> > +CONFIG_ARCH_K3_AM6_SOC=y
> > +CONFIG_SOC_TI=y
> > +CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> > +CONFIG_EXTCON_USB_GPIO=y
> > +CONFIG_EXTCON_USBC_CROS_EC=y
> > +CONFIG_MEMORY=y
> > +CONFIG_IIO=y
> > +CONFIG_EXYNOS_ADC=y
> > +CONFIG_ROCKCHIP_SARADC=m
> > +CONFIG_IIO_CROS_EC_SENSORS_CORE=m
> > +CONFIG_IIO_CROS_EC_SENSORS=m
> > +CONFIG_IIO_CROS_EC_LIGHT_PROX=m
> > +CONFIG_IIO_CROS_EC_BARO=m
> > +CONFIG_PWM=y
> > +CONFIG_PWM_BCM2835=m
> > +CONFIG_PWM_CROS_EC=m
> > +CONFIG_PWM_MESON=m
> > +CONFIG_PWM_RCAR=m
> > +CONFIG_PWM_ROCKCHIP=y
> > +CONFIG_PWM_SAMSUNG=y
> > +CONFIG_PWM_TEGRA=m
> > +CONFIG_PHY_XGENE=y
> > +CONFIG_PHY_SUN4I_USB=y
> > +CONFIG_PHY_HI6220_USB=y
> > +CONFIG_PHY_HISTB_COMBPHY=y
> > +CONFIG_PHY_HISI_INNO_USB2=y
> > +CONFIG_PHY_MVEBU_CP110_COMPHY=y
> > +CONFIG_PHY_QCOM_QMP=m
> > +CONFIG_PHY_QCOM_USB_HS=y
> > +CONFIG_PHY_RCAR_GEN3_USB2=y
> > +CONFIG_PHY_RCAR_GEN3_USB3=m
> > +CONFIG_PHY_ROCKCHIP_EMMC=y
> > +CONFIG_PHY_ROCKCHIP_INNO_USB2=y
> > +CONFIG_PHY_ROCKCHIP_PCIE=m
> > +CONFIG_PHY_ROCKCHIP_TYPEC=y
> > +CONFIG_PHY_TEGRA_XUSB=y
> > +CONFIG_HISI_PMU=y
> > +CONFIG_QCOM_L2_PMU=y
> > +CONFIG_QCOM_L3_PMU=y
> > +CONFIG_ANDROID=y
> > +CONFIG_ANDROID_BINDER_IPC=y
> > +CONFIG_QCOM_QFPROM=y
> > +CONFIG_ROCKCHIP_EFUSE=y
> > +CONFIG_UNIPHIER_EFUSE=y
> > +CONFIG_MESON_EFUSE=m
> > +CONFIG_TEE=y
> > +CONFIG_OPTEE=y
> > +CONFIG_EXT2_FS=y
> > +CONFIG_EXT3_FS=y
> > +CONFIG_EXT4_FS_POSIX_ACL=y
> > +CONFIG_EXT4_FS_SECURITY=y
> > +CONFIG_EXT4_ENCRYPTION=y
> > +CONFIG_BTRFS_FS=m
> > +CONFIG_BTRFS_FS_POSIX_ACL=y
> > +CONFIG_F2FS_FS=y
> > +CONFIG_F2FS_FS_SECURITY=y
> > +CONFIG_F2FS_FS_ENCRYPTION=y
> > +CONFIG_FANOTIFY=y
> > +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
> > +CONFIG_QUOTA=y
> > +CONFIG_QFMT_V2=y
> > +CONFIG_AUTOFS4_FS=y
> > +CONFIG_FUSE_FS=y
> > +CONFIG_CUSE=m
> > +CONFIG_OVERLAY_FS=y
> > +CONFIG_MSDOS_FS=y
> > +CONFIG_VFAT_FS=y
> > +CONFIG_TMPFS_POSIX_ACL=y
> > +CONFIG_HUGETLBFS=y
> > +CONFIG_EFIVAR_FS=y
> > +CONFIG_SDCARD_FS=y
> > +CONFIG_SQUASHFS=y
> > +CONFIG_PSTORE_CONSOLE=y
> > +CONFIG_PSTORE_RAM=y
> > +CONFIG_9P_FS=y
> > +CONFIG_NLS_CODEPAGE_437=y
> > +CONFIG_NLS_ISO8859_1=y
> > +CONFIG_SECURITY_PERF_EVENTS_RESTRICT=y
> > +CONFIG_SECURITY=y
> > +CONFIG_SECURITY_NETWORK=y
> > +CONFIG_HARDENED_USERCOPY=y
> > +CONFIG_SECURITY_SELINUX=y
> > +CONFIG_CRYPTO_GCM=y
> > +CONFIG_CRYPTO_SHA512=y
> > +CONFIG_CRYPTO_ANSI_CPRNG=y
> > +CONFIG_PRINTK_TIME=y
> > +CONFIG_DEBUG_INFO=y
> > +CONFIG_MAGIC_SYSRQ=y
> > +CONFIG_PANIC_TIMEOUT=5
> > +CONFIG_SCHEDSTATS=y
> > +# CONFIG_DEBUG_PREEMPT is not set
> > +CONFIG_ENABLE_DEFAULT_TRACERS=y
> > +CONFIG_MEMTEST=y
> > diff --git
> > b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
> > new file mode 100644
> > index 0000000..96cc651
> > --- /dev/null
> > +++
> > b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
> > @@ -0,0 +1,368 @@
> > +From 6fd66138c44107786879d0adebe78ca94cf6292f Mon Sep 17 00:00:00 2001
> > +From: Liviu Dudau <Liviu.Dudau@arm.com>
> > +Date: Wed, 1 Apr 2020 12:10:14 +0100
> > +Subject: [PATCH 1/2] drm: Add component-aware simple encoder
> > +
> > +This is a simple DRM encoder that gets its connector timings information
> > +from a OF subnode in the device tree and exposes that as a "discovered"
> > +panel. It can be used together with component-based DRM drivers in an
> > +emulated environment where no real encoder or connector hardware exists
> > +and the display output is configured outside the kernel.
> > +
> > +Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > +[Backported to gem5's 4.3 kernel]
> > +Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> > +[Ported to gem5's 4.9 kernel. Added dep. on VIDEOMODE_HELPERS.]
> > +Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> > +[Ported to gem5's 4.14 kernel.]
> > +Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> > +Upstream-Status: Backport
> > +Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> > +---
> > + drivers/gpu/drm/Kconfig               |  10 ++
> > + drivers/gpu/drm/Makefile              |   3 +
> > + drivers/gpu/drm/drm_virtual_encoder.c | 297
> > ++++++++++++++++++++++++++++++++++
> > + 3 files changed, 310 insertions(+)
> > + create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
> > +
> > +diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > +index e44e567..6e95357 100644
> > +--- a/drivers/gpu/drm/Kconfig
> > ++++ b/drivers/gpu/drm/Kconfig
> > +@@ -255,6 +255,16 @@ config DRM_VKMS
> > +
> > +         If M is selected the module will be called vkms.
> > +
> > ++config DRM_VIRT_ENCODER
> > ++      tristate "Virtual OF-based encoder"
> > ++      depends on DRM && OF
> > ++      select VIDEOMODE_HELPERS
> > ++      help
> > ++        Choose this option to get a virtual encoder and its associated
> > ++        connector that will use the device tree to read the display
> > ++        timings information. If M is selected the module will be called
> > ++        drm_vencoder.
> > ++
> > + source "drivers/gpu/drm/exynos/Kconfig"
> > +
> > + source "drivers/gpu/drm/rockchip/Kconfig"
> > +diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > +index a6771ce..733ad62 100644
> > +--- a/drivers/gpu/drm/Makefile
> > ++++ b/drivers/gpu/drm/Makefile
> > +@@ -46,6 +46,9 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
> > + obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
> > + obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
> > +
> > ++drm_vencoder-y := drm_virtual_encoder.o
> > ++obj-$(CONFIG_DRM_VIRT_ENCODER) += drm_vencoder.o
> > ++
> > + obj-$(CONFIG_DRM)     += drm.o
> > + obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
> > + obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> > +diff --git a/drivers/gpu/drm/drm_virtual_encoder.c
> > b/drivers/gpu/drm/drm_virtual_encoder.c
> > +new file mode 100644
> > +index 00000000..2e2c51d
> > +--- /dev/null
> > ++++ b/drivers/gpu/drm/drm_virtual_encoder.c
> > +@@ -0,0 +1,297 @@
> > ++/*
> > ++ * Copyright (C) 2016 ARM Limited
> > ++ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
> > ++ *
> > ++ * Dummy encoder and connector that use the OF to "discover" the attached
> > ++ * display timings. Can be used in situations where the encoder and
> > connector's
> > ++ * functionality are emulated and no setup steps are needed, or to describe
> > ++ * attached panels for which no driver exists but can be used without
> > ++ * additional hardware setup.
> > ++ *
> > ++ * The encoder also uses the component framework so that it can be a quick
> > ++ * replacement for existing drivers when testing in an emulated environment.
> > ++ *
> > ++ * This file is subject to the terms and conditions of the GNU General
> > Public
> > ++ * License.  See the file COPYING in the main directory of this archive
> > ++ * for more details.
> > ++ *
> > ++ */
> > ++
> > ++#include <drm/drmP.h>
> > ++#include <drm/drm_crtc.h>
> > ++#include <drm/drm_atomic_helper.h>
> > ++#include <drm/drm_crtc_helper.h>
> > ++#include <drm/drm_of.h>
> > ++#include <linux/component.h>
> > ++#include <video/display_timing.h>
> > ++#include <video/of_display_timing.h>
> > ++#include <video/videomode.h>
> > ++
> > ++struct drm_virt_priv {
> > ++      struct drm_connector connector;
> > ++      struct drm_encoder encoder;
> > ++      struct display_timings *timings;
> > ++};
> > ++
> > ++#define connector_to_drm_virt_priv(x) \
> > ++      container_of(x, struct drm_virt_priv, connector)
> > ++
> > ++#define encoder_to_drm_virt_priv(x) \
> > ++      container_of(x, struct drm_virt_priv, encoder)
> > ++
> > ++static void drm_virtcon_destroy(struct drm_connector *connector)
> > ++{
> > ++      struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
> > ++
> > ++      drm_connector_cleanup(connector);
> > ++      display_timings_release(conn->timings);
> > ++}
> > ++
> > ++static enum drm_connector_status
> > ++drm_virtcon_detect(struct drm_connector *connector, bool force)
> > ++{
> > ++      return connector_status_connected;
> > ++}
> > ++
> > ++static const struct drm_connector_funcs drm_virtcon_funcs = {
> > ++      .reset = drm_atomic_helper_connector_reset,
> > ++      .detect = drm_virtcon_detect,
> > ++      .fill_modes = drm_helper_probe_single_connector_modes,
> > ++      .destroy = drm_virtcon_destroy,
> > ++      .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > ++      .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > ++};
> > ++
> > ++static int drm_virtcon_get_modes(struct drm_connector *connector)
> > ++{
> > ++      struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
> > ++      struct display_timings *timings = conn->timings;
> > ++      int i;
> > ++
> > ++      for (i = 0; i < timings->num_timings; i++) {
> > ++              struct drm_display_mode *mode =
> > drm_mode_create(connector->dev);
> > ++              struct videomode vm;
> > ++
> > ++              if (videomode_from_timings(timings, &vm, i))
> > ++                      break;
> > ++
> > ++              drm_display_mode_from_videomode(&vm, mode);
> > ++              mode->type = DRM_MODE_TYPE_DRIVER;
> > ++              if (timings->native_mode == i)
> > ++                      mode->type = DRM_MODE_TYPE_PREFERRED;
> > ++
> > ++              drm_mode_set_name(mode);
> > ++              drm_mode_probed_add(connector, mode);
> > ++      }
> > ++
> > ++      return i;
> > ++}
> > ++
> > ++static int drm_virtcon_mode_valid(struct drm_connector *connector,
> > ++                                 struct drm_display_mode *mode)
> > ++{
> > ++      return MODE_OK;
> > ++}
> > ++
> > ++struct drm_encoder *drm_virtcon_best_encoder(struct drm_connector
> > *connector)
> > ++{
> > ++      struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
> > ++
> > ++      return &priv->encoder;
> > ++}
> > ++
> > ++struct drm_encoder *
> > ++drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
> > ++                               struct drm_connector_state *connector_state)
> > ++{
> > ++      struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
> > ++
> > ++      return &priv->encoder;
> > ++}
> > ++
> > ++static const struct drm_connector_helper_funcs drm_virtcon_helper_funcs = {
> > ++      .get_modes = drm_virtcon_get_modes,
> > ++      .mode_valid = drm_virtcon_mode_valid,
> > ++      .best_encoder = drm_virtcon_best_encoder,
> > ++      .atomic_best_encoder = drm_virtcon_atomic_best_encoder,
> > ++};
> > ++
> > ++static void drm_vencoder_destroy(struct drm_encoder *encoder)
> > ++{
> > ++      drm_encoder_cleanup(encoder);
> > ++}
> > ++
> > ++static const struct drm_encoder_funcs drm_vencoder_funcs = {
> > ++      .destroy = drm_vencoder_destroy,
> > ++};
> > ++
> > ++static void drm_vencoder_dpms(struct drm_encoder *encoder, int mode)
> > ++{
> > ++      /* nothing needed */
> > ++}
> > ++
> > ++static bool drm_vencoder_mode_fixup(struct drm_encoder *encoder,
> > ++                                  const struct drm_display_mode *mode,
> > ++                                  struct drm_display_mode *adjusted_mode)
> > ++{
> > ++      /* nothing needed */
> > ++      return true;
> > ++}
> > ++
> > ++static void drm_vencoder_prepare(struct drm_encoder *encoder)
> > ++{
> > ++      drm_vencoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> > ++}
> > ++
> > ++static void drm_vencoder_commit(struct drm_encoder *encoder)
> > ++{
> > ++      drm_vencoder_dpms(encoder, DRM_MODE_DPMS_ON);
> > ++}
> > ++
> > ++static void drm_vencoder_mode_set(struct drm_encoder *encoder,
> > ++                                struct drm_display_mode *mode,
> > ++                                struct drm_display_mode *adjusted_mode)
> > ++{
> > ++      /* nothing needed */
> > ++}
> > ++
> > ++static const struct drm_encoder_helper_funcs drm_vencoder_helper_funcs = {
> > ++      .dpms           = drm_vencoder_dpms,
> > ++      .mode_fixup     = drm_vencoder_mode_fixup,
> > ++      .prepare        = drm_vencoder_prepare,
> > ++      .commit         = drm_vencoder_commit,
> > ++      .mode_set       = drm_vencoder_mode_set,
> > ++};
> > ++
> > ++static int drm_vencoder_bind(struct device *dev, struct device *master,
> > ++                           void *data)
> > ++{
> > ++      struct drm_encoder *encoder;
> > ++      struct drm_virt_priv *con;
> > ++      struct drm_connector *connector;
> > ++      struct drm_device *drm = data;
> > ++      u32 crtcs = 0;
> > ++      int ret;
> > ++
> > ++      con = devm_kzalloc(dev, sizeof(*con), GFP_KERNEL);
> > ++      if (!con)
> > ++              return -ENOMEM;
> > ++
> > ++      dev_set_drvdata(dev, con);
> > ++      connector = &con->connector;
> > ++      encoder = &con->encoder;
> > ++
> > ++      if (dev->of_node) {
> > ++              struct drm_bridge *bridge;
> > ++              crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> > ++              bridge = of_drm_find_bridge(dev->of_node);
> > ++              if (bridge) {
> > ++                      ret = drm_bridge_attach(encoder, bridge, NULL);
> > ++                      if (ret) {
> > ++                              DRM_ERROR("Failed to initialize bridge\n");
> > ++                              return ret;
> > ++                      }
> > ++              }
> > ++              con->timings = of_get_display_timings(dev->of_node);
> > ++              if (!con->timings) {
> > ++                      dev_err(dev, "failed to get display panel timings\n");
> > ++                      return ENXIO;
> > ++              }
> > ++      }
> > ++
> > ++      /* If no CRTCs were found, fall back to the old encoder's behaviour */
> > ++      if (crtcs == 0) {
> > ++              dev_warn(dev, "Falling back to first CRTC\n");
> > ++              crtcs = 1 << 0;
> > ++      }
> > ++
> > ++      encoder->possible_crtcs = crtcs ? crtcs : 1;
> > ++      encoder->possible_clones = 0;
> > ++
> > ++      ret = drm_encoder_init(drm, encoder, &drm_vencoder_funcs,
> > ++                             DRM_MODE_ENCODER_VIRTUAL, NULL);
> > ++      if (ret)
> > ++              goto encoder_init_err;
> > ++
> > ++      drm_encoder_helper_add(encoder, &drm_vencoder_helper_funcs);
> > ++
> > ++      /* bogus values, pretend we're a 24" screen for DPI calculations */
> > ++      connector->display_info.width_mm = 519;
> > ++      connector->display_info.height_mm = 324;
> > ++      connector->interlace_allowed = false;
> > ++      connector->doublescan_allowed = false;
> > ++      connector->polled = 0;
> > ++
> > ++      ret = drm_connector_init(drm, connector, &drm_virtcon_funcs,
> > ++                               DRM_MODE_CONNECTOR_VIRTUAL);
> > ++      if (ret)
> > ++              goto connector_init_err;
> > ++
> > ++      drm_connector_helper_add(connector, &drm_virtcon_helper_funcs);
> > ++
> > ++      drm_connector_register(connector);
> > ++
> > ++      ret = drm_connector_attach_encoder(connector, encoder);
> > ++      if (ret)
> > ++              goto attach_err;
> > ++
> > ++      return ret;
> > ++
> > ++attach_err:
> > ++      drm_connector_unregister(connector);
> > ++      drm_connector_cleanup(connector);
> > ++connector_init_err:
> > ++      drm_encoder_cleanup(encoder);
> > ++encoder_init_err:
> > ++      display_timings_release(con->timings);
> > ++
> > ++      return ret;
> > ++};
> > ++
> > ++static void drm_vencoder_unbind(struct device *dev, struct device *master,
> > ++                              void *data)
> > ++{
> > ++      struct drm_virt_priv *con = dev_get_drvdata(dev);
> > ++
> > ++      drm_connector_unregister(&con->connector);
> > ++      drm_connector_cleanup(&con->connector);
> > ++      drm_encoder_cleanup(&con->encoder);
> > ++      display_timings_release(con->timings);
> > ++}
> > ++
> > ++static const struct component_ops drm_vencoder_ops = {
> > ++      .bind = drm_vencoder_bind,
> > ++      .unbind = drm_vencoder_unbind,
> > ++};
> > ++
> > ++static int drm_vencoder_probe(struct platform_device *pdev)
> > ++{
> > ++      return component_add(&pdev->dev, &drm_vencoder_ops);
> > ++}
> > ++
> > ++static int drm_vencoder_remove(struct platform_device *pdev)
> > ++{
> > ++      component_del(&pdev->dev, &drm_vencoder_ops);
> > ++      return 0;
> > ++}
> > ++
> > ++static const struct of_device_id drm_vencoder_of_match[] = {
> > ++      { .compatible = "drm,virtual-encoder", },
> > ++      {},
> > ++};
> > ++MODULE_DEVICE_TABLE(of, drm_vencoder_of_match);
> > ++
> > ++static struct platform_driver drm_vencoder_driver = {
> > ++      .probe = drm_vencoder_probe,
> > ++      .remove = drm_vencoder_remove,
> > ++      .driver = {
> > ++              .name = "drm_vencoder",
> > ++              .of_match_table = drm_vencoder_of_match,
> > ++      },
> > ++};
> > ++
> > ++module_platform_driver(drm_vencoder_driver);
> > ++
> > ++MODULE_AUTHOR("Liviu Dudau");
> > ++MODULE_DESCRIPTION("Virtual DRM Encoder");
> > ++MODULE_LICENSE("GPL v2");
> > +--
> > +2.7.4
> > +
> > diff --git
> > b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> > new file mode 100644
> > index 0000000..621209f
> > --- /dev/null
> > +++
> > b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> > @@ -0,0 +1,43 @@
> > +From 064807d22a0a2865a930d4cc48b61f917f4bf15f Mon Sep 17 00:00:00 2001
> > +From: Anders Dellien <anders.dellien@arm.com>
> > +Date: Fri, 17 Apr 2020 16:06:03 +0100
> > +Subject: [PATCH 2/2] swap red and blue colors in HDLCD driver
> > +
> > +The HDLCD drivers is configured to use BGR888 but Android needs
> > +RGB888 - so we need to swap the red and blue components.
> > +
> > +Change-Id: Ib47ddff9280a53757925f6c1b1f373089d038025
> > +Signed-off-by: Anders Dellien<anders.dellien@arm.com>
> > +Upstream-Status: Inappropriate [Color swap needed for TC0 only]
> > +Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> > +---
> > + drivers/gpu/drm/arm/hdlcd_crtc.c | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c
> > b/drivers/gpu/drm/arm/hdlcd_crtc.c
> > +index e69d996..a46ba4f 100644
> > +--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> > ++++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> > +@@ -110,15 +110,15 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
> > +        * pixel is outside the visible frame area or when there is a
> > +        * buffer underrun.
> > +        */
> > +-      hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->red.offset |
> > ++      hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->blue.offset |
> > + #ifdef CONFIG_DRM_HDLCD_SHOW_UNDERRUN
> > +                   0x00ff0000 |        /* show underruns in red */
> > + #endif
> > +-                  ((format->red.length & 0xf) << 8));
> > ++                  ((format->blue.length & 0xf) << 8));
> > +       hdlcd_write(hdlcd, HDLCD_REG_GREEN_SELECT, format->green.offset |
> > +                   ((format->green.length & 0xf) << 8));
> > +-      hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->blue.offset |
> > +-                  ((format->blue.length & 0xf) << 8));
> > ++      hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->red.offset |
> > ++                  ((format->red.length & 0xf) << 8));
> > +
> > +       return 0;
> > + }
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
> > b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
> > new file mode 100644
> > index 0000000..a8fe6ff
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
> > @@ -0,0 +1,15 @@
> > +#
> > +# TC0 MACHINE specific configurations
> > +#
> > +
> > +FILESEXTRAPATHS_prepend :=
> > "${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:"
> > +
> > +SRC_URI_append = " \
> > +    file://defconfig \
> > +    file://0001-drm-Add-component-aware-simple-encoder.patch \
> > +    file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
> > +    "
> > +
> > +KCONFIG_MODE = "--alldefconfig"
> > +
> > +COMPATIBLE_MACHINE = "tc0"
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> > b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> > new file mode 100644
> > index 0000000..4df4831
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> > @@ -0,0 +1,6 @@
> > +# Machine specific configurations
> > +
> > +MACHINE_ACK_REQUIRE ?= ""
> > +MACHINE_ACK_REQUIRE_tc0 = "linux-arm64-ack-tc0.inc"
> > +
> > +require ${MACHINE_ACK_REQUIRE}
> > --
> > 2.17.1
> > 
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> > confidential and may also be privileged. If you are not the intended
> > recipient, please notify the sender immediately and do not disclose the
> > contents to any other person, use it for any purpose, or store or copy the
> > information in any medium. Thank you.
> >

> 

