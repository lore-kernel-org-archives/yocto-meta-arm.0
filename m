Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEFEC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:15:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8975.1655226920046114076
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 837AD1762
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:19 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7EF43F66F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm-bsp/corestone1000: Update to u-boot v2022.04
Date: Tue, 14 Jun 2022 13:15:11 -0400
Message-Id: <20220614171514.32495-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220614171514.32495-1-jon.mason@arm.com>
References: <20220614171514.32495-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3493

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...d-add-load-command-for-memory-mapped.patch | 22 +++++++-------
 ...add-support-to-corstone1000-platform.patch | 22 +++++++-------
 ...3-usb-common-move-urb-code-to-common.patch |  6 ++--
 .../0004-usb-add-isp1760-family-driver.patch  |  8 ++---
 ...ne1000-enable-isp1763-usb-controller.patch |  4 +--
 ...ntroducing-Arm-FF-A-low-level-driver.patch | 26 ++++++++--------
 ...7-arm_ffa-introducing-armffa-command.patch | 12 ++++----
 ...troducing-MM-communication-with-FF-A.patch | 10 +++----
 ...troducing-test-module-for-UCLASS_FFA.patch |  8 ++---
 ...stone1000-enable-FF-A-and-MM-support.patch |  4 +--
 ...one1000-introduce-EFI-capsule-update.patch | 30 +++++++++----------
 ...000-Update-FFA-shared-buffer-address.patch |  4 +--
 ...e-sure-shared-buffer-contents-are-no.patch |  6 ++--
 ...000-fix-unrecognized-filesystem-type.patch |  4 +--
 ...tone1000-pass-interface-id-and-buffe.patch | 10 +++----
 ...stone1000-pass-interface-id-and-kern.patch |  6 ++--
 ...one1000-remove-guid-check-from-corst.patch | 21 ++++++-------
 ...-the-cast-when-using-binary-OR-on-FI.patch |  4 +--
 ...-error-code-when-rx-buffer-is-larger.patch |  6 ++--
 .../0020-Use-correct-buffer-size.patch        |  4 +--
 ...e-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch |  6 ++--
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |  8 ++---
 ...-add-get_image_info-for-corstone1000.patch | 14 ++++-----
 ...4-Comment-mm_communicate-failure-log.patch |  6 ++--
 ...bootcomplete-message-to-secure-encla.patch | 12 ++++----
 ...ull-pointer-exception-with-get_image.patch |  8 ++---
 ...027-arm-corstone1000-add-mmc-for-fvp.patch |  4 +--
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 29 files changed, 140 insertions(+), 138 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 2f665d02..91dbbfdb 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -22,7 +22,7 @@ TFM_SIGN_PRIVATE_KEY = "${S}/bl2/ext/mcuboot/root-RSA-3072_1.pem"
 RE_IMAGE_OFFSET = "0x1000"
 
 # u-boot
-PREFERRED_VERSION_u-boot ?= "2022.01"
+PREFERRED_VERSION_u-boot ?= "2022.04"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 UBOOT_CONFIG ??= "EFI"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
index d4cdbd10..d0ae964f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
@@ -1,4 +1,4 @@
-From 967aea010ca9c73ce6ef1b88a62c353b9b727a4b Mon Sep 17 00:00:00 2001
+From c047b15fba9da36616bc9a346d9fe4d76e7ca4b2 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 24 Jun 2021 09:25:00 +0100
 Subject: [PATCH 01/27] cmd: load: add load command for memory mapped
@@ -26,10 +26,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  6 files changed, 78 insertions(+)
 
 diff --git a/README b/README
-index 9606a8b3acf5..e78d816eea14 100644
+index f51f392111f9..049bcd108980 100644
 --- a/README
 +++ b/README
-@@ -2923,6 +2923,7 @@ rarpboot- boot image via network using RARP/TFTP protocol
+@@ -2760,6 +2760,7 @@ rarpboot- boot image via network using RARP/TFTP protocol
  diskboot- boot from IDE devicebootd   - boot default, i.e., run 'bootcmd'
  loads	- load S-Record file over serial line
  loadb	- load binary file over serial line (kermit mode)
@@ -38,7 +38,7 @@ index 9606a8b3acf5..e78d816eea14 100644
  mm	- memory modify (auto-incrementing)
  nm	- memory modify (constant address)
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 02c298fdbe4b..6262c08fd3a1 100644
+index 5e25e45fd288..ff50102a89c7 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
 @@ -1076,6 +1076,12 @@ config CMD_LOADB
@@ -55,7 +55,7 @@ index 02c298fdbe4b..6262c08fd3a1 100644
  	bool "loads"
  	default y
 diff --git a/cmd/bootefi.c b/cmd/bootefi.c
-index 83eab0bd7f18..698698a7d257 100644
+index 53d9f0e0dcca..8d492ea9e70c 100644
 --- a/cmd/bootefi.c
 +++ b/cmd/bootefi.c
 @@ -34,6 +34,18 @@ static struct efi_device_path *bootefi_device_path;
@@ -141,10 +141,10 @@ index 7e4a552d90ef..1224a7f85bb3 100644
 +);
 +#endif /* CONFIG_CMD_LOADM */
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index f4860e87fc1f..1866439ab51e 100644
+index af36639ec6a7..126db279dd3e 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -581,6 +581,8 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj *handle,
+@@ -585,6 +585,8 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj *handle,
  void efi_save_gd(void);
  /* Call this to relocate the runtime section to an address space */
  void efi_runtime_relocate(ulong offset, struct efi_mem_desc *map);
