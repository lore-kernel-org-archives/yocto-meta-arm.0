Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.1582.1596597737446800169
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 20:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=jqS0Kik9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id x6so14302147qvr.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 04 Aug 2020 20:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3vOeBOy42hR//Ygv3j75dTzjZ4bQMSdbWGheie8Ozfg=;
        b=jqS0Kik9J80sse6XfI4MIoZwSgUnPWj79ZXxqLsCx0iUu0PiUpmEf8AxfV8rzlM0Uj
         xDwNaoZ7cRazi1Ns56o/x34L7h5ph3oRUUAJrJFuuz/PqLc8iarSPhCgziT7sjnVinhB
         q1TAlTeSO0VWa96qBhcnT9dASc7YVqgTi7USk4762vn5nFbKc2J1/TRhsmr5QxWD3uCV
         MCpijdiPuqkAvueEiRcIJ3baorV0jrzu/HQdrH4WdVDmygmM6hEbH0IY0D+YrFW50s/J
         KqJb0C+lYeD5sJpl2yUfT0H1+SpZ2Yx6zFXYF8lExAmcCsWc1guR7W8OpMCixhpLz21e
         XLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3vOeBOy42hR//Ygv3j75dTzjZ4bQMSdbWGheie8Ozfg=;
        b=b+HMoL40O1P0oLuZIBsM2e+CbiDPpoSvEohFIIoZw61wWoAWARhmnxVrwSeemsbZ+t
         +fPAP/MhA24DoscgD+q3mKsMuvSYx+dPdrn5fR/cEvydZ/D7X0BO5TY9+6BVVhI+I//F
         K+DfYoY4FgCCI7ViMm2Msg0H3cg73p0J6bo2Ne8myZHmPy8FGMUaeiXbo3x6ZP1C35hR
         kts4MUbd2G9qjAZ5va4Cb55TZ7OVUmRN7m9M2roVix11ke28GxDpB3eWHBlW3dnGZoRm
         NknvElz/9r0mrWVBy86RXChhzGAZ+C5Fv/1ugJ7ZgXkk18NIj+TTCBxkwHR718Ig1Sk8
         jynQ==
X-Gm-Message-State: AOAM531z3f4rz8tibR5SdAU4d70tpV2UIB9dPlXrvMRBo0kuWm6WCWJQ
	xk1JWUk6R3l/GkAWPCr2IbyiU/Qd1rVy/A==
X-Google-Smtp-Source: ABdhPJwm9pPDhGA3PznJSzhBTgainYbBN4VuIkEiKRrFsOT5HzMA9NSX2Hi4N7xiDHJVPlnfy4Jzaw==
X-Received: by 2002:ad4:442d:: with SMTP id e13mr1609733qvt.81.1596597736339;
        Tue, 04 Aug 2020 20:22:16 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e9de:404c:ff0a:90e8])
        by smtp.gmail.com with ESMTPSA id n4sm904141qtr.73.2020.08.04.20.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 20:22:15 -0700 (PDT)
Date: Tue, 4 Aug 2020 23:22:14 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp/u-boot: Add support for 32-bit FVP BASE machine
Message-ID: <20200805032213.GA22376@kudzu.us>
References: <20200731183538.40948-1-anders.dellien@arm.com>
 <1626F06D919518FE.7716@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1626F06D919518FE.7716@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 04:31:07PM -0400, Jon Mason via lists.yoctoproject.org wrote:
> This series does not compile
> 
> ERROR: linux-yocto-5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0 do_patch: Could not apply patches for fvp-arm32.
> ERROR: linux-yocto-5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0 do_patch: Patch failures can be resolved in the linux source directory /home/jdm/yocto/poky/build/tmp/work-shared/fvp-base-arm32/kernel-source)
> ERROR: linux-yocto-5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0 do_patch: Execution of '/home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0/temp/run.do_patch.26941' failed with exit code 1:
> (1/2) 0001-ARM-vexpress-enable-GICv3.patch
> [INFO]: check of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not pass, trying reduced context.
> [INFO]: Context reduced git-am of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not work, trying "apply".
> error: patch failed: arch/arm/mach-vexpress/Kconfig:4
> error: arch/arm/mach-vexpress/Kconfig: patch does not apply
> [ERROR]: Application of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch failed.
>          Patch needs to be refreshed. Sample resolution script:
>              .git/rebase-apply/resolve_rejects
> WARNING: exit code 1 from a shell command.
> 
> ERROR: Logfile of failure stored in: /home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0/temp/log.do_patch.26941
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['virtual:native:/home/jdm/yocto/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/jdm/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/jdm/yocto/poky/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['patch-native', 'quilt-native', 'kern-tools-native', 'gnu-config-native', 'autoconf-native', 'automake-native', 'libtool-native', 'attr-native', 'm4-native', 'texinfo-dummy-native', 'gettext-minimal-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_patch
> | (1/2) 0001-ARM-vexpress-enable-GICv3.patch
> | [INFO]: check of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not pass, trying reduced context.
> | [INFO]: Context reduced git-am of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not work, trying "apply".
> | error: patch failed: arch/arm/mach-vexpress/Kconfig:4
> | error: arch/arm/mach-vexpress/Kconfig: patch does not apply
> | [ERROR]: Application of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch failed.
> |          Patch needs to be refreshed. Sample resolution script:
> |              .git/rebase-apply/resolve_rejects
> | ERROR: Could not apply patches for fvp-arm32.
> | ERROR: Patch failures can be resolved in the linux source directory /home/jdm/yocto/poky/build/tmp/work-shared/fvp-base-arm32/kernel-source)
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of '/home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.51+gitAUTOINC+caafbdfe38_fed60f1c8e-r0/temp/run.do_patch.26941' failed with exit code 1:
> | (1/2) 0001-ARM-vexpress-enable-GICv3.patch
> | [INFO]: check of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not pass, trying reduced context.
> | [INFO]: Context reduced git-am of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch with "git am" did not work, trying "apply".
> | error: patch failed: arch/arm/mach-vexpress/Kconfig:4
> | error: arch/arm/mach-vexpress/Kconfig: patch does not apply
> | [ERROR]: Application of .kernel-meta//patches//bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch failed.
> |          Patch needs to be refreshed. Sample resolution script:
> |              .git/rebase-apply/resolve_rejects
> | WARNING: exit code 1 from a shell command.
> |
> ERROR: Task (/home/jdm/yocto/poky/meta/recipes-kernel/linux/linux-yocto_5.4.bb:do_patch) failed with exit code '1'
> 
> 
> Please fix the issue and push a v2.
> 
> Thanks,
> Jon

Per an offline discussion, this seems to be resulting from a SMTP
issue.  After pulling the patches from an internal git server, I can
confirm everything is building.  So, applying to master.

Thanks,
Jon

