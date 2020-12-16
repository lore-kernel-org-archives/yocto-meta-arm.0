Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.3775.1608154164851048456
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Dec 2020 13:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ExG9TlXW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id b64so20416274qkc.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 16 Dec 2020 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kEjMfo65++/KGiQwmL4wzE8cr+JbSwsVGKoldXFCkSU=;
        b=ExG9TlXWLDL6N9Bl8TiaJj9xMD1/fDYgoICMNEi6HWOYesFGSsgiFEC5FoMbAr2+oU
         do1sxo5tBXP3gGccZA1QNO6hrRgQOAAyk0QYIQ/0o2PJkemmnydlgePeTZEev/m+c2df
         ub1ZT0kAxREMzmSV3C0lLVCo3c335ZKZB+IGRvUvPQB6Alvsf/TNB6EksLe8xh9wf4wL
         Yq/sUK8qHA0CLvUzNw6GeK4I1VtvqhqdfyNNJ1j4Wmh1V4uMO0uHjOVImprZVECfO3mE
         AWd0wtXTwsRGMu8LAZ4PtzS5rOWSAC2Z0vkW2qlziNi9siCBNZscWA5Q9/hvfv1/0Y70
         d34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kEjMfo65++/KGiQwmL4wzE8cr+JbSwsVGKoldXFCkSU=;
        b=aU4+qN1jwO+mvgPqFIwgfj2Z884QyCP6dCVgPn8beXRUxHllGp1uaN0YOgB9Iv6Ooz
         dgAZflakzKKYHN3pNOqtqP4Ew69kP66hVlWZyWVeZkDaGR36BzPsEQnMkAIASu52VQfs
         9KqPwkXP7ZVUCiI5VmJ975bTtd4wh36qLijN8Y+q4toNhqFqo9hO4wsRKpbeRWOcCTo4
         IfftGmcJrMlr52O2ij1cUiqvdvWywOSkdiFtP43LxKLScj8m+Wy6T6q0MEpXOsgeWooV
         Nzh//ZlbJA7mKn7Dxo0LL9VRn55YOaYS7JAHQFNlLbQK2tWZwxnp5/ZngCr05lwWQsLK
         kQAg==
X-Gm-Message-State: AOAM532r8qQazrTv3DyIBF3GvRSpvxA8plxiposXwDbqh74MMAYyfttG
	7wAAl5HMueVflsBebWKb2NZOAg==
X-Google-Smtp-Source: ABdhPJyr+v/Y+d6rTPJL2HnjevOfXU0lxGR9sn503u4kkfEj9kqoInV+kFkaEQDLTlilfNTK0+rYLQ==
X-Received: by 2002:a37:56c6:: with SMTP id k189mr44671739qkb.501.1608154164015;
        Wed, 16 Dec 2020 13:29:24 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:dccb:7f71:637e:7064])
        by smtp.gmail.com with ESMTPSA id n62sm1125448qkn.125.2020.12.16.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 13:29:23 -0800 (PST)
Date: Wed, 16 Dec 2020 16:29:22 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: update tc0 platform with latest u-boot
Message-ID: <20201216212921.GC23294@kudzu.us>
References: <20201216174805.50683-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201216174805.50683-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 16, 2020 at 05:48:03PM +0000, Usama Arif wrote:
> Use 2020.10 u-boot as it has tc0 platform merged in upstream.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Change-Id: Ia7da8b96a4509cee25b096f6637c036fef910b48

