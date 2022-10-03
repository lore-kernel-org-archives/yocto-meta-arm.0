Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D0DC43217
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.63.1664802070522941427
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E138416F8;
	Mon,  3 Oct 2022 06:01:16 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D090F3F73B;
	Mon,  3 Oct 2022 06:01:07 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 02/12] arm-bsp/u-boot: corstone1000: upgrade FF-A support
Date: Mon,  3 Oct 2022 14:00:41 +0100
Message-Id: <20221003130051.28934-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3896

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

update the FF-A patchset with the one sent to the u-boot mailing list

cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...d-add-load-command-for-memory-mapped.patch |   19 +-
 ...add-support-to-corstone1000-platform.patch |   29 +-
 ...3-usb-common-move-urb-code-to-common.patch |   27 +-
 .../0004-usb-add-isp1760-family-driver.patch  |   33 +-
 ...ne1000-enable-isp1763-usb-controller.patch |   11 +-
 ...support-for-SMCCCv1.2-x0-x17-registe.patch |  204 ++
 ...ntroducing-Arm-FF-A-low-level-driver.patch | 2610 -----------------
 ...ear-the-Xn-registers-after-SMC-calls.patch |   59 +
 ...troducing-MM-communication-with-FF-A.patch |  383 ---
 ...oduce-be_uuid_str_to_le_bin-function.patch |  127 +
 ...-introduce-Arm-FF-A-low-level-driver.patch | 2245 ++++++++++++++
 ...troducing-test-module-for-UCLASS_FFA.patch |  132 -
 ...10-arm_ffa-introduce-armffa-command.patch} |  158 +-
 ...fa-introduce-the-FF-A-Sandbox-driver.patch | 1185 ++++++++
 ...ce-Sandbox-test-cases-for-UCLASS_FFA.patch |  455 +++
 ...ntroduce-armffa-command-Sandbox-test.patch |   94 +
 ...e-sure-shared-buffer-contents-are-no.patch |   52 -
 ..._ffa-introduce-FF-A-MM-communication.patch |  540 ++++
 ...tone1000-enable-FF-A-and-MM-support.patch} |   32 +-
 ...ne1000-introduce-EFI-capsule-update.patch} |   83 +-
 ...00-Update-FFA-shared-buffer-address.patch} |   17 +-
 ...00-fix-unrecognized-filesystem-type.patch} |    9 +-
 ...-the-cast-when-using-binary-OR-on-FI.patch |   40 -
 .../0019-Use-correct-buffer-size.patch        |   40 -
 ...one1000-pass-interface-id-and-buffe.patch} |   31 +-
 ...tone1000-pass-interface-id-and-kern.patch} |   27 +-
 ...ne1000-remove-guid-check-from-corst.patch} |   13 +-
 ...te-ESRT-table-if-EFI_ESRT-config-op.patch} |   11 +-
 ...add-get_image_info-for-corstone1000.patch} |   12 +-
 ...ootcomplete-message-to-secure-encla.patch} |   88 +-
 ...ll-pointer-exception-with-get_image.patch} |    9 +-
 ...26-arm-corstone1000-add-mmc-for-fvp.patch} |   17 +-
 ...orstone1000-use-a-compressed-kernel.patch} |    0
 ...-external-sys-driver-to-device-tree.patch} |    4 +-
 ...-rpmsg-client-to-u-boot-device-tree.patch} |    4 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   58 +-
 36 files changed, 5246 insertions(+), 3612 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0007-arm_ffa-introducing-armffa-command.patch => 0010-arm_ffa-introduce-armffa-command.patch} (72%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm_ffa-introduce-armffa-command-Sandbox-test.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm_ffa-introduce-FF-A-MM-communication.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch => 0015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch} (65%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0011-efi-corstone1000-introduce-EFI-capsule-update.patch => 0016-efi-corstone1000-introduce-EFI-capsule-update.patch} (82%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0012-corstone1000-Update-FFA-shared-buffer-address.patch => 0017-corstone1000-Update-FFA-shared-buffer-address.patch} (72%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch => 0018-arm-corstone1000-fix-unrecognized-filesystem-type.patch} (76%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Use-correct-buffer-size.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch => 0019-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch} (73%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch => 0020-efi_boottime-corstone1000-pass-interface-id-and-kern.patch} (65%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch => 0021-efi_loader-corstone1000-remove-guid-check-from-corst.patch} (79%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch => 0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch} (75%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0021-efi_firmware-add-get_image_info-for-corstone1000.patch => 0023-efi_firmware-add-get_image_info-for-corstone1000.patch} (94%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch => 0024-efi_loader-send-bootcomplete-message-to-secure-encla.patch} (69%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-efi_loader-fix-null-pointer-exception-with-get_image.patch => 0025-efi_loader-fix-null-pointer-exception-with-get_image.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0024-arm-corstone1000-add-mmc-for-fvp.patch => 0026-arm-corstone1000-add-mmc-for-fvp.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0025-corstone1000-use-a-compressed-kernel.patch => 0027-corstone1000-use-a-compressed-kernel.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0026-Introduce-external-sys-driver-to-device-tree.patch => 0028-Introduce-external-sys-driver-to-device-tree.patch} (94%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch => 0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch} (97%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
index dc64e3cf..4d7c51fc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
@@ -1,7 +1,7 @@
-From 7a1a84ea74fdd06a7f5f239f4c5f4b727d6cd232 Mon Sep 17 00:00:00 2001
+From 910760408430de32ad08b1e5ddf894cc9f2f3d0c Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 24 Jun 2021 09:25:00 +0100
-Subject: [PATCH 01/24] cmd: load: add load command for memory mapped
+Subject: [PATCH 01/26] cmd: load: add load command for memory mapped
 
 cp.b is used a lot as a way to load binaries to memory and execute
 them, however we may need to integrate this with the efi subsystem to
@@ -16,6 +16,7 @@ with this a kernel with CONFIG_EFI_STUB enabled will be loaded and
 then subsequently booted with bootefi command.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Accepted [2022.10-rc1]
 ---
  README                           |  1 +
  cmd/Kconfig                      |  6 ++++
@@ -26,7 +27,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  6 files changed, 78 insertions(+)
 
 diff --git a/README b/README
-index b7ab6e50708d..cd76f95e74c1 100644
+index b7ab6e5070..cd76f95e74 100644
 --- a/README
 +++ b/README
 @@ -2578,6 +2578,7 @@ rarpboot- boot image via network using RARP/TFTP protocol
@@ -38,7 +39,7 @@ index b7ab6e50708d..cd76f95e74c1 100644
  mm	- memory modify (auto-incrementing)
  nm	- memory modify (constant address)
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 09193b61b95f..ba2f321ae989 100644
+index 09193b61b9..ba2f321ae9 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
 @@ -1143,6 +1143,12 @@ config CMD_LOADB
@@ -55,7 +56,7 @@ index 09193b61b95f..ba2f321ae989 100644
  	bool "loads"
  	default y
 diff --git a/cmd/bootefi.c b/cmd/bootefi.c
-index 827fcd97dfd8..37ce659fa123 100644
+index 827fcd97df..37ce659fa1 100644
 --- a/cmd/bootefi.c
 +++ b/cmd/bootefi.c
 @@ -34,6 +34,18 @@ static struct efi_device_path *bootefi_device_path;
@@ -78,7 +79,7 @@ index 827fcd97dfd8..37ce659fa123 100644
   * efi_clear_bootdev() - clear boot device
   */
 diff --git a/cmd/load.c b/cmd/load.c
-index 7e4a552d90ef..1224a7f85bb3 100644
+index 7e4a552d90..1224a7f85b 100644
 --- a/cmd/load.c
 +++ b/cmd/load.c
 @@ -1063,6 +1063,44 @@ static ulong load_serial_ymodem(ulong offset, int mode)
@@ -141,7 +142,7 @@ index 7e4a552d90ef..1224a7f85bb3 100644
 +);
 +#endif /* CONFIG_CMD_LOADM */
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 11930fbea838..5b41985244e2 100644
+index 11930fbea8..5b41985244 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
 @@ -591,6 +591,8 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj *handle,
@@ -154,7 +155,7 @@ index 11930fbea838..5b41985244e2 100644
  void efi_add_handle(efi_handle_t obj);
  /* Create handle */
 diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_device_path.c
-index 171661b89727..2493d7432613 100644
+index 171661b897..2493d74326 100644
 --- a/lib/efi_loader/efi_device_path.c
 +++ b/lib/efi_loader/efi_device_path.c
 @@ -1158,6 +1158,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
@@ -181,5 +182,5 @@ index 171661b89727..2493d7432613 100644
  		part = blk_get_device_part_str(dev, devnr, &desc, &fs_partition,
  					       1);
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
index 18636290..4c7c9b14 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
@@ -1,7 +1,7 @@
-From c9a9a467bb335047812004dd022dcadf9514101f Mon Sep 17 00:00:00 2001
+From 3523b1bac430f10f02a31f7d013ea369e29656be Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 15 Feb 2022 09:44:10 +0000
-Subject: [PATCH 02/24] arm: add support to corstone1000 platform
+Subject: [PATCH 02/26] arm: add support to corstone1000 platform
 
 Corstone1000 is a platform from arm, which includes pre
 verified Corstone SSE710 sub-system that combines Cortex-A and
@@ -18,6 +18,7 @@ FPGA MPS3 board implementation of this platform. [2]
 
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Accepted [2022.10-rc1]
 ---
  arch/arm/Kconfig                         |   8 ++
  arch/arm/dts/Makefile                    |   3 +
@@ -42,7 +43,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/corstone1000.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 9898c7d68e1b..2fc2b7d20f12 100644
+index 9898c7d68e..2fc2b7d20f 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
 @@ -1347,6 +1347,12 @@ config ARCH_VEXPRESS64
@@ -68,7 +69,7 @@ index 9898c7d68e1b..2fc2b7d20f12 100644
  source "board/bosch/guardian/Kconfig"
  source "board/Marvell/octeontx/Kconfig"
 diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index a7e0d9f6c0e8..8c8f15b6a813 100644
+index a7e0d9f6c0..8c8f15b6a8 100644
 --- a/arch/arm/dts/Makefile
 +++ b/arch/arm/dts/Makefile
 @@ -1265,6 +1265,9 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) += lpc3250-ea3250.dtb
@@ -83,7 +84,7 @@ index a7e0d9f6c0e8..8c8f15b6a813 100644
  targets += $(dtb-y)
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone1000-fvp.dts
 new file mode 100644
-index 000000000000..1fcc137a493c
+index 0000000000..1fcc137a49
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-fvp.dts
 @@ -0,0 +1,23 @@
@@ -112,7 +113,7 @@ index 000000000000..1fcc137a493c
 +};
 diff --git a/arch/arm/dts/corstone1000-mps3.dts b/arch/arm/dts/corstone1000-mps3.dts
 new file mode 100644
-index 000000000000..e3146747c2d9
+index 0000000000..e3146747c2
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-mps3.dts
 @@ -0,0 +1,32 @@
@@ -150,7 +151,7 @@ index 000000000000..e3146747c2d9
 +};
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
 new file mode 100644
-index 000000000000..d0194aa893f2
+index 0000000000..d0194aa893
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -0,0 +1,169 @@
@@ -325,7 +326,7 @@ index 000000000000..d0194aa893f2
 +};
 diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone1000/Kconfig
 new file mode 100644
-index 000000000000..709674d4cf7d
+index 0000000000..709674d4cf
 --- /dev/null
 +++ b/board/armltd/corstone1000/Kconfig
 @@ -0,0 +1,12 @@
@@ -343,7 +344,7 @@ index 000000000000..709674d4cf7d
 +endif
 diff --git a/board/armltd/corstone1000/MAINTAINERS b/board/armltd/corstone1000/MAINTAINERS
 new file mode 100644
-index 000000000000..8c905686de76
+index 0000000000..8c905686de
 --- /dev/null
 +++ b/board/armltd/corstone1000/MAINTAINERS
 @@ -0,0 +1,7 @@
@@ -356,7 +357,7 @@ index 000000000000..8c905686de76
 +F:	configs/corstone1000_defconfig
 diff --git a/board/armltd/corstone1000/Makefile b/board/armltd/corstone1000/Makefile
 new file mode 100644
-index 000000000000..77a82c28929b
+index 0000000000..77a82c2892
 --- /dev/null
 +++ b/board/armltd/corstone1000/Makefile
 @@ -0,0 +1,7 @@
@@ -369,7 +370,7 @@ index 000000000000..77a82c28929b
 +obj-y	:= corstone1000.o
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
 new file mode 100644
-index 000000000000..2fa485ff3799
+index 0000000000..2fa485ff37
 --- /dev/null
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -0,0 +1,125 @@
@@ -500,7 +501,7 @@ index 000000000000..2fa485ff3799
 +}
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
 new file mode 100644
-index 000000000000..02f931b0d469
+index 0000000000..02f931b0d4
 --- /dev/null
 +++ b/configs/corstone1000_defconfig
 @@ -0,0 +1,80 @@
@@ -586,7 +587,7 @@ index 000000000000..02f931b0d469
 +CONFIG_MISC=y
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
 new file mode 100644
-index 000000000000..cf166f107efd
+index 0000000000..cf166f107e
 --- /dev/null
 +++ b/include/configs/corstone1000.h
 @@ -0,0 +1,86 @@
@@ -677,5 +678,5 @@ index 000000000000..cf166f107efd
 +				"bootefi $kernel_addr_r $fdtcontroladdr;"
 +#endif
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
index 1cebd072..7e726fea 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
@@ -1,12 +1,13 @@
-From 61c5fe3758a0febdee33429f5be16f69279045cc Mon Sep 17 00:00:00 2001
+From 178da5bee196f44c4c10e9804674fe5ac0bc1176 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:20:55 +0100
-Subject: [PATCH 03/24] usb: common: move urb code to common
+Subject: [PATCH 03/26] usb: common: move urb code to common
 
 Move urb code from musb only use to a more common scope, so other
 drivers in the future can use the handling of urb in usb.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Accepted [2022.10-rc1]
 ---
  drivers/usb/common/Makefile                   |   2 +
  drivers/usb/common/usb_urb.c                  | 160 ++++++++++++++++++
@@ -23,7 +24,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  rename drivers/usb/musb-new/usb-compat.h => include/linux/usb/usb_urb_compat.h (60%)
 
 diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
-index 3bedbf213f47..dc05cb0a5077 100644
+index 3bedbf213f..dc05cb0a50 100644
 --- a/drivers/usb/common/Makefile
 +++ b/drivers/usb/common/Makefile
 @@ -4,5 +4,7 @@
@@ -36,7 +37,7 @@ index 3bedbf213f47..dc05cb0a5077 100644
  obj-$(CONFIG_USB_XHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
 diff --git a/drivers/usb/common/usb_urb.c b/drivers/usb/common/usb_urb.c
 new file mode 100644
-index 000000000000..be3b6b9f32e8
+index 0000000000..be3b6b9f32
 --- /dev/null
 +++ b/drivers/usb/common/usb_urb.c
 @@ -0,0 +1,160 @@
@@ -201,7 +202,7 @@ index 000000000000..be3b6b9f32e8
 +	return usb_urb_submit(hcd, urb);
 +}
 diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
-index f1fc93f3d403..3ccbc16da379 100644
+index f1fc93f3d4..3ccbc16da3 100644
 --- a/drivers/usb/host/r8a66597-hcd.c
 +++ b/drivers/usb/host/r8a66597-hcd.c
 @@ -14,6 +14,7 @@
@@ -249,7 +250,7 @@ index f1fc93f3d403..3ccbc16da379 100644
  {
  	struct usb_device *parent = usb_dev_get_parent(dev);
 diff --git a/drivers/usb/musb-new/musb_core.c b/drivers/usb/musb-new/musb_core.c
-index 18d9bc805f8a..fc7af7484e4c 100644
+index 18d9bc805f..fc7af7484e 100644
 --- a/drivers/usb/musb-new/musb_core.c
 +++ b/drivers/usb/musb-new/musb_core.c
 @@ -89,9 +89,9 @@
@@ -264,7 +265,7 @@ index 18d9bc805f8a..fc7af7484e4c 100644
  
  #include "musb_core.h"
 diff --git a/drivers/usb/musb-new/musb_host.c b/drivers/usb/musb-new/musb_host.c
-index acb2d40f3b5a..e5905d90d66f 100644
+index acb2d40f3b..e5905d90d6 100644
 --- a/drivers/usb/musb-new/musb_host.c
 +++ b/drivers/usb/musb-new/musb_host.c
 @@ -26,8 +26,8 @@
@@ -278,7 +279,7 @@ index acb2d40f3b5a..e5905d90d66f 100644
  
  #include "musb_core.h"
 diff --git a/drivers/usb/musb-new/musb_host.h b/drivers/usb/musb-new/musb_host.h
-index afc8fa35a738..5a604bdb0cf2 100644
+index afc8fa35a7..5a604bdb0c 100644
 --- a/drivers/usb/musb-new/musb_host.h
 +++ b/drivers/usb/musb-new/musb_host.h
 @@ -10,7 +10,7 @@
@@ -291,7 +292,7 @@ index afc8fa35a738..5a604bdb0cf2 100644
  
  static inline struct usb_hcd *musb_to_hcd(struct musb *musb)
 diff --git a/drivers/usb/musb-new/musb_uboot.c b/drivers/usb/musb-new/musb_uboot.c
-index 61ff68def2fa..d186facc7e02 100644
+index 61ff68def2..d186facc7e 100644
 --- a/drivers/usb/musb-new/musb_uboot.c
 +++ b/drivers/usb/musb-new/musb_uboot.c
 @@ -8,10 +8,10 @@
@@ -347,7 +348,7 @@ index 61ff68def2fa..d186facc7e02 100644
 -}
 -#endif
 diff --git a/drivers/usb/musb-new/musb_uboot.h b/drivers/usb/musb-new/musb_uboot.h
-index 18282efccc9d..6b162f03b19e 100644
+index 18282efccc..6b162f03b1 100644
 --- a/drivers/usb/musb-new/musb_uboot.h
 +++ b/drivers/usb/musb-new/musb_uboot.h
 @@ -8,8 +8,8 @@
@@ -364,7 +365,7 @@ diff --git a/drivers/usb/musb-new/usb-compat.h b/include/linux/usb/usb_urb_compa
 similarity index 60%
 rename from drivers/usb/musb-new/usb-compat.h
 rename to include/linux/usb/usb_urb_compat.h
-index df68c9220a7a..5ed96fa64e96 100644
+index df68c9220a..5ed96fa64e 100644
 --- a/drivers/usb/musb-new/usb-compat.h
 +++ b/include/linux/usb/usb_urb_compat.h
 @@ -1,16 +1,31 @@
@@ -439,7 +440,7 @@ index df68c9220a7a..5ed96fa64e96 100644
 +
  #endif /* __USB_COMPAT_H__ */
 diff --git a/include/usb_defs.h b/include/usb_defs.h
-index 6dd2c997f9b3..ec00161710a5 100644
+index 6dd2c997f9..ec00161710 100644
 --- a/include/usb_defs.h
 +++ b/include/usb_defs.h
 @@ -81,6 +81,32 @@
@@ -493,5 +494,5 @@ index 6dd2c997f9b3..ec00161710a5 100644
  /*
   * Hub Status & Hub Change bit masks
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
index 1dd6f259..794389e3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
@@ -1,12 +1,13 @@
-From 8abb9c6a342d750a3a3a66e674c3be6597fc9f66 Mon Sep 17 00:00:00 2001
+From 83ba88292211394ce6b3a21fbc0f702dae543290 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:31:25 +0100
-Subject: [PATCH 04/24] usb: add isp1760 family driver
+Subject: [PATCH 04/26] usb: add isp1760 family driver
 
 ISP1760/61/63 are a family of usb controllers, blah, blah, more info
 here.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Accepted [2022.10-rc1]
 ---
  Makefile                            |    1 +
  drivers/usb/Kconfig                 |    2 +
@@ -34,7 +35,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 drivers/usb/isp1760/isp1760-uboot.h
 
 diff --git a/Makefile b/Makefile
-index 98867fbe06b4..67851020f5c1 100644
+index 98867fbe06..67851020f5 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -841,6 +841,7 @@ libs-y += drivers/usb/host/
@@ -46,7 +47,7 @@ index 98867fbe06b4..67851020f5c1 100644
  libs-y += drivers/usb/ulpi/
  ifdef CONFIG_POST
 diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
-index ab1d061bd0d5..bbe07be02cab 100644
+index ab1d061bd0..bbe07be02c 100644
 --- a/drivers/usb/Kconfig
 +++ b/drivers/usb/Kconfig
 @@ -78,6 +78,8 @@ source "drivers/usb/musb/Kconfig"
@@ -59,7 +60,7 @@ index ab1d061bd0d5..bbe07be02cab 100644
  
  source "drivers/usb/phy/Kconfig"
 diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
-index dc05cb0a5077..f08b064d2493 100644
+index dc05cb0a50..f08b064d24 100644
 --- a/drivers/usb/common/Makefile
 +++ b/drivers/usb/common/Makefile
 @@ -4,6 +4,7 @@
@@ -72,7 +73,7 @@ index dc05cb0a5077..f08b064d2493 100644
  obj-$(CONFIG_USB_EHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
 diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
 new file mode 100644
-index 000000000000..993d71e74cd2
+index 0000000000..993d71e74c
 --- /dev/null
 +++ b/drivers/usb/isp1760/Kconfig
 @@ -0,0 +1,12 @@
@@ -90,7 +91,7 @@ index 000000000000..993d71e74cd2
 +	  capable bus.
 diff --git a/drivers/usb/isp1760/Makefile b/drivers/usb/isp1760/Makefile
 new file mode 100644
-index 000000000000..2c809c01b118
+index 0000000000..2c809c01b1
 --- /dev/null
 +++ b/drivers/usb/isp1760/Makefile
 @@ -0,0 +1,6 @@
@@ -102,7 +103,7 @@ index 000000000000..2c809c01b118
 +obj-$(CONFIG_USB_ISP1760) += isp1760.o
 diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
 new file mode 100644
-index 000000000000..3080595549c5
+index 0000000000..3080595549
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-core.c
 @@ -0,0 +1,378 @@
@@ -486,7 +487,7 @@ index 000000000000..3080595549c5
 +}
 diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
 new file mode 100644
-index 000000000000..0a60e30b5fe7
+index 0000000000..0a60e30b5f
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-core.h
 @@ -0,0 +1,96 @@
@@ -588,7 +589,7 @@ index 000000000000..0a60e30b5fe7
 +#endif
 diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
 new file mode 100644
-index 000000000000..b1d86dd69b94
+index 0000000000..b1d86dd69b
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-hcd.c
 @@ -0,0 +1,2574 @@
@@ -3168,7 +3169,7 @@ index 000000000000..b1d86dd69b94
 +}
 diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
 new file mode 100644
-index 000000000000..00f5ca8c1f75
+index 0000000000..00f5ca8c1f
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-hcd.h
 @@ -0,0 +1,82 @@
@@ -3256,7 +3257,7 @@ index 000000000000..00f5ca8c1f75
 +#endif /* _ISP1760_HCD_H_ */
 diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
 new file mode 100644
-index 000000000000..c610da6b23fb
+index 0000000000..c610da6b23
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-if.c
 @@ -0,0 +1,127 @@
@@ -3389,7 +3390,7 @@ index 000000000000..c610da6b23fb
 +};
 diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
 new file mode 100644
-index 000000000000..94ea60c20b2a
+index 0000000000..94ea60c20b
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-regs.h
 @@ -0,0 +1,292 @@
@@ -3687,7 +3688,7 @@ index 000000000000..94ea60c20b2a
 +#endif
 diff --git a/drivers/usb/isp1760/isp1760-uboot.c b/drivers/usb/isp1760/isp1760-uboot.c
 new file mode 100644
-index 000000000000..7635210fe2b4
+index 0000000000..7635210fe2
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-uboot.c
 @@ -0,0 +1,76 @@
@@ -3769,7 +3770,7 @@ index 000000000000..7635210fe2b4
 +};
 diff --git a/drivers/usb/isp1760/isp1760-uboot.h b/drivers/usb/isp1760/isp1760-uboot.h
 new file mode 100644
-index 000000000000..2486de6f9e27
+index 0000000000..2486de6f9e
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-uboot.h
 @@ -0,0 +1,27 @@
@@ -3801,5 +3802,5 @@ index 000000000000..2486de6f9e27
 +
 +#endif
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
index c4654557..6ebba568 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
@@ -1,20 +1,21 @@
-From 5031fea320bb4ccc1ce7470193d8f4402ae819c9 Mon Sep 17 00:00:00 2001
+From 8717357eff3f4172c74f0b10078c31cdff9bcc41 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 3 Mar 2022 16:52:02 +0000
-Subject: [PATCH 05/24] corstone1000: enable isp1763 usb controller
+Subject: [PATCH 05/26] corstone1000: enable isp1763 usb controller
 
 MPS3 board have a ISP1763 usb controller, add the
 correspondent mmio area and enable it to be used for mass
 storage access for example.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Accepted [2022.10-rc1]
 ---
  configs/corstone1000_defconfig | 1 +
  include/configs/corstone1000.h | 6 ++++++
  2 files changed, 7 insertions(+)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index 02f931b0d469..e573fe6fe6a2 100644
+index 02f931b0d4..e573fe6fe6 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -42,6 +42,7 @@ CONFIG_REGMAP=y
@@ -26,7 +27,7 @@ index 02f931b0d469..e573fe6fe6a2 100644
  CONFIG_EFI_MM_COMM_TEE=y
  # CONFIG_OPTEE is not set
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index cf166f107efd..8ba0effb0ab2 100644
+index cf166f107e..8ba0effb0a 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -55,7 +55,13 @@
@@ -44,5 +45,5 @@ index cf166f107efd..8ba0effb0ab2 100644
  				"boot_bank_flag=0x08002000\0"				\
  				"kernel_addr_bank_0=0x083EE000\0"			\
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch
new file mode 100644
index 00000000..01cd5615
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch
@@ -0,0 +1,204 @@
+From 7afe2370bc24b9003be8184fbd3169ebca03165a Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 29 Jul 2022 13:06:19 +0100
+Subject: [PATCH 06/26] arm64: smccc: add support for SMCCCv1.2 x0-x17
+ registers
+
+add support for x0-x17 registers used by the SMC calls
+
+In SMCCC v1.2 [1] arguments are passed in registers x1-x17.
+Results are returned in x0-x17.
+
+This work is inspired from the following kernel commit:
+
+arm64: smccc: Add support for SMCCCv1.2 extended input/output registers
+
+[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6?token=
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+
+---
+
+Changelog:
+===============
+
+v4:
+
+* rename the commit title and improve description
+  new commit title: the current
+
+v3:
+
+* port x0-x17 registers support from linux kernel as defined by SMCCCv1.2
+  commit title:
+      arm64: smccc: add Xn registers support used by SMC calls
+
+ arch/arm/cpu/armv8/smccc-call.S | 53 +++++++++++++++++++++++++++++++++
+ arch/arm/lib/asm-offsets.c      | 13 ++++++++
+ include/linux/arm-smccc.h       | 43 ++++++++++++++++++++++++++
+ 3 files changed, 109 insertions(+)
+
+diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-call.S
+index dc92b28777..ec6f299bc9 100644
+--- a/arch/arm/cpu/armv8/smccc-call.S
++++ b/arch/arm/cpu/armv8/smccc-call.S
+@@ -1,6 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+ /*
+  * Copyright (c) 2015, Linaro Limited
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+ #include <linux/linkage.h>
+ #include <linux/arm-smccc.h>
+@@ -45,3 +47,54 @@ ENDPROC(__arm_smccc_smc)
+ ENTRY(__arm_smccc_hvc)
+ 	SMCCC	hvc
+ ENDPROC(__arm_smccc_hvc)
++
++#ifdef CONFIG_ARM64
++
++	.macro SMCCC_1_2 instr
++	/* Save `res` and free a GPR that won't be clobbered */
++	stp     x1, x19, [sp, #-16]!
++
++	/* Ensure `args` won't be clobbered while loading regs in next step */
++	mov	x19, x0
++
++	/* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
++	ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
++	ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
++	ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
++	ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
++	ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
++	ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
++	ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
++	ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
++	ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
++
++	\instr #0
++
++	/* Load the `res` from the stack */
++	ldr	x19, [sp]
++
++	/* Store the registers x0 - x17 into the result structure */
++	stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
++	stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
++	stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
++	stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
++	stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
++	stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
++	stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
++	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
++	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
++
++	/* Restore original x19 */
++	ldp     xzr, x19, [sp], #16
++	ret
++	.endm
++
++/*
++ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
++ *			  struct arm_smccc_1_2_regs *res);
++ */
++ENTRY(arm_smccc_1_2_smc)
++	SMCCC_1_2 smc
++ENDPROC(arm_smccc_1_2_smc)
++
++#endif
+diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
+index 22fd541f9a..b6bd1b32b0 100644
+--- a/arch/arm/lib/asm-offsets.c
++++ b/arch/arm/lib/asm-offsets.c
+@@ -9,6 +9,8 @@
+  * generate asm statements containing #defines,
+  * compile this file to assembler, and then extract the
+  * #defines from the assembly-language output.
++ *
++ * (C) Copyright 2022 ARM Limited
+  */
+ 
+ #include <common.h>
+@@ -117,6 +119,17 @@ int main(void)
+ 	DEFINE(ARM_SMCCC_RES_X2_OFFS, offsetof(struct arm_smccc_res, a2));
+ 	DEFINE(ARM_SMCCC_QUIRK_ID_OFFS, offsetof(struct arm_smccc_quirk, id));
+ 	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, state));
++	#ifdef CONFIG_ARM64
++		DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs, a0));
++		DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs, a2));
++		DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs, a4));
++		DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs, a6));
++		DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs, a8));
++		DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_regs, a10));
++		DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_regs, a12));
++		DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_regs, a14));
++		DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_regs, a16));
++	#endif
+ #endif
+ 
+ 	return 0;
+diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
+index 7f2be23394..dae58d3476 100644
+--- a/include/linux/arm-smccc.h
++++ b/include/linux/arm-smccc.h
+@@ -1,6 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+ /*
+  * Copyright (c) 2015, Linaro Limited
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+ #ifndef __LINUX_ARM_SMCCC_H
+ #define __LINUX_ARM_SMCCC_H
+@@ -66,6 +68,47 @@ struct arm_smccc_res {
+ 	unsigned long a3;
+ };
+ 
++#ifdef CONFIG_ARM64
++/**
++ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
++ * @a0-a17 argument values from registers 0 to 17
++ */
++struct arm_smccc_1_2_regs {
++	unsigned long a0;
++	unsigned long a1;
++	unsigned long a2;
++	unsigned long a3;
++	unsigned long a4;
++	unsigned long a5;
++	unsigned long a6;
++	unsigned long a7;
++	unsigned long a8;
++	unsigned long a9;
++	unsigned long a10;
++	unsigned long a11;
++	unsigned long a12;
++	unsigned long a13;
++	unsigned long a14;
++	unsigned long a15;
++	unsigned long a16;
++	unsigned long a17;
++};
++
++/**
++ * arm_smccc_1_2_smc() - make SMC calls
++ * @args: arguments passed via struct arm_smccc_1_2_regs
++ * @res: result values via struct arm_smccc_1_2_regs
++ *
++ * This function is used to make SMC calls following SMC Calling Convention
++ * v1.2 or above. The content of the supplied param are copied from the
++ * structure to registers prior to the SMC instruction. The return values
++ * are updated with the content from registers on return from the SMC
++ * instruction.
++ */
++asmlinkage void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
++				  struct arm_smccc_1_2_regs *res);
++#endif
++
+ /**
+  * struct arm_smccc_quirk - Contains quirk information
+  * @id: quirk identification
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
deleted file mode 100644
index 617aaf77..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
+++ /dev/null
@@ -1,2610 +0,0 @@
-From 968c86e8a6ed3e9e6621f0ae44977b5b13d90bfd Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 16 Nov 2021 12:34:52 +0000
-Subject: [PATCH 06/24] arm_ffa: introducing Arm FF-A low-level driver
-
-This driver implements Arm Firmware Framework for Armv8-A on u-boot
-
-The Firmware Framework for Arm A-profile processors (FF-A)
-describes interfaces (ABIs) that standardize communication
-between the Secure World and Normal World leveraging TrustZone
-technology.
-
-This driver is based on FF-A specification v1.0 and uses SMC32
-calling convention.
-
-FF-A specification:
-
-https://developer.arm.com/documentation/den0077/a/?lang=en
-
-The driver provides helper FF-A interfaces for user layers.
-These helper functions allow clients to pass data and select the
-FF-A function to use for the communication with secure world.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- MAINTAINERS                      |    8 +
- arch/arm/cpu/armv8/smccc-call.S  |   27 +
- arch/arm/lib/asm-offsets.c       |    6 +
- common/board_r.c                 |    6 +
- drivers/Kconfig                  |    2 +
- drivers/Makefile                 |    1 +
- drivers/arm-ffa/Kconfig          |   26 +
- drivers/arm-ffa/Makefile         |    3 +
- drivers/arm-ffa/arm-ffa-uclass.c |   67 ++
- drivers/arm-ffa/arm_ffa_prv.h    |  199 ++++
- drivers/arm-ffa/core.c           | 1484 ++++++++++++++++++++++++++++++
- include/arm_ffa.h                |  191 ++++
- include/arm_ffa_helper.h         |   45 +
- include/dm/uclass-id.h           |    1 +
- include/linux/arm-smccc.h        |   28 +-
- lib/Kconfig                      |    1 +
- lib/Makefile                     |    1 +
- lib/arm-ffa/Kconfig              |    6 +
- lib/arm-ffa/Makefile             |    8 +
- lib/arm-ffa/arm_ffa_helper.c     |  188 ++++
- lib/efi_loader/efi_boottime.c    |   17 +
- 21 files changed, 2314 insertions(+), 1 deletion(-)
- create mode 100644 drivers/arm-ffa/Kconfig
- create mode 100644 drivers/arm-ffa/Makefile
- create mode 100644 drivers/arm-ffa/arm-ffa-uclass.c
- create mode 100644 drivers/arm-ffa/arm_ffa_prv.h
- create mode 100644 drivers/arm-ffa/core.c
- create mode 100644 include/arm_ffa.h
- create mode 100644 include/arm_ffa_helper.h
- create mode 100644 lib/arm-ffa/Kconfig
- create mode 100644 lib/arm-ffa/Makefile
- create mode 100644 lib/arm-ffa/arm_ffa_helper.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 7f27ff4c20fc..d29d7e040764 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -244,6 +244,14 @@ F:	board/CZ.NIC/
- F:	configs/turris_*_defconfig
- F:	include/configs/turris_*.h
- 
-+ARM FF-A
-+M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+S:	Maintained
-+F:	drivers/arm-ffa/
-+F:	include/arm_ffa.h
-+F:	include/arm_ffa_helper.h
-+F:	lib/arm-ffa/
-+
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
- M:	Fabio Estevam <festevam@gmail.com>
-diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-call.S
-index dc92b28777c3..ffc39c9fefa2 100644
---- a/arch/arm/cpu/armv8/smccc-call.S
-+++ b/arch/arm/cpu/armv8/smccc-call.S
-@@ -1,6 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
- /*
-  * Copyright (c) 2015, Linaro Limited
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
- #include <linux/linkage.h>
- #include <linux/arm-smccc.h>
-@@ -45,3 +47,28 @@ ENDPROC(__arm_smccc_smc)
- ENTRY(__arm_smccc_hvc)
- 	SMCCC	hvc
- ENDPROC(__arm_smccc_hvc)
-+
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+
-+	.macro FFASMCCC instr
-+	.cfi_startproc
-+	\instr	#0
-+	ldr	x9, [sp]
-+	stp	x0, x1, [x9, #ARM_SMCCC_RES_X0_OFFS]
-+	stp	x2, x3, [x9, #ARM_SMCCC_RES_X2_OFFS]
-+	stp	x4, x5, [x9, #ARM_SMCCC_RES_X4_OFFS]
-+	stp	x6, x7, [x9, #ARM_SMCCC_RES_X6_OFFS]
-+	ret
-+	.cfi_endproc
-+	.endm
-+
-+/*
-+ * void arm_ffa_smccc_smc(unsigned long a0, unsigned long a1, unsigned long a2,
-+ *		  unsigned long a3, unsigned long a4, unsigned long a5,
-+ *		  unsigned long a6, unsigned long a7, struct arm_smccc_res *res)
-+ */
-+ENTRY(__arm_ffa_smccc_smc)
-+	FFASMCCC	smc
-+ENDPROC(__arm_ffa_smccc_smc)
-+
-+#endif
-diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
-index 22fd541f9a28..45eca83a473c 100644
---- a/arch/arm/lib/asm-offsets.c
-+++ b/arch/arm/lib/asm-offsets.c
-@@ -9,6 +9,8 @@
-  * generate asm statements containing #defines,
-  * compile this file to assembler, and then extract the
-  * #defines from the assembly-language output.
-+ *
-+ * (C) Copyright 2021 ARM Limited
-  */
- 
- #include <common.h>
-@@ -115,6 +117,10 @@ int main(void)
- #ifdef CONFIG_ARM_SMCCC
- 	DEFINE(ARM_SMCCC_RES_X0_OFFS, offsetof(struct arm_smccc_res, a0));
- 	DEFINE(ARM_SMCCC_RES_X2_OFFS, offsetof(struct arm_smccc_res, a2));
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+	DEFINE(ARM_SMCCC_RES_X4_OFFS, offsetof(struct arm_smccc_res, a4));
-+	DEFINE(ARM_SMCCC_RES_X6_OFFS, offsetof(struct arm_smccc_res, a6));
-+#endif
- 	DEFINE(ARM_SMCCC_QUIRK_ID_OFFS, offsetof(struct arm_smccc_quirk, id));
- 	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, state));
- #endif
-diff --git a/common/board_r.c b/common/board_r.c
-index 6f4aca2077d6..412a0ea9fac3 100644
---- a/common/board_r.c
-+++ b/common/board_r.c
-@@ -62,6 +62,9 @@
- #include <asm-generic/gpio.h>
- #include <efi_loader.h>
- #include <relocate.h>
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+#include <arm_ffa_helper.h>
-+#endif
- 
- DECLARE_GLOBAL_DATA_PTR;
- 
-@@ -779,6 +782,9 @@ static init_fnc_t init_sequence_r[] = {
- 	INIT_FUNC_WATCHDOG_RESET
- 	initr_net,
- #endif
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	ffa_helper_init_device,
-+#endif
- #ifdef CONFIG_POST
- 	initr_post,
- #endif
-diff --git a/drivers/Kconfig b/drivers/Kconfig
-index b26ca8cf70c9..e83c23789d1b 100644
---- a/drivers/Kconfig
-+++ b/drivers/Kconfig
-@@ -6,6 +6,8 @@ source "drivers/core/Kconfig"
- 
- source "drivers/adc/Kconfig"
- 
-+source "drivers/arm-ffa/Kconfig"
-+
- source "drivers/ata/Kconfig"
- 
- source "drivers/axi/Kconfig"
-diff --git a/drivers/Makefile b/drivers/Makefile
-index 67c8af74424e..1be687b55d13 100644
---- a/drivers/Makefile
-+++ b/drivers/Makefile
-@@ -109,6 +109,7 @@ obj-y += iommu/
- obj-y += smem/
- obj-y += thermal/
- obj-$(CONFIG_TEE) += tee/
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) += arm-ffa/
- obj-y += axi/
- obj-y += ufs/
- obj-$(CONFIG_W1) += w1/
-diff --git a/drivers/arm-ffa/Kconfig b/drivers/arm-ffa/Kconfig
-new file mode 100644
-index 000000000000..d71444c1fa90
---- /dev/null
-+++ b/drivers/arm-ffa/Kconfig
-@@ -0,0 +1,26 @@
-+# SPDX-License-Identifier: GPL-2.0
-+
-+config ARM_FFA_TRANSPORT
-+	bool "Enable Arm Firmware Framework for Armv8-A driver"
-+	depends on DM && ARM64
-+	select ARM_SMCCC
-+	select LIB_UUID
-+	select ARM_FFA_TRANSPORT_HELPERS
-+	select CMD_ARMFFA
-+	help
-+	  The Firmware Framework for Arm A-profile processors (FF-A)
-+	  describes interfaces (ABIs) that standardize communication
-+	  between the Secure World and Normal World leveraging TrustZone
-+	  technology.
-+
-+	  This driver is based on FF-A specification v1.0 and uses SMC32
-+	  calling convention.
-+
-+	  FF-A specification:
-+
-+	  https://developer.arm.com/documentation/den0077/a/?lang=en
-+
-+	  In u-boot FF-A design, the Secure World is considered as one
-+	  entity to communicate with. FF-A communication is handled by
-+	  one device and one instance. This device takes care of
-+	  all the interactions between Normal world and Secure World.
-diff --git a/drivers/arm-ffa/Makefile b/drivers/arm-ffa/Makefile
-new file mode 100644
-index 000000000000..9fb5bea52299
---- /dev/null
-+++ b/drivers/arm-ffa/Makefile
-@@ -0,0 +1,3 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+
-+obj-y += arm-ffa-uclass.o core.o
-diff --git a/drivers/arm-ffa/arm-ffa-uclass.c b/drivers/arm-ffa/arm-ffa-uclass.c
-new file mode 100644
-index 000000000000..43f6066281fe
---- /dev/null
-+++ b/drivers/arm-ffa/arm-ffa-uclass.c
-@@ -0,0 +1,67 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <arm_ffa.h>
-+#include <errno.h>
-+#include <log.h>
-+#include <asm/global_data.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+UCLASS_DRIVER(ffa) = {
-+	.name		= "ffa",
-+	.id		= UCLASS_FFA,
-+};
-+
-+/**
-+ * ffa_get_invoke_func - performs a call to the FF-A driver dispatcher
-+ * @func_id:	The FF-A function to be used
-+ * @func_data:  Pointer to the FF-A function arguments
-+ *				container structure. This also includes
-+ *				pointers to the returned data needed by
-+ *				clients.
-+ *
-+ * This runtime function passes the FF-A function ID and its arguments to
-+ * the FF-A driver dispatcher.
-+ * This function is called by the FF-A helper functions.
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int __ffa_runtime ffa_get_invoke_func(u32 func_id, struct ffa_interface_data *func_data)
-+{
-+	if (!ffa_device_get_ops()->invoke_func)
-+		return -EINVAL;
-+
-+	return ffa_device_get_ops()->invoke_func(func_id, func_data);
-+}
-+
-+/**
-+ * ffa_init_device - probes the arm_ffa device
-+ *
-+ * This boot time function makes sure the arm_ffa device is probed
-+ * and ready for use.
-+ * This function is called automatically at initcalls
-+ * level (after u-boot relocation).
-+ *
-+ * Arm FF-A transport is implemented through a single u-boot
-+ * device (arm_ffa). So, there is only one device belonging to UCLASS_FFA.
-+ * All FF-A clients should use the arm_ffa device to use the FF-A
-+ * transport.
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int ffa_init_device(void)
-+{
-+	ffa_dbg("[%s]", __func__);
-+
-+	return ffa_get_device();
-+}
-diff --git a/drivers/arm-ffa/arm_ffa_prv.h b/drivers/arm-ffa/arm_ffa_prv.h
-new file mode 100644
-index 000000000000..38ea4ba83efc
---- /dev/null
-+++ b/drivers/arm-ffa/arm_ffa_prv.h
-@@ -0,0 +1,199 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __ARM_FFA_PRV_H
-+#define __ARM_FFA_PRV_H
-+
-+#include <arm_ffa.h>
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+
-+/*
-+ * This header is private. It is exclusively used by the FF-A driver
-+ */
-+
-+/* FF-A driver version definitions */
-+
-+#define MAJOR_VERSION_MASK		GENMASK(30, 16)
-+#define MINOR_VERSION_MASK		GENMASK(15, 0)
-+#define GET_FFA_MAJOR_VERSION(x)		\
-+				((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
-+#define GET_FFA_MINOR_VERSION(x)		\
-+				((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
-+#define PACK_VERSION_INFO(major, minor)			\
-+	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
-+	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
-+
-+#define FFA_MAJOR_VERSION		(1)
-+#define FFA_MINOR_VERSION		(0)
-+#define FFA_VERSION_1_0		\
-+			PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR_VERSION)
-+
-+/* Endpoint ID mask (u-boot endpoint ID) */
-+
-+#define GET_SELF_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define GET_SELF_ENDPOINT_ID(x)		\
-+			((u16)(FIELD_GET(GET_SELF_ENDPOINT_ID_MASK, (x))))
-+
-+#define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
-+#define PREP_SELF_ENDPOINT_ID(x)		\
-+			((u16)(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x))))
-+
-+/* Partition endpoint ID mask  (partition with which u-boot communicates with) */
-+
-+#define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define PREP_PART_ENDPOINT_ID(x)		\
-+			((u16)(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x))))
-+
-+/* The FF-A SMC function prototype definition */
-+
-+typedef void (*invoke_ffa_fn_t)(unsigned long a0, unsigned long a1,
-+			unsigned long a2, unsigned long a3, unsigned long a4,
-+			unsigned long a5, unsigned long a6, unsigned long a7,
-+			struct arm_smccc_res *res);
-+
-+/**
-+ * enum ffa_conduit - Arm FF-A conduits supported by the Arm FF-A driver
-+ * Currently only SMC32 is supported.
-+ */
-+enum ffa_conduit {
-+	FFA_CONDUIT_SMC = 0,
-+};
-+
-+/**
-+ * FFA_DECLARE_ARGS - FF-A functions local variables
-+ * @a0-a7:	local variables used to set registers x0-x7
-+ * @res:	the structure hosting the FF-A function return data
-+ *
-+ * A helper macro for declaring local variables for the FF-A functions  arguments.
-+ * The x0-x7 registers are used to exchange data with the secure world.
-+ * But, only the bottom 32-bit of thes registers contains the data.
-+ */
-+#define FFA_DECLARE_ARGS \
-+	unsigned long a0 = 0; \
-+	unsigned long a1 = 0; \
-+	unsigned long a2 = 0; \
-+	unsigned long a3 = 0; \
-+	unsigned long a4 = 0; \
-+	unsigned long a5 = 0; \
-+	unsigned long a6 = 0; \
-+	unsigned long a7 = 0; \
-+	struct arm_smccc_res res = {0}
-+
-+/* FF-A error codes */
-+#define FFA_ERR_STAT_NOT_SUPPORTED				(-1)
-+#define FFA_ERR_STAT_INVALID_PARAMETERS				(-2)
-+#define FFA_ERR_STAT_NO_MEMORY				(-3)
-+#define FFA_ERR_STAT_BUSY				(-4)
-+#define FFA_ERR_STAT_INTERRUPTED				(-5)
-+#define FFA_ERR_STAT_DENIED				(-6)
-+#define FFA_ERR_STAT_RETRY				(-7)
-+#define FFA_ERR_STAT_ABORTED				(-8)
-+
-+/**
-+ * struct ffa_features_desc - FF-A functions features
-+ * @func_id:	FF-A function
-+ * @field1:	features read from register w2
-+ * @field2:	features read from register w3
-+ *
-+ * Data structure describing the features of the  FF-A functions queried by
-+ * FFA_FEATURES
-+ */
-+struct ffa_features_desc {
-+	u32 func_id;
-+	u32 field1;
-+	u32 field2;
-+};
-+
-+/**
-+ * enum ffa_rxtx_buf_sizes - minimum sizes supported
-+ * for the RX/TX buffers
-+ */
-+enum ffa_rxtx_buf_sizes {
-+	RXTX_4K,
-+	RXTX_64K,
-+	RXTX_16K
-+};
-+
-+/*
-+ * Number of the FF-A interfaces features descriptors
-+ * currently only FFA_RXTX_MAP descriptor is supported
-+ */
-+#define FFA_FEATURE_DESC_CNT (1)
-+
-+/**
-+ * struct ffa_pdata - platform data for the arm_ffa device
-+ * @conduit: The FF-A conduit used
-+ *
-+ * Platform data structure read from the device tree
-+ */
-+struct ffa_pdata {
-+	enum ffa_conduit conduit;
-+};
-+
-+/**
-+ * struct ffa_rxtxpair - structure hosting the RX/TX buffers physical addresses
-+ * @rxbuf:	physical address of the RX buffer
-+ * @txbuf:	physical address of the TX buffer
-+ *
-+ * Data structure hosting the physical addresses of the mapped RX/TX buffers
-+ * These physical address are used by the FF-A functions that use the RX/TX buffers
-+ */
-+struct ffa_rxtxpair {
-+	u64 rxbuf; /* physical address */
-+	u64 txbuf; /* physical address */
-+};
-+
-+/**
-+ * struct ffa_partition_desc - the secure partition descriptor
-+ * @info:	partition information
-+ * @UUID:	UUID
-+ *
-+ * Each partition has its descriptor containing the partitions information and the UUID
-+ */
-+struct ffa_partition_desc {
-+	struct ffa_partition_info info;
-+	union ffa_partition_uuid UUID;
-+};
-+
-+/**
-+ * struct ffa_partitions - descriptors for all secure partitions
-+ * @count:	The number of partitions descriptors
-+ * @descs	The partitions descriptors table
-+ *
-+ * This data structure contains the partitions descriptors table
-+ */
-+struct ffa_partitions {
-+	u32 count;
-+	struct ffa_partition_desc *descs; /* virtual address */
-+};
-+
-+/**
-+ * struct ffa_prvdata - the driver private data structure
-+ *
-+ * @dev:	The arm_ffa device under u-boot driver model
-+ * @fwk_version:	FF-A framework version
-+ * @id:	u-boot endpoint ID
-+ * @partitions:	The partitions descriptors structure
-+ * @pair:	The RX/TX buffers pair
-+ * @conduit:	The selected conduit
-+ * @invoke_ffa_fn:	The function executing the FF-A function
-+ * @features:	Table of the FF-A functions having features
-+ *
-+ * The driver data structure hosting all resident data.
-+ */
-+struct ffa_prvdata {
-+	struct udevice *dev;
-+	u32 fwk_version;
-+	u16 id;
-+	struct ffa_partitions partitions;
-+	struct ffa_rxtxpair pair;
-+	enum ffa_conduit conduit;
-+	invoke_ffa_fn_t invoke_ffa_fn;
-+	struct ffa_features_desc features[FFA_FEATURE_DESC_CNT];
-+};
-+
-+#endif
-diff --git a/drivers/arm-ffa/core.c b/drivers/arm-ffa/core.c
-new file mode 100644
-index 000000000000..98e2d2fa1767
---- /dev/null
-+++ b/drivers/arm-ffa/core.c
-@@ -0,0 +1,1484 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include "arm_ffa_prv.h"
-+#include <asm/global_data.h>
-+#include <asm/io.h>
-+#include <common.h>
-+#include <dm.h>
-+#include <fdtdec.h>
-+#include <linux/errno.h>
-+#include <linux/sizes.h>
-+#include <log.h>
-+#include <malloc.h>
-+#include <mapmem.h>
-+#include <string.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+/**
-+ * The device private data structure containing all the resident
-+ * data read from secure world
-+ */
-+struct ffa_prvdata __ffa_runtime_data ffa_priv_data = {0};
-+
-+/*
-+ * Driver functions
-+ */
-+
-+/**
-+ * ffa_get_device - probes the arm_ffa device
-+ *
-+ * This boot time function makes sure the arm_ffa device is probed
-+ * and ready for use. This is done using uclass_get_device.
-+ * The arm_ffa driver belongs to UCLASS_FFA.
-+ * This function should be called before using the driver.
-+ *
-+ * Arm FF-A transport is implemented through a single u-boot
-+ * device (arm_ffa). So, there is only one device belonging to UCLASS_FFA.
-+ * All FF-A clients should use the arm_ffa device to use the FF-A
-+ * transport.
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int ffa_get_device(void)
-+{
-+	int ret;
-+	int devnum = 0;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (ffa_priv_data.dev)
-+		return FFA_ERR_STAT_SUCCESS;
-+
-+	/*
-+	 * searching and probing the device
-+	 */
-+	ret = uclass_get_device(UCLASS_FFA, devnum, &ffa_priv_data.dev);
-+	if (ret) {
-+		ffa_err("can not find the device");
-+		ffa_priv_data.dev = NULL;
-+		return -ENODEV;
-+	}
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_get_version - FFA_VERSION handler function
-+ *
-+ * This is the boot time function that implements FFA_VERSION FF-A function
-+ * to get from the secure world the FF-A framework version
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_get_version(void)
-+{
-+	u16 major, minor;
-+
-+	FFA_DECLARE_ARGS;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	a0 = FFA_VERSION;
-+	a1 = FFA_VERSION_1_0;
-+	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
-+
-+	if (res.a0 == FFA_ERR_STAT_NOT_SUPPORTED) {
-+		ffa_err("A Firmware Framework implementation does not exist");
-+		return -EOPNOTSUPP;
-+	}
-+
-+	major = GET_FFA_MAJOR_VERSION(res.a0);
-+	minor = GET_FFA_MINOR_VERSION(res.a0);
-+
-+	ffa_info("FF-A driver %d.%d\nFF-A framework %d.%d",
-+		 FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
-+
-+	if ((major == FFA_MAJOR_VERSION && minor >= FFA_MINOR_VERSION)) {
-+		ffa_info("Versions are compatible ");
-+
-+		ffa_priv_data.fwk_version = res.a0;
-+
-+		return FFA_ERR_STAT_SUCCESS;
-+	}
-+
-+	ffa_info("Versions are incompatible ");
-+	return -EPROTONOSUPPORT;
-+}
-+
-+/**
-+ * ffa_get_endpoint_id - FFA_ID_GET handler function
-+ *
-+ * This is the boot time function that implements FFA_ID_GET FF-A function
-+ * to get from the secure world u-boot endpoint ID
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_get_endpoint_id(void)
-+{
-+	FFA_DECLARE_ARGS;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	a0 = FFA_ID_GET;
-+
-+	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
-+
-+	switch (res.a0) {
-+	case FFA_ERROR:
-+	{
-+		if (((int)res.a2) == FFA_ERR_STAT_NOT_SUPPORTED) {
-+			ffa_err("This function is not implemented at this FF-A instance");
-+			return -EOPNOTSUPP;
-+		}
-+
-+		ffa_err("Undefined error code (%d)", ((int)res.a2));
-+		return -EINVAL;
-+	}
-+	case FFA_SUCCESS:
-+	{
-+		ffa_priv_data.id = GET_SELF_ENDPOINT_ID(res.a2);
-+		ffa_info("endpoint ID is %u", ffa_priv_data.id);
-+
-+		return FFA_ERR_STAT_SUCCESS;
-+	}
-+	default:
-+	{
-+		ffa_err("Undefined response function (0x%lx)", res.a0);
-+		return -EINVAL;
-+	}
-+	}
-+}
-+
-+/**
-+ * ffa_get_features_desc - returns the features descriptor of the specified
-+ *						FF-A function
-+ * @func_id:	the FF-A function which the features are to be retrieved
-+ *
-+ * This is a boot time function that searches the features descriptor of the
-+ * specified FF-A function
-+ *
-+ * Return:
-+ *
-+ * When found, the address of the features descriptor is returned. Otherwise, NULL.
-+ */
-+static struct ffa_features_desc *ffa_get_features_desc(u32 func_id)
-+{
-+	u32 desc_idx;
-+
-+	/*
-+	 * search for the descriptor of the selected FF-A interface
-+	 */
-+	for (desc_idx = 0; desc_idx < FFA_FEATURE_DESC_CNT ; desc_idx++)
-+		if (ffa_priv_data.features[desc_idx].func_id == func_id)
-+			return &ffa_priv_data.features[desc_idx];
-+
-+	return NULL;
-+}
-+
-+/**
-+ * ffa_get_rxtx_map_features - FFA_FEATURES handler function with FFA_RXTX_MAP
-+ *							argument
-+ *
-+ * This is the boot time function that implements FFA_FEATURES FF-A function
-+ * to retrieve the FFA_RXTX_MAP features
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_get_rxtx_map_features(void)
-+{
-+	FFA_DECLARE_ARGS;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	a0 = FFA_FEATURES;
-+	a1 = FFA_RXTX_MAP;
-+
-+	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
-+
-+	switch (res.a0) {
-+	case FFA_ERROR:
-+	{
-+		if (((int)res.a2) == FFA_ERR_STAT_NOT_SUPPORTED) {
-+			ffa_err("FFA_RXTX_MAP is not implemented at this FF-A instance");
-+			return -EOPNOTSUPP;
-+		}
-+
-+		ffa_err("Undefined error code (%d)", ((int)res.a2));
-+		return -EINVAL;
-+	}
-+	case FFA_SUCCESS:
-+	{
-+		u32 desc_idx;
-+
-+		/*
-+		 * search for an empty descriptor
-+		 */
-+		for (desc_idx = 0; desc_idx < FFA_FEATURE_DESC_CNT ; desc_idx++)
-+			if (!ffa_priv_data.features[desc_idx].func_id) {
-+				/*
-+				 * populate the descriptor with
-+				 * the interface features data
-+				 */
-+				ffa_priv_data.features[desc_idx].func_id =
-+					FFA_RXTX_MAP;
-+				ffa_priv_data.features[desc_idx].field1 =
-+					res.a2;
-+
-+				ffa_info("FFA_RXTX_MAP features data 0x%lx",
-+					 res.a2);
-+
-+				return FFA_ERR_STAT_SUCCESS;
-+			}
-+
-+		ffa_err("Cannot save FFA_RXTX_MAP features data. Descriptors table full");
-+		return -ENOBUFS;
-+	}
-+	default:
-+	{
-+		ffa_err("Undefined response function (0x%lx)",
-+			res.a0);
-+		return -EINVAL;
-+	}
-+	}
-+}
-+
-+/**
-+ * ffa_get_rxtx_buffers_pages_cnt - reads from the features data descriptors
-+ *						the minimum number of pages in each of the RX/TX
-+ *						buffers
-+ * @buf_4k_pages: Pointer to the minimum number of pages
-+ *
-+ * This is the boot time function that  returns the minimum number of pages
-+ *  in each of the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * buf_4k_pages points to the returned number of pages
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_get_rxtx_buffers_pages_cnt(size_t *buf_4k_pages)
-+{
-+	struct ffa_features_desc *desc = NULL;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!buf_4k_pages)
-+		return -EINVAL;
-+
-+	desc = ffa_get_features_desc(FFA_RXTX_MAP);
-+	if (!desc)
-+		return -EINVAL;
-+
-+	ffa_dbg("FFA_RXTX_MAP descriptor found");
-+
-+	switch (desc->field1) {
-+	case RXTX_4K:
-+		*buf_4k_pages = 1;
-+		break;
-+	case RXTX_16K:
-+		*buf_4k_pages = 4;
-+		break;
-+	case RXTX_64K:
-+		*buf_4k_pages = 16;
-+		break;
-+	default:
-+		ffa_err("RX/TX buffer size not supported");
-+		return -EINVAL;
-+	}
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_free_rxtx_buffers - frees the RX/TX buffers
-+ * @buf_4k_pages: the minimum number of pages in each of the RX/TX
-+ *			  buffers
-+ *
-+ * This is the boot time function used to free the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_free_rxtx_buffers(size_t buf_4k_pages)
-+{
-+	efi_status_t free_rxbuf_ret, free_txbuf_ret;
-+
-+	ffa_info("Freeing RX/TX buffers");
-+
-+	free_rxbuf_ret = efi_free_pages(ffa_priv_data.pair.rxbuf, buf_4k_pages);
-+	free_txbuf_ret = efi_free_pages(ffa_priv_data.pair.txbuf, buf_4k_pages);
-+
-+	if (free_rxbuf_ret != EFI_SUCCESS || free_txbuf_ret != EFI_SUCCESS) {
-+		ffa_err("Failed to free RX/TX buffers (rx: %lu , tx: %lu)",
-+			free_rxbuf_ret,
-+			free_txbuf_ret);
-+		return -EINVAL;
-+	}
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_alloc_rxtx_buffers - allocates the RX/TX buffers
-+ * @buf_4k_pages: the minimum number of pages in each of the RX/TX
-+ *			  buffers
-+ *
-+ * This is the boot time function used by ffa_map_rxtx_buffers to allocate
-+ * the RX/TX buffers before mapping them
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_alloc_rxtx_buffers(size_t buf_4k_pages)
-+{
-+	ffa_dbg("[%s]", __func__);
-+
-+#if CONFIG_IS_ENABLED(EFI_LOADER)
-+
-+	efi_status_t efi_ret;
-+	void *virt_txbuf;
-+	void *virt_rxbuf;
-+
-+	ffa_info("Using %lu 4KB page(s) for RX/TX buffers size",
-+		 buf_4k_pages);
-+
-+	efi_ret = efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
-+				     EFI_BOOT_SERVICES_DATA,
-+				     buf_4k_pages,
-+				     &ffa_priv_data.pair.rxbuf);
-+
-+	if (efi_ret != EFI_SUCCESS) {
-+		ffa_priv_data.pair.rxbuf = 0;
-+		ffa_err("Failure to allocate RX buffer (EFI error: 0x%lx)",
-+			efi_ret);
-+
-+		return -ENOBUFS;
-+	}
-+
-+	ffa_info("RX buffer at phys 0x%llx",
-+		 ffa_priv_data.pair.rxbuf);
-+
-+	/*
-+	 * convert the RX buffer physical address to virtual address
-+	 */
-+	virt_rxbuf = (void *)map_sysmem((phys_addr_t)ffa_priv_data.pair.rxbuf, 0);
-+
-+	/*
-+	 * make sure the buffer is clean before use
-+	 */
-+	memset(virt_rxbuf, 0, buf_4k_pages * SZ_4K);
-+
-+	unmap_sysmem(virt_rxbuf);
-+
-+	efi_ret = efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
-+				     EFI_RUNTIME_SERVICES_DATA,
-+				     buf_4k_pages,
-+				     &ffa_priv_data.pair.txbuf);
-+
-+	if (efi_ret != EFI_SUCCESS) {
-+		ffa_dbg("FFA_RXTX_MAP: freeing RX buffer");
-+		efi_free_pages(ffa_priv_data.pair.rxbuf, buf_4k_pages);
-+		ffa_priv_data.pair.rxbuf = 0;
-+		ffa_priv_data.pair.txbuf = 0;
-+		ffa_err("Failure to allocate the TX buffer (EFI error: 0x%lx)"
-+			, efi_ret);
-+
-+		return -ENOBUFS;
-+	}
-+
-+	ffa_info("TX buffer at phys 0x%llx",
-+		 ffa_priv_data.pair.txbuf);
-+
-+	/*
-+	 * convert the TX buffer physical address to virtual address
-+	 */
-+	virt_txbuf = (void *)map_sysmem((phys_addr_t)ffa_priv_data.pair.txbuf, 0);
-+
-+	/*
-+	 * make sure the buffer is clean before use
-+	 */
-+	memset(virt_txbuf, 0, buf_4k_pages * SZ_4K);
-+
-+	unmap_sysmem(virt_txbuf);
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+
-+#else
-+	return -ENOBUFS;
-+#endif
-+}
-+
-+/**
-+ * ffa_map_rxtx_buffers - FFA_RXTX_MAP handler function
-+ * @buf_4k_pages: the minimum number of pages in each of the RX/TX
-+ *			  buffers
-+ *
-+ * This is the boot time function that implements FFA_RXTX_MAP FF-A function
-+ * to map the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_map_rxtx_buffers(size_t buf_4k_pages)
-+{
-+	int ret;
-+
-+	FFA_DECLARE_ARGS;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	ret = ffa_alloc_rxtx_buffers(buf_4k_pages);
-+	if (ret != FFA_ERR_STAT_SUCCESS)
-+		return ret;
-+
-+	a0 = FFA_RXTX_MAP;
-+	a1 = ffa_priv_data.pair.txbuf;
-+	a2 = ffa_priv_data.pair.rxbuf;
-+	a3 = buf_4k_pages;
-+
-+	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
-+
-+	switch (res.a0) {
-+	case FFA_ERROR:
-+	{
-+		switch (((int)res.a2)) {
-+		case FFA_ERR_STAT_INVALID_PARAMETERS:
-+			ffa_err("One or more fields in input parameters is incorrectly encoded");
-+			ret = -EPERM;
-+			break;
-+		case FFA_ERR_STAT_NO_MEMORY:
-+			ffa_err("Not enough memory");
-+			ret = -ENOMEM;
-+			break;
-+		case FFA_ERR_STAT_DENIED:
-+			ffa_err("Buffer pair already registered");
-+			ret = -EACCES;
-+			break;
-+		case FFA_ERR_STAT_NOT_SUPPORTED:
-+			ffa_err("This function is not implemented at this FF-A instance");
-+			ret = -EOPNOTSUPP;
-+			break;
-+		default:
-+			ffa_err("Undefined error (%d)",
-+				((int)res.a2));
-+			ret = -EINVAL;
-+		}
-+		break;
-+	}
-+	case FFA_SUCCESS:
-+		ffa_info("RX/TX buffers mapped");
-+		return FFA_ERR_STAT_SUCCESS;
-+	default:
-+		ffa_err("Undefined response function (0x%lx)",
-+			res.a0);
-+		ret = -EINVAL;
-+	}
-+
-+	ffa_free_rxtx_buffers(buf_4k_pages);
-+
-+	return ret;
-+}
-+
-+/**
-+ * ffa_unmap_rxtx_buffers - FFA_RXTX_UNMAP handler function
-+ *
-+ * This is the boot time function that implements FFA_RXTX_UNMAP FF-A function
-+ * to unmap the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_unmap_rxtx_buffers(void)
-+{
-+	FFA_DECLARE_ARGS;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	a0 = FFA_RXTX_UNMAP;
-+	a1 = PREP_SELF_ENDPOINT_ID(ffa_priv_data.id);
-+
-+	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
-+
-+	switch (res.a0) {
-+	case FFA_ERROR:
-+	{
-+		if (((int)res.a2) == FFA_ERR_STAT_NOT_SUPPORTED)
-+			panic("[FFA] FFA_RXTX_UNMAP is not implemented at this FF-A instance\n");
-+		else if (((int)res.a2) == FFA_ERR_STAT_INVALID_PARAMETERS)
-+			panic("[FFA] There is no buffer pair registered on behalf of the caller\n");
-+		else
-+			panic("[FFA] Undefined error (%d)\n", ((int)res.a2));
-+	}
-+	case FFA_SUCCESS:
-+	{
-+		size_t buf_4k_pages = 0;
-+		int ret;
-+
-+		ret = ffa_get_rxtx_buffers_pages_cnt(&buf_4k_pages);
-+		if (ret != FFA_ERR_STAT_SUCCESS)
-+			panic("[FFA] RX/TX buffers unmapped but failure in getting pages count\n");
-+
-+		ret = ffa_free_rxtx_buffers(buf_4k_pages);
-+		if (ret != FFA_ERR_STAT_SUCCESS)
-+			panic("[FFA] RX/TX buffers unmapped but failure in freeing the memory\n");
-+
-+		ffa_info("RX/TX buffers unmapped and memory freed");
-+
-+		return FFA_ERR_STAT_SUCCESS;
-+	}
-+	default:
-+		panic("[FFA] Undefined response function (0x%lx)", res.a0);
-+	}
-+}
-+
-+/**
-+ * ffa_release_rx_buffer - FFA_RX_RELEASE handler function
-+ *
-+ * This is the boot time function that invokes FFA_RX_RELEASE FF-A function
-+ * to release the ownership of the RX buffer
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_release_rx_buffer(void)
-+{
-+	FFA_DECLARE_ARGS;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	a0 = FFA_RX_RELEASE;
-+
-+	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
-+
-+	switch (res.a0) {
-+	case FFA_ERROR:
-+	{
-+		if (((int)res.a2) == FFA_ERR_STAT_NOT_SUPPORTED)
-+			panic("[FFA] FFA_RX_RELEASE is not implemented at this FF-A instance\n");
-+		else if (((int)res.a2) == FFA_ERR_STAT_DENIED)
-+			panic("[FFA] Caller did not have ownership of the RX buffer\n");
-+		else
-+			panic("[FFA] Undefined error (%d)\n", ((int)res.a2));
-+	}
-+	case FFA_SUCCESS:
-+		ffa_info("RX buffer released");
-+		return FFA_ERR_STAT_SUCCESS;
-+
-+	default:
-+		panic("[FFA] Undefined response function (0x%lx)\n", res.a0);
-+	}
-+}
-+
-+/**
-+ * ffa_uuid_are_identical - checks whether two given UUIDs are identical
-+ * @uuid1: first UUID
-+ * @uuid2: second UUID
-+ *
-+ * This is a boot time function used by ffa_read_partitions_info to search
-+ * for a UUID in the partitions descriptors table
-+ *
-+ * Return:
-+ *
-+ * 1 when UUIDs match. Otherwise, 0
-+ */
-+int ffa_uuid_are_identical(const union ffa_partition_uuid *uuid1,
-+			   const union ffa_partition_uuid *uuid2)
-+{
-+	if (!uuid1 || !uuid2)
-+		return 0;
-+
-+	return (!memcmp(uuid1, uuid2, sizeof(union ffa_partition_uuid)));
-+}
-+
-+/**
-+ * ffa_read_partitions_info - reads the data queried by FFA_PARTITION_INFO_GET
-+ *							and saves it in the private structure
-+ * @count: The number of partitions queried
-+ * @part_uuid: Pointer to the partition(s) UUID
-+ *
-+ * This is the boot time function that reads the partitions information
-+ * returned by the FFA_PARTITION_INFO_GET and saves it in the private
-+ * data structure.
-+ *
-+ * Return:
-+ *
-+ * The private data structure is updated with the partition(s) information
-+ * FFA_ERR_STAT_SUCCESS is returned on success. Otherwise, failure
-+ */
-+static int ffa_read_partitions_info(u32 count, union ffa_partition_uuid *part_uuid)
-+{
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!count) {
-+		ffa_err("No partition detected");
-+		return -ENODATA;
-+	}
-+
-+	ffa_info("Reading partitions data from the RX buffer");
-+
-+#if CONFIG_IS_ENABLED(EFI_LOADER)
-+
-+	if (!part_uuid) {
-+		/*
-+		 * querying information of all partitions
-+		 */
-+		u64 data_pages;
-+		u64 data_bytes;
-+		efi_status_t efi_ret;
-+		size_t buf_4k_pages = 0;
-+		u32 desc_idx;
-+		struct ffa_partition_info *parts_info;
-+		int ret;
-+
-+		data_bytes = count * sizeof(struct ffa_partition_desc);
-+		data_pages = efi_size_in_pages(data_bytes);
-+
-+		/*
-+		 * get the RX buffer size in pages
-+		 */
-+		ret = ffa_get_rxtx_buffers_pages_cnt(&buf_4k_pages);
-+		if (ret != FFA_ERR_STAT_SUCCESS) {
-+			ffa_err("Can not get the RX buffer size (error %d)", ret);
-+			return ret;
-+		}
-+
-+		if (data_pages > buf_4k_pages) {
-+			ffa_err("Partitions data size exceeds the RX buffer size:");
-+			ffa_err("    Sizes in pages: data %llu , RX buffer %lu ",
-+				data_pages,
-+				buf_4k_pages);
-+
-+			return -ENOMEM;
-+		}
-+
-+		efi_ret = efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
-+					     EFI_RUNTIME_SERVICES_DATA,
-+					     data_pages,
-+					     (u64 *)&ffa_priv_data.partitions.descs);
-+
-+		if (efi_ret != EFI_SUCCESS) {
-+			ffa_priv_data.partitions.descs = NULL;
-+
-+			ffa_err("Cannot  allocate partitions data buffer (EFI error 0x%lx)",
-+				efi_ret);
-+
-+			return -ENOBUFS;
-+		}
-+
-+		/*
-+		 * convert the descs buffer physical address
-+		 * to virtual address
-+		 * This virtual address should not be unmapped
-+		 * descs is expected to be a virtual address
-+		 */
-+		ffa_priv_data.partitions.descs =
-+			(struct ffa_partition_desc *)
-+			map_sysmem((phys_addr_t)
-+				   ffa_priv_data.partitions.descs, 0);
-+
-+		/*
-+		 * make sure the buffer is clean before use
-+		 */
-+		memset(ffa_priv_data.partitions.descs, 0,
-+		       data_pages * SZ_4K);
-+
-+		ffa_info("Copying %lld page(s) of partitions data from RX buffer",
-+			 data_pages);
-+
-+		/*
-+		 * convert the RX buffer physical address to
-+		 * virtual address
-+		 */
-+		parts_info = (struct ffa_partition_info *)
-+			map_sysmem((phys_addr_t)
-+				   ffa_priv_data.pair.rxbuf, 0);
-+
-+		for (desc_idx = 0 ; desc_idx < count ; desc_idx++) {
-+			ffa_priv_data.partitions.descs[desc_idx].info =
-+				parts_info[desc_idx];
-+
-+			ffa_info("Partition ID %x : info cached",
-+				 ffa_priv_data.partitions.descs[desc_idx].info.id);
-+		}
-+		unmap_sysmem(parts_info);
-+
-+		ffa_priv_data.partitions.count = count;
-+
-+		ffa_info("%d partition(s) found and cached", count);
-+
-+	} else {
-+		u32 rx_desc_idx, cached_desc_idx;
-+		struct ffa_partition_info *parts_info;
-+		u8 desc_found;
-+
-+		/*
-+		 * convert the RX buffer physical address to virtual address
-+		 */
-+		parts_info = (struct ffa_partition_info *)
-+			map_sysmem((phys_addr_t)ffa_priv_data.pair.rxbuf, 0);
-+
-+		/*
-+		 * search for the SP IDs read from the RX buffer
-+		 * in the already cached SPs.
-+		 * Update the UUID when ID found.
-+		 */
-+		for (rx_desc_idx = 0; rx_desc_idx < count ; rx_desc_idx++) {
-+			desc_found = 0;
-+
-+			/*
-+			 * search the current ID in the cached partitions
-+			 */
-+			for (cached_desc_idx = 0;
-+			     cached_desc_idx < ffa_priv_data.partitions.count;
-+			     cached_desc_idx++) {
-+				/*
-+				 * save the UUID
-+				 */
-+				if (ffa_priv_data.partitions.descs[cached_desc_idx].info.id ==
-+				    parts_info[rx_desc_idx].id) {
-+					ffa_priv_data.partitions.descs[cached_desc_idx].UUID =
-+						*part_uuid;
-+
-+					desc_found = 1;
-+					break;
-+				}
-+			}
-+
-+			if (!desc_found) {
-+				unmap_sysmem(parts_info);
-+				return -ENODATA;
-+			}
-+		}
-+		unmap_sysmem(parts_info);
-+	}
-+#else
-+#warning "arm_ffa: reading FFA_PARTITION_INFO_GET data not implemented"
-+#endif
-+
-+	return  FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_query_partitions_info - invokes FFA_PARTITION_INFO_GET
-+ *							and saves partitions data
-+ * @part_uuid: Pointer to the partition(s) UUID
-+ * @pcount: Pointer to the number of partitions variable filled when querying
-+ *
-+ * This is the boot time function that executes the FFA_PARTITION_INFO_GET
-+ * to query the partitions data. Then, it calls ffa_read_partitions_info
-+ * to save the data in the private data structure.
-+ *
-+ * After reading the data the RX buffer is released using ffa_release_rx_buffer
-+ *
-+ * Return:
-+ *
-+ * When part_uuid is NULL, all partitions data are retrieved from secure world
-+ * When part_uuid is non NULL, data for partitions matching the given UUID are
-+ * retrieved and the number of partitions is returned
-+ * FFA_ERR_STAT_SUCCESS is returned on success. Otherwise, failure
-+ */
-+static int ffa_query_partitions_info(union ffa_partition_uuid *part_uuid,
-+				     u32 *pcount)
-+{
-+	unsigned long a0 = 0;
-+	union ffa_partition_uuid query_uuid = {0};
-+	unsigned long a5 = 0;
-+	unsigned long a6 = 0;
-+	unsigned long a7 = 0;
-+	struct arm_smccc_res res = {0};
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	a0 = FFA_PARTITION_INFO_GET;
-+
-+	/*
-+	 * If a UUID is specified. Information for one or more
-+	 * partitions in the system is queried. Otherwise, information
-+	 * for all installed partitions is queried
-+	 */
-+
-+	if (part_uuid) {
-+		if (!pcount)
-+			return -EINVAL;
-+
-+		query_uuid = *part_uuid;
-+	}
-+
-+	ffa_priv_data.invoke_ffa_fn(a0, query_uuid.words.a1, query_uuid.words.a2,
-+				    query_uuid.words.a3, query_uuid.words.a4,
-+				    a5, a6, a7, &res);
-+
-+	switch (res.a0) {
-+	case FFA_ERROR:
-+	{
-+		switch (((int)res.a2)) {
-+		case FFA_ERR_STAT_INVALID_PARAMETERS:
-+			ffa_err("Unrecognized UUID");
-+			return -EPERM;
-+		case FFA_ERR_STAT_NO_MEMORY:
-+			ffa_err("Results cannot fit in RX buffer of the caller");
-+			return -ENOMEM;
-+		case FFA_ERR_STAT_DENIED:
-+			ffa_err("Callee is not in a state to handle this request");
-+			return -EACCES;
-+		case FFA_ERR_STAT_NOT_SUPPORTED:
-+			ffa_err("This function is not implemented at this FF-A instance");
-+			return -EOPNOTSUPP;
-+		case FFA_ERR_STAT_BUSY:
-+			ffa_err("RX buffer of the caller is not free");
-+			return -EBUSY;
-+		default:
-+			ffa_err("Undefined error (%d)", ((int)res.a2));
-+			return -EINVAL;
-+		}
-+	}
-+	case FFA_SUCCESS:
-+	{
-+		int ret;
-+
-+		/*
-+		 * res.a2 contains the count of partition information descriptors
-+		 * populated in the RX buffer
-+		 */
-+		if (res.a2) {
-+			ret = ffa_read_partitions_info(res.a2, part_uuid);
-+			if (ret)
-+				ffa_err("Failed to read partition(s) data , error (%d)", ret);
-+		}
-+
-+		/*
-+		 * return the SP count
-+		 */
-+		if (part_uuid) {
-+			if (!ret)
-+				*pcount = res.a2;
-+			else
-+				*pcount = 0;
-+		}
-+		/*
-+		 * After calling FFA_PARTITION_INFO_GET the buffer ownership
-+		 * is assigned to the consumer (u-boot). So, we need to give
-+		 * the ownership back to the secure world
-+		 */
-+		ret = ffa_release_rx_buffer();
-+
-+		if (!part_uuid && !res.a2) {
-+			ffa_err("[FFA] no partition installed in the system");
-+			return -ENODEV;
-+		}
-+
-+		return ret;
-+	}
-+	default:
-+		ffa_err("Undefined response function (0x%lx)", res.a0);
-+		return  -EINVAL;
-+	}
-+}
-+
-+/**
-+ * ffa_get_partitions_info - FFA_PARTITION_INFO_GET handler function
-+ * @func_data: Pointer to the FF-A function arguments container structure.
-+ * The passed arguments:
-+ * Mode 1: When getting from the driver the number of
-+ *	secure partitions:
-+ *	@data0_size: UUID size
-+ *	@data0: pointer to the UUID (little endian)
-+ *	@data1_size: size of the number of partitions
-+ *				variable
-+ *	@data1: pointer to the number of partitions
-+ *			 variable. The variable will be set
-+ *			 by the driver
-+ * Mode 2: When requesting the driver to return the
-+ *	partitions information:
-+ *	@data0_size: UUID size
-+ *	@data0: pointer to the UUID (little endian)
-+ *	@data1_size: size of the SPs information buffer
-+ *	@data1: pointer to SPs information buffer
-+ *		(allocated by the client).
-+ *		The buffer will be filled by the driver
-+ *
-+ * This is the boot time function that queries the secure partition data from
-+ * the private data structure. If not found, it invokes FFA_PARTITION_INFO_GET
-+ * FF-A function to query the partition information from secure world.
-+ *
-+ * A client of the FF-A driver should know the UUID of the service it wants to
-+ * access. It should use the UUID to request the FF-A driver to provide the
-+ * partition(s) information of the service. The FF-A driver uses
-+ * PARTITION_INFO_GET to obtain this information. This is implemented through
-+ * ffa_get_partitions_info function.
-+ * A new FFA_PARTITION_INFO_GET call is issued (first one performed through
-+ * ffa_cache_partitions_info) allowing to retrieve the partition(s) information.
-+ * They are not saved (already done). We only update the UUID in the cached area.
-+ * This assumes that partitions data does not change in the secure world.
-+ * Otherwise u-boot will have an outdated partition data. The benefit of caching
-+ * the information in the FF-A driver is to accommodate discovery after
-+ * ExitBootServices().
-+ *
-+ * When invoked through a client request, ffa_get_partitions_info should be
-+ * called twice. First call is to get from the driver the number of secure
-+ * partitions (SPs) associated to a particular UUID.
-+ * Then, the caller (client) allocates the buffer to host the SPs data and
-+ * issues a 2nd call. Then, the driver fills the SPs data in the pre-allocated
-+ * buffer.
-+ *
-+ * To achieve the mechanism described above, ffa_get_partitions_info uses the
-+ * following functions:
-+ *		ffa_read_partitions_info
-+ *		ffa_query_partitions_info
-+ *
-+ * Return:
-+ *
-+ * @data1: When pointing to the number of partitions variable, the number is
-+ * set by the driver.
-+ * When pointing to the partitions information buffer, the buffer will be
-+ * filled by the driver.
-+ *
-+ * On success FFA_ERR_STAT_SUCCESS is returned. Otherwise, failure
-+ */
-+static int ffa_get_partitions_info(struct ffa_interface_data *func_data)
-+{
-+	/*
-+	 * fill_data:
-+	 * 0: return the SP count
-+	 * 1: fill SP data and return it to the caller
-+	 * -1: undefined mode
-+	 */
-+	int fill_data = -1;
-+	u32 desc_idx, client_desc_idx;
-+	union ffa_partition_uuid *part_uuid;
-+	u32 client_desc_max_cnt;
-+	u32 parts_found = 0;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!func_data) {
-+		ffa_err("No function data provided");
-+		return -EINVAL;
-+	}
-+
-+	if (!ffa_priv_data.partitions.count || !ffa_priv_data.partitions.descs)
-+		panic("[FFA] No partition installed\n");
-+
-+	if (func_data->data0_size == sizeof(union ffa_partition_uuid) &&
-+	    func_data->data0 &&
-+	    func_data->data1_size == sizeof(u32) &&
-+	    func_data->data1) {
-+		/*
-+		 * data0 (in): pointer to UUID
-+		 * data1 (in): pointer to SP count
-+		 * Out: SP count returned in the count variable pointed by data1
-+		 */
-+
-+		fill_data = 0;
-+
-+		ffa_info("Preparing for checking partitions count");
-+
-+	} else if ((func_data->data0_size == sizeof(union ffa_partition_uuid)) &&
-+		   func_data->data0 &&
-+		   (func_data->data1_size >= sizeof(struct ffa_partition_info)) &&
-+		   !(func_data->data1_size % sizeof(struct ffa_partition_info)) &&
-+		   func_data->data1) {
-+		/*
-+		 * data0 (in): pointer to UUID
-+		 * data1 (in): pointer to SPs descriptors buffer
-+		 *             (created by the client)
-+		 * Out: SPs descriptors returned in the buffer
-+		 *      pointed by data1
-+		 */
-+
-+		fill_data = 1;
-+
-+		client_desc_idx = 0;
-+
-+		/*
-+		 * number of empty descriptors preallocated by the caller
-+		 */
-+		client_desc_max_cnt =
-+			func_data->data1_size / sizeof(struct ffa_partition_info);
-+
-+		ffa_info("Preparing for filling partitions info");
-+
-+	} else {
-+		ffa_err("Invalid function arguments provided");
-+		return -EINVAL;
-+	}
-+
-+	part_uuid = (union ffa_partition_uuid *)func_data->data0;
-+
-+	ffa_info("Searching partitions using the provided UUID");
-+
-+#ifdef DEBUG
-+	{
-+		u32 dbg_uuid_cnt;
-+
-+		ffa_dbg("UUID: [LSB]");
-+
-+		for (dbg_uuid_cnt = 0 ; dbg_uuid_cnt < UUID_SIZE ; dbg_uuid_cnt++)
-+			ffa_dbg(" %02x", part_uuid->bytes[dbg_uuid_cnt]);
-+	}
-+#endif
-+
-+	/*
-+	 * search in the cached partitions
-+	 */
-+	for (desc_idx = 0;
-+	     desc_idx < ffa_priv_data.partitions.count;
-+	     desc_idx++) {
-+		if (ffa_uuid_are_identical(&ffa_priv_data.partitions.descs[desc_idx].UUID,
-+					   part_uuid)) {
-+			ffa_info("Partition ID %x matches the provided UUID",
-+				 ffa_priv_data.partitions.descs[desc_idx].info.id);
-+
-+			parts_found++;
-+
-+			if (fill_data) {
-+				/*
-+				 * trying to fill the partition info in data1
-+				 */
-+
-+				if (client_desc_idx < client_desc_max_cnt) {
-+					((struct ffa_partition_info *)
-+					 func_data->data1)[client_desc_idx++] =
-+						ffa_priv_data.partitions.descs[desc_idx].info;
-+					continue;
-+				}
-+
-+				ffa_err("Failed to fill the current descriptor client buffer full");
-+				return -ENOBUFS;
-+			}
-+		}
-+	}
-+
-+	if (!parts_found) {
-+		int ret;
-+
-+		ffa_info("No partition found. Querying framework ...");
-+
-+		ret = ffa_query_partitions_info(part_uuid, &parts_found);
-+
-+		if (ret == FFA_ERR_STAT_SUCCESS) {
-+			if (!fill_data) {
-+				*((u32 *)func_data->data1) = parts_found;
-+
-+				ffa_info("Number of partition(s) found matching the UUID: %d",
-+					 parts_found);
-+			} else {
-+				/*
-+				 * we want to read SPs info
-+				 */
-+
-+				/*
-+				 * If SPs data filled, retry searching SP info again
-+				 */
-+				if (parts_found)
-+					ret = ffa_get_partitions_info(func_data);
-+				else
-+					ret = -ENODATA;
-+			}
-+		}
-+
-+		return ret;
-+	}
-+
-+	/* partition(s) found */
-+	if (!fill_data)
-+		*((u32 *)func_data->data1) = parts_found;
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_cache_partitions_info - Queries and saves all secure partitions data
-+ *
-+ * This is a boot time function that invokes FFA_PARTITION_INFO_GET FF-A
-+ * function to query from secure world all partitions information.
-+ *
-+ * The FFA_PARTITION_INFO_GET call is issued with nil UUID as an argument.
-+ * All installed partitions information are returned. We cache them in the
-+ * resident private data structure and we keep the UUID field empty
-+ * (in FF-A 1.0 UUID is not provided by the partition descriptor)
-+ *
-+ * This function is called at the device probing level.
-+ * ffa_cache_partitions_info uses ffa_query_partitions_info to get the data
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_cache_partitions_info(void)
-+{
-+	ffa_dbg("[%s]", __func__);
-+	return ffa_query_partitions_info(NULL, NULL);
-+}
-+
-+/**
-+ * ffa_msg_send_direct_req - FFA_MSG_SEND_DIRECT_{REQ,RESP} handler function
-+ * @func_data: Pointer to the FF-A function arguments container structure.
-+ *					The passed arguments:
-+ *						@data0_size: partition ID size
-+ *						@data0: pointer to the partition ID
-+ *						@data1_size: exchanged data size
-+ *						@data1: pointer to the data buffer preallocated by
-+ *								the client (in/out)
-+ *
-+ * This is the runtime function that implements FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * FF-A functions.
-+ *
-+ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure partition.
-+ * The response from the secure partition is handled by reading the
-+ * FFA_MSG_SEND_DIRECT_RESP arguments.
-+ *
-+ * The maximum size of the data that can be exchanged is 20 bytes which is
-+ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specification 1.0
-+ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int __ffa_runtime ffa_msg_send_direct_req(struct ffa_interface_data
-+						 *func_data)
-+{
-+	u16 dst_part_id;
-+	unsigned long a0 = 0;
-+	unsigned long a1 = 0;
-+	unsigned long a2 = 0;
-+	struct ffa_send_direct_data *msg;
-+	struct arm_smccc_res res = {0};
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	if (!ffa_priv_data.invoke_ffa_fn)
-+		panic("[FFA] no private data found\n");
-+
-+	if (!func_data)
-+		return -EINVAL;
-+
-+	if (!ffa_priv_data.partitions.count || !ffa_priv_data.partitions.descs)
-+		panic("[FFA] no partition installed\n");
-+
-+	if (func_data->data0_size != sizeof(u16) ||
-+	    !func_data->data0 ||
-+	    func_data->data1_size != FFA_MSG_SEND_DIRECT_MAX_SIZE ||
-+	    !func_data->data1) {
-+		ffa_err("Undefined interface parameters");
-+		return -EINVAL;
-+	}
-+
-+	dst_part_id = *((u16 *)func_data->data0);
-+	msg = func_data->data1;
-+
-+	ffa_dbg("Sending data to partition ID 0x%x", dst_part_id);
-+
-+	a0 = FFA_MSG_SEND_DIRECT_REQ;
-+
-+	a1 = PREP_SELF_ENDPOINT_ID(ffa_priv_data.id) |
-+		PREP_PART_ENDPOINT_ID(dst_part_id);
-+
-+	ffa_priv_data.invoke_ffa_fn(a0, a1, a2,
-+				    msg->a3,
-+				    msg->a4,
-+				    msg->a5,
-+				    msg->a6,
-+				    msg->a7,
-+				    &res);
-+
-+	while (res.a0 == FFA_INTERRUPT)
-+		ffa_priv_data.invoke_ffa_fn(FFA_RUN, res.a1,
-+					    0, 0, 0, 0, 0, 0,
-+					    &res);
-+
-+	switch (res.a0) {
-+	case FFA_ERROR:
-+	{
-+		switch (((int)res.a2)) {
-+		case FFA_ERR_STAT_INVALID_PARAMETERS:
-+			ffa_err("Invalid endpoint ID or non-zero reserved register");
-+			return -EPERM;
-+		case FFA_ERR_STAT_ABORTED:
-+			panic("[FFA] Message target ran into unexpected error and has aborted\n");
-+		case FFA_ERR_STAT_DENIED:
-+			panic("[FFA] Callee is not in a state to handle this request\n");
-+		case FFA_ERR_STAT_NOT_SUPPORTED:
-+			panic("[FFA] This function is not implemented at this FF-A instance\n");
-+		case FFA_ERR_STAT_BUSY:
-+			panic("[FFA] Message target is busy\n");
-+		default:
-+			panic("[FFA] Undefined error (%d)\n", ((int)res.a2));
-+		}
-+	}
-+	case FFA_SUCCESS:
-+
-+		ffa_dbg("Message sent with no response");
-+		return FFA_ERR_STAT_SUCCESS;
-+
-+	case FFA_MSG_SEND_DIRECT_RESP:
-+
-+		ffa_dbg("Message sent with response");
-+
-+		/*
-+		 * extract the 32-bit wide return data
-+		 */
-+		msg->a3 = (u32)res.a3;
-+		msg->a4 = (u32)res.a4;
-+		msg->a5 = (u32)res.a5;
-+		msg->a6 = (u32)res.a6;
-+		msg->a7 = (u32)res.a7;
-+
-+		return FFA_ERR_STAT_SUCCESS;
-+
-+	default:
-+		panic("[FFA] Undefined response function (0x%lx)\n", res.a0);
-+	}
-+}
-+
-+/**
-+ * invoke_ffa_drv_api - The driver dispatcher function
-+ * @func_id:	The FF-A function to be used
-+ * @func_data:  Pointer to the FF-A function arguments container
-+ *					structure. This also includes pointers to the
-+ *					returned data needed by clients.
-+ * The dispatcher is a runtime function that selects the FF-A function handler
-+ * based on the input FF-A function ID.
-+ * The input arguments are passed to the handler function.
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int __ffa_runtime invoke_ffa_drv_api(u32 func_id,
-+				     struct ffa_interface_data *func_data)
-+{
-+	if (!ffa_priv_data.dev)
-+		panic("[FFA] no device found\n");
-+
-+	switch (func_id) {
-+	case FFA_PARTITION_INFO_GET:
-+		return ffa_get_partitions_info(func_data);
-+	case FFA_RXTX_UNMAP:
-+		return ffa_unmap_rxtx_buffers();
-+	case FFA_MSG_SEND_DIRECT_REQ:
-+		return ffa_msg_send_direct_req(func_data);
-+	default:
-+
-+		ffa_err("Undefined FF-A interface (%d)", func_id);
-+
-+		return -EINVAL;
-+	}
-+}
-+
-+/**
-+ * ffa_init_private_data - Initialization of the private data
-+ * @dev:	the arm_ffa device
-+ *
-+ * This boot time function reads data from the platform data structure
-+ * and populates the private data structure
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_init_private_data(struct udevice *dev)
-+{
-+	struct ffa_pdata *pdata = dev_get_plat(dev);
-+
-+	ffa_priv_data.conduit = pdata->conduit;
-+
-+	if (ffa_priv_data.conduit == FFA_CONDUIT_SMC) {
-+		ffa_priv_data.invoke_ffa_fn = arm_ffa_smccc_smc;
-+	} else {
-+		ffa_err("Undefined FF-A conduit (%d)", ffa_priv_data.conduit);
-+		return -EINVAL;
-+	}
-+
-+	ffa_info("Conduit is %s",
-+		 ((ffa_priv_data.conduit == FFA_CONDUIT_SMC) ?
-+		   "SMC" : "NOT SUPPORTED"));
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_probe - The driver probe function
-+ * @dev:	the arm_ffa device
-+ *
-+ * Probing is done at boot time and triggered by the uclass device discovery.
-+ * At probe level the following actions are done:
-+ *	- initialization of the driver private data structure
-+ *	- querying from secure world the FF-A framework version
-+ *	- querying from secure world the u-boot endpoint ID
-+ *	- querying from secure world the supported features of the specified FF-A calls
-+ *	- mapping the RX/TX buffers
-+ *	- querying from secure world all the partitions information
-+ *
-+ * All data queried from secure world is saved in the resident private data structure.
-+ *
-+ * The probe will fail if either FF-A framework is not detected or the
-+ * FF-A requests are not behaving correctly. This ensures that the
-+ * driver is not installed and its operations are not exported to the clients.
-+ * However, once the driver is successfully probed and an FF-A anomaly is
-+ * detected when clients invoke the driver operations, the driver cause
-+ * u-boot to panic because the client would not know what to do in such conditions.
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_probe(struct udevice *dev)
-+{
-+	int ret;
-+	size_t buf_4k_pages = 0;
-+
-+	ffa_dbg("[%s]: initializing the FF-A driver", __func__);
-+
-+	ret = ffa_init_private_data(dev);
-+
-+	if (ret != FFA_ERR_STAT_SUCCESS)
-+		return ret;
-+
-+	ret = ffa_get_version();
-+
-+	if (ret != FFA_ERR_STAT_SUCCESS)
-+		return ret;
-+
-+	ret = ffa_get_endpoint_id();
-+
-+	if (ret != FFA_ERR_STAT_SUCCESS)
-+		return ret;
-+
-+	ret = ffa_get_rxtx_map_features();
-+
-+	if (ret != FFA_ERR_STAT_SUCCESS)
-+		return ret;
-+
-+	ret = ffa_get_rxtx_buffers_pages_cnt(&buf_4k_pages);
-+
-+	if (ret != FFA_ERR_STAT_SUCCESS)
-+		return ret;
-+
-+	ret = ffa_map_rxtx_buffers(buf_4k_pages);
-+
-+	if (ret != FFA_ERR_STAT_SUCCESS)
-+		return ret;
-+
-+	ret = ffa_cache_partitions_info();
-+
-+	if (ret != FFA_ERR_STAT_SUCCESS) {
-+		ffa_free_rxtx_buffers(buf_4k_pages);
-+		return ret;
-+	}
-+
-+	ffa_dbg("[%s]: initialization done", __func__);
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_of_to_plat - Reads the device tree node
-+ * @dev:	the arm_ffa device
-+ *
-+ * This boot time function reads data from the device tree node and populates
-+ * the platform data structure
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+static int ffa_of_to_plat(struct udevice *dev)
-+{
-+	struct ffa_pdata *pdata = dev_get_plat(dev);
-+	const char *conduit;
-+
-+	ffa_dbg("[%s]", __func__);
-+
-+	conduit = fdt_getprop(gd->fdt_blob, dev_of_offset(dev), "method", NULL);
-+
-+	if (strcmp("smc", conduit)) {
-+		ffa_err("Unsupported conduit");
-+		return -EINVAL;
-+	}
-+
-+	pdata->conduit = FFA_CONDUIT_SMC;
-+
-+	return FFA_ERR_STAT_SUCCESS;
-+}
-+
-+/**
-+ * ffa_drv_ops - The driver operations runtime structure
-+ * @invoke_func:	The driver dispatcher
-+ */
-+struct ffa_ops __ffa_runtime_data ffa_drv_ops = {
-+	.invoke_func = invoke_ffa_drv_api
-+};
-+
-+/**
-+ * ffa_device_get_ops - driver operations getter
-+ *
-+ * Return:
-+ * This runtime function returns a pointer to the driver operations structure
-+ */
-+const struct ffa_ops * __ffa_runtime ffa_device_get_ops(void)
-+{
-+	return &ffa_drv_ops;
-+}
-+
-+/**
-+ * Defining the device tree compatible string
-+ */
-+
-+static const struct udevice_id ffa_match_id[] = {
-+	{"arm,ffa", 0},
-+	{},
-+};
-+
-+/**
-+ * Declaring the arm_ffa driver under UCLASS_FFA
-+ */
-+
-+U_BOOT_DRIVER(arm_ffa) = {
-+	.name		= "arm_ffa",
-+	.of_match	= ffa_match_id,
-+	.id		= UCLASS_FFA,
-+	.of_to_plat	= ffa_of_to_plat,
-+	.probe		= ffa_probe,
-+	.plat_auto	= sizeof(struct ffa_pdata),
-+};
-diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-new file mode 100644
-index 000000000000..313f46f74764
---- /dev/null
-+++ b/include/arm_ffa.h
-@@ -0,0 +1,191 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __ARM_FFA_H
-+#define __ARM_FFA_H
-+
-+#include <linux/arm-smccc.h>
-+#include <linux/printk.h>
-+
-+/*
-+ * This header is public. It can be used by clients to access
-+ * data structures and definitions they need
-+ */
-+
-+/*
-+ * Macros for displaying logs
-+ */
-+
-+#define ffa_dbg(fmt, ...)  pr_debug("[FFA] " fmt "\n", ##__VA_ARGS__)
-+#define ffa_info(fmt, ...)  pr_info("[FFA] " fmt "\n", ##__VA_ARGS__)
-+#define ffa_err(fmt, ...)  pr_err("[FFA] " fmt "\n", ##__VA_ARGS__)
-+
-+/*
-+ * The driver operations success error code
-+ */
-+#define FFA_ERR_STAT_SUCCESS				(0)
-+
-+#if CONFIG_IS_ENABLED(EFI_LOADER)
-+
-+#include <efi_loader.h>
-+
-+/*
-+ * __ffa_runtime_data and __ffa_runtime - controls whether data/code are
-+ * available after calling the EFI ExitBootServices service.
-+ * Data/code tagged with these keywords are resident (available at boot time and
-+ * at runtime)
-+ */
-+
-+#define __ffa_runtime_data __efi_runtime_data
-+#define __ffa_runtime __efi_runtime
-+
-+#else
-+
-+#define __ffa_runtime_data
-+#define __ffa_runtime
-+
-+#endif
-+
-+/*
-+ * Definitions of the Arm FF-A interfaces supported by the Arm FF-A driver
-+ */
-+
-+#define FFA_SMC(calling_convention, func_num)				\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
-+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
-+
-+#define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
-+
-+#define FFA_VERSION				FFA_SMC_32(0x63)
-+#define FFA_ID_GET				FFA_SMC_32(0x69)
-+#define FFA_FEATURES				FFA_SMC_32(0x64)
-+#define FFA_PARTITION_INFO_GET				FFA_SMC_32(0x68)
-+#define FFA_RXTX_MAP				FFA_SMC_32(0x66)
-+#define FFA_RXTX_UNMAP				FFA_SMC_32(0x67)
-+#define FFA_RX_RELEASE				FFA_SMC_32(0x65)
-+#define FFA_MSG_SEND_DIRECT_REQ				FFA_SMC_32(0x6F)
-+#define FFA_MSG_SEND_DIRECT_RESP				FFA_SMC_32(0x70)
-+#define FFA_RUN				FFA_SMC_32(0x6D)
-+#define FFA_ERROR				FFA_SMC_32(0x60)
-+#define FFA_SUCCESS				FFA_SMC_32(0x61)
-+#define FFA_INTERRUPT				FFA_SMC_32(0x62)
-+
-+/*
-+ * struct ffa_partition_info - Partition information descriptor
-+ * @id:	Partition ID
-+ * @exec_ctxt:	Execution context count
-+ * @properties:	Partition properties
-+ *
-+ * Data structure containing information about partitions instantiated in the system
-+ * This structure is filled with the data queried by FFA_PARTITION_INFO_GET
-+ */
-+struct  __packed ffa_partition_info {
-+	u16 id;
-+	u16 exec_ctxt;
-+/* partition supports receipt of direct requests */
-+#define FFA_PARTITION_DIRECT_RECV	BIT(0)
-+/* partition can send direct requests. */
-+#define FFA_PARTITION_DIRECT_SEND	BIT(1)
-+/* partition can send and receive indirect messages. */
-+#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
-+	u32 properties;
-+};
-+
-+/*
-+ * struct ffa_send_direct_data - Data structure hosting the data
-+ *                                       used by FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * @a3-a7:	Data read/written from/to w3-w7 registers
-+ *
-+ * Data structure containing the data to be sent by FFA_MSG_SEND_DIRECT_REQ
-+ * or read from FFA_MSG_SEND_DIRECT_RESP
-+ */
-+struct __packed ffa_send_direct_data {
-+	u32 a3; /* w3 */
-+	u32 a4; /* w4 */
-+	u32 a5; /* w5 */
-+	u32 a6; /* w6 */
-+	u32 a7; /* w7 */
-+};
-+
-+#define FFA_MSG_SEND_DIRECT_MAX_SIZE (sizeof(struct ffa_send_direct_data))
-+
-+/* UUID data size */
-+#define UUID_SIZE (16)
-+
-+/*
-+ * union ffa_partition_uuid - Data union hosting the UUID
-+ *							transmitted by FFA_PARTITION_INFO_GET
-+ * @words:	data structure giving 32-bit words access to the UUID data
-+ * @bytes:	data structure giving byte access to the UUID data
-+ *
-+ * The structure holds little-endian UUID data.
-+ */
-+union ffa_partition_uuid {
-+	struct __packed words {
-+	u32 a1; /* w1 */
-+	u32 a2; /* w2 */
-+	u32 a3; /* w3 */
-+	u32 a4; /* w4 */
-+	} words;
-+	u8 bytes[UUID_SIZE];
-+};
-+
-+/**
-+ * struct ffa_interface_data - generic FF-A interface data structure used to exchange
-+ *							data between user layers and the driver
-+ * @data0_size:	size of the first argument
-+ * @data0:	pointer to the first argument
-+ * @data1_size>:	size of the second argument
-+ * @data1:	pointer to the second argument
-+ *
-+ * Using this structure user layers can pass various types of data with different sizes.
-+ * The driver internal functions can detect the nature of this data, verfy compliance
-+ * then execute the request when appropriate.
-+ */
-+struct ffa_interface_data {
-+	u32 data0_size; /* size of the first argument */
-+	void *data0; /* pointer to the first argument */
-+	u32 data1_size; /* size of the second argument */
-+	void *data1; /* pointer to the second argument */
-+};
-+
-+/**
-+ * struct ffa_ops - The driver operations structure
-+ * @invoke_func:	function pointer to the invoke function
-+ *
-+ * The data structure providing all the operations supported by the driver.
-+ * This structure is resident.
-+ */
-+struct ffa_ops {
-+	/* the driver dispatcher */
-+	int (*invoke_func)(u32 func_id, struct ffa_interface_data *func_data);
-+};
-+
-+/**
-+ * The device driver and the Uclass driver public functions
-+ */
-+
-+/**
-+ * ffa_get_invoke_func - performs a call to the FF-A driver dispatcher
-+ */
-+int __ffa_runtime ffa_get_invoke_func(u32 func_id,
-+				      struct ffa_interface_data *func_data);
-+
-+/**
-+ * ffa_device_get_ops - driver operations getter
-+ */
-+const struct ffa_ops * __ffa_runtime ffa_device_get_ops(void);
-+
-+/**
-+ * ffa_get_device - probes the arm_ffa device
-+ */
-+int ffa_get_device(void);
-+
-+/**
-+ * ffa_init_device - probes the arm_ffa device
-+ */
-+int ffa_init_device(void);
-+#endif
-diff --git a/include/arm_ffa_helper.h b/include/arm_ffa_helper.h
-new file mode 100644
-index 000000000000..0e143e54511e
---- /dev/null
-+++ b/include/arm_ffa_helper.h
-@@ -0,0 +1,45 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __ARM_FFA_HELPER_H
-+#define __ARM_FFA_HELPER_H
-+
-+#include <arm_ffa.h>
-+
-+/*
-+ * This header is public. Including this header provides all data structures
-+ * and definitions needed by clients to use the FF-A transport driver
-+ *
-+ * It also provides helper functions allowing to pass data and invoke  FF-A functions
-+ */
-+
-+/**
-+ * ffa_helper_get_partitions_info - Wrapper function for FFA_PARTITION_INFO_GET
-+ */
-+int ffa_helper_get_partitions_info(struct ffa_interface_data *func_data);
-+
-+/**
-+ * ffa_helper_unmap_rxtx_buffers - Wrapper function for FFA_RXTX_UNMAP
-+ */
-+int ffa_helper_unmap_rxtx_buffers(void);
-+
-+/**
-+ * ffa_helper_msg_send_direct_req - Wrapper function for
-+ *								FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ */
-+int __ffa_runtime ffa_helper_msg_send_direct_req(struct ffa_interface_data
-+						 *func_data);
-+
-+/**
-+ * ffa_helper_init_device - Wrapper function for probing the arm_ffa device
-+ */
-+int ffa_helper_init_device(void);
-+
-+/**
-+ * ffa_uuid_str_to_bin - Converts a big endian UUID string to a little endian buffer
-+ */
-+int ffa_uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin);
-+#endif
-diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index 3ba69ad9a084..732441824557 100644
---- a/include/dm/uclass-id.h
-+++ b/include/dm/uclass-id.h
-@@ -55,6 +55,7 @@ enum uclass_id {
- 	UCLASS_EFI_MEDIA,	/* Devices provided by UEFI firmware */
- 	UCLASS_ETH,		/* Ethernet device */
- 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
-+	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
- 	UCLASS_FIRMWARE,	/* Firmware */
- 	UCLASS_FS_FIRMWARE_LOADER,		/* Generic loader */
- 	UCLASS_GPIO,		/* Bank of general-purpose I/O pins */
-diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index 7f2be2339475..54980a130fdb 100644
---- a/include/linux/arm-smccc.h
-+++ b/include/linux/arm-smccc.h
-@@ -1,6 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
- /*
-  * Copyright (c) 2015, Linaro Limited
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
- #ifndef __LINUX_ARM_SMCCC_H
- #define __LINUX_ARM_SMCCC_H
-@@ -57,13 +59,17 @@
- #include <linux/types.h>
- /**
-  * struct arm_smccc_res - Result from SMC/HVC call
-- * @a0-a3 result values from registers 0 to 3
-+ * @a0-a7 result values from registers 0 to 7
-  */
- struct arm_smccc_res {
- 	unsigned long a0;
- 	unsigned long a1;
- 	unsigned long a2;
- 	unsigned long a3;
-+	unsigned long a4;
-+	unsigned long a5;
-+	unsigned long a6;
-+	unsigned long a7;
- };
- 
- /**
-@@ -113,6 +119,26 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
- 			unsigned long a5, unsigned long a6, unsigned long a7,
- 			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk);
- 
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+/**
-+ * __arm_ffa_smccc_smc() - make SMC calls used for FF-A transport
-+ * @a0-a7: arguments passed in 64-bit registers x0 to x7
-+ * @res: result values from 64-bit registers x0 to x7
-+ *
-+ * This function is used to make SMC calls following SMC32 Calling Convention.
-+ * The content of the supplied parameters is copied to registers x0 to x7 prior
-+ * to the SMC instruction. The SMC call return data is 32-bit data read from
-+ * registers x0 tp x7.
-+ */
-+asmlinkage void __arm_ffa_smccc_smc(unsigned long a0, unsigned long a1,
-+				    unsigned long a2, unsigned long a3, unsigned long a4,
-+				    unsigned long a5, unsigned long a6, unsigned long a7,
-+				    struct arm_smccc_res *res);
-+
-+#define arm_ffa_smccc_smc __arm_ffa_smccc_smc
-+
-+#endif
-+
- #define arm_smccc_smc(...) __arm_smccc_smc(__VA_ARGS__, NULL)
- 
- #define arm_smccc_smc_quirk(...) __arm_smccc_smc(__VA_ARGS__)
-diff --git a/lib/Kconfig b/lib/Kconfig
-index acc0ac081a44..65db65c3c4cd 100644
---- a/lib/Kconfig
-+++ b/lib/Kconfig
-@@ -902,6 +902,7 @@ config SMBIOS_PARSER
- source lib/efi/Kconfig
- source lib/efi_loader/Kconfig
- source lib/optee/Kconfig
-+source lib/arm-ffa/Kconfig
- 
- config TEST_FDTDEC
- 	bool "enable fdtdec test"
-diff --git a/lib/Makefile b/lib/Makefile
-index d9b1811f7506..4aa3e2ed2a7e 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -9,6 +9,7 @@ obj-$(CONFIG_EFI) += efi/
- obj-$(CONFIG_EFI_LOADER) += efi_driver/
- obj-$(CONFIG_EFI_LOADER) += efi_loader/
- obj-$(CONFIG_CMD_BOOTEFI_SELFTEST) += efi_selftest/
-+obj-$(CONFIG_ARM_FFA_TRANSPORT_HELPERS) += arm-ffa/
- obj-$(CONFIG_LZMA) += lzma/
- obj-$(CONFIG_BZIP2) += bzip2/
- obj-$(CONFIG_TIZEN) += tizen/
-diff --git a/lib/arm-ffa/Kconfig b/lib/arm-ffa/Kconfig
-new file mode 100644
-index 000000000000..79acbc5a8fe3
---- /dev/null
-+++ b/lib/arm-ffa/Kconfig
-@@ -0,0 +1,6 @@
-+config ARM_FFA_TRANSPORT_HELPERS
-+	bool "Enable interface helpers for Arm Firmware Framework for Armv8-A"
-+	depends on ARM_FFA_TRANSPORT
-+	help
-+	  User layers call FF-A interfaces using helper functions which
-+	  pass the data and the FF-A function ID to the low level driver
-diff --git a/lib/arm-ffa/Makefile b/lib/arm-ffa/Makefile
-new file mode 100644
-index 000000000000..c30c0f398126
---- /dev/null
-+++ b/lib/arm-ffa/Makefile
-@@ -0,0 +1,8 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# (C) Copyright 2021 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+#
-+
-+# This file only gets included when CONFIG_ARM_FFA_TRANSPORT_HELPERS is set
-+
-+obj-y += arm_ffa_helper.o
-diff --git a/lib/arm-ffa/arm_ffa_helper.c b/lib/arm-ffa/arm_ffa_helper.c
-new file mode 100644
-index 000000000000..623899d38044
---- /dev/null
-+++ b/lib/arm-ffa/arm_ffa_helper.c
-@@ -0,0 +1,188 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <arm_ffa_helper.h>
-+#include <uuid.h>
-+
-+/**
-+ * ffa_helper_get_partitions_info - Wrapper function for FFA_PARTITION_INFO_GET
-+ *
-+ * @func_data: Pointer to the FF-A function arguments container
-+ *				structure.
-+ *				The passed arguments:
-+ *					Mode 1: When getting from the driver the number of
-+ *						secure partitions:
-+ *						@data0_size: UUID size
-+ *						@data0: pointer to the UUID (little endian)
-+ *						@data1_size: size of the number of partitions
-+ *									variable
-+ *						@data1: pointer to the number of partitions
-+ *								 variable. The variable will be set
-+ *								 by the driver
-+ *					Mode 2: When requesting the driver to return the
-+ *						partitions information:
-+ *						@data0_size: UUID size
-+ *						@data0: pointer to the UUID (little endian)
-+ *						@data1_size: size of the SPs information buffer
-+ *						@data1: pointer to SPs information buffer
-+ *								(allocated by the client).
-+ *							The buffer will be filled by the driver
-+ *
-+ * This is the boot time function used by clients who wants to get from secure
-+ * world the partition(s) information.
-+ *
-+ * A client of the FF-A driver should know the UUID of the service it wants to
-+ * access. It should use the UUID to request the FF-A driver to provide the
-+ * partition(s) information of the service. The client should use
-+ * ffa_helper_get_partitions_info to pass the UUID information to the driver
-+ * which uses PARTITION_INFO_GET to obtain the partition(s) information.
-+ *
-+ * ffa_helper_get_partitions_info should be called twice. First call is to get
-+ * from the driver the number of secure partitions (SPs) associated to a
-+ * particular UUID. Then, the caller (client) allocates the buffer to host the
-+ * SPs data and issues a 2nd call. Then, the driver fills the SPs data in the
-+ * pre-allocated buffer.
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int ffa_helper_get_partitions_info(struct ffa_interface_data *func_data)
-+{
-+	return ffa_get_invoke_func(FFA_PARTITION_INFO_GET, func_data);
-+}
-+
-+/**
-+ * ffa_helper_unmap_rxtx_buffers - Wrapper function for FFA_RXTX_UNMAP
-+ *
-+ * This is the boot time function that allows clients to unmap the RX/TX
-+ * buffers
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int ffa_helper_unmap_rxtx_buffers(void)
-+{
-+	return ffa_get_invoke_func(FFA_RXTX_UNMAP, NULL);
-+}
-+
-+/**
-+ * ffa_helper_msg_send_direct_req - Wrapper function for
-+ *								FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * @func_data: Pointer to the FF-A function arguments container structure.
-+ * The passed arguments:
-+ *	@data0_size: partition ID size
-+ *	@data0: pointer to the partition ID
-+ *	@data1_size: exchanged data size
-+ *	@data1: pointer to the data buffer preallocated by the client (in/out)
-+ *
-+ * This is the runtime function that allows clients to send data to the secure
-+ * world partitions. The arm_ffa driver uses FFA_MSG_SEND_DIRECT_REQ to send the
-+ * data to the secure partition. The response from the secure partition is
-+ * handled internally by the driver using FFA_MSG_SEND_DIRECT_RESP and returned
-+ * to ffa_helper_msg_send_direct_req through @func_data
-+ *
-+ * The maximum size of the data that can be exchanged is 20 bytes which is
-+ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specification 1.0
-+ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ *
-+ * The client should pre-allocate a buffer pointed by @data1 which the size
-+ * is sizeof(struct ffa_send_direct_data)
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int __ffa_runtime ffa_helper_msg_send_direct_req(struct ffa_interface_data
-+											 *func_data)
-+{
-+	return ffa_get_invoke_func(FFA_MSG_SEND_DIRECT_REQ, func_data);
-+}
-+
-+/**
-+ * ffa_helper_init_device - Wrapper function for probing the arm_ffa device
-+ *
-+ * This boot time function should be called to probe the arm_ffa device so
-+ * it becomes ready for use.
-+ * To achieve that, this function is called automatically at initcalls
-+ * level (after u-boot relocation).
-+ *
-+ * Return:
-+ *
-+ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
-+ */
-+int ffa_helper_init_device(void)
-+{
-+	return ffa_init_device();
-+}
-+
-+/**
-+ * ffa_uuid_str_to_bin - Converts a big endian UUID string to a little endian buffer
-+ * @uuid_str:	UUID string in big endian format (36 bytes wide + '/0')
-+ * @uuid_bin:	preallocated 16 bytes UUID buffer in little endian format
-+ *
-+ * UUID binary format used by the FF-A framework (16 bytes):
-+ *
-+ * [LSB] 4B-2B-2B-2B-6B (little endian data fields)
-+ *
-+ * UUID string is 36 length of characters (36 bytes):
-+ *
-+ * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
-+ * be                be      be       be      be
-+ *
-+ * where x is a hexadecimal character. Fields are separated by '-'s.
-+ * When converting to a binary UUID, these endianness rules apply:
-+ *     be: means the field in the string is considered a big endian hex number
-+ *         and should be converted to little endian binary format
-+ *
-+ * Return:
-+ *
-+ *    uuid_bin filled with little endian UUID data
-+ *    On success 0 is returned. Otherwise, failure code.
-+ */
-+int ffa_uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin)
-+{
-+	u16 tmp16 = 0;
-+	u32 tmp32 = 0;
-+	u64 tmp64 = 0;
-+
-+	if (!uuid_str_valid(uuid_str) || !uuid_bin)
-+		return -EINVAL;
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp32 = simple_strtoul(uuid_str, NULL, 16);
-+	memcpy(uuid_bin, &tmp32, 4);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp16 = simple_strtoul(uuid_str + 9, NULL, 16);
-+	memcpy(uuid_bin + 4, &tmp16, 2);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp16 = simple_strtoul(uuid_str + 14, NULL, 16);
-+	memcpy(uuid_bin + 6, &tmp16, 2);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp16 = simple_strtoul(uuid_str + 19, NULL, 16);
-+	memcpy(uuid_bin + 8, &tmp16, 2);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp64 = simple_strtoull(uuid_str + 24, NULL, 16);
-+	memcpy(uuid_bin + 10, (char *)&tmp64, 6);
-+
-+	return 0;
-+}
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index 4da64b5d2962..c68d9ed4f0bd 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -23,6 +23,10 @@
- #include <asm/setjmp.h>
- #include <linux/libfdt_env.h>
- 
-+#if defined(CONFIG_ARM_FFA_TRANSPORT)
-+#include <arm_ffa_helper.h>
-+#endif
-+
- DECLARE_GLOBAL_DATA_PTR;
- 
- /* Task priority level */
-@@ -2113,6 +2117,10 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
- 	struct efi_event *evt, *next_event;
- 	efi_status_t ret = EFI_SUCCESS;
- 
-+#if defined(CONFIG_ARM_FFA_TRANSPORT)
-+	int ffa_ret;
-+#endif
-+
- 	EFI_ENTRY("%p, %zx", image_handle, map_key);
- 
- 	/* Check that the caller has read the current memory map */
-@@ -2173,6 +2181,15 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
- 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
- 	}
- 
-+#if defined(CONFIG_ARM_FFA_TRANSPORT)
-+	/* unmap FF-A RX/TX buffers */
-+	ffa_ret = ffa_helper_unmap_rxtx_buffers();
-+	if (ffa_ret)
-+		debug("[efi_boottime][ERROR]: can not unmap FF-A RX/TX buffers\n");
-+	else
-+		debug("[efi_boottime][INFO]: FF-A RX/TX buffers unmapped\n");
-+#endif
-+
- 	/* Patch out unsupported runtime function */
- 	efi_runtime_detach();
- 
--- 
-2.37.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.patch
new file mode 100644
index 00000000..cedac061
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.patch
@@ -0,0 +1,59 @@
+From 83f9da30247c2d021658bc1b595c59ecc35eadf5 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 29 Jul 2022 13:07:43 +0100
+Subject: [PATCH 07/26] arm64: smccc: clear the Xn registers after SMC calls
+
+set to zero the x0-x17 registers
+
+As per the SMCCC v1.2 spec, unused result and scratch registers can leak
+information after an SMC call. We can mitigate against this risk by
+returning zero in each register.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+---
+
+Changelog:
+===============
+
+v4:
+
+* move the clearing code into a new macro: clear_gp_regs
+
+v3:
+
+* clear the Xn registers after SMC calls
+
+ arch/arm/cpu/armv8/smccc-call.S | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-call.S
+index ec6f299bc9..32f3eb8eeb 100644
+--- a/arch/arm/cpu/armv8/smccc-call.S
++++ b/arch/arm/cpu/armv8/smccc-call.S
+@@ -50,6 +50,12 @@ ENDPROC(__arm_smccc_hvc)
+ 
+ #ifdef CONFIG_ARM64
+ 
++	.macro	clear_gp_regs
++	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
++	mov	x\n, xzr
++	.endr
++	.endm
++
+ 	.macro SMCCC_1_2 instr
+ 	/* Save `res` and free a GPR that won't be clobbered */
+ 	stp     x1, x19, [sp, #-16]!
+@@ -84,6 +90,9 @@ ENDPROC(__arm_smccc_hvc)
+ 	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
+ 	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
+ 
++	/* x0-x17 registers can leak information after an SMC or HVC call. Let's clear them */
++	clear_gp_regs
++
+ 	/* Restore original x19 */
+ 	ldp     xzr, x19, [sp], #16
+ 	ret
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
deleted file mode 100644
index 3b82b416..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
+++ /dev/null
@@ -1,383 +0,0 @@
-From ee7c0aee66db53b2372a3b4245a8754dceee804d Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 13 Oct 2021 17:51:44 +0100
-Subject: [PATCH 08/24] arm_ffa: introducing MM communication with FF-A
-
-This commit allows to perform MM communication using FF-A transport.
-
-The MM SP (also called partition) can be StandAlonneMM or smm-gateway.
-Both partitions run in OP-TEE.
-
-When using the u-boot FF-A driver, StandAlonneMM and smm-gateway are
-supported.
-
-On EFI services such as GetVariable()/SetVariable(), the data
-is copied from the communication buffer to the MM shared buffer.
-
-Then, notifies the MM SP about data availability in the MM shared buffer.
-Communication with the MM SP is performed using FF-A transport.
-
-On such event, MM SP can read the data and updates the MM shared buffer
-with response data.
-
-The response data is copied back to the communication buffer.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/Kconfig            |  14 +-
- lib/efi_loader/efi_variable_tee.c | 265 +++++++++++++++++++++++++++++-
- 2 files changed, 273 insertions(+), 6 deletions(-)
-
-diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
-index e3f2402d0e8e..37131237af3f 100644
---- a/lib/efi_loader/Kconfig
-+++ b/lib/efi_loader/Kconfig
-@@ -60,13 +60,23 @@ config EFI_VARIABLE_FILE_STORE
- 	  stored as file /ubootefi.var on the EFI system partition.
- 
- config EFI_MM_COMM_TEE
--	bool "UEFI variables storage service via OP-TEE"
--	depends on OPTEE
-+	bool "UEFI variables storage service via the trusted world"
-+	depends on OPTEE || ARM_FFA_TRANSPORT
- 	help
-+         the MM SP (also called partition) can be StandAlonneMM or smm-gateway.
-+	  When using the u-boot OP-TEE driver, StandAlonneMM is supported.
-+	  When using the u-boot FF-A  driver, StandAlonneMM and smm-gateway are supported.
-+
- 	  If OP-TEE is present and running StandAloneMM, dispatch all UEFI
- 	  variable related operations to that. The application will verify,
- 	  authenticate and store the variables on an RPMB.
- 
-+	  When ARM_FFA_TRANSPORT is used, dispatch all UEFI variable related
-+	  operations to the MM SP running under Optee in the trusted world.
-+	  A door bell mechanism is used to notify the SP when there is data in the shared
-+	  MM buffer. The data is copied by u-boot to thea shared buffer before issuing
-+	  the door bell event.
-+
- config EFI_VARIABLE_NO_STORE
- 	bool "Don't persist non-volatile UEFI variables"
- 	help
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index dfef18435dfa..9cb8cfb9c779 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -15,6 +15,28 @@
- #include <malloc.h>
- #include <mm_communication.h>
- 
-+#if (IS_ENABLED(CONFIG_OPTEE))
-+#define OPTEE_PAGE_SIZE BIT(12)
-+#endif
-+
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+
-+#include <arm_ffa_helper.h>
-+#include <mapmem.h>
-+
-+/* MM return codes */
-+#define MM_SUCCESS (0)
-+
-+#define ARM_SVC_ID_SP_EVENT_COMPLETE_AARCH64 (0xC4000061)
-+#define ARM_SVC_ID_SP_EVENT_COMPLETE ARM_SVC_ID_SP_EVENT_COMPLETE_AARCH64
-+
-+/* MM_SP_UUID_DATA defined by the platform */
-+union ffa_partition_uuid mm_sp_svc_uuid = {.bytes = {MM_SP_UUID_DATA}};
-+
-+static u16 __efi_runtime_data mm_sp_id;
-+
-+#endif
-+
- extern struct efi_var_file __efi_runtime_data *efi_var_buf;
- static efi_uintn_t max_buffer_size;	/* comm + var + func + data */
- static efi_uintn_t max_payload_size;	/* func + data */
-@@ -24,6 +46,7 @@ struct mm_connection {
- 	u32 session;
- };
- 
-+#if (IS_ENABLED(CONFIG_OPTEE))
- /**
-  * get_connection() - Retrieve OP-TEE session for a specific UUID.
-  *
-@@ -143,16 +166,229 @@ static efi_status_t optee_mm_communicate(void *comm_buf, ulong dsize)
- 
- 	return ret;
- }
-+#endif
-+
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+
-+/**
-+ * ffa_notify_mm_sp() - Announce there is data in the shared buffer
-+ *
-+ * Notifies the MM partition in the trusted world that
-+ * data is available in the shared buffer.
-+ * This is a blocking call during which trusted world has exclusive access
-+ * to the MM shared buffer.
-+ *
-+ * Return:
-+ *
-+ * 0 on success
-+ */
-+static int __efi_runtime ffa_notify_mm_sp(void)
-+{
-+	struct ffa_interface_data func_data = {0};
-+	struct ffa_send_direct_data msg = {0};
-+	int ret;
-+	u32 sp_event_complete;
-+	int sp_event_ret;
-+
-+	func_data.data0_size = sizeof(mm_sp_id);
-+	func_data.data0 = &mm_sp_id;
-+
-+	msg.a3 = FFA_SHARED_MM_BUFFER_ADDR;
-+	msg.a4 = FFA_SHARED_MM_BUFFER_SIZE;
-+	func_data.data1_size = sizeof(msg);
-+	func_data.data1 = &msg;
-+
-+	ret = ffa_helper_msg_send_direct_req(&func_data);
-+	if (ret != FFA_ERR_STAT_SUCCESS) {
-+		log_err("EFI: Failure to notify the MM SP , FF-A  error (%d)\n", ret);
-+		return ret;
-+	}
-+
-+	sp_event_complete = msg.a3;
-+	sp_event_ret = (int)msg.a4;
-+
-+	if (sp_event_complete == ARM_SVC_ID_SP_EVENT_COMPLETE && sp_event_ret == MM_SUCCESS)
-+		return 0;
-+
-+	log_err("EFI: Failure to notify the MM SP (0x%x , %d)\n",
-+		sp_event_complete,
-+		sp_event_ret);
-+
-+	return -EACCES;
-+}
-+
-+/**
-+ * ffa_discover_mm_sp_id() - Query the MM partition ID
-+ *
-+ * Use the FF-A driver to get the MM partition ID.
-+ * If multiple partitions are found, use the first one
-+ *
-+ * Return:
-+ *
-+ * 0 on success
-+ */
-+static int __efi_runtime ffa_discover_mm_sp_id(void)
-+{
-+	struct ffa_interface_data func_data = {0};
-+	u32 count = 0;
-+	int ret;
-+	struct ffa_partition_info *parts_info;
-+
-+	/*
-+	 * get from the driver the count of the SPs matching the UUID
-+	 */
-+	func_data.data0_size = sizeof(mm_sp_svc_uuid);
-+	func_data.data0 = &mm_sp_svc_uuid;
-+	func_data.data1_size = sizeof(count);
-+	func_data.data1 = &count;
-+
-+	ret = ffa_helper_get_partitions_info(&func_data);
-+	if (ret != FFA_ERR_STAT_SUCCESS) {
-+		log_err("EFI: Failure in querying partitions count (error code: %d)\n", ret);
-+		return ret;
-+	}
-+
-+	if (!count) {
-+		log_info("EFI: No MM partition found\n");
-+		return ret;
-+	}
-+
-+	/*
-+	 * pre-allocate a buffer to be filled by the driver
-+	 * with	 ffa_partition_info structs
-+	 */
-+
-+	parts_info = calloc(count, sizeof(struct ffa_partition_info));
-+	if (!parts_info)
-+		return -EINVAL;
-+
-+	log_info("EFI: Pre-allocating %d partition(s) info structures\n", count);
-+
-+	func_data.data1_size = count *
-+		sizeof(struct ffa_partition_info);
-+	func_data.data1 = parts_info;
-+
-+	/*
-+	 * ask the driver to fill the
-+	 * buffer with the SPs info
-+	 */
-+	ret = ffa_helper_get_partitions_info(&func_data);
-+	if (ret != FFA_ERR_STAT_SUCCESS) {
-+		log_err("EFI: Failure in querying partition(s) info (error code: %d)\n", ret);
-+		free(parts_info);
-+		return ret;
-+	}
-+
-+	/*
-+	 * MM SPs found , use the first one
-+	 */
-+
-+	mm_sp_id = parts_info[0].id;
-+
-+	log_info("EFI: MM partition ID 0x%x\n", mm_sp_id);
-+
-+	free(parts_info);
-+
-+	return 0;
-+}
- 
- /**
-- * mm_communicate() - Adjust the cmonnucation buffer to StandAlonneMM and send
-+ * ffa_mm_communicate() - Exchange EFI services data with  the MM partition using FF-A
-+ * @comm_buf:		locally allocated communication buffer used for for rx/tx
-+ * @dsize:				communication buffer size
-+ *
-+ * Issues a door bell event to notify the MM partition (SP) running in OP-TEE
-+ * that there is data to read from the shared buffer.
-+ * Communication with the MM SP is performed using FF-A transport.
-+ * On the event, MM SP can read the data from the buffer and
-+ * update the MM shared buffer with response data.
-+ * The response data is copied back to the communication buffer.
-+ *
-+ * Return:
-+ *
-+ * EFI status code
-+ */
-+static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_buf_size)
-+{
-+	ulong tx_data_size;
-+	int ffa_ret;
-+	struct efi_mm_communicate_header *mm_hdr;
-+	void *virt_shared_buf;
-+
-+	if (!comm_buf)
-+		return EFI_INVALID_PARAMETER;
-+
-+	/* Discover MM partition ID */
-+	if (!mm_sp_id && ffa_discover_mm_sp_id()  != FFA_ERR_STAT_SUCCESS) {
-+		log_err("EFI: Failure to discover MM partition ID\n");
-+		return EFI_UNSUPPORTED;
-+	}
-+
-+	mm_hdr = (struct efi_mm_communicate_header *)comm_buf;
-+	tx_data_size = mm_hdr->message_len + sizeof(efi_guid_t) + sizeof(size_t);
-+
-+	if (comm_buf_size != tx_data_size || tx_data_size > FFA_SHARED_MM_BUFFER_SIZE)
-+		return EFI_INVALID_PARAMETER;
-+
-+	/* Copy the data to the shared buffer */
-+
-+	virt_shared_buf = (void *)map_sysmem((phys_addr_t)FFA_SHARED_MM_BUFFER_ADDR, 0);
-+	efi_memcpy_runtime(virt_shared_buf, comm_buf, tx_data_size);
-+
-+	/* Announce there is data in the shared buffer */
-+
-+	ffa_ret = ffa_notify_mm_sp();
-+	if (ffa_ret)
-+		unmap_sysmem(virt_shared_buf);
-+
-+	switch (ffa_ret) {
-+	case 0:
-+	{
-+		ulong rx_data_size;
-+		/* Copy the MM SP response from the shared buffer to the communication buffer */
-+		rx_data_size = ((struct efi_mm_communicate_header *)virt_shared_buf)->message_len +
-+			sizeof(efi_guid_t) +
-+			sizeof(size_t);
-+
-+		if (rx_data_size > comm_buf_size) {
-+			unmap_sysmem(virt_shared_buf);
-+			return EFI_OUT_OF_RESOURCES;
-+		}
-+
-+		efi_memcpy_runtime(comm_buf, virt_shared_buf, rx_data_size);
-+		unmap_sysmem(virt_shared_buf);
-+
-+		return EFI_SUCCESS;
-+	}
-+	case -EINVAL:
-+		return EFI_DEVICE_ERROR;
-+	case -EPERM:
-+		return EFI_INVALID_PARAMETER;
-+	case -EACCES:
-+		return EFI_ACCESS_DENIED;
-+	case -EBUSY:
-+		return EFI_OUT_OF_RESOURCES;
-+	default:
-+		return EFI_ACCESS_DENIED;
-+	}
-+}
-+#endif
-+
-+/**
-+ * mm_communicate() - Adjust the communication buffer to the MM SP and send
-  * it to OP-TEE
-  *
-- * @comm_buf:		locally allocted communcation buffer
-+ * @comm_buf:		locally allocted communication buffer
-  * @dsize:		buffer size
-+ *
-+ * The MM SP (also called partition) can be StandAlonneMM or smm-gateway.
-+ * The comm_buf format is the same for both partitions.
-+ * When using the u-boot OP-TEE driver, StandAlonneMM is supported.
-+ * When using the u-boot FF-A  driver, StandAlonneMM and smm-gateway are supported.
-+ *
-  * Return:		status code
-  */
--static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
-+static efi_status_t __efi_runtime mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
- {
- 	efi_status_t ret;
- 	struct efi_mm_communicate_header *mm_hdr;
-@@ -162,7 +398,11 @@ static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
- 	mm_hdr = (struct efi_mm_communicate_header *)comm_buf;
- 	var_hdr = (struct smm_variable_communicate_header *)mm_hdr->data;
- 
-+	#if (IS_ENABLED(CONFIG_OPTEE))
- 	ret = optee_mm_communicate(comm_buf, dsize);
-+	#elif (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+	ret = ffa_mm_communicate(comm_buf, dsize);
-+	#endif
- 	if (ret != EFI_SUCCESS) {
- 		log_err("%s failed!\n", __func__);
- 		return ret;
-@@ -258,6 +498,23 @@ efi_status_t EFIAPI get_max_payload(efi_uintn_t *size)
- 		goto out;
- 	}
- 	*size = var_payload->size;
-+
-+	#if (IS_ENABLED(CONFIG_OPTEE))
-+	/*
-+	 * Although the max payload is configurable on StMM, we only share a
-+	 * single page from OP-TEE for the non-secure buffer used to communicate
-+	 * with StMM. Since OP-TEE will reject to map anything bigger than that,
-+	 * make sure we are in bounds.
-+	 */
-+	if (*size > OPTEE_PAGE_SIZE)
-+		*size = OPTEE_PAGE_SIZE - MM_COMMUNICATE_HEADER_SIZE  -
-+			MM_VARIABLE_COMMUNICATE_SIZE;
-+	#elif (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+		if (*size > FFA_SHARED_MM_BUFFER_SIZE)
-+			*size = FFA_SHARED_MM_BUFFER_SIZE - MM_COMMUNICATE_HEADER_SIZE  -
-+				MM_VARIABLE_COMMUNICATE_SIZE;
-+	#endif
-+
- 	/*
- 	 * There seems to be a bug in EDK2 miscalculating the boundaries and
- 	 * size checks, so deduct 2 more bytes to fulfill this requirement. Fix
-@@ -697,7 +954,7 @@ void efi_variables_boot_exit_notify(void)
- 		ret = EFI_NOT_FOUND;
- 
- 	if (ret != EFI_SUCCESS)
--		log_err("Unable to notify StMM for ExitBootServices\n");
-+		log_err("Unable to notify the MM partition for ExitBootServices\n");
- 	free(comm_buf);
- 
- 	/*
--- 
-2.37.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.patch
new file mode 100644
index 00000000..769209b9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.patch
@@ -0,0 +1,127 @@
+From af17d357674393565c8be15f21c86cba972963e7 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 4 Aug 2022 16:46:47 +0100
+Subject: [PATCH 08/26] lib: uuid: introduce be_uuid_str_to_le_bin function
+
+convert big endian UUID string to little endian buffer
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+---
+
+Changelog:
+===============
+
+v4:
+
+* rename ffa_uuid_str_to_bin to be_uuid_str_to_le_bin and put in
+  a standalone commit (the current)
+
+v3:
+
+* introduce ffa_uuid_str_to_bin (provided by
+  arm_ffa: introduce Arm FF-A low-level driver)
+
+ include/uuid.h |  6 +++++
+ lib/uuid.c     | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 69 insertions(+)
+
+diff --git a/include/uuid.h b/include/uuid.h
+index 4a4883d3b5..5355230b5e 100644
+--- a/include/uuid.h
++++ b/include/uuid.h
+@@ -44,4 +44,10 @@ int uuid_guid_get_bin(const char *guid_str, unsigned char *guid_bin);
+ const char *uuid_guid_get_str(const unsigned char *guid_bin);
+ void gen_rand_uuid(unsigned char *uuid_bin);
+ void gen_rand_uuid_str(char *uuid_str, int str_format);
++
++/**
++ * be_uuid_str_to_le_bin - Converts a big endian UUID string to a little endian buffer
++ */
++int be_uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin);
++
+ #endif
+diff --git a/lib/uuid.c b/lib/uuid.c
+index 284f8113ff..d0fa51d0bf 100644
+--- a/lib/uuid.c
++++ b/lib/uuid.c
+@@ -1,6 +1,7 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+  * Copyright 2011 Calxeda, Inc.
++ * Copyright 2022 ARM Limited
+  */
+ 
+ #include <common.h>
+@@ -342,6 +343,68 @@ int uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin,
+ 	return 0;
+ }
+ 
++/**
++ * be_uuid_str_to_le_bin - Converts a big endian UUID string to a little endian buffer
++ * @uuid_str:	UUID string in big endian format (36 bytes wide + '/0')
++ * @uuid_bin:	preallocated 16 bytes UUID buffer in little endian format
++ *
++ * UUID string is 36 characters (36 bytes):
++ *
++ * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
++ * be		     be	     be	      be      be
++ *
++ * where x is a hexadecimal character. Fields are separated by '-'s.
++ * When converting to a binary UUID, these endianness rules apply:
++ *     be: means the field in the string is considered a big endian hex number
++ *	   and should be converted to little endian binary format
++ *
++ * Return:
++ *
++ *    uuid_bin filled with little endian UUID data
++ *    On success 0 is returned. Otherwise, failure code.
++ */
++int be_uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin)
++{
++	u16 tmp16 = 0;
++	u32 tmp32 = 0;
++	u64 tmp64 = 0;
++
++	if (!uuid_str_valid(uuid_str) || !uuid_bin)
++		return -EINVAL;
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp32 = simple_strtoul(uuid_str, NULL, 16);
++	memcpy(uuid_bin, &tmp32, 4);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp16 = simple_strtoul(uuid_str + 9, NULL, 16);
++	memcpy(uuid_bin + 4, &tmp16, 2);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp16 = simple_strtoul(uuid_str + 14, NULL, 16);
++	memcpy(uuid_bin + 6, &tmp16, 2);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp16 = simple_strtoul(uuid_str + 19, NULL, 16);
++	memcpy(uuid_bin + 8, &tmp16, 2);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp64 = simple_strtoull(uuid_str + 24, NULL, 16);
++	memcpy(uuid_bin + 10, (char *)&tmp64, 6);
++
++	return 0;
++}
++
+ /*
+  * uuid_bin_to_str() - convert big endian binary data to string UUID or GUID.
+  *
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch
new file mode 100644
index 00000000..64653b30
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch
@@ -0,0 +1,2245 @@
+From 4729efd57e260b8c02d8cd1c30a443d29885dbd1 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 15 Aug 2022 15:00:44 +0100
+Subject: [PATCH 09/26] arm_ffa: introduce Arm FF-A low-level driver
+
+Add the driver implementing Arm Firmware Framework for Armv8-A v1.0
+
+The Firmware Framework for Arm A-profile processors (FF-A)
+describes interfaces (ABIs) that standardize communication
+between the Secure World and Normal World leveraging TrustZone
+technology.
+
+This driver uses 64-bit registers as per SMCCCv1.2 spec and comes
+on top of the SMCCC layer. The driver provides the FF-A ABIs needed for
+querying the FF-A framework from the secure world.
+
+32-bit version of the ABIs is supported and 64-bit version of FFA_RXTX_MAP
+and FFA_MSG_SEND_DIRECT_{REQ, RESP}.
+
+In u-boot FF-A design, FF-A is considered as a discoverable bus.
+The Secure World is considered as one entity to communicate with
+using the FF-A bus. FF-A communication is handled by one device and
+one instance (the bus). This FF-A driver takes care of all the
+interactions between Normal world and Secure World.
+
+The driver exports its operations to be used by upper layers.
+
+Exported operations:
+
+- partition_info_get
+- sync_send_receive
+- rxtx_unmap
+
+This implementation provides an optional feature to copy the driver data
+to EFI runtime area.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+---
+
+Changelog:
+===============
+
+v4:
+
+* add doc/README.ffa.drv
+* moving the FF-A driver work to drivers/firmware/arm-ffa
+* use less #ifdefs in lib/efi_loader/efi_boottime.c and replace
+  #if defined by #if CONFIG_IS_ENABLED
+* improving error handling by mapping the FF-A errors to standard errors
+  and logs
+* replacing panics with an error log and returning an error code
+* improving features discovery in FFA_FEATURES by introducing
+  rxtx_min_pages private data field
+* add ffa_remove and ffa_bind functions
+* improve how the driver behaves when bus discovery is done more than
+  once
+
+v3:
+
+* align the interfaces of the u-boot FF-A driver with those in the linux
+  FF-A driver
+* remove the FF-A helper layer
+* make the u-boot FF-A driver independent from EFI
+* provide an optional config that enables copying the driver data to EFI
+  runtime section at ExitBootServices service
+* use 64-bit version of FFA_RXTX_MAP, FFA_MSG_SEND_DIRECT_{REQ, RESP}
+
+v2:
+
+* make FF-A bus discoverable using device_{bind, probe} APIs
+* remove device tree support
+
+v1:
+
+* introduce FF-A bus driver with device tree support
+
+ MAINTAINERS                                   |    7 +
+ common/board_r.c                              |    7 +
+ doc/README.ffa.drv                            |  160 ++
+ drivers/Kconfig                               |    2 +
+ drivers/Makefile                              |    1 +
+ drivers/firmware/arm-ffa/Kconfig              |   39 +
+ drivers/firmware/arm-ffa/Makefile             |    7 +
+ drivers/firmware/arm-ffa/arm-ffa-uclass.c     |   16 +
+ drivers/firmware/arm-ffa/arm_ffa_prv.h        |  196 +++
+ drivers/firmware/arm-ffa/core.c               | 1344 +++++++++++++++++
+ .../arm-ffa/efi_ffa_runtime_data_mgr.c        |   94 ++
+ include/arm_ffa.h                             |  127 ++
+ include/dm/uclass-id.h                        |    1 +
+ lib/efi_loader/efi_boottime.c                 |   12 +
+ 14 files changed, 2013 insertions(+)
+ create mode 100644 doc/README.ffa.drv
+ create mode 100644 drivers/firmware/arm-ffa/Kconfig
+ create mode 100644 drivers/firmware/arm-ffa/Makefile
+ create mode 100644 drivers/firmware/arm-ffa/arm-ffa-uclass.c
+ create mode 100644 drivers/firmware/arm-ffa/arm_ffa_prv.h
+ create mode 100644 drivers/firmware/arm-ffa/core.c
+ create mode 100644 drivers/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c
+ create mode 100644 include/arm_ffa.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 7f27ff4c20..e760b4ca3a 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -244,6 +244,13 @@ F:	board/CZ.NIC/
+ F:	configs/turris_*_defconfig
+ F:	include/configs/turris_*.h
+ 
++ARM FF-A
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++S:	Maintained
++F:	doc/README.ffa.drv
++F:	drivers/firmware/arm-ffa/
++F:	include/arm_ffa.h
++
+ ARM FREESCALE IMX
+ M:	Stefano Babic <sbabic@denx.de>
+ M:	Fabio Estevam <festevam@gmail.com>
+diff --git a/common/board_r.c b/common/board_r.c
+index 6f4aca2077..c75634286b 100644
+--- a/common/board_r.c
++++ b/common/board_r.c
+@@ -63,6 +63,10 @@
+ #include <efi_loader.h>
+ #include <relocate.h>
+ 
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++#include <arm_ffa.h>
++#endif
++
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+ ulong monitor_flash_len;
+@@ -779,6 +783,9 @@ static init_fnc_t init_sequence_r[] = {
+ 	INIT_FUNC_WATCHDOG_RESET
+ 	initr_net,
+ #endif
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	ffa_bus_discover,
++#endif
+ #ifdef CONFIG_POST
+ 	initr_post,
+ #endif
+diff --git a/doc/README.ffa.drv b/doc/README.ffa.drv
+new file mode 100644
+index 0000000000..1c0a33deb8
+--- /dev/null
++++ b/doc/README.ffa.drv
+@@ -0,0 +1,160 @@
++Arm FF-A Driver
++====================
++
++Introduction
++--------------------
++
++FF-A stands for Firmware Framework for Arm A-profile processors.
++
++FF-A specifies interfaces that enable a pair of software sandboxes to communicate with each other. A sandbox aka partition could
++be a VM in the Normal or Secure world, an application in S-EL0, or a Trusted OS in S-EL1.
++
++This FF-A driver implements the interfaces to communicate with partitions in the Secure world aka Secure partitions (SPs).
++
++The driver specifically focuses on communicating with SPs that isolate portions of EFI runtime services that must run in a
++protected environment which is inaccessible by the Host OS or Hypervisor. Examples of such services are set/get variables.
++
++FF-A driver uses the SMC ABIs defined by the FF-A specification to:
++
++- Discover the presence of SPs of interest.
++- Access an SP's service through communication protocols e.g. EFI MM communication protocol.
++
++FF-A and SMC specifications
++-------------------------------------------
++
++The current implementation of the driver relies on FF-A specification v1.0 and uses SMC32 calling convention.
++
++The driver has been tested with Optee OS which supports SMC32 for most of the SMC ABIs.
++
++For more details please refer to: https://developer.arm.com/documentation/den0077/a/?lang=en
++
++The FF-A driver uses 64-bit registers as per SMCCCv1.2 specification.
++
++For more details please refer to: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6?token=
++
++Supported hardware
++--------------------------------
++
++Aarch64 plaforms
++
++Configuration
++----------------------
++
++CONFIG_ARM_FFA_TRANSPORT
++    Enables the FF-A bus driver. Turn this on if you want to use FF-A communication.
++
++CONFIG_ARM_FFA_EFI_RUNTIME_MODE
++    Optional config that enables EFI runtime support for FF-A data and code.
++    ffa_copy_runtime_data allows to copy the FF-A driver data structures to EFI runtime data section.
++    Turning the config on makes ffa_copy_runtime_data available for use and the driver code placed at EFI runtime code section.
++    Call ffa_copy_runtime_data at the event on which you want the FF-A data to be copied (example: at ExitBootServices).
++
++CONFIG_SANDBOX_FFA
++    Enables FF-A Sandbox driver. This emulates the FF-A ABIs handling under Sandbox and provides
++    functional tests for FF-A.
++
++FF-A ABIs under the hood
++---------------------------------------
++
++Invoking an FF-A ABI involves providing to the secure world/hypervisor the expected arguments from the ABI.
++
++The ABI arguments are stored in x0 to x7 registers. Then, an SMC instruction is executed.
++
++At the secure side level or hypervisor the ABI is handled at a higher exception level and the arguments are read and processed.
++
++The response is put back through x0 to x7 registers and control is giving back to the u-boot FF-A driver (non secure world).
++
++The driver reads the response and processes it accordingly.
++
++This methodology applies to all the FF-A ABIs in the driver.
++
++FF-A bus discovery in u-boot
++-------------------------------------------
++
++When CONFIG_ARM_FFA_TRANSPORT is enabled, the FF-A bus is automatically discovered at initcall level (after u-boot relocation).
++
++The function that triggers the discovery process is ffa_bus_discover.
++
++ffa_bus_discover creates, binds and probes the arm_ffa device using device_{bind, probe} APIs.
++
++When the device is probed, ffa_probe is called which tries to communicate with the secure world or hypervisor.
++
++The FF-A bus is usable when these checks succeed:
++
++- querying the FF-A framework version
++- querying from secure world the u-boot endpoint ID
++- querying from secure world the supported features of the specified FF-A calls
++- mapping the RX/TX buffers
++- querying from secure world all the partitions information
++
++Probing fails when any of these operations fail. The FF-A bus discovery succeeds when probing is successful.
++
++When discovery fails the arm_ffa device is destroyed.
++
++The bus driver layer
++------------------------------
++
++The driver comes on top of the SMCCC layer and is implemented in drivers/firmware/arm-ffa/core.c
++
++The driver provides the following features:
++
++- Support for the 32-bit version of the following ABIs:
++
++FFA_VERSION
++FFA_ID_GET
++FFA_FEATURES
++FFA_PARTITION_INFO_GET
++FFA_RXTX_UNMAP
++FFA_RX_RELEASE
++FFA_RUN
++FFA_ERROR
++FFA_SUCCESS
++FFA_INTERRUPT
++
++- Support for the 64-bit version of the following ABIs:
++
++FFA_RXTX_MAP
++FFA_MSG_SEND_DIRECT_REQ
++FFA_MSG_SEND_DIRECT_RESP
++
++- Processing the received data from the secure world/hypervisor and caching it
++
++- Hiding from upper layers the FF-A protocol and registers details. Upper layers focus on exchanged data,
++the driver takes care of how to transport that to the secure world/hypervisor using FF-A.
++
++- The driver provides callbacks to be used by clients to access the FF-A bus:
++
++partition_info_get
++sync_send_receive
++rxtx_unmap
++
++- FF-A bus discovery at initcalls level (after u-boot relocation). The bus is up and running if the FF-A framework is responsive and compatible with the driver.
++
++- When EFI is enabled, unmap the RX/TX buffers at ExitBootServices() level.
++
++- When CONFIG_ARM_FFA_EFI_RUNTIME_MODE enabled, ffa_copy_runtime_data function is available for use.
++
++Using armffa command
++-----------------------------------
++
++armffa is a command showcasing how to use the FF-A driver and how to invoke its operations.
++
++This provides a guidance to the client developers on how to call the FF-A bus interfaces.
++
++Usage:
++
++armffa <sub-command> <arguments>
++
++sub-commands:
++
++        getpart <partition UUID>
++
++            lists the partition(s) info
++
++        ping <partition ID>
++
++            sends a data pattern to the specified partition
++
++        devlist
++
++            displays the arm_ffa device info
+diff --git a/drivers/Kconfig b/drivers/Kconfig
+index b26ca8cf70..4a602517bf 100644
+--- a/drivers/Kconfig
++++ b/drivers/Kconfig
+@@ -6,6 +6,8 @@ source "drivers/core/Kconfig"
+ 
+ source "drivers/adc/Kconfig"
+ 
++source "drivers/firmware/arm-ffa/Kconfig"
++
+ source "drivers/ata/Kconfig"
+ 
+ source "drivers/axi/Kconfig"
+diff --git a/drivers/Makefile b/drivers/Makefile
+index 67c8af7442..77db8736e6 100644
+--- a/drivers/Makefile
++++ b/drivers/Makefile
+@@ -109,6 +109,7 @@ obj-y += iommu/
+ obj-y += smem/
+ obj-y += thermal/
+ obj-$(CONFIG_TEE) += tee/
++obj-$(CONFIG_ARM_FFA_TRANSPORT) += firmware/arm-ffa/
+ obj-y += axi/
+ obj-y += ufs/
+ obj-$(CONFIG_W1) += w1/
+diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa/Kconfig
+new file mode 100644
+index 0000000000..aceb61cf49
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/Kconfig
+@@ -0,0 +1,39 @@
++# SPDX-License-Identifier: GPL-2.0
++
++config ARM_FFA_TRANSPORT
++	bool "Enable Arm Firmware Framework for Armv8-A driver"
++	depends on DM && ARM64
++	select ARM_SMCCC
++	select LIB_UUID
++	select DEVRES
++	help
++	  The Firmware Framework for Arm A-profile processors (FF-A)
++	  describes interfaces (ABIs) that standardize communication
++	  between the Secure World and Normal World leveraging TrustZone
++	  technology.
++
++	  This driver is based on FF-A specification v1.0 and uses SMC32
++	  calling convention.
++
++	  FF-A specification:
++
++	  https://developer.arm.com/documentation/den0077/a/?lang=en
++
++	  In u-boot FF-A design, FF-A is considered as a discoverable bus.
++	  The Secure World is considered as one entity to communicate with
++	  using the FF-A bus.
++	  FF-A communication is handled by one device and one instance (the bus).
++	  This FF-A driver takes care of all the interactions between Normal world
++	  and Secure World.
++
++	  For more details about the FF-A driver, please refer to doc/README.ffa.drv
++
++config ARM_FFA_EFI_RUNTIME_MODE
++	bool "Enable EFI runtime support for FF-A data and code"
++	depends on ARM_FFA_TRANSPORT && EFI_LOADER
++	help
++	  Allows FF-A driver data structures and code to be accessible at EFI runtime.
++	  FF-A data is copied by ffa_copy_runtime_data function.
++	  The driver Code needed at runtime is placed at EFI runtime code section.
++	  Turning this on makes ffa_copy_runtime_data available for use and the driver
++	  code placed at EFI runtime code section.
+diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ffa/Makefile
+new file mode 100644
+index 0000000000..0b9b0a61b4
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/Makefile
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2022 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++#
++
++obj-y += arm-ffa-uclass.o core.o
++obj-$(CONFIG_ARM_FFA_EFI_RUNTIME_MODE) += efi_ffa_runtime_data_mgr.o
+diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
+new file mode 100644
+index 0000000000..7d9695d289
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
+@@ -0,0 +1,16 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <asm/global_data.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++UCLASS_DRIVER(ffa) = {
++	.name		= "ffa",
++	.id		= UCLASS_FFA,
++};
+diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/arm-ffa/arm_ffa_prv.h
+new file mode 100644
+index 0000000000..7bc90f7f66
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
+@@ -0,0 +1,196 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_PRV_H
++#define __ARM_FFA_PRV_H
++
++#include <arm_ffa.h>
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
++#include <linux/arm-smccc.h>
++
++/*
++ * This header is private. It is exclusively used by the FF-A driver
++ */
++
++/* FF-A core driver name */
++#define FFA_DRV_NAME "arm_ffa"
++
++/* FF-A driver version definitions */
++
++#define MAJOR_VERSION_MASK		GENMASK(30, 16)
++#define MINOR_VERSION_MASK		GENMASK(15, 0)
++#define GET_FFA_MAJOR_VERSION(x)		\
++				((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
++#define GET_FFA_MINOR_VERSION(x)		\
++				((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
++#define PACK_VERSION_INFO(major, minor)			\
++	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
++	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
++
++#define FFA_MAJOR_VERSION		(1)
++#define FFA_MINOR_VERSION		(0)
++#define FFA_VERSION_1_0		\
++			PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR_VERSION)
++
++/* Endpoint ID mask (u-boot endpoint ID) */
++
++#define GET_SELF_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define GET_SELF_ENDPOINT_ID(x)		\
++			((u16)(FIELD_GET(GET_SELF_ENDPOINT_ID_MASK, (x))))
++
++#define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
++#define PREP_SELF_ENDPOINT_ID(x)		\
++			(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x)))
++
++/* Partition endpoint ID mask  (partition with which u-boot communicates with) */
++
++#define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define PREP_PART_ENDPOINT_ID(x)		\
++			(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x)))
++
++/*
++ * Definitions of the Arm FF-A interfaces supported by the Arm FF-A driver
++ */
++
++#define FFA_SMC(calling_convention, func_num)				\
++	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
++			   ARM_SMCCC_OWNER_STANDARD, (func_num))
++
++#define FFA_SMC_32(func_num)				FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
++#define FFA_SMC_64(func_num)				FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
++
++enum ffa_abis {
++	FFA_ERROR					= 0x60,
++	FFA_SUCCESS					= 0x61,
++	FFA_INTERRUPT				= 0x62,
++	FFA_VERSION					= 0x63,
++	FFA_FEATURES				= 0x64,
++	FFA_RX_RELEASE				= 0x65,
++	FFA_RXTX_MAP				= 0x66,
++	FFA_RXTX_UNMAP			= 0x67,
++	FFA_PARTITION_INFO_GET		= 0x68,
++	FFA_ID_GET					= 0x69,
++	FFA_RUN						= 0x6D,
++	FFA_MSG_SEND_DIRECT_REQ	= 0x6F,
++	FFA_MSG_SEND_DIRECT_RESP	= 0x70,
++
++	/* to be updated when adding new FFA IDs */
++	FFA_FIRST_ID = FFA_ERROR, /* lowest number ID*/
++	FFA_LAST_ID = FFA_MSG_SEND_DIRECT_RESP, /* highest number ID*/
++};
++
++/* number of the errors supported by the FF-A specification */
++#define MAX_NUMBER_FFA_ERR 9
++
++/* container structure and helper macros to map between an FF-A error and relevant error log */
++struct ffa_abi_errmap {
++	char *err_str[MAX_NUMBER_FFA_ERR];
++};
++
++#define FFA_ERRMAP_COUNT (FFA_LAST_ID - FFA_FIRST_ID + 1)
++#define FFA_ID_TO_ERRMAP_ID(ffa_id) ((ffa_id) - FFA_FIRST_ID)
++
++/* The FF-A SMC function definitions */
++
++typedef struct arm_smccc_1_2_regs ffa_value_t;
++typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
++
++/*
++ * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITION_INFO_GET
++ * @a1-4:	32-bit words access to the UUID data
++ *
++ */
++struct ffa_partition_uuid {
++	u32 a1; /* w1 */
++	u32 a2; /* w2 */
++	u32 a3; /* w3 */
++	u32 a4; /* w4 */
++};
++
++/**
++ * enum ffa_rxtx_buf_sizes - minimum sizes supported
++ * for the RX/TX buffers
++ */
++enum ffa_rxtx_buf_sizes {
++	RXTX_4K,
++	RXTX_64K,
++	RXTX_16K
++};
++
++/**
++ * struct ffa_rxtxpair - structure hosting the RX/TX buffers virtual addresses
++ * @rxbuf:	virtual address of the RX buffer
++ * @txbuf:	virtual address of the TX buffer
++ * @rxtx_min_pages:	RX/TX buffers minimum size in pages
++ *
++ * Data structure hosting the virtual addresses of the mapped RX/TX buffers
++ * These addresses are used by the FF-A functions that use the RX/TX buffers
++ */
++struct ffa_rxtxpair {
++	u64 rxbuf; /* virtual address */
++	u64 txbuf; /* virtual address */
++	size_t rxtx_min_pages; /* minimum number of pages in each of the RX/TX buffers */
++};
++
++/**
++ * struct ffa_partition_desc - the secure partition descriptor
++ * @info:	partition information
++ * @sp_uuid:	the secure partition UUID
++ *
++ * Each partition has its descriptor containing the partitions information and the UUID
++ */
++struct ffa_partition_desc {
++	struct ffa_partition_info info;
++	struct ffa_partition_uuid sp_uuid;
++};
++
++/**
++ * struct ffa_partitions - descriptors for all secure partitions
++ * @count:	The number of partitions descriptors
++ * @descs	The partitions descriptors table
++ *
++ * This data structure contains the partitions descriptors table
++ */
++struct ffa_partitions {
++	u32 count;
++	struct ffa_partition_desc *descs; /* virtual address */
++};
++
++/**
++ * struct ffa_prvdata - the driver private data structure
++ *
++ * @dev:	The arm_ffa device under u-boot driver model
++ * @ffa_ops:	The driver operations structure
++ * @fwk_version:	FF-A framework version
++ * @id:	u-boot endpoint ID
++ * @partitions:	The partitions descriptors structure
++ * @pair:	The RX/TX buffers pair
++ * @invoke_ffa_fn:	The function executing the FF-A function
++ *
++ * The driver data structure hosting all resident data.
++ */
++struct ffa_prvdata {
++	struct udevice *dev;
++	struct ffa_bus_ops ffa_ops;
++	u32 fwk_version;
++	u16 id;
++	struct ffa_partitions partitions;
++	struct ffa_rxtxpair pair;
++	invoke_ffa_fn_t invoke_ffa_fn;
++};
++
++/**
++ * ffa_device_get - create, bind and probe the arm_ffa device
++ */
++int ffa_device_get(void);
++
++/**
++ * ffa_bus_prvdata_get - bus driver private data getter
++ */
++struct ffa_prvdata **ffa_bus_prvdata_get(void);
++
++#endif
+diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/core.c
+new file mode 100644
+index 0000000000..41c7b96e68
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/core.c
+@@ -0,0 +1,1344 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include "arm_ffa_prv.h"
++#include <asm/global_data.h>
++#include <common.h>
++#include <dm.h>
++#include <dm/device-internal.h>
++#include <dm/devres.h>
++#include <dm/root.h>
++#include <linux/errno.h>
++#include <linux/sizes.h>
++#include <log.h>
++#include <malloc.h>
++#include <string.h>
++#include <uuid.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/**
++ * The device private data structure containing all the resident
++ * data read from secure world
++ */
++__ffa_runtime_data struct ffa_prvdata *ffa_priv_data;
++
++/* Error mapping declarations */
++
++__ffa_runtime_data int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] = {
++	0,
++	-EOPNOTSUPP,	/* NOT_SUPPORTED */
++	-EINVAL,	/* INVALID_PARAMETERS */
++	-ENOMEM,	/* NO_MEMORY */
++	-EBUSY,		/* BUSY */
++	-EINTR,		/* INTERRUPTED */
++	-EACCES,	/* DENIED */
++	-EAGAIN,	/* RETRY */
++	-ECANCELED,	/* ABORTED */
++};
++
++struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_COUNT] = {
++	[FFA_ID_TO_ERRMAP_ID(FFA_VERSION)] = {
++		{
++			"",
++			"NOT_SUPPORTED: A Firmware Framework implementation does not exist",
++			"", /* INVALID_PARAMETERS */
++			"", /* NO_MEMORY */
++			"", /* BUSY */
++			"", /* INTERRUPTED */
++			"", /* DENIED */
++			"", /* RETRY */
++			"", /* ABORTED */
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_ID_GET)] = {
++		{
++			"",
++			"NOT_SUPPORTED: This function is not implemented at this FF-A instance",
++			"", /* INVALID_PARAMETERS */
++			"", /* NO_MEMORY */
++			"", /* BUSY */
++			"", /* INTERRUPTED */
++			"", /* DENIED */
++			"", /* RETRY */
++			"", /* ABORTED */
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_FEATURES)] = {
++		{
++			"",
++			"NOT_SUPPORTED: FFA_RXTX_MAP is not implemented at this FF-A instance",
++			"", /* INVALID_PARAMETERS */
++			"", /* NO_MEMORY */
++			"", /* BUSY */
++			"", /* INTERRUPTED */
++			"", /* DENIED */
++			"", /* RETRY */
++			"", /* ABORTED */
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_PARTITION_INFO_GET)] = {
++		{
++			"",
++			"NOT_SUPPORTED: This function is not implemented at this FF-A instance",
++			"INVALID_PARAMETERS: Unrecognized UUID",
++			"NO_MEMORY: Results cannot fit in RX buffer of the caller",
++			"BUSY: RX buffer of the caller is not free",
++			"", /* INTERRUPTED */
++			"DENIED: Callee is not in a state to handle this request",
++			"", /* RETRY */
++			"", /* ABORTED */
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_UNMAP)] = {
++			{
++			"",
++			"NOT_SUPPORTED: FFA_RXTX_UNMAP is not implemented at this FF-A instance",
++			"INVALID_PARAMETERS: No buffer pair registered on behalf of the caller",
++			"", /* NO_MEMORY */
++			"", /* BUSY */
++			"", /* INTERRUPTED */
++			"", /* DENIED */
++			"", /* RETRY */
++			"", /* ABORTED */
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_RX_RELEASE)] = {
++			{
++			"",
++			"NOT_SUPPORTED: FFA_RX_RELEASE is not implemented at this FF-A instance",
++			"", /* INVALID_PARAMETERS */
++			"", /* NO_MEMORY */
++			"", /* BUSY */
++			"", /* INTERRUPTED */
++			"DENIED: Caller did not have ownership of the RX buffer",
++			"", /* RETRY */
++			"", /* ABORTED */
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_MAP)] = {
++			{
++			"",
++			"NOT_SUPPORTED: This function is not implemented at this FF-A instance",
++			"INVALID_PARAMETERS: Field(s) in input parameters incorrectly encoded",
++			"NO_MEMORY: Not enough memory",
++			"", /* BUSY */
++			"", /* INTERRUPTED */
++			"DENIED: Buffer pair already registered",
++			"", /* RETRY */
++			"", /* ABORTED */
++		},
++	},
++};
++
++/**
++ * ffa_to_std_errno - convert FF-A error code to standard error code
++ * @ffa_errno:	Error code returned by the FF-A ABI
++ *
++ * This runtime function maps the given FF-A error code as specified
++ * by the spec to a u-boot standard error code.
++ *
++ * Return:
++ *
++ * The standard error code on success. . Otherwise, failure
++ */
++__ffa_runtime int ffa_to_std_errno(int ffa_errno)
++{
++	int err_idx = -ffa_errno;
++
++	/* map the FF-A error code to the standard u-boot error code */
++	if (err_idx > 0 && err_idx < MAX_NUMBER_FFA_ERR)
++		return ffa_to_std_errmap[err_idx];
++	return -EINVAL;
++}
++
++/**
++ * ffa_print_error_log - print the error log corresponding to the selected FF-A ABI
++ * @ffa_id:	FF-A ABI ID
++ * @ffa_errno:	Error code returned by the FF-A ABI
++ *
++ * This boot time function maps the FF-A error code to the error log relevant to the
++ * selected FF-A ABI. Then the error log is printed.
++ *
++ * Return:
++ *
++ * 0 on success. . Otherwise, failure
++ */
++int ffa_print_error_log(u32 ffa_id, int ffa_errno)
++{
++	int err_idx = -ffa_errno, abi_idx = 0;
++
++	/* map the FF-A error code to the corresponding error log */
++
++	if (err_idx <= 0 || err_idx >= MAX_NUMBER_FFA_ERR)
++		return -EINVAL;
++
++	if (ffa_id < FFA_FIRST_ID || ffa_id > FFA_LAST_ID)
++		return -EINVAL;
++
++	abi_idx = FFA_ID_TO_ERRMAP_ID(ffa_id);
++	if (abi_idx < 0 || abi_idx >= FFA_ERRMAP_COUNT)
++		return -EINVAL;
++
++	if (!err_msg_map[abi_idx].err_str || !err_msg_map[abi_idx].err_str[err_idx])
++		return -EINVAL;
++
++	ffa_err("%s", err_msg_map[abi_idx].err_str[err_idx]);
++
++	return 0;
++}
++
++/*
++ * Driver core functions
++ */
++
++/**
++ * ffa_remove_device - removes the arm_ffa device
++ * @dev:	the device to be removed
++ *
++ * This boot time function makes sure the arm_ffa device is removed
++ * No need to free the kmalloced data when the device is destroyed.
++ * It's automatically done by devm management by
++ * device_remove() -> device_free() -> devres_release_probe().
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_remove_device(struct udevice *dev)
++{
++	int ret;
++
++	if (!dev) {
++		ffa_err("no udevice found");
++		return -ENODEV;
++	}
++
++	ret = device_remove(dev, DM_REMOVE_NORMAL);
++	if (ret) {
++		ffa_err("unable to remove. err:%d\n", ret);
++		return ret;
++	}
++
++	ffa_info("device removed and freed");
++
++	ret = device_unbind(dev);
++	if (ret) {
++		ffa_err("unable to unbind. err:%d\n", ret);
++		return ret;
++	}
++
++	ffa_info("device unbound");
++
++	return 0;
++}
++
++/**
++ * ffa_device_get - create, bind and probe the arm_ffa device
++ *
++ * This boot time function makes sure the arm_ffa device is
++ * created, bound to this driver, probed and ready to use.
++ * Arm FF-A transport is implemented through a single u-boot
++ * device managing the FF-A bus (arm_ffa).
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_device_get(void)
++{
++	int ret;
++	struct udevice *dev = NULL;
++
++	ret = device_bind(dm_root(),
++			  DM_DRIVER_GET(arm_ffa),
++			  FFA_DRV_NAME,
++			  NULL,
++			  ofnode_null(),
++			  &dev);
++	if (ret)
++		return ret;
++
++	/* The FF-A bus discovery succeeds when probing is successful */
++	ret = device_probe(dev);
++	if (ret) {
++		ffa_err("arm_ffa device probing failed");
++		ffa_remove_device(dev);
++		return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * ffa_get_version - FFA_VERSION handler function
++ *
++ * This is the boot time function that implements FFA_VERSION FF-A function
++ * to get from the secure world the FF-A framework version
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_get_version(void)
++{
++	u16 major, minor;
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_32(FFA_VERSION),
++			.a1 = FFA_VERSION_1_0, .a2 = 0, .a3 = 0, .a4 = 0, .a5 = 0, .a6 = 0, .a7 = 0,
++			}, &res);
++
++	ffa_errno = (int)res.a0;
++	if (ffa_errno < 0) {
++		ffa_print_error_log(FFA_VERSION, ffa_errno);
++		return ffa_to_std_errno(ffa_errno);
++	}
++
++	major = GET_FFA_MAJOR_VERSION((u32)res.a0);
++	minor = GET_FFA_MINOR_VERSION((u32)res.a0);
++
++	ffa_info("FF-A driver %d.%d\nFF-A framework %d.%d",
++		 FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
++
++	if ((major == FFA_MAJOR_VERSION && minor >= FFA_MINOR_VERSION)) {
++		ffa_info("Versions are compatible ");
++
++		ffa_priv_data->fwk_version = (u32)res.a0;
++
++		return 0;
++	}
++
++	ffa_err("versions are incompatible\nExpected: %d.%d , Found: %d.%d\n",
++		FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
++
++	return -EPROTONOSUPPORT;
++}
++
++/**
++ * ffa_get_endpoint_id - FFA_ID_GET handler function
++ *
++ * This is the boot time function that implements FFA_ID_GET FF-A function
++ * to get from the secure world u-boot endpoint ID
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_get_endpoint_id(void)
++{
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_32(FFA_ID_GET),
++			.a1 = 0, .a2 = 0, .a3 = 0, .a4 = 0, .a5 = 0, .a6 = 0, .a7 = 0,
++			}, &res);
++
++	if (res.a0 == FFA_SMC_32(FFA_SUCCESS)) {
++		ffa_priv_data->id = GET_SELF_ENDPOINT_ID((u32)res.a2);
++		ffa_info("endpoint ID is %u", ffa_priv_data->id);
++
++		return 0;
++	}
++
++	ffa_errno = (int)res.a2;
++
++	ffa_print_error_log(FFA_ID_GET, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_set_rxtx_buffers_pages_cnt - sets the minimum number of pages in each of the RX/TX buffers
++ * @prop_field: properties field obtained from FFA_FEATURES ABI
++ *
++ * This boot time function sets the minimum number of pages
++ *  in each of the RX/TX buffers in the private data structure
++ *
++ * Return:
++ *
++ * buf_4k_pages points to the returned number of pages
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_set_rxtx_buffers_pages_cnt(u32 prop_field)
++{
++	if (!ffa_priv_data)
++		return -EINVAL;
++
++	switch (prop_field) {
++	case RXTX_4K:
++		ffa_priv_data->pair.rxtx_min_pages = 1;
++		break;
++	case RXTX_16K:
++		ffa_priv_data->pair.rxtx_min_pages = 4;
++		break;
++	case RXTX_64K:
++		ffa_priv_data->pair.rxtx_min_pages = 16;
++		break;
++	default:
++		ffa_err("RX/TX buffer size not supported");
++		return -EINVAL;
++	}
++
++	return 0;
++}
++
++/**
++ * ffa_get_rxtx_map_features - FFA_FEATURES handler function with FFA_RXTX_MAP argument
++ *
++ * This is the boot time function that implements FFA_FEATURES FF-A function
++ * to retrieve the FFA_RXTX_MAP features
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_get_rxtx_map_features(void)
++{
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_32(FFA_FEATURES),
++			.a1 = FFA_SMC_64(FFA_RXTX_MAP),
++			.a2 = 0, .a3 = 0, .a4 = 0, .a5 = 0, .a6 = 0, .a7 = 0,
++			}, &res);
++
++	if (res.a0 == FFA_SMC_32(FFA_SUCCESS))
++		return ffa_set_rxtx_buffers_pages_cnt((u32)res.a2);
++
++	ffa_errno = (int)res.a2;
++	ffa_print_error_log(FFA_FEATURES, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_free_rxtx_buffers - frees the RX/TX buffers
++ *
++ * This is the boot time function used to free the RX/TX buffers
++ *
++ */
++static void ffa_free_rxtx_buffers(void)
++{
++	ffa_info("Freeing RX/TX buffers");
++
++	if (ffa_priv_data->pair.rxbuf) {
++		free((void *)ffa_priv_data->pair.rxbuf);
++		ffa_priv_data->pair.rxbuf = 0;
++	}
++
++	if (ffa_priv_data->pair.txbuf) {
++		free((void *)ffa_priv_data->pair.txbuf);
++		ffa_priv_data->pair.txbuf = 0;
++	}
++}
++
++/**
++ * ffa_alloc_rxtx_buffers - allocates the RX/TX buffers
++ *
++ * This is the boot time function used by ffa_map_rxtx_buffers to allocate
++ * the RX/TX buffers before mapping them. The allocated memory is physically
++ * contiguous since memalign ends up calling malloc which allocates
++ * contiguous memory in u-boot.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_alloc_rxtx_buffers(void)
++{
++	u64 bytes;
++
++	ffa_info("Using %lu 4KB page(s) for RX/TX buffers size",
++		 ffa_priv_data->pair.rxtx_min_pages);
++
++	bytes = ffa_priv_data->pair.rxtx_min_pages * SZ_4K;
++
++	/* RX/TX buffers addresses should be PAGE_SIZE aligned */
++
++	ffa_priv_data->pair.rxbuf = (u64)memalign(PAGE_SIZE, bytes);
++	if (!ffa_priv_data->pair.rxbuf) {
++		ffa_err("failure to allocate RX buffer");
++		return -ENOBUFS;
++	}
++
++	ffa_info("RX buffer at virtual address 0x%llx", ffa_priv_data->pair.rxbuf);
++
++	ffa_priv_data->pair.txbuf = (u64)memalign(PAGE_SIZE, bytes);
++	if (!ffa_priv_data->pair.txbuf) {
++		free((void *)ffa_priv_data->pair.rxbuf);
++		ffa_priv_data->pair.rxbuf = 0;
++		ffa_err("failure to allocate the TX buffer");
++		return -ENOBUFS;
++	}
++
++	ffa_info("TX buffer at virtual address 0x%llx", ffa_priv_data->pair.txbuf);
++
++	/*
++	 * make sure the buffers are cleared before use
++	 */
++	memset((void *)ffa_priv_data->pair.rxbuf, 0, bytes);
++	memset((void *)ffa_priv_data->pair.txbuf, 0, bytes);
++
++	return 0;
++}
++
++/**
++ * ffa_map_rxtx_buffers - FFA_RXTX_MAP handler function
++ *
++ * This is the boot time function that implements FFA_RXTX_MAP FF-A function
++ * to map the RX/TX buffers
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_map_rxtx_buffers(void)
++{
++	int ret;
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	ret = ffa_alloc_rxtx_buffers();
++	if (ret)
++		return ret;
++
++	/*
++	 * we need to pass the physical addresses of the RX/TX buffers
++	 * in u-boot physical/virtual mapping is 1:1
++	 *no need to convert from virtual to physical
++	 */
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_64(FFA_RXTX_MAP),
++			.a1 = ffa_priv_data->pair.txbuf,
++			.a2 = ffa_priv_data->pair.rxbuf,
++			.a3 = ffa_priv_data->pair.rxtx_min_pages,
++			.a4 = 0, .a5 = 0, .a6 = 0, .a7 = 0,
++			}, &res);
++
++	if (res.a0 == FFA_SMC_32(FFA_SUCCESS)) {
++		ffa_info("RX/TX buffers mapped");
++		return 0;
++	}
++
++	ffa_errno = (int)res.a2;
++	ffa_print_error_log(FFA_RXTX_MAP, ffa_errno);
++
++	ffa_free_rxtx_buffers();
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_unmap_rxtx_buffers - FFA_RXTX_UNMAP handler function
++ *
++ * This is the boot time function that implements FFA_RXTX_UNMAP FF-A function
++ * to unmap the RX/TX buffers
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_unmap_rxtx_buffers(void)
++{
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_32(FFA_RXTX_UNMAP),
++			.a1 = PREP_SELF_ENDPOINT_ID(ffa_priv_data->id),
++			.a2 = 0, .a3 = 0, .a4 = 0, .a5 = 0, .a6 = 0, .a7 = 0,
++			}, &res);
++
++	if (res.a0 == FFA_SMC_32(FFA_SUCCESS)) {
++		ffa_free_rxtx_buffers();
++		return 0;
++	}
++
++	ffa_errno = (int)res.a2;
++	ffa_print_error_log(FFA_RXTX_UNMAP, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_release_rx_buffer - FFA_RX_RELEASE handler function
++ *
++ * This is the boot time function that invokes FFA_RX_RELEASE FF-A function
++ * to release the ownership of the RX buffer
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_release_rx_buffer(void)
++{
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_32(FFA_RX_RELEASE),
++			.a1 = 0, .a2 = 0, .a3 = 0, .a4 = 0, .a5 = 0, .a6 = 0, .a7 = 0,
++			}, &res);
++
++	if (res.a0 == FFA_SMC_32(FFA_SUCCESS))
++		return 0;
++
++	ffa_errno = (int)res.a2;
++	ffa_print_error_log(FFA_RX_RELEASE, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_uuid_are_identical - checks whether two given UUIDs are identical
++ * @uuid1: first UUID
++ * @uuid2: second UUID
++ *
++ * This is a boot time function used by ffa_read_partitions_info to search
++ * for a UUID in the partitions descriptors table
++ *
++ * Return:
++ *
++ * 1 when UUIDs match. Otherwise, 0
++ */
++int ffa_uuid_are_identical(const struct ffa_partition_uuid *uuid1,
++			   const struct ffa_partition_uuid *uuid2)
++{
++	if (!uuid1 || !uuid2)
++		return 0;
++
++	return (!memcmp(uuid1, uuid2, sizeof(struct ffa_partition_uuid)));
++}
++
++/**
++ * ffa_read_partitions_info - reads the data queried by FFA_PARTITION_INFO_GET
++ *							and saves it in the private structure
++ * @count: The number of partitions queried
++ * @part_uuid: Pointer to the partition(s) UUID
++ *
++ * This is the boot time function that reads the partitions information
++ * returned by the FFA_PARTITION_INFO_GET and saves it in the private
++ * data structure.
++ *
++ * Return:
++ *
++ * The private data structure is updated with the partition(s) information
++ * 0 is returned on success. Otherwise, failure
++ */
++static int ffa_read_partitions_info(u32 count, struct ffa_partition_uuid *part_uuid)
++{
++	if (!count) {
++		ffa_err("no partition detected");
++		return -ENODATA;
++	}
++
++	ffa_info("Reading partitions data from the RX buffer");
++
++	if (!part_uuid) {
++		/*
++		 * querying information of all partitions
++		 */
++		u64 buf_bytes;
++		u64 data_bytes;
++		u32 desc_idx;
++		struct ffa_partition_info *parts_info;
++
++		data_bytes = count * sizeof(struct ffa_partition_desc);
++
++		buf_bytes = ffa_priv_data->pair.rxtx_min_pages * SZ_4K;
++
++		if (data_bytes > buf_bytes) {
++			ffa_err("partitions data size exceeds the RX buffer size:");
++			ffa_err("    sizes in bytes: data %llu , RX buffer %llu ",
++				data_bytes,
++				buf_bytes);
++
++			return -ENOMEM;
++		}
++
++		ffa_priv_data->partitions.descs = (struct ffa_partition_desc *)
++			devm_kmalloc(ffa_priv_data->dev, data_bytes, __GFP_ZERO);
++		if (!ffa_priv_data->partitions.descs) {
++			ffa_err("cannot  allocate partitions data buffer");
++			return -ENOMEM;
++		}
++
++		parts_info = (struct ffa_partition_info *)ffa_priv_data->pair.rxbuf;
++
++		for (desc_idx = 0 ; desc_idx < count ; desc_idx++) {
++			ffa_priv_data->partitions.descs[desc_idx].info =
++				parts_info[desc_idx];
++
++			ffa_info("Partition ID %x : info cached",
++				 ffa_priv_data->partitions.descs[desc_idx].info.id);
++		}
++
++		ffa_priv_data->partitions.count = count;
++
++		ffa_info("%d partition(s) found and cached", count);
++
++	} else {
++		u32 rx_desc_idx, cached_desc_idx;
++		struct ffa_partition_info *parts_info;
++		u8 desc_found;
++
++		parts_info = (struct ffa_partition_info *)ffa_priv_data->pair.rxbuf;
++
++		/*
++		 * search for the SP IDs read from the RX buffer
++		 * in the already cached SPs.
++		 * Update the UUID when ID found.
++		 */
++		for (rx_desc_idx = 0; rx_desc_idx < count ; rx_desc_idx++) {
++			desc_found = 0;
++
++			/*
++			 * search the current ID in the cached partitions
++			 */
++			for (cached_desc_idx = 0;
++			     cached_desc_idx < ffa_priv_data->partitions.count;
++			     cached_desc_idx++) {
++				/*
++				 * save the UUID
++				 */
++				if (ffa_priv_data->partitions.descs[cached_desc_idx].info.id ==
++				    parts_info[rx_desc_idx].id) {
++					ffa_priv_data->partitions.descs[cached_desc_idx].sp_uuid =
++						*part_uuid;
++
++					desc_found = 1;
++					break;
++				}
++			}
++
++			if (!desc_found)
++				return -ENODATA;
++		}
++	}
++
++	return  0;
++}
++
++/**
++ * ffa_query_partitions_info - invokes FFA_PARTITION_INFO_GET and saves partitions data
++ *
++ * @part_uuid: Pointer to the partition(s) UUID
++ * @pcount: Pointer to the number of partitions variable filled when querying
++ *
++ * This is the boot time function that executes the FFA_PARTITION_INFO_GET
++ * to query the partitions data. Then, it calls ffa_read_partitions_info
++ * to save the data in the private data structure.
++ *
++ * After reading the data the RX buffer is released using ffa_release_rx_buffer
++ *
++ * Return:
++ *
++ * When part_uuid is NULL, all partitions data are retrieved from secure world
++ * When part_uuid is non NULL, data for partitions matching the given UUID are
++ * retrieved and the number of partitions is returned
++ * 0 is returned on success. Otherwise, failure
++ */
++static int ffa_query_partitions_info(struct ffa_partition_uuid *part_uuid,
++				     u32 *pcount)
++{
++	struct ffa_partition_uuid query_uuid = {0};
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	/*
++	 * If a UUID is specified. Information for one or more
++	 * partitions in the system is queried. Otherwise, information
++	 * for all installed partitions is queried
++	 */
++
++	if (part_uuid) {
++		if (!pcount)
++			return -EINVAL;
++
++		query_uuid = *part_uuid;
++	} else if (pcount) {
++		return -EINVAL;
++	}
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_32(FFA_PARTITION_INFO_GET),
++			.a1 = query_uuid.a1,
++			.a2 = query_uuid.a2,
++			.a3 = query_uuid.a3,
++			.a4 = query_uuid.a4,
++			.a5 = 0,
++			.a6 = 0,
++			.a7 = 0,
++			}, &res);
++
++	if (res.a0 == FFA_SMC_32(FFA_SUCCESS)) {
++		int ret;
++
++		/*
++		 * res.a2 contains the count of partition information descriptors
++		 * populated in the RX buffer
++		 */
++		if (res.a2) {
++			ret = ffa_read_partitions_info((u32)res.a2, part_uuid);
++			if (ret) {
++				ffa_err("failed to read partition(s) data , error (%d)", ret);
++				ffa_release_rx_buffer();
++				return -EINVAL;
++			}
++		}
++
++		/*
++		 * return the SP count (when querying using a UUID)
++		 */
++		if (pcount)
++			*pcount = (u32)res.a2;
++
++		/*
++		 * After calling FFA_PARTITION_INFO_GET the buffer ownership
++		 * is assigned to the consumer (u-boot). So, we need to give
++		 * the ownership back to the SPM or hypervisor
++		 */
++		ret = ffa_release_rx_buffer();
++
++		return ret;
++	}
++
++	ffa_errno = (int)res.a2;
++	ffa_print_error_log(FFA_PARTITION_INFO_GET, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_get_partitions_info - FFA_PARTITION_INFO_GET handler function
++ *
++ * The passed arguments:
++ * Mode 1: When getting from the driver the number of
++ *	secure partitions:
++ *	@uuid_str: pointer to the UUID string
++ *	@parts_size: pointer to the variable that contains the number of partitions
++ *			 The variable will be set by the driver
++ *	@buffer: NULL
++ *
++ * Mode 2: When requesting the driver to return the
++ *	partitions information:
++ *	@uuid_str: pointer to the UUID string
++ *	@parts_size: pointer to the size of the SPs information buffer in bytes
++ *	@buffer: pointer to SPs information buffer
++ *		(allocated by the client).
++ *		The buffer will be filled by the driver
++ *
++ * This is the boot time function that queries the secure partition data from
++ * the private data structure. If not found, it invokes FFA_PARTITION_INFO_GET
++ * FF-A function to query the partition information from secure world.
++ *
++ * A client of the FF-A driver should know the UUID of the service it wants to
++ * access. It should use the UUID to request the FF-A driver to provide the
++ * partition(s) information of the service. The FF-A driver uses
++ * PARTITION_INFO_GET to obtain this information. This is implemented through
++ * ffa_get_partitions_info function.
++ * A new FFA_PARTITION_INFO_GET call is issued (first one performed through
++ * ffa_cache_partitions_info) allowing to retrieve the partition(s) information.
++ * They are not saved (already done). We only update the UUID in the cached area.
++ * This assumes that partitions data does not change in the secure world.
++ * Otherwise u-boot will have an outdated partition data. The benefit of caching
++ * the information in the FF-A driver is to accommodate discovery after
++ * ExitBootServices().
++ *
++ * When invoked through a client request, ffa_get_partitions_info should be
++ * called twice. First call is to get from the driver the number of secure
++ * partitions (SPs) associated to a particular UUID.
++ * Then, the caller (client) allocates the buffer to host the SPs data and
++ * issues a 2nd call. Then, the driver fills the SPs data in the pre-allocated
++ * buffer.
++ *
++ * To achieve the mechanism described above, ffa_get_partitions_info uses the
++ * following functions:
++ *		ffa_read_partitions_info
++ *		ffa_query_partitions_info
++ *
++ * Return:
++ *
++ * @parts_size: When pointing to the number of partitions variable, the number is
++ * set by the driver.
++ * When pointing to the partitions information buffer size, the buffer will be
++ * filled by the driver.
++ *
++ * On success 0 is returned. Otherwise, failure
++ */
++static int ffa_get_partitions_info(const char *uuid_str,
++				   u32 *parts_size, struct ffa_partition_info *buffer)
++{
++	/*
++	 * fill_data:
++	 * 0: return the SP count
++	 * 1: fill SP data and return it to the caller
++	 * -1: undefined mode
++	 */
++	int fill_data = -1;
++	u32 desc_idx, client_desc_idx;
++	struct ffa_partition_uuid part_uuid = {0};
++	u32 client_desc_max_cnt;
++	u32 parts_found = 0;
++
++	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.descs) {
++		ffa_err("no partition installed");
++		return -EINVAL;
++	}
++
++	if (!uuid_str) {
++		ffa_err("no UUID provided");
++		return -EINVAL;
++	}
++
++	if (!parts_size) {
++		ffa_err("no size/count provided");
++		return -EINVAL;
++	}
++
++	if (be_uuid_str_to_le_bin(uuid_str, (unsigned char *)&part_uuid)) {
++		ffa_err("invalid UUID");
++		return -EINVAL;
++	}
++
++	if (!buffer) {
++		/* Mode 1: getting the number of secure partitions */
++
++		fill_data = 0;
++
++		ffa_info("Preparing for checking partitions count");
++
++	} else if ((*parts_size >= sizeof(struct ffa_partition_info)) &&
++		   !(*parts_size % sizeof(struct ffa_partition_info))) {
++		/* Mode 2: retrieving the partitions information */
++
++		fill_data = 1;
++
++		client_desc_idx = 0;
++
++		/*
++		 * number of empty descriptors preallocated by the caller
++		 */
++		client_desc_max_cnt = *parts_size / sizeof(struct ffa_partition_info);
++
++		ffa_info("Preparing for filling partitions info");
++
++	} else {
++		ffa_err("invalid function arguments provided");
++		return -EINVAL;
++	}
++
++	ffa_info("Searching partitions using the provided UUID");
++
++	/*
++	 * search in the cached partitions
++	 */
++	for (desc_idx = 0;
++	     desc_idx < ffa_priv_data->partitions.count;
++	     desc_idx++) {
++		if (ffa_uuid_are_identical(&ffa_priv_data->partitions.descs[desc_idx].sp_uuid,
++					   &part_uuid)) {
++			ffa_info("Partition ID %x matches the provided UUID",
++				 ffa_priv_data->partitions.descs[desc_idx].info.id);
++
++			parts_found++;
++
++			if (fill_data) {
++				/*
++				 * trying to fill the partition info in the input buffer
++				 */
++
++				if (client_desc_idx < client_desc_max_cnt) {
++					buffer[client_desc_idx++] =
++						ffa_priv_data->partitions.descs[desc_idx].info;
++					continue;
++				}
++
++				ffa_err("failed to fill the current descriptor client buffer full");
++				return -ENOBUFS;
++			}
++		}
++	}
++
++	if (!parts_found) {
++		int ret;
++
++		ffa_info("No partition found. Querying framework ...");
++
++		ret = ffa_query_partitions_info(&part_uuid, &parts_found);
++
++		if (ret == 0) {
++			if (!fill_data) {
++				*parts_size = parts_found;
++
++				ffa_info("Number of partition(s) found matching the UUID: %d",
++					 parts_found);
++			} else {
++				/*
++				 * If SPs data detected, they are already in the private data
++				 * structure, retry searching SP data again to return them
++				 *  to the caller
++				 */
++				if (parts_found)
++					ret = ffa_get_partitions_info(uuid_str, parts_size, buffer);
++				else
++					ret = -ENODATA;
++			}
++		}
++
++		return ret;
++	}
++
++	/* partition(s) found */
++	if (!fill_data)
++		*parts_size = parts_found;
++
++	return 0;
++}
++
++/**
++ * ffa_cache_partitions_info - Queries and saves all secure partitions data
++ *
++ * This is a boot time function that invokes FFA_PARTITION_INFO_GET FF-A
++ * function to query from secure world all partitions information.
++ *
++ * The FFA_PARTITION_INFO_GET call is issued with nil UUID as an argument.
++ * All installed partitions information are returned. We cache them in the
++ * resident private data structure and we keep the UUID field empty
++ * (in FF-A 1.0 UUID is not provided by the partition descriptor)
++ *
++ * This function is called at the device probing level.
++ * ffa_cache_partitions_info uses ffa_query_partitions_info to get the data
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_cache_partitions_info(void)
++{
++	return ffa_query_partitions_info(NULL, NULL);
++}
++
++/**
++ * ffa_msg_send_direct_req - FFA_MSG_SEND_DIRECT_{REQ,RESP} handler function
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out)
++ *
++ * This is the runtime function that implements FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * FF-A functions.
++ *
++ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure partition.
++ * The response from the secure partition is handled by reading the
++ * FFA_MSG_SEND_DIRECT_RESP arguments.
++ *
++ * The maximum size of the data that can be exchanged is 40 bytes which is
++ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specification 1.0
++ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int __ffa_runtime ffa_msg_send_direct_req(u16 dst_part_id, struct ffa_send_direct_data *msg)
++{
++	ffa_value_t res = {0};
++	int ffa_errno;
++
++	if (!ffa_priv_data || !ffa_priv_data->invoke_ffa_fn)
++		return -EINVAL;
++
++	/* No partition installed */
++	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.descs)
++		return -ENODEV;
++
++	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ),
++			.a1 = PREP_SELF_ENDPOINT_ID(ffa_priv_data->id) |
++				PREP_PART_ENDPOINT_ID(dst_part_id),
++			.a2 = 0,
++			.a3 = msg->data0,
++			.a4 = msg->data1,
++			.a5 = msg->data2,
++			.a6 = msg->data3,
++			.a7 = msg->data4,
++			}, &res);
++
++	while (res.a0 == FFA_SMC_32(FFA_INTERRUPT))
++		ffa_priv_data->invoke_ffa_fn((ffa_value_t){
++			.a0 = FFA_SMC_32(FFA_RUN),
++			.a1 = res.a1, .a2 = 0, .a3 = 0, .a4 = 0, .a5 = 0, .a6 = 0, .a7 = 0,
++			}, &res);
++
++	if (res.a0 == FFA_SMC_32(FFA_SUCCESS)) {
++		/* Message sent with no response */
++		return 0;
++	}
++
++	if (res.a0 == FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP)) {
++		/*
++		 * Message sent with response
++		 * extract the return data
++		 */
++		msg->data0 = res.a3;
++		msg->data1 = res.a4;
++		msg->data2 = res.a5;
++		msg->data3 = res.a6;
++		msg->data4 = res.a7;
++
++		return 0;
++	}
++
++	ffa_errno = (int)res.a2;
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * __arm_ffa_fn_smc - SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res: FF-A ABI return data to be copied from Xn registers
++ *
++ * Calls low level SMC assembly function
++ *
++ * Return: void
++ */
++void __ffa_runtime __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
++{
++	arm_smccc_1_2_smc(&args, res);
++}
++
++/**
++ * ffa_set_smc_conduit - Set the SMC conduit
++ *
++ * This boot time function selects the SMC conduit by setting the driver invoke function
++ * to SMC assembly function
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_set_smc_conduit(void)
++{
++	ffa_priv_data->invoke_ffa_fn = __arm_ffa_fn_smc;
++
++	if (!ffa_priv_data->invoke_ffa_fn) {
++		ffa_err("failure to set the invoke function");
++		return -EINVAL;
++	}
++
++	ffa_info("Conduit is SMC");
++
++	return 0;
++}
++
++/**
++ * ffa_set_bus_ops - Set the bus driver operations
++ *
++ * Setting the driver callbacks.
++ *
++ */
++static void ffa_set_bus_ops(void)
++{
++	ffa_priv_data->ffa_ops.partition_info_get = ffa_get_partitions_info;
++	ffa_priv_data->ffa_ops.sync_send_receive = ffa_msg_send_direct_req;
++	ffa_priv_data->ffa_ops.rxtx_unmap = ffa_unmap_rxtx_buffers;
++}
++
++/**
++ * ffa_alloc_prvdata - allocate the driver main data structure and sets the device
++ * @dev:	the arm_ffa device
++ *
++ * This boot time function creates the main data structure embedding all the driver data.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_alloc_prvdata(struct udevice *dev)
++{
++	if (!dev) {
++		ffa_err("no udevice found");
++		return -ENODEV;
++	}
++
++	/* The device is registered with the DM. Let's create the driver main data structure*/
++
++	ffa_priv_data = devm_kmalloc(dev, sizeof(struct ffa_prvdata), __GFP_ZERO);
++	if (!ffa_priv_data) {
++		ffa_err("can not allocate the driver main data structure");
++		return -ENOMEM;
++	}
++
++	ffa_priv_data->dev = dev;
++
++	return 0;
++}
++
++/**
++ * ffa_probe - The driver probe function
++ * @dev:	the arm_ffa device
++ *
++ * Probing is done at boot time and triggered by the uclass device discovery.
++ * At probe level the following actions are done:
++ *	- setting the conduit
++ *	- querying the FF-A framework version
++ *	- querying from secure world the u-boot endpoint ID
++ *	- querying from secure world the supported features of FFA_RXTX_MAP
++ *	- mapping the RX/TX buffers
++ *	- querying from secure world all the partitions information
++ *
++ * All data queried from secure world is saved in the resident private data structure.
++ *
++ * The probe will fail if either FF-A framework is not detected or the
++ * FF-A requests are not behaving correctly. This ensures that the
++ * driver is not installed and its operations are not exported to the clients.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_probe(struct udevice *dev)
++{
++	int ret;
++
++	ret = ffa_alloc_prvdata(dev);
++	if (ret != 0)
++		return ret;
++
++	ffa_set_bus_ops();
++
++	ret = ffa_set_smc_conduit();
++	if (ret != 0)
++		return ret;
++
++	ret = ffa_get_version();
++	if (ret != 0)
++		return ret;
++
++	ret = ffa_get_endpoint_id();
++	if (ret != 0)
++		return ret;
++
++	ret = ffa_get_rxtx_map_features();
++	if (ret != 0)
++		return ret;
++
++	ret = ffa_map_rxtx_buffers();
++	if (ret != 0)
++		return ret;
++
++	ret = ffa_cache_partitions_info();
++	if (ret != 0) {
++		ffa_free_rxtx_buffers();
++		return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * ffa_remove - The driver remove function
++ * @dev:	the arm_ffa device
++ * When the device is about to be removed ,  unmap the RX/TX buffers and free the memory
++ * Return:
++ *
++ * 0 on success.
++ */
++static int ffa_remove(struct udevice *dev)
++{
++	ffa_info("removing the device");
++
++	ffa_unmap_rxtx_buffers();
++
++	if (ffa_priv_data->pair.rxbuf || ffa_priv_data->pair.txbuf)
++		ffa_free_rxtx_buffers();
++
++	return 0;
++}
++
++/**
++ * ffa_unbind - The driver unbind function
++ * @dev:	the arm_ffa device
++ * After the device is removed and memory freed the device is unbound
++ * Return:
++ *
++ * 0 on success.
++ */
++static int ffa_unbind(struct udevice *dev)
++{
++	ffa_info("unbinding the device , private data already released");
++
++	ffa_priv_data = NULL;
++
++	return 0;
++}
++
++/**
++ * ffa_bus_ops_get - bus driver operations getter
++ *
++ * Return:
++ * This runtime function returns a pointer to the driver operations structure
++ */
++const struct ffa_bus_ops * __ffa_runtime ffa_bus_ops_get(void)
++{
++	return &ffa_priv_data->ffa_ops;
++}
++
++/**
++ * ffa_bus_prvdata_get - bus driver private data getter
++ *
++ * Return:
++ * This boot time function returns a pointer to the main private data structure
++ */
++struct ffa_prvdata **ffa_bus_prvdata_get(void)
++{
++	return &ffa_priv_data;
++}
++
++/**
++ * ffa_bus_discover - discover FF-A bus and probe the arm_ffa device
++ *
++ * This boot time function makes sure the FF-A bus is discoverable.
++ * Then, the arm_ffa device is probed and ready to use.
++ * This function is called automatically at initcalls
++ * level (after u-boot relocation).
++ *
++ * When the bus was already discovered successfully the discovery will not run again.
++ *
++ * Arm FF-A transport is implemented through arm_ffa u-boot device managing the FF-A
++ * communication.
++ * All FF-A clients should use the arm_ffa device to use the FF-A transport.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_bus_discover(void)
++{
++	int ret = 0;
++
++	if (!ffa_priv_data)
++		ret = ffa_device_get();
++
++	return ret;
++}
++
++/**
++ * Declaring the arm_ffa driver under UCLASS_FFA
++ */
++
++U_BOOT_DRIVER(arm_ffa) = {
++	.name		= FFA_DRV_NAME,
++	.id		= UCLASS_FFA,
++	.probe		= ffa_probe,
++	.remove		= ffa_remove,
++	.unbind		= ffa_unbind,
++};
+diff --git a/drivers/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c b/drivers/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c
+new file mode 100644
+index 0000000000..c76cf2147b
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c
+@@ -0,0 +1,94 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include "arm_ffa_prv.h"
++
++/**
++ * ffa_copy_runtime_data - copy the private data structure  to the runtime area
++ *
++ * This boot time function copies the arm_ffa driver data structures including
++ *  partitions data to the EFI runtime data section.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++efi_status_t ffa_copy_runtime_data(void)
++{
++	efi_status_t efi_ret;
++	efi_uintn_t prvdata_pages;
++	efi_uintn_t descs_pages;
++	struct ffa_prvdata **prvdata = NULL; /* Pointer to the current structure */
++	struct ffa_prvdata *runtime_prvdata = NULL; /* Pointer to the structure runtime copy */
++	u64 runtime_descs = 0;
++
++	prvdata = ffa_bus_prvdata_get();
++
++	printf("INFO: EFI: FFA: prv data area at 0x%llx\n", (u64)prvdata);
++
++	/* allocate private data runtime area */
++
++	prvdata_pages = efi_size_in_pages(sizeof(struct ffa_prvdata));
++	efi_ret = efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
++				     EFI_RUNTIME_SERVICES_DATA,
++				     prvdata_pages,
++				     (u64 *)&runtime_prvdata);
++
++	if (efi_ret != EFI_SUCCESS) {
++		printf("ERROR: EFI: FFA: allocating runtime data (err: 0x%lx, addr 0x%llx)\n",
++		       efi_ret, (u64)runtime_prvdata);
++
++		return efi_ret;
++	}
++
++	printf("INFO: EFI: FFA: runtime data area at 0x%llx\n", (u64)runtime_prvdata);
++
++	if (!runtime_prvdata)
++		return EFI_INVALID_PARAMETER;
++
++	/* allocate the partition data runtime area */
++
++	descs_pages = efi_size_in_pages((*prvdata)->partitions.count *
++					sizeof(struct ffa_partition_desc));
++	efi_ret = efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
++				     EFI_RUNTIME_SERVICES_DATA,
++				     descs_pages,
++				     &runtime_descs);
++
++	if (efi_ret != EFI_SUCCESS) {
++		printf("ERROR: EFI: FFA: allocating runtime SPs data (err: 0x%lx, addr 0x%llx)\n",
++		       efi_ret, runtime_descs);
++
++		efi_free_pages((u64)runtime_prvdata, prvdata_pages);
++
++		return efi_ret;
++	}
++
++	printf("INFO: EFI: FFA: SPs runtime area at 0x%llx\n", (u64)runtime_descs);
++
++	if (!runtime_descs)
++		return EFI_INVALID_PARAMETER;
++
++	*runtime_prvdata = **prvdata;
++
++	runtime_prvdata->dev = NULL;
++	runtime_prvdata->ffa_ops.partition_info_get = NULL;
++	runtime_prvdata->ffa_ops.rxtx_unmap = NULL;
++	runtime_prvdata->partitions.descs = (struct ffa_partition_desc *)runtime_descs;
++	runtime_prvdata->pair.rxbuf = 0;
++	runtime_prvdata->pair.txbuf = 0;
++
++	/*
++	 * Update the private data structure pointer in the driver
++	 * no need to free the old structure. devm takes care of that
++	 */
++	*prvdata = runtime_prvdata;
++
++	printf("INFO: EFI: FFA: runtime prv data now at 0x%llx , SPs count %d\n",
++	       (u64)*prvdata, (*prvdata)->partitions.count);
++
++	return 0;
++}
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+new file mode 100644
+index 0000000000..f17b100497
+--- /dev/null
++++ b/include/arm_ffa.h
+@@ -0,0 +1,127 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_H
++#define __ARM_FFA_H
++
++#include <linux/printk.h>
++
++/*
++ * This header is public. It can be used by clients to access
++ * data structures and definitions they need
++ */
++
++/*
++ * Macros for displaying logs
++ */
++
++#define ffa_info(fmt, ...)  pr_info("[FFA] " fmt "\n", ##__VA_ARGS__)
++#define ffa_err(fmt, ...)  pr_err("[FFA] " fmt "\n", ##__VA_ARGS__)
++
++/*
++ * struct ffa_partition_info - Partition information descriptor
++ * @id:	Partition ID
++ * @exec_ctxt:	Execution context count
++ * @properties:	Partition properties
++ *
++ * Data structure containing information about partitions instantiated in the system
++ * This structure is filled with the data queried by FFA_PARTITION_INFO_GET
++ */
++struct  __packed ffa_partition_info {
++	u16 id;
++	u16 exec_ctxt;
++/* partition supports receipt of direct requests */
++#define FFA_PARTITION_DIRECT_RECV	BIT(0)
++/* partition can send direct requests. */
++#define FFA_PARTITION_DIRECT_SEND	BIT(1)
++/* partition can send and receive indirect messages. */
++#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
++	u32 properties;
++};
++
++/*
++ * struct ffa_send_direct_data - Data structure hosting the data
++ *                                       used by FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * @data0-4:	Data read/written from/to x3-x7 registers
++ *
++ * Data structure containing the data to be sent by FFA_MSG_SEND_DIRECT_REQ
++ * or read from FFA_MSG_SEND_DIRECT_RESP
++ */
++
++/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
++struct __packed ffa_send_direct_data {
++	unsigned long data0; /* w3/x3 */
++	unsigned long data1; /* w4/x4 */
++	unsigned long data2; /* w5/x5 */
++	unsigned long data3; /* w6/x6 */
++	unsigned long data4; /* w7/x7 */
++};
++
++#if CONFIG_IS_ENABLED(ARM_FFA_EFI_RUNTIME_MODE)
++
++#include <efi_loader.h>
++
++/*
++ *  __ffa_runtime - controls whether functions are
++ * available after calling the EFI ExitBootServices service.
++ * Functions tagged with these keywords are resident (available at boot time and
++ * at runtime)
++ */
++
++#define __ffa_runtime_data __efi_runtime_data
++#define __ffa_runtime __efi_runtime
++
++#else
++
++/*
++ *  The FF-A driver is independent from EFI
++ */
++
++#define __ffa_runtime_data
++#define __ffa_runtime
++
++#endif
++
++/**
++ * struct ffa_bus_ops - The driver operations structure
++ * @partition_info_get:	callback for the FFA_PARTITION_INFO_GET
++ * @sync_send_receive:	callback for the FFA_MSG_SEND_DIRECT_REQ
++ * @rxtx_unmap:	callback for the FFA_RXTX_UNMAP
++ *
++ * The data structure providing all the operations supported by the driver.
++ * This structure is EFI runtime resident.
++ */
++struct ffa_bus_ops {
++	int (*partition_info_get)(const char *uuid_str,
++				  u32 *parts_size, struct ffa_partition_info *buffer);
++	int (*sync_send_receive)(u16 dst_part_id, struct ffa_send_direct_data *msg);
++	int (*rxtx_unmap)(void);
++};
++
++/**
++ * The device driver and the Uclass driver public functions
++ */
++
++/**
++ * ffa_bus_ops_get - driver operations getter
++ */
++const struct ffa_bus_ops * __ffa_runtime ffa_bus_ops_get(void);
++
++/**
++ * ffa_bus_discover - discover FF-A bus and probes the arm_ffa device
++ */
++int ffa_bus_discover(void);
++
++#if CONFIG_IS_ENABLED(ARM_FFA_EFI_RUNTIME_MODE)
++
++/**
++ * ffa_copy_runtime_data - copy the private data structure and the SPs data to the runtime area
++ */
++efi_status_t ffa_copy_runtime_data(void);
++
++#endif
++
++#endif
+diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
+index 3ba69ad9a0..7324418245 100644
+--- a/include/dm/uclass-id.h
++++ b/include/dm/uclass-id.h
+@@ -55,6 +55,7 @@ enum uclass_id {
+ 	UCLASS_EFI_MEDIA,	/* Devices provided by UEFI firmware */
+ 	UCLASS_ETH,		/* Ethernet device */
+ 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
++	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
+ 	UCLASS_FIRMWARE,	/* Firmware */
+ 	UCLASS_FS_FIRMWARE_LOADER,		/* Generic loader */
+ 	UCLASS_GPIO,		/* Bank of general-purpose I/O pins */
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
+index 4da64b5d29..0ec002ac8b 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -23,6 +23,10 @@
+ #include <asm/setjmp.h>
+ #include <linux/libfdt_env.h>
+ 
++#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
++#include <arm_ffa.h>
++#endif
++
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+ /* Task priority level */
+@@ -2173,6 +2177,14 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
+ 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
+ 	}
+ 
++#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
++		/* unmap FF-A RX/TX buffers */
++		if (ffa_bus_ops_get()->rxtx_unmap())
++			debug("[efi_boottime][ERROR]: can not unmap FF-A RX/TX buffers\n");
++		else
++			debug("[efi_boottime][INFO]: FF-A RX/TX buffers unmapped\n");
++#endif
++
+ 	/* Patch out unsupported runtime function */
+ 	efi_runtime_detach();
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
deleted file mode 100644
index ae4bb02f..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 6f998a5e94e2562b5876b88864876c8b03b88f5a Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 16 Nov 2021 12:38:48 +0000
-Subject: [PATCH 09/24] arm_ffa: introducing test module for UCLASS_FFA
-
-This is the test module for the UCLASS_FFA class.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- MAINTAINERS      |  1 +
- test/dm/Makefile |  1 +
- test/dm/ffa.c    | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
- test/dm/ffa.h    | 19 ++++++++++++++++
- 4 files changed, 77 insertions(+)
- create mode 100644 test/dm/ffa.c
- create mode 100644 test/dm/ffa.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 32fc267fcf13..8209dc9319f1 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -252,6 +252,7 @@ F:	drivers/arm-ffa/
- F:	include/arm_ffa.h
- F:	include/arm_ffa_helper.h
- F:	lib/arm-ffa/
-+F:	test/dm/ffa.c
- 
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
-diff --git a/test/dm/Makefile b/test/dm/Makefile
-index f0a7c97e3d17..09a3403d2f53 100644
---- a/test/dm/Makefile
-+++ b/test/dm/Makefile
-@@ -79,6 +79,7 @@ obj-$(CONFIG_POWER_DOMAIN) += power-domain.o
- obj-$(CONFIG_ACPI_PMC) += pmc.o
- obj-$(CONFIG_DM_PMIC) += pmic.o
- obj-$(CONFIG_DM_PWM) += pwm.o
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) += ffa.o
- obj-$(CONFIG_QFW) += qfw.o
- obj-$(CONFIG_RAM) += ram.o
- obj-y += regmap.o
-diff --git a/test/dm/ffa.c b/test/dm/ffa.c
-new file mode 100644
-index 000000000000..b937cea57b80
---- /dev/null
-+++ b/test/dm/ffa.c
-@@ -0,0 +1,56 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Test for UCLASS_FFA  class
-+ *
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/test.h>
-+#include <test/test.h>
-+#include <test/ut.h>
-+#include <arm_ffa_helper.h>
-+#include "ffa.h"
-+
-+/* Basic test of 'armffa' command */
-+static int dm_test_armffa_cmd(struct unit_test_state *uts)
-+{
-+	ut_assertok(ffa_helper_init_device());
-+
-+	ut_assertok(console_record_reset_enable());
-+
-+	/* armffa getpart <UUID> */
-+	ut_assertok(run_command("armffa getpart " SE_PROXY_PARTITION_UUID, 0));
-+	ut_assert_console_end();
-+
-+	/* armffa ping <ID> */
-+	ut_assertok(run_command("armffa ping " SE_PROXY_PARTITION_ID, 0));
-+	ut_assert_console_end();
-+
-+	/* armffa devlist */
-+	ut_assertok(run_command("armffa devlist", 0));
-+	ut_assert_console_end();
-+
-+	return 0;
-+}
-+
-+DM_TEST(dm_test_armffa_cmd, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
-+
-+static int  test_ffa_msg_send_direct_req(void)
-+{
-+	char *const argv[1] = {SE_PROXY_PARTITION_ID}; /* Corstone1000 SE Proxy ID */
-+
-+	return do_ffa_msg_send_direct_req(NULL, 0, 1, argv);
-+}
-+
-+/* Basic test of the FFA uclass */
-+static int dm_test_ffa_uclass(struct unit_test_state *uts)
-+{
-+	ut_assertok(ffa_init_device());
-+	ut_assertok(test_ffa_msg_send_direct_req());
-+	return 0;
-+}
-+
-+DM_TEST(dm_test_ffa_uclass, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-diff --git a/test/dm/ffa.h b/test/dm/ffa.h
-new file mode 100644
-index 000000000000..a0802bd6928a
---- /dev/null
-+++ b/test/dm/ffa.h
-@@ -0,0 +1,19 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2021 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __TEST_DM_FFA_H
-+#define __TEST_DM_FFA_H
-+
-+#define SE_PROXY_PARTITION_ID "0x8002"
-+#define SE_PROXY_PARTITION_UUID "46bb39d1-b4d9-45b5-88ff-040027dab249"
-+
-+/**
-+ * do_ffa_msg_send_direct_req - implementation of the ping subcommand
-+ */
-+int  do_ffa_msg_send_direct_req(struct cmd_tbl *cmdtp, int flag, int argc,
-+				char *const argv[]);
-+
-+#endif /*__TEST_DM_FFA_H */
--- 
-2.37.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-introduce-armffa-command.patch
similarity index 72%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-introduce-armffa-command.patch
index 582bc3e5..f52f88dd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-introduce-armffa-command.patch
@@ -1,26 +1,48 @@
-From 58358f79d9f8abbdc8bcfc7d08bd0c7c4c90ec84 Mon Sep 17 00:00:00 2001
+From a09ed2542f4d991fef61bd51f87d373f44ad1ff3 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 16 Nov 2021 12:36:27 +0000
-Subject: [PATCH 07/24] arm_ffa: introducing armffa command
+Date: Mon, 6 Jun 2022 12:46:38 +0100
+Subject: [PATCH 10/26] arm_ffa: introduce armffa command
 
-A new armffa command is provided as an example of how to use
-the FF-A helper functions to communicate with secure world.
+Provide armffa command showcasing the use of the FF-A driver
 
 The armffa command allows to query secure partitions data from
 the secure world and exchanging messages with the partitions.
 
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
 ---
- MAINTAINERS  |   1 +
- cmd/Kconfig  |  10 ++
- cmd/Makefile |   2 +
- cmd/armffa.c | 266 +++++++++++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 279 insertions(+)
+
+Changelog:
+===============
+
+v4:
+
+* remove pattern data in do_ffa_msg_send_direct_req
+
+v3:
+
+* use the new driver interfaces (partition_info_get, sync_send_receive)
+  in armffa command
+
+v2:
+
+* replace use of ffa_helper_init_device function by
+ ffa_helper_bus_discover
+
+v1:
+
+* introduce armffa command
+
+ MAINTAINERS                      |   1 +
+ cmd/Kconfig                      |  10 ++
+ cmd/Makefile                     |   2 +
+ cmd/armffa.c                     | 242 +++++++++++++++++++++++++++++++
+ drivers/firmware/arm-ffa/Kconfig |   1 +
+ 5 files changed, 256 insertions(+)
  create mode 100644 cmd/armffa.c
 
 diff --git a/MAINTAINERS b/MAINTAINERS
-index d29d7e040764..32fc267fcf13 100644
+index e760b4ca3a..9f0a1b7387 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
 @@ -247,6 +247,7 @@ F:	include/configs/turris_*.h
@@ -28,11 +50,11 @@ index d29d7e040764..32fc267fcf13 100644
  M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
  S:	Maintained
 +F:	cmd/armffa.c
- F:	drivers/arm-ffa/
+ F:	doc/README.ffa.drv
+ F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
- F:	include/arm_ffa_helper.h
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index ba2f321ae989..090e668125d5 100644
+index ba2f321ae9..090e668125 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
 @@ -873,6 +873,16 @@ endmenu
@@ -53,7 +75,7 @@ index ba2f321ae989..090e668125d5 100644
  	#depends on FLASH_CFI_DRIVER
  	bool "armflash"
 diff --git a/cmd/Makefile b/cmd/Makefile
-index 5e43a1e022e8..e40f52f1e416 100644
+index 5e43a1e022..e40f52f1e4 100644
 --- a/cmd/Makefile
 +++ b/cmd/Makefile
 @@ -12,6 +12,8 @@ obj-y += panic.o
@@ -67,17 +89,17 @@ index 5e43a1e022e8..e40f52f1e416 100644
  obj-$(CONFIG_CMD_AES) += aes.o
 diff --git a/cmd/armffa.c b/cmd/armffa.c
 new file mode 100644
-index 000000000000..71a6ebb656d1
+index 0000000000..9b56e8a830
 --- /dev/null
 +++ b/cmd/armffa.c
-@@ -0,0 +1,266 @@
+@@ -0,0 +1,242 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
-+ * (C) Copyright 2021 ARM Limited
++ * (C) Copyright 2022 ARM Limited
 + * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 + */
 +
-+#include <arm_ffa_helper.h>
++#include <arm_ffa.h>
 +#include <asm/io.h>
 +#include <common.h>
 +#include <command.h>
@@ -93,7 +115,7 @@ index 000000000000..71a6ebb656d1
 + * @argv:		arguments
 + *
 + * This function queries the secure partition information which the UUID is provided
-+ * as an argument. The function uses the arm_ffa driver helper function
++ * as an argument. The function uses the arm_ffa driver partition_info_get operation
 + * to retrieve the data.
 + * The input UUID string is expected to be in big endian format.
 + *
@@ -104,31 +126,17 @@ index 000000000000..71a6ebb656d1
 +static int do_ffa_get_singular_partition_info(struct cmd_tbl *cmdtp, int flag, int argc,
 +					      char *const argv[])
 +{
-+	struct ffa_interface_data func_data = {0};
-+	u32 count = 0;
++	u32 count = 0, size = 0;
 +	int ret;
-+	union ffa_partition_uuid service_uuid = {0};
 +	struct ffa_partition_info *parts_info;
 +	u32 info_idx;
 +
 +	if (argc != 1)
 +		return -EINVAL;
 +
-+	if (ffa_uuid_str_to_bin(argv[0], (unsigned char *)&service_uuid)) {
-+		ffa_err("Invalid UUID");
-+		return -EINVAL;
-+	}
-+
-+	/*
-+	 * get from the driver the count of the SPs matching the UUID
-+	 */
-+	func_data.data0_size = sizeof(service_uuid);
-+	func_data.data0 = &service_uuid;
-+	func_data.data1_size = sizeof(count);
-+	func_data.data1 = &count;
-+
-+	ret = ffa_helper_get_partitions_info(&func_data);
-+	if (ret != FFA_ERR_STAT_SUCCESS) {
++	/* Mode 1: getting the number of secure partitions */
++	ret = ffa_bus_ops_get()->partition_info_get(argv[0], &count, NULL);
++	if (ret != 0) {
 +		ffa_err("Failure in querying partitions count (error code: %d)", ret);
 +		return ret;
 +	}
@@ -140,23 +148,23 @@ index 000000000000..71a6ebb656d1
 +
 +	/*
 +	 * pre-allocate a buffer to be filled by the driver
-+	 * with	 ffa_partition_info structs
++	 * with ffa_partition_info structs
 +	 */
 +
++	ffa_info("Pre-allocating %d partition(s) info structures", count);
++
 +	parts_info = calloc(count, sizeof(struct ffa_partition_info));
 +	if (!parts_info)
 +		return -EINVAL;
 +
-+	ffa_info("Pre-allocating %d partition(s) info structures", count);
-+
-+	func_data.data1_size = count * sizeof(struct ffa_partition_info);
-+	func_data.data1 = parts_info;
++	size = count * sizeof(struct ffa_partition_info);
 +
 +	/*
 +	 * ask the driver to fill the buffer with the SPs info
 +	 */
-+	ret = ffa_helper_get_partitions_info(&func_data);
-+	if (ret != FFA_ERR_STAT_SUCCESS) {
++
++	ret = ffa_bus_ops_get()->partition_info_get(argv[0], &size, parts_info);
++	if (ret != 0) {
 +		ffa_err("Failure in querying partition(s) info (error code: %d)", ret);
 +		free(parts_info);
 +		return ret;
@@ -185,7 +193,7 @@ index 000000000000..71a6ebb656d1
 + * @argv:		arguments
 + *
 + * This function sends data to the secure partition which the ID is provided
-+ * as an argument. The function uses the arm_ffa driver helper function
++ * as an argument. The function uses the arm_ffa driver sync_send_receive operation
 + * to send data.
 + *
 + * Return:
@@ -195,9 +203,13 @@ index 000000000000..71a6ebb656d1
 +int  do_ffa_msg_send_direct_req(struct cmd_tbl *cmdtp, int flag, int argc,
 +				char *const argv[])
 +{
-+	struct ffa_interface_data func_data = {0};
-+	struct ffa_send_direct_data msg = {0};
-+	u32 pattern = 0xaabbccd0;
++	struct ffa_send_direct_data msg = {
++			.data0 = 0xaaaaaaaa,
++			.data1 = 0xbbbbbbbb,
++			.data2 = 0xcccccccc,
++			.data3 = 0xdddddddd,
++			.data4 = 0xeeeeeeee,
++	};
 +	u16 part_id;
 +	int ret;
 +
@@ -212,32 +224,15 @@ index 000000000000..71a6ebb656d1
 +		return -EINVAL;
 +	}
 +
-+	/*
-+	 * telling the driver which partition to use
-+	 */
-+	func_data.data0_size = sizeof(part_id);
-+	func_data.data0 = &part_id;
-+
-+	/*
-+	 * filling the message data
-+	 */
-+	msg.a3 = ++pattern;
-+	msg.a4 = ++pattern;
-+	msg.a5 = ++pattern;
-+	msg.a6 = ++pattern;
-+	msg.a7 = ++pattern;
-+	func_data.data1_size = sizeof(msg);
-+	func_data.data1 = &msg;
-+
-+	ret = ffa_helper_msg_send_direct_req(&func_data);
-+	if (ret == FFA_ERR_STAT_SUCCESS) {
++	ret = ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	if (ret == 0) {
 +		u8 cnt;
 +
 +		ffa_info("SP response:\n[LSB]");
 +		for (cnt = 0;
-+		     cnt < sizeof(struct ffa_send_direct_data) / sizeof(u32);
++		     cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64);
 +		     cnt++)
-+			ffa_info("0x%x", ((u32 *)&msg)[cnt]);
++			ffa_info("0x%llx", ((u64 *)&msg)[cnt]);
 +	} else {
 +		ffa_err("Sending direct request error (%d)", ret);
 +	}
@@ -320,10 +315,13 @@ index 000000000000..71a6ebb656d1
 +	if (!armffa_cmd || argc > armffa_cmd->maxargs)
 +		return CMD_RET_USAGE;
 +
-+	ret = ffa_helper_init_device();
-+	if (ret != FFA_ERR_STAT_SUCCESS)
++	ret = ffa_bus_discover();
++	if (ret != 0)
 +		return cmd_process_error(cmdtp, ret);
 +
++	if (!ffa_bus_ops_get())
++		return -EINVAL;
++
 +	ret = armffa_cmd->cmd(armffa_cmd, flag, argc, argv);
 +
 +	return cmd_process_error(armffa_cmd, ret);
@@ -337,6 +335,18 @@ index 000000000000..71a6ebb656d1
 +	   "	 - sends a data pattern to the specified partition\n"
 +	   "devlist\n"
 +	   "	 - displays the arm_ffa device info\n");
+diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa/Kconfig
+index aceb61cf49..40b467b0a5 100644
+--- a/drivers/firmware/arm-ffa/Kconfig
++++ b/drivers/firmware/arm-ffa/Kconfig
+@@ -4,6 +4,7 @@ config ARM_FFA_TRANSPORT
+ 	bool "Enable Arm Firmware Framework for Armv8-A driver"
+ 	depends on DM && ARM64
+ 	select ARM_SMCCC
++	select CMD_ARMFFA
+ 	select LIB_UUID
+ 	select DEVRES
+ 	help
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch
new file mode 100644
index 00000000..739f7810
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch
@@ -0,0 +1,1185 @@
+From 553b57e39808ef04bc6aa54e0324f92b0175e476 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 6 Jun 2022 12:55:08 +0100
+Subject: [PATCH 11/26] arm_ffa: introduce the FF-A Sandbox driver
+
+Provide a Sandbox driver to emulate the FF-A ABIs
+
+The emulated ABIs are those supported by the FF-A core driver
+and according to FF-A specification v1.0.
+
+The Sandbox driver provides operations allowing the test
+application to read the status of all the inspected ABIs
+and perform functional tests based on that.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+---
+
+Changelog:
+===============
+
+v4: align sandbox driver with the new FF-A driver interfaces
+ and new way of error handling
+
+v1: introduce the sandbox driver
+
+ MAINTAINERS                                   |   1 +
+ common/board_r.c                              |   2 +-
+ configs/sandbox64_defconfig                   |   2 +
+ configs/sandbox_defconfig                     |   2 +
+ doc/arch/sandbox.rst                          |   1 +
+ drivers/firmware/arm-ffa/Kconfig              |  10 +-
+ drivers/firmware/arm-ffa/Makefile             |   1 +
+ drivers/firmware/arm-ffa/arm_ffa_prv.h        |  15 +-
+ drivers/firmware/arm-ffa/core.c               |  24 +-
+ drivers/firmware/arm-ffa/sandbox.c            | 659 ++++++++++++++++++
+ .../firmware/arm-ffa/sandbox_arm_ffa_prv.h    | 144 ++++
+ include/arm_ffa.h                             |   2 +-
+ include/sandbox_arm_ffa.h                     |  91 +++
+ lib/efi_loader/efi_boottime.c                 |   2 +-
+ 14 files changed, 941 insertions(+), 15 deletions(-)
+ create mode 100644 drivers/firmware/arm-ffa/sandbox.c
+ create mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
+ create mode 100644 include/sandbox_arm_ffa.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 9f0a1b7387..96157db6b6 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -251,6 +251,7 @@ F:	cmd/armffa.c
+ F:	doc/README.ffa.drv
+ F:	drivers/firmware/arm-ffa/
+ F:	include/arm_ffa.h
++F:	include/sandbox_arm_ffa.h
+ 
+ ARM FREESCALE IMX
+ M:	Stefano Babic <sbabic@denx.de>
+diff --git a/common/board_r.c b/common/board_r.c
+index c75634286b..f838cd5958 100644
+--- a/common/board_r.c
++++ b/common/board_r.c
+@@ -783,7 +783,7 @@ static init_fnc_t init_sequence_r[] = {
+ 	INIT_FUNC_WATCHDOG_RESET
+ 	initr_net,
+ #endif
+-#ifdef CONFIG_ARM_FFA_TRANSPORT
++#if defined(CONFIG_ARM_FFA_TRANSPORT) && !defined(CONFIG_SANDBOX_FFA)
+ 	ffa_bus_discover,
+ #endif
+ #ifdef CONFIG_POST
+diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
+index d7f22b39ae..78bc5aaa96 100644
+--- a/configs/sandbox64_defconfig
++++ b/configs/sandbox64_defconfig
+@@ -250,3 +250,5 @@ CONFIG_TEST_FDTDEC=y
+ CONFIG_UNIT_TEST=y
+ CONFIG_UT_TIME=y
+ CONFIG_UT_DM=y
++CONFIG_ARM_FFA_TRANSPORT=y
++CONFIG_SANDBOX_FFA=y
+\ No newline at end of file
+diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
+index c509a924e6..8942aa7157 100644
+--- a/configs/sandbox_defconfig
++++ b/configs/sandbox_defconfig
+@@ -327,3 +327,5 @@ CONFIG_TEST_FDTDEC=y
+ CONFIG_UNIT_TEST=y
+ CONFIG_UT_TIME=y
+ CONFIG_UT_DM=y
++CONFIG_ARM_FFA_TRANSPORT=y
++CONFIG_SANDBOX_FFA=y
+\ No newline at end of file
+diff --git a/doc/arch/sandbox.rst b/doc/arch/sandbox.rst
+index 068d4a3be4..5d7e1b2c48 100644
+--- a/doc/arch/sandbox.rst
++++ b/doc/arch/sandbox.rst
+@@ -203,6 +203,7 @@ Supported Drivers
+ 
+ U-Boot sandbox supports these emulations:
+ 
++- Arm FF-A
+ - Block devices
+ - Chrome OS EC
+ - GPIO
+diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa/Kconfig
+index 40b467b0a5..263481de96 100644
+--- a/drivers/firmware/arm-ffa/Kconfig
++++ b/drivers/firmware/arm-ffa/Kconfig
+@@ -2,8 +2,8 @@
+ 
+ config ARM_FFA_TRANSPORT
+ 	bool "Enable Arm Firmware Framework for Armv8-A driver"
+-	depends on DM && ARM64
+-	select ARM_SMCCC
++	depends on DM && (ARM64 || SANDBOX)
++	select ARM_SMCCC if !SANDBOX
+ 	select CMD_ARMFFA
+ 	select LIB_UUID
+ 	select DEVRES
+@@ -38,3 +38,9 @@ config ARM_FFA_EFI_RUNTIME_MODE
+ 	  The driver Code needed at runtime is placed at EFI runtime code section.
+ 	  Turning this on makes ffa_copy_runtime_data available for use and the driver
+ 	  code placed at EFI runtime code section.
++
++config SANDBOX_FFA
++	bool "FF-A Sandbox driver"
++	depends on ARM_FFA_TRANSPORT && SANDBOX
++	help
++	  This emulates the FF-A handling under Sandbox and allows to test the FF-A driver
+diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ffa/Makefile
+index 0b9b0a61b4..d50060b836 100644
+--- a/drivers/firmware/arm-ffa/Makefile
++++ b/drivers/firmware/arm-ffa/Makefile
+@@ -5,3 +5,4 @@
+ 
+ obj-y += arm-ffa-uclass.o core.o
+ obj-$(CONFIG_ARM_FFA_EFI_RUNTIME_MODE) += efi_ffa_runtime_data_mgr.o
++obj-$(CONFIG_SANDBOX_FFA) += sandbox.o
+diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/arm-ffa/arm_ffa_prv.h
+index 7bc90f7f66..3e0d4c112c 100644
+--- a/drivers/firmware/arm-ffa/arm_ffa_prv.h
++++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
+@@ -19,6 +19,16 @@
+ /* FF-A core driver name */
+ #define FFA_DRV_NAME "arm_ffa"
+ 
++/* The FF-A SMC function definitions */
++
++#if CONFIG_IS_ENABLED(SANDBOX_FFA)
++#include "sandbox_arm_ffa.h"
++#else
++typedef struct arm_smccc_1_2_regs ffa_value_t;
++#endif
++
++typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
++
+ /* FF-A driver version definitions */
+ 
+ #define MAJOR_VERSION_MASK		GENMASK(30, 16)
+@@ -94,11 +104,6 @@ struct ffa_abi_errmap {
+ #define FFA_ERRMAP_COUNT (FFA_LAST_ID - FFA_FIRST_ID + 1)
+ #define FFA_ID_TO_ERRMAP_ID(ffa_id) ((ffa_id) - FFA_FIRST_ID)
+ 
+-/* The FF-A SMC function definitions */
+-
+-typedef struct arm_smccc_1_2_regs ffa_value_t;
+-typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
+-
+ /*
+  * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITION_INFO_GET
+  * @a1-4:	32-bit words access to the UUID data
+diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/core.c
+index 41c7b96e68..caba10caae 100644
+--- a/drivers/firmware/arm-ffa/core.c
++++ b/drivers/firmware/arm-ffa/core.c
+@@ -1101,6 +1101,7 @@ static int __ffa_runtime ffa_msg_send_direct_req(u16 dst_part_id, struct ffa_sen
+ 	return ffa_to_std_errno(ffa_errno);
+ }
+ 
++#if !CONFIG_IS_ENABLED(SANDBOX_FFA)
+ /**
+  * __arm_ffa_fn_smc - SMC wrapper
+  * @args: FF-A ABI arguments to be copied to Xn registers
+@@ -1114,6 +1115,7 @@ void __ffa_runtime __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
+ {
+ 	arm_smccc_1_2_smc(&args, res);
+ }
++#endif
+ 
+ /**
+  * ffa_set_smc_conduit - Set the SMC conduit
+@@ -1127,7 +1129,12 @@ void __ffa_runtime __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
+  */
+ static int ffa_set_smc_conduit(void)
+ {
+-	ffa_priv_data->invoke_ffa_fn = __arm_ffa_fn_smc;
++#if CONFIG_IS_ENABLED(SANDBOX_FFA)
++		ffa_priv_data->invoke_ffa_fn = sandbox_arm_ffa_smccc_smc;
++		ffa_info("Using SMC emulation");
++#else
++		ffa_priv_data->invoke_ffa_fn = __arm_ffa_fn_smc;
++#endif
+ 
+ 	if (!ffa_priv_data->invoke_ffa_fn) {
+ 		ffa_err("failure to set the invoke function");
+@@ -1304,17 +1311,18 @@ struct ffa_prvdata **ffa_bus_prvdata_get(void)
+ }
+ 
+ /**
+- * ffa_bus_discover - discover FF-A bus and probe the arm_ffa device
++ * ffa_bus_discover - discover FF-A bus and probe arm_ffa and sandbox_arm_ffa devices
+  *
+  * This boot time function makes sure the FF-A bus is discoverable.
+- * Then, the arm_ffa device is probed and ready to use.
++ * Then, the arm_ffa and sandbox_arm_ffa devices are ready to use.
++ *
+  * This function is called automatically at initcalls
+  * level (after u-boot relocation).
+  *
+  * When the bus was already discovered successfully the discovery will not run again.
+  *
+  * Arm FF-A transport is implemented through arm_ffa u-boot device managing the FF-A
+- * communication.
++ * communication. In Sandbox mode sandbox_arm_ffa is used to test arm_ffa driver.
+  * All FF-A clients should use the arm_ffa device to use the FF-A transport.
+  *
+  * Return:
+@@ -1325,9 +1333,15 @@ int ffa_bus_discover(void)
+ {
+ 	int ret = 0;
+ 
+-	if (!ffa_priv_data)
++	if (!ffa_priv_data) {
+ 		ret = ffa_device_get();
+ 
++#if CONFIG_IS_ENABLED(SANDBOX_FFA)
++		if (ret == 0)
++			ret = sandbox_ffa_device_get();
++#endif
++	}
++
+ 	return ret;
+ }
+ 
+diff --git a/drivers/firmware/arm-ffa/sandbox.c b/drivers/firmware/arm-ffa/sandbox.c
+new file mode 100644
+index 0000000000..16e1fdc809
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/sandbox.c
+@@ -0,0 +1,659 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include "sandbox_arm_ffa_prv.h"
++#include <asm/global_data.h>
++#include <common.h>
++#include <dm.h>
++#include <dm/device-internal.h>
++#include <dm/root.h>
++#include <linux/errno.h>
++#include <linux/sizes.h>
++#include <mapmem.h>
++#include <string.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/**
++ * The device private data structure containing all the emulated secure world data
++ */
++static struct sandbox_ffa_prvdata  sandbox_ffa_priv_data = {0};
++
++/* The partitions (SPs) table */
++static struct ffa_partition_desc sandbox_partitions[SANDBOX_PARTITIONS_CNT] = {
++	{
++		.info = { .id = SANDBOX_SP1_ID, .exec_ctxt = 0x5687, .properties = 0x89325621 },
++		.sp_uuid = {
++			.a1 = SANDBOX_SERVICE1_UUID_A1,
++			.a2 = SANDBOX_SERVICE1_UUID_A2,
++			.a3 = SANDBOX_SERVICE1_UUID_A3,
++			.a4 = SANDBOX_SERVICE1_UUID_A4,
++		}
++	},
++	{
++		.info = { .id = SANDBOX_SP2_ID, .exec_ctxt = 0x9587, .properties = 0x45325621 },
++		.sp_uuid = {
++			.a1 = SANDBOX_SERVICE2_UUID_A1,
++			.a2 = SANDBOX_SERVICE2_UUID_A2,
++			.a3 = SANDBOX_SERVICE2_UUID_A3,
++			.a4 = SANDBOX_SERVICE2_UUID_A4,
++		}
++	},
++	{
++		.info = { .id = SANDBOX_SP3_ID, .exec_ctxt = 0x7687, .properties = 0x23325621 },
++		.sp_uuid = {
++			.a1 = SANDBOX_SERVICE1_UUID_A1,
++			.a2 = SANDBOX_SERVICE1_UUID_A2,
++			.a3 = SANDBOX_SERVICE1_UUID_A3,
++			.a4 = SANDBOX_SERVICE1_UUID_A4,
++		}
++	},
++	{
++		.info = { .id = SANDBOX_SP4_ID, .exec_ctxt = 0x1487, .properties = 0x70325621 },
++		.sp_uuid = {
++			.a1 = SANDBOX_SERVICE2_UUID_A1,
++			.a2 = SANDBOX_SERVICE2_UUID_A2,
++			.a3 = SANDBOX_SERVICE2_UUID_A3,
++			.a4 = SANDBOX_SERVICE2_UUID_A4,
++		}
++	}
++
++};
++
++/*
++ * Driver functions
++ */
++
++/**
++ * sandbox_ffa_get_device - probes the sandbox_arm_ffa device
++ *
++ * This function makes sure the sandbox_arm_ffa device is probed
++ * This function makes sure the sandbox_arm_ffa device is
++ * created, bound to this driver, probed and ready to use.
++ *
++ * sandbox_arm_ffa depends on arm_ffa device. This dependency is
++ * handled by ffa_bus_discover function. arm_ffa is probed first then
++ * sandbox_arm_ffa.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int sandbox_ffa_device_get(void)
++{
++	int ret;
++
++	if (sandbox_ffa_priv_data.dev)
++		return 0;
++
++	ret = device_bind(dm_root(),
++			  DM_DRIVER_GET(sandbox_arm_ffa),
++			  FFA_SANDBOX_DRV_NAME,
++			  NULL,
++			  ofnode_null(),
++			  &sandbox_ffa_priv_data.dev);
++	if (ret) {
++		sandbox_ffa_priv_data.dev = NULL;
++		return ret;
++	}
++
++	ret = device_probe(sandbox_ffa_priv_data.dev);
++	if (ret) {
++		ffa_err("[Sandbox] can not probe  the device");
++		device_unbind(sandbox_ffa_priv_data.dev);
++		sandbox_ffa_priv_data.dev = NULL;
++		return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_version - Emulated FFA_VERSION handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_VERSION FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_version)
++{
++	sandbox_ffa_priv_data.fwk_version = FFA_VERSION_1_0;
++	res->a0 = sandbox_ffa_priv_data.fwk_version;
++
++	/* x1-x7 MBZ */
++	memset(FFA_X1X7_MBZ_REG_START, 0, FFA_X1X7_MBZ_CNT * sizeof(unsigned long));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_id_get - Emulated FFA_ID_GET handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_ID_GET FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_id_get)
++{
++	res->a0 = FFA_SMC_32(FFA_SUCCESS);
++	res->a1 = 0;
++
++	sandbox_ffa_priv_data.id = NS_PHYS_ENDPOINT_ID;
++	res->a2 = sandbox_ffa_priv_data.id;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_features - Emulated FFA_FEATURES handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_FEATURES FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_features)
++{
++	if (pargs->a1 == FFA_SMC_64(FFA_RXTX_MAP)) {
++		res->a0 = FFA_SMC_32(FFA_SUCCESS);
++		res->a2 = RXTX_BUFFERS_MIN_SIZE;
++		res->a3 = 0;
++		/* x4-x7 MBZ */
++		memset(FFA_X4X7_MBZ_REG_START,
++		       0, FFA_X4X7_MBZ_CNT * sizeof(unsigned long));
++	} else {
++		res->a0 = FFA_SMC_32(FFA_ERROR);
++		res->a2 = FFA_ERR_STAT_NOT_SUPPORTED;
++		/* x3-x7 MBZ */
++		memset(FFA_X3_MBZ_REG_START,
++		       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
++		ffa_err("[Sandbox] FF-A interface 0x%lx not implemented", pargs->a1);
++	}
++
++	res->a1 = 0;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_partition_info_get - Emulated FFA_PARTITION_INFO_GET handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_PARTITION_INFO_GET FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_partition_info_get)
++{
++	struct ffa_partition_info *rxbuf_desc_info = NULL;
++	u32 descs_cnt;
++	u32 descs_size_bytes;
++
++	res->a0 = FFA_SMC_32(FFA_ERROR);
++
++	if (!sandbox_ffa_priv_data.pair.rxbuf) {
++		res->a2 = FFA_ERR_STAT_DENIED;
++		goto cleanup;
++	}
++
++	if (sandbox_ffa_priv_data.pair_info.rxbuf_owned) {
++		res->a2 = FFA_ERR_STAT_BUSY;
++		goto cleanup;
++	}
++
++	if (!sandbox_ffa_priv_data.partitions.descs) {
++		sandbox_ffa_priv_data.partitions.descs = sandbox_partitions;
++		sandbox_ffa_priv_data.partitions.count = SANDBOX_PARTITIONS_CNT;
++	}
++
++	descs_size_bytes = SANDBOX_PARTITIONS_CNT * sizeof(struct ffa_partition_desc);
++
++	/* Abort if the RX buffer size is smaller than the descriptors buffer size */
++	if ((sandbox_ffa_priv_data.pair_info.rxtx_buf_size * SZ_4K) < descs_size_bytes) {
++		res->a2 = FFA_ERR_STAT_NO_MEMORY;
++		goto cleanup;
++	}
++
++	rxbuf_desc_info = (struct ffa_partition_info *)sandbox_ffa_priv_data.pair.rxbuf;
++
++	/* No UUID specified. Return the information of all partitions */
++	if (!pargs->a1 && !pargs->a2 && !pargs->a3 && !pargs->a4) {
++		for (descs_cnt = 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt++)
++			*(rxbuf_desc_info++) =
++				sandbox_ffa_priv_data.partitions.descs[descs_cnt].info;
++
++		res->a0 = FFA_SMC_32(FFA_SUCCESS);
++		res->a2 = SANDBOX_PARTITIONS_CNT;
++		/* transfer ownership to the consumer: the non secure world */
++		sandbox_ffa_priv_data.pair_info.rxbuf_owned = 1;
++
++		goto cleanup;
++	}
++
++	/*
++	 * A UUID is specified. Return the information of all partitions matching
++	 * the UUID
++	 */
++
++	for (descs_cnt = 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt++)
++		if (pargs->a1 == sandbox_ffa_priv_data.partitions.descs[descs_cnt].sp_uuid.a1 &&
++		    pargs->a2 == sandbox_ffa_priv_data.partitions.descs[descs_cnt].sp_uuid.a2 &&
++		    pargs->a3 == sandbox_ffa_priv_data.partitions.descs[descs_cnt].sp_uuid.a3 &&
++		    pargs->a4 == sandbox_ffa_priv_data.partitions.descs[descs_cnt].sp_uuid.a4) {
++			*(rxbuf_desc_info++) =
++				sandbox_ffa_priv_data.partitions.descs[descs_cnt].info;
++		}
++
++	if (rxbuf_desc_info != ((struct ffa_partition_info *)sandbox_ffa_priv_data.pair.rxbuf)) {
++		res->a0 = FFA_SMC_32(FFA_SUCCESS);
++		/* store the partitions count */
++		res->a2 = (unsigned long)
++			(rxbuf_desc_info - (struct ffa_partition_info *)
++			 sandbox_ffa_priv_data.pair.rxbuf);
++
++		/* transfer ownership to the consumer: the non secure world */
++		sandbox_ffa_priv_data.pair_info.rxbuf_owned = 1;
++	} else {
++		/* Unrecognized UUID */
++		res->a2 = FFA_ERR_STAT_INVALID_PARAMETERS;
++	}
++
++cleanup:
++
++	ffa_err("[Sandbox] FFA_PARTITION_INFO_GET (%ld)", res->a2);
++
++	res->a1 = 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_rxtx_map - Emulated FFA_RXTX_MAP handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_RXTX_MAP FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_rxtx_map)
++{
++	res->a0 = FFA_SMC_32(FFA_ERROR);
++
++	if (sandbox_ffa_priv_data.pair.txbuf && sandbox_ffa_priv_data.pair.rxbuf) {
++		res->a2 = FFA_ERR_STAT_DENIED;
++		goto feedback;
++	}
++
++	if (pargs->a3 >= RXTX_BUFFERS_MIN_PAGES && pargs->a1 && pargs->a2) {
++		sandbox_ffa_priv_data.pair.txbuf = pargs->a1;
++		sandbox_ffa_priv_data.pair.rxbuf = pargs->a2;
++		sandbox_ffa_priv_data.pair_info.rxtx_buf_size = pargs->a3;
++		sandbox_ffa_priv_data.pair_info.rxbuf_mapped = 1;
++		res->a0 = FFA_SMC_32(FFA_SUCCESS);
++		res->a2 = 0;
++		goto feedback;
++	}
++
++	if (!pargs->a1 || !pargs->a2)
++		res->a2 = FFA_ERR_STAT_INVALID_PARAMETERS;
++	else
++		res->a2 = FFA_ERR_STAT_NO_MEMORY;
++
++	ffa_err("[Sandbox] error in FFA_RXTX_MAP arguments (%d)", (int)res->a2);
++
++feedback:
++
++	res->a1 = 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START,
++	       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_rxtx_unmap - Emulated FFA_RXTX_UNMAP handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_RXTX_UNMAP FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_rxtx_unmap)
++{
++	res->a0 = FFA_SMC_32(FFA_ERROR);
++	res->a2 = FFA_ERR_STAT_INVALID_PARAMETERS;
++
++	if (GET_NS_PHYS_ENDPOINT_ID(pargs->a1) != sandbox_ffa_priv_data.id)
++		goto feedback;
++
++	if (sandbox_ffa_priv_data.pair.txbuf && sandbox_ffa_priv_data.pair.rxbuf) {
++		sandbox_ffa_priv_data.pair.txbuf = 0;
++		sandbox_ffa_priv_data.pair.rxbuf = 0;
++		sandbox_ffa_priv_data.pair_info.rxtx_buf_size = 0;
++		sandbox_ffa_priv_data.pair_info.rxbuf_mapped = 0;
++		res->a0 = FFA_SMC_32(FFA_SUCCESS);
++		res->a2 = 0;
++		goto feedback;
++	}
++
++	ffa_err("[Sandbox] No buffer pair registered on behalf of the caller");
++
++feedback:
++
++	res->a1 = 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START,
++	       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_rx_release - Emulated FFA_RX_RELEASE handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_RX_RELEASE FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_rx_release)
++{
++	if (!sandbox_ffa_priv_data.pair_info.rxbuf_owned) {
++		res->a0 = FFA_SMC_32(FFA_ERROR);
++		res->a2 = FFA_ERR_STAT_DENIED;
++	} else {
++		sandbox_ffa_priv_data.pair_info.rxbuf_owned = 0;
++		res->a0 = FFA_SMC_32(FFA_SUCCESS);
++		res->a2 = 0;
++	}
++
++	res->a1 = 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START,
++	       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_sp_valid - Checks SP validity
++ * @part_id: partition ID to check
++ *
++ * This is the function searches the input ID in the descriptors table.
++ *
++ * Return:
++ *
++ * 1 on success (Partition found). Otherwise, failure
++ */
++static int sandbox_ffa_sp_valid(u16 part_id)
++{
++	u32 descs_cnt;
++
++	for (descs_cnt = 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt++)
++		if (sandbox_ffa_priv_data.partitions.descs[descs_cnt].info.id == part_id)
++			return 1;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_msg_send_direct_req - Emulated FFA_MSG_SEND_DIRECT_{REQ,RESP} handler function
++ * @{a0-a7} , res: The SMC call arguments and return structure.
++ *
++ * This is the function that emulates FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * FF-A functions.
++ *
++ * Emulating interrupts is not supported. So, FFA_RUN and FFA_INTERRUPT are not supported.
++ * In case of success FFA_MSG_SEND_DIRECT_RESP is returned with default pattern data (0xff).
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++SANDBOX_SMC_FFA_ABI(ffa_msg_send_direct_req)
++{
++	u16 part_id;
++
++	part_id = GET_DST_SP_ID(pargs->a1);
++
++	if ((GET_NS_PHYS_ENDPOINT_ID(pargs->a1) != sandbox_ffa_priv_data.id) ||
++	    !sandbox_ffa_sp_valid(part_id) ||
++		pargs->a2) {
++		res->a0 = FFA_SMC_32(FFA_ERROR);
++		res->a1 = 0;
++		res->a2 = FFA_ERR_STAT_INVALID_PARAMETERS;
++
++		/* x3-x7 MBZ */
++		memset(FFA_X3_MBZ_REG_START,
++		       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
++
++		return 0;
++	}
++
++	res->a0 = FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
++
++	res->a1 = PREP_SRC_SP_ID(part_id) |
++		PREP_NS_PHYS_ENDPOINT_ID(sandbox_ffa_priv_data.id);
++
++	res->a2 = 0;
++
++	/*
++	 * return 0xff bytes as a response
++	 */
++	res->a3 = 0xffffffffffffffff;
++	res->a4 = 0xffffffffffffffff;
++	res->a5 = 0xffffffffffffffff;
++	res->a6 = 0xffffffffffffffff;
++	res->a7 = 0xffffffffffffffff;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_get_prv_data - Returns the pointer to FF-A core pivate data
++ * @func_data:  Pointer to the FF-A function arguments container structure
++ *
++ * This is the handler that returns the address of the FF-A core pivate data.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_get_prv_data(struct ffa_sandbox_data *func_data)
++{
++	if (!func_data)
++		return -EINVAL;
++
++	if (!func_data->data0 || func_data->data0_size != sizeof(struct ffa_prvdata **))
++		return -EINVAL;
++
++	if (!func_data->data1 || func_data->data1_size != sizeof(struct sandbox_ffa_prvdata **))
++		return -EINVAL;
++
++	*((struct ffa_prvdata **)func_data->data0) = *(ffa_bus_prvdata_get());
++	*((struct sandbox_ffa_prvdata **)func_data->data1) = &sandbox_ffa_priv_data;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_get_rxbuf_flags - Reading the mapping/ownership flags
++ * @queried_func_id:	The FF-A function to be queried
++ * @func_data:  Pointer to the FF-A function arguments container structure
++ *
++ * This is the handler that queries the status flags of the following emulated ABIs:
++ * FFA_RXTX_MAP, FFA_RXTX_UNMAP, FFA_RX_RELEASE
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_get_rxbuf_flags(u32 queried_func_id, struct ffa_sandbox_data *func_data)
++{
++	if (!func_data)
++		return -EINVAL;
++
++	if (!func_data->data0 || func_data->data0_size != sizeof(u8))
++		return -EINVAL;
++
++	switch (queried_func_id) {
++	case FFA_RXTX_MAP:
++	case FFA_RXTX_UNMAP:
++		*((u8 *)func_data->data0) = sandbox_ffa_priv_data.pair_info.rxbuf_mapped;
++		return 0;
++	case FFA_RX_RELEASE:
++		*((u8 *)func_data->data0) = sandbox_ffa_priv_data.pair_info.rxbuf_owned;
++		return 0;
++	default:
++		ffa_err("[Sandbox] The querried  FF-A interface flag (%d) undefined",
++			queried_func_id);
++		return -EINVAL;
++	}
++}
++
++/**
++ * sandbox_ffa_query_core_state - The driver dispatcher function
++ * @queried_func_id:	The FF-A function to be queried
++ * @func_data:  Pointer to the FF-A function arguments container structure
++ *
++ * Queries the status of FF-A ABI specified in the input argument.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int sandbox_ffa_query_core_state(u32 queried_func_id, struct ffa_sandbox_data *func_data)
++{
++	switch (queried_func_id) {
++	case FFA_VERSION:
++	case FFA_ID_GET:
++	case FFA_FEATURES:
++		return sandbox_ffa_get_prv_data(func_data);
++	case FFA_RXTX_MAP:
++	case FFA_RXTX_UNMAP:
++	case FFA_RX_RELEASE:
++		return sandbox_ffa_get_rxbuf_flags(queried_func_id, func_data);
++	default:
++		ffa_err("[Sandbox] The querried  FF-A interface (%d) undefined", queried_func_id);
++		return -EINVAL;
++	}
++}
++
++/**
++ * sandbox_arm_ffa_smccc_smc - FF-A SMC call emulation
++ * @args:	the SMC call arguments
++ * @res:	the SMC call returned data
++ *
++ * Sandbox driver emulates the FF-A ABIs SMC call using this function.
++ * The emulated FF-A ABI is identified and invoked.
++ * FF-A emulation is based on the FF-A specification 1.0
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure.
++ * FF-A protocol error codes are returned using the registers arguments as described
++ * by the specification
++ */
++void sandbox_arm_ffa_smccc_smc(ffa_value_t args, ffa_value_t *res)
++{
++	int ret = 0;
++
++	switch (args.a0) {
++	case FFA_SMC_32(FFA_VERSION):
++		ret = sandbox_ffa_version(&args, res);
++		break;
++	case FFA_SMC_32(FFA_PARTITION_INFO_GET):
++		ret = sandbox_ffa_partition_info_get(&args, res);
++		break;
++	case FFA_SMC_32(FFA_RXTX_UNMAP):
++		ret = sandbox_ffa_rxtx_unmap(&args, res);
++		break;
++	case FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ):
++		ret = sandbox_ffa_msg_send_direct_req(&args, res);
++		break;
++	case FFA_SMC_32(FFA_ID_GET):
++		ret = sandbox_ffa_id_get(&args, res);
++		break;
++	case FFA_SMC_32(FFA_FEATURES):
++		ret = sandbox_ffa_features(&args, res);
++		break;
++	case FFA_SMC_64(FFA_RXTX_MAP):
++		ret = sandbox_ffa_rxtx_map(&args, res);
++		break;
++	case FFA_SMC_32(FFA_RX_RELEASE):
++		ret = sandbox_ffa_rx_release(&args, res);
++		break;
++	default:
++		ffa_err("[Sandbox] Undefined FF-A interface (0x%lx)", args.a0);
++	}
++
++	if (ret != 0)
++		ffa_err("[Sandbox] FF-A ABI internal failure  (%d)", ret);
++}
++
++/**
++ * sandbox_ffa_probe - The driver probe function
++ * @dev:	the sandbox_arm_ffa device
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_probe(struct udevice *dev)
++{
++	return 0;
++}
++
++/**
++ * sandbox_ffa_remove - The driver remove function
++ * @dev:	the sandbox_arm_ffa device
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_remove(struct udevice *dev)
++{
++	ffa_info("[Sandbox] removing the device");
++	memset(&sandbox_ffa_priv_data, 0, sizeof(sandbox_ffa_priv_data));
++	return 0;
++}
++
++/**
++ * Declaring the sandbox_arm_ffa driver under UCLASS_FFA
++ */
++U_BOOT_DRIVER(sandbox_arm_ffa) = {
++	.name		= FFA_SANDBOX_DRV_NAME,
++	.id		= UCLASS_FFA,
++	.probe		= sandbox_ffa_probe,
++	.remove		= sandbox_ffa_remove,
++};
+diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h b/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
+new file mode 100644
+index 0000000000..4db57f5092
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
+@@ -0,0 +1,144 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __SANDBOX_ARM_FFA_PRV_H
++#define __SANDBOX_ARM_FFA_PRV_H
++
++#include "arm_ffa_prv.h"
++#include <sandbox_arm_ffa.h>
++
++/*
++ * This header is private. It is exclusively used by the Sandbox FF-A driver
++ */
++
++/* FF-A core driver name */
++#define FFA_SANDBOX_DRV_NAME "sandbox_arm_ffa"
++
++/* FF-A ABIs internal error codes (as defined by the spec) */
++
++#define FFA_ERR_STAT_NOT_SUPPORTED	-1
++#define FFA_ERR_STAT_INVALID_PARAMETERS	-2
++#define FFA_ERR_STAT_NO_MEMORY	-3
++#define FFA_ERR_STAT_BUSY	-4
++#define FFA_ERR_STAT_DENIED	-6
++
++/* Providing Arm SMCCC declarations to sandbox */
++
++#define ARM_SMCCC_FAST_CALL		1UL
++#define ARM_SMCCC_OWNER_STANDARD	4
++#define ARM_SMCCC_SMC_32		0
++#define ARM_SMCCC_SMC_64		1
++#define ARM_SMCCC_TYPE_SHIFT		31
++#define ARM_SMCCC_CALL_CONV_SHIFT	30
++#define ARM_SMCCC_OWNER_MASK		0x3F
++#define ARM_SMCCC_OWNER_SHIFT		24
++#define ARM_SMCCC_FUNC_MASK		0xFFFF
++
++#define ARM_SMCCC_CALL_VAL(type, calling_convention, owner, func_num) \
++	(((type) << ARM_SMCCC_TYPE_SHIFT) | \
++	((calling_convention) << ARM_SMCCC_CALL_CONV_SHIFT) | \
++	(((owner) & ARM_SMCCC_OWNER_MASK) << ARM_SMCCC_OWNER_SHIFT) | \
++	((func_num) & ARM_SMCCC_FUNC_MASK))
++
++/* Non-secure physical FF-A instance */
++#define NS_PHYS_ENDPOINT_ID (0)
++
++#define GET_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(31, 16)
++#define GET_NS_PHYS_ENDPOINT_ID(x)		\
++			((u16)(FIELD_GET(GET_NS_PHYS_ENDPOINT_ID_MASK, (x))))
++
++/* Helper macro for reading the destination partition ID */
++#define GET_DST_SP_ID_MASK		GENMASK(15, 0)
++#define GET_DST_SP_ID(x)		\
++			((u16)(FIELD_GET(GET_DST_SP_ID_MASK, (x))))
++
++/* Helper macro for setting the source partition ID */
++#define PREP_SRC_SP_ID_MASK		GENMASK(31, 16)
++#define PREP_SRC_SP_ID(x)		\
++			(FIELD_PREP(PREP_SRC_SP_ID_MASK, (x)))
++
++/* Helper macro for setting the destination endpoint ID */
++#define PREP_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define PREP_NS_PHYS_ENDPOINT_ID(x)		\
++			(FIELD_PREP(PREP_NS_PHYS_ENDPOINT_ID_MASK, (x)))
++
++/*  RX/TX buffers minimum size */
++#define RXTX_BUFFERS_MIN_SIZE (RXTX_4K)
++#define RXTX_BUFFERS_MIN_PAGES (1)
++
++/* MBZ registers info */
++
++/* x1-x7 MBZ */
++#define FFA_X1X7_MBZ_CNT (7)
++#define FFA_X1X7_MBZ_REG_START (&res->a1)
++
++/* x4-x7 MBZ */
++#define FFA_X4X7_MBZ_CNT (4)
++#define FFA_X4X7_MBZ_REG_START (&res->a4)
++
++/* x3-x7 MBZ */
++#define FFA_X3X7_MBZ_CNT (5)
++#define FFA_X3_MBZ_REG_START (&res->a3)
++
++/* secure partitions count */
++#define SANDBOX_PARTITIONS_CNT (4)
++
++/* service 1  UUID binary data (little-endian format) */
++#define SANDBOX_SERVICE1_UUID_A1	0xed32d533
++#define SANDBOX_SERVICE1_UUID_A2	0x99e64209
++#define SANDBOX_SERVICE1_UUID_A3	0x9cc02d72
++#define SANDBOX_SERVICE1_UUID_A4	0xcdd998a7
++
++/* service 2  UUID binary data (little-endian format) */
++#define SANDBOX_SERVICE2_UUID_A1	0xed32d544
++#define SANDBOX_SERVICE2_UUID_A2	0x99e64209
++#define SANDBOX_SERVICE2_UUID_A3	0x9cc02d72
++#define SANDBOX_SERVICE2_UUID_A4	0xcdd998a7
++
++/**
++ * struct ffa_rxtxpair_info - structure hosting the RX/TX buffers flags
++ * @rxbuf_owned:	RX buffer ownership flag (the owner is non secure world: the consumer)
++ * @rxbuf_mapped:	RX buffer mapping flag
++ * @txbuf_owned	TX buffer ownership flag
++ * @txbuf_mapped:	TX buffer mapping flag
++ * @rxtx_buf_size:	RX/TX buffers size as set by the FF-A core driver
++ *
++ * Data structure hosting the ownership/mapping flags of the RX/TX buffers
++ * When a buffer is owned/mapped its corresponding flag is set to 1 otherwise 0.
++ */
++struct ffa_rxtxpair_info {
++	u8 rxbuf_owned;
++	u8 rxbuf_mapped;
++	u8 txbuf_owned;
++	u8 txbuf_mapped;
++	u32 rxtx_buf_size;
++};
++
++/**
++ * struct sandbox_ffa_prvdata - the driver private data structure
++ *
++ * @dev:	The arm_ffa device under u-boot driver model
++ * @fwk_version:	FF-A framework version
++ * @id:	u-boot endpoint ID
++ * @partitions:	The partitions descriptors structure
++ * @pair:	The RX/TX buffers pair
++ * @pair_info:	The RX/TX buffers pair flags and size
++ * @conduit:	The selected conduit
++ *
++ * The driver data structure hosting all the emulated secure world data.
++ */
++struct sandbox_ffa_prvdata {
++	struct udevice *dev;
++	u32 fwk_version;
++	u16 id;
++	struct ffa_partitions partitions;
++	struct ffa_rxtxpair pair;
++	struct ffa_rxtxpair_info pair_info;
++};
++
++#define SANDBOX_SMC_FFA_ABI(ffabi) static int sandbox_##ffabi(ffa_value_t *pargs, ffa_value_t *res)
++
++#endif
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+index f17b100497..665413a0c5 100644
+--- a/include/arm_ffa.h
++++ b/include/arm_ffa.h
+@@ -111,7 +111,7 @@ struct ffa_bus_ops {
+ const struct ffa_bus_ops * __ffa_runtime ffa_bus_ops_get(void);
+ 
+ /**
+- * ffa_bus_discover - discover FF-A bus and probes the arm_ffa device
++ * ffa_bus_discover - discover FF-A bus and probes the arm_ffa and sandbox_arm_ffa devices
+  */
+ int ffa_bus_discover(void);
+ 
+diff --git a/include/sandbox_arm_ffa.h b/include/sandbox_arm_ffa.h
+new file mode 100644
+index 0000000000..d5df16f282
+--- /dev/null
++++ b/include/sandbox_arm_ffa.h
+@@ -0,0 +1,91 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __SANDBOX_ARM_FFA_H
++#define __SANDBOX_ARM_FFA_H
++
++#include <arm_ffa.h>
++
++/**
++ * struct sandbox_smccc_1_2_regs - Arguments for or Results from emulated SMC call
++ * @a0-a17 argument values from registers 0 to 17
++ */
++struct sandbox_smccc_1_2_regs {
++	unsigned long a0;
++	unsigned long a1;
++	unsigned long a2;
++	unsigned long a3;
++	unsigned long a4;
++	unsigned long a5;
++	unsigned long a6;
++	unsigned long a7;
++	unsigned long a8;
++	unsigned long a9;
++	unsigned long a10;
++	unsigned long a11;
++	unsigned long a12;
++	unsigned long a13;
++	unsigned long a14;
++	unsigned long a15;
++	unsigned long a16;
++	unsigned long a17;
++};
++
++typedef struct sandbox_smccc_1_2_regs ffa_value_t;
++
++/* UUIDs of services supported by the sandbox driver */
++#define SANDBOX_SERVICE1_UUID	"ed32d533-4209-99e6-2d72-cdd998a79cc0"
++#define SANDBOX_SERVICE2_UUID	"ed32d544-4209-99e6-2d72-cdd998a79cc0"
++#define SANDBOX_SP1_ID 0x1245
++#define SANDBOX_SP2_ID 0x9836
++#define SANDBOX_SP3_ID 0x6452
++#define SANDBOX_SP4_ID 0x7814
++
++/* invalid service UUID (no matching SP) */
++#define SANDBOX_SERVICE3_UUID	"55d532ed-0942-e699-722d-c09ca798d9cd"
++
++/* invalid service UUID (invalid UUID string format) */
++#define SANDBOX_SERVICE4_UUID	"32ed-0942-e699-722d-c09ca798d9cd"
++
++#define SANDBOX_SP_COUNT_PER_VALID_SERVICE	2
++
++/**
++ * struct ffa_sandbox_data - generic data structure used to exchange
++ *						data between test cases and the sandbox driver
++ * @data0_size:	size of the first argument
++ * @data0:	pointer to the first argument
++ * @data1_size>:	size of the second argument
++ * @data1:	pointer to the second argument
++ *
++ * Using this structure sandbox test cases can pass various types of data with different sizes.
++ */
++struct ffa_sandbox_data {
++	u32 data0_size; /* size of the first argument */
++	void *data0; /* pointer to the first argument */
++	u32 data1_size; /* size of the second argument */
++	void *data1; /* pointer to the second argument */
++};
++
++/**
++ * The sandbox driver public functions
++ */
++
++/**
++ * sandbox_ffa_query_core_state - Queries the status of FF-A ABIs
++ */
++int sandbox_ffa_query_core_state(u32 queried_func_id, struct ffa_sandbox_data *func_data);
++
++/**
++ * sandbox_ffa_get_device - create, bind and probe the sandbox_arm_ffa device
++ */
++int sandbox_ffa_device_get(void);
++
++/**
++ * sandbox_arm_ffa_smccc_smc - FF-A SMC call emulation
++ */
++void sandbox_arm_ffa_smccc_smc(ffa_value_t args, ffa_value_t *res);
++
++#endif
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
+index 0ec002ac8b..8fa9a58d76 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -2177,7 +2177,7 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
+ 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
+ 	}
+ 
+-#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
++#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT) && !CONFIG_IS_ENABLED(SANDBOX_FFA)
+ 		/* unmap FF-A RX/TX buffers */
+ 		if (ffa_bus_ops_get()->rxtx_unmap())
+ 			debug("[efi_boottime][ERROR]: can not unmap FF-A RX/TX buffers\n");
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
new file mode 100644
index 00000000..edc5ed60
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
@@ -0,0 +1,455 @@
+From dbc51066367481b5a45ce24f91571f83a022576e Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 6 Jun 2022 17:26:06 +0100
+Subject: [PATCH 12/26] arm_ffa: introduce Sandbox test cases for UCLASS_FFA
+
+Add functional test cases for the FF-A core driver
+
+These tests rely on the FF-A Sandbox driver which helps in
+ inspecting the FF-A core driver.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+---
+
+Changelog:
+===============
+
+v4: align sandbox tests with the new FF-A driver interfaces
+ and new way of error handling
+
+v1: introduce sandbox tests
+
+ MAINTAINERS      |   1 +
+ test/dm/Makefile |   1 +
+ test/dm/ffa.c    | 394 +++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 396 insertions(+)
+ create mode 100644 test/dm/ffa.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 96157db6b6..e5b71b0ade 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -252,6 +252,7 @@ F:	doc/README.ffa.drv
+ F:	drivers/firmware/arm-ffa/
+ F:	include/arm_ffa.h
+ F:	include/sandbox_arm_ffa.h
++F:	test/dm/ffa.c
+ 
+ ARM FREESCALE IMX
+ M:	Stefano Babic <sbabic@denx.de>
+diff --git a/test/dm/Makefile b/test/dm/Makefile
+index f0a7c97e3d..f96f848046 100644
+--- a/test/dm/Makefile
++++ b/test/dm/Makefile
+@@ -79,6 +79,7 @@ obj-$(CONFIG_POWER_DOMAIN) += power-domain.o
+ obj-$(CONFIG_ACPI_PMC) += pmc.o
+ obj-$(CONFIG_DM_PMIC) += pmic.o
+ obj-$(CONFIG_DM_PWM) += pwm.o
++obj-$(CONFIG_SANDBOX_FFA) += ffa.o
+ obj-$(CONFIG_QFW) += qfw.o
+ obj-$(CONFIG_RAM) += ram.o
+ obj-y += regmap.o
+diff --git a/test/dm/ffa.c b/test/dm/ffa.c
+new file mode 100644
+index 0000000000..052d5fc3f4
+--- /dev/null
++++ b/test/dm/ffa.c
+@@ -0,0 +1,394 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Functional tests for UCLASS_FFA  class
++ *
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <console.h>
++#include <dm.h>
++#include <dm/test.h>
++#include "../../drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h"
++#include <sandbox_arm_ffa.h>
++#include <test/test.h>
++#include <test/ut.h>
++
++/* Macros */
++
++#define LOG_MSG_SZ (100)
++#define LOG_CMD_SZ (LOG_MSG_SZ * 2)
++
++/* Functional tests for the UCLASS_FFA */
++
++static int dm_test_ffa_log(struct unit_test_state *uts, char *msg)
++{
++	char cmd[LOG_CMD_SZ] = {0};
++
++	console_record_reset();
++
++	snprintf(cmd, LOG_CMD_SZ, "echo \"%s\"", msg);
++	run_command(cmd, 0);
++
++	ut_assert_console_end();
++
++	return CMD_RET_SUCCESS;
++}
++
++static int check_fwk_version(struct ffa_prvdata *prvdata, struct sandbox_ffa_prvdata *sdx_prvdata,
++			     struct unit_test_state *uts)
++{
++	if (prvdata->fwk_version != sdx_prvdata->fwk_version) {
++		char msg[LOG_MSG_SZ] = {0};
++
++		snprintf(msg, LOG_MSG_SZ,
++			 "[%s]: Error: framework version: core = 0x%x , sandbox  = 0x%x", __func__,
++			 prvdata->fwk_version,
++			sdx_prvdata->fwk_version);
++
++		dm_test_ffa_log(uts, msg);
++		return CMD_RET_FAILURE;
++	}
++	return CMD_RET_SUCCESS;
++}
++
++static int check_endpoint_id(struct ffa_prvdata *prvdata, struct unit_test_state *uts)
++{
++	if (prvdata->id) {
++		char msg[LOG_MSG_SZ] = {0};
++
++		snprintf(msg, LOG_MSG_SZ,
++			 "[%s]: Error: endpoint id: core = 0x%x", __func__, prvdata->id);
++		dm_test_ffa_log(uts, msg);
++		return CMD_RET_FAILURE;
++	}
++	return CMD_RET_SUCCESS;
++}
++
++static int check_core_dev(struct ffa_prvdata *prvdata, struct unit_test_state *uts)
++{
++	if (!prvdata->dev) {
++		char msg[LOG_MSG_SZ] = {0};
++
++		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: core device NULL", __func__);
++		dm_test_ffa_log(uts, msg);
++		return CMD_RET_FAILURE;
++	}
++	return CMD_RET_SUCCESS;
++}
++
++static int check_sandbox_dev(struct sandbox_ffa_prvdata *sdx_prvdata, struct unit_test_state *uts)
++{
++	if (!sdx_prvdata->dev) {
++		char msg[LOG_MSG_SZ] = {0};
++
++		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: sandbox device NULL", __func__);
++		dm_test_ffa_log(uts, msg);
++		return CMD_RET_FAILURE;
++	}
++	return CMD_RET_SUCCESS;
++}
++
++static int check_rxtxbuf(struct ffa_prvdata *prvdata, struct unit_test_state *uts)
++{
++	if (!prvdata->pair.rxbuf && prvdata->pair.txbuf) {
++		char msg[LOG_MSG_SZ] = {0};
++
++		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: rxbuf = 0x%llx txbuf = 0x%llx", __func__,
++			 prvdata->pair.rxbuf,
++			 prvdata->pair.txbuf);
++		dm_test_ffa_log(uts, msg);
++		return CMD_RET_FAILURE;
++	}
++	return CMD_RET_SUCCESS;
++}
++
++static int check_features(struct ffa_prvdata *prvdata, struct unit_test_state *uts)
++{
++	char msg[LOG_MSG_SZ] = {0};
++
++	if (prvdata->pair.rxtx_min_pages != RXTX_4K &&
++	    prvdata->pair.rxtx_min_pages != RXTX_16K &&
++	    prvdata->pair.rxtx_min_pages != RXTX_64K) {
++		snprintf(msg,
++			 LOG_MSG_SZ,
++			 "[%s]: Error: FFA_RXTX_MAP features = 0x%lx",
++			 __func__,
++			 prvdata->pair.rxtx_min_pages);
++		dm_test_ffa_log(uts, msg);
++		return CMD_RET_FAILURE;
++	}
++
++	return CMD_RET_SUCCESS;
++}
++
++static int check_rxbuf_mapped_flag(u32 queried_func_id,
++				   u8 rxbuf_mapped,
++				   struct unit_test_state *uts)
++{
++	char msg[LOG_MSG_SZ] = {0};
++
++	switch (queried_func_id) {
++	case FFA_RXTX_MAP:
++	{
++		if (rxbuf_mapped)
++			return CMD_RET_SUCCESS;
++		break;
++	}
++	case FFA_RXTX_UNMAP:
++	{
++		if (!rxbuf_mapped)
++			return CMD_RET_SUCCESS;
++		break;
++	}
++	default:
++		return CMD_RET_FAILURE;
++	}
++
++	snprintf(msg, LOG_MSG_SZ, "[%s]: Error: %s mapping issue", __func__,
++		 (queried_func_id == FFA_RXTX_MAP ? "FFA_RXTX_MAP" : "FFA_RXTX_UNMAP"));
++	dm_test_ffa_log(uts, msg);
++
++	return CMD_RET_FAILURE;
++}
++
++static int check_rxbuf_release_flag(u8 rxbuf_owned, struct unit_test_state *uts)
++{
++	if (rxbuf_owned) {
++		char msg[LOG_MSG_SZ] = {0};
++
++		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: RX buffer not released", __func__);
++		dm_test_ffa_log(uts, msg);
++		return CMD_RET_FAILURE;
++	}
++	return CMD_RET_SUCCESS;
++}
++
++static int  test_ffa_msg_send_direct_req(u16 part_id, struct unit_test_state *uts)
++{
++	struct ffa_send_direct_data msg = {0};
++	u8 cnt;
++
++	ut_assertok(ffa_bus_ops_get()->sync_send_receive(part_id, &msg));
++
++	for (cnt = 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64); cnt++)
++		ut_assertok(((u64 *)&msg)[cnt] != 0xffffffffffffffff);
++
++	return CMD_RET_SUCCESS;
++}
++
++static int test_partitions_and_comms(const char *service_uuid,
++				     struct sandbox_ffa_prvdata *sdx_prvdata,
++				     struct unit_test_state *uts)
++{
++	u32 count = 0, size = 0;
++	struct ffa_partition_info *parts_info;
++	u32 info_idx, exp_info_idx;
++	int ret;
++
++	/*
++	 * get from the driver the count of the SPs matching the UUID
++	 */
++	ret = ffa_bus_ops_get()->partition_info_get(service_uuid, &count, NULL);
++	/* make sure partitions are detected */
++	ut_assertok(ret != 0);
++	ut_assertok(count != SANDBOX_SP_COUNT_PER_VALID_SERVICE);
++
++	/*
++	 * pre-allocate a buffer to be filled by the driver
++	 * with	 ffa_partition_info structs
++	 */
++
++	parts_info = calloc(count, sizeof(struct ffa_partition_info));
++	ut_assertok(!parts_info);
++
++	size = count * sizeof(struct ffa_partition_info);
++
++	/*
++	 * ask the driver to fill the buffer with the SPs info
++	 */
++	ret = ffa_bus_ops_get()->partition_info_get(service_uuid, &size, parts_info);
++	if (ret != 0) {
++		free(parts_info);
++		ut_assertok(ret != 0);
++	}
++
++	/*
++	 * SPs found , verify the partitions information
++	 */
++
++	ret = CMD_RET_FAILURE;
++
++	for (info_idx = 0; info_idx < count ; info_idx++) {
++		for (exp_info_idx = 0;
++		     exp_info_idx < sdx_prvdata->partitions.count;
++		     exp_info_idx++) {
++			if (parts_info[info_idx].id ==
++			   sdx_prvdata->partitions.descs[exp_info_idx].info.id) {
++				ret = memcmp(&parts_info[info_idx],
++					     &sdx_prvdata->partitions.descs[exp_info_idx]
++					     .info,
++					     sizeof(struct ffa_partition_info));
++				if (ret)
++					free(parts_info);
++				ut_assertok(ret != 0);
++				/* send and receive data from the current partition */
++				test_ffa_msg_send_direct_req(parts_info[info_idx].id, uts);
++			}
++			ret = CMD_RET_SUCCESS;
++		}
++	}
++
++	free(parts_info);
++
++	/* Verify  expected partitions found in the emulated secure world*/
++	ut_assertok(ret != CMD_RET_SUCCESS);
++
++	return CMD_RET_SUCCESS;
++}
++
++static int dm_test_ffa_ack(struct unit_test_state *uts)
++{
++	struct ffa_prvdata *prvdata = NULL;
++	struct sandbox_ffa_prvdata *sdx_prvdata = NULL;
++	struct ffa_sandbox_data func_data = {0};
++	u8 rxbuf_flag = 0;
++	const char *svc1_uuid = SANDBOX_SERVICE1_UUID;
++	const char *svc2_uuid = SANDBOX_SERVICE2_UUID;
++	int ret;
++
++	/*  test probing FF-A devices */
++	ut_assertok(ffa_bus_discover());
++
++	/* get a pointer to the FF-A core and sandbox drivers private data */
++	func_data.data0 = &prvdata;
++	func_data.data0_size = sizeof(prvdata);
++	func_data.data1 = &sdx_prvdata;
++	func_data.data1_size = sizeof(sdx_prvdata);
++
++	ut_assertok(sandbox_ffa_query_core_state(FFA_VERSION, &func_data));
++
++	/* make sure private data pointers are retrieved */
++	ut_assertok(prvdata == 0);
++	ut_assertok(sdx_prvdata == 0);
++
++	/* make sure dev devices created */
++	ut_assertok(check_core_dev(prvdata, uts));
++	ut_assertok(check_sandbox_dev(sdx_prvdata, uts));
++
++	/* test FFA_VERSION */
++	ut_assertok(check_fwk_version(prvdata, sdx_prvdata, uts));
++
++	/* test FFA_ID_GET */
++	ut_assertok(check_endpoint_id(prvdata, uts));
++
++	/* test FFA_FEATURES */
++	ut_assertok(check_features(prvdata, uts));
++
++	/*  test core RX/TX buffers */
++	ut_assertok(check_rxtxbuf(prvdata, uts));
++
++	/* test FFA_RXTX_MAP */
++	func_data.data0 = &rxbuf_flag;
++	func_data.data0_size = sizeof(rxbuf_flag);
++
++	rxbuf_flag = 0;
++	ut_assertok(sandbox_ffa_query_core_state(FFA_RXTX_MAP, &func_data));
++	ut_assertok(check_rxbuf_mapped_flag(FFA_RXTX_MAP, rxbuf_flag, uts));
++
++	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
++	ret = test_partitions_and_comms(svc1_uuid, sdx_prvdata, uts);
++	ut_assertok(ret != CMD_RET_SUCCESS);
++
++	/* test FFA_RX_RELEASE */
++	rxbuf_flag = 1;
++	ut_assertok(sandbox_ffa_query_core_state(FFA_RX_RELEASE, &func_data));
++	ut_assertok(check_rxbuf_release_flag(rxbuf_flag, uts));
++
++	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
++	ret = test_partitions_and_comms(svc2_uuid, sdx_prvdata, uts);
++	ut_assertok(ret != CMD_RET_SUCCESS);
++
++	/* test FFA_RX_RELEASE */
++	rxbuf_flag = 1;
++	ut_assertok(sandbox_ffa_query_core_state(FFA_RX_RELEASE, &func_data));
++	ut_assertok(check_rxbuf_release_flag(rxbuf_flag, uts));
++
++	/* test FFA_RXTX_UNMAP */
++	ut_assertok(ffa_bus_ops_get()->rxtx_unmap());
++
++	rxbuf_flag = 1;
++	ut_assertok(sandbox_ffa_query_core_state(FFA_RXTX_UNMAP, &func_data));
++	ut_assertok(check_rxbuf_mapped_flag(FFA_RXTX_UNMAP, rxbuf_flag, uts));
++
++	return CMD_RET_SUCCESS;
++}
++
++DM_TEST(dm_test_ffa_ack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
++
++static int dm_test_ffa_nack(struct unit_test_state *uts)
++{
++	struct ffa_prvdata *prvdata = NULL;
++	struct sandbox_ffa_prvdata *sdx_prvdata = NULL;
++	struct ffa_sandbox_data func_data = {0};
++	const char *valid_svc_uuid = SANDBOX_SERVICE1_UUID;
++	const char *unvalid_svc_uuid = SANDBOX_SERVICE3_UUID;
++	const char *unvalid_svc_uuid_str = SANDBOX_SERVICE4_UUID;
++	struct ffa_send_direct_data msg = {0};
++	int ret;
++	u32 count = 0;
++	u16 part_id = 0;
++
++	/*  test probing FF-A devices */
++	ut_assertok(ffa_bus_discover());
++
++	/* get a pointer to the FF-A core and sandbox drivers private data */
++	func_data.data0 = &prvdata;
++	func_data.data0_size = sizeof(prvdata);
++	func_data.data1 = &sdx_prvdata;
++	func_data.data1_size = sizeof(sdx_prvdata);
++
++	ut_assertok(sandbox_ffa_query_core_state(FFA_VERSION, &func_data));
++
++	/* make sure private data pointers are retrieved */
++	ut_assertok(prvdata == 0);
++	ut_assertok(sdx_prvdata == 0);
++
++	/* make sure dev devices created */
++	ut_assertok(check_core_dev(prvdata, uts));
++	ut_assertok(check_sandbox_dev(sdx_prvdata, uts));
++
++	/* query partitions count using  invalid arguments  */
++	ret = ffa_bus_ops_get()->partition_info_get(unvalid_svc_uuid, NULL, NULL);
++	ut_assertok(ret != -EINVAL);
++
++	/* query partitions count using an invalid UUID  string */
++	ret = ffa_bus_ops_get()->partition_info_get(unvalid_svc_uuid_str, &count, NULL);
++	ut_assertok(ret != -EINVAL);
++
++	/* query partitions count using an invalid UUID (no matching SP) */
++	count = 0;
++	ret = ffa_bus_ops_get()->partition_info_get(unvalid_svc_uuid, &count, NULL);
++	ut_assertok(count != 0);
++
++	/* query partitions count using a valid UUID  */
++	count = 0;
++	ret = ffa_bus_ops_get()->partition_info_get(valid_svc_uuid, &count, NULL);
++	/* make sure partitions are detected */
++	ut_assertok(ret != 0);
++	ut_assertok(count != SANDBOX_SP_COUNT_PER_VALID_SERVICE);
++
++	/* send data to an invalid partition */
++	ret = ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ut_assertok(ret != -EINVAL);
++
++	/* send data to a valid partition */
++	part_id = prvdata->partitions.descs[0].info.id;
++	ret = ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ut_assertok(ret != 0);
++
++	return CMD_RET_SUCCESS;
++}
++
++DM_TEST(dm_test_ffa_nack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm_ffa-introduce-armffa-command-Sandbox-test.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm_ffa-introduce-armffa-command-Sandbox-test.patch
new file mode 100644
index 00000000..9722677c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm_ffa-introduce-armffa-command-Sandbox-test.patch
@@ -0,0 +1,94 @@
+From 5be8c1d52045cbdc1adf79299792a6a49fef66c3 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 6 Jun 2022 17:30:44 +0100
+Subject: [PATCH 13/26] arm_ffa: introduce armffa command Sandbox test
+
+Add Sandbox test for the armffa command
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+---
+
+Changelog:
+===============
+
+v4: drop use of helper APIs
+
+v1: introduce armffa command sandbox test
+
+ MAINTAINERS       |  1 +
+ test/cmd/Makefile |  1 +
+ test/cmd/armffa.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 42 insertions(+)
+ create mode 100644 test/cmd/armffa.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index e5b71b0ade..505fffff14 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -252,6 +252,7 @@ F:	doc/README.ffa.drv
+ F:	drivers/firmware/arm-ffa/
+ F:	include/arm_ffa.h
+ F:	include/sandbox_arm_ffa.h
++F:	test/cmd/armffa.c
+ F:	test/dm/ffa.c
+ 
+ ARM FREESCALE IMX
+diff --git a/test/cmd/Makefile b/test/cmd/Makefile
+index a59adb1e6d..d9dc0809d6 100644
+--- a/test/cmd/Makefile
++++ b/test/cmd/Makefile
+@@ -11,3 +11,4 @@ obj-$(CONFIG_CMD_MEM_SEARCH) += mem_search.o
+ obj-$(CONFIG_CMD_PINMUX) += pinmux.o
+ obj-$(CONFIG_CMD_PWM) += pwm.o
+ obj-$(CONFIG_CMD_SETEXPR) += setexpr.o
++obj-$(CONFIG_SANDBOX_FFA) += armffa.o
+diff --git a/test/cmd/armffa.c b/test/cmd/armffa.c
+new file mode 100644
+index 0000000000..531f82066e
+--- /dev/null
++++ b/test/cmd/armffa.c
+@@ -0,0 +1,40 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Test for armffa command
++ *
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/test.h>
++#include <sandbox_arm_ffa.h>
++#include <string.h>
++#include <test/test.h>
++#include <test/ut.h>
++
++#define PING_CMD_SIZE 19
++
++/* Basic test of 'armffa' command */
++static int dm_test_armffa_cmd(struct unit_test_state *uts)
++{
++	char ping_cmd[PING_CMD_SIZE] = {0};
++
++	ut_assertok(ffa_bus_discover());
++
++	/* armffa getpart <UUID> */
++	ut_assertok(run_command("armffa getpart " SANDBOX_SERVICE1_UUID, 0));
++
++	snprintf(ping_cmd, PING_CMD_SIZE, "armffa ping 0x%x", SANDBOX_SP1_ID);
++
++	/* armffa ping <ID> */
++	ut_assertok(run_command(ping_cmd, 0));
++
++	/* armffa devlist */
++	ut_assertok(run_command("armffa devlist", 0));
++
++	return CMD_RET_SUCCESS;
++}
++
++DM_TEST(dm_test_armffa_cmd, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
deleted file mode 100644
index 2caeb58b..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 370422921b2a3f4f7b73ce5b08820c24e82bba19 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Thu, 18 Nov 2021 16:42:59 +0000
-Subject: [PATCH 13/24] corstone1000: Make sure shared buffer contents are not
- cached
-
-After updating the shared buffer, it is required to flush the cache
-to ensure that the secure world sees expected the shared buffer
-contents.
-
-The MM communication shared buffer is configured in device region of optee
-which has cache disabled. So we need to invalidate the cache every time we
-update the buffer on uboot otherwise the secure world does not see the
-accurate values.
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-%% original patch: 0027-Make-sure-shared-buffer-contents-are-not-cached.patch
-
-%% original patch: 0027-Make-sure-shared-buffer-contents-are-not-cached.patch
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/efi_variable_tee.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index 9cb8cfb9c779..b6be2b54a030 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -22,6 +22,7 @@
- #if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
- 
- #include <arm_ffa_helper.h>
-+#include <cpu_func.h>
- #include <mapmem.h>
- 
- /* MM return codes */
-@@ -335,6 +336,11 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
- 	virt_shared_buf = (void *)map_sysmem((phys_addr_t)FFA_SHARED_MM_BUFFER_ADDR, 0);
- 	efi_memcpy_runtime(virt_shared_buf, comm_buf, tx_data_size);
- 
-+	/* The secure world has cache disabled for device region which we use for shared buffer
-+	So, the secure world reads the data from DDR. Let's flush the cache so the DDR is
-+	updated with the latest data */
-+	invalidate_dcache_all();
-+
- 	/* Announce there is data in the shared buffer */
- 
- 	ffa_ret = ffa_notify_mm_sp();
--- 
-2.37.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm_ffa-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm_ffa-introduce-FF-A-MM-communication.patch
new file mode 100644
index 00000000..04e55576
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm_ffa-introduce-FF-A-MM-communication.patch
@@ -0,0 +1,540 @@
+From b3c7d84dcde6ee1cbc13e10664d24ffa220f5fb3 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 15 Aug 2022 15:12:49 +0100
+Subject: [PATCH 14/26] arm_ffa: introduce FF-A MM communication
+
+Add MM communication support using FF-A transport
+
+Access an SP's service through EFI MM communication protocol.
+
+This feature allows accessing MM partitions services through
+EFI MM communication protocol. MM partitions such as StandAlonneMM
+or smm-gateway secure partitions which reside in secure world.
+
+An MM shared buffer and a door bell event are used to exchange
+the data.
+
+The data is used by EFI services such as GetVariable()/SetVariable()
+and copied from the communication buffer to the MM shared buffer.
+
+The secure partition is notified about availability of data in the
+MM shared buffer by an FF-A message (door bell).
+
+On such event, MM SP can read the data and updates the MM shared
+buffer with the response data.
+
+The response data is copied back to the communication buffer and
+consumed by the EFI subsystem.
+
+FF-A driver private data is copied to EFI runtime section at
+ExitBootServices(). This garantees secure world partitions data are
+available at EFI runtime level.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
+---
+
+Changelog:
+===============
+
+v4:
+
+* use the new FF-A driver interfaces
+* discover MM partitions at runtime
+* copy FF-A driver private data to EFI runtime section at
+  ExitBootServices()
+* drop use of FFA_ERR_STAT_SUCCESS error code
+* replace EFI_BUFFER_TOO_SMALL by EFI_OUT_OF_RESOURCES
+  in ffa_mm_communicate(). No need for efi_memcpy_runtime() anymore
+* revert the error log in mm_communicate() in case of failure
+* remove packed attribute from efi_mm_communicate_header and
+  smm_variable_communicate_header
+
+v2:
+
+* set default values to 0 for FFA_SHARED_MM_BUFFER_SIZE, FFA_SHARED_MM_BUFFER_ADDR and MM_SP_UUID_DATA and add warnings
+
+v1:
+
+* introduce FF-A MM communication
+
+ arch/arm/cpu/armv8/cache.S        |  16 ++
+ arch/arm/cpu/armv8/cache_v8.c     |   3 +-
+ include/mm_communication.h        |   7 +-
+ lib/efi_loader/Kconfig            |  14 +-
+ lib/efi_loader/efi_boottime.c     |   7 +
+ lib/efi_loader/efi_variable_tee.c | 261 +++++++++++++++++++++++++++++-
+ 6 files changed, 299 insertions(+), 9 deletions(-)
+
+diff --git a/arch/arm/cpu/armv8/cache.S b/arch/arm/cpu/armv8/cache.S
+index d1cee23437..f69ef64ed6 100644
+--- a/arch/arm/cpu/armv8/cache.S
++++ b/arch/arm/cpu/armv8/cache.S
+@@ -21,7 +21,11 @@
+  * x1: 0 clean & invalidate, 1 invalidate only
+  * x2~x9: clobbered
+  */
++#ifdef CONFIG_EFI_LOADER
++.pushsection .text.efi_runtime, "ax"
++#else
+ .pushsection .text.__asm_dcache_level, "ax"
++#endif
+ ENTRY(__asm_dcache_level)
+ 	lsl	x12, x0, #1
+ 	msr	csselr_el1, x12		/* select cache level */
+@@ -65,7 +69,11 @@ ENDPROC(__asm_dcache_level)
+  *
+  * flush or invalidate all data cache by SET/WAY.
+  */
++#ifdef CONFIG_EFI_LOADER
++.pushsection .text.efi_runtime, "ax"
++#else
+ .pushsection .text.__asm_dcache_all, "ax"
++#endif
+ ENTRY(__asm_dcache_all)
+ 	mov	x1, x0
+ 	dsb	sy
+@@ -109,7 +117,11 @@ ENTRY(__asm_flush_dcache_all)
+ ENDPROC(__asm_flush_dcache_all)
+ .popsection
+ 
++#ifdef CONFIG_EFI_LOADER
++.pushsection .text.efi_runtime, "ax"
++#else
+ .pushsection .text.__asm_invalidate_dcache_all, "ax"
++#endif
+ ENTRY(__asm_invalidate_dcache_all)
+ 	mov	x0, #0x1
+ 	b	__asm_dcache_all
+@@ -182,7 +194,11 @@ ENTRY(__asm_invalidate_icache_all)
+ ENDPROC(__asm_invalidate_icache_all)
+ .popsection
+ 
++#ifdef CONFIG_EFI_LOADER
++.pushsection .text.efi_runtime, "ax"
++#else
+ .pushsection .text.__asm_invalidate_l3_dcache, "ax"
++#endif
+ WEAK(__asm_invalidate_l3_dcache)
+ 	mov	x0, #0			/* return status as success */
+ 	ret
+diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8.c
+index e4736e5643..afbc487fa1 100644
+--- a/arch/arm/cpu/armv8/cache_v8.c
++++ b/arch/arm/cpu/armv8/cache_v8.c
+@@ -9,6 +9,7 @@
+ 
+ #include <common.h>
+ #include <cpu_func.h>
++#include <efi_loader.h>
+ #include <hang.h>
+ #include <log.h>
+ #include <asm/cache.h>
+@@ -445,7 +446,7 @@ __weak void mmu_setup(void)
+ /*
+  * Performs a invalidation of the entire data cache at all levels
+  */
+-void invalidate_dcache_all(void)
++void __efi_runtime invalidate_dcache_all(void)
+ {
+ 	__asm_invalidate_dcache_all();
+ 	__asm_invalidate_l3_dcache();
+diff --git a/include/mm_communication.h b/include/mm_communication.h
+index e65fbde60d..32dc5dbac8 100644
+--- a/include/mm_communication.h
++++ b/include/mm_communication.h
+@@ -13,6 +13,9 @@
+ 
+ #include <part_efi.h>
+ 
++/* MM service UUID string (big-endian format). This UUID is  common across all MM SPs */
++#define MM_SP_UUID	"33d532ed-e699-0942-c09c-a798d9cd722d"
++
+ /*
+  * Interface to the pseudo Trusted Application (TA), which provides a
+  * communication channel with the Standalone MM (Management Mode)
+@@ -43,7 +46,7 @@
+  * To avoid confusion in interpreting frames, the communication buffer should
+  * always begin with efi_mm_communicate_header.
+  */
+-struct __packed efi_mm_communicate_header {
++struct efi_mm_communicate_header {
+ 	efi_guid_t header_guid;
+ 	size_t     message_len;
+ 	u8         data[];
+@@ -145,7 +148,7 @@ struct smm_variable_communicate_header {
+  * Defined in EDK2 as SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE.
+  *
+  */
+-struct smm_variable_access {
++struct __packed smm_variable_access {
+ 	efi_guid_t  guid;
+ 	efi_uintn_t data_size;
+ 	efi_uintn_t name_size;
+diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
+index e3f2402d0e..2a6d70f862 100644
+--- a/lib/efi_loader/Kconfig
++++ b/lib/efi_loader/Kconfig
+@@ -60,13 +60,23 @@ config EFI_VARIABLE_FILE_STORE
+ 	  stored as file /ubootefi.var on the EFI system partition.
+ 
+ config EFI_MM_COMM_TEE
+-	bool "UEFI variables storage service via OP-TEE"
+-	depends on OPTEE
++	bool "UEFI variables storage service via the trusted world"
++	depends on OPTEE || ARM_FFA_TRANSPORT
+ 	help
++	  Allowing access to the MM SP services (SPs such as  StandAlonneMM, smm-gateway).
++	  When using the u-boot OP-TEE driver, StandAlonneMM is supported.
++	  When using the u-boot FF-A  driver any MM SP is supported.
++
+ 	  If OP-TEE is present and running StandAloneMM, dispatch all UEFI
+ 	  variable related operations to that. The application will verify,
+ 	  authenticate and store the variables on an RPMB.
+ 
++	  When ARM_FFA_TRANSPORT is used, dispatch all UEFI variable related
++	  operations to the MM SP running in the secure world.
++	  A door bell mechanism is used to notify the SP when there is data in the shared
++	  MM buffer. The data is copied by u-boot to the shared buffer before issuing
++	  the door bell event.
++
+ config EFI_VARIABLE_NO_STORE
+ 	bool "Don't persist non-volatile UEFI variables"
+ 	help
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
+index 8fa9a58d76..cede7826bd 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -2185,6 +2185,13 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
+ 			debug("[efi_boottime][INFO]: FF-A RX/TX buffers unmapped\n");
+ #endif
+ 
++#if CONFIG_IS_ENABLED(ARM_FFA_EFI_RUNTIME_MODE) && !CONFIG_IS_ENABLED(SANDBOX_FFA)
++		if (ffa_copy_runtime_data())
++			printf("ERROR: EFI: FFA: copying runtime data\n");
++		else
++			printf("INFO: EFI: FFA: runtime data copied\n");
++#endif
++
+ 	/* Patch out unsupported runtime function */
+ 	efi_runtime_detach();
+ 
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
+index dfef18435d..7d9d577281 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -15,6 +15,36 @@
+ #include <malloc.h>
+ #include <mm_communication.h>
+ 
++#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++
++#include <arm_ffa.h>
++#include <cpu_func.h>
++#include <mapmem.h>
++
++#ifndef FFA_SHARED_MM_BUFFER_SIZE
++#warning "FFA_SHARED_MM_BUFFER_SIZE must be defined in include/configs/<board>.h"
++#define FFA_SHARED_MM_BUFFER_SIZE 0
++#endif
++
++#ifndef FFA_SHARED_MM_BUFFER_OFFSET
++#warning "FFA_SHARED_MM_BUFFER_OFFSET must be defined in include/configs/<board>.h"
++#define FFA_SHARED_MM_BUFFER_OFFSET 0
++#endif
++
++#ifndef FFA_SHARED_MM_BUFFER_ADDR
++#warning "FFA_SHARED_MM_BUFFER_ADDR must be defined in include/configs/<board>.h"
++#define FFA_SHARED_MM_BUFFER_ADDR 0
++#endif
++
++/* MM return codes */
++#define MM_SUCCESS (0)
++
++const char *mm_sp_svc_uuid = MM_SP_UUID;
++
++static __efi_runtime_data u16 mm_sp_id;
++
++#endif
++
+ extern struct efi_var_file __efi_runtime_data *efi_var_buf;
+ static efi_uintn_t max_buffer_size;	/* comm + var + func + data */
+ static efi_uintn_t max_payload_size;	/* func + data */
+@@ -24,6 +54,7 @@ struct mm_connection {
+ 	u32 session;
+ };
+ 
++#if (IS_ENABLED(CONFIG_OPTEE))
+ /**
+  * get_connection() - Retrieve OP-TEE session for a specific UUID.
+  *
+@@ -143,16 +174,227 @@ static efi_status_t optee_mm_communicate(void *comm_buf, ulong dsize)
+ 
+ 	return ret;
+ }
++#endif
++
++#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
+ 
+ /**
+- * mm_communicate() - Adjust the cmonnucation buffer to StandAlonneMM and send
++ * ffa_notify_mm_sp() - Announce there is data in the shared buffer
++ *
++ * Notifies the MM partition in the trusted world that
++ * data is available in the shared buffer.
++ * This is a blocking call during which trusted world has exclusive access
++ * to the MM shared buffer.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int __efi_runtime ffa_notify_mm_sp(void)
++{
++	struct ffa_send_direct_data msg = {0};
++	int ret;
++	int sp_event_ret = -1;
++
++	if (!ffa_bus_ops_get())
++		return -EINVAL;
++
++	msg.data0 = FFA_SHARED_MM_BUFFER_OFFSET; /* x3 */
++
++	ret = ffa_bus_ops_get()->sync_send_receive(mm_sp_id, &msg);
++	if (ret != 0)
++		return ret;
++
++	sp_event_ret = msg.data0; /* x3 */
++
++	if (sp_event_ret == MM_SUCCESS)
++		return 0;
++
++	/*
++	 * Failure to notify the MM SP
++	 */
++
++	return -EACCES;
++}
++
++/**
++ * ffa_discover_mm_sp_id() - Query the MM partition ID
++ *
++ * Use the FF-A driver to get the MM partition ID.
++ * If multiple partitions are found, use the first one.
++ * This is a boot time function.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int ffa_discover_mm_sp_id(void)
++{
++	u32 count = 0, size = 0;
++	int ret;
++	struct ffa_partition_info *parts_info;
++
++	if (!ffa_bus_ops_get())
++		return -EINVAL;
++
++	/*
++	 * get from the driver the count of the SPs matching the UUID
++	 */
++	ret = ffa_bus_ops_get()->partition_info_get(mm_sp_svc_uuid, &count, NULL);
++	if (ret != 0) {
++		log_err("EFI: Failure in querying partitions count (error code: %d)\n", ret);
++		return ret;
++	}
++
++	if (!count) {
++		log_info("EFI: No MM partition found\n");
++		return ret;
++	}
++
++	/*
++	 * pre-allocate a buffer to be filled by the driver
++	 * with	 ffa_partition_info structs
++	 */
++
++	log_info("EFI: Pre-allocating %d partition(s) info structures\n", count);
++
++	parts_info = calloc(count, sizeof(struct ffa_partition_info));
++	if (!parts_info)
++		return -EINVAL;
++
++	size = count * sizeof(struct ffa_partition_info);
++
++	/*
++	 * ask the driver to fill the
++	 * buffer with the SPs info
++	 */
++	ret = ffa_bus_ops_get()->partition_info_get(mm_sp_svc_uuid, &size, parts_info);
++	if (ret != 0) {
++		log_err("EFI: Failure in querying partition(s) info (error code: %d)\n", ret);
++		free(parts_info);
++		return ret;
++	}
++
++	/*
++	 * MM SPs found , use the first one
++	 */
++
++	mm_sp_id = parts_info[0].id;
++
++	log_info("EFI: MM partition ID 0x%x\n", mm_sp_id);
++
++	free(parts_info);
++
++	return 0;
++}
++
++/**
++ * ffa_mm_communicate() - Exchange EFI services data with  the MM partition using FF-A
++ * @comm_buf:		locally allocated communication buffer used for rx/tx
++ * @dsize:				communication buffer size
++ *
++ * Issues a door bell event to notify the MM partition (SP) running in OP-TEE
++ * that there is data to read from the shared buffer.
++ * Communication with the MM SP is performed using FF-A transport.
++ * On the event, MM SP can read the data from the buffer and
++ * update the MM shared buffer with response data.
++ * The response data is copied back to the communication buffer.
++ *
++ * Return:
++ *
++ * EFI status code
++ */
++static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_buf_size)
++{
++	ulong tx_data_size;
++	int ffa_ret;
++	struct efi_mm_communicate_header *mm_hdr;
++	void *virt_shared_buf;
++
++	if (!comm_buf)
++		return EFI_INVALID_PARAMETER;
++
++	/* Discover MM partition ID at boot time */
++	if (!mm_sp_id && ffa_discover_mm_sp_id()  != 0) {
++		log_err("EFI: Failure to discover MM partition ID at boot time\n");
++		return EFI_UNSUPPORTED;
++	}
++
++	mm_hdr = (struct efi_mm_communicate_header *)comm_buf;
++	tx_data_size = mm_hdr->message_len + sizeof(efi_guid_t) + sizeof(size_t);
++
++	if (comm_buf_size != tx_data_size || tx_data_size > FFA_SHARED_MM_BUFFER_SIZE)
++		return EFI_INVALID_PARAMETER;
++
++	/* Copy the data to the shared buffer */
++
++	virt_shared_buf = (void *)map_sysmem((phys_addr_t)FFA_SHARED_MM_BUFFER_ADDR, 0);
++	efi_memcpy_runtime(virt_shared_buf, comm_buf, tx_data_size);
++
++	/*
++	 * The secure world might have cache disabled for
++	 * the device region used for shared buffer (which is the case for Optee).
++	 * In this case, the secure world reads the data from DRAM.
++	 * Let's flush the cache so the DRAM is updated with the latest data.
++	 */
++	#ifdef CONFIG_ARM64
++	invalidate_dcache_all();
++	#endif
++
++	/* Announce there is data in the shared buffer */
++
++	ffa_ret = ffa_notify_mm_sp();
++	if (ffa_ret)
++		unmap_sysmem(virt_shared_buf);
++
++	switch (ffa_ret) {
++	case 0:
++	{
++		ulong rx_data_size;
++		/* Copy the MM SP response from the shared buffer to the communication buffer */
++		rx_data_size = ((struct efi_mm_communicate_header *)virt_shared_buf)->message_len +
++			sizeof(efi_guid_t) +
++			sizeof(size_t);
++
++		if (rx_data_size > comm_buf_size) {
++			unmap_sysmem(virt_shared_buf);
++			return EFI_OUT_OF_RESOURCES;
++		}
++
++		efi_memcpy_runtime(comm_buf, virt_shared_buf, rx_data_size);
++		unmap_sysmem(virt_shared_buf);
++
++		return EFI_SUCCESS;
++	}
++	case -EINVAL:
++		return EFI_DEVICE_ERROR;
++	case -EPERM:
++		return EFI_INVALID_PARAMETER;
++	case -EACCES:
++		return EFI_ACCESS_DENIED;
++	case -EBUSY:
++		return EFI_OUT_OF_RESOURCES;
++	default:
++		return EFI_ACCESS_DENIED;
++	}
++}
++#endif
++
++/**
++ * mm_communicate() - Adjust the communication buffer to the MM SP and send
+  * it to OP-TEE
+  *
+- * @comm_buf:		locally allocted communcation buffer
++ * @comm_buf:		locally allocated communication buffer
+  * @dsize:		buffer size
++ *
++ * The MM SP (also called partition) can be StandAlonneMM or smm-gateway.
++ * The comm_buf format is the same for both partitions.
++ * When using the u-boot OP-TEE driver, StandAlonneMM is supported.
++ * When using the u-boot FF-A  driver, StandAlonneMM and smm-gateway are supported.
++ *
+  * Return:		status code
+  */
+-static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
++static efi_status_t __efi_runtime mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
+ {
+ 	efi_status_t ret;
+ 	struct efi_mm_communicate_header *mm_hdr;
+@@ -162,7 +404,11 @@ static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
+ 	mm_hdr = (struct efi_mm_communicate_header *)comm_buf;
+ 	var_hdr = (struct smm_variable_communicate_header *)mm_hdr->data;
+ 
++	#if (IS_ENABLED(CONFIG_OPTEE))
+ 	ret = optee_mm_communicate(comm_buf, dsize);
++	#elif (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++	ret = ffa_mm_communicate(comm_buf, dsize);
++	#endif
+ 	if (ret != EFI_SUCCESS) {
+ 		log_err("%s failed!\n", __func__);
+ 		return ret;
+@@ -258,6 +504,13 @@ efi_status_t EFIAPI get_max_payload(efi_uintn_t *size)
+ 		goto out;
+ 	}
+ 	*size = var_payload->size;
++
++	#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++		if (*size > FFA_SHARED_MM_BUFFER_SIZE)
++			*size = FFA_SHARED_MM_BUFFER_SIZE - MM_COMMUNICATE_HEADER_SIZE	-
++				MM_VARIABLE_COMMUNICATE_SIZE;
++	#endif
++
+ 	/*
+ 	 * There seems to be a bug in EDK2 miscalculating the boundaries and
+ 	 * size checks, so deduct 2 more bytes to fulfill this requirement. Fix
+@@ -697,7 +950,7 @@ void efi_variables_boot_exit_notify(void)
+ 		ret = EFI_NOT_FOUND;
+ 
+ 	if (ret != EFI_SUCCESS)
+-		log_err("Unable to notify StMM for ExitBootServices\n");
++		log_err("Unable to notify the MM partition for ExitBootServices\n");
+ 	free(comm_buf);
+ 
+ 	/*
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
similarity index 65%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
index 8cab40c2..dcc3ea7a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
@@ -1,7 +1,7 @@
-From c0b01dff84d74f1b5aaff0d9b594e0aaec16c744 Mon Sep 17 00:00:00 2001
+From 01d1487cebc37834e2a5d259e0417a610539a0f5 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 2 Nov 2021 16:44:39 +0000
-Subject: [PATCH 10/24] arm_ffa: corstone1000: enable FF-A and MM support
+Date: Thu, 9 Jun 2022 12:47:35 +0100
+Subject: [PATCH 15/26] arm_ffa: corstone1000: enable FF-A and MM support
 
 This commit allows corstone1000 platform to perform
 MM communication between u-boot and the secure world
@@ -9,38 +9,33 @@ using FF-A transport.
 
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
 ---
- configs/corstone1000_defconfig |  1 +
- include/configs/corstone1000.h | 15 +++++++++++++++
- 2 files changed, 16 insertions(+)
+ configs/corstone1000_defconfig | 2 ++
+ include/configs/corstone1000.h | 9 +++++++++
+ 2 files changed, 11 insertions(+)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index e573fe6fe6a2..b042d4e49419 100644
+index e573fe6fe6..c299dda49f 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -44,6 +44,7 @@ CONFIG_USB=y
+@@ -44,6 +44,8 @@ CONFIG_USB=y
  CONFIG_DM_USB=y
  CONFIG_USB_ISP1760=y
  CONFIG_USB_STORAGE=y
 +CONFIG_ARM_FFA_TRANSPORT=y
++CONFIG_ARM_FFA_EFI_RUNTIME_MODE=y
  CONFIG_EFI_MM_COMM_TEE=y
  # CONFIG_OPTEE is not set
  # CONFIG_GENERATE_SMBIOS_TABLE is not set
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index 8ba0effb0ab2..afc9ccfc192b 100644
+index 8ba0effb0a..5960c6b4be 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -14,6 +14,21 @@
+@@ -14,6 +14,15 @@
  
  #include <linux/sizes.h>
  
-+/* MM SP UUID binary data (little-endian format) */
-+#define MM_SP_UUID_DATA	\
-+	0xed, 0x32, 0xd5, 0x33,	\
-+	0x99, 0xe6, 0x42, 0x09,	\
-+	0x9c, 0xc0, 0x2d, 0x72,	\
-+	0xcd, 0xd9, 0x98, 0xa7
-+
 +#define FFA_SHARED_MM_BUFFER_SIZE	SZ_4K /* 4 KB */
 +
 +/*
@@ -48,10 +43,11 @@ index 8ba0effb0ab2..afc9ccfc192b 100644
 + * u-boot and the MM SP
 + */
 +#define FFA_SHARED_MM_BUFFER_ADDR	(0x023F8000)
++#define FFA_SHARED_MM_BUFFER_OFFSET	(0)
 +
  #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
  #define CONFIG_SKIP_LOWLEVEL_INIT
  
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi-corstone1000-introduce-EFI-capsule-update.patch
similarity index 82%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi-corstone1000-introduce-EFI-capsule-update.patch
index 0a829c41..291d15d3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi-corstone1000-introduce-EFI-capsule-update.patch
@@ -1,7 +1,7 @@
-From 652259af2f795a5d69c628ae7b1e79d33c234abd Mon Sep 17 00:00:00 2001
+From 10e155a677192731481ebe7f302e2d9ad790346a Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 11 Nov 2021 16:27:59 +0000
-Subject: [PATCH 11/24] efi: corstone1000: introduce EFI capsule update
+Date: Thu, 28 Jul 2022 15:01:55 +0100
+Subject: [PATCH 16/26] efi: corstone1000: introduce EFI capsule update
 
 This commit provides capsule update feature for Corstone1000.
 
@@ -20,16 +20,17 @@ SE Proxy FW update service. This event is generated on each boot.
 
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  include/configs/corstone1000.h |  18 +++++
  include/efi_loader.h           |   4 +-
- lib/efi_loader/efi_boottime.c  |  47 ++++++++++++
- lib/efi_loader/efi_capsule.c   | 135 ++++++++++++++++++++++++++++++++-
+ lib/efi_loader/efi_boottime.c  |  36 ++++++++++
+ lib/efi_loader/efi_capsule.c   | 124 ++++++++++++++++++++++++++++++++-
  lib/efi_loader/efi_setup.c     |  15 ++++
- 5 files changed, 215 insertions(+), 4 deletions(-)
+ 5 files changed, 193 insertions(+), 4 deletions(-)
 
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index afc9ccfc192b..a400cdef69d0 100644
+index 5960c6b4be..fe5ec0adcd 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -14,6 +14,24 @@
@@ -54,11 +55,11 @@ index afc9ccfc192b..a400cdef69d0 100644
 +	EFI_GUID(0x3a770ddc, 0x409b, 0x48b2, 0x81, 0x41, \
 +		 0x93, 0xb7, 0xc6, 0x0b, 0x20, 0x9e)
 +
- /* MM SP UUID binary data (little-endian format) */
- #define MM_SP_UUID_DATA	\
- 	0xed, 0x32, 0xd5, 0x33,	\
+ #define FFA_SHARED_MM_BUFFER_SIZE	SZ_4K /* 4 KB */
+ 
+ /*
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 5b41985244e2..796419b69b40 100644
+index 5b41985244..796419b69b 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
 @@ -984,11 +984,11 @@ extern const struct efi_firmware_management_protocol efi_fmp_fit;
@@ -76,10 +77,10 @@ index 5b41985244e2..796419b69b40 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index c68d9ed4f0bd..f2b5c7834c01 100644
+index cede7826bd..9bf2596597 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
-@@ -2095,6 +2095,44 @@ static void efi_exit_caches(void)
+@@ -2095,6 +2095,33 @@ static void efi_exit_caches(void)
  #endif
  }
  
@@ -95,28 +96,17 @@ index c68d9ed4f0bd..f2b5c7834c01 100644
 + */
 +static int efi_corstone1000_kernel_started_event(void)
 +{
-+	struct ffa_interface_data func_data = {0};
 +	struct ffa_send_direct_data msg = {0};
-+	u16 part_id = CORSTONE1000_SEPROXY_PART_ID;
 +
 +	log_debug("[%s]\n", __func__);
 +
 +	/*
-+	 * telling the driver which partition to use
-+	 */
-+	func_data.data0_size = sizeof(part_id);
-+	func_data.data0 = &part_id;
-+
-+	/*
 +	 * setting the kernel started  event arguments
 +	 */
-+	msg.a3 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID;
-+	msg.a5 = CORSTONE1000_KERNEL_STARTED_EVT;
++	msg.data0 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
++	msg.data2 = CORSTONE1000_KERNEL_STARTED_EVT; /* x5 */
 +
-+	func_data.data1_size = sizeof(msg);
-+	func_data.data1 = &msg;
-+
-+	return ffa_helper_msg_send_direct_req(&func_data);
++	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_ID, &msg);
 +}
 +
 +#endif
@@ -124,7 +114,7 @@ index c68d9ed4f0bd..f2b5c7834c01 100644
  /**
   * efi_exit_boot_services() - stop all boot services
   * @image_handle: handle of the loaded image
-@@ -2208,6 +2246,15 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
+@@ -2210,6 +2237,15 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
  	/* Recalculate CRC32 */
  	efi_update_table_header_crc32(&systab.hdr);
  
@@ -141,7 +131,7 @@ index c68d9ed4f0bd..f2b5c7834c01 100644
  	efi_set_watchdog(0);
  	WATCHDOG_RESET();
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index a6b98f066a0b..a0689ba912fc 100644
+index a6b98f066a..c0f3427a60 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -25,6 +25,14 @@
@@ -149,7 +139,7 @@ index a6b98f066a0b..a0689ba912fc 100644
  #include <linux/err.h>
  
 +#ifdef CONFIG_TARGET_CORSTONE1000
-+#include <arm_ffa_helper.h>
++#include <arm_ffa.h>
 +#include <cpu_func.h>
 +
 +void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared buffer virtual address */
@@ -159,7 +149,7 @@ index a6b98f066a0b..a0689ba912fc 100644
  DECLARE_GLOBAL_DATA_PTR;
  
  const efi_guid_t efi_guid_capsule_report = EFI_CAPSULE_REPORT_GUID;
-@@ -512,6 +520,89 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -512,6 +520,78 @@ static efi_status_t efi_capsule_update_firmware(
  }
  #endif /* CONFIG_EFI_CAPSULE_FIRMWARE_MANAGEMENT */
  
@@ -220,36 +210,25 @@ index a6b98f066a0b..a0689ba912fc 100644
 + */
 +static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_size)
 +{
-+	struct ffa_interface_data func_data = {0};
 +	struct ffa_send_direct_data msg = {0};
-+	u16 part_id = CORSTONE1000_SEPROXY_PART_ID;
 +
 +	log_debug("[%s]\n", __func__);
 +
 +	/*
-+	 * telling the driver which partition to use
-+	 */
-+	func_data.data0_size = sizeof(part_id);
-+	func_data.data0 = &part_id;
-+
-+	/*
 +	 * setting the buffer ready event arguments
 +	 */
-+	msg.a3 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID;
-+	msg.a4 = capsule_image_size;
-+	msg.a5 = CORSTONE1000_BUFFER_READY_EVT;
-+
-+	func_data.data1_size = sizeof(msg);
-+	func_data.data1 = &msg;
++	msg.data0 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
++	msg.data1 = capsule_image_size; /* x4 */
++	msg.data2 = CORSTONE1000_BUFFER_READY_EVT; /* x5 */
 +
-+	return ffa_helper_msg_send_direct_req(&func_data);
++	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_ID, &msg);
 +}
 +#endif
 +
  /**
   * efi_update_capsule() - process information from operating system
   * @capsule_header_array:	Array of virtual address pointers
-@@ -525,7 +616,7 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -525,7 +605,7 @@ static efi_status_t efi_capsule_update_firmware(
   *
   * Return:			status code
   */
@@ -258,7 +237,7 @@ index a6b98f066a0b..a0689ba912fc 100644
  		struct efi_capsule_header **capsule_header_array,
  		efi_uintn_t capsule_count,
  		u64 scatter_gather_list)
-@@ -542,6 +633,13 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -542,6 +622,13 @@ efi_status_t EFIAPI efi_update_capsule(
  		goto out;
  	}
  
@@ -272,7 +251,7 @@ index a6b98f066a0b..a0689ba912fc 100644
  	ret = EFI_SUCCESS;
  	for (i = 0, capsule = *capsule_header_array; i < capsule_count;
  	     i++, capsule = *(++capsule_header_array)) {
-@@ -554,6 +652,39 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -554,6 +641,39 @@ efi_status_t EFIAPI efi_update_capsule(
  
  		log_debug("Capsule[%d] (guid:%pUs)\n",
  			  i, &capsule->capsule_guid);
@@ -312,7 +291,7 @@ index a6b98f066a0b..a0689ba912fc 100644
  		if (!guidcmp(&capsule->capsule_guid,
  			     &efi_guid_firmware_management_capsule_id)) {
  			ret  = efi_capsule_update_firmware(capsule);
-@@ -592,7 +723,7 @@ out:
+@@ -592,7 +712,7 @@ out:
   *
   * Return:			status code
   */
@@ -322,7 +301,7 @@ index a6b98f066a0b..a0689ba912fc 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 492ecf4cb15c..bfd4687e10b5 100644
+index 492ecf4cb1..bfd4687e10 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -16,6 +16,13 @@
@@ -355,5 +334,5 @@ index 492ecf4cb15c..bfd4687e10b5 100644
  		ret = efi_set_variable_int(u"CapsuleMax",
  					   &efi_guid_capsule_report,
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-corstone1000-Update-FFA-shared-buffer-address.patch
similarity index 72%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-corstone1000-Update-FFA-shared-buffer-address.patch
index d1e13f68..7f5464c8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-corstone1000-Update-FFA-shared-buffer-address.patch
@@ -1,7 +1,7 @@
-From 1ff229c8e02bdd3c859d581787636cfdf674eec1 Mon Sep 17 00:00:00 2001
+From a84f6be14f1bb31edea987fc02efd5a079a28db1 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:28:06 +0000
-Subject: [PATCH 12/24] corstone1000: Update FFA shared buffer address
+Subject: [PATCH 17/26] corstone1000: Update FFA shared buffer address
 
 FFA shared buffer address changed to 0x02000000.
 
@@ -10,28 +10,25 @@ Optee so the virtual address returned to the SMM gateway is 0x0000.
 So the buffer is moved to 0x02000000.
 
 Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-%% original patch: 0025-Update-FFA-shared-buffer-address.patch
-
-%% original patch: 0025-Update-FFA-shared-buffer-address.patch
-
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  include/configs/corstone1000.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index a400cdef69d0..db0f91335cef 100644
+index fe5ec0adcd..2d89a8966e 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -45,7 +45,7 @@
+@@ -38,7 +38,7 @@
   * shared buffer physical address used for communication between
   * u-boot and the MM SP
   */
 -#define FFA_SHARED_MM_BUFFER_ADDR	(0x023F8000)
 +#define FFA_SHARED_MM_BUFFER_ADDR	(0x02000000)
+ #define FFA_SHARED_MM_BUFFER_OFFSET	(0)
  
  #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
- #define CONFIG_SKIP_LOWLEVEL_INIT
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm-corstone1000-fix-unrecognized-filesystem-type.patch
similarity index 76%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm-corstone1000-fix-unrecognized-filesystem-type.patch
index 31517410..1a28d6ca 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm-corstone1000-fix-unrecognized-filesystem-type.patch
@@ -1,18 +1,19 @@
-From 340ba3fbb0ea388578e30aede92695886f221eaf Mon Sep 17 00:00:00 2001
+From 3f8d35ccbb0d59d4820b81f7f939ada95b3cd92c Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 14/24] arm: corstone1000: fix unrecognized filesystem type
+Subject: [PATCH 18/26] arm: corstone1000: fix unrecognized filesystem type
 
 Some usb sticks are not recognized by usb, just add a
 delay before checking status.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  common/usb_storage.c | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/common/usb_storage.c b/common/usb_storage.c
-index eaa31374ef73..79cf4297d4f4 100644
+index eaa31374ef..79cf4297d4 100644
 --- a/common/usb_storage.c
 +++ b/common/usb_storage.c
 @@ -784,6 +784,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *srb, struct us_data *us)
@@ -26,5 +27,5 @@ index eaa31374ef73..79cf4297d4f4 100644
  	result = usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
  				&actlen, USB_CNTL_TIMEOUT*5);
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
deleted file mode 100644
index f858a26e..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 460406b46b51b6c585788001147a8961c95cc73c Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Sat, 11 Dec 2021 21:05:10 +0000
-Subject: [PATCH 18/24] arm_ffa: removing the cast when using binary OR on
- FIELD_PREP macros
-
-When the GENMASK used is above 16-bits wide a u16 cast will cause
-loss of data.
-
-This commit fixes that.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/arm-ffa/arm_ffa_prv.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/arm-ffa/arm_ffa_prv.h b/drivers/arm-ffa/arm_ffa_prv.h
-index 38ea4ba83efc..d0db3ef508a1 100644
---- a/drivers/arm-ffa/arm_ffa_prv.h
-+++ b/drivers/arm-ffa/arm_ffa_prv.h
-@@ -40,13 +40,13 @@
- 
- #define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
- #define PREP_SELF_ENDPOINT_ID(x)		\
--			((u16)(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x))))
-+			(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x)))
- 
- /* Partition endpoint ID mask  (partition with which u-boot communicates with) */
- 
- #define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
- #define PREP_PART_ENDPOINT_ID(x)		\
--			((u16)(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x))))
-+			(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x)))
- 
- /* The FF-A SMC function prototype definition */
- 
--- 
-2.37.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Use-correct-buffer-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Use-correct-buffer-size.patch
deleted file mode 100644
index af857f41..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Use-correct-buffer-size.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 936c857add300f41bc58c300793a0e10b48ff69f Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Mon, 13 Dec 2021 15:25:23 +0000
-Subject: [PATCH 19/24] Use correct buffer size
-
-The comm buffer created has additional 4 bytes length which
-needs to be trimmed. This change will reduce the size of the
-comm buffer to what is expected.
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- include/mm_communication.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/mm_communication.h b/include/mm_communication.h
-index e65fbde60d0a..bb9919095649 100644
---- a/include/mm_communication.h
-+++ b/include/mm_communication.h
-@@ -123,7 +123,7 @@ struct __packed efi_mm_communicate_header {
-  *
-  * Defined in EDK2 as SMM_VARIABLE_COMMUNICATE_HEADER.
-  */
--struct smm_variable_communicate_header {
-+struct __packed smm_variable_communicate_header {
- 	efi_uintn_t  function;
- 	efi_status_t ret_status;
- 	u8           data[];
-@@ -145,7 +145,7 @@ struct smm_variable_communicate_header {
-  * Defined in EDK2 as SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE.
-  *
-  */
--struct smm_variable_access {
-+struct __packed smm_variable_access {
- 	efi_guid_t  guid;
- 	efi_uintn_t data_size;
- 	efi_uintn_t name_size;
--- 
-2.37.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
similarity index 73%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
index 4e3f237f..3d8a6216 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
@@ -1,7 +1,7 @@
-From 4c249de0915750b328e456c34f18546f92850afd Mon Sep 17 00:00:00 2001
+From 3bb5826af8e3891617d41a30419de0ce089f9fc3 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:03:35 +0000
-Subject: [PATCH 15/24] efi_capsule: corstone1000: pass interface id and buffer
+Subject: [PATCH 19/26] efi_capsule: corstone1000: pass interface id and buffer
  event id using register w4
 
 Initially the interface/event IDs are passed to the SP using register
@@ -16,13 +16,14 @@ firmware update.
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  include/configs/corstone1000.h |  6 ++++++
  lib/efi_loader/efi_capsule.c   | 11 +++++++----
  2 files changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index db0f91335cef..a7445e61348b 100644
+index 2d89a8966e..4637dd5d5d 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -24,6 +24,12 @@
@@ -39,20 +40,20 @@ index db0f91335cef..a7445e61348b 100644
  #define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
  
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index a0689ba912fc..e08e97cf3fb7 100644
+index c0f3427a60..bf8bd68256 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -28,6 +28,8 @@
  #ifdef CONFIG_TARGET_CORSTONE1000
- #include <arm_ffa_helper.h>
+ #include <arm_ffa.h>
  #include <cpu_func.h>
 +#include <linux/bitfield.h>
 +#include <linux/bitops.h>
  
  void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared buffer virtual address */
  efi_guid_t corstone1000_capsule_guid = EFI_CORSTONE1000_CAPSULE_ID_GUID;
-@@ -590,11 +592,12 @@ static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_s
- 	func_data.data0 = &part_id;
+@@ -582,11 +584,12 @@ static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_s
+ 	log_debug("[%s]\n", __func__);
  
  	/*
 -	 * setting the buffer ready event arguments
@@ -60,14 +61,14 @@ index a0689ba912fc..e08e97cf3fb7 100644
 +	 * - capsule update interface ID (31:16)
 +	 * - the buffer ready event ID (15:0)
  	 */
--	msg.a3 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID;
--	msg.a4 = capsule_image_size;
--	msg.a5 = CORSTONE1000_BUFFER_READY_EVT;
-+	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
-+		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT);
+-	msg.data0 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
+-	msg.data1 = capsule_image_size; /* x4 */
+-	msg.data2 = CORSTONE1000_BUFFER_READY_EVT; /* x5 */
++	msg.data1 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
++		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
  
- 	func_data.data1_size = sizeof(msg);
- 	func_data.data1 = &msg;
+ 	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_ID, &msg);
+ }
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
similarity index 65%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
index e134f23a..db2ff32c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
@@ -1,7 +1,7 @@
-From e5e1cf36cb7b77a5bb526f1744c0c77164374ca3 Mon Sep 17 00:00:00 2001
+From 668fe40ccb0db5542ef333cd4655511dbb8572f9 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:10:41 +0000
-Subject: [PATCH 16/24] efi_boottime: corstone1000: pass interface id and
+Subject: [PATCH 20/26] efi_boottime: corstone1000: pass interface id and
  kernel event id using register w4
 
 Initially the interface/event IDs are passed to the SP using register
@@ -16,16 +16,17 @@ secure enclave just before ExitbootService().
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  lib/efi_loader/efi_boottime.c | 13 ++++++++++---
  1 file changed, 10 insertions(+), 3 deletions(-)
 
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index f2b5c7834c01..140d0f4f71da 100644
+index 9bf2596597..de815484d2 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -27,6 +27,11 @@
- #include <arm_ffa_helper.h>
+ #include <arm_ffa.h>
  #endif
  
 +#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
@@ -36,8 +37,8 @@ index f2b5c7834c01..140d0f4f71da 100644
  DECLARE_GLOBAL_DATA_PTR;
  
  /* Task priority level */
-@@ -2120,10 +2125,12 @@ static int efi_corstone1000_kernel_started_event(void)
- 	func_data.data0 = &part_id;
+@@ -2112,10 +2117,12 @@ static int efi_corstone1000_kernel_started_event(void)
+ 	log_debug("[%s]\n", __func__);
  
  	/*
 -	 * setting the kernel started  event arguments
@@ -45,13 +46,13 @@ index f2b5c7834c01..140d0f4f71da 100644
 +	 * setting capsule update interface ID(31:16)
 +	 * the kernel started event ID(15:0)
  	 */
--	msg.a3 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID;
--	msg.a5 = CORSTONE1000_KERNEL_STARTED_EVT;
-+	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
-+	PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT);
+-	msg.data0 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
+-	msg.data2 = CORSTONE1000_KERNEL_STARTED_EVT; /* x5 */
++	msg.data1 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
++		PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT); /* w4 */
  
- 	func_data.data1_size = sizeof(msg);
- 	func_data.data1 = &msg;
+ 	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_ID, &msg);
+ }
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_loader-corstone1000-remove-guid-check-from-corst.patch
similarity index 79%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_loader-corstone1000-remove-guid-check-from-corst.patch
index b5a17156..38ef1c08 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_loader-corstone1000-remove-guid-check-from-corst.patch
@@ -1,7 +1,7 @@
-From 596cf4d04580b191d2f4f6082000534bdab13791 Mon Sep 17 00:00:00 2001
+From 4d7fd850347dbea10a73cd5cf6eb518607118414 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH 17/24] efi_loader: corstone1000: remove guid check from
+Subject: [PATCH 21/26] efi_loader: corstone1000: remove guid check from
  corstone1000 config option
 
 Use generic fmp guid and no separte check is required for
@@ -9,15 +9,16 @@ CORSTONE1000 target.
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  lib/efi_loader/efi_capsule.c | 16 +---------------
  1 file changed, 1 insertion(+), 15 deletions(-)
 
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index e08e97cf3fb7..891143c33909 100644
+index bf8bd68256..5db9d30d53 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -657,12 +657,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+@@ -646,12 +646,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
  			  i, &capsule->capsule_guid);
  
  #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
@@ -30,7 +31,7 @@ index e08e97cf3fb7..891143c33909 100644
  		if (efi_size_in_pages(capsule->capsule_image_size) >
  		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
  			log_err("Corstone1000: Capsule data size exceeds the shared buffer size\n");
-@@ -688,15 +682,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+@@ -677,15 +671,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
  		goto out;
  #endif
  
@@ -48,5 +49,5 @@ index e08e97cf3fb7..891143c33909 100644
  			goto out;
  	}
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
similarity index 75%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
index 1204f2a4..3cedaa7a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,7 +1,7 @@
-From 5c57ef351882afebde479de430acf2c4f8fdefc8 Mon Sep 17 00:00:00 2001
+From 720e5ada733b0f7b019baaec57d74603a9dff67e Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH 20/24] efi_loader: populate ESRT table if EFI_ESRT config
+Subject: [PATCH 22/26] efi_loader: populate ESRT table if EFI_ESRT config
  option is set
 
 This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
@@ -9,15 +9,16 @@ is set. This will populte esrt table with firmware image info
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  lib/efi_loader/efi_capsule.c | 7 +++++++
  1 file changed, 7 insertions(+)
 
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 891143c33909..7db78f1f7648 100644
+index 5db9d30d53..65e2fc8296 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -679,6 +679,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+@@ -668,6 +668,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
  			ret = EFI_SUCCESS;
  		}
  
@@ -32,5 +33,5 @@ index 891143c33909..7db78f1f7648 100644
  #endif
  
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_firmware-add-get_image_info-for-corstone1000.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
index 8f86b653..f6aafa35 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_firmware-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
@@ -1,22 +1,20 @@
-From fcd1dc670d83bd7e7528370d0d6f168bfb44054d Mon Sep 17 00:00:00 2001
+From 2cad562823976134f201d6e2ef187bf103e17d1e Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH 21/24] efi_firmware: add get_image_info for corstone1000
+Subject: [PATCH 23/26] efi_firmware: add get_image_info for corstone1000
 
 This change is to populate get_image_info which eventually
 will be populated in ESRT table
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-%% original patch: 0047-efi_firmware-add-get_image_info-for-corstone1000.patch
-
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  lib/efi_loader/efi_firmware.c | 71 ++++++++++++++++++++++++++++++++++-
  1 file changed, 70 insertions(+), 1 deletion(-)
 
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
-index 30cafd15caac..af43d4502f92 100644
+index 30cafd15ca..af43d4502f 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -17,11 +17,69 @@
@@ -120,5 +118,5 @@ index 30cafd15caac..af43d4502f92 100644
  			     NULL, NULL))
  		return EFI_EXIT(EFI_DEVICE_ERROR);
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-efi_loader-send-bootcomplete-message-to-secure-encla.patch
similarity index 69%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-efi_loader-send-bootcomplete-message-to-secure-encla.patch
index 1dc04553..35f5cb23 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-efi_loader-send-bootcomplete-message-to-secure-encla.patch
@@ -1,7 +1,7 @@
-From 902d5c499b6627a505986d298986a4ac430592b8 Mon Sep 17 00:00:00 2001
+From 709e5d8ff07474f840f1d34d3077135f77795452 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 5 Jan 2022 17:56:09 +0000
-Subject: [PATCH 22/24] efi_loader: send bootcomplete message to secure enclave
+Date: Mon, 15 Aug 2022 15:46:18 +0100
+Subject: [PATCH 24/26] efi_loader: send bootcomplete message to secure enclave
 
 On corstone1000 platform, Secure Enclave will be expecting
 an event from uboot when it performs capsule update. Previously,
@@ -11,15 +11,17 @@ to send an uboot efi initialized event at efi sub-system initialization
 stage.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  include/configs/corstone1000.h |  2 +-
- lib/efi_loader/efi_boottime.c  | 49 ----------------------------------
+ lib/efi_loader/efi_boottime.c  | 43 ----------------------------------
  lib/efi_loader/efi_firmware.c  |  2 +-
- lib/efi_loader/efi_setup.c     | 48 +++++++++++++++++++++++++++++++++
- 4 files changed, 50 insertions(+), 51 deletions(-)
+ lib/efi_loader/efi_setup.c     | 39 ++++++++++++++++++++++++++++++
+ 4 files changed, 41 insertions(+), 45 deletions(-)
 
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index a7445e61348b..06b605e43bdf 100644
+index 4637dd5d5d..333b1d93b6 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -22,7 +22,7 @@
@@ -32,10 +34,22 @@ index a7445e61348b..06b605e43bdf 100644
  #define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
  #define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (x)))
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
-index 140d0f4f71da..6b9f5cf272b8 100644
+index de815484d2..cede7826bd 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
-@@ -2100,46 +2100,6 @@ static void efi_exit_caches(void)
+@@ -27,11 +27,6 @@
+ #include <arm_ffa.h>
+ #endif
+ 
+-#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
+-#include <linux/bitfield.h>
+-#include <linux/bitops.h>
+-#endif
+-
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+ /* Task priority level */
+@@ -2100,35 +2095,6 @@ static void efi_exit_caches(void)
  #endif
  }
  
@@ -51,30 +65,19 @@ index 140d0f4f71da..6b9f5cf272b8 100644
 - */
 -static int efi_corstone1000_kernel_started_event(void)
 -{
--	struct ffa_interface_data func_data = {0};
 -	struct ffa_send_direct_data msg = {0};
--	u16 part_id = CORSTONE1000_SEPROXY_PART_ID;
 -
 -	log_debug("[%s]\n", __func__);
 -
 -	/*
--	 * telling the driver which partition to use
--	 */
--	func_data.data0_size = sizeof(part_id);
--	func_data.data0 = &part_id;
--
--	/*
 -	 * setting the kernel started  event arguments:
 -	 * setting capsule update interface ID(31:16)
 -	 * the kernel started event ID(15:0)
 -	 */
--	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
--	PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT);
--
--	func_data.data1_size = sizeof(msg);
--	func_data.data1 = &msg;
+-	msg.data1 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
+-		PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT); /* w4 */
 -
--	return ffa_helper_msg_send_direct_req(&func_data);
+-	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_ID, &msg);
 -}
 -
 -#endif
@@ -82,7 +85,7 @@ index 140d0f4f71da..6b9f5cf272b8 100644
  /**
   * efi_exit_boot_services() - stop all boot services
   * @image_handle: handle of the loaded image
-@@ -2253,15 +2213,6 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
+@@ -2244,15 +2210,6 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
  	/* Recalculate CRC32 */
  	efi_update_table_header_crc32(&systab.hdr);
  
@@ -99,7 +102,7 @@ index 140d0f4f71da..6b9f5cf272b8 100644
  	efi_set_watchdog(0);
  	WATCHDOG_RESET();
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
-index af43d4502f92..25f427b93669 100644
+index af43d4502f..25f427b936 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -47,7 +47,7 @@ static efi_status_t efi_corstone1000_img_info_get (
@@ -112,7 +115,7 @@ index af43d4502f92..25f427b93669 100644
  	}
  
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index bfd4687e10b5..a20128e9b582 100644
+index bfd4687e10..6c9e14c37e 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -17,6 +17,9 @@
@@ -121,11 +124,11 @@ index bfd4687e10b5..a20128e9b582 100644
  #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
 +#include <linux/bitfield.h>
 +#include <linux/bitops.h>
-+#include <arm_ffa_helper.h>
++#include <arm_ffa.h>
  /**
   * efi_corstone1000_alloc_capsule_shared_buf - allocate capsule shared buffer
   */
-@@ -126,6 +129,44 @@ static efi_status_t efi_init_secure_boot(void)
+@@ -126,6 +129,34 @@ static efi_status_t efi_init_secure_boot(void)
  }
  #endif /* CONFIG_EFI_SECURE_BOOT */
  
@@ -141,42 +144,31 @@ index bfd4687e10b5..a20128e9b582 100644
 + * */
 +static int efi_corstone1000_uboot_efi_started_event(void)
 +{
-+	struct ffa_interface_data func_data = {0};
 +	struct ffa_send_direct_data msg = {0};
-+	u16 part_id = CORSTONE1000_SEPROXY_PART_ID;
 +
 +	log_debug("[%s]\n", __func__);
 +
 +	/*
-+	 * telling the driver which partition to use
-+	 */
-+	func_data.data0_size = sizeof(part_id);
-+	func_data.data0 = &part_id;
-+	/*
-+	 * setting the uboot efi subsystem started  event arguments:
++	 * setting the kernel started  event arguments:
 +	 * setting capsule update interface ID(31:16)
-+	 * the uboot efi subsystem started event ID(15:0)
++	 * the kernel started event ID(15:0)
 +	 */
-+	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
-+			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT);
++	msg.data1 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
++			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
 +
-+	func_data.data1_size = sizeof(msg);
-+	func_data.data1 = &msg;
-+
-+	return ffa_helper_msg_send_direct_req(&func_data);
++	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_ID, &msg);
 +}
 +#endif
 +
  /**
   * efi_init_capsule - initialize capsule update state
   *
-@@ -134,8 +175,15 @@ static efi_status_t efi_init_secure_boot(void)
- static efi_status_t efi_init_capsule(void)
- {
+@@ -136,6 +167,14 @@ static efi_status_t efi_init_capsule(void)
  	efi_status_t ret = EFI_SUCCESS;
-+	int ffa_ret;
  
  #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++	int ffa_ret;
++
 +	ffa_ret = efi_corstone1000_uboot_efi_started_event();
 +	if (ffa_ret)
 +		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update service\n");
@@ -187,5 +179,5 @@ index bfd4687e10b5..a20128e9b582 100644
  	if (ret != EFI_SUCCESS) {
  		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n");
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-fix-null-pointer-exception-with-get_image.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_loader-fix-null-pointer-exception-with-get_image.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-fix-null-pointer-exception-with-get_image.patch
index 165fac5f..dc9063ac 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_loader-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-fix-null-pointer-exception-with-get_image.patch
@@ -1,7 +1,7 @@
-From 383078dde2fbf509dc3d24505f6b328316aee030 Mon Sep 17 00:00:00 2001
+From 456e616401b02a579e9ea5ec3e5ab1d1c884b389 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH 23/24] efi_loader: fix null pointer exception with
+Subject: [PATCH 25/26] efi_loader: fix null pointer exception with
  get_image_info
 
 get_img_info API implemented for corstone1000 target does not
@@ -11,12 +11,13 @@ exception.
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  lib/efi_loader/efi_firmware.c | 19 +++++++++++--------
  1 file changed, 11 insertions(+), 8 deletions(-)
 
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
-index 25f427b93669..28d9a19edb90 100644
+index 25f427b936..28d9a19edb 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -38,26 +38,29 @@ static efi_status_t efi_corstone1000_img_info_get (
@@ -58,5 +59,5 @@ index 25f427b93669..28d9a19edb90 100644
  					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
  	image_info[i].attributes_setting = IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-arm-corstone1000-add-mmc-for-fvp.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corstone1000-add-mmc-for-fvp.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-arm-corstone1000-add-mmc-for-fvp.patch
index 2b9ca780..d4bf6520 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corstone1000-add-mmc-for-fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-arm-corstone1000-add-mmc-for-fvp.patch
@@ -1,12 +1,13 @@
-From cc3356c2a30b7aa85a25e9bc7b69a03537df3f27 Mon Sep 17 00:00:00 2001
+From 5e4c819c7ab0841429016c098106615b33486c8b Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 5 Apr 2022 10:24:38 +0100
-Subject: [PATCH 24/24] arm:corstone1000: add mmc for fvp
+Subject: [PATCH 26/26] arm:corstone1000: add mmc for fvp
 
 Enable support mmc/sdcard for the corstone1000 FVP.
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  arch/arm/dts/corstone1000-fvp.dts        | 28 +++++++++++++++
  board/armltd/corstone1000/corstone1000.c | 46 ++++++++++++++++--------
@@ -15,7 +16,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  4 files changed, 69 insertions(+), 17 deletions(-)
 
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone1000-fvp.dts
-index 1fcc137a493c..26b0f1b3cea6 100644
+index 1fcc137a49..26b0f1b3ce 100644
 --- a/arch/arm/dts/corstone1000-fvp.dts
 +++ b/arch/arm/dts/corstone1000-fvp.dts
 @@ -20,4 +20,32 @@
@@ -52,7 +53,7 @@ index 1fcc137a493c..26b0f1b3cea6 100644
 +	};
  };
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
-index 2fa485ff3799..3d537d7a9052 100644
+index 2fa485ff37..3d537d7a90 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -46,22 +46,38 @@ static struct mm_region corstone1000_mem_map[] = {
@@ -110,7 +111,7 @@ index 2fa485ff3799..3d537d7a9052 100644
  		/* OCVM */
  		.virt = 0x80000000UL,
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index b042d4e49419..147c14c94865 100644
+index c299dda49f..76e07fc20c 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -38,7 +38,13 @@ CONFIG_CMD_EFIDEBUG=y
@@ -129,10 +130,10 @@ index b042d4e49419..147c14c94865 100644
  CONFIG_USB=y
  CONFIG_DM_USB=y
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index 06b605e43bdf..d9855bf91ebf 100644
+index 333b1d93b6..815239590e 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -95,7 +95,9 @@
+@@ -89,7 +89,9 @@
  #define CONFIG_SYS_MAXARGS	64	/* max command args */
  
  #define BOOT_TARGET_DEVICES(func) \
@@ -144,5 +145,5 @@ index 06b605e43bdf..d9855bf91ebf 100644
  #include <config_distro_bootcmd.h>
  
 -- 
-2.37.1
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-use-a-compressed-kernel.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-use-a-compressed-kernel.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-Introduce-external-sys-driver-to-device-tree.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-Introduce-external-sys-driver-to-device-tree.patch
index cc4ab0a3..bd9a6cf6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-Introduce-external-sys-driver-to-device-tree.patch
@@ -1,6 +1,3 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
 From 83f16fe96a86b00f7a4b7c4c4f7416119b80eddd Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Fri, 19 Aug 2022 16:04:48 +0100
@@ -10,6 +7,7 @@ It adds external sys driver binding to u-boot
 device tree.
 
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  arch/arm/dts/corstone1000.dtsi | 7 +++++++
  1 file changed, 7 insertions(+)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
similarity index 97%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
index cd01732d..57bdef45 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
@@ -1,6 +1,3 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
 From a1b8b91a43cfa9dbaa2d907a6d9629da6f93fa3e Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Mon, 12 Sep 2022 15:47:06 +0100
@@ -11,6 +8,7 @@ device tree. This enables communication between host and
 the external system.
 
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  arch/arm/dts/corstone1000.dtsi | 50 ++++++++++++++++++++++++++++++++
  1 file changed, 50 insertions(+)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 30d6b11a..420cee65 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -18,34 +18,36 @@ EXTRA_OEMAKE:append:corstone1000 = ' DEVICE_TREE=${CORSTONE1000_DEVICE_TREE}'
 SYSROOT_DIRS:append:corstone1000 = " /boot"
 
 SRC_URI:append:corstone1000 = " \
-        file://0001-cmd-load-add-load-command-for-memory-mapped.patch \
-        file://0002-arm-add-support-to-corstone1000-platform.patch \
-        file://0003-usb-common-move-urb-code-to-common.patch \
-        file://0004-usb-add-isp1760-family-driver.patch \
-        file://0005-corstone1000-enable-isp1763-usb-controller.patch \
-        file://0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch \
-        file://0007-arm_ffa-introducing-armffa-command.patch \
-        file://0008-arm_ffa-introducing-MM-communication-with-FF-A.patch \
-        file://0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch \
-        file://0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch \
-        file://0011-efi-corstone1000-introduce-EFI-capsule-update.patch \
-        file://0012-corstone1000-Update-FFA-shared-buffer-address.patch \
-        file://0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch \
-        file://0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch \
-        file://0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch \
-        file://0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch \
-        file://0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch \
-        file://0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch \
-        file://0019-Use-correct-buffer-size.patch \
-        file://0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch \
-        file://0021-efi_firmware-add-get_image_info-for-corstone1000.patch \
-        file://0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch \
-        file://0023-efi_loader-fix-null-pointer-exception-with-get_image.patch \
-        file://0024-arm-corstone1000-add-mmc-for-fvp.patch \
-        file://0025-corstone1000-use-a-compressed-kernel.patch \
-        file://0026-Introduce-external-sys-driver-to-device-tree.patch \
-        file://0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch \
-      "
+        file://0001-cmd-load-add-load-command-for-memory-mapped.patch                 \
+        file://0002-arm-add-support-to-corstone1000-platform.patch		      \
+        file://0003-usb-common-move-urb-code-to-common.patch			      \
+        file://0004-usb-add-isp1760-family-driver.patch				      \
+        file://0005-corstone1000-enable-isp1763-usb-controller.patch		      \
+        file://0006-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch	      \
+        file://0007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.patch	      \
+        file://0008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.patch	      \
+        file://0009-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch		      \
+        file://0010-arm_ffa-introduce-armffa-command.patch			      \
+        file://0011-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch		      \
+        file://0012-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch	      \
+        file://0013-arm_ffa-introduce-armffa-command-Sandbox-test.patch		      \
+        file://0014-arm_ffa-introduce-FF-A-MM-communication.patch		      \
+        file://0015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch	      \
+        file://0016-efi-corstone1000-introduce-EFI-capsule-update.patch		      \
+	file://0017-corstone1000-Update-FFA-shared-buffer-address.patch		      \
+	file://0018-arm-corstone1000-fix-unrecognized-filesystem-type.patch	      \
+	file://0019-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch	      \
+	file://0020-efi_boottime-corstone1000-pass-interface-id-and-kern.patch	      \
+        file://0021-efi_loader-corstone1000-remove-guid-check-from-corst.patch	      \
+        file://0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch	      \
+        file://0023-efi_firmware-add-get_image_info-for-corstone1000.patch	      \
+        file://0024-efi_loader-send-bootcomplete-message-to-secure-encla.patch	      \
+        file://0025-efi_loader-fix-null-pointer-exception-with-get_image.patch	      \
+        file://0026-arm-corstone1000-add-mmc-for-fvp.patch			      \
+        file://0027-corstone1000-use-a-compressed-kernel.patch \
+        file://0028-Introduce-external-sys-driver-to-device-tree.patch \
+        file://0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch \
+        "
 
 #
 # FVP BASE
-- 
2.17.1


