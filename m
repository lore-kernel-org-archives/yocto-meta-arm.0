Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.3507.1596227470790803431
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 13:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MPiaMsV2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id t23so20835096qto.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZHdL0Vx/wuUDqTRdwaaywAa1cFw0qLW4QZA9szqR40k=;
        b=MPiaMsV26i47pB48BaSjuUbZUXrWYeXhVCM5tfx+V/rkGnnK0a6M9f7MMYIMrYMPpO
         1J3FIMq7yLlpiRpEAI9llCJ8WpIy2Bsw6gpWfGiNPSpB1hhCTG42etHW+ALC6Enh4ikk
         nOXYRjkA7zAtMlv+cFsOsr+EH7y+eRT1sm9p7tultfTjqSzX/f8PzXMCNenuE/Rlctmb
         bH1P4BnNFXepLyrpY6gO/dmVhvROTRAJnE+QP+1PZJxqsrNNh7vKk67ku/fx8hIK/zPl
         5KL2jarum/9fV1OsjqQ4M9YfOYBCJwKGOpEDKTxYsgoSBHG3DuuJsR/2lGAD9X2TKlHD
         RYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZHdL0Vx/wuUDqTRdwaaywAa1cFw0qLW4QZA9szqR40k=;
        b=GqclB/7Vim6qbgAkFGcRoEjBJ4U2iaUfzI8BSa/ZMSXlp9tuSc0AYDyM15YLBqIJzT
         piqOkaj11bBHSfHZdfXt6ZQezWZLs74MUxIj5u7aziTqgpSIzh5Rpe5dHDQBrUQGkU3i
         oMtSHiTB2ah0FFoYONIgPZFuSTIFJaycXuQSV4UnYkRQRp342NFYtQzTupOwvmox//f+
         lprKBcngtIrx8jalsE3qU37f6bbrMJXhuPXAbIJrjyjMph+HTnkfWdK8W/8aCMFKCmi9
         GrQwYxhfUg/C03DaOdERfBM3yv3khtWVL4dv4McV4H0IHU481bH6DYInAxfck+E9Z3md
         31vQ==
X-Gm-Message-State: AOAM5308mB0OYzB02KJPNbFBsUFB7kE1WGfqh6lMPXhS9JrRcEDsFAML
	oR8oCCGLWxwgSCQdQT/D8b8qEg==
X-Google-Smtp-Source: ABdhPJyclqkTOAQ8TWo7QgbSYaeoUxJkSpcmRB/E4MAZvvMQTlmczZ1tERA6tXL/JLhTDUkfXOuAPQ==
X-Received: by 2002:ac8:7a66:: with SMTP id w6mr5646081qtt.242.1596227469568;
        Fri, 31 Jul 2020 13:31:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:ad65:cfb8:9c11:f25c])
        by smtp.gmail.com with ESMTPSA id r48sm11222493qtr.17.2020.07.31.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:31:09 -0700 (PDT)
Date: Fri, 31 Jul 2020 16:31:07 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp/u-boot: Add support for 32-bit FVP BASE machine
Message-ID: <20200731203106.GB11578@kudzu.us>
References: <20200731183538.40948-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200731183538.40948-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series does not compile

ERROR: linux-yocto-5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0 do_patch: Could not apply patches for fvp-arm32.
ERROR: linux-yocto-5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0 do_patch: Patch failures can be resolved in the linux source directory /home/jdm/yocto/poky/build/tmp/work-shared/fvp-base-arm32/kernel-source)
ERROR: linux-yocto-5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0 do_patch: Execution of '/home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0/temp/run.do_patch.26941' failed with exit code 1:
(1/2) 0001-ARM-vexpress-enable-GICv3.patch
[INFO]: check of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not pass, trying reduced context.
[INFO]: Context reduced git-am of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not work, trying "apply".
error: patch failed: arch/arm/mach-vexpress/Kconfig:4
error: arch/arm/mach-vexpress/Kconfig: patch does not apply
[ERROR]: Application of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch failed.
         Patch needs to be refreshed. Sample resolution script:
             .git/rebase-apply/resolve_rejects
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0/temp/log.do_patch.26941
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/jdm/yocto/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/jdm/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/jdm/yocto/poky/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['patch-native', 'quilt-native', 'kern-tools-native', 'gnu-config-native', 'autoconf-native', 'automake-native', 'libtool-native', 'attr-native', 'm4-native', 'texinfo-dummy-native', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_patch
| (1/2) 0001-ARM-vexpress-enable-GICv3.patch
| [INFO]: check of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not pass, trying reduced context.
| [INFO]: Context reduced git-am of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not work, trying "apply".
| error: patch failed: arch/arm/mach-vexpress/Kconfig:4
| error: arch/arm/mach-vexpress/Kconfig: patch does not apply
| [ERROR]: Application of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch failed.
|          Patch needs to be refreshed. Sample resolution script:
|              .git/rebase-apply/resolve_rejects
| ERROR: Could not apply patches for fvp-arm32.
| ERROR: Patch failures can be resolved in the linux source directory /home/jdm/yocto/poky/build/tmp/work-shared/fvp-base-arm32/kernel-source)
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0/temp/run.do_patch.26941' failed with exit code 1:
| (1/2) 0001-ARM-vexpress-enable-GICv3.patch
| [INFO]: check of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not pass, trying reduced context.
| [INFO]: Context reduced git-am of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not work, trying "apply".
| error: patch failed: arch/arm/mach-vexpress/Kconfig:4
| error: arch/arm/mach-vexpress/Kconfig: patch does not apply
| [ERROR]: Application of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch failed.
|          Patch needs to be refreshed. Sample resolution script:
|              .git/rebase-apply/resolve_rejects
| WARNING: exit code 1 from a shell command.
|
ERROR: Task (/home/jdm/yocto/poky/meta/recipes-kernel/linux/linux-yocto_5.4.bb:do_patch) failed with exit code '1'