Series applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/tc0.conf            |   2 +-
>  .../0001-Add-support-for-Total-Compute.patch  | 307 ------------------
>  .../u-boot/u-boot_2020.07.bbappend            |   5 -
>  3 files changed, 1 insertion(+), 313 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/tc0/0001-Add-support-for-Total-Compute.patch
> 
> diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
> index efc9c02..eed3acf 100644
> --- a/meta-arm-bsp/conf/machine/tc0.conf
> +++ b/meta-arm-bsp/conf/machine/tc0.conf
> @@ -10,7 +10,7 @@ require conf/machine/include/arm/arch-armv8a.inc
>  
>  # Das U-boot
>  UBOOT_MACHINE ?= "total_compute_defconfig"
> -PREFERRED_VERSION_u-boot ?= "2020.07"
> +PREFERRED_VERSION_u-boot ?= "2020.10"
>  
>  # Trusted firmware A v2.3
>  PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/tc0/0001-Add-support-for-Total-Compute.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/tc0/0001-Add-support-for-Total-Compute.patch
> deleted file mode 100644
> index 692a11f..0000000
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/tc0/0001-Add-support-for-Total-Compute.patch
> +++ /dev/null
> @@ -1,307 +0,0 @@
> -From 854c5d7b8a010d47da38735f15a31d0b7d10ae3c Mon Sep 17 00:00:00 2001
> -From: Usama Arif <usama.arif@arm.com>
> -Date: Fri, 3 Jul 2020 10:26:56 +0100
> -Subject: [PATCH] Add support for Total Compute
> -
> -This includes basic platform patch support and boots
> -kernel and ramdisk that have been sideloaded in DRAM.
> -
> -Change-Id: I2e35a1d983efd1d27572f671cad5a9fe4ad68ee6
> -Signed-off-by: Usama Arif <usama.arif@arm.com>
> -Upstream-Status: Pending
> ----
> - arch/arm/Kconfig                         |  9 +++
> - board/armltd/totalcompute/Kconfig        | 12 ++++
> - board/armltd/totalcompute/MAINTAINERS    |  6 ++
> - board/armltd/totalcompute/Makefile       |  6 ++
> - board/armltd/totalcompute/totalcompute.c | 74 +++++++++++++++++++++++
> - configs/total_compute_defconfig          | 39 ++++++++++++
> - include/configs/total_compute.h          | 77 ++++++++++++++++++++++++
> - 7 files changed, 223 insertions(+)
> - create mode 100644 board/armltd/totalcompute/Kconfig
> - create mode 100644 board/armltd/totalcompute/MAINTAINERS
> - create mode 100644 board/armltd/totalcompute/Makefile
> - create mode 100644 board/armltd/totalcompute/totalcompute.c
> - create mode 100644 configs/total_compute_defconfig
> - create mode 100644 include/configs/total_compute.h
> -
> -diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index 36c9c2fecd0..b423b7655b6 100644
> ---- a/arch/arm/Kconfig
> -+++ b/arch/arm/Kconfig
> -@@ -635,6 +635,14 @@ config TARGET_VEXPRESS_CA15_TC2
> - 	select CPU_V7_HAS_VIRT
> - 	select PL011_SERIAL
> - 
> -+config TARGET_TOTAL_COMPUTE
> -+	bool "Support Total Compute Platform"
> -+	select ARM64
> -+	select PL01X_SERIAL
> -+	select DM
> -+	select DM_SERIAL
> -+	select DM_ETH
> -+
> - config ARCH_BCMSTB
> - 	bool "Broadcom BCM7XXX family"
> - 	select CPU_V7A
> -@@ -1774,6 +1782,7 @@ source "arch/arm/cpu/armv8/Kconfig"
> - 
> - source "arch/arm/mach-imx/Kconfig"
> - 
> -+source "board/armltd/totalcompute/Kconfig"
> - source "board/bosch/shc/Kconfig"
> - source "board/bosch/guardian/Kconfig"
> - source "board/CarMediaLab/flea3/Kconfig"
> -diff --git a/board/armltd/totalcompute/Kconfig b/board/armltd/totalcompute/Kconfig
> -new file mode 100644
> -index 00000000000..8bd8c30a6b5
> ---- /dev/null
> -+++ b/board/armltd/totalcompute/Kconfig
> -@@ -0,0 +1,12 @@
> -+if TARGET_TOTAL_COMPUTE
> -+
> -+config SYS_BOARD
> -+	default "totalcompute"
> -+
> -+config SYS_VENDOR
> -+	default "armltd"
> -+
> -+config SYS_CONFIG_NAME
> -+	default "total_compute"
> -+
> -+endif
> -diff --git a/board/armltd/totalcompute/MAINTAINERS b/board/armltd/totalcompute/MAINTAINERS
> -new file mode 100644
> -index 00000000000..bb09a90a309
> ---- /dev/null
> -+++ b/board/armltd/totalcompute/MAINTAINERS
> -@@ -0,0 +1,6 @@
> -+TOTAL_COMPUTE BOARD
> -+M:	Usama Arif <usama.arif@arm.com>
> -+S:	Maintained
> -+F:	board/armltd/totalcompute/
> -+F:	include/configs/total_compute.h
> -+F:	configs/total_compute_defconfig
> -diff --git a/board/armltd/totalcompute/Makefile b/board/armltd/totalcompute/Makefile
> -new file mode 100644
> -index 00000000000..4c40afef723
> ---- /dev/null
> -+++ b/board/armltd/totalcompute/Makefile
> -@@ -0,0 +1,6 @@
> -+# SPDX-License-Identifier: GPL-2.0+
> -+#
> -+# (C) Copyright 2020 ARM Limited
> -+# Usama Arif <usama.arif@arm.com>
> -+
> -+obj-y	:= totalcompute.o
> -diff --git a/board/armltd/totalcompute/totalcompute.c b/board/armltd/totalcompute/totalcompute.c
> -new file mode 100644
> -index 00000000000..21247e4ef0f
> ---- /dev/null
> -+++ b/board/armltd/totalcompute/totalcompute.c
> -@@ -0,0 +1,74 @@
> -+// SPDX-License-Identifier: GPL-2.0+
> -+/*
> -+ * (C) Copyright 2020 ARM Limited
> -+ * Usama Arif <usama.arif@arm.com>
> -+ */
> -+#include <common.h>
> -+#include <dm.h>
> -+#include <init.h>
> -+#include <malloc.h>
> -+#include <errno.h>
> -+#include <netdev.h>
> -+#include <asm/io.h>
> -+#include <linux/compiler.h>
> -+#include <dm/platform_data/serial_pl01x.h>
> -+#include <asm/armv8/mmu.h>
> -+
> -+DECLARE_GLOBAL_DATA_PTR;
> -+
> -+static const struct pl01x_serial_platdata serial_platdata = {
> -+	.base = UART0_BASE,
> -+	.type = TYPE_PL011,
> -+	.clock = CONFIG_PL011_CLOCK,
> -+};
> -+
> -+U_BOOT_DEVICE(total_compute_serials) = {
> -+	.name = "serial_pl01x",
> -+	.platdata = &serial_platdata,
> -+};
> -+
> -+static struct mm_region total_compute_mem_map[] = {
> -+	{
> -+		.virt = 0x0UL,
> -+		.phys = 0x0UL,
> -+		.size = 0x80000000UL,
> -+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> -+			 PTE_BLOCK_NON_SHARE |
> -+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> -+	}, {
> -+		.virt = 0x80000000UL,
> -+		.phys = 0x80000000UL,
> -+		.size = 0xff80000000UL,
> -+		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
> -+			 PTE_BLOCK_INNER_SHARE
> -+	}, {
> -+		/* List terminator */
> -+		0,
> -+	}
> -+};
> -+
> -+struct mm_region *mem_map = total_compute_mem_map;
> -+
> -+int board_init(void)
> -+{
> -+	return 0;
> -+}
> -+
> -+int dram_init(void)
> -+{
> -+	gd->ram_size = PHYS_SDRAM_1_SIZE;
> -+	return 0;
> -+}
> -+
> -+int dram_init_banksize(void)
> -+{
> -+	gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
> -+	gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
> -+
> -+	return 0;
> -+}
> -+
> -+void reset_cpu(ulong addr)
> -+{
> -+}
> -+
> -diff --git a/configs/total_compute_defconfig b/configs/total_compute_defconfig
> -new file mode 100644
> -index 00000000000..31d97dddc21
> ---- /dev/null
> -+++ b/configs/total_compute_defconfig
> -@@ -0,0 +1,39 @@
> -+CONFIG_ARM=y
> -+CONFIG_TARGET_TOTAL_COMPUTE=y
> -+CONFIG_SYS_TEXT_BASE=0xe0000000
> -+CONFIG_SYS_MALLOC_F_LEN=0x2000
> -+CONFIG_ENV_SIZE=0x10000
> -+CONFIG_NR_DRAM_BANKS=2
> -+CONFIG_DISTRO_DEFAULTS=y
> -+CONFIG_BOOTDELAY=1
> -+CONFIG_USE_BOOTARGS=y
> -+CONFIG_BOOTARGS="console=ttyAMA0 debug user_debug=31 earlycon=pl011,0x7ff80000 loglevel=9 androidboot.hardware=total_compute video=640x480-32@60 root=/dev/vda2 ip=dhcp androidboot.selinux=permissive"
> -+# CONFIG_USE_BOOTCOMMAND is not set
> -+# CONFIG_DISPLAY_CPUINFO is not set
> -+# CONFIG_DISPLAY_BOARDINFO is not set
> -+CONFIG_SYS_PROMPT="TOTAL_COMPUTE# "
> -+# CONFIG_CMD_CONSOLE is not set
> -+# CONFIG_CMD_XIMG is not set
> -+# CONFIG_CMD_EDITENV is not set
> -+CONFIG_CMD_MEMTEST=y
> -+CONFIG_SYS_MEMTEST_START=0x80000000
> -+CONFIG_SYS_MEMTEST_END=0xff000000
> -+CONFIG_CMD_ARMFLASH=y
> -+# CONFIG_CMD_LOADS is not set
> -+# CONFIG_CMD_ITEST is not set
> -+# CONFIG_CMD_SETEXPR is not set
> -+# CONFIG_CMD_NFS is not set
> -+CONFIG_CMD_CACHE=y
> -+# CONFIG_CMD_MISC is not set
> -+CONFIG_CMD_UBI=y
> -+# CONFIG_ISO_PARTITION is not set
> -+# CONFIG_EFI_PARTITION is not set
> -+# CONFIG_MMC is not set
> -+CONFIG_MTD=y
> -+CONFIG_MTD_DEVICE=y
> -+CONFIG_MTD_NOR_FLASH=y
> -+CONFIG_FLASH_CFI_DRIVER=y
> -+CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
> -+CONFIG_SYS_FLASH_PROTECTION=y
> -+CONFIG_SYS_FLASH_CFI=y
> -+CONFIG_OF_LIBFDT=y
> -diff --git a/include/configs/total_compute.h b/include/configs/total_compute.h
> -new file mode 100644
> -index 00000000000..54086205db6
> ---- /dev/null
> -+++ b/include/configs/total_compute.h
> -@@ -0,0 +1,77 @@
> -+/* SPDX-License-Identifier: GPL-2.0+ */
> -+/*
> -+ * Configuration for Total Compute. Parts were derived from other ARM
> -+ * configurations.
> -+ * (C) Copyright 2020 ARM Limited
> -+ * Usama Arif <usama.arif@arm.com>
> -+ */
> -+
> -+#ifndef __TOTAL_COMPUTE_H
> -+#define __TOTAL_COMPUTE_H
> -+
> -+#define CONFIG_REMAKE_ELF
> -+
> -+/* Link Definitions */
> -+#define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff0)
> -+#define CONFIG_ENV_SIZE	0x10000
> -+
> -+
> -+#define CONFIG_SYS_BOOTM_LEN (64 << 20)
> -+
> -+#define UART0_BASE			0x7ff80000
> -+
> -+/* Generic Timer Definitions */
> -+#define COUNTER_FREQUENCY		(0x1800000)	/* 24MHz */
> -+
> -+/* Generic Interrupt Controller Definitions */
> -+
> -+#define GICD_BASE			(0x2C010000)
> -+#define GICC_BASE			(0x2C02f000)
> -+
> -+/* Size of malloc() pool */
> -+#define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + (8 << 20))
> -+
> -+/* PL011 Serial Configuration */
> -+#define CONFIG_PL011_CLOCK		7372800
> -+
> -+/* BOOTP options */
> -+#define CONFIG_BOOTP_BOOTFILESIZE
> -+
> -+/* Miscellaneous configurable options */
> -+#define CONFIG_SYS_LOAD_ADDR		0x90000000
> -+
> -+/* Physical Memory Map */
> -+#define PHYS_SDRAM_1			0x80000000
> -+/* Top 32MB reserved for secure world use */
> -+#define DRAM_SEC_SIZE		0x02000000
> -+#define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
> -+#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
> -+
> -+/* Enable memtest */
> -+#define CONFIG_SYS_MEMTEST_START	PHYS_SDRAM_1
> -+#define CONFIG_SYS_MEMTEST_END		(PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE)
> -+
> -+#define CONFIG_EXTRA_ENV_SETTINGS	\
> -+				"kernel_addr_r=0x80080000\0"	\
> -+				"initrd_addr_r=0x88000000\0"	\
> -+				"fdt_addr_r=0x83000000\0"	\
> -+				"fdt_high=0xffffffffffffffff\0"	\
> -+				"initrd_high=0xffffffffffffffff\0"
> -+
> -+#define CONFIG_BOOTCOMMAND	"booti ${kernel_addr_r} ${initrd_addr_r} ${fdt_addr_r}"
> -+
> -+/* Monitor Command Prompt */
> -+#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
> -+#define CONFIG_SYS_MAXARGS		64	/* max command args */
> -+
> -+#define CONFIG_SYS_FLASH_BASE		0x0C000000
> -+/* 256 x 256KiB sectors */
> -+#define CONFIG_SYS_MAX_FLASH_SECT	256
> -+
> -+#define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
> -+#define CONFIG_SYS_MAX_FLASH_BANKS	1
> -+
> -+#define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
> -+#define FLASH_MAX_SECTOR_SIZE		0x00040000
> -+
> -+#endif /* __TOTAL_COMPUTE_H */
> --- 
> -2.17.1
> -
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> index 8facc31..30d1db8 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> @@ -25,8 +25,3 @@ SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-varian
>  # Juno KMACHINE
>  #
>  SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
> -
> -#
> -# Total Compute KMACHINE
> -#
> -SRC_URI_append_tc0 = " file://0001-Add-support-for-Total-Compute.patch"
> -- 
> 2.17.1
> 

> 
> 
> 

