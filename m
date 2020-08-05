Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4443.1596623821236728292
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 03:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@andersdellien.se header.s=20191106 header.b=VPbv6ED6;
 spf=none, err=permanent DNS error (domain: andersdellien.se, ip: 46.30.210.182, mailfrom: anders@andersdellien.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=andersdellien.se; s=20191106;
	h=message-id:date:subject:cc:to:from:from;
	bh=1Owu4CLX6eFWFUjR8OFyWZZnV2hLkVT2rVNHY08dy84=;
	b=VPbv6ED69bs9APrMpztg+CcEoMfVIS2UleNHXtJnoxnJ2VjpDB9BHqP5nfymOPBhY9hKyAlg7IhSP
	 VkWDhMoPhyLt0q6xdpZK4lmZ1BPlwA0F/TIhsr03LuvMMrCQOATIl683XU1dexfF9myvnZZ8Ext2qV
	 on6/LIvV5pMMy1pwgbEoP2qZEd6Pub4s77Z9hPwMMo1ZZxQSmBYTyGHxiH7igwnJ+Sr7u7DtWcf7kg
	 R4iBRrbbKkkA3TIK1EHeBUDnhLw9a8HaAuZfjOjCi7kC/nfPlKE3WsGi0XsIjhIhIW/Dvrkb3f9Zdi
	 eKzobxbdQayzniQlCj4Qxr1gQ6uILkw==
X-HalOne-Cookie: ffb69fce572080b8af1367c245bc53f3f7ccb3df
X-HalOne-ID: 96e0d220-d707-11ea-b2e9-d0431ea8a283
Received: from e110568.arm.com (unknown [90.255.41.247])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 96e0d220-d707-11ea-b2e9-d0431ea8a283;
	Wed, 05 Aug 2020 10:36:58 +0000 (UTC)
From: "Anders Dellien" <anders@andersdellien.se>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2 1/3] arm-bsp/u-boot: Add support for 32-bit FVP BASE machine
Date: Wed,  5 Aug 2020 11:36:11 +0100
Message-Id: <20200805103613.544-1-anders@andersdellien.se>
X-Mailer: git-send-email 2.17.1

From: Anders Dellien <anders.dellien@arm.com>

Change-Id: I48ec5607c216b1c15d2fedc1375f3f0a914c9937
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 181 +++++++++++++++++
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 182 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   5 +
 3 files changed, 368 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