@@ -154,10 +154,10 @@ index f4860e87fc1f..1866439ab51e 100644
  void efi_add_handle(efi_handle_t obj);
  /* Create handle */
 diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_device_path.c
-index 735ed0bd0f4c..ccea2cd2a9dd 100644
+index 0542aaae16c7..d8dc59b2c95c 100644
 --- a/lib/efi_loader/efi_device_path.c
 +++ b/lib/efi_loader/efi_device_path.c
-@@ -1122,6 +1122,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
+@@ -1138,6 +1138,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
  {
  	struct blk_desc *desc = NULL;
  	struct disk_partition fs_partition;
@@ -166,7 +166,7 @@ index 735ed0bd0f4c..ccea2cd2a9dd 100644
  	int part = 0;
  	char *filename;
  	char *s;
-@@ -1137,6 +1139,13 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
+@@ -1153,6 +1155,13 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
  	} else if (!strcmp(dev, "Uart")) {
  		if (device)
  			*device = efi_dp_from_uart();
@@ -181,5 +181,5 @@ index 735ed0bd0f4c..ccea2cd2a9dd 100644
  		part = blk_get_device_part_str(dev, devnr, &desc, &fs_partition,
  					       1);
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
index f53de2ed..e0caaa44 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
@@ -1,4 +1,4 @@
-From 04b82ccd9ae7620039dff6cfb6445e62bd3be0b5 Mon Sep 17 00:00:00 2001
+From 5cc889db3279ef4944ab64e36db3dbab1bf9ffa5 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 15 Feb 2022 09:44:10 +0000
 Subject: [PATCH 02/27] arm: add support to corstone1000 platform
@@ -42,12 +42,12 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/corstone1000.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index f7f03837feb4..71c1e93eb7cf 100644
+index 4567c183fb84..d64051b533a7 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1250,6 +1250,12 @@ config TARGET_VEXPRESS64_JUNO
- 	select BLK
+@@ -1266,6 +1266,12 @@ config TARGET_VEXPRESS64_JUNO
  	select USB
+ 	imply OF_HAS_PRIOR_STAGE
  
 +config TARGET_CORSTONE1000
 +	bool "Support Corstone1000 Platform"
@@ -58,7 +58,7 @@ index f7f03837feb4..71c1e93eb7cf 100644
  config TARGET_TOTAL_COMPUTE
  	bool "Support Total Compute Platform"
  	select ARM64
-@@ -2152,6 +2158,8 @@ source "arch/arm/mach-nexell/Kconfig"
+@@ -2198,6 +2204,8 @@ source "arch/arm/mach-nexell/Kconfig"
  
  source "board/armltd/total_compute/Kconfig"
  
@@ -68,19 +68,19 @@ index f7f03837feb4..71c1e93eb7cf 100644
  source "board/bosch/guardian/Kconfig"
  source "board/Marvell/octeontx/Kconfig"
 diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index b3e2a9c9d77b..5f91fd0ad707 100644
+index 644ba961a223..7de25d09c9fe 100644
 --- a/arch/arm/dts/Makefile
 +++ b/arch/arm/dts/Makefile
-@@ -1163,6 +1163,9 @@ dtb-$(CONFIG_TARGET_IMX8MM_CL_IOT_GATE_OPTEE) += imx8mm-cl-iot-gate-optee.dtb
+@@ -1215,6 +1215,9 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) += lpc3250-ea3250.dtb
  
- dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) += lpc3250-ea3250.dtb
+ dtb-$(CONFIG_ARCH_QEMU) += qemu-arm.dtb qemu-arm64.dtb
  
 +dtb-$(CONFIG_TARGET_CORSTONE1000) += corstone1000-mps3.dtb \
 +				     corstone1000-fvp.dtb
 +
- targets += $(dtb-y)
+ include $(srctree)/scripts/Makefile.dts
  
- # Add any required device tree compiler flags here
+ targets += $(dtb-y)
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone1000-fvp.dts
 new file mode 100644
 index 000000000000..1fcc137a493c
@@ -673,5 +673,5 @@ index 000000000000..cf166f107efd
 +				"bootefi $kernel_addr_r $fdtcontroladdr;"
 +#endif
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
index e532dda6..9974915a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
@@ -1,4 +1,4 @@
-From c16e273f6ee7de6f1d226ac321c680340edc19f9 Mon Sep 17 00:00:00 2001
+From b8f4f76e135ff2061d0032292f5209ac911dba16 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:20:55 +0100
 Subject: [PATCH 03/27] usb: common: move urb code to common
@@ -364,7 +364,7 @@ diff --git a/drivers/usb/musb-new/usb-compat.h b/include/linux/usb/usb_urb_compa
 similarity index 60%
 rename from drivers/usb/musb-new/usb-compat.h
 rename to include/linux/usb/usb_urb_compat.h
-index 1c66c4fe3637..c166301659a6 100644
+index df68c9220a7a..5ed96fa64e96 100644
 --- a/drivers/usb/musb-new/usb-compat.h
 +++ b/include/linux/usb/usb_urb_compat.h
 @@ -1,16 +1,31 @@