Please fix the issue and push a v2.

Thanks,
Jon


On Fri, Jul 31, 2020 at 07:35:36PM +0100, Anders Dellien wrote:
> Change-Id: I48ec5607c216b1c15d2fedc1375f3f0a914c9937
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> ---
>  ...-Add-vexpress_aemv8a_aarch32-variant.patch | 181 ++++++++++++++++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   5 +
>  2 files changed, 186 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> new file mode 100644
> index 0000000..712f7f0
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> @@ -0,0 +1,181 @@
> +From d627bdf9b11964b694aaf464c5c88ad9b339f03f Mon Sep 17 00:00:00 2001
> +From: Anders Dellien <anders.dellien@arm.com>
> +Date: Thu, 23 Jul 2020 17:32:55 +0100
> +Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
> +
> +The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
> +support is enable per-CPU when launching the model, eg:
> +
> +-C cluster0.cpu0.CONFIG64=0
> +
> +This patch adds a new defconfig and some variant specific selections in
> +vexpress_armv8a.h.
> +
> +This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
> +
> +Upstream-status: Denied
> +
> +For upstream discussion, please visit
> +https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
> +
> +Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
> +Signed-off-by: Asha R <asha.r@arm.com>
> +Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> +---
> + arch/arm/Kconfig                          |  5 +++
> + board/armltd/vexpress64/Kconfig           |  2 +-
> + configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
> + include/configs/vexpress_aemv8a.h         | 28 +++++++++++-----
> + 4 files changed, 65 insertions(+), 10 deletions(-)
> + create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
> +
> +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> +index 36c9c2fecd..99972cdf65 100644
> +--- a/arch/arm/Kconfig
> ++++ b/arch/arm/Kconfig
> +@@ -1088,6 +1088,11 @@ config TARGET_VEXPRESS64_BASE_FVP
> +       select PL01X_SERIAL
> +       select SEMIHOSTING
> +
> ++config TARGET_VEXPRESS64_BASE_FVP_AARCH32
> ++        bool "Support Versatile Express ARMv8a 32-bit FVP BASE model"
> ++        select CPU_V7A
> ++        select SEMIHOSTING
> ++
> + config TARGET_VEXPRESS64_JUNO
> +       bool "Support Versatile Express Juno Development Platform"
> +       select ARM64
> +diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
> +index 9014418433..75545e9ea1 100644
> +--- a/board/armltd/vexpress64/Kconfig
> ++++ b/board/armltd/vexpress64/Kconfig
> +@@ -1,4 +1,4 @@
> +-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
> ++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_VEXPRESS64_BASE_FVP_AARCH32
> +
> + config SYS_BOARD
> +       default "vexpress64"
> +diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
> +new file mode 100644
> +index 0000000000..cf1e8d5cae
> +--- /dev/null
> ++++ b/configs/vexpress_aemv8a_aarch32_defconfig
> +@@ -0,0 +1,40 @@
> ++CONFIG_ARM=y
> ++CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=y
> ++CONFIG_SYS_MALLOC_F_LEN=0x2000
> ++CONFIG_IDENT_STRING=" vexpress_aemv8a fvp aarch32"
> ++CONFIG_BOOTDELAY=1
> ++CONFIG_SYS_TEXT_BASE=0x88000000
> ++CONFIG_USE_BOOTARGS=y
> ++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda2 rw androidboot.hardware=fvpbase rootwait loglevel=9"
> ++# CONFIG_DISPLAY_CPUINFO is not set
> ++# CONFIG_DISPLAY_BOARDINFO is not set
> ++CONFIG_HUSH_PARSER=y
> ++CONFIG_SYS_PROMPT="fvp32# "
> ++CONFIG_CMD_BOOTZ=y
> ++# CONFIG_CMD_CONSOLE is not set
> ++# CONFIG_CMD_IMLS is not set
> ++# CONFIG_CMD_XIMG is not set
> ++# CONFIG_CMD_EDITENV is not set
> ++# CONFIG_CMD_ENV_EXISTS is not set
> ++CONFIG_CMD_MEMTEST=y
> ++CONFIG_MTD_NOR_FLASH=y
> ++# CONFIG_CMD_LOADS is not set
> ++CONFIG_CMD_ARMFLASH=y
> ++# CONFIG_CMD_FPGA is not set
> ++# CONFIG_CMD_ITEST is not set
> ++# CONFIG_CMD_SETEXPR is not set
> ++CONFIG_CMD_DHCP=y
> ++# CONFIG_CMD_NFS is not set
> ++CONFIG_CMD_MII=y
> ++CONFIG_CMD_PING=y
> ++CONFIG_CMD_CACHE=y
> ++# CONFIG_CMD_MISC is not set
> ++CONFIG_CMD_FAT=y
> ++CONFIG_DM=y
> ++CONFIG_DM_SERIAL=y
> ++CONFIG_OF_LIBFDT=y
> ++CONFIG_FLASH_CFI_DRIVER=y
> ++CONFIG_SYS_FLASH_CFI=y
> ++CONFIG_SYS_ARCH_TIMER=y
> ++CONFIG_DM_SERIAL=y
> ++CONFIG_PL01X_SERIAL=y
> +diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> +index 9a9cec414c..cf0e4a951c 100644
> +--- a/include/configs/vexpress_aemv8a.h
> ++++ b/include/configs/vexpress_aemv8a.h
> +@@ -7,7 +7,8 @@
> + #ifndef __VEXPRESS_AEMV8A_H
> + #define __VEXPRESS_AEMV8A_H
> +
> +-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> ++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> + #ifndef CONFIG_SEMIHOSTING
> + #error CONFIG_TARGET_VEXPRESS64_BASE_FVP requires CONFIG_SEMIHOSTING
> + #endif
> +@@ -15,8 +16,17 @@
> +
> + #define CONFIG_REMAKE_ELF
> +
> ++#ifdef CONFIG_ARM64
> ++#define HIGH_ADDR                       "0xffffffffffffffff"
> ++#define BOOT_TYPE                       "booti"
> ++#else
> ++#define HIGH_ADDR                       "0xffffffff"
> ++#define BOOT_TYPE                       "bootz"
> ++#endif
> ++
> + /* Link Definitions */
> +-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> ++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> + /* ATF loads u-boot here for BASE_FVP model */
> + #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
> + #elif CONFIG_TARGET_VEXPRESS64_JUNO
> +@@ -82,7 +92,8 @@
> + #define GICR_BASE                     (0x2f100000)
> + #else
> +
> +-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> ++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> + #define GICD_BASE                     (0x2f000000)
> + #define GICC_BASE                     (0x2c000000)
> + #elif CONFIG_TARGET_VEXPRESS64_JUNO
> +@@ -169,7 +180,8 @@
> +                               "booti ${kernel_addr} ${initrd_param} ${fdt_addr}"
> +
> +
> +-#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
> ++#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> + #define CONFIG_EXTRA_ENV_SETTINGS     \
> +                               "kernel_name=Image\0"           \
> +                               "kernel_addr=0x80080000\0"      \
> +@@ -177,8 +189,8 @@
> +                               "initrd_addr=0x88000000\0"      \
> +                               "fdtfile=devtree.dtb\0"         \
> +                               "fdt_addr=0x83000000\0"         \
> +-                              "fdt_high=0xffffffffffffffff\0" \
> +-                              "initrd_high=0xffffffffffffffff\0"
> ++                              "fdt_high=" HIGH_ADDR "\0"      \
> ++                              "initrd_high=" HIGH_ADDR "\0"
> +
> + #define CONFIG_BOOTCOMMAND    "smhload ${kernel_name} ${kernel_addr}; " \
> +                               "smhload ${fdtfile} ${fdt_addr}; " \
> +@@ -186,9 +198,7 @@
> +                               "initrd_end; " \
> +                               "fdt addr ${fdt_addr}; fdt resize; " \
> +                               "fdt chosen ${initrd_addr} ${initrd_end}; " \
> +-                              "booti $kernel_addr - $fdt_addr"
> +-
> +-
> ++                              BOOT_TYPE " $kernel_addr - $fdt_addr"
> + #endif
> +
> + /* Monitor Command Prompt */
> +--
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index 966f040..5ab505b 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -21,6 +21,11 @@ SRC_URI_append_foundation-armv8 = " file://u-boot_vexpress_fvp.patch"
>  #
>  SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
> 
> +#
> +# FVP BASE ARM32 KMACHINE
> +#
> +SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
> +
>  #
>  # Juno KMACHINE
>  #
> --
> 2.17.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 