new file mode 100644
index 0000000..712f7f0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
@@ -0,0 +1,181 @@
+From d627bdf9b11964b694aaf464c5c88ad9b339f03f Mon Sep 17 00:00:00 2001
+From: Anders Dellien <anders.dellien@arm.com>
+Date: Thu, 23 Jul 2020 17:32:55 +0100
+Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
+
+The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
+support is enable per-CPU when launching the model, eg:
+
+-C cluster0.cpu0.CONFIG64=0
+
+This patch adds a new defconfig and some variant specific selections in
+vexpress_armv8a.h.
+
+This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
+
+Upstream-status: Denied
+
+For upstream discussion, please visit
+https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
+
+Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
+Signed-off-by: Asha R <asha.r@arm.com>
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+---
+ arch/arm/Kconfig                          |  5 +++
+ board/armltd/vexpress64/Kconfig           |  2 +-
+ configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
+ include/configs/vexpress_aemv8a.h         | 28 +++++++++++-----
+ 4 files changed, 65 insertions(+), 10 deletions(-)
+ create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 36c9c2fecd..99972cdf65 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1088,6 +1088,11 @@ config TARGET_VEXPRESS64_BASE_FVP
+ 	select PL01X_SERIAL
+ 	select SEMIHOSTING
+ 
++config TARGET_VEXPRESS64_BASE_FVP_AARCH32
++        bool "Support Versatile Express ARMv8a 32-bit FVP BASE model"
++        select CPU_V7A
++        select SEMIHOSTING
++
+ config TARGET_VEXPRESS64_JUNO
+ 	bool "Support Versatile Express Juno Development Platform"
+ 	select ARM64
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
+index 9014418433..75545e9ea1 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -1,4 +1,4 @@
+-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_VEXPRESS64_BASE_FVP_AARCH32
+ 
+ config SYS_BOARD
+ 	default "vexpress64"
+diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
+new file mode 100644
+index 0000000000..cf1e8d5cae
+--- /dev/null
++++ b/configs/vexpress_aemv8a_aarch32_defconfig
+@@ -0,0 +1,40 @@
++CONFIG_ARM=y
++CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=y
++CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_IDENT_STRING=" vexpress_aemv8a fvp aarch32"
++CONFIG_BOOTDELAY=1
++CONFIG_SYS_TEXT_BASE=0x88000000
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda2 rw androidboot.hardware=fvpbase rootwait loglevel=9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=y
++CONFIG_SYS_PROMPT="fvp32# "
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_IMLS is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_MEMTEST=y
++CONFIG_MTD_NOR_FLASH=y
++# CONFIG_CMD_LOADS is not set
++CONFIG_CMD_ARMFLASH=y
++# CONFIG_CMD_FPGA is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_CACHE=y
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=y
++CONFIG_DM=y
++CONFIG_DM_SERIAL=y
++CONFIG_OF_LIBFDT=y
++CONFIG_FLASH_CFI_DRIVER=y
++CONFIG_SYS_FLASH_CFI=y
++CONFIG_SYS_ARCH_TIMER=y
++CONFIG_DM_SERIAL=y
++CONFIG_PL01X_SERIAL=y
+diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
+index 9a9cec414c..cf0e4a951c 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -7,7 +7,8 @@
+ #ifndef __VEXPRESS_AEMV8A_H
+ #define __VEXPRESS_AEMV8A_H
+ 
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #ifndef CONFIG_SEMIHOSTING
+ #error CONFIG_TARGET_VEXPRESS64_BASE_FVP requires CONFIG_SEMIHOSTING
+ #endif
+@@ -15,8 +16,17 @@
+ 
+ #define CONFIG_REMAKE_ELF
+ 
++#ifdef CONFIG_ARM64
++#define HIGH_ADDR                       "0xffffffffffffffff"
++#define BOOT_TYPE                       "booti"
++#else
++#define HIGH_ADDR                       "0xffffffff"
++#define BOOT_TYPE                       "bootz"
++#endif
++
+ /* Link Definitions */
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ /* ATF loads u-boot here for BASE_FVP model */
+ #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
+ #elif CONFIG_TARGET_VEXPRESS64_JUNO
+@@ -82,7 +92,8 @@
+ #define GICR_BASE			(0x2f100000)
+ #else
+ 
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #define GICD_BASE			(0x2f000000)
+ #define GICC_BASE			(0x2c000000)
+ #elif CONFIG_TARGET_VEXPRESS64_JUNO
+@@ -169,7 +180,8 @@
+ 				"booti ${kernel_addr} ${initrd_param} ${fdt_addr}"
+ 
+ 
+-#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 				"kernel_name=Image\0"		\
+ 				"kernel_addr=0x80080000\0"	\
+@@ -177,8 +189,8 @@
+ 				"initrd_addr=0x88000000\0"	\
+ 				"fdtfile=devtree.dtb\0"		\
+ 				"fdt_addr=0x83000000\0"		\
+-				"fdt_high=0xffffffffffffffff\0"	\
+-				"initrd_high=0xffffffffffffffff\0"
++				"fdt_high=" HIGH_ADDR "\0"	\
++				"initrd_high=" HIGH_ADDR "\0"
+ 
+ #define CONFIG_BOOTCOMMAND	"smhload ${kernel_name} ${kernel_addr}; " \
+ 				"smhload ${fdtfile} ${fdt_addr}; " \
+@@ -186,9 +198,7 @@
+ 				"initrd_end; " \
+ 				"fdt addr ${fdt_addr}; fdt resize; " \
+ 				"fdt chosen ${initrd_addr} ${initrd_end}; " \
+-				"booti $kernel_addr - $fdt_addr"
+-
+-
++				BOOT_TYPE " $kernel_addr - $fdt_addr"
+ #endif
+ 
+ /* Monitor Command Prompt */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
new file mode 100644
index 0000000..39c7e6a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
@@ -0,0 +1,182 @@
+From 4e3e97f82c60bb60709d80bb4622b4239dbb830d Mon Sep 17 00:00:00 2001
+From: Anders Dellien <anders.dellien@arm.com>
+Date: Thu, 23 Jul 2020 17:32:55 +0100
+Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
+
+The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
+support is enable per-CPU when launching the model, eg:
+
+-C cluster0.cpu0.CONFIG64=0
+
+This patch adds a new defconfig and some variant specific selections in
+vexpress_armv8a.h.
+
+This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
+
+Upstream-status: Denied
+
+For upstream discussion, please visit
+https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
+
+Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
+Signed-off-by: Asha R <asha.r@arm.com>
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+---
+ arch/arm/Kconfig                          |  5 +++
+ board/armltd/vexpress64/Kconfig           |  2 +-
+ configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
+ include/configs/vexpress_aemv8a.h         | 28 +++++++++++-----
+ 4 files changed, 65 insertions(+), 10 deletions(-)
+ create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 54d65f8488..ab3898c470 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1158,6 +1158,11 @@ config TARGET_VEXPRESS64_BASE_FVP
+ 	select PL01X_SERIAL
+ 	select SEMIHOSTING
+ 
++config TARGET_VEXPRESS64_BASE_FVP_AARCH32
++        bool "Support Versatile Express ARMv8a 32-bit FVP BASE model"
++        select CPU_V7A
++        select SEMIHOSTING
++
+ config TARGET_VEXPRESS64_JUNO
+ 	bool "Support Versatile Express Juno Development Platform"
+ 	select ARM64
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
+index 1d13f542e6..dad181c93c 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -1,4 +1,4 @@
+-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_VEXPRESS64_BASE_FVP_AARCH32
+ 
+ config SYS_BOARD
+ 	default "vexpress64"
+diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
+new file mode 100644
+index 0000000000..cf1e8d5cae
+--- /dev/null
++++ b/configs/vexpress_aemv8a_aarch32_defconfig
+@@ -0,0 +1,40 @@
++CONFIG_ARM=y
++CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=y
++CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_IDENT_STRING=" vexpress_aemv8a fvp aarch32"
++CONFIG_BOOTDELAY=1
++CONFIG_SYS_TEXT_BASE=0x88000000
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda2 rw androidboot.hardware=fvpbase rootwait loglevel=9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=y
++CONFIG_SYS_PROMPT="fvp32# "
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_IMLS is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_MEMTEST=y
++CONFIG_MTD_NOR_FLASH=y
++# CONFIG_CMD_LOADS is not set
++CONFIG_CMD_ARMFLASH=y
++# CONFIG_CMD_FPGA is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_CACHE=y
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=y
++CONFIG_DM=y
++CONFIG_DM_SERIAL=y
++CONFIG_OF_LIBFDT=y
++CONFIG_FLASH_CFI_DRIVER=y
++CONFIG_SYS_FLASH_CFI=y
++CONFIG_SYS_ARCH_TIMER=y
++CONFIG_DM_SERIAL=y
++CONFIG_PL01X_SERIAL=y
+diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
+index 09cdd3dab5..efb7d403ef 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -9,8 +9,17 @@
+ 
+ #define CONFIG_REMAKE_ELF
+ 
++#ifdef CONFIG_ARM64
++#define BOOT_TYPE                       "booti"
++#define FDT_ADDR                        "0x83000000"
++#else
++#define BOOT_TYPE                       "bootz"
++#define FDT_ADDR                        "0x82000000"
++#endif
++
+ /* Link Definitions */
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ /* ATF loads u-boot here for BASE_FVP model */
+ #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
+ #elif CONFIG_TARGET_VEXPRESS64_JUNO
+@@ -76,7 +85,8 @@
+ #define GICR_BASE			(0x2f100000)
+ #else
+ 
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #define GICD_BASE			(0x2f000000)
+ #define GICC_BASE			(0x2c000000)
+ #elif CONFIG_TARGET_VEXPRESS64_JUNO
+@@ -159,16 +169,19 @@
+ 				"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}"
+ 
+ 
+-#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 				"kernel_name=Image\0"		\
+ 				"kernel_addr=0x80080000\0"	\
+ 				"initrd_name=ramdisk.img\0"	\
+ 				"initrd_addr=0x88000000\0"	\
+ 				"fdtfile=devtree.dtb\0"		\
+-				"fdt_addr=0x83000000\0"		\
++				"fdt_addr=" FDT_ADDR "\0"	\
+ 				"boot_name=boot.img\0"		\
+-				"boot_addr=0x8007f800\0"
++				"boot_addr=0x8007f800\0"	\
++				"fdt_high=0xffffffffffffffff\0" \
++				"initrd_high=0xffffffffffffffff\0"
+ 
+ #define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then " \
+ 				"  set bootargs; " \
+@@ -177,18 +190,15 @@
+ 				"  bootm ${boot_addr} ${boot_addr} " \
+ 				"  ${fdt_addr}; " \
+ 				"else; " \
+-				"  set fdt_high 0xffffffffffffffff; " \
+-				"  set initrd_high 0xffffffffffffffff; " \
+ 				"  smhload ${kernel_name} ${kernel_addr}; " \
+ 				"  smhload ${fdtfile} ${fdt_addr}; " \
+ 				"  smhload ${initrd_name} ${initrd_addr} "\
+ 				"  initrd_end; " \
+ 				"  fdt addr ${fdt_addr}; fdt resize; " \
+ 				"  fdt chosen ${initrd_addr} ${initrd_end}; " \
+-				"  booti $kernel_addr - $fdt_addr; " \
++				BOOT_TYPE " $kernel_addr - $fdt_addr; " \
+ 				"fi"
+ 
+-
+ #endif
+ 
+ /* Monitor Command Prompt */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 966f040..5ab505b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -21,6 +21,11 @@ SRC_URI_append_foundation-armv8 = " file://u-boot_vexpress_fvp.patch"
 #
 SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
 
+#
+# FVP BASE ARM32 KMACHINE
+#
+SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
+
 #
 # Juno KMACHINE
 #
-- 
2.17.1