@@ -493,5 +493,5 @@ index 6dd2c997f9b3..ec00161710a5 100644
  /*
   * Hub Status & Hub Change bit masks
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
index edb17364..5940f06d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
@@ -1,4 +1,4 @@
-From 9be02586557731eaab9387d440e3ba3e535b7073 Mon Sep 17 00:00:00 2001
+From 62a666a83766f5517e90464638455286bb33f433 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:31:25 +0100
 Subject: [PATCH 04/27] usb: add isp1760 family driver
@@ -34,10 +34,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 drivers/usb/isp1760/isp1760-uboot.h
 
 diff --git a/Makefile b/Makefile
-index a30098c66f8d..39907c548c00 100644
+index ad83d60dc39d..2c857c1fe2cc 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -833,6 +833,7 @@ libs-y += drivers/usb/host/
+@@ -834,6 +834,7 @@ libs-y += drivers/usb/host/
  libs-y += drivers/usb/mtu3/
  libs-y += drivers/usb/musb/
  libs-y += drivers/usb/musb-new/
@@ -3801,5 +3801,5 @@ index 000000000000..2486de6f9e27
 +
 +#endif
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
index 3264faea..2ce03b64 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
@@ -1,4 +1,4 @@
-From 19adc1dd6e5e8d530310fb8a703c473660e1d83d Mon Sep 17 00:00:00 2001
+From b7fb62e512e00a5fdbb4321bb0b4109261518481 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 3 Mar 2022 16:52:02 +0000
 Subject: [PATCH 05/27] corstone1000: enable isp1763 usb controller
@@ -44,5 +44,5 @@ index cf166f107efd..8ba0effb0ab2 100644
  				"boot_bank_flag=0x08002000\0"				\
  				"kernel_addr_bank_0=0x083EE000\0"			\
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
index b96b131a..8cc848fe 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
@@ -1,4 +1,4 @@
-From fb63805bdd396264a30eee9ce7b0dc0e4b2aa2b2 Mon Sep 17 00:00:00 2001
+From ede21dc1ca75132698cc81e88357c5789ccf67c7 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 16 Nov 2021 12:34:52 +0000
 Subject: [PATCH 06/27] arm_ffa: introducing Arm FF-A low-level driver
@@ -58,10 +58,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 lib/arm-ffa/arm_ffa_helper.c
 
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 90666ce376cd..6e791039c024 100644
+index 96582fc67777..14307e6da644 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -224,6 +224,14 @@ F:	board/CZ.NIC/
+@@ -232,6 +232,14 @@ F:	board/CZ.NIC/
  F:	configs/turris_*_defconfig
  F:	include/configs/turris_*.h
  
@@ -143,20 +143,20 @@ index 22fd541f9a28..45eca83a473c 100644
  	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, state));
  #endif
 diff --git a/common/board_r.c b/common/board_r.c
-index 31a59c585a8d..d3ebae718976 100644
+index c24d9b4e220b..af20f38b104c 100644
 --- a/common/board_r.c
 +++ b/common/board_r.c
-@@ -78,6 +78,9 @@
- #ifdef CONFIG_EFI_SETUP_EARLY
+@@ -61,6 +61,9 @@
+ #include <wdt.h>
+ #include <asm-generic/gpio.h>
  #include <efi_loader.h>
- #endif
 +#ifdef CONFIG_ARM_FFA_TRANSPORT
 +#include <arm_ffa_helper.h>
 +#endif
  
  DECLARE_GLOBAL_DATA_PTR;
  
-@@ -781,6 +784,9 @@ static init_fnc_t init_sequence_r[] = {
+@@ -770,6 +773,9 @@ static init_fnc_t init_sequence_r[] = {
  	INIT_FUNC_WATCHDOG_RESET
  	initr_net,
  #endif
@@ -2320,10 +2320,10 @@ index 7f2be2339475..54980a130fdb 100644
  
  #define arm_smccc_smc_quirk(...) __arm_smccc_smc(__VA_ARGS__)
 diff --git a/lib/Kconfig b/lib/Kconfig
-index 807a4c6ade06..333e35a90964 100644
+index 3c6fa99b1a6a..473821b882e2 100644
 --- a/lib/Kconfig
 +++ b/lib/Kconfig
-@@ -771,6 +771,7 @@ config SMBIOS_PARSER
+@@ -810,6 +810,7 @@ config SMBIOS_PARSER
  source lib/efi/Kconfig
  source lib/efi_loader/Kconfig
  source lib/optee/Kconfig
@@ -2332,7 +2332,7 @@ index 807a4c6ade06..333e35a90964 100644
  config TEST_FDTDEC
  	bool "enable fdtdec test"
 diff --git a/lib/Makefile b/lib/Makefile
-index 5ddbc77ed6d8..ddfd70997da4 100644
+index 11b03d1cbec8..8e6fad613067 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
 @@ -9,6 +9,7 @@ obj-$(CONFIG_EFI) += efi/
@@ -2564,7 +2564,7 @@ index 000000000000..623899d38044
 +	return 0;
 +}
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index 20b69699fe94..eaa43d784ef1 100644
+index 5bcb8253edba..cffa2c69d621 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -23,6 +23,10 @@
@@ -2606,5 +2606,5 @@ index 20b69699fe94..eaa43d784ef1 100644
  	efi_runtime_detach();
  
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
index 94f546c2..83f0547e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
@@ -1,4 +1,4 @@
-From 67b65583edcea5b519f196741f523df8b4b48162 Mon Sep 17 00:00:00 2001
+From 541b2b51dc77832ab5845cab4762d29976838d36 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 16 Nov 2021 12:36:27 +0000
 Subject: [PATCH 07/27] arm_ffa: introducing armffa command
@@ -20,10 +20,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 cmd/armffa.c
 
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 6e791039c024..71c77b58b0ce 100644
+index 14307e6da644..f3fd559da54a 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -227,6 +227,7 @@ F:	include/configs/turris_*.h
+@@ -235,6 +235,7 @@ F:	include/configs/turris_*.h
  ARM FF-A
  M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
  S:	Maintained
@@ -32,7 +32,7 @@ index 6e791039c024..71c77b58b0ce 100644
  F:	include/arm_ffa.h
  F:	include/arm_ffa_helper.h
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 6262c08fd3a1..a6108d156311 100644
+index ff50102a89c7..ff124bf4bad0 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
 @@ -813,6 +813,16 @@ endmenu
@@ -53,7 +53,7 @@ index 6262c08fd3a1..a6108d156311 100644
  	#depends on FLASH_CFI_DRIVER
  	bool "armflash"
 diff --git a/cmd/Makefile b/cmd/Makefile
-index e31ac15ef757..e41d4a3d0651 100644
+index 166c652d9825..770b846c44e0 100644
 --- a/cmd/Makefile
 +++ b/cmd/Makefile
 @@ -12,6 +12,8 @@ obj-y += panic.o
@@ -338,5 +338,5 @@ index 000000000000..71a6ebb656d1
 +	   "devlist\n"
 +	   "	 - displays the arm_ffa device info\n");
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
index 918a64c2..9b1383eb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
@@ -1,4 +1,4 @@
-From 4445ccbdd5ef52a6ca041d670f46d9aff104c0a0 Mon Sep 17 00:00:00 2001
+From 2f09d4a2e87febd7365b9e18d669208ff2c35edc Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 13 Oct 2021 17:51:44 +0100
 Subject: [PATCH 08/27] arm_ffa: introducing MM communication with FF-A
@@ -30,7 +30,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  2 files changed, 273 insertions(+), 6 deletions(-)
 
 diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
-index 24f9a2bb7571..4c914c712275 100644
+index e5e35fe51f65..6827b821545e 100644
 --- a/lib/efi_loader/Kconfig
 +++ b/lib/efi_loader/Kconfig
 @@ -56,13 +56,23 @@ config EFI_VARIABLE_FILE_STORE
@@ -60,7 +60,7 @@ index 24f9a2bb7571..4c914c712275 100644
  
  config EFI_VARIABLES_PRESEED
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index a2c65e369478..97c41b69dd78 100644
+index dfef18435dfa..9cb8cfb9c779 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
 @@ -15,6 +15,28 @@
@@ -369,7 +369,7 @@ index a2c65e369478..97c41b69dd78 100644
  	/*
  	 * There seems to be a bug in EDK2 miscalculating the boundaries and
  	 * size checks, so deduct 2 more bytes to fulfill this requirement. Fix
-@@ -688,7 +945,7 @@ void efi_variables_boot_exit_notify(void)
+@@ -697,7 +954,7 @@ void efi_variables_boot_exit_notify(void)
  		ret = EFI_NOT_FOUND;
  
  	if (ret != EFI_SUCCESS)
@@ -379,5 +379,5 @@ index a2c65e369478..97c41b69dd78 100644
  
  	/*
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
index 329e0d21..4fb317ba 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
@@ -1,4 +1,4 @@
-From 66bfe0c863c75d5e82d3a3d5eb0967fa702e4792 Mon Sep 17 00:00:00 2001
+From c9a2c457648b732292482fae59a7fd61cefffd33 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 16 Nov 2021 12:38:48 +0000
 Subject: [PATCH 09/27] arm_ffa: introducing test module for UCLASS_FFA
@@ -17,10 +17,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 test/dm/ffa.h
 
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 71c77b58b0ce..9608fa30af7d 100644
+index f3fd559da54a..6510f844fe09 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -232,6 +232,7 @@ F:	drivers/arm-ffa/
+@@ -240,6 +240,7 @@ F:	drivers/arm-ffa/
  F:	include/arm_ffa.h
  F:	include/arm_ffa_helper.h
  F:	lib/arm-ffa/
@@ -128,5 +128,5 @@ index 000000000000..a0802bd6928a
 +
 +#endif /*__TEST_DM_FFA_H */
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
index 8e8c7ec7..bc96fc46 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
@@ -1,4 +1,4 @@
-From 7c5cad61d72f76d55e5d49ba412c94823a1a6113 Mon Sep 17 00:00:00 2001
+From ce6598d255113458fd5c9d19bb7469b721e37f6f Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 2 Nov 2021 16:44:39 +0000
 Subject: [PATCH 10/27] arm_ffa: corstone1000: enable FF-A and MM support
