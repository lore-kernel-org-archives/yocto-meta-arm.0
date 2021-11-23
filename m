Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284E3C43217
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 16:00:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13297.1637683204218928321
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 08:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3E6C1063;
	Tue, 23 Nov 2021 08:00:03 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E6EA3F5A1;
	Tue, 23 Nov 2021 08:00:01 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 12/19] arm-bsp/u-boot: corstone1000: extend efi
 support
Date: Tue, 23 Nov 2021 15:59:19 +0000
Message-Id: <20211123155926.31743-13-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 16:00:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2441

From: Vishnu Banavath <vishnu.banavath@arm.com>

enable efi boot including secure config options, add a
load command which integrate with efi subsystem.

And as at it, enable the efi capsule options for future
use.

Change-Id: Iced8ab2b9bca41805f6201150760692b4b716d7d
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...d-add-load-command-for-memory-mapped.patch | 177 ++++++++++++++++++
 ...-corstone1000-enable-boot-using-uefi.patch |  61 ++++++
 ...corstone1000-enable-uefi-secure-boot.patch |  32 ++++
 ...0-enable-handlers-for-uefi-variables.patch |  47 +++++
 ...stone1000-enable-efi-capsule-options.patch |  36 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   5 +
 6 files changed, 358 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
new file mode 100644
index 0000000..ca2039c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
@@ -0,0 +1,177 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 5278fb64beabeddd6c80229e5165f91ed1e95376 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 24 Jun 2021 09:25:00 +0100
+Subject: [PATCH 10/16] cmd: load: add load command for memory mapped
+
+cp.b is used a lot as a way to load binaries to memory and execute
+them, however we may need to integrate this with the efi subsystem to
+set it up as a bootdev.
+
+So, introduce a loadm command that will be consistent with the other
+loadX commands and will call the efi API's.
+
+ex: loadm $kernel_addr $kernel_addr_r $kernel_size
+
+with this a kernel with CONFIG_EFI_STUB enabled will be loaded and
+then subsequently booted with bootefi command.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ cmd/Kconfig                      |  6 ++++
+ cmd/bootefi.c                    | 12 ++++++++
+ cmd/load.c                       | 49 ++++++++++++++++++++++++++++++++
+ include/efi_loader.h             |  2 ++
+ lib/efi_loader/efi_device_path.c | 10 +++++++
+ 5 files changed, 79 insertions(+)
+
+diff --git a/cmd/Kconfig b/cmd/Kconfig
+index a9fb4eead2..56fa0ceade 100644
+--- a/cmd/Kconfig
++++ b/cmd/Kconfig
+@@ -1048,6 +1048,12 @@ config CMD_LOADB
+ 	help
+ 	  Load a binary file over serial line.
+ 
++config CMD_LOADM
++	bool "loadm"
++	default y
++	help
++	  Load a binary over memory mapped.
++
+ config CMD_LOADS
+ 	bool "loads"
+ 	default y
+diff --git a/cmd/bootefi.c b/cmd/bootefi.c
+index cba81ffe75..9e1b91c89e 100644
+--- a/cmd/bootefi.c
++++ b/cmd/bootefi.c
+@@ -34,6 +34,18 @@ static struct efi_device_path *bootefi_device_path;
+ static void *image_addr;
+ static size_t image_size;
+ 
++/**
++ * efi_get_image_parameters() - return image parameters
++ *
++ * @img_addr:		address of loaded image in memory
++ * @img_size:		size of loaded image
++ */
++void efi_get_image_parameters(void **img_addr, size_t *img_size)
++{
++	*img_addr = image_addr;
++	*img_size = image_size;
++}
++
+ /**
+  * efi_clear_bootdev() - clear boot device
+  */
+diff --git a/cmd/load.c b/cmd/load.c
+index b7894d7db0..4de197681c 100644
+--- a/cmd/load.c
++++ b/cmd/load.c
+@@ -1020,6 +1020,45 @@ static ulong load_serial_ymodem(ulong offset, int mode)
+ 
+ #endif
+ 
++#if defined(CONFIG_CMD_LOADM)
++static int do_load_memory_bin(struct cmd_tbl *cmdtp, int flag, int argc,
++			      char *const argv[])
++{
++	ulong	addr, dest, size;
++	void	*src, *dst;
++
++	if (argc != 4)
++		return CMD_RET_USAGE;
++
++	addr = simple_strtoul(argv[1], NULL, 16);
++
++	dest = simple_strtoul(argv[2], NULL, 16);
++
++	size = simple_strtoul(argv[3], NULL, 16);
++
++
++	if (!size) {
++		puts ("can not load zero bytes\n");
++		return 1;
++	}
++
++	src = map_sysmem(addr, size);
++	dst = map_sysmem(dest, size);
++
++	memcpy(dst, src, size);
++
++	unmap_sysmem(src);
++	unmap_sysmem(dst);
++
++	if (IS_ENABLED(CONFIG_CMD_BOOTEFI))
++		efi_set_bootdev("Mem", "", "", map_sysmem(dest, 0), size);
++
++	printf("loaded bin to memory: size: %lu\n", size);
++
++	return 0;
++}
++#endif
++
+ /* -------------------------------------------------------------------- */
+ 
+ #if defined(CONFIG_CMD_LOADS)
+@@ -1094,3 +1133,13 @@ U_BOOT_CMD(
+ );
+ 
+ #endif	/* CONFIG_CMD_LOADB */
++
++#if defined(CONFIG_CMD_LOADM)
++U_BOOT_CMD(
++	loadm, 4, 0,	do_load_memory_bin,
++	"load binary blob from two addresses",
++	"[src_addr] [dst_addr] [size]\n"
++	"     - load a binary blob from one memory location to other"
++	" from src_addr to dst_addr by size bytes"
++);
++#endif /* CONFIG_CMD_LOADM */
+diff --git a/include/efi_loader.h b/include/efi_loader.h
+index b81180cfda..fc4f1ec67a 100644
+--- a/include/efi_loader.h
++++ b/include/efi_loader.h
+@@ -485,6 +485,8 @@ void efi_save_gd(void);
+ void efi_restore_gd(void);
+ /* Call this to relocate the runtime section to an address space */
+ void efi_runtime_relocate(ulong offset, struct efi_mem_desc *map);
++/* Call this to get image parameters */
++void efi_get_image_parameters(void **img_addr, size_t *img_size);
+ /* Call this to set the current device name */
+ void efi_set_bootdev(const char *dev, const char *devnr, const char *path,
+ 		     void *buffer, size_t buffer_size);
+diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_device_path.c
+index 76c2f82fe6..a610b6ff0e 100644
+--- a/lib/efi_loader/efi_device_path.c
++++ b/lib/efi_loader/efi_device_path.c
+@@ -1170,6 +1170,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
+ {
+ 	struct blk_desc *desc = NULL;
+ 	struct disk_partition fs_partition;
++	size_t image_size;
++	void *image_addr;
+ 	int part = 0;
+ 	char *filename;
+ 	char *s;
+@@ -1185,6 +1187,14 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
+ 	} else if (!strcmp(dev, "Uart")) {
+ 		if (device)
+ 			*device = efi_dp_from_uart();
++	} else if (!strcmp(dev, "Mem")) {
++
++		efi_get_image_parameters(&image_addr, &image_size);
++
++		if (device)
++			*device = efi_dp_from_mem(EFI_RESERVED_MEMORY_TYPE,
++						  (uintptr_t)image_addr,
++						  image_size);
+ 	} else {
+ 		part = blk_get_device_part_str(dev, devnr, &desc, &fs_partition,
+ 					       1);
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
new file mode 100644
index 0000000..95b97ee
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
@@ -0,0 +1,61 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 283cae5b37eced831080a50d76006359662fb6bf Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 23 Jun 2021 00:45:38 +0100
+Subject: [PATCH 11/16] arm: corstone1000: enable boot using uefi
+
+In a way to prepare future use of uefi features, enable booting using
+the bootefi binary loading.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+---
+ configs/corstone1000_defconfig | 7 +++++++
+ include/configs/corstone1000.h | 6 +++---
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index af1c5ecd89..aa664029fc 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -2,6 +2,7 @@ CONFIG_ARM=y
+ CONFIG_TARGET_CORSTONE1000=y
+ CONFIG_SYS_TEXT_BASE=0x80000000
+ CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_SYS_LOAD_ADDR=0x82100000
+ CONFIG_NR_DRAM_BANKS=1
+ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+ CONFIG_FIT=y
+@@ -14,6 +15,12 @@ CONFIG_HUSH_PARSER=y
+ CONFIG_SYS_PROMPT="corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_BOOTZ=y
++CONFIG_CMD_BOOTM=y
++CONFIG_CMD_LOADM=y
++CONFIG_CMD_BOOTEFI=y
++CONFIG_EFI_LOADER=y
++CONFIG_CMD_BOOTEFI_HELLO_COMPILE=y
++CONFIG_CMD_BOOTEFI_HELLO=y
+ # CONFIG_CMD_XIMG is not set
+ # CONFIG_CMD_EDITENV is not set
+ # CONFIG_CMD_ENV_EXISTS is not set
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 389ac45a58..5e22e075ad 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -70,7 +70,7 @@
+ 				"fdt_high=0xffffffff\0"
+ 
+ #define CONFIG_BOOTCOMMAND					\
+-				"echo Copying Kernel to memory ... ;" \
+-                                "cp.b $kernel_addr $kernel_addr_r 0xc00000;" \
+-                                "booti $kernel_addr_r - $fdtcontroladdr; "
++				"echo Loading Kernel to memory ... ;" \
++				"loadm $kernel_addr $kernel_addr_r 0xc00000;" \
++				"bootefi $kernel_addr_r $fdtcontroladdr;"
+ #endif
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
new file mode 100644
index 0000000..e71ae2c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From e49597b8d9058d8c5b925339b0041fd7096c622d Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 14 Sep 2021 10:46:49 +0100
+Subject: [PATCH 12/16] arm: corstone1000: enable uefi secure boot
+
+To make it possible to have a secure way to execute UEFI images
+enable UEFI secure boot support and by inherit the
+cryptographic functionalities.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ configs/corstone1000_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index aa664029fc..a8651287ed 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -43,6 +43,7 @@ CONFIG_USB=y
+ CONFIG_DM_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_USB_STORAGE=y
++CONFIG_EFI_SECURE_BOOT=y
+ CONFIG_DM_RTC=y
+ CONFIG_CMD_RTC=y
+ CONFIG_EFI_GET_TIME=y
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
new file mode 100644
index 0000000..594e9f5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From de37d61d1414cb6408390412cf77d7a88f8964e1 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 14 Sep 2021 22:00:47 +0100
+Subject: [PATCH 13/16] arm: corstone1000: enable handlers for uefi variables
+
+Enable the setenv/printenv -e option to handle uefi
+variables and the efidebug command.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ configs/corstone1000_defconfig | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index a8651287ed..b17e2df47b 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -24,6 +24,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
+ # CONFIG_CMD_XIMG is not set
+ # CONFIG_CMD_EDITENV is not set
+ # CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_NVEDIT_EFI=y
+ # CONFIG_CMD_LOADS is not set
+ CONFIG_CMD_USB=y
+ # CONFIG_CMD_ITEST is not set
+@@ -33,6 +34,7 @@ CONFIG_CMD_DHCP=y
+ CONFIG_CMD_MII=y
+ CONFIG_CMD_PING=y
+ CONFIG_CMD_CACHE=y
++CONFIG_CMD_EFIDEBUG=y
+ CONFIG_CMD_FAT=y
+ CONFIG_OF_CONTROL=y
+ CONFIG_REGMAP=y
+@@ -43,6 +45,7 @@ CONFIG_USB=y
+ CONFIG_DM_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_USB_STORAGE=y
++# CONFIG_HEXDUMP is not set
+ CONFIG_EFI_SECURE_BOOT=y
+ CONFIG_DM_RTC=y
+ CONFIG_CMD_RTC=y
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
new file mode 100644
index 0000000..a414a09
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From fe0acf22a0c30f7d3eb1a8c66fb423b4146d35ab Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 14 Sep 2021 22:07:15 +0100
+Subject: [PATCH 14/16] arm: dipha: enable efi capsule options
+
+Enable the set of efi capsule config options to enable the
+variables.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ configs/corstone1000_defconfig | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index b17e2df47b..cfe80cf5f4 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -46,6 +46,12 @@ CONFIG_DM_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_USB_STORAGE=y
+ # CONFIG_HEXDUMP is not set
++CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
++CONFIG_EFI_CAPSULE_ON_DISK=y
++CONFIG_EFI_CAPSULE_ON_DISK_EARLY=y
++CONFIG_EFI_CAPSULE_AUTHENTICATE=y
++CONFIG_EFI_CAPSULE_FIRMWARE_FIT=y
++CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
+ CONFIG_EFI_SECURE_BOOT=y
+ CONFIG_DM_RTC=y
+ CONFIG_CMD_RTC=y
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 30a6f7f..b73e6f7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -21,6 +21,11 @@ SRC_URI:append:corstone1000 = " \
       file://0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch \
       file://0008-arm-corstone1000-Emulated-RTC-Support.patch \
       file://0009-arm-corstone1000-execute-uboot-from-DDR.patch \
+      file://0010-cmd-load-add-load-command-for-memory-mapped.patch \
+      file://0011-arm-corstone1000-enable-boot-using-uefi.patch \
+      file://0012-arm-corstone1000-enable-uefi-secure-boot.patch \
+      file://0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch \
+      file://0014-arm-corstone1000-enable-efi-capsule-options.patch \
       "
 
 #
-- 
2.17.1