> 
> 
> On Fri, Jul 31, 2020 at 07:35:36PM +0100, Anders Dellien wrote:
> > Change-Id: I48ec5607c216b1c15d2fedc1375f3f0a914c9937
> > Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> > ---
> >  ...-Add-vexpress_aemv8a_aarch32-variant.patch | 181 ++++++++++++++++++
> >  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   5 +
> >  2 files changed, 186 insertions(+)
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> > 
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> > new file mode 100644
> > index 0000000..712f7f0
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> > @@ -0,0 +1,181 @@
> > +From d627bdf9b11964b694aaf464c5c88ad9b339f03f Mon Sep 17 00:00:00 2001
> > +From: Anders Dellien <anders.dellien@arm.com>
> > +Date: Thu, 23 Jul 2020 17:32:55 +0100
> > +Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
> > +
> > +The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
> > +support is enable per-CPU when launching the model, eg:
> > +
> > +-C cluster0.cpu0.CONFIG64=0
> > +
> > +This patch adds a new defconfig and some variant specific selections in
> > +vexpress_armv8a.h.
> > +
> > +This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
> > +
> > +Upstream-status: Denied
> > +
> > +For upstream discussion, please visit
> > +https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
> > +
> > +Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
> > +Signed-off-by: Asha R <asha.r@arm.com>
> > +Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> > +---
> > + arch/arm/Kconfig                          |  5 +++
> > + board/armltd/vexpress64/Kconfig           |  2 +-
> > + configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
> > + include/configs/vexpress_aemv8a.h         | 28 +++++++++++-----
> > + 4 files changed, 65 insertions(+), 10 deletions(-)
> > + create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
> > +
> > +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > +index 36c9c2fecd..99972cdf65 100644
> > +--- a/arch/arm/Kconfig
> > ++++ b/arch/arm/Kconfig
> > +@@ -1088,6 +1088,11 @@ config TARGET_VEXPRESS64_BASE_FVP
> > +       select PL01X_SERIAL
> > +       select SEMIHOSTING
> > +
> > ++config TARGET_VEXPRESS64_BASE_FVP_AARCH32
> > ++        bool "Support Versatile Express ARMv8a 32-bit FVP BASE model"
> > ++        select CPU_V7A
> > ++        select SEMIHOSTING
> > ++
> > + config TARGET_VEXPRESS64_JUNO
> > +       bool "Support Versatile Express Juno Development Platform"
> > +       select ARM64
> > +diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
> > +index 9014418433..75545e9ea1 100644
> > +--- a/board/armltd/vexpress64/Kconfig
> > ++++ b/board/armltd/vexpress64/Kconfig
> > +@@ -1,4 +1,4 @@
> > +-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
> > ++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_VEXPRESS64_BASE_FVP_AARCH32
> > +
> > + config SYS_BOARD
> > +       default "vexpress64"
> > +diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
> > +new file mode 100644
> > +index 0000000000..cf1e8d5cae
> > +--- /dev/null
> > ++++ b/configs/vexpress_aemv8a_aarch32_defconfig
> > +@@ -0,0 +1,40 @@
> > ++CONFIG_ARM=y
> > ++CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=y
> > ++CONFIG_SYS_MALLOC_F_LEN=0x2000
> > ++CONFIG_IDENT_STRING=" vexpress_aemv8a fvp aarch32"
> > ++CONFIG_BOOTDELAY=1
> > ++CONFIG_SYS_TEXT_BASE=0x88000000
> > ++CONFIG_USE_BOOTARGS=y
> > ++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda2 rw androidboot.hardware=fvpbase rootwait loglevel=9"
> > ++# CONFIG_DISPLAY_CPUINFO is not set
> > ++# CONFIG_DISPLAY_BOARDINFO is not set
> > ++CONFIG_HUSH_PARSER=y
> > ++CONFIG_SYS_PROMPT="fvp32# "
> > ++CONFIG_CMD_BOOTZ=y
> > ++# CONFIG_CMD_CONSOLE is not set
> > ++# CONFIG_CMD_IMLS is not set
> > ++# CONFIG_CMD_XIMG is not set
> > ++# CONFIG_CMD_EDITENV is not set
> > ++# CONFIG_CMD_ENV_EXISTS is not set
> > ++CONFIG_CMD_MEMTEST=y
> > ++CONFIG_MTD_NOR_FLASH=y
> > ++# CONFIG_CMD_LOADS is not set
> > ++CONFIG_CMD_ARMFLASH=y
> > ++# CONFIG_CMD_FPGA is not set
> > ++# CONFIG_CMD_ITEST is not set
> > ++# CONFIG_CMD_SETEXPR is not set
> > ++CONFIG_CMD_DHCP=y
> > ++# CONFIG_CMD_NFS is not set
> > ++CONFIG_CMD_MII=y
> > ++CONFIG_CMD_PING=y
> > ++CONFIG_CMD_CACHE=y
> > ++# CONFIG_CMD_MISC is not set
> > ++CONFIG_CMD_FAT=y
> > ++CONFIG_DM=y
> > ++CONFIG_DM_SERIAL=y
> > ++CONFIG_OF_LIBFDT=y
> > ++CONFIG_FLASH_CFI_DRIVER=y
> > ++CONFIG_SYS_FLASH_CFI=y
> > ++CONFIG_SYS_ARCH_TIMER=y
> > ++CONFIG_DM_SERIAL=y
> > ++CONFIG_PL01X_SERIAL=y
> > +diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> > +index 9a9cec414c..cf0e4a951c 100644
> > +--- a/include/configs/vexpress_aemv8a.h
> > ++++ b/include/configs/vexpress_aemv8a.h
> > +@@ -7,7 +7,8 @@
> > + #ifndef __VEXPRESS_AEMV8A_H
> > + #define __VEXPRESS_AEMV8A_H
> > +
> > +-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> > ++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> > ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> > + #ifndef CONFIG_SEMIHOSTING
> > + #error CONFIG_TARGET_VEXPRESS64_BASE_FVP requires CONFIG_SEMIHOSTING
> > + #endif
> > +@@ -15,8 +16,17 @@
> > +
> > + #define CONFIG_REMAKE_ELF
> > +
> > ++#ifdef CONFIG_ARM64
> > ++#define HIGH_ADDR                       "0xffffffffffffffff"
> > ++#define BOOT_TYPE                       "booti"
> > ++#else
> > ++#define HIGH_ADDR                       "0xffffffff"
> > ++#define BOOT_TYPE                       "bootz"
> > ++#endif
> > ++
> > + /* Link Definitions */
> > +-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> > ++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> > ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> > + /* ATF loads u-boot here for BASE_FVP model */
> > + #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
> > + #elif CONFIG_TARGET_VEXPRESS64_JUNO
> > +@@ -82,7 +92,8 @@
> > + #define GICR_BASE                     (0x2f100000)
> > + #else
> > +
> > +-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> > ++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> > ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> > + #define GICD_BASE                     (0x2f000000)
> > + #define GICC_BASE                     (0x2c000000)
> > + #elif CONFIG_TARGET_VEXPRESS64_JUNO
> > +@@ -169,7 +180,8 @@
> > +                               "booti ${kernel_addr} ${initrd_param} ${fdt_addr}"
> > +
> > +
> > +-#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
> > ++#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
> > ++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
> > + #define CONFIG_EXTRA_ENV_SETTINGS     \
> > +                               "kernel_name=Image\0"           \
> > +                               "kernel_addr=0x80080000\0"      \
> > +@@ -177,8 +189,8 @@
> > +                               "initrd_addr=0x88000000\0"      \
> > +                               "fdtfile=devtree.dtb\0"         \
> > +                               "fdt_addr=0x83000000\0"         \
> > +-                              "fdt_high=0xffffffffffffffff\0" \
> > +-                              "initrd_high=0xffffffffffffffff\0"
> > ++                              "fdt_high=" HIGH_ADDR "\0"      \
> > ++                              "initrd_high=" HIGH_ADDR "\0"
> > +
> > + #define CONFIG_BOOTCOMMAND    "smhload ${kernel_name} ${kernel_addr}; " \
> > +                               "smhload ${fdtfile} ${fdt_addr}; " \
> > +@@ -186,9 +198,7 @@
> > +                               "initrd_end; " \
> > +                               "fdt addr ${fdt_addr}; fdt resize; " \
> > +                               "fdt chosen ${initrd_addr} ${initrd_end}; " \
> > +-                              "booti $kernel_addr - $fdt_addr"
> > +-
> > +-
> > ++                              BOOT_TYPE " $kernel_addr - $fdt_addr"
> > + #endif
> > +
> > + /* Monitor Command Prompt */
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > index 966f040..5ab505b 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > @@ -21,6 +21,11 @@ SRC_URI_append_foundation-armv8 = " file://u-boot_vexpress_fvp.patch"
> >  #
> >  SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
> > 
> > +#
> > +# FVP BASE ARM32 KMACHINE
> > +#
> > +SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
> > +
> >  #
> >  # Juno KMACHINE
> >  #
> > --
> > 2.17.1
> > 
> > IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
> 
> > 
> 

> 