@@ -53,5 +53,5 @@ index 8ba0effb0ab2..afc9ccfc192b 100644
  #define CONFIG_SKIP_LOWLEVEL_INIT
  
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
index 7fd14758..cb24ec3e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
@@ -1,4 +1,4 @@
-From e6a9c52b70e53d359e24ec024716c40391b77572 Mon Sep 17 00:00:00 2001
+From e70d0128090158872847b82b82cdbcf0e2f13885 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 11 Nov 2021 16:27:59 +0000
 Subject: [PATCH 11/27] efi: corstone1000: introduce EFI capsule update
@@ -58,10 +58,10 @@ index afc9ccfc192b..a400cdef69d0 100644
  #define MM_SP_UUID_DATA	\
  	0xed, 0x32, 0xd5, 0x33,	\
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 1866439ab51e..529051c83206 100644
+index 126db279dd3e..01b432e6184b 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -957,11 +957,11 @@ extern const struct efi_firmware_management_protocol efi_fmp_fit;
+@@ -965,11 +965,11 @@ extern const struct efi_firmware_management_protocol efi_fmp_fit;
  extern const struct efi_firmware_management_protocol efi_fmp_raw;
  
  /* Capsule update */
@@ -76,7 +76,7 @@ index 1866439ab51e..529051c83206 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index eaa43d784ef1..c3e67f791312 100644
+index cffa2c69d621..5c77a40c3ebe 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -2096,6 +2096,44 @@ static void efi_exit_caches(void)
@@ -141,10 +141,10 @@ index eaa43d784ef1..c3e67f791312 100644
  	efi_set_watchdog(0);
  	WATCHDOG_RESET();
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 8301eed6317d..5a5936b03325 100644
+index f00440163d41..c100c1b95298 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -23,6 +23,14 @@
+@@ -24,6 +24,14 @@
  #include <crypto/pkcs7_parser.h>
  #include <linux/err.h>
  
@@ -159,7 +159,7 @@ index 8301eed6317d..5a5936b03325 100644
  DECLARE_GLOBAL_DATA_PTR;
  
  const efi_guid_t efi_guid_capsule_report = EFI_CAPSULE_REPORT_GUID;
-@@ -508,6 +516,89 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -509,6 +517,89 @@ static efi_status_t efi_capsule_update_firmware(
  }
  #endif /* CONFIG_EFI_CAPSULE_FIRMWARE_MANAGEMENT */
  
@@ -249,7 +249,7 @@ index 8301eed6317d..5a5936b03325 100644
  /**
   * efi_update_capsule() - process information from operating system
   * @capsule_header_array:	Array of virtual address pointers
-@@ -521,7 +612,7 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -522,7 +613,7 @@ static efi_status_t efi_capsule_update_firmware(
   *
   * Return:			status code
   */
@@ -258,7 +258,7 @@ index 8301eed6317d..5a5936b03325 100644
  		struct efi_capsule_header **capsule_header_array,
  		efi_uintn_t capsule_count,
  		u64 scatter_gather_list)
-@@ -538,6 +629,13 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -539,6 +630,13 @@ efi_status_t EFIAPI efi_update_capsule(
  		goto out;
  	}
  
@@ -272,9 +272,9 @@ index 8301eed6317d..5a5936b03325 100644
  	ret = EFI_SUCCESS;
  	for (i = 0, capsule = *capsule_header_array; i < capsule_count;
  	     i++, capsule = *(++capsule_header_array)) {
-@@ -550,6 +648,39 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -551,6 +649,39 @@ efi_status_t EFIAPI efi_update_capsule(
  
- 		log_debug("Capsule[%d] (guid:%pUl)\n",
+ 		log_debug("Capsule[%d] (guid:%pUs)\n",
  			  i, &capsule->capsule_guid);
 +
 +#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
@@ -312,7 +312,7 @@ index 8301eed6317d..5a5936b03325 100644
  		if (!guidcmp(&capsule->capsule_guid,
  			     &efi_guid_firmware_management_capsule_id)) {
  			ret  = efi_capsule_update_firmware(capsule);
-@@ -588,7 +719,7 @@ out:
+@@ -589,7 +720,7 @@ out:
   *
   * Return:			status code
   */
@@ -322,7 +322,7 @@ index 8301eed6317d..5a5936b03325 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 49172e357989..bac1873d77db 100644
+index eee54e48784f..989380d4f8cd 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -16,6 +16,13 @@
@@ -352,8 +352,8 @@ index 49172e357989..bac1873d77db 100644
 +#endif
 +
  	if (IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_UPDATE)) {
- 		ret = efi_set_variable_int(L"CapsuleMax",
+ 		ret = efi_set_variable_int(u"CapsuleMax",
  					   &efi_guid_capsule_report,
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
index 27b01822..60dc8501 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
@@ -1,4 +1,4 @@
-From caf37b5d45d43929de5c076b24b14a17682ce9e1 Mon Sep 17 00:00:00 2001
+From b2d752b4bbd5b2dc4cb22d2d652a261287505926 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:28:06 +0000
 Subject: [PATCH 12/27] corstone1000: Update FFA shared buffer address
@@ -33,5 +33,5 @@ index a400cdef69d0..db0f91335cef 100644
  #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
  #define CONFIG_SKIP_LOWLEVEL_INIT
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
index 17055b8d..2495538d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
@@ -1,4 +1,4 @@
-From ba83ce7fae42ced6ec25108cd96dd31c534d2706 Mon Sep 17 00:00:00 2001
+From 67a755f74716068cfd44a8897c31151fe9ee4328 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Thu, 18 Nov 2021 16:42:59 +0000
 Subject: [PATCH 13/27] corstone1000: Make sure shared buffer contents are not
@@ -24,7 +24,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 6 insertions(+)
 
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index 97c41b69dd78..a32f119c8c2b 100644
+index 9cb8cfb9c779..b6be2b54a030 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
 @@ -22,6 +22,7 @@
@@ -48,5 +48,5 @@ index 97c41b69dd78..a32f119c8c2b 100644
  
  	ffa_ret = ffa_notify_mm_sp();
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
index 94598fe4..fa201eb9 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
@@ -1,4 +1,4 @@
-From 06956d4795504870bcb74c93d9cef27878d462e6 Mon Sep 17 00:00:00 2001
+From e2463e3ef52260b38131085c0901de8708d52693 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
 Subject: [PATCH 14/27] arm: corstone1000: fix unrecognized filesystem type
@@ -26,5 +26,5 @@ index c9e2d7343ce2..ae72338323ba 100644
  	result = usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
  				&actlen, USB_CNTL_TIMEOUT*5);
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
index 6c86e0e9..0d1912c8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
@@ -1,4 +1,4 @@
-From e41722d9079dec5d0cd01884c5ac8855035e7ebb Mon Sep 17 00:00:00 2001
+From 81bf9ed7e8e858cef13cfc3d1435c44445e523df Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:03:35 +0000
 Subject: [PATCH 15/27] efi_capsule: corstone1000: pass interface id and buffer
@@ -39,10 +39,10 @@ index db0f91335cef..a7445e61348b 100644
  #define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
  
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 5a5936b03325..598451f71b09 100644
+index c100c1b95298..17d769803b2a 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -26,6 +26,8 @@
+@@ -27,6 +27,8 @@
  #ifdef CONFIG_TARGET_CORSTONE1000
  #include <arm_ffa_helper.h>
  #include <cpu_func.h>
@@ -51,7 +51,7 @@ index 5a5936b03325..598451f71b09 100644
  
  void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared buffer virtual address */
  efi_guid_t corstone1000_capsule_guid = EFI_CORSTONE1000_CAPSULE_ID_GUID;
-@@ -586,11 +588,12 @@ static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_s
+@@ -587,11 +589,12 @@ static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_s
  	func_data.data0 = &part_id;
  
  	/*
@@ -69,5 +69,5 @@ index 5a5936b03325..598451f71b09 100644
  	func_data.data1_size = sizeof(msg);
  	func_data.data1 = &msg;
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
index 5afd01f9..f460fad8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
@@ -1,4 +1,4 @@
-From d6de873b77cdb748b3bd0e4a5de7f82bcf1241df Mon Sep 17 00:00:00 2001
+From 10d0ffc26ddcecd83921c2b3b37cb4eff54a154f Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:10:41 +0000
 Subject: [PATCH 16/27] efi_boottime: corstone1000: pass interface id and
@@ -21,7 +21,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 10 insertions(+), 3 deletions(-)
 
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index c3e67f791312..6743ec6483b4 100644
+index 5c77a40c3ebe..b58a8c98fd05 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -27,6 +27,11 @@
@@ -53,5 +53,5 @@ index c3e67f791312..6743ec6483b4 100644
  	func_data.data1_size = sizeof(msg);
  	func_data.data1 = &msg;
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
index 0ca392a4..fa6ab326 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
@@ -1,4 +1,4 @@
-From 3b3e08c2960713f613dd5ef671b3fe468f351e3c Mon Sep 17 00:00:00 2001
+From c463798489e41725f8ba33debeedc7c4011cda38 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
 Subject: [PATCH 17/27] efi_loader: corstone1000: remove guid check from
@@ -10,14 +10,14 @@ CORSTONE1000 target.
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- lib/efi_loader/efi_capsule.c | 15 +--------------
- 1 file changed, 1 insertion(+), 14 deletions(-)
+ lib/efi_loader/efi_capsule.c | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
 
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 598451f71b09..1475bef7030b 100644
+index 17d769803b2a..939040d2755e 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -653,12 +653,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+@@ -654,12 +654,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
  			  i, &capsule->capsule_guid);
  
  #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
@@ -30,7 +30,7 @@ index 598451f71b09..1475bef7030b 100644
  		if (efi_size_in_pages(capsule->capsule_image_size) >
  		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
  			log_err("Corstone1000: Capsule data size exceeds the shared buffer size\n");
-@@ -684,14 +678,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+@@ -685,15 +679,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
  		goto out;
  #endif
  
@@ -38,14 +38,15 @@ index 598451f71b09..1475bef7030b 100644
 -			     &efi_guid_firmware_management_capsule_id)) {
 -			ret  = efi_capsule_update_firmware(capsule);
 -		} else {
--			log_err("Unsupported capsule type: %pUl\n",
+-			log_err("Unsupported capsule type: %pUs\n",
 -				&capsule->capsule_guid);
 -			ret = EFI_UNSUPPORTED;
 -		}
-+		ret = efi_capsule_update_firmware(capsule);
- 
+-
++		ret  = efi_capsule_update_firmware(capsule);
  		if (ret != EFI_SUCCESS)
  			goto out;
+ 	}
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
index 21e67780..4ee10a0b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
@@ -1,4 +1,4 @@
-From 12522dd5d6146abbf49e917bbd1b2b67ae8f9b56 Mon Sep 17 00:00:00 2001
+From 1cfca60850727448bdbfe720d98d9e0d4523f6aa Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Sat, 11 Dec 2021 21:05:10 +0000
 Subject: [PATCH 18/27] arm_ffa: removing the cast when using binary OR on
@@ -36,5 +36,5 @@ index 38ea4ba83efc..d0db3ef508a1 100644
  /* The FF-A SMC function prototype definition */
  
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
index c9d3e7b1..21a89a40 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
@@ -1,4 +1,4 @@
-From 127588a2e1eef934a33d67b2eebd8ca4f9fd20a7 Mon Sep 17 00:00:00 2001
+From 7db27eeaba0fd5ddb1e49977bb7e342a1980aa3d Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Sun, 12 Dec 2021 17:51:17 +0000
 Subject: [PATCH 19/27] Return proper error code when rx buffer is larger
@@ -14,7 +14,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index a32f119c8c2b..03cc379482f8 100644
+index b6be2b54a030..38655a9dbb7c 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
 @@ -358,7 +358,7 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
@@ -27,5 +27,5 @@ index a32f119c8c2b..03cc379482f8 100644
  
  		efi_memcpy_runtime(comm_buf, virt_shared_buf, rx_data_size);
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch
index da2ddaa2..54328a73 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch
@@ -1,4 +1,4 @@
-From 6a1d4ea19a4a46e43948fa753ed37c0bafda6356 Mon Sep 17 00:00:00 2001
+From 9ad9ead58e8e9e4f9e7a283c916421b443b424ce Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Mon, 13 Dec 2021 15:25:23 +0000
 Subject: [PATCH 20/27] Use correct buffer size
@@ -36,5 +36,5 @@ index e65fbde60d0a..bb9919095649 100644
  	efi_uintn_t data_size;
  	efi_uintn_t name_size;
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
index c380d2d9..c7ac38f7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
@@ -1,4 +1,4 @@
-From d220bf1805862c953d8adab799deaf7d0d3b2754 Mon Sep 17 00:00:00 2001
+From b81214dea7056c3877aa9eb775557dc4702660ec Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Sun, 12 Dec 2021 17:58:08 +0000
 Subject: [PATCH 21/27] Update comm_buf when EFI_BUFFER_TOO_SMALL
@@ -14,7 +14,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 1 insertion(+)
 
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index 03cc379482f8..fe3a5a7083fd 100644
+index 38655a9dbb7c..67743d1f8fce 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
 @@ -357,6 +357,7 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
@@ -26,5 +26,5 @@ index 03cc379482f8..fe3a5a7083fd 100644
  			return EFI_BUFFER_TOO_SMALL;
  		}
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
index 355104ab..aaea20e6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,4 +1,4 @@
-From 00192c17937fabc7b15191325b66b0616e2a4b77 Mon Sep 17 00:00:00 2001
+From 5fec641015f8f1ca80f55f05b5e1f67653321303 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
 Subject: [PATCH 22/27] efi_loader: populate ESRT table if EFI_ESRT config
@@ -14,10 +14,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 7 insertions(+)
 
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 1475bef7030b..9ffc46375341 100644
+index 939040d2755e..790d2ba8fe19 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -675,6 +675,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+@@ -676,6 +676,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
  			ret = EFI_SUCCESS;
  		}
  
@@ -32,5 +32,5 @@ index 1475bef7030b..9ffc46375341 100644
  #endif
  
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
index 61b9319e..c86b6581 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
@@ -1,4 +1,4 @@
-From 87aa9028bc939ed5924f72cd61835b8737790d41 Mon Sep 17 00:00:00 2001
+From 34fadec4f659248a6020676f5894895977ccf79d Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
 Subject: [PATCH 23/27] efi_firmware: add get_image_info for corstone1000
@@ -16,10 +16,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 63 insertions(+), 1 deletion(-)
 
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
-index a1b88dbfc286..85fb5254ebd5 100644
+index a5ff32f121f4..9eb89849b28d 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -238,6 +238,7 @@ const efi_guid_t efi_firmware_image_type_uboot_fit =
+@@ -241,6 +241,7 @@ const efi_guid_t efi_firmware_image_type_uboot_fit =
   *
   * Return		status code
   */
@@ -27,7 +27,7 @@ index a1b88dbfc286..85fb5254ebd5 100644
  static
  efi_status_t EFIAPI efi_firmware_fit_get_image_info(
  	struct efi_firmware_management_protocol *this,
-@@ -329,6 +330,56 @@ const struct efi_firmware_management_protocol efi_fmp_fit = {
+@@ -332,6 +333,56 @@ const struct efi_firmware_management_protocol efi_fmp_fit = {
  const efi_guid_t efi_firmware_image_type_uboot_raw =
  	EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID;
  
@@ -84,7 +84,7 @@ index a1b88dbfc286..85fb5254ebd5 100644
  /**
   * efi_firmware_raw_get_image_info - return information about the current
  				     firmware image
-@@ -373,12 +424,20 @@ efi_status_t EFIAPI efi_firmware_raw_get_image_info(
+@@ -376,12 +427,20 @@ efi_status_t EFIAPI efi_firmware_raw_get_image_info(
  	     !descriptor_size || !package_version || !package_version_name))
  		return EFI_EXIT(EFI_INVALID_PARAMETER);
  
@@ -106,7 +106,7 @@ index a1b88dbfc286..85fb5254ebd5 100644
  	return EFI_EXIT(ret);
  }
  
-@@ -459,6 +518,9 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+@@ -462,6 +521,9 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
  
  	}
  
@@ -117,5 +117,5 @@ index a1b88dbfc286..85fb5254ebd5 100644
  			     NULL, NULL))
  		return EFI_EXIT(EFI_DEVICE_ERROR);
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
index 0881d734..c6a1aed2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
@@ -1,4 +1,4 @@
-From bcf3c59b1a73c7291d1acdbb23a36341020db32a Mon Sep 17 00:00:00 2001
+From c0c6e4c1166c4868afc36649b9ed98081a6966e1 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Fri, 24 Dec 2021 14:22:52 +0000
 Subject: [PATCH 24/27] Comment mm_communicate failure log
@@ -14,7 +14,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index fe3a5a7083fd..8e2496a840a4 100644
+index 67743d1f8fce..a34989efac83 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
 @@ -411,7 +411,10 @@ static efi_status_t __efi_runtime mm_communicate(u8 *comm_buf, efi_uintn_t dsize
@@ -30,5 +30,5 @@ index fe3a5a7083fd..8e2496a840a4 100644
  	}
  
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch
index e208022b..d5a0ec0b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch
@@ -1,4 +1,4 @@
-From 69bded9c0eddae50a9346a316c359f75057bd5c3 Mon Sep 17 00:00:00 2001
+From af2defbfaffa4264052e30f269b91794068e4773 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Wed, 5 Jan 2022 17:56:09 +0000
 Subject: [PATCH 25/27] efi_loader: send bootcomplete message to secure enclave
@@ -32,7 +32,7 @@ index a7445e61348b..06b605e43bdf 100644
  #define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
  #define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (x)))
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index 6743ec6483b4..28185c0d7750 100644
+index b58a8c98fd05..d0703060491b 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -2101,46 +2101,6 @@ static void efi_exit_caches(void)
@@ -99,10 +99,10 @@ index 6743ec6483b4..28185c0d7750 100644
  	efi_set_watchdog(0);
  	WATCHDOG_RESET();
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
-index 85fb5254ebd5..a7f7598eab02 100644
+index 9eb89849b28d..477ad072070e 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -353,7 +353,7 @@ static efi_status_t efi_corstone1000_img_info_get (
+@@ -356,7 +356,7 @@ static efi_status_t efi_corstone1000_img_info_get (
  		*package_version_name = NULL; /* not supported */
  
  	if(image_info == NULL) {
@@ -112,7 +112,7 @@ index 85fb5254ebd5..a7f7598eab02 100644
  	}
  
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index bac1873d77db..d55992715c67 100644
+index 989380d4f8cd..515a0bdf74ef 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -17,6 +17,9 @@
@@ -187,5 +187,5 @@ index bac1873d77db..d55992715c67 100644
  	if (ret != EFI_SUCCESS) {
  		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n");
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch
index 679c0974..532e8726 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch
@@ -1,4 +1,4 @@
-From c1b959c9a3a4f09bbe69d088211bd0ecd0d0a071 Mon Sep 17 00:00:00 2001
+From 2da8554ab732c59c7ca624ac4b16412fa9c2e39c Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
 Subject: [PATCH 26/27] efi_loader: fix null pointer exception with
@@ -16,10 +16,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 11 insertions(+), 8 deletions(-)
 
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
-index a7f7598eab02..d5f4788c8fdb 100644
+index 477ad072070e..f99c57fde576 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -344,26 +344,29 @@ static efi_status_t efi_corstone1000_img_info_get (
+@@ -347,26 +347,29 @@ static efi_status_t efi_corstone1000_img_info_get (
  	int i = 0;
  
  	*image_info_size = sizeof(*image_info);
@@ -58,5 +58,5 @@ index a7f7598eab02..d5f4788c8fdb 100644
  					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
  	image_info[i].attributes_setting = IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch
index ef0e9c6f..bf95ed72 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch
@@ -1,4 +1,4 @@
-From fcae21d3dc049dd5a54e7515085b04ac1f887486 Mon Sep 17 00:00:00 2001
+From cbf16548dc6dcc8eea97aa18c6ae17fb848e5c6c Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 5 Apr 2022 10:24:38 +0100
 Subject: [PATCH 27/27] arm:corstone1000: add mmc for fvp
@@ -144,5 +144,5 @@ index 06b605e43bdf..d9855bf91ebf 100644
  #include <config_distro_bootcmd.h>
  
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index a9baaa0f..a4e05a6e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -10,6 +10,7 @@ SRC_URI:append:corstone500 = " \
 #
 # Corstone1000 64-bit machines
 #
+DEPENDS:append:corstone1000 = " gnutls-native"
 CORSTONE1000_DEVICE_TREE:corstone1000-mps3 = "corstone1000-mps3"
 CORSTONE1000_DEVICE_TREE:corstone1000-fvp = "corstone1000-fvp"
 EXTRA_OEMAKE:append:corstone1000 = ' DEVICE_TREE=${CORSTONE1000_DEVICE_TREE}'
-- 
2.17.1


