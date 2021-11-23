Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2E0C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:59:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13294.1637683194278276316
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DCC11063;
	Tue, 23 Nov 2021 07:59:53 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB3C23F5A1;
	Tue, 23 Nov 2021 07:59:50 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Satish Kumar <satish.kumar01@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 07/19] arm-bsp/linux: introducing corstone1000 FVP
 machine
Date: Tue, 23 Nov 2021 15:59:14 +0000
Message-Id: <20211123155926.31743-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 15:59:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2436

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit enables Linux kernel v5.10 for corstone1000-fvp
machine.

Change-Id: I882902bba273355428af06c29796358e17f9b379
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/corstone1000-fvp.conf        |    9 +
 .../conf/machine/include/corstone1000.inc     |   24 +
 .../arm-platforms/corstone1000-standard.scc   |    5 +
 .../bsp/arm-platforms/corstone1000/base.cfg   |   29 +
 ...-usb-isp1760-fix-strict-typechecking.patch |  191 ++
 ...0-move-to-regmap-for-register-access.patch | 2333 +++++++++++++++++
 ...3-usb-isp1760-use-relaxed-primitives.patch |   64 +
 ...remove-platform-data-struct-and-code.patch |   62 +
 ...cd-refactor-mempool-config-and-setup.patch |  304 +++
 ...0006-usb-isp1760-use-dr_mode-binding.patch |   78 +
 ...-usb-isp1760-add-support-for-isp1763.patch | 1894 +++++++++++++
 ...indings-usb-nxp-isp1760-add-bindings.patch |   99 +
 ...0009-usb-isp1763-add-peripheral-mode.patch |  303 +++
 ...760-udc-Provide-missing-description-.patch |   41 +
 ...Fix-meaningless-check-in-isp1763_run.patch |   38 +
 ...sp1760-remove-debug-message-as-error.patch |   32 +
 ...-do-not-sleep-in-field-register-poll.patch |   58 +
 ...rk-cache-initialization-error-handli.patch |   55 +
 ...re-return-value-for-bus-change-patte.patch |   55 +
 ...-check-maxpacketsize-before-using-it.patch |   40 +
 ...0029-usb-isp1760-do-not-reset-retval.patch |   36 +
 ...0-do-not-shift-in-uninitialized-slot.patch |   61 +
 ...clean-never-read-udc_enabled-warning.patch |   52 +
 ...p1760-fix-memory-pool-initialization.patch |   36 +
 ...0033-usb-isp1760-fix-qtd-fill-length.patch |   38 +
 ...write-to-status-and-address-register.patch |   90 +
 ...isp1760-use-the-right-irq-status-bit.patch |   72 +
 ...-isp1760-otg-control-register-access.patch |  134 +
 .../corstone1000_kernel_debug.cfg             |    3 +
 .../linux/files/corstone1000/defconfig        |   88 +
 .../linux/linux-arm-platforms.inc             |   68 +
 31 files changed, 6392 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone1000-fvp.conf
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000-standard.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000/base.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-usb-isp1760-fix-strict-typechecking.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-usb-isp1760-move-to-regmap-for-register-access.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-usb-isp1760-use-relaxed-primitives.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-usb-isp1760-remove-platform-data-struct-and-code.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-usb-isp1760-use-dr_mode-binding.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0007-usb-isp1760-add-support-for-isp1763.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0009-usb-isp1763-add-peripheral-mode.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0024-usb-isp1760-remove-debug-message-as-error.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0026-usb-isp1760-rework-cache-initialization-error-handli.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0028-usb-isp1760-check-maxpacketsize-before-using-it.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0029-usb-isp1760-do-not-reset-retval.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0032-usb-isp1760-fix-memory-pool-initialization.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0033-usb-isp1760-fix-qtd-fill-length.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0034-usb-isp1760-write-to-status-and-address-register.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0035-usb-isp1760-use-the-right-irq-status-bit.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0036-usb-isp1760-otg-control-register-access.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/corstone1000_kernel_debug.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
new file mode 100644
index 0000000..fc69fe8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -0,0 +1,9 @@
+#@TYPE: Machine
+#@NAME: corstone1000-fvp machine
+#@DESCRIPTION: Machine configuration for Corstone1000 64-bit FVP
+
+require conf/machine/include/corstone1000.inc
+
+TFA_TARGET_PLATFORM = "fvp"
+
+TFM_PLATFORM_IS_FVP = "TRUE"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
new file mode 100644
index 0000000..3d06143
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -0,0 +1,24 @@
+require conf/machine/include/arm/armv8a/tune-cortexa35.inc
+
+MACHINEOVERRIDES =. "corstone1000:"
+
+# Linux kernel
+PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
+PREFERRED_VERSION_linux-yocto = "5.10%"
+KERNEL_IMAGETYPE = "Image"
+
+INITRAMFS_IMAGE_BUNDLE ?= "1"
+
+#telling the build system which image is responsible of the generation of the initramfs rootfs
+INITRAMFS_IMAGE = "corstone1000-initramfs-image"
+
+# enable this feature for kernel debugging
+# MACHINE_FEATURES += "corstone1000_kernel_debug"
+
+# login terminal serial port settings
+SERIAL_CONSOLES ?= "115200;ttyAMA0"
+
+# making sure EXTRA_IMAGEDEPENDS will be used while creating the image
+WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
+
+WKS_FILE ?= "corstone1000-image.corstone1000.wks"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000-standard.scc
new file mode 100644
index 0000000..9278ce1
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000-standard.scc
@@ -0,0 +1,5 @@
+define KMACHINE corstone1000
+define KTYPE standard
+define KARCH arm64
+
+kconf hardware corstone1000/base.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000/base.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000/base.cfg
new file mode 100644
index 0000000..aea1d84
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000/base.cfg
@@ -0,0 +1,29 @@
+CONFIG_LOCALVERSION="-yocto-standard"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_LOG_BUF_SHIFT=12
+# CONFIG_UTS_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_ARM64=y
+CONFIG_THUMB2_KERNEL=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_VFP=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_TMPFS=y
+# CONFIG_WLAN is not set
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_MAILBOX=y
+# CONFIG_CRYPTO_HW is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-usb-isp1760-fix-strict-typechecking.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-usb-isp1760-fix-strict-typechecking.patch
new file mode 100644
index 0000000..1b1cb96
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-usb-isp1760-fix-strict-typechecking.patch
@@ -0,0 +1,191 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From abfabc8ae3bd625f57fa35d25f2435bb6465a3b1 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:09 +0100
+Subject: [PATCH 01/23] usb: isp1760: fix strict typechecking
+
+There are a lot of pre-existing typechecking warnings around the
+access and assign of elements of ptd structure of __dw type.
+
+sparse: warning: invalid assignment: |=
+sparse:    left side has type restricted __dw
+sparse:    right side has type unsigned int
+
+or
+
+warning: restricted __dw degrades to integer
+
+or
+
+sparse: warning: incorrect type in assignment (different base types)
+sparse:    expected restricted __dw [usertype] dw4
+sparse:    got unsigned int [assigned] [usertype] usof
+
+To handle this, annotate conversions along the {TO,FROM}_DW* macros
+and some assignments and function arguments.
+
+This clean up completely all sparse warnings for this driver.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-2-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 92 ++++++++++++++++---------------
+ 1 file changed, 47 insertions(+), 45 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 33ae656c4b68..0e0a4b01c710 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -66,44 +66,46 @@ struct ptd {
+ #define ATL_PTD_OFFSET		0x0c00
+ #define PAYLOAD_OFFSET		0x1000
+ 
+-
+-/* ATL */
+-/* DW0 */
+-#define DW0_VALID_BIT			1
+-#define FROM_DW0_VALID(x)		((x) & 0x01)
+-#define TO_DW0_LENGTH(x)		(((u32) x) << 3)
+-#define TO_DW0_MAXPACKET(x)		(((u32) x) << 18)
+-#define TO_DW0_MULTI(x)			(((u32) x) << 29)
+-#define TO_DW0_ENDPOINT(x)		(((u32)	x) << 31)
++#define TO_DW(x)	((__force __dw)x)
++#define TO_U32(x)	((__force u32)x)
++
++ /* ATL */
++ /* DW0 */
++#define DW0_VALID_BIT			TO_DW(1)
++#define FROM_DW0_VALID(x)		(TO_U32(x) & 0x01)
++#define TO_DW0_LENGTH(x)		TO_DW((((u32)x) << 3))
++#define TO_DW0_MAXPACKET(x)		TO_DW((((u32)x) << 18))
++#define TO_DW0_MULTI(x)			TO_DW((((u32)x) << 29))
++#define TO_DW0_ENDPOINT(x)		TO_DW((((u32)x) << 31))
+ /* DW1 */
+-#define TO_DW1_DEVICE_ADDR(x)		(((u32) x) << 3)
+-#define TO_DW1_PID_TOKEN(x)		(((u32) x) << 10)
+-#define DW1_TRANS_BULK			((u32) 2 << 12)
+-#define DW1_TRANS_INT			((u32) 3 << 12)
+-#define DW1_TRANS_SPLIT			((u32) 1 << 14)
+-#define DW1_SE_USB_LOSPEED		((u32) 2 << 16)
+-#define TO_DW1_PORT_NUM(x)		(((u32) x) << 18)
+-#define TO_DW1_HUB_NUM(x)		(((u32) x) << 25)
++#define TO_DW1_DEVICE_ADDR(x)		TO_DW((((u32)x) << 3))
++#define TO_DW1_PID_TOKEN(x)		TO_DW((((u32)x) << 10))
++#define DW1_TRANS_BULK			TO_DW(((u32)2 << 12))
++#define DW1_TRANS_INT			TO_DW(((u32)3 << 12))
++#define DW1_TRANS_SPLIT			TO_DW(((u32)1 << 14))
++#define DW1_SE_USB_LOSPEED		TO_DW(((u32)2 << 16))
++#define TO_DW1_PORT_NUM(x)		TO_DW((((u32)x) << 18))
++#define TO_DW1_HUB_NUM(x)		TO_DW((((u32)x) << 25))
+ /* DW2 */
+-#define TO_DW2_DATA_START_ADDR(x)	(((u32) x) << 8)
+-#define TO_DW2_RL(x)			((x) << 25)
+-#define FROM_DW2_RL(x)			(((x) >> 25) & 0xf)
++#define TO_DW2_DATA_START_ADDR(x)	TO_DW((((u32)x) << 8))
++#define TO_DW2_RL(x)			TO_DW(((x) << 25))
++#define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
+ /* DW3 */
+-#define FROM_DW3_NRBYTESTRANSFERRED(x)		((x) & 0x7fff)
+-#define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	((x) & 0x07ff)
+-#define TO_DW3_NAKCOUNT(x)		((x) << 19)
+-#define FROM_DW3_NAKCOUNT(x)		(((x) >> 19) & 0xf)
+-#define TO_DW3_CERR(x)			((x) << 23)
+-#define FROM_DW3_CERR(x)		(((x) >> 23) & 0x3)
+-#define TO_DW3_DATA_TOGGLE(x)		((x) << 25)
+-#define FROM_DW3_DATA_TOGGLE(x)		(((x) >> 25) & 0x1)
+-#define TO_DW3_PING(x)			((x) << 26)
+-#define FROM_DW3_PING(x)		(((x) >> 26) & 0x1)
+-#define DW3_ERROR_BIT			(1 << 28)
+-#define DW3_BABBLE_BIT			(1 << 29)
+-#define DW3_HALT_BIT			(1 << 30)
+-#define DW3_ACTIVE_BIT			(1 << 31)
+-#define FROM_DW3_ACTIVE(x)		(((x) >> 31) & 0x01)
++#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x7fff)
++#define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	TO_U32((x) & 0x07ff)
++#define TO_DW3_NAKCOUNT(x)		TO_DW(((x) << 19))
++#define FROM_DW3_NAKCOUNT(x)		((TO_U32(x) >> 19) & 0xf)
++#define TO_DW3_CERR(x)			TO_DW(((x) << 23))
++#define FROM_DW3_CERR(x)		((TO_U32(x) >> 23) & 0x3)
++#define TO_DW3_DATA_TOGGLE(x)		TO_DW(((x) << 25))
++#define FROM_DW3_DATA_TOGGLE(x)		((TO_U32(x) >> 25) & 0x1)
++#define TO_DW3_PING(x)			TO_DW(((x) << 26))
++#define FROM_DW3_PING(x)		((TO_U32(x) >> 26) & 0x1)
++#define DW3_ERROR_BIT			TO_DW((1 << 28))
++#define DW3_BABBLE_BIT			TO_DW((1 << 29))
++#define DW3_HALT_BIT			TO_DW((1 << 30))
++#define DW3_ACTIVE_BIT			TO_DW((1 << 31))
++#define FROM_DW3_ACTIVE(x)		((TO_U32(x) >> 31) & 0x01)
+ 
+ #define INT_UNDERRUN			(1 << 2)
+ #define INT_BABBLE			(1 << 1)
+@@ -292,12 +294,12 @@ static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
+ 								struct ptd *ptd)
+ {
+ 	mem_writes8(base, ptd_offset + slot*sizeof(*ptd) + sizeof(ptd->dw0),
+-						&ptd->dw1, 7*sizeof(ptd->dw1));
++		    (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
+ 	/* Make sure dw0 gets written last (after other dw's and after payload)
+ 	   since it contains the enable bit */
+ 	wmb();
+-	mem_writes8(base, ptd_offset + slot*sizeof(*ptd), &ptd->dw0,
+-							sizeof(ptd->dw0));
++	mem_writes8(base, ptd_offset + slot * sizeof(*ptd),
++		    (__force u32 *)&ptd->dw0, sizeof(ptd->dw0));
+ }
+ 
+ 
+@@ -553,7 +555,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
+ 	ptd->dw0 |= TO_DW0_ENDPOINT(usb_pipeendpoint(qtd->urb->pipe));
+ 
+ 	/* DW1 */
+-	ptd->dw1 = usb_pipeendpoint(qtd->urb->pipe) >> 1;
++	ptd->dw1 = TO_DW((usb_pipeendpoint(qtd->urb->pipe) >> 1));
+ 	ptd->dw1 |= TO_DW1_DEVICE_ADDR(usb_pipedevice(qtd->urb->pipe));
+ 	ptd->dw1 |= TO_DW1_PID_TOKEN(qtd->packet_type);
+ 
+@@ -575,7 +577,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
+ 		/* SE bit for Split INT transfers */
+ 		if (usb_pipeint(qtd->urb->pipe) &&
+ 				(qtd->urb->dev->speed == USB_SPEED_LOW))
+-			ptd->dw1 |= 2 << 16;
++			ptd->dw1 |= DW1_SE_USB_LOSPEED;
+ 
+ 		rl = 0;
+ 		nak = 0;
+@@ -647,14 +649,14 @@ static void transform_add_int(struct isp1760_qh *qh,
+ 		 * that number come from? 0xff seems to work fine...
+ 		 */
+ 		/* ptd->dw5 = 0x1c; */
+-		ptd->dw5 = 0xff; /* Execute Complete Split on any uFrame */
++		ptd->dw5 = TO_DW(0xff); /* Execute Complete Split on any uFrame */
+ 	}
+ 
+ 	period = period >> 1;/* Ensure equal or shorter period than requested */
+ 	period &= 0xf8; /* Mask off too large values and lowest unused 3 bits */
+ 
+-	ptd->dw2 |= period;
+-	ptd->dw4 = usof;
++	ptd->dw2 |= TO_DW(period);
++	ptd->dw4 = TO_DW(usof);
+ }
+ 
+ static void create_ptd_int(struct isp1760_qh *qh,
+@@ -977,10 +979,10 @@ static void schedule_ptds(struct usb_hcd *hcd)
+ static int check_int_transfer(struct usb_hcd *hcd, struct ptd *ptd,
+ 								struct urb *urb)
+ {
+-	__dw dw4;
++	u32 dw4;
+ 	int i;
+ 
+-	dw4 = ptd->dw4;
++	dw4 = TO_U32(ptd->dw4);
+ 	dw4 >>= 8;
+ 
+ 	/* FIXME: ISP1761 datasheet does not say what to do with these. Do we
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-usb-isp1760-move-to-regmap-for-register-access.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-usb-isp1760-move-to-regmap-for-register-access.patch
new file mode 100644
index 0000000..a386296
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-usb-isp1760-move-to-regmap-for-register-access.patch
@@ -0,0 +1,2333 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 1da9e1c06873350c99ba49a052f92de85f2c69f2 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:10 +0100
+Subject: [PATCH 02/23] usb: isp1760: move to regmap for register access
+
+Rework access to registers and memory to use regmap framework.
+No change in current feature or way of work is intended with this
+change.
+
+This will allow to reuse this driver with other IP of this family,
+for example isp1763, with little changes and effort.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-3-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/Kconfig        |   1 +
+ drivers/usb/isp1760/isp1760-core.c | 239 +++++++++++++---
+ drivers/usb/isp1760/isp1760-core.h |  38 ++-
+ drivers/usb/isp1760/isp1760-hcd.c  | 445 +++++++++++++++--------------
+ drivers/usb/isp1760/isp1760-hcd.h  |  18 +-
+ drivers/usb/isp1760/isp1760-if.c   |   4 +-
+ drivers/usb/isp1760/isp1760-regs.h | 338 ++++++++++------------
+ drivers/usb/isp1760/isp1760-udc.c  | 227 ++++++++++-----
+ drivers/usb/isp1760/isp1760-udc.h  |  10 +-
+ 9 files changed, 789 insertions(+), 531 deletions(-)
+
+diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
+index b1022cc490a2..d23853f601b1 100644
+--- a/drivers/usb/isp1760/Kconfig
++++ b/drivers/usb/isp1760/Kconfig
+@@ -3,6 +3,7 @@
+ config USB_ISP1760
+ 	tristate "NXP ISP 1760/1761 support"
+ 	depends on USB || USB_GADGET
++	select REGMAP_MMIO
+ 	help
+ 	  Say Y or M here if your system as an ISP1760 USB host controller
+ 	  or an ISP1761 USB dual-role controller.
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+index fdeb4cf97cc5..c79ba98df9f9 100644
+--- a/drivers/usb/isp1760/isp1760-core.c
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -15,6 +15,7 @@
+ #include <linux/io.h>
+ #include <linux/kernel.h>
+ #include <linux/module.h>
++#include <linux/regmap.h>
+ #include <linux/slab.h>
+ #include <linux/usb.h>
+ 
+@@ -25,8 +26,8 @@
+ 
+ static void isp1760_init_core(struct isp1760_device *isp)
+ {
+-	u32 otgctrl;
+-	u32 hwmode;
++	struct isp1760_hcd *hcd = &isp->hcd;
++	struct isp1760_udc *udc = &isp->udc;
+ 
+ 	/* Low-level chip reset */
+ 	if (isp->rst_gpio) {
+@@ -39,24 +40,22 @@ static void isp1760_init_core(struct isp1760_device *isp)
+ 	 * Reset the host controller, including the CPU interface
+ 	 * configuration.
+ 	 */
+-	isp1760_write32(isp->regs, HC_RESET_REG, SW_RESET_RESET_ALL);
++	isp1760_field_set(hcd->fields, SW_RESET_RESET_ALL);
+ 	msleep(100);
+ 
+ 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
+-	hwmode = HW_DATA_BUS_32BIT;
+-
+ 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
+-		hwmode &= ~HW_DATA_BUS_32BIT;
++		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
+ 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
+-		hwmode |= HW_ANA_DIGI_OC;
++		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
+ 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
+-		hwmode |= HW_DACK_POL_HIGH;
++		isp1760_field_set(hcd->fields, HW_DACK_POL_HIGH);
+ 	if (isp->devflags & ISP1760_FLAG_DREQ_POL_HIGH)
+-		hwmode |= HW_DREQ_POL_HIGH;
++		isp1760_field_set(hcd->fields, HW_DREQ_POL_HIGH);
+ 	if (isp->devflags & ISP1760_FLAG_INTR_POL_HIGH)
+-		hwmode |= HW_INTR_HIGH_ACT;
++		isp1760_field_set(hcd->fields, HW_INTR_HIGH_ACT);
+ 	if (isp->devflags & ISP1760_FLAG_INTR_EDGE_TRIG)
+-		hwmode |= HW_INTR_EDGE_TRIG;
++		isp1760_field_set(hcd->fields, HW_INTR_EDGE_TRIG);
+ 
+ 	/*
+ 	 * The ISP1761 has a dedicated DC IRQ line but supports sharing the HC
+@@ -65,18 +64,10 @@ static void isp1760_init_core(struct isp1760_device *isp)
+ 	 * spurious interrupts during HCD registration.
+ 	 */
+ 	if (isp->devflags & ISP1760_FLAG_ISP1761) {
+-		isp1760_write32(isp->regs, DC_MODE, 0);
+-		hwmode |= HW_COMN_IRQ;
++		isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
++		isp1760_field_set(hcd->fields, HW_COMN_IRQ);
+ 	}
+ 
+-	/*
+-	 * We have to set this first in case we're in 16-bit mode.
+-	 * Write it twice to ensure correct upper bits if switching
+-	 * to 16-bit mode.
+-	 */
+-	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
+-	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
+-
+ 	/*
+ 	 * PORT 1 Control register of the ISP1760 is the OTG control register
+ 	 * on ISP1761.
+@@ -85,14 +76,15 @@ static void isp1760_init_core(struct isp1760_device *isp)
+ 	 * when OTG is requested.
+ 	 */
+ 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
+-	    (isp->devflags & ISP1760_FLAG_OTG_EN))
+-		otgctrl = ((HW_DM_PULLDOWN | HW_DP_PULLDOWN) << 16)
+-			| HW_OTG_DISABLE;
+-	else
+-		otgctrl = (HW_SW_SEL_HC_DC << 16)
+-			| (HW_VBUS_DRV | HW_SEL_CP_EXT);
+-
+-	isp1760_write32(isp->regs, HC_PORT1_CTRL, otgctrl);
++	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
++		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
++		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
++		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
++	} else {
++		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
++		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
++		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
++	}
+ 
+ 	dev_info(isp->dev, "bus width: %u, oc: %s\n",
+ 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
+@@ -101,16 +93,158 @@ static void isp1760_init_core(struct isp1760_device *isp)
+ 
+ void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
+ {
+-	isp1760_write32(isp->regs, HW_OTG_CTRL_SET,
+-			enable ? HW_DP_PULLUP : HW_DP_PULLUP << 16);
++	struct isp1760_udc *udc = &isp->udc;
++
++	if (enable)
++		isp1760_field_set(udc->fields, HW_DP_PULLUP);
++	else
++		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
+ }
+ 
++static const struct regmap_range isp176x_hc_volatile_ranges[] = {
++	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
++	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
++	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
++};
++
++static const struct regmap_access_table isp176x_hc_volatile_table = {
++	.yes_ranges	= isp176x_hc_volatile_ranges,
++	.n_yes_ranges	= ARRAY_SIZE(isp176x_hc_volatile_ranges),
++};
++
++static struct regmap_config isp1760_hc_regmap_conf = {
++	.name = "isp1760-hc",
++	.reg_bits = 16,
++	.reg_stride = 4,
++	.val_bits = 32,
++	.fast_io = true,
++	.max_register = ISP176x_HC_MEMORY,
++	.volatile_table = &isp176x_hc_volatile_table,
++};
++
++static const struct reg_field isp1760_hc_reg_fields[] = {
++	[HCS_PPC]		= REG_FIELD(ISP176x_HC_HCSPARAMS, 4, 4),
++	[HCS_N_PORTS]		= REG_FIELD(ISP176x_HC_HCSPARAMS, 0, 3),
++	[HCC_ISOC_CACHE]	= REG_FIELD(ISP176x_HC_HCCPARAMS, 7, 7),
++	[HCC_ISOC_THRES]	= REG_FIELD(ISP176x_HC_HCCPARAMS, 4, 6),
++	[CMD_LRESET]		= REG_FIELD(ISP176x_HC_USBCMD, 7, 7),
++	[CMD_RESET]		= REG_FIELD(ISP176x_HC_USBCMD, 1, 1),
++	[CMD_RUN]		= REG_FIELD(ISP176x_HC_USBCMD, 0, 0),
++	[STS_PCD]		= REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
++	[HC_FRINDEX]		= REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
++	[FLAG_CF]		= REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
++	[PORT_OWNER]		= REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
++	[PORT_POWER]		= REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
++	[PORT_LSTATUS]		= REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
++	[PORT_RESET]		= REG_FIELD(ISP176x_HC_PORTSC1, 8, 8),
++	[PORT_SUSPEND]		= REG_FIELD(ISP176x_HC_PORTSC1, 7, 7),
++	[PORT_RESUME]		= REG_FIELD(ISP176x_HC_PORTSC1, 6, 6),
++	[PORT_PE]		= REG_FIELD(ISP176x_HC_PORTSC1, 2, 2),
++	[PORT_CSC]		= REG_FIELD(ISP176x_HC_PORTSC1, 1, 1),
++	[PORT_CONNECT]		= REG_FIELD(ISP176x_HC_PORTSC1, 0, 0),
++	[ALL_ATX_RESET]		= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 31, 31),
++	[HW_ANA_DIGI_OC]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 15, 15),
++	[HW_COMN_IRQ]		= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 10, 10),
++	[HW_DATA_BUS_WIDTH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 8, 8),
++	[HW_DACK_POL_HIGH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 6, 6),
++	[HW_DREQ_POL_HIGH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 5, 5),
++	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
++	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
++	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
++	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP176x_HC_RESET, 0, 0),
++	[INT_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
++	[ATL_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
++	[MEM_BANK_SEL]		= REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
++	[MEM_START_ADDR]	= REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
++	[HC_INT_ENABLE]		= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
++};
++
++static const struct regmap_range isp176x_dc_volatile_ranges[] = {
++	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
++	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
++	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
++};
++
++static const struct regmap_access_table isp176x_dc_volatile_table = {
++	.yes_ranges	= isp176x_dc_volatile_ranges,
++	.n_yes_ranges	= ARRAY_SIZE(isp176x_dc_volatile_ranges),
++};
++
++static struct regmap_config isp1761_dc_regmap_conf = {
++	.name = "isp1761-dc",
++	.reg_bits = 16,
++	.reg_stride = 4,
++	.val_bits = 32,
++	.fast_io = true,
++	.max_register = ISP1761_DC_OTG_CTRL_CLEAR,
++	.volatile_table = &isp176x_dc_volatile_table,
++};
++
++static const struct reg_field isp1761_dc_reg_fields[] = {
++	[DC_DEVEN]		= REG_FIELD(ISP176x_DC_ADDRESS, 7, 7),
++	[DC_DEVADDR]		= REG_FIELD(ISP176x_DC_ADDRESS, 0, 6),
++	[DC_VBUSSTAT]		= REG_FIELD(ISP176x_DC_MODE, 8, 8),
++	[DC_SFRESET]		= REG_FIELD(ISP176x_DC_MODE, 4, 4),
++	[DC_GLINTENA]		= REG_FIELD(ISP176x_DC_MODE, 3, 3),
++	[DC_CDBGMOD_ACK]	= REG_FIELD(ISP176x_DC_INTCONF, 6, 6),
++	[DC_DDBGMODIN_ACK]	= REG_FIELD(ISP176x_DC_INTCONF, 4, 4),
++	[DC_DDBGMODOUT_ACK]	= REG_FIELD(ISP176x_DC_INTCONF, 2, 2),
++	[DC_INTPOL]		= REG_FIELD(ISP176x_DC_INTCONF, 0, 0),
++	[DC_IEPRXTX_7]		= REG_FIELD(ISP176x_DC_INTENABLE, 25, 25),
++	[DC_IEPRXTX_6]		= REG_FIELD(ISP176x_DC_INTENABLE, 23, 23),
++	[DC_IEPRXTX_5]		= REG_FIELD(ISP176x_DC_INTENABLE, 21, 21),
++	[DC_IEPRXTX_4]		= REG_FIELD(ISP176x_DC_INTENABLE, 19, 19),
++	[DC_IEPRXTX_3]		= REG_FIELD(ISP176x_DC_INTENABLE, 17, 17),
++	[DC_IEPRXTX_2]		= REG_FIELD(ISP176x_DC_INTENABLE, 15, 15),
++	[DC_IEPRXTX_1]		= REG_FIELD(ISP176x_DC_INTENABLE, 13, 13),
++	[DC_IEPRXTX_0]		= REG_FIELD(ISP176x_DC_INTENABLE, 11, 11),
++	[DC_IEP0SETUP]		= REG_FIELD(ISP176x_DC_INTENABLE, 8, 8),
++	[DC_IEVBUS]		= REG_FIELD(ISP176x_DC_INTENABLE, 7, 7),
++	[DC_IEHS_STA]		= REG_FIELD(ISP176x_DC_INTENABLE, 5, 5),
++	[DC_IERESM]		= REG_FIELD(ISP176x_DC_INTENABLE, 4, 4),
++	[DC_IESUSP]		= REG_FIELD(ISP176x_DC_INTENABLE, 3, 3),
++	[DC_IEBRST]		= REG_FIELD(ISP176x_DC_INTENABLE, 0, 0),
++	[DC_EP0SETUP]		= REG_FIELD(ISP176x_DC_EPINDEX, 5, 5),
++	[DC_ENDPIDX]		= REG_FIELD(ISP176x_DC_EPINDEX, 1, 4),
++	[DC_EPDIR]		= REG_FIELD(ISP176x_DC_EPINDEX, 0, 0),
++	[DC_CLBUF]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 4, 4),
++	[DC_VENDP]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 3, 3),
++	[DC_DSEN]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 2, 2),
++	[DC_STATUS]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 1, 1),
++	[DC_STALL]		= REG_FIELD(ISP176x_DC_CTRLFUNC, 0, 0),
++	[DC_BUFLEN]		= REG_FIELD(ISP176x_DC_BUFLEN, 0, 15),
++	[DC_FFOSZ]		= REG_FIELD(ISP176x_DC_EPMAXPKTSZ, 0, 10),
++	[DC_EPENABLE]		= REG_FIELD(ISP176x_DC_EPTYPE, 3, 3),
++	[DC_ENDPTYP]		= REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
++	[DC_UFRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
++	[DC_FRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
++	[HW_OTG_DISABLE]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
++	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
++	[HW_VBUS_DRV]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
++	[HW_SEL_CP_EXT]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
++	[HW_DM_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
++	[HW_DP_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
++	[HW_DP_PULLUP]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
++	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
++	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
++	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
++	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
++	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
++	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
++	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
++};
++
+ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 		     struct device *dev, unsigned int devflags)
+ {
+ 	struct isp1760_device *isp;
++	struct isp1760_hcd *hcd;
++	struct isp1760_udc *udc;
+ 	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
++	struct regmap_field *f;
++	void __iomem *base;
+ 	int ret;
++	int i;
+ 
+ 	/*
+ 	 * If neither the HCD not the UDC is enabled return an error, as no
+@@ -126,19 +260,52 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 
+ 	isp->dev = dev;
+ 	isp->devflags = devflags;
++	hcd = &isp->hcd;
++	udc = &isp->udc;
++
++	if (devflags & ISP1760_FLAG_BUS_WIDTH_16) {
++		isp1760_hc_regmap_conf.val_bits = 16;
++		isp1761_dc_regmap_conf.val_bits = 16;
++	}
+ 
+ 	isp->rst_gpio = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
+ 	if (IS_ERR(isp->rst_gpio))
+ 		return PTR_ERR(isp->rst_gpio);
+ 
+-	isp->regs = devm_ioremap_resource(dev, mem);
+-	if (IS_ERR(isp->regs))
+-		return PTR_ERR(isp->regs);
++	hcd->base = devm_ioremap_resource(dev, mem);
++	if (IS_ERR(hcd->base))
++		return PTR_ERR(hcd->base);
++
++	hcd->regs = devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf);
++	if (IS_ERR(hcd->regs))
++		return PTR_ERR(hcd->regs);
++
++	for (i = 0; i < HC_FIELD_MAX; i++) {
++		f = devm_regmap_field_alloc(dev, hcd->regs,
++					    isp1760_hc_reg_fields[i]);
++		if (IS_ERR(f))
++			return PTR_ERR(f);
++
++		hcd->fields[i] = f;
++	}
++
++	udc->regs = devm_regmap_init_mmio(dev, base, &isp1761_dc_regmap_conf);
++	if (IS_ERR(udc->regs))
++		return PTR_ERR(udc->regs);
++
++	for (i = 0; i < DC_FIELD_MAX; i++) {
++		f = devm_regmap_field_alloc(dev, udc->regs,
++					    isp1761_dc_reg_fields[i]);
++		if (IS_ERR(f))
++			return PTR_ERR(f);
++
++		udc->fields[i] = f;
++	}
+ 
+ 	isp1760_init_core(isp);
+ 
+ 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
+-		ret = isp1760_hcd_register(&isp->hcd, isp->regs, mem, irq,
++		ret = isp1760_hcd_register(hcd, mem, irq,
+ 					   irqflags | IRQF_SHARED, dev);
+ 		if (ret < 0)
+ 			return ret;
+@@ -147,7 +314,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
+ 		ret = isp1760_udc_register(isp, irq, irqflags);
+ 		if (ret < 0) {
+-			isp1760_hcd_unregister(&isp->hcd);
++			isp1760_hcd_unregister(hcd);
+ 			return ret;
+ 		}
+ 	}
+diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
+index d9a0a4cc467c..8fec6395f19f 100644
+--- a/drivers/usb/isp1760/isp1760-core.h
++++ b/drivers/usb/isp1760/isp1760-core.h
+@@ -14,6 +14,7 @@
+ #define _ISP1760_CORE_H_
+ 
+ #include <linux/ioport.h>
++#include <linux/regmap.h>
+ 
+ #include "isp1760-hcd.h"
+ #include "isp1760-udc.h"
+@@ -38,7 +39,6 @@ struct gpio_desc;
+ struct isp1760_device {
+ 	struct device *dev;
+ 
+-	void __iomem *regs;
+ 	unsigned int devflags;
+ 	struct gpio_desc *rst_gpio;
+ 
+@@ -52,14 +52,42 @@ void isp1760_unregister(struct device *dev);
+ 
+ void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
+ 
+-static inline u32 isp1760_read32(void __iomem *base, u32 reg)
++static inline u32 isp1760_field_read(struct regmap_field **fields, u32 field)
+ {
+-	return readl(base + reg);
++	unsigned int val;
++
++	regmap_field_read(fields[field], &val);
++
++	return val;
++}
++
++static inline void isp1760_field_write(struct regmap_field **fields, u32 field,
++				       u32 val)
++{
++	regmap_field_write(fields[field], val);
++}
++
++static inline void isp1760_field_set(struct regmap_field **fields, u32 field)
++{
++	isp1760_field_write(fields, field, 0xFFFFFFFF);
+ }
+ 
+-static inline void isp1760_write32(void __iomem *base, u32 reg, u32 val)
++static inline void isp1760_field_clear(struct regmap_field **fields, u32 field)
+ {
+-	writel(val, base + reg);
++	isp1760_field_write(fields, field, 0);
+ }
+ 
++static inline u32 isp1760_reg_read(struct regmap *regs, u32 reg)
++{
++	unsigned int val;
++
++	regmap_read(regs, reg, &val);
++
++	return val;
++}
++
++static inline void isp1760_reg_write(struct regmap *regs, u32 reg, u32 val)
++{
++	regmap_write(regs, reg, val);
++}
+ #endif
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 0e0a4b01c710..20d142140574 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -66,6 +66,11 @@ struct ptd {
+ #define ATL_PTD_OFFSET		0x0c00
+ #define PAYLOAD_OFFSET		0x1000
+ 
++#define ISP_BANK_0		0x00
++#define ISP_BANK_1		0x01
++#define ISP_BANK_2		0x02
++#define ISP_BANK_3		0x03
++
+ #define TO_DW(x)	((__force __dw)x)
+ #define TO_U32(x)	((__force u32)x)
+ 
+@@ -161,16 +166,59 @@ struct urb_listitem {
+ };
+ 
+ /*
+- * Access functions for isp176x registers (addresses 0..0x03FF).
++ * Access functions for isp176x registers regmap fields
+  */
+-static u32 reg_read32(void __iomem *base, u32 reg)
++static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	return isp1760_field_read(priv->fields, field);
++}
++
++static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	isp1760_field_write(priv->fields, field, val);
++}
++
++static void isp1760_hcd_set(struct usb_hcd *hcd, u32 field)
++{
++	isp1760_hcd_write(hcd, field, 0xFFFFFFFF);
++}
++
++static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
++{
++	isp1760_hcd_write(hcd, field, 0);
++}
++
++static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
++					u32 timeout_us)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	unsigned int val;
++
++	isp1760_hcd_set(hcd, field);
++
++	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
++					      timeout_us);
++}
++
++static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 field,
++					  u32 timeout_us)
+ {
+-	return isp1760_read32(base, reg);
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	unsigned int val;
++
++	isp1760_hcd_clear(hcd, field);
++
++	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
++					      timeout_us);
+ }
+ 
+-static void reg_write32(void __iomem *base, u32 reg, u32 val)
++static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
+ {
+-	isp1760_write32(base, reg, val);
++	return !!isp1760_hcd_read(hcd, field);
+ }
+ 
+ /*
+@@ -233,12 +281,15 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
+ 	}
+ }
+ 
+-static void mem_reads8(void __iomem *src_base, u32 src_offset, void *dst,
+-								u32 bytes)
++static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
++		       u32 src_offset, void *dst, u32 bytes)
+ {
+-	reg_write32(src_base, HC_MEMORY_REG, src_offset + ISP_BANK(0));
++	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
++	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
++
+ 	ndelay(90);
+-	bank_reads8(src_base, src_offset, ISP_BANK(0), dst, bytes);
++
++	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
+ }
+ 
+ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
+@@ -280,14 +331,15 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
+  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
+  * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
+  */
+-static void ptd_read(void __iomem *base, u32 ptd_offset, u32 slot,
+-								struct ptd *ptd)
++static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
++		     u32 ptd_offset, u32 slot, struct ptd *ptd)
+ {
+-	reg_write32(base, HC_MEMORY_REG,
+-				ISP_BANK(0) + ptd_offset + slot*sizeof(*ptd));
++	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
++	isp1760_hcd_write(hcd, MEM_START_ADDR,
++			  ptd_offset + slot * sizeof(*ptd));
+ 	ndelay(90);
+-	bank_reads8(base, ptd_offset + slot*sizeof(*ptd), ISP_BANK(0),
+-						(void *) ptd, sizeof(*ptd));
++	bank_reads8(base, ptd_offset + slot * sizeof(*ptd), ISP_BANK_0,
++		    (void *)ptd, sizeof(*ptd));
+ }
+ 
+ static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
+@@ -379,34 +431,15 @@ static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
+ 	qtd->payload_addr = 0;
+ }
+ 
+-static int handshake(struct usb_hcd *hcd, u32 reg,
+-		      u32 mask, u32 done, int usec)
+-{
+-	u32 result;
+-	int ret;
+-
+-	ret = readl_poll_timeout_atomic(hcd->regs + reg, result,
+-					((result & mask) == done ||
+-					 result == U32_MAX), 1, usec);
+-	if (result == U32_MAX)
+-		return -ENODEV;
+-
+-	return ret;
+-}
+-
+ /* reset a non-running (STS_HALT == 1) controller */
+ static int ehci_reset(struct usb_hcd *hcd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 
+-	u32 command = reg_read32(hcd->regs, HC_USBCMD);
+-
+-	command |= CMD_RESET;
+-	reg_write32(hcd->regs, HC_USBCMD, command);
+ 	hcd->state = HC_STATE_HALT;
+ 	priv->next_statechange = jiffies;
+ 
+-	return handshake(hcd, HC_USBCMD, CMD_RESET, 0, 250 * 1000);
++	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
+ }
+ 
+ static struct isp1760_qh *qh_alloc(gfp_t flags)
+@@ -434,8 +467,10 @@ static void qh_free(struct isp1760_qh *qh)
+ /* one-time init, only for memory state */
+ static int priv_init(struct usb_hcd *hcd)
+ {
+-	struct isp1760_hcd		*priv = hcd_to_priv(hcd);
+-	u32			hcc_params;
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 isoc_cache;
++	u32 isoc_thres;
++
+ 	int i;
+ 
+ 	spin_lock_init(&priv->lock);
+@@ -450,12 +485,14 @@ static int priv_init(struct usb_hcd *hcd)
+ 	priv->periodic_size = DEFAULT_I_TDPS;
+ 
+ 	/* controllers may cache some of the periodic schedule ... */
+-	hcc_params = reg_read32(hcd->regs, HC_HCCPARAMS);
++	isoc_cache = isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
++	isoc_thres = isp1760_hcd_read(hcd, HCC_ISOC_THRES);
++
+ 	/* full frame cache */
+-	if (HCC_ISOC_CACHE(hcc_params))
++	if (isoc_cache)
+ 		priv->i_thresh = 8;
+ 	else /* N microframes cached */
+-		priv->i_thresh = 2 + HCC_ISOC_THRES(hcc_params);
++		priv->i_thresh = 2 + isoc_thres;
+ 
+ 	return 0;
+ }
+@@ -464,12 +501,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 	int result;
+-	u32 scratch, hwmode;
++	u32 scratch;
++
++	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
+ 
+-	reg_write32(hcd->regs, HC_SCRATCH_REG, 0xdeadbabe);
+ 	/* Change bus pattern */
+-	scratch = reg_read32(hcd->regs, HC_CHIP_ID_REG);
+-	scratch = reg_read32(hcd->regs, HC_SCRATCH_REG);
++	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
++	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
+ 	if (scratch != 0xdeadbabe) {
+ 		dev_err(hcd->self.controller, "Scratch test failed.\n");
+ 		return -ENODEV;
+@@ -483,10 +521,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ 	 * the host controller through the EHCI USB Command register. The device
+ 	 * has been reset in core code anyway, so this shouldn't matter.
+ 	 */
+-	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG, 0);
+-	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
+-	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
+-	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
++	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
++			  NO_TRANSFER_ACTIVE);
++	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
++			  NO_TRANSFER_ACTIVE);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
++			  NO_TRANSFER_ACTIVE);
+ 
+ 	result = ehci_reset(hcd);
+ 	if (result)
+@@ -495,14 +536,11 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ 	/* Step 11 passed */
+ 
+ 	/* ATL reset */
+-	hwmode = reg_read32(hcd->regs, HC_HW_MODE_CTRL) & ~ALL_ATX_RESET;
+-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode | ALL_ATX_RESET);
++	isp1760_hcd_set(hcd, ALL_ATX_RESET);
+ 	mdelay(10);
+-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode);
++	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
+ 
+-	reg_write32(hcd->regs, HC_INTERRUPT_ENABLE, INTERRUPT_ENABLE_MASK);
+-
+-	priv->hcs_params = reg_read32(hcd->regs, HC_HCSPARAMS);
++	isp1760_hcd_set(hcd, HC_INT_ENABLE);
+ 
+ 	return priv_init(hcd);
+ }
+@@ -732,12 +770,12 @@ static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int slot,
+ 
+ 	/* Make sure done map has not triggered from some unlinked transfer */
+ 	if (ptd_offset == ATL_PTD_OFFSET) {
+-		priv->atl_done_map |= reg_read32(hcd->regs,
+-						HC_ATL_PTD_DONEMAP_REG);
++		priv->atl_done_map |= isp1760_reg_read(priv->regs,
++						ISP176x_HC_ATL_PTD_DONEMAP);
+ 		priv->atl_done_map &= ~(1 << slot);
+ 	} else {
+-		priv->int_done_map |= reg_read32(hcd->regs,
+-						HC_INT_PTD_DONEMAP_REG);
++		priv->int_done_map |= isp1760_reg_read(priv->regs,
++					       ISP176x_HC_INT_PTD_DONEMAP);
+ 		priv->int_done_map &= ~(1 << slot);
+ 	}
+ 
+@@ -746,16 +784,20 @@ static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int slot,
+ 	slots[slot].timestamp = jiffies;
+ 	slots[slot].qtd = qtd;
+ 	slots[slot].qh = qh;
+-	ptd_write(hcd->regs, ptd_offset, slot, ptd);
++	ptd_write(priv->base, ptd_offset, slot, ptd);
+ 
+ 	if (ptd_offset == ATL_PTD_OFFSET) {
+-		skip_map = reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
++		skip_map = isp1760_reg_read(priv->regs,
++					    ISP176x_HC_ATL_PTD_SKIPMAP);
+ 		skip_map &= ~(1 << qh->slot);
+-		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
++		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
++				  skip_map);
+ 	} else {
+-		skip_map = reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
++		skip_map = isp1760_reg_read(priv->regs,
++					    ISP176x_HC_INT_PTD_SKIPMAP);
+ 		skip_map &= ~(1 << qh->slot);
+-		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
++		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
++				  skip_map);
+ 	}
+ }
+ 
+@@ -768,9 +810,10 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
+ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
+ 						struct list_head *urb_list)
+ {
+-	int last_qtd;
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 	struct isp1760_qtd *qtd, *qtd_next;
+ 	struct urb_listitem *urb_listitem;
++	int last_qtd;
+ 
+ 	list_for_each_entry_safe(qtd, qtd_next, &qh->qtd_list, qtd_list) {
+ 		if (qtd->status < QTD_XFER_COMPLETE)
+@@ -785,9 +828,10 @@ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
+ 			if (qtd->actual_length) {
+ 				switch (qtd->packet_type) {
+ 				case IN_PID:
+-					mem_reads8(hcd->regs, qtd->payload_addr,
+-							qtd->data_buffer,
+-							qtd->actual_length);
++					mem_reads8(hcd, priv->base,
++						   qtd->payload_addr,
++						   qtd->data_buffer,
++						   qtd->actual_length);
+ 					fallthrough;
+ 				case OUT_PID:
+ 					qtd->urb->actual_length +=
+@@ -875,8 +919,8 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
+ 			if ((qtd->length) &&
+ 			    ((qtd->packet_type == SETUP_PID) ||
+ 			     (qtd->packet_type == OUT_PID))) {
+-				mem_writes8(hcd->regs, qtd->payload_addr,
+-						qtd->data_buffer, qtd->length);
++				mem_writes8(priv->base, qtd->payload_addr,
++					    qtd->data_buffer, qtd->length);
+ 			}
+ 
+ 			qtd->status = QTD_PAYLOAD_ALLOC;
+@@ -1076,9 +1120,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ 	int modified;
+ 	int skip_map;
+ 
+-	skip_map = reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
++	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
+ 	priv->int_done_map &= ~skip_map;
+-	skip_map = reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
++	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
+ 	priv->atl_done_map &= ~skip_map;
+ 
+ 	modified = priv->int_done_map || priv->atl_done_map;
+@@ -1096,7 +1140,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ 				continue;
+ 			}
+ 			ptd_offset = INT_PTD_OFFSET;
+-			ptd_read(hcd->regs, INT_PTD_OFFSET, slot, &ptd);
++			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
+ 			state = check_int_transfer(hcd, &ptd,
+ 							slots[slot].qtd->urb);
+ 		} else {
+@@ -1111,7 +1155,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ 				continue;
+ 			}
+ 			ptd_offset = ATL_PTD_OFFSET;
+-			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
++			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
+ 			state = check_atl_transfer(hcd, &ptd,
+ 							slots[slot].qtd->urb);
+ 		}
+@@ -1136,7 +1180,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ 
+ 			qtd->status = QTD_XFER_COMPLETE;
+ 			if (list_is_last(&qtd->qtd_list, &qh->qtd_list) ||
+-							is_short_bulk(qtd))
++			    is_short_bulk(qtd))
+ 				qtd = NULL;
+ 			else
+ 				qtd = list_entry(qtd->qtd_list.next,
+@@ -1212,13 +1256,15 @@ static irqreturn_t isp1760_irq(struct usb_hcd *hcd)
+ 	if (!(hcd->state & HC_STATE_RUNNING))
+ 		goto leave;
+ 
+-	imask = reg_read32(hcd->regs, HC_INTERRUPT_REG);
++	imask = isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
+ 	if (unlikely(!imask))
+ 		goto leave;
+-	reg_write32(hcd->regs, HC_INTERRUPT_REG, imask); /* Clear */
++	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear */
+ 
+-	priv->int_done_map |= reg_read32(hcd->regs, HC_INT_PTD_DONEMAP_REG);
+-	priv->atl_done_map |= reg_read32(hcd->regs, HC_ATL_PTD_DONEMAP_REG);
++	priv->int_done_map |= isp1760_reg_read(priv->regs,
++					       ISP176x_HC_INT_PTD_DONEMAP);
++	priv->atl_done_map |= isp1760_reg_read(priv->regs,
++					       ISP176x_HC_ATL_PTD_DONEMAP);
+ 
+ 	handle_done_ptds(hcd);
+ 
+@@ -1273,7 +1319,7 @@ static void errata2_function(struct timer_list *unused)
+ 		if (priv->atl_slots[slot].qh && time_after(jiffies,
+ 					priv->atl_slots[slot].timestamp +
+ 					msecs_to_jiffies(SLOT_TIMEOUT))) {
+-			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
++			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
+ 			if (!FROM_DW0_VALID(ptd.dw0) &&
+ 					!FROM_DW3_ACTIVE(ptd.dw3))
+ 				priv->atl_done_map |= 1 << slot;
+@@ -1290,9 +1336,8 @@ static void errata2_function(struct timer_list *unused)
+ 
+ static int isp1760_run(struct usb_hcd *hcd)
+ {
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 	int retval;
+-	u32 temp;
+-	u32 command;
+ 	u32 chipid;
+ 
+ 	hcd->uses_new_polling = 1;
+@@ -1300,23 +1345,20 @@ static int isp1760_run(struct usb_hcd *hcd)
+ 	hcd->state = HC_STATE_RUNNING;
+ 
+ 	/* Set PTD interrupt AND & OR maps */
+-	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_AND_REG, 0);
+-	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_OR_REG, 0xffffffff);
+-	reg_write32(hcd->regs, HC_INT_IRQ_MASK_AND_REG, 0);
+-	reg_write32(hcd->regs, HC_INT_IRQ_MASK_OR_REG, 0xffffffff);
+-	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_AND_REG, 0);
+-	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_OR_REG, 0xffffffff);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
++	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
++	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
+ 	/* step 23 passed */
+ 
+-	temp = reg_read32(hcd->regs, HC_HW_MODE_CTRL);
+-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp | HW_GLOBAL_INTR_EN);
++	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
+ 
+-	command = reg_read32(hcd->regs, HC_USBCMD);
+-	command &= ~(CMD_LRESET|CMD_RESET);
+-	command |= CMD_RUN;
+-	reg_write32(hcd->regs, HC_USBCMD, command);
++	isp1760_hcd_clear(hcd, CMD_LRESET);
++	isp1760_hcd_clear(hcd, CMD_RESET);
+ 
+-	retval = handshake(hcd, HC_USBCMD, CMD_RUN, CMD_RUN, 250 * 1000);
++	retval = isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
+ 	if (retval)
+ 		return retval;
+ 
+@@ -1326,9 +1368,8 @@ static int isp1760_run(struct usb_hcd *hcd)
+ 	 * the semaphore while doing so.
+ 	 */
+ 	down_write(&ehci_cf_port_reset_rwsem);
+-	reg_write32(hcd->regs, HC_CONFIGFLAG, FLAG_CF);
+ 
+-	retval = handshake(hcd, HC_CONFIGFLAG, FLAG_CF, FLAG_CF, 250 * 1000);
++	retval = isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
+ 	up_write(&ehci_cf_port_reset_rwsem);
+ 	if (retval)
+ 		return retval;
+@@ -1338,21 +1379,22 @@ static int isp1760_run(struct usb_hcd *hcd)
+ 	errata2_timer.expires = jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD);
+ 	add_timer(&errata2_timer);
+ 
+-	chipid = reg_read32(hcd->regs, HC_CHIP_ID_REG);
++	chipid = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
+ 	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
+ 					chipid & 0xffff, chipid >> 16);
+ 
+ 	/* PTD Register Init Part 2, Step 28 */
+ 
+ 	/* Setup registers controlling PTD checking */
+-	reg_write32(hcd->regs, HC_ATL_PTD_LASTPTD_REG, 0x80000000);
+-	reg_write32(hcd->regs, HC_INT_PTD_LASTPTD_REG, 0x80000000);
+-	reg_write32(hcd->regs, HC_ISO_PTD_LASTPTD_REG, 0x00000001);
+-	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, 0xffffffff);
+-	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, 0xffffffff);
+-	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, 0xffffffff);
+-	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG,
+-						ATL_BUF_FILL | INT_BUF_FILL);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
++	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
++	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
++	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
++
++	isp1760_hcd_set(hcd, ATL_BUF_FILL);
++	isp1760_hcd_set(hcd, INT_BUF_FILL);
+ 
+ 	/* GRR this is run-once init(), being done every time the HC starts.
+ 	 * So long as they're part of class devices, we can't do it init()
+@@ -1586,15 +1628,19 @@ static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
+ 	/* We need to forcefully reclaim the slot since some transfers never
+ 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
+ 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
+-		skip_map = reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
++		skip_map = isp1760_reg_read(priv->regs,
++					    ISP176x_HC_ATL_PTD_SKIPMAP);
+ 		skip_map |= (1 << qh->slot);
+-		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
++		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
++				  skip_map);
+ 		priv->atl_slots[qh->slot].qh = NULL;
+ 		priv->atl_slots[qh->slot].qtd = NULL;
+ 	} else {
+-		skip_map = reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
++		skip_map = isp1760_reg_read(priv->regs,
++					    ISP176x_HC_INT_PTD_SKIPMAP);
+ 		skip_map |= (1 << qh->slot);
+-		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
++		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
++				  skip_map);
+ 		priv->int_slots[qh->slot].qh = NULL;
+ 		priv->int_slots[qh->slot].qtd = NULL;
+ 	}
+@@ -1707,8 +1753,7 @@ static void isp1760_endpoint_disable(struct usb_hcd *hcd,
+ static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+-	u32 temp, status = 0;
+-	u32 mask;
++	u32 status = 0;
+ 	int retval = 1;
+ 	unsigned long flags;
+ 
+@@ -1718,17 +1763,13 @@ static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
+ 
+ 	/* init status to no-changes */
+ 	buf[0] = 0;
+-	mask = PORT_CSC;
+ 
+ 	spin_lock_irqsave(&priv->lock, flags);
+-	temp = reg_read32(hcd->regs, HC_PORTSC1);
+ 
+-	if (temp & PORT_OWNER) {
+-		if (temp & PORT_CSC) {
+-			temp &= ~PORT_CSC;
+-			reg_write32(hcd->regs, HC_PORTSC1, temp);
+-			goto done;
+-		}
++	if (isp1760_hcd_is_set(hcd, PORT_OWNER) &&
++	    isp1760_hcd_is_set(hcd, PORT_CSC)) {
++		isp1760_hcd_clear(hcd, PORT_CSC);
++		goto done;
+ 	}
+ 
+ 	/*
+@@ -1737,11 +1778,9 @@ static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
+ 	 * high-speed device is switched over to the companion
+ 	 * controller by the user.
+ 	 */
+-
+-	if ((temp & mask) != 0
+-			|| ((temp & PORT_RESUME) != 0
+-				&& time_after_eq(jiffies,
+-					priv->reset_done))) {
++	if (isp1760_hcd_is_set(hcd, PORT_CSC) ||
++	    (isp1760_hcd_is_set(hcd, PORT_RESUME) &&
++	     time_after_eq(jiffies, priv->reset_done))) {
+ 		buf [0] |= 1 << (0 + 1);
+ 		status = STS_PCD;
+ 	}
+@@ -1754,9 +1793,11 @@ static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
+ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
+ 		struct usb_hub_descriptor *desc)
+ {
+-	int ports = HCS_N_PORTS(priv->hcs_params);
++	int ports;
+ 	u16 temp;
+ 
++	ports = isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
++
+ 	desc->bDescriptorType = USB_DT_HUB;
+ 	/* priv 1.0, 2.3.9 says 20ms max */
+ 	desc->bPwrOn2PwrGood = 10;
+@@ -1772,7 +1813,7 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
+ 
+ 	/* per-port overcurrent reporting */
+ 	temp = HUB_CHAR_INDV_PORT_OCPM;
+-	if (HCS_PPC(priv->hcs_params))
++	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
+ 		/* per-port power control */
+ 		temp |= HUB_CHAR_INDV_PORT_LPSM;
+ 	else
+@@ -1783,38 +1824,37 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
+ 
+ #define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
+ 
+-static int check_reset_complete(struct usb_hcd *hcd, int index,
+-		int port_status)
++static void check_reset_complete(struct usb_hcd *hcd, int index)
+ {
+-	if (!(port_status & PORT_CONNECT))
+-		return port_status;
++	if (!(isp1760_hcd_is_set(hcd, PORT_CONNECT)))
++		return;
+ 
+ 	/* if reset finished and it's still not enabled -- handoff */
+-	if (!(port_status & PORT_PE)) {
+-
++	if (!isp1760_hcd_is_set(hcd, PORT_PE)) {
+ 		dev_info(hcd->self.controller,
+-					"port %d full speed --> companion\n",
+-					index + 1);
++			 "port %d full speed --> companion\n", index + 1);
+ 
+-		port_status |= PORT_OWNER;
+-		port_status &= ~PORT_RWC_BITS;
+-		reg_write32(hcd->regs, HC_PORTSC1, port_status);
++		isp1760_hcd_set(hcd, PORT_OWNER);
+ 
+-	} else
++		isp1760_hcd_clear(hcd, PORT_CSC);
++	} else {
+ 		dev_info(hcd->self.controller, "port %d high speed\n",
+-								index + 1);
++			 index + 1);
++	}
+ 
+-	return port_status;
++	return;
+ }
+ 
+ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		u16 wValue, u16 wIndex, char *buf, u16 wLength)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+-	int ports = HCS_N_PORTS(priv->hcs_params);
+-	u32 temp, status;
++	u32 status;
+ 	unsigned long flags;
+ 	int retval = 0;
++	int ports;
++
++	ports = isp1760_hcd_read(hcd, HCS_N_PORTS);
+ 
+ 	/*
+ 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
+@@ -1839,7 +1879,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		if (!wIndex || wIndex > ports)
+ 			goto error;
+ 		wIndex--;
+-		temp = reg_read32(hcd->regs, HC_PORTSC1);
+ 
+ 		/*
+ 		 * Even if OWNER is set, so the port is owned by the
+@@ -1850,22 +1889,22 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 
+ 		switch (wValue) {
+ 		case USB_PORT_FEAT_ENABLE:
+-			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_PE);
++			isp1760_hcd_clear(hcd, PORT_PE);
+ 			break;
+ 		case USB_PORT_FEAT_C_ENABLE:
+ 			/* XXX error? */
+ 			break;
+ 		case USB_PORT_FEAT_SUSPEND:
+-			if (temp & PORT_RESET)
++			if (isp1760_hcd_is_set(hcd, PORT_RESET))
+ 				goto error;
+ 
+-			if (temp & PORT_SUSPEND) {
+-				if ((temp & PORT_PE) == 0)
++			if (isp1760_hcd_is_set(hcd, PORT_SUSPEND)) {
++				if (!isp1760_hcd_is_set(hcd, PORT_PE))
+ 					goto error;
+ 				/* resume signaling for 20 msec */
+-				temp &= ~(PORT_RWC_BITS);
+-				reg_write32(hcd->regs, HC_PORTSC1,
+-							temp | PORT_RESUME);
++				isp1760_hcd_clear(hcd, PORT_CSC);
++				isp1760_hcd_set(hcd, PORT_RESUME);
++
+ 				priv->reset_done = jiffies +
+ 					msecs_to_jiffies(USB_RESUME_TIMEOUT);
+ 			}
+@@ -1874,12 +1913,11 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 			/* we auto-clear this feature */
+ 			break;
+ 		case USB_PORT_FEAT_POWER:
+-			if (HCS_PPC(priv->hcs_params))
+-				reg_write32(hcd->regs, HC_PORTSC1,
+-							temp & ~PORT_POWER);
++			if (isp1760_hcd_is_set(hcd, HCS_PPC))
++				isp1760_hcd_clear(hcd, PORT_POWER);
+ 			break;
+ 		case USB_PORT_FEAT_C_CONNECTION:
+-			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_CSC);
++			isp1760_hcd_set(hcd, PORT_CSC);
+ 			break;
+ 		case USB_PORT_FEAT_C_OVER_CURRENT:
+ 			/* XXX error ?*/
+@@ -1890,7 +1928,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		default:
+ 			goto error;
+ 		}
+-		reg_read32(hcd->regs, HC_USBCMD);
++		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
+ 		break;
+ 	case GetHubDescriptor:
+ 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
+@@ -1905,15 +1943,14 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 			goto error;
+ 		wIndex--;
+ 		status = 0;
+-		temp = reg_read32(hcd->regs, HC_PORTSC1);
+ 
+ 		/* wPortChange bits */
+-		if (temp & PORT_CSC)
++		if (isp1760_hcd_is_set(hcd, PORT_CSC))
+ 			status |= USB_PORT_STAT_C_CONNECTION << 16;
+ 
+ 
+ 		/* whoever resumes must GetPortStatus to complete it!! */
+-		if (temp & PORT_RESUME) {
++		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
+ 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
+ 
+ 			/* Remote Wakeup received? */
+@@ -1932,35 +1969,31 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 				priv->reset_done = 0;
+ 
+ 				/* stop resume signaling */
+-				temp = reg_read32(hcd->regs, HC_PORTSC1);
+-				reg_write32(hcd->regs, HC_PORTSC1,
+-					temp & ~(PORT_RWC_BITS | PORT_RESUME));
+-				retval = handshake(hcd, HC_PORTSC1,
+-					   PORT_RESUME, 0, 2000 /* 2msec */);
++				isp1760_hcd_clear(hcd, PORT_CSC);
++
++				retval = isp1760_hcd_clear_poll_timeout(hcd,
++							  PORT_RESUME, 2000);
+ 				if (retval != 0) {
+ 					dev_err(hcd->self.controller,
+ 						"port %d resume error %d\n",
+ 						wIndex + 1, retval);
+ 					goto error;
+ 				}
+-				temp &= ~(PORT_SUSPEND|PORT_RESUME|(3<<10));
+ 			}
+ 		}
+ 
+ 		/* whoever resets must GetPortStatus to complete it!! */
+-		if ((temp & PORT_RESET)
+-				&& time_after_eq(jiffies,
+-					priv->reset_done)) {
++		if (isp1760_hcd_is_set(hcd, PORT_RESET) &&
++		    time_after_eq(jiffies, priv->reset_done)) {
+ 			status |= USB_PORT_STAT_C_RESET << 16;
+ 			priv->reset_done = 0;
+ 
+ 			/* force reset to complete */
+-			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_RESET);
+ 			/* REVISIT:  some hardware needs 550+ usec to clear
+ 			 * this bit; seems too long to spin routinely...
+ 			 */
+-			retval = handshake(hcd, HC_PORTSC1,
+-					PORT_RESET, 0, 750);
++			retval = isp1760_hcd_clear_poll_timeout(hcd, PORT_RESET,
++								750);
+ 			if (retval != 0) {
+ 				dev_err(hcd->self.controller, "port %d reset error %d\n",
+ 						wIndex + 1, retval);
+@@ -1968,8 +2001,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 			}
+ 
+ 			/* see what we found out */
+-			temp = check_reset_complete(hcd, wIndex,
+-					reg_read32(hcd->regs, HC_PORTSC1));
++			check_reset_complete(hcd, wIndex);
+ 		}
+ 		/*
+ 		 * Even if OWNER is set, there's no harm letting hub_wq
+@@ -1977,21 +2009,22 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		 * for PORT_POWER anyway).
+ 		 */
+ 
+-		if (temp & PORT_OWNER)
++		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
+ 			dev_err(hcd->self.controller, "PORT_OWNER is set\n");
+ 
+-		if (temp & PORT_CONNECT) {
++		if (isp1760_hcd_is_set(hcd, PORT_CONNECT)) {
+ 			status |= USB_PORT_STAT_CONNECTION;
+ 			/* status may be from integrated TT */
+ 			status |= USB_PORT_STAT_HIGH_SPEED;
+ 		}
+-		if (temp & PORT_PE)
++		if (isp1760_hcd_is_set(hcd, PORT_PE))
+ 			status |= USB_PORT_STAT_ENABLE;
+-		if (temp & (PORT_SUSPEND|PORT_RESUME))
++		if (isp1760_hcd_is_set(hcd, PORT_SUSPEND) &&
++		    isp1760_hcd_is_set(hcd, PORT_RESUME))
+ 			status |= USB_PORT_STAT_SUSPEND;
+-		if (temp & PORT_RESET)
++		if (isp1760_hcd_is_set(hcd, PORT_RESET))
+ 			status |= USB_PORT_STAT_RESET;
+-		if (temp & PORT_POWER)
++		if (isp1760_hcd_is_set(hcd, PORT_POWER))
+ 			status |= USB_PORT_STAT_POWER;
+ 
+ 		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
+@@ -2011,41 +2044,39 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		if (!wIndex || wIndex > ports)
+ 			goto error;
+ 		wIndex--;
+-		temp = reg_read32(hcd->regs, HC_PORTSC1);
+-		if (temp & PORT_OWNER)
++		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
+ 			break;
+ 
+-/*		temp &= ~PORT_RWC_BITS; */
+ 		switch (wValue) {
+ 		case USB_PORT_FEAT_ENABLE:
+-			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_PE);
++			isp1760_hcd_set(hcd, PORT_PE);
+ 			break;
+ 
+ 		case USB_PORT_FEAT_SUSPEND:
+-			if ((temp & PORT_PE) == 0
+-					|| (temp & PORT_RESET) != 0)
++			if (!isp1760_hcd_is_set(hcd, PORT_PE) ||
++			    isp1760_hcd_is_set(hcd, PORT_RESET))
+ 				goto error;
+ 
+-			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_SUSPEND);
++			isp1760_hcd_set(hcd, PORT_SUSPEND);
+ 			break;
+ 		case USB_PORT_FEAT_POWER:
+-			if (HCS_PPC(priv->hcs_params))
+-				reg_write32(hcd->regs, HC_PORTSC1,
+-							temp | PORT_POWER);
++			if (isp1760_hcd_is_set(hcd, HCS_PPC))
++				isp1760_hcd_set(hcd, PORT_POWER);
+ 			break;
+ 		case USB_PORT_FEAT_RESET:
+-			if (temp & PORT_RESUME)
++			if (isp1760_hcd_is_set(hcd, PORT_RESUME))
+ 				goto error;
+ 			/* line status bits may report this as low speed,
+ 			 * which can be fine if this root hub has a
+ 			 * transaction translator built in.
+ 			 */
+-			if ((temp & (PORT_PE|PORT_CONNECT)) == PORT_CONNECT
+-					&& PORT_USB11(temp)) {
+-				temp |= PORT_OWNER;
++			if ((isp1760_hcd_is_set(hcd, PORT_CONNECT) &&
++			     !isp1760_hcd_is_set(hcd, PORT_PE)) &&
++			    (isp1760_hcd_read(hcd, PORT_LSTATUS) == 1)) {
++				isp1760_hcd_set(hcd, PORT_OWNER);
+ 			} else {
+-				temp |= PORT_RESET;
+-				temp &= ~PORT_PE;
++				isp1760_hcd_set(hcd, PORT_RESET);
++				isp1760_hcd_clear(hcd, PORT_PE);
+ 
+ 				/*
+ 				 * caller must wait, then call GetPortStatus
+@@ -2054,12 +2085,11 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 				priv->reset_done = jiffies +
+ 					msecs_to_jiffies(50);
+ 			}
+-			reg_write32(hcd->regs, HC_PORTSC1, temp);
+ 			break;
+ 		default:
+ 			goto error;
+ 		}
+-		reg_read32(hcd->regs, HC_USBCMD);
++		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
+ 		break;
+ 
+ 	default:
+@@ -2076,14 +2106,13 @@ static int isp1760_get_frame(struct usb_hcd *hcd)
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 	u32 fr;
+ 
+-	fr = reg_read32(hcd->regs, HC_FRINDEX);
++	fr = isp1760_hcd_read(hcd, HC_FRINDEX);
+ 	return (fr >> 3) % priv->periodic_size;
+ }
+ 
+ static void isp1760_stop(struct usb_hcd *hcd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+-	u32 temp;
+ 
+ 	del_timer(&errata2_timer);
+ 
+@@ -2094,24 +2123,19 @@ static void isp1760_stop(struct usb_hcd *hcd)
+ 	spin_lock_irq(&priv->lock);
+ 	ehci_reset(hcd);
+ 	/* Disable IRQ */
+-	temp = reg_read32(hcd->regs, HC_HW_MODE_CTRL);
+-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &= ~HW_GLOBAL_INTR_EN);
++	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
+ 	spin_unlock_irq(&priv->lock);
+ 
+-	reg_write32(hcd->regs, HC_CONFIGFLAG, 0);
++	isp1760_hcd_clear(hcd, FLAG_CF);
+ }
+ 
+ static void isp1760_shutdown(struct usb_hcd *hcd)
+ {
+-	u32 command, temp;
+-
+ 	isp1760_stop(hcd);
+-	temp = reg_read32(hcd->regs, HC_HW_MODE_CTRL);
+-	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &= ~HW_GLOBAL_INTR_EN);
+ 
+-	command = reg_read32(hcd->regs, HC_USBCMD);
+-	command &= ~CMD_RUN;
+-	reg_write32(hcd->regs, HC_USBCMD, command);
++	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
++
++	isp1760_hcd_clear(hcd, CMD_RUN);
+ }
+ 
+ static void isp1760_clear_tt_buffer_complete(struct usb_hcd *hcd,
+@@ -2184,8 +2208,8 @@ void isp1760_deinit_kmem_cache(void)
+ 	kmem_cache_destroy(urb_listitem_cachep);
+ }
+ 
+-int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
+-			 struct resource *mem, int irq, unsigned long irqflags,
++int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
++			 int irq, unsigned long irqflags,
+ 			 struct device *dev)
+ {
+ 	struct usb_hcd *hcd;
+@@ -2202,7 +2226,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
+ 	init_memory(priv);
+ 
+ 	hcd->irq = irq;
+-	hcd->regs = regs;
+ 	hcd->rsrc_start = mem->start;
+ 	hcd->rsrc_len = resource_size(mem);
+ 
+diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
+index f1bb2deb1ccf..34e1899e52c4 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.h
++++ b/drivers/usb/isp1760/isp1760-hcd.h
+@@ -3,6 +3,9 @@
+ #define _ISP1760_HCD_H_
+ 
+ #include <linux/spinlock.h>
++#include <linux/regmap.h>
++
++#include "isp1760-regs.h"
+ 
+ struct isp1760_qh;
+ struct isp1760_qtd;
+@@ -48,10 +51,13 @@ enum isp1760_queue_head_types {
+ };
+ 
+ struct isp1760_hcd {
+-#ifdef CONFIG_USB_ISP1760_HCD
+ 	struct usb_hcd		*hcd;
+ 
+-	u32 hcs_params;
++	void __iomem		*base;
++
++	struct regmap		*regs;
++	struct regmap_field	*fields[HC_FIELD_MAX];
++
+ 	spinlock_t		lock;
+ 	struct isp1760_slotinfo	atl_slots[32];
+ 	int			atl_done_map;
+@@ -66,20 +72,18 @@ struct isp1760_hcd {
+ 	unsigned		i_thresh;
+ 	unsigned long		reset_done;
+ 	unsigned long		next_statechange;
+-#endif
+ };
+ 
+ #ifdef CONFIG_USB_ISP1760_HCD
+-int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
+-			 struct resource *mem, int irq, unsigned long irqflags,
+-			 struct device *dev);
++int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
++			 int irq, unsigned long irqflags, struct device *dev);
+ void isp1760_hcd_unregister(struct isp1760_hcd *priv);
+ 
+ int isp1760_init_kmem_once(void);
+ void isp1760_deinit_kmem_cache(void);
+ #else
+ static inline int isp1760_hcd_register(struct isp1760_hcd *priv,
+-				       void __iomem *regs, struct resource *mem,
++				       struct resource *mem,
+ 				       int irq, unsigned long irqflags,
+ 				       struct device *dev)
+ {
+diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
+index ccd30f835888..abfba9f5ec23 100644
+--- a/drivers/usb/isp1760/isp1760-if.c
++++ b/drivers/usb/isp1760/isp1760-if.c
+@@ -75,9 +75,9 @@ static int isp1761_pci_init(struct pci_dev *dev)
+ 		/*by default host is in 16bit mode, so
+ 		 * io operations at this stage must be 16 bit
+ 		 * */
+-		writel(0xface, iobase + HC_SCRATCH_REG);
++		writel(0xface, iobase + ISP176x_HC_SCRATCH);
+ 		udelay(100);
+-		reg_data = readl(iobase + HC_SCRATCH_REG) & 0x0000ffff;
++		reg_data = readl(iobase + ISP176x_HC_SCRATCH) & 0x0000ffff;
+ 		retry_count--;
+ 	}
+ 
+diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
+index fedc4f5cded0..0d5262c37c5b 100644
+--- a/drivers/usb/isp1760/isp1760-regs.h
++++ b/drivers/usb/isp1760/isp1760-regs.h
+@@ -10,218 +10,182 @@
+  *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  */
+ 
+-#ifndef _ISP1760_REGS_H_
+-#define _ISP1760_REGS_H_
++#ifndef _ISP176x_REGS_H_
++#define _ISP176x_REGS_H_
+ 
+ /* -----------------------------------------------------------------------------
+  * Host Controller
+  */
+ 
+ /* EHCI capability registers */
+-#define HC_CAPLENGTH		0x000
+-#define HC_LENGTH(p)		(((p) >> 00) & 0x00ff)	/* bits 7:0 */
+-#define HC_VERSION(p)		(((p) >> 16) & 0xffff)	/* bits 31:16 */
+-
+-#define HC_HCSPARAMS		0x004
+-#define HCS_INDICATOR(p)	((p) & (1 << 16))	/* true: has port indicators */
+-#define HCS_PPC(p)		((p) & (1 << 4))	/* true: port power control */
+-#define HCS_N_PORTS(p)		(((p) >> 0) & 0xf)	/* bits 3:0, ports on HC */
+-
+-#define HC_HCCPARAMS		0x008
+-#define HCC_ISOC_CACHE(p)       ((p) & (1 << 7))	/* true: can cache isoc frame */
+-#define HCC_ISOC_THRES(p)       (((p) >> 4) & 0x7)	/* bits 6:4, uframes cached */
++#define ISP176x_HC_CAPLENGTH		0x000
++#define ISP176x_HC_VERSION		0x002
++#define ISP176x_HC_HCSPARAMS		0x004
++#define ISP176x_HC_HCCPARAMS		0x008
+ 
+ /* EHCI operational registers */
+-#define HC_USBCMD		0x020
+-#define CMD_LRESET		(1 << 7)		/* partial reset (no ports, etc) */
+-#define CMD_RESET		(1 << 1)		/* reset HC not bus */
+-#define CMD_RUN			(1 << 0)		/* start/stop HC */
+-
+-#define HC_USBSTS		0x024
+-#define STS_PCD			(1 << 2)		/* port change detect */
+-
+-#define HC_FRINDEX		0x02c
+-
+-#define HC_CONFIGFLAG		0x060
+-#define FLAG_CF			(1 << 0)		/* true: we'll support "high speed" */
+-
+-#define HC_PORTSC1		0x064
+-#define PORT_OWNER		(1 << 13)		/* true: companion hc owns this port */
+-#define PORT_POWER		(1 << 12)		/* true: has power (see PPC) */
+-#define PORT_USB11(x)		(((x) & (3 << 10)) == (1 << 10))	/* USB 1.1 device */
+-#define PORT_RESET		(1 << 8)		/* reset port */
+-#define PORT_SUSPEND		(1 << 7)		/* suspend port */
+-#define PORT_RESUME		(1 << 6)		/* resume it */
+-#define PORT_PE			(1 << 2)		/* port enable */
+-#define PORT_CSC		(1 << 1)		/* connect status change */
+-#define PORT_CONNECT		(1 << 0)		/* device connected */
+-#define PORT_RWC_BITS		(PORT_CSC)
+-
+-#define HC_ISO_PTD_DONEMAP_REG	0x130
+-#define HC_ISO_PTD_SKIPMAP_REG	0x134
+-#define HC_ISO_PTD_LASTPTD_REG	0x138
+-#define HC_INT_PTD_DONEMAP_REG	0x140
+-#define HC_INT_PTD_SKIPMAP_REG	0x144
+-#define HC_INT_PTD_LASTPTD_REG	0x148
+-#define HC_ATL_PTD_DONEMAP_REG	0x150
+-#define HC_ATL_PTD_SKIPMAP_REG	0x154
+-#define HC_ATL_PTD_LASTPTD_REG	0x158
++#define ISP176x_HC_USBCMD		0x020
++#define ISP176x_HC_USBSTS		0x024
++#define ISP176x_HC_FRINDEX		0x02c
++
++#define ISP176x_HC_CONFIGFLAG		0x060
++#define ISP176x_HC_PORTSC1		0x064
++
++#define ISP176x_HC_ISO_PTD_DONEMAP	0x130
++#define ISP176x_HC_ISO_PTD_SKIPMAP	0x134
++#define ISP176x_HC_ISO_PTD_LASTPTD	0x138
++#define ISP176x_HC_INT_PTD_DONEMAP	0x140
++#define ISP176x_HC_INT_PTD_SKIPMAP	0x144
++#define ISP176x_HC_INT_PTD_LASTPTD	0x148
++#define ISP176x_HC_ATL_PTD_DONEMAP	0x150
++#define ISP176x_HC_ATL_PTD_SKIPMAP	0x154
++#define ISP176x_HC_ATL_PTD_LASTPTD	0x158
+ 
+ /* Configuration Register */
+-#define HC_HW_MODE_CTRL		0x300
+-#define ALL_ATX_RESET		(1 << 31)
+-#define HW_ANA_DIGI_OC		(1 << 15)
+-#define HW_DEV_DMA		(1 << 11)
+-#define HW_COMN_IRQ		(1 << 10)
+-#define HW_COMN_DMA		(1 << 9)
+-#define HW_DATA_BUS_32BIT	(1 << 8)
+-#define HW_DACK_POL_HIGH	(1 << 6)
+-#define HW_DREQ_POL_HIGH	(1 << 5)
+-#define HW_INTR_HIGH_ACT	(1 << 2)
+-#define HW_INTR_EDGE_TRIG	(1 << 1)
+-#define HW_GLOBAL_INTR_EN	(1 << 0)
+-
+-#define HC_CHIP_ID_REG		0x304
+-#define HC_SCRATCH_REG		0x308
+-
+-#define HC_RESET_REG		0x30c
+-#define SW_RESET_RESET_HC	(1 << 1)
+-#define SW_RESET_RESET_ALL	(1 << 0)
+-
+-#define HC_BUFFER_STATUS_REG	0x334
+-#define ISO_BUF_FILL		(1 << 2)
+-#define INT_BUF_FILL		(1 << 1)
+-#define ATL_BUF_FILL		(1 << 0)
+-
+-#define HC_MEMORY_REG		0x33c
+-#define ISP_BANK(x)		((x) << 16)
+-
+-#define HC_PORT1_CTRL		0x374
+-#define PORT1_POWER		(3 << 3)
+-#define PORT1_INIT1		(1 << 7)
+-#define PORT1_INIT2		(1 << 23)
+-#define HW_OTG_CTRL_SET		0x374
+-#define HW_OTG_CTRL_CLR		0x376
+-#define HW_OTG_DISABLE		(1 << 10)
+-#define HW_OTG_SE0_EN		(1 << 9)
+-#define HW_BDIS_ACON_EN		(1 << 8)
+-#define HW_SW_SEL_HC_DC		(1 << 7)
+-#define HW_VBUS_CHRG		(1 << 6)
+-#define HW_VBUS_DISCHRG		(1 << 5)
+-#define HW_VBUS_DRV		(1 << 4)
+-#define HW_SEL_CP_EXT		(1 << 3)
+-#define HW_DM_PULLDOWN		(1 << 2)
+-#define HW_DP_PULLDOWN		(1 << 1)
+-#define HW_DP_PULLUP		(1 << 0)
++#define ISP176x_HC_HW_MODE_CTRL		0x300
++#define ISP176x_HC_CHIP_ID		0x304
++#define ISP176x_HC_SCRATCH		0x308
++#define ISP176x_HC_RESET		0x30c
++#define ISP176x_HC_BUFFER_STATUS	0x334
++#define ISP176x_HC_MEMORY		0x33c
+ 
+ /* Interrupt Register */
+-#define HC_INTERRUPT_REG	0x310
+-
+-#define HC_INTERRUPT_ENABLE	0x314
+-#define HC_ISO_INT		(1 << 9)
+-#define HC_ATL_INT		(1 << 8)
+-#define HC_INTL_INT		(1 << 7)
+-#define HC_EOT_INT		(1 << 3)
+-#define HC_SOT_INT		(1 << 1)
+-#define INTERRUPT_ENABLE_MASK	(HC_INTL_INT | HC_ATL_INT)
+-
+-#define HC_ISO_IRQ_MASK_OR_REG	0x318
+-#define HC_INT_IRQ_MASK_OR_REG	0x31c
+-#define HC_ATL_IRQ_MASK_OR_REG	0x320
+-#define HC_ISO_IRQ_MASK_AND_REG	0x324
+-#define HC_INT_IRQ_MASK_AND_REG	0x328
+-#define HC_ATL_IRQ_MASK_AND_REG	0x32c
++#define ISP176x_HC_INTERRUPT		0x310
++#define ISP176x_HC_INTERRUPT_ENABLE	0x314
++#define ISP176x_HC_ISO_IRQ_MASK_OR	0x318
++#define ISP176x_HC_INT_IRQ_MASK_OR	0x31c
++#define ISP176x_HC_ATL_IRQ_MASK_OR	0x320
++#define ISP176x_HC_ISO_IRQ_MASK_AND	0x324
++#define ISP176x_HC_INT_IRQ_MASK_AND	0x328
++#define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
++
++enum isp176x_host_controller_fields {
++	/* HC_HCSPARAMS */
++	HCS_PPC, HCS_N_PORTS,
++	/* HC_HCCPARAMS */
++	HCC_ISOC_CACHE, HCC_ISOC_THRES,
++	/* HC_USBCMD */
++	CMD_LRESET, CMD_RESET, CMD_RUN,
++	/* HC_USBSTS */
++	STS_PCD,
++	/* HC_FRINDEX */
++	HC_FRINDEX,
++	/* HC_CONFIGFLAG */
++	FLAG_CF,
++	/* HC_PORTSC1 */
++	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
++	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
++	/* HC_HW_MODE_CTRL */
++	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
++	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_ACT,
++	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
++	/* HC_RESET */
++	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
++	/* HC_BUFFER_STATUS */
++	INT_BUF_FILL, ATL_BUF_FILL,
++	/* HC_MEMORY */
++	MEM_BANK_SEL, MEM_START_ADDR,
++	/* HC_INTERRUPT_ENABLE */
++	HC_INT_ENABLE,
++	/* Last element */
++	HC_FIELD_MAX,
++};
+ 
+ /* -----------------------------------------------------------------------------
+  * Peripheral Controller
+  */
+ 
+-/* Initialization Registers */
+-#define DC_ADDRESS			0x0200
+-#define DC_DEVEN			(1 << 7)
+-
+-#define DC_MODE				0x020c
+-#define DC_DMACLKON			(1 << 9)
+-#define DC_VBUSSTAT			(1 << 8)
+-#define DC_CLKAON			(1 << 7)
+-#define DC_SNDRSU			(1 << 6)
+-#define DC_GOSUSP			(1 << 5)
+-#define DC_SFRESET			(1 << 4)
+-#define DC_GLINTENA			(1 << 3)
+-#define DC_WKUPCS			(1 << 2)
+-
+-#define DC_INTCONF			0x0210
+-#define DC_CDBGMOD_ACK_NAK		(0 << 6)
+-#define DC_CDBGMOD_ACK			(1 << 6)
+-#define DC_CDBGMOD_ACK_1NAK		(2 << 6)
+-#define DC_DDBGMODIN_ACK_NAK		(0 << 4)
+-#define DC_DDBGMODIN_ACK		(1 << 4)
+-#define DC_DDBGMODIN_ACK_1NAK		(2 << 4)
+-#define DC_DDBGMODOUT_ACK_NYET_NAK	(0 << 2)
+-#define DC_DDBGMODOUT_ACK_NYET		(1 << 2)
+-#define DC_DDBGMODOUT_ACK_NYET_1NAK	(2 << 2)
+-#define DC_INTLVL			(1 << 1)
+-#define DC_INTPOL			(1 << 0)
+-
+-#define DC_DEBUG			0x0212
+-#define DC_INTENABLE			0x0214
+ #define DC_IEPTX(n)			(1 << (11 + 2 * (n)))
+ #define DC_IEPRX(n)			(1 << (10 + 2 * (n)))
+ #define DC_IEPRXTX(n)			(3 << (10 + 2 * (n)))
+-#define DC_IEP0SETUP			(1 << 8)
+-#define DC_IEVBUS			(1 << 7)
+-#define DC_IEDMA			(1 << 6)
+-#define DC_IEHS_STA			(1 << 5)
+-#define DC_IERESM			(1 << 4)
+-#define DC_IESUSP			(1 << 3)
+-#define DC_IEPSOF			(1 << 2)
+-#define DC_IESOF			(1 << 1)
+-#define DC_IEBRST			(1 << 0)
++
++#define ISP176x_DC_CDBGMOD_ACK		BIT(6)
++#define ISP176x_DC_DDBGMODIN_ACK	BIT(4)
++#define ISP176x_DC_DDBGMODOUT_ACK	BIT(2)
++
++#define ISP176x_DC_IEP0SETUP		BIT(8)
++#define ISP176x_DC_IEVBUS		BIT(7)
++#define ISP176x_DC_IEHS_STA		BIT(5)
++#define ISP176x_DC_IERESM		BIT(4)
++#define ISP176x_DC_IESUSP		BIT(3)
++#define ISP176x_DC_IEBRST		BIT(0)
++
++#define ISP176x_DC_ENDPTYP_ISOC		0x01
++#define ISP176x_DC_ENDPTYP_BULK		0x02
++#define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
++
++/* Initialization Registers */
++#define ISP176x_DC_ADDRESS		0x0200
++#define ISP176x_DC_MODE			0x020c
++#define ISP176x_DC_INTCONF		0x0210
++#define ISP176x_DC_DEBUG		0x0212
++#define ISP176x_DC_INTENABLE		0x0214
+ 
+ /* Data Flow Registers */
+-#define DC_EPINDEX			0x022c
+-#define DC_EP0SETUP			(1 << 5)
+-#define DC_ENDPIDX(n)			((n) << 1)
+-#define DC_EPDIR			(1 << 0)
+-
+-#define DC_CTRLFUNC			0x0228
+-#define DC_CLBUF			(1 << 4)
+-#define DC_VENDP			(1 << 3)
+-#define DC_DSEN				(1 << 2)
+-#define DC_STATUS			(1 << 1)
+-#define DC_STALL			(1 << 0)
+-
+-#define DC_DATAPORT			0x0220
+-#define DC_BUFLEN			0x021c
+-#define DC_DATACOUNT_MASK		0xffff
+-#define DC_BUFSTAT			0x021e
+-#define DC_EPMAXPKTSZ			0x0204
+-
+-#define DC_EPTYPE			0x0208
+-#define DC_NOEMPKT			(1 << 4)
+-#define DC_EPENABLE			(1 << 3)
+-#define DC_DBLBUF			(1 << 2)
+-#define DC_ENDPTYP_ISOC			(1 << 0)
+-#define DC_ENDPTYP_BULK			(2 << 0)
+-#define DC_ENDPTYP_INTERRUPT		(3 << 0)
++#define ISP176x_DC_EPMAXPKTSZ		0x0204
++#define ISP176x_DC_EPTYPE		0x0208
++
++#define ISP176x_DC_BUFLEN		0x021c
++#define ISP176x_DC_BUFSTAT		0x021e
++#define ISP176x_DC_DATAPORT		0x0220
++
++#define ISP176x_DC_CTRLFUNC		0x0228
++#define ISP176x_DC_EPINDEX		0x022c
++
++#define ISP1761_DC_OTG_CTRL_SET		0x374
++#define ISP1761_DC_OTG_CTRL_CLEAR	0x376
+ 
+ /* DMA Registers */
+-#define DC_DMACMD			0x0230
+-#define DC_DMATXCOUNT			0x0234
+-#define DC_DMACONF			0x0238
+-#define DC_DMAHW			0x023c
+-#define DC_DMAINTREASON			0x0250
+-#define DC_DMAINTEN			0x0254
+-#define DC_DMAEP			0x0258
+-#define DC_DMABURSTCOUNT		0x0264
++#define ISP176x_DC_DMACMD		0x0230
++#define ISP176x_DC_DMATXCOUNT		0x0234
++#define ISP176x_DC_DMACONF		0x0238
++#define ISP176x_DC_DMAHW		0x023c
++#define ISP176x_DC_DMAINTREASON		0x0250
++#define ISP176x_DC_DMAINTEN		0x0254
++#define ISP176x_DC_DMAEP		0x0258
++#define ISP176x_DC_DMABURSTCOUNT	0x0264
+ 
+ /* General Registers */
+-#define DC_INTERRUPT			0x0218
+-#define DC_CHIPID			0x0270
+-#define DC_FRAMENUM			0x0274
+-#define DC_SCRATCH			0x0278
+-#define DC_UNLOCKDEV			0x027c
+-#define DC_INTPULSEWIDTH		0x0280
+-#define DC_TESTMODE			0x0284
++#define ISP176x_DC_INTERRUPT		0x0218
++#define ISP176x_DC_CHIPID		0x0270
++#define ISP176x_DC_FRAMENUM		0x0274
++#define ISP176x_DC_SCRATCH		0x0278
++#define ISP176x_DC_UNLOCKDEV		0x027c
++#define ISP176x_DC_INTPULSEWIDTH	0x0280
++#define ISP176x_DC_TESTMODE		0x0284
++
++enum isp176x_device_controller_fields {
++	/* DC_ADDRESS */
++	DC_DEVEN, DC_DEVADDR,
++	/* DC_MODE */
++	DC_VBUSSTAT, DC_SFRESET, DC_GLINTENA,
++	/* DC_INTCONF */
++	DC_CDBGMOD_ACK, DC_DDBGMODIN_ACK, DC_DDBGMODOUT_ACK, DC_INTPOL,
++	/* DC_INTENABLE */
++	DC_IEPRXTX_7, DC_IEPRXTX_6, DC_IEPRXTX_5, DC_IEPRXTX_4, DC_IEPRXTX_3,
++	DC_IEPRXTX_2, DC_IEPRXTX_1, DC_IEPRXTX_0,
++	DC_IEP0SETUP, DC_IEVBUS, DC_IEHS_STA, DC_IERESM, DC_IESUSP, DC_IEBRST,
++	/* DC_EPINDEX */
++	DC_EP0SETUP, DC_ENDPIDX, DC_EPDIR,
++	/* DC_CTRLFUNC */
++	DC_CLBUF, DC_VENDP, DC_DSEN, DC_STATUS, DC_STALL,
++	/* DC_BUFLEN */
++	DC_BUFLEN,
++	/* DC_EPMAXPKTSZ */
++	DC_FFOSZ,
++	/* DC_EPTYPE */
++	DC_EPENABLE, DC_ENDPTYP,
++	/* DC_FRAMENUM */
++	DC_FRAMENUM, DC_UFRAMENUM,
++	/* HW_OTG_CTRL_SET */
++	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
++	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
++	/* HW_OTG_CTRL_CLR */
++	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
++	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
++	HW_DP_PULLUP_CLEAR,
++	/* Last element */
++	DC_FIELD_MAX,
++};
+ 
+ #endif
+diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
+index 1714b2258b54..1e2ca43fb152 100644
+--- a/drivers/usb/isp1760/isp1760-udc.c
++++ b/drivers/usb/isp1760/isp1760-udc.c
+@@ -45,16 +45,62 @@ static inline struct isp1760_request *req_to_udc_req(struct usb_request *req)
+ 	return container_of(req, struct isp1760_request, req);
+ }
+ 
+-static inline u32 isp1760_udc_read(struct isp1760_udc *udc, u16 reg)
++static u32 isp1760_udc_read(struct isp1760_udc *udc, u16 field)
+ {
+-	return isp1760_read32(udc->regs, reg);
++	return isp1760_field_read(udc->fields, field);
+ }
+ 
+-static inline void isp1760_udc_write(struct isp1760_udc *udc, u16 reg, u32 val)
++static void isp1760_udc_write(struct isp1760_udc *udc, u16 field, u32 val)
+ {
+-	isp1760_write32(udc->regs, reg, val);
++	isp1760_field_write(udc->fields, field, val);
+ }
+ 
++static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
++{
++	__le32 val;
++
++	regmap_raw_read(udc->regs, reg, &val, 4);
++
++	return le32_to_cpu(val);
++}
++
++static u16 isp1760_udc_read_raw16(struct isp1760_udc *udc, u16 reg)
++{
++	__le16 val;
++
++	regmap_raw_read(udc->regs, reg, &val, 2);
++
++	return le16_to_cpu(val);
++}
++
++static void isp1760_udc_write_raw(struct isp1760_udc *udc, u16 reg, u32 val)
++{
++	__le32 val_le = cpu_to_le32(val);
++
++	regmap_raw_write(udc->regs, reg, &val_le, 4);
++}
++
++static void isp1760_udc_write_raw16(struct isp1760_udc *udc, u16 reg, u16 val)
++{
++	__le16 val_le = cpu_to_le16(val);
++
++	regmap_raw_write(udc->regs, reg, &val_le, 2);
++}
++
++static void isp1760_udc_set(struct isp1760_udc *udc, u32 field)
++{
++	isp1760_udc_write(udc, field, 0xFFFFFFFF);
++}
++
++static void isp1760_udc_clear(struct isp1760_udc *udc, u32 field)
++{
++	isp1760_udc_write(udc, field, 0);
++}
++
++static bool isp1760_udc_is_set(struct isp1760_udc *udc, u32 field)
++{
++	return !!isp1760_udc_read(udc, field);
++}
+ /* -----------------------------------------------------------------------------
+  * Endpoint Management
+  */
+@@ -75,11 +121,15 @@ static struct isp1760_ep *isp1760_udc_find_ep(struct isp1760_udc *udc,
+ 	return NULL;
+ }
+ 
+-static void __isp1760_udc_select_ep(struct isp1760_ep *ep, int dir)
++static void __isp1760_udc_select_ep(struct isp1760_udc *udc,
++				    struct isp1760_ep *ep, int dir)
+ {
+-	isp1760_udc_write(ep->udc, DC_EPINDEX,
+-			  DC_ENDPIDX(ep->addr & USB_ENDPOINT_NUMBER_MASK) |
+-			  (dir == USB_DIR_IN ? DC_EPDIR : 0));
++	isp1760_udc_write(udc, DC_ENDPIDX, ep->addr & USB_ENDPOINT_NUMBER_MASK);
++
++	if (dir == USB_DIR_IN)
++		isp1760_udc_set(udc, DC_EPDIR);
++	else
++		isp1760_udc_clear(udc, DC_EPDIR);
+ }
+ 
+ /**
+@@ -93,9 +143,10 @@ static void __isp1760_udc_select_ep(struct isp1760_ep *ep, int dir)
+  *
+  * Called with the UDC spinlock held.
+  */
+-static void isp1760_udc_select_ep(struct isp1760_ep *ep)
++static void isp1760_udc_select_ep(struct isp1760_udc *udc,
++				  struct isp1760_ep *ep)
+ {
+-	__isp1760_udc_select_ep(ep, ep->addr & USB_ENDPOINT_DIR_MASK);
++	__isp1760_udc_select_ep(udc, ep, ep->addr & USB_ENDPOINT_DIR_MASK);
+ }
+ 
+ /* Called with the UDC spinlock held. */
+@@ -108,9 +159,13 @@ static void isp1760_udc_ctrl_send_status(struct isp1760_ep *ep, int dir)
+ 	 * the direction opposite to the data stage data packets, we thus need
+ 	 * to select the OUT/IN endpoint for IN/OUT transfers.
+ 	 */
+-	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) |
+-			  (dir == USB_DIR_IN ? 0 : DC_EPDIR));
+-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STATUS);
++	if (dir == USB_DIR_IN)
++		isp1760_udc_clear(udc, DC_EPDIR);
++	else
++		isp1760_udc_set(udc, DC_EPDIR);
++
++	isp1760_udc_write(udc, DC_ENDPIDX, 1);
++	isp1760_udc_set(udc, DC_STATUS);
+ 
+ 	/*
+ 	 * The hardware will terminate the request automatically and go back to
+@@ -157,10 +212,10 @@ static void isp1760_udc_ctrl_send_stall(struct isp1760_ep *ep)
+ 	spin_lock_irqsave(&udc->lock, flags);
+ 
+ 	/* Stall both the IN and OUT endpoints. */
+-	__isp1760_udc_select_ep(ep, USB_DIR_OUT);
+-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
+-	__isp1760_udc_select_ep(ep, USB_DIR_IN);
+-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
++	__isp1760_udc_select_ep(udc, ep, USB_DIR_OUT);
++	isp1760_udc_set(udc, DC_STALL);
++	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
++	isp1760_udc_set(udc, DC_STALL);
+ 
+ 	/* A protocol stall completes the control transaction. */
+ 	udc->ep0_state = ISP1760_CTRL_SETUP;
+@@ -181,8 +236,8 @@ static bool isp1760_udc_receive(struct isp1760_ep *ep,
+ 	u32 *buf;
+ 	int i;
+ 
+-	isp1760_udc_select_ep(ep);
+-	len = isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
++	isp1760_udc_select_ep(udc, ep);
++	len = isp1760_udc_read(udc, DC_BUFLEN);
+ 
+ 	dev_dbg(udc->isp->dev, "%s: received %u bytes (%u/%u done)\n",
+ 		__func__, len, req->req.actual, req->req.length);
+@@ -198,7 +253,7 @@ static bool isp1760_udc_receive(struct isp1760_ep *ep,
+ 		 * datasheet doesn't clearly document how this should be
+ 		 * handled.
+ 		 */
+-		isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
++		isp1760_udc_set(udc, DC_CLBUF);
+ 		return false;
+ 	}
+ 
+@@ -209,9 +264,9 @@ static bool isp1760_udc_receive(struct isp1760_ep *ep,
+ 	 * the next packet might be removed from the FIFO.
+ 	 */
+ 	for (i = len; i > 2; i -= 4, ++buf)
+-		*buf = le32_to_cpu(isp1760_udc_read(udc, DC_DATAPORT));
++		*buf = isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
+ 	if (i > 0)
+-		*(u16 *)buf = le16_to_cpu(readw(udc->regs + DC_DATAPORT));
++		*(u16 *)buf = isp1760_udc_read_raw16(udc, ISP176x_DC_DATAPORT);
+ 
+ 	req->req.actual += len;
+ 
+@@ -253,7 +308,7 @@ static void isp1760_udc_transmit(struct isp1760_ep *ep,
+ 		__func__, req->packet_size, req->req.actual,
+ 		req->req.length);
+ 
+-	__isp1760_udc_select_ep(ep, USB_DIR_IN);
++	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
+ 
+ 	if (req->packet_size)
+ 		isp1760_udc_write(udc, DC_BUFLEN, req->packet_size);
+@@ -265,14 +320,14 @@ static void isp1760_udc_transmit(struct isp1760_ep *ep,
+ 	 * the FIFO for this kind of conditions, but doesn't seem to work.
+ 	 */
+ 	for (i = req->packet_size; i > 2; i -= 4, ++buf)
+-		isp1760_udc_write(udc, DC_DATAPORT, cpu_to_le32(*buf));
++		isp1760_udc_write_raw(udc, ISP176x_DC_DATAPORT, *buf);
+ 	if (i > 0)
+-		writew(cpu_to_le16(*(u16 *)buf), udc->regs + DC_DATAPORT);
++		isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, *(u16 *)buf);
+ 
+ 	if (ep->addr == 0)
+-		isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
++		isp1760_udc_set(udc, DC_DSEN);
+ 	if (!req->packet_size)
+-		isp1760_udc_write(udc, DC_CTRLFUNC, DC_VENDP);
++		isp1760_udc_set(udc, DC_VENDP);
+ }
+ 
+ static void isp1760_ep_rx_ready(struct isp1760_ep *ep)
+@@ -408,19 +463,24 @@ static int __isp1760_udc_set_halt(struct isp1760_ep *ep, bool halt)
+ 		return -EINVAL;
+ 	}
+ 
+-	isp1760_udc_select_ep(ep);
+-	isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
++	isp1760_udc_select_ep(udc, ep);
++
++	if (halt)
++		isp1760_udc_set(udc, DC_STALL);
++	else
++		isp1760_udc_clear(udc, DC_STALL);
+ 
+ 	if (ep->addr == 0) {
+ 		/* When halting the control endpoint, stall both IN and OUT. */
+-		__isp1760_udc_select_ep(ep, USB_DIR_IN);
+-		isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
++		__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
++		if (halt)
++			isp1760_udc_set(udc, DC_STALL);
++		else
++			isp1760_udc_clear(udc, DC_STALL);
+ 	} else if (!halt) {
+ 		/* Reset the data PID by cycling the endpoint enable bit. */
+-		u16 eptype = isp1760_udc_read(udc, DC_EPTYPE);
+-
+-		isp1760_udc_write(udc, DC_EPTYPE, eptype & ~DC_EPENABLE);
+-		isp1760_udc_write(udc, DC_EPTYPE, eptype);
++		isp1760_udc_clear(udc, DC_EPENABLE);
++		isp1760_udc_set(udc, DC_EPENABLE);
+ 
+ 		/*
+ 		 * Disabling the endpoint emptied the transmit FIFO, fill it
+@@ -479,12 +539,14 @@ static int isp1760_udc_get_status(struct isp1760_udc *udc,
+ 		return -EINVAL;
+ 	}
+ 
+-	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) | DC_EPDIR);
++	isp1760_udc_set(udc, DC_EPDIR);
++	isp1760_udc_write(udc, DC_ENDPIDX, 1);
++
+ 	isp1760_udc_write(udc, DC_BUFLEN, 2);
+ 
+-	writew(cpu_to_le16(status), udc->regs + DC_DATAPORT);
++	isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, status);
+ 
+-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
++	isp1760_udc_set(udc, DC_DSEN);
+ 
+ 	dev_dbg(udc->isp->dev, "%s: status 0x%04x\n", __func__, status);
+ 
+@@ -508,7 +570,8 @@ static int isp1760_udc_set_address(struct isp1760_udc *udc, u16 addr)
+ 	usb_gadget_set_state(&udc->gadget, addr ? USB_STATE_ADDRESS :
+ 			     USB_STATE_DEFAULT);
+ 
+-	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN | addr);
++	isp1760_udc_write(udc, DC_DEVADDR, addr);
++	isp1760_udc_set(udc, DC_DEVEN);
+ 
+ 	spin_lock(&udc->lock);
+ 	isp1760_udc_ctrl_send_status(&udc->ep[0], USB_DIR_OUT);
+@@ -650,9 +713,9 @@ static void isp1760_ep0_setup(struct isp1760_udc *udc)
+ 
+ 	spin_lock(&udc->lock);
+ 
+-	isp1760_udc_write(udc, DC_EPINDEX, DC_EP0SETUP);
++	isp1760_udc_set(udc, DC_EP0SETUP);
+ 
+-	count = isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
++	count = isp1760_udc_read(udc, DC_BUFLEN);
+ 	if (count != sizeof(req)) {
+ 		spin_unlock(&udc->lock);
+ 
+@@ -663,8 +726,8 @@ static void isp1760_ep0_setup(struct isp1760_udc *udc)
+ 		return;
+ 	}
+ 
+-	req.data[0] = isp1760_udc_read(udc, DC_DATAPORT);
+-	req.data[1] = isp1760_udc_read(udc, DC_DATAPORT);
++	req.data[0] = isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
++	req.data[1] = isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
+ 
+ 	if (udc->ep0_state != ISP1760_CTRL_SETUP) {
+ 		spin_unlock(&udc->lock);
+@@ -732,13 +795,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
+ 
+ 	switch (usb_endpoint_type(desc)) {
+ 	case USB_ENDPOINT_XFER_ISOC:
+-		type = DC_ENDPTYP_ISOC;
++		type = ISP176x_DC_ENDPTYP_ISOC;
+ 		break;
+ 	case USB_ENDPOINT_XFER_BULK:
+-		type = DC_ENDPTYP_BULK;
++		type = ISP176x_DC_ENDPTYP_BULK;
+ 		break;
+ 	case USB_ENDPOINT_XFER_INT:
+-		type = DC_ENDPTYP_INTERRUPT;
++		type = ISP176x_DC_ENDPTYP_INTERRUPT;
+ 		break;
+ 	case USB_ENDPOINT_XFER_CONTROL:
+ 	default:
+@@ -755,10 +818,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
+ 	uep->halted = false;
+ 	uep->wedged = false;
+ 
+-	isp1760_udc_select_ep(uep);
+-	isp1760_udc_write(udc, DC_EPMAXPKTSZ, uep->maxpacket);
++	isp1760_udc_select_ep(udc, uep);
++
++	isp1760_udc_write(udc, DC_FFOSZ, uep->maxpacket);
+ 	isp1760_udc_write(udc, DC_BUFLEN, uep->maxpacket);
+-	isp1760_udc_write(udc, DC_EPTYPE, DC_EPENABLE | type);
++
++	isp1760_udc_write(udc, DC_ENDPTYP, type);
++	isp1760_udc_set(udc, DC_EPENABLE);
+ 
+ 	spin_unlock_irqrestore(&udc->lock, flags);
+ 
+@@ -786,8 +852,9 @@ static int isp1760_ep_disable(struct usb_ep *ep)
+ 	uep->desc = NULL;
+ 	uep->maxpacket = 0;
+ 
+-	isp1760_udc_select_ep(uep);
+-	isp1760_udc_write(udc, DC_EPTYPE, 0);
++	isp1760_udc_select_ep(udc, uep);
++	isp1760_udc_clear(udc, DC_EPENABLE);
++	isp1760_udc_clear(udc, DC_ENDPTYP);
+ 
+ 	/* TODO Synchronize with the IRQ handler */
+ 
+@@ -864,8 +931,8 @@ static int isp1760_ep_queue(struct usb_ep *ep, struct usb_request *_req,
+ 
+ 		case ISP1760_CTRL_DATA_OUT:
+ 			list_add_tail(&req->queue, &uep->queue);
+-			__isp1760_udc_select_ep(uep, USB_DIR_OUT);
+-			isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
++			__isp1760_udc_select_ep(udc, uep, USB_DIR_OUT);
++			isp1760_udc_set(udc, DC_DSEN);
+ 			break;
+ 
+ 		case ISP1760_CTRL_STATUS:
+@@ -1025,14 +1092,14 @@ static void isp1760_ep_fifo_flush(struct usb_ep *ep)
+ 
+ 	spin_lock_irqsave(&udc->lock, flags);
+ 
+-	isp1760_udc_select_ep(uep);
++	isp1760_udc_select_ep(udc, uep);
+ 
+ 	/*
+ 	 * Set the CLBUF bit twice to flush both buffers in case double
+ 	 * buffering is enabled.
+ 	 */
+-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
+-	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
++	isp1760_udc_set(udc, DC_CLBUF);
++	isp1760_udc_set(udc, DC_CLBUF);
+ 
+ 	spin_unlock_irqrestore(&udc->lock, flags);
+ }
+@@ -1091,19 +1158,22 @@ static void isp1760_udc_init_hw(struct isp1760_udc *udc)
+ 	 * ACK tokens only (and NYET for the out pipe). The default
+ 	 * configuration also generates an interrupt on the first NACK token.
+ 	 */
+-	isp1760_udc_write(udc, DC_INTCONF, DC_CDBGMOD_ACK | DC_DDBGMODIN_ACK |
+-			  DC_DDBGMODOUT_ACK_NYET);
+-
+-	isp1760_udc_write(udc, DC_INTENABLE, DC_IEPRXTX(7) | DC_IEPRXTX(6) |
+-			  DC_IEPRXTX(5) | DC_IEPRXTX(4) | DC_IEPRXTX(3) |
+-			  DC_IEPRXTX(2) | DC_IEPRXTX(1) | DC_IEPRXTX(0) |
+-			  DC_IEP0SETUP | DC_IEVBUS | DC_IERESM | DC_IESUSP |
+-			  DC_IEHS_STA | DC_IEBRST);
++	isp1760_reg_write(udc->regs, ISP176x_DC_INTCONF,
++			  ISP176x_DC_CDBGMOD_ACK | ISP176x_DC_DDBGMODIN_ACK |
++			  ISP176x_DC_DDBGMODOUT_ACK);
++
++	isp1760_reg_write(udc->regs, ISP176x_DC_INTENABLE, DC_IEPRXTX(7) |
++			  DC_IEPRXTX(6) | DC_IEPRXTX(5) | DC_IEPRXTX(4) |
++			  DC_IEPRXTX(3) | DC_IEPRXTX(2) | DC_IEPRXTX(1) |
++			  DC_IEPRXTX(0) | ISP176x_DC_IEP0SETUP |
++			  ISP176x_DC_IEVBUS | ISP176x_DC_IERESM |
++			  ISP176x_DC_IESUSP | ISP176x_DC_IEHS_STA |
++			  ISP176x_DC_IEBRST);
+ 
+ 	if (udc->connected)
+ 		isp1760_set_pullup(udc->isp, true);
+ 
+-	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN);
++	isp1760_udc_set(udc, DC_DEVEN);
+ }
+ 
+ static void isp1760_udc_reset(struct isp1760_udc *udc)
+@@ -1152,7 +1222,7 @@ static int isp1760_udc_get_frame(struct usb_gadget *gadget)
+ {
+ 	struct isp1760_udc *udc = gadget_to_udc(gadget);
+ 
+-	return isp1760_udc_read(udc, DC_FRAMENUM) & ((1 << 11) - 1);
++	return isp1760_udc_read(udc, DC_FRAMENUM);
+ }
+ 
+ static int isp1760_udc_wakeup(struct usb_gadget *gadget)
+@@ -1219,7 +1289,7 @@ static int isp1760_udc_start(struct usb_gadget *gadget,
+ 	usb_gadget_set_state(&udc->gadget, USB_STATE_ATTACHED);
+ 
+ 	/* DMA isn't supported yet, don't enable the DMA clock. */
+-	isp1760_udc_write(udc, DC_MODE, DC_GLINTENA);
++	isp1760_udc_set(udc, DC_GLINTENA);
+ 
+ 	isp1760_udc_init_hw(udc);
+ 
+@@ -1238,7 +1308,7 @@ static int isp1760_udc_stop(struct usb_gadget *gadget)
+ 
+ 	del_timer_sync(&udc->vbus_timer);
+ 
+-	isp1760_udc_write(udc, DC_MODE, 0);
++	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
+ 
+ 	spin_lock_irqsave(&udc->lock, flags);
+ 	udc->driver = NULL;
+@@ -1266,9 +1336,9 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
+ 	unsigned int i;
+ 	u32 status;
+ 
+-	status = isp1760_udc_read(udc, DC_INTERRUPT)
+-	       & isp1760_udc_read(udc, DC_INTENABLE);
+-	isp1760_udc_write(udc, DC_INTERRUPT, status);
++	status = isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
++	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
++	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
+ 
+ 	if (status & DC_IEVBUS) {
+ 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
+@@ -1313,7 +1383,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
+ 		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
+ 
+ 		spin_lock(&udc->lock);
+-		if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
++		if (!isp1760_udc_is_set(udc, DC_VBUSSTAT))
+ 			isp1760_udc_disconnect(udc);
+ 		else
+ 			isp1760_udc_suspend(udc);
+@@ -1335,7 +1405,7 @@ static void isp1760_udc_vbus_poll(struct timer_list *t)
+ 
+ 	spin_lock_irqsave(&udc->lock, flags);
+ 
+-	if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
++	if (!(isp1760_udc_is_set(udc, DC_VBUSSTAT)))
+ 		isp1760_udc_disconnect(udc);
+ 	else if (udc->gadget.state >= USB_STATE_POWERED)
+ 		mod_timer(&udc->vbus_timer,
+@@ -1412,9 +1482,9 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
+ 	 * register, and reading the scratch register value back. The chip ID
+ 	 * and scratch register contents must match the expected values.
+ 	 */
+-	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
+-	chipid = isp1760_udc_read(udc, DC_CHIPID);
+-	scratch = isp1760_udc_read(udc, DC_SCRATCH);
++	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
++	chipid = isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
++	scratch = isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
+ 
+ 	if (scratch != 0xbabe) {
+ 		dev_err(udc->isp->dev,
+@@ -1429,9 +1499,9 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
+ 	}
+ 
+ 	/* Reset the device controller. */
+-	isp1760_udc_write(udc, DC_MODE, DC_SFRESET);
++	isp1760_udc_set(udc, DC_SFRESET);
+ 	usleep_range(10000, 11000);
+-	isp1760_udc_write(udc, DC_MODE, 0);
++	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
+ 	usleep_range(10000, 11000);
+ 
+ 	return 0;
+@@ -1445,7 +1515,6 @@ int isp1760_udc_register(struct isp1760_device *isp, int irq,
+ 
+ 	udc->irq = -1;
+ 	udc->isp = isp;
+-	udc->regs = isp->regs;
+ 
+ 	spin_lock_init(&udc->lock);
+ 	timer_setup(&udc->vbus_timer, isp1760_udc_vbus_poll, 0);
+diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
+index d2df650d54e9..a49096c0ac8e 100644
+--- a/drivers/usb/isp1760/isp1760-udc.h
++++ b/drivers/usb/isp1760/isp1760-udc.h
+@@ -17,6 +17,8 @@
+ #include <linux/timer.h>
+ #include <linux/usb/gadget.h>
+ 
++#include "isp1760-regs.h"
++
+ struct isp1760_device;
+ struct isp1760_udc;
+ 
+@@ -48,7 +50,7 @@ struct isp1760_ep {
+  * struct isp1760_udc - UDC state information
+  * irq: IRQ number
+  * irqname: IRQ name (as passed to request_irq)
+- * regs: Base address of the UDC registers
++ * regs: regmap for UDC registers
+  * driver: Gadget driver
+  * gadget: Gadget device
+  * lock: Protects driver, vbus_timer, ep, ep0_*, DC_EPINDEX register
+@@ -59,12 +61,13 @@ struct isp1760_ep {
+  * connected: Tracks gadget driver bus connection state
+  */
+ struct isp1760_udc {
+-#ifdef CONFIG_USB_ISP1761_UDC
+ 	struct isp1760_device *isp;
+ 
+ 	int irq;
+ 	char *irqname;
+-	void __iomem *regs;
++
++	struct regmap *regs;
++	struct regmap_field *fields[DC_FIELD_MAX];
+ 
+ 	struct usb_gadget_driver *driver;
+ 	struct usb_gadget gadget;
+@@ -81,7 +84,6 @@ struct isp1760_udc {
+ 	bool connected;
+ 
+ 	unsigned int devstatus;
+-#endif
+ };
+ 
+ #ifdef CONFIG_USB_ISP1761_UDC
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-usb-isp1760-use-relaxed-primitives.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-usb-isp1760-use-relaxed-primitives.patch
new file mode 100644
index 0000000..2e2e97a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-usb-isp1760-use-relaxed-primitives.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 03e28d5233d50fb2a27fa02d032e77974d03eb2b Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:11 +0100
+Subject: [PATCH 03/23] usb: isp1760: use relaxed primitives
+
+Use io relaxed access memory primitives to satisfy strict type
+checking (__force).
+
+This will fix some existing sparse warnings:
+sparse: warning: cast to restricted __le32
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-4-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 20d142140574..2cc0555e029d 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -246,7 +246,7 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
+ 
+ 	if (src_offset < PAYLOAD_OFFSET) {
+ 		while (bytes >= 4) {
+-			*dst = le32_to_cpu(__raw_readl(src));
++			*dst = readl_relaxed(src);
+ 			bytes -= 4;
+ 			src++;
+ 			dst++;
+@@ -267,7 +267,7 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
+ 	 * allocated.
+ 	 */
+ 	if (src_offset < PAYLOAD_OFFSET)
+-		val = le32_to_cpu(__raw_readl(src));
++		val = readl_relaxed(src);
+ 	else
+ 		val = __raw_readl(src);
+ 
+@@ -301,7 +301,7 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
+ 
+ 	if (dst_offset < PAYLOAD_OFFSET) {
+ 		while (bytes >= 4) {
+-			__raw_writel(cpu_to_le32(*src), dst);
++			writel_relaxed(*src, dst);
+ 			bytes -= 4;
+ 			src++;
+ 			dst++;
+@@ -322,7 +322,7 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
+ 	 */
+ 
+ 	if (dst_offset < PAYLOAD_OFFSET)
+-		__raw_writel(cpu_to_le32(*src), dst);
++		writel_relaxed(*src, dst);
+ 	else
+ 		__raw_writel(*src, dst);
+ }
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-usb-isp1760-remove-platform-data-struct-and-code.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-usb-isp1760-remove-platform-data-struct-and-code.patch
new file mode 100644
index 0000000..b8a3fab
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-usb-isp1760-remove-platform-data-struct-and-code.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From f9a88370e6751c68a8f0d1c3f23100ca20596249 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:12 +0100
+Subject: [PATCH 04/23] usb: isp1760: remove platform data struct and code
+
+Since the removal of the Blackfin port with:
+commit 4ba66a976072 ("arch: remove blackfin port")
+
+No one is using or referencing this header and platform data struct.
+Remove them.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-5-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-if.c | 20 +++-----------------
+ 1 file changed, 3 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
+index abfba9f5ec23..fb6701608cd8 100644
+--- a/drivers/usb/isp1760/isp1760-if.c
++++ b/drivers/usb/isp1760/isp1760-if.c
+@@ -16,7 +16,6 @@
+ #include <linux/of.h>
+ #include <linux/platform_device.h>
+ #include <linux/slab.h>
+-#include <linux/usb/isp1760.h>
+ #include <linux/usb/hcd.h>
+ 
+ #include "isp1760-core.h"
+@@ -225,22 +224,9 @@ static int isp1760_plat_probe(struct platform_device *pdev)
+ 
+ 		if (of_property_read_bool(dp, "dreq-polarity"))
+ 			devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
+-	} else if (dev_get_platdata(&pdev->dev)) {
+-		struct isp1760_platform_data *pdata =
+-			dev_get_platdata(&pdev->dev);
+-
+-		if (pdata->is_isp1761)
+-			devflags |= ISP1760_FLAG_ISP1761;
+-		if (pdata->bus_width_16)
+-			devflags |= ISP1760_FLAG_BUS_WIDTH_16;
+-		if (pdata->port1_otg)
+-			devflags |= ISP1760_FLAG_OTG_EN;
+-		if (pdata->analog_oc)
+-			devflags |= ISP1760_FLAG_ANALOG_OC;
+-		if (pdata->dack_polarity_high)
+-			devflags |= ISP1760_FLAG_DACK_POL_HIGH;
+-		if (pdata->dreq_polarity_high)
+-			devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
++	} else {
++		pr_err("isp1760: no platform data\n");
++		return -ENXIO;
+ 	}
+ 
+ 	ret = isp1760_register(mem_res, irq_res->start, irqflags, &pdev->dev,
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
new file mode 100644
index 0000000..238c1bd
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
@@ -0,0 +1,304 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From a74f639c5b5618e2c9f311c93bc3e7405de8ca85 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:13 +0100
+Subject: [PATCH 05/23] usb: isp1760: hcd: refactor mempool config and setup
+
+In preparation to support other family member IP, which may have
+different memory layout. Drop macros and setup a configuration
+struct.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-6-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-core.c | 21 ++++++++
+ drivers/usb/isp1760/isp1760-hcd.c  | 83 ++++++++++++++++++++----------
+ drivers/usb/isp1760/isp1760-hcd.h  | 37 ++++++-------
+ 3 files changed, 92 insertions(+), 49 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+index c79ba98df9f9..35a7667e411c 100644
+--- a/drivers/usb/isp1760/isp1760-core.c
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -101,6 +101,25 @@ void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
+ 		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
+ }
+ 
++/*
++ * 60kb divided in:
++ * - 32 blocks @ 256  bytes
++ * - 20 blocks @ 1024 bytes
++ * -  4 blocks @ 8192 bytes
++ */
++static const struct isp1760_memory_layout isp176x_memory_conf = {
++	.blocks[0]		= 32,
++	.blocks_size[0]		= 256,
++	.blocks[1]		= 20,
++	.blocks_size[1]		= 1024,
++	.blocks[2]		= 4,
++	.blocks_size[2]		= 8192,
++
++	.ptd_num		= 32,
++	.payload_blocks		= 32 + 20 + 4,
++	.payload_area_size	= 0xf000,
++};
++
+ static const struct regmap_range isp176x_hc_volatile_ranges[] = {
+ 	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
+ 	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
+@@ -302,6 +321,8 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 		udc->fields[i] = f;
+ 	}
+ 
++	hcd->memory_layout = &isp176x_memory_conf;
++
+ 	isp1760_init_core(isp);
+ 
+ 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 2cc0555e029d..a65f5f917ebe 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -358,39 +358,29 @@ static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
+ /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
+ static void init_memory(struct isp1760_hcd *priv)
+ {
+-	int i, curr;
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	int i, j, curr;
+ 	u32 payload_addr;
+ 
+ 	payload_addr = PAYLOAD_OFFSET;
+-	for (i = 0; i < BLOCK_1_NUM; i++) {
+-		priv->memory_pool[i].start = payload_addr;
+-		priv->memory_pool[i].size = BLOCK_1_SIZE;
+-		priv->memory_pool[i].free = 1;
+-		payload_addr += priv->memory_pool[i].size;
+-	}
+-
+-	curr = i;
+-	for (i = 0; i < BLOCK_2_NUM; i++) {
+-		priv->memory_pool[curr + i].start = payload_addr;
+-		priv->memory_pool[curr + i].size = BLOCK_2_SIZE;
+-		priv->memory_pool[curr + i].free = 1;
+-		payload_addr += priv->memory_pool[curr + i].size;
+-	}
+ 
+-	curr = i;
+-	for (i = 0; i < BLOCK_3_NUM; i++) {
+-		priv->memory_pool[curr + i].start = payload_addr;
+-		priv->memory_pool[curr + i].size = BLOCK_3_SIZE;
+-		priv->memory_pool[curr + i].free = 1;
+-		payload_addr += priv->memory_pool[curr + i].size;
++	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++) {
++		for (j = 0; j < mem->blocks[i]; j++, curr++) {
++			priv->memory_pool[curr + j].start = payload_addr;
++			priv->memory_pool[curr + j].size = mem->blocks_size[i];
++			priv->memory_pool[curr + j].free = 1;
++			payload_addr += priv->memory_pool[curr + j].size;
++		}
+ 	}
+ 
+-	WARN_ON(payload_addr - priv->memory_pool[0].start > PAYLOAD_AREA_SIZE);
++	WARN_ON(payload_addr - priv->memory_pool[0].start >
++		mem->payload_area_size);
+ }
+ 
+ static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
+ 	int i;
+ 
+ 	WARN_ON(qtd->payload_addr);
+@@ -398,7 +388,7 @@ static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
+ 	if (!qtd->length)
+ 		return;
+ 
+-	for (i = 0; i < BLOCKS; i++) {
++	for (i = 0; i < mem->payload_blocks; i++) {
+ 		if (priv->memory_pool[i].size >= qtd->length &&
+ 				priv->memory_pool[i].free) {
+ 			priv->memory_pool[i].free = 0;
+@@ -411,12 +401,13 @@ static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
+ static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
+ 	int i;
+ 
+ 	if (!qtd->payload_addr)
+ 		return;
+ 
+-	for (i = 0; i < BLOCKS; i++) {
++	for (i = 0; i < mem->payload_blocks; i++) {
+ 		if (priv->memory_pool[i].start == qtd->payload_addr) {
+ 			WARN_ON(priv->memory_pool[i].free);
+ 			priv->memory_pool[i].free = 1;
+@@ -1407,8 +1398,6 @@ static int qtd_fill(struct isp1760_qtd *qtd, void *databuffer, size_t len)
+ {
+ 	qtd->data_buffer = databuffer;
+ 
+-	if (len > MAX_PAYLOAD_SIZE)
+-		len = MAX_PAYLOAD_SIZE;
+ 	qtd->length = len;
+ 
+ 	return qtd->length;
+@@ -1432,6 +1421,8 @@ static void qtd_list_free(struct list_head *qtd_list)
+ static void packetize_urb(struct usb_hcd *hcd,
+ 		struct urb *urb, struct list_head *head, gfp_t flags)
+ {
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
+ 	struct isp1760_qtd *qtd;
+ 	void *buf;
+ 	int len, maxpacketsize;
+@@ -1484,6 +1475,10 @@ static void packetize_urb(struct usb_hcd *hcd,
+ 		qtd = qtd_alloc(flags, urb, packet_type);
+ 		if (!qtd)
+ 			goto cleanup;
++
++		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
++			len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
++
+ 		this_qtd_len = qtd_fill(qtd, buf, len);
+ 		list_add_tail(&qtd->qtd_list, head);
+ 
+@@ -2212,6 +2207,7 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
+ 			 int irq, unsigned long irqflags,
+ 			 struct device *dev)
+ {
++	const struct isp1760_memory_layout *mem_layout = priv->memory_layout;
+ 	struct usb_hcd *hcd;
+ 	int ret;
+ 
+@@ -2223,6 +2219,28 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
+ 
+ 	priv->hcd = hcd;
+ 
++	priv->memory_pool = kcalloc(mem_layout->payload_blocks,
++				    sizeof(struct isp1760_memory_chunk),
++				    GFP_KERNEL);
++	if (!priv->memory_pool) {
++		ret = -ENOMEM;
++		goto put_hcd;
++	}
++
++	priv->atl_slots = kcalloc(mem_layout->ptd_num,
++				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
++	if (!priv->atl_slots) {
++		ret = -ENOMEM;
++		goto free_mem_pool;
++	}
++
++	priv->int_slots = kcalloc(mem_layout->ptd_num,
++				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
++	if (!priv->int_slots) {
++		ret = -ENOMEM;
++		goto free_atl_slots;
++	}
++
+ 	init_memory(priv);
+ 
+ 	hcd->irq = irq;
+@@ -2234,13 +2252,19 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
+ 
+ 	ret = usb_add_hcd(hcd, irq, irqflags);
+ 	if (ret)
+-		goto error;
++		goto free_int_slots;
+ 
+ 	device_wakeup_enable(hcd->self.controller);
+ 
+ 	return 0;
+ 
+-error:
++free_int_slots:
++	kfree(priv->int_slots);
++free_atl_slots:
++	kfree(priv->atl_slots);
++free_mem_pool:
++	kfree(priv->memory_pool);
++put_hcd:
+ 	usb_put_hcd(hcd);
+ 	return ret;
+ }
+@@ -2252,4 +2276,7 @@ void isp1760_hcd_unregister(struct isp1760_hcd *priv)
+ 
+ 	usb_remove_hcd(priv->hcd);
+ 	usb_put_hcd(priv->hcd);
++	kfree(priv->atl_slots);
++	kfree(priv->int_slots);
++	kfree(priv->memory_pool);
+ }
+diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
+index 34e1899e52c4..9d2427ce3f1a 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.h
++++ b/drivers/usb/isp1760/isp1760-hcd.h
+@@ -12,24 +12,6 @@ struct isp1760_qtd;
+ struct resource;
+ struct usb_hcd;
+ 
+-/*
+- * 60kb divided in:
+- * - 32 blocks @ 256  bytes
+- * - 20 blocks @ 1024 bytes
+- * -  4 blocks @ 8192 bytes
+- */
+-
+-#define BLOCK_1_NUM 32
+-#define BLOCK_2_NUM 20
+-#define BLOCK_3_NUM 4
+-
+-#define BLOCK_1_SIZE 256
+-#define BLOCK_2_SIZE 1024
+-#define BLOCK_3_SIZE 8192
+-#define BLOCKS (BLOCK_1_NUM + BLOCK_2_NUM + BLOCK_3_NUM)
+-#define MAX_PAYLOAD_SIZE BLOCK_3_SIZE
+-#define PAYLOAD_AREA_SIZE 0xf000
+-
+ struct isp1760_slotinfo {
+ 	struct isp1760_qh *qh;
+ 	struct isp1760_qtd *qtd;
+@@ -37,6 +19,17 @@ struct isp1760_slotinfo {
+ };
+ 
+ /* chip memory management */
++#define ISP176x_BLOCK_NUM 3
++
++struct isp1760_memory_layout {
++	unsigned int blocks[ISP176x_BLOCK_NUM];
++	unsigned int blocks_size[ISP176x_BLOCK_NUM];
++
++	unsigned int ptd_num;
++	unsigned int payload_blocks;
++	unsigned int payload_area_size;
++};
++
+ struct isp1760_memory_chunk {
+ 	unsigned int start;
+ 	unsigned int size;
+@@ -58,12 +51,14 @@ struct isp1760_hcd {
+ 	struct regmap		*regs;
+ 	struct regmap_field	*fields[HC_FIELD_MAX];
+ 
++	const struct isp1760_memory_layout	*memory_layout;
++
+ 	spinlock_t		lock;
+-	struct isp1760_slotinfo	atl_slots[32];
++	struct isp1760_slotinfo	*atl_slots;
+ 	int			atl_done_map;
+-	struct isp1760_slotinfo	int_slots[32];
++	struct isp1760_slotinfo	*int_slots;
+ 	int			int_done_map;
+-	struct isp1760_memory_chunk memory_pool[BLOCKS];
++	struct isp1760_memory_chunk *memory_pool;
+ 	struct list_head	qh_list[QH_END];
+ 
+ 	/* periodic schedule support */
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-usb-isp1760-use-dr_mode-binding.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-usb-isp1760-use-dr_mode-binding.patch
new file mode 100644
index 0000000..e696535
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-usb-isp1760-use-dr_mode-binding.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 3eb96e04be9918afa54b64fac943de86a9798bda Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:14 +0100
+Subject: [PATCH 06/23] usb: isp1760: use dr_mode binding
+
+There is already a binding to describe the dual role mode (dr_mode),
+use that instead of defining a new one (port1-otg).
+
+Update driver code and devicetree files that use that port1-otg
+binding.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-7-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-core.c | 3 +--
+ drivers/usb/isp1760/isp1760-core.h | 2 +-
+ drivers/usb/isp1760/isp1760-if.c   | 5 +++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+index 35a7667e411c..0aeeb12d3bfe 100644
+--- a/drivers/usb/isp1760/isp1760-core.c
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -73,10 +73,9 @@ static void isp1760_init_core(struct isp1760_device *isp)
+ 	 * on ISP1761.
+ 	 *
+ 	 * TODO: Really support OTG. For now we configure port 1 in device mode
+-	 * when OTG is requested.
+ 	 */
+ 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
+-	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
++	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
+ 		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
+ 		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
+ 		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
+diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
+index 8fec6395f19f..7a6755d68d41 100644
+--- a/drivers/usb/isp1760/isp1760-core.h
++++ b/drivers/usb/isp1760/isp1760-core.h
+@@ -28,7 +28,7 @@ struct gpio_desc;
+  * a sane default configuration.
+  */
+ #define ISP1760_FLAG_BUS_WIDTH_16	0x00000002 /* 16-bit data bus width */
+-#define ISP1760_FLAG_OTG_EN		0x00000004 /* Port 1 supports OTG */
++#define ISP1760_FLAG_PERIPHERAL_EN	0x00000004 /* Port 1 supports Peripheral mode*/
+ #define ISP1760_FLAG_ANALOG_OC		0x00000008 /* Analog overcurrent */
+ #define ISP1760_FLAG_DACK_POL_HIGH	0x00000010 /* DACK active high */
+ #define ISP1760_FLAG_DREQ_POL_HIGH	0x00000020 /* DREQ active high */
+diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
+index fb6701608cd8..cb3e4d782315 100644
+--- a/drivers/usb/isp1760/isp1760-if.c
++++ b/drivers/usb/isp1760/isp1760-if.c
+@@ -17,6 +17,7 @@
+ #include <linux/platform_device.h>
+ #include <linux/slab.h>
+ #include <linux/usb/hcd.h>
++#include <linux/usb/otg.h>
+ 
+ #include "isp1760-core.h"
+ #include "isp1760-regs.h"
+@@ -213,8 +214,8 @@ static int isp1760_plat_probe(struct platform_device *pdev)
+ 		if (bus_width == 16)
+ 			devflags |= ISP1760_FLAG_BUS_WIDTH_16;
+ 
+-		if (of_property_read_bool(dp, "port1-otg"))
+-			devflags |= ISP1760_FLAG_OTG_EN;
++		if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_PERIPHERAL)
++			devflags |= ISP1760_FLAG_PERIPHERAL_EN;
+ 
+ 		if (of_property_read_bool(dp, "analog-oc"))
+ 			devflags |= ISP1760_FLAG_ANALOG_OC;
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0007-usb-isp1760-add-support-for-isp1763.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0007-usb-isp1760-add-support-for-isp1763.patch
new file mode 100644
index 0000000..78a483c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0007-usb-isp1760-add-support-for-isp1763.patch
@@ -0,0 +1,1894 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 60d789f3bfbb7428e6ba2949de70a6db8e12e8fa Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:15 +0100
+Subject: [PATCH 07/23] usb: isp1760: add support for isp1763
+
+isp1763 have some differences from the isp1760, 8 bit address for
+registers and 16 bit for values, no bulk access to memory addresses,
+16 PTD's instead of 32.
+
+Following the regmap work done before add the registers, memory access
+and add the functions to support differences in setup sequences.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-8-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/Kconfig        |   4 +-
+ drivers/usb/isp1760/isp1760-core.c | 301 ++++++++++++--
+ drivers/usb/isp1760/isp1760-core.h |   4 +
+ drivers/usb/isp1760/isp1760-hcd.c  | 627 ++++++++++++++++++++++-------
+ drivers/usb/isp1760/isp1760-hcd.h  |   6 +-
+ drivers/usb/isp1760/isp1760-if.c   |  12 +-
+ drivers/usb/isp1760/isp1760-regs.h |  95 ++++-
+ drivers/usb/isp1760/isp1760-udc.c  |   2 +
+ drivers/usb/isp1760/isp1760-udc.h  |   2 +
+ 9 files changed, 849 insertions(+), 204 deletions(-)
+
+diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
+index d23853f601b1..2ed2b73291d1 100644
+--- a/drivers/usb/isp1760/Kconfig
++++ b/drivers/usb/isp1760/Kconfig
+@@ -1,11 +1,11 @@
+ # SPDX-License-Identifier: GPL-2.0
+ 
+ config USB_ISP1760
+-	tristate "NXP ISP 1760/1761 support"
++	tristate "NXP ISP 1760/1761/1763 support"
+ 	depends on USB || USB_GADGET
+ 	select REGMAP_MMIO
+ 	help
+-	  Say Y or M here if your system as an ISP1760 USB host controller
++	  Say Y or M here if your system as an ISP1760/1763 USB host controller
+ 	  or an ISP1761 USB dual-role controller.
+ 
+ 	  This driver does not support isochronous transfers or OTG.
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+index 0aeeb12d3bfe..1d847f13abab 100644
+--- a/drivers/usb/isp1760/isp1760-core.c
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -2,12 +2,14 @@
+ /*
+  * Driver for the NXP ISP1760 chip
+  *
++ * Copyright 2021 Linaro, Rui Miguel Silva
+  * Copyright 2014 Laurent Pinchart
+  * Copyright 2007 Sebastian Siewior
+  *
+  * Contacts:
+  *	Sebastian Siewior <bigeasy@linutronix.de>
+  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++ *	Rui Miguel Silva <rui.silva@linaro.org>
+  */
+ 
+ #include <linux/delay.h>
+@@ -24,7 +26,7 @@
+ #include "isp1760-regs.h"
+ #include "isp1760-udc.h"
+ 
+-static void isp1760_init_core(struct isp1760_device *isp)
++static int isp1760_init_core(struct isp1760_device *isp)
+ {
+ 	struct isp1760_hcd *hcd = &isp->hcd;
+ 	struct isp1760_udc *udc = &isp->udc;
+@@ -44,8 +46,15 @@ static void isp1760_init_core(struct isp1760_device *isp)
+ 	msleep(100);
+ 
+ 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
++	if ((isp->devflags & ISP1760_FLAG_ANALOG_OC) && hcd->is_isp1763) {
++		dev_err(isp->dev, "isp1763 analog overcurrent not available\n");
++		return -EINVAL;
++	}
++
+ 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
+ 		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
++	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_8)
++		isp1760_field_set(hcd->fields, HW_DATA_BUS_WIDTH);
+ 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
+ 		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
+ 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
+@@ -85,9 +94,14 @@ static void isp1760_init_core(struct isp1760_device *isp)
+ 		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
+ 	}
+ 
+-	dev_info(isp->dev, "bus width: %u, oc: %s\n",
++	dev_info(isp->dev, "%s bus width: %u, oc: %s\n",
++		 hcd->is_isp1763 ? "isp1763" : "isp1760",
++		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_8 ? 8 :
+ 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
++		 hcd->is_isp1763 ? "not available" :
+ 		 isp->devflags & ISP1760_FLAG_ANALOG_OC ? "analog" : "digital");
++
++	return 0;
+ }
+ 
+ void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
+@@ -101,6 +115,8 @@ void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
+ }
+ 
+ /*
++ * ISP1760/61:
++ *
+  * 60kb divided in:
+  * - 32 blocks @ 256  bytes
+  * - 20 blocks @ 1024 bytes
+@@ -114,15 +130,36 @@ static const struct isp1760_memory_layout isp176x_memory_conf = {
+ 	.blocks[2]		= 4,
+ 	.blocks_size[2]		= 8192,
+ 
+-	.ptd_num		= 32,
++	.slot_num		= 32,
+ 	.payload_blocks		= 32 + 20 + 4,
+ 	.payload_area_size	= 0xf000,
+ };
+ 
++/*
++ * ISP1763:
++ *
++ * 20kb divided in:
++ * - 8 blocks @ 256  bytes
++ * - 2 blocks @ 1024 bytes
++ * - 4 blocks @ 4096 bytes
++ */
++static const struct isp1760_memory_layout isp1763_memory_conf = {
++	.blocks[0]		= 8,
++	.blocks_size[0]		= 256,
++	.blocks[1]		= 2,
++	.blocks_size[1]		= 1024,
++	.blocks[2]		= 4,
++	.blocks_size[2]		= 4096,
++
++	.slot_num		= 16,
++	.payload_blocks		= 8 + 2 + 4,
++	.payload_area_size	= 0x5000,
++};
++
+ static const struct regmap_range isp176x_hc_volatile_ranges[] = {
+ 	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
+ 	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
+-	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
++	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_OTG_CTRL_CLEAR),
+ };
+ 
+ static const struct regmap_access_table isp176x_hc_volatile_table = {
+@@ -130,13 +167,13 @@ static const struct regmap_access_table isp176x_hc_volatile_table = {
+ 	.n_yes_ranges	= ARRAY_SIZE(isp176x_hc_volatile_ranges),
+ };
+ 
+-static struct regmap_config isp1760_hc_regmap_conf = {
++static const struct regmap_config isp1760_hc_regmap_conf = {
+ 	.name = "isp1760-hc",
+ 	.reg_bits = 16,
+ 	.reg_stride = 4,
+ 	.val_bits = 32,
+ 	.fast_io = true,
+-	.max_register = ISP176x_HC_MEMORY,
++	.max_register = ISP176x_HC_OTG_CTRL_CLEAR,
+ 	.volatile_table = &isp176x_hc_volatile_table,
+ };
+ 
+@@ -151,6 +188,15 @@ static const struct reg_field isp1760_hc_reg_fields[] = {
+ 	[STS_PCD]		= REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
+ 	[HC_FRINDEX]		= REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
+ 	[FLAG_CF]		= REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
++	[HC_ISO_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_ISO_PTD_DONEMAP, 0, 31),
++	[HC_ISO_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_ISO_PTD_SKIPMAP, 0, 31),
++	[HC_ISO_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_ISO_PTD_LASTPTD, 0, 31),
++	[HC_INT_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_INT_PTD_DONEMAP, 0, 31),
++	[HC_INT_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_INT_PTD_SKIPMAP, 0, 31),
++	[HC_INT_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_INT_PTD_LASTPTD, 0, 31),
++	[HC_ATL_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_ATL_PTD_DONEMAP, 0, 31),
++	[HC_ATL_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_ATL_PTD_SKIPMAP, 0, 31),
++	[HC_ATL_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_ATL_PTD_LASTPTD, 0, 31),
+ 	[PORT_OWNER]		= REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
+ 	[PORT_POWER]		= REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
+ 	[PORT_LSTATUS]		= REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
+@@ -169,18 +215,135 @@ static const struct reg_field isp1760_hc_reg_fields[] = {
+ 	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
+ 	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
+ 	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
++	[HC_CHIP_REV]		= REG_FIELD(ISP176x_HC_CHIP_ID, 16, 31),
++	[HC_CHIP_ID_HIGH]	= REG_FIELD(ISP176x_HC_CHIP_ID, 8, 15),
++	[HC_CHIP_ID_LOW]	= REG_FIELD(ISP176x_HC_CHIP_ID, 0, 7),
++	[HC_SCRATCH]		= REG_FIELD(ISP176x_HC_SCRATCH, 0, 31),
+ 	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP176x_HC_RESET, 0, 0),
++	[ISO_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 2, 2),
+ 	[INT_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
+ 	[ATL_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
+ 	[MEM_BANK_SEL]		= REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
+ 	[MEM_START_ADDR]	= REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
+-	[HC_INT_ENABLE]		= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
++	[HC_INTERRUPT]		= REG_FIELD(ISP176x_HC_INTERRUPT, 0, 9),
++	[HC_ATL_IRQ_ENABLE]	= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 8, 8),
++	[HC_INT_IRQ_ENABLE]	= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 7),
++	[HC_ISO_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_OR, 0, 31),
++	[HC_INT_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_OR, 0, 31),
++	[HC_ATL_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_OR, 0, 31),
++	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31),
++	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31),
++	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31),
++	[HW_OTG_DISABLE]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
++	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
++	[HW_VBUS_DRV]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
++	[HW_SEL_CP_EXT]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
++	[HW_DM_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
++	[HW_DP_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
++	[HW_DP_PULLUP]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
++	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10),
++	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7),
++	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
++	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
++	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
++	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
++	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
++};
++
++static const struct reg_field isp1763_hc_reg_fields[] = {
++	[CMD_LRESET]		= REG_FIELD(ISP1763_HC_USBCMD, 7, 7),
++	[CMD_RESET]		= REG_FIELD(ISP1763_HC_USBCMD, 1, 1),
++	[CMD_RUN]		= REG_FIELD(ISP1763_HC_USBCMD, 0, 0),
++	[STS_PCD]		= REG_FIELD(ISP1763_HC_USBSTS, 2, 2),
++	[HC_FRINDEX]		= REG_FIELD(ISP1763_HC_FRINDEX, 0, 13),
++	[FLAG_CF]		= REG_FIELD(ISP1763_HC_CONFIGFLAG, 0, 0),
++	[HC_ISO_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_ISO_PTD_DONEMAP, 0, 15),
++	[HC_ISO_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_ISO_PTD_SKIPMAP, 0, 15),
++	[HC_ISO_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_ISO_PTD_LASTPTD, 0, 15),
++	[HC_INT_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_INT_PTD_DONEMAP, 0, 15),
++	[HC_INT_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_INT_PTD_SKIPMAP, 0, 15),
++	[HC_INT_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_INT_PTD_LASTPTD, 0, 15),
++	[HC_ATL_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_ATL_PTD_DONEMAP, 0, 15),
++	[HC_ATL_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_ATL_PTD_SKIPMAP, 0, 15),
++	[HC_ATL_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_ATL_PTD_LASTPTD, 0, 15),
++	[PORT_OWNER]		= REG_FIELD(ISP1763_HC_PORTSC1, 13, 13),
++	[PORT_POWER]		= REG_FIELD(ISP1763_HC_PORTSC1, 12, 12),
++	[PORT_LSTATUS]		= REG_FIELD(ISP1763_HC_PORTSC1, 10, 11),
++	[PORT_RESET]		= REG_FIELD(ISP1763_HC_PORTSC1, 8, 8),
++	[PORT_SUSPEND]		= REG_FIELD(ISP1763_HC_PORTSC1, 7, 7),
++	[PORT_RESUME]		= REG_FIELD(ISP1763_HC_PORTSC1, 6, 6),
++	[PORT_PE]		= REG_FIELD(ISP1763_HC_PORTSC1, 2, 2),
++	[PORT_CSC]		= REG_FIELD(ISP1763_HC_PORTSC1, 1, 1),
++	[PORT_CONNECT]		= REG_FIELD(ISP1763_HC_PORTSC1, 0, 0),
++	[HW_DATA_BUS_WIDTH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 4, 4),
++	[HW_DACK_POL_HIGH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 6, 6),
++	[HW_DREQ_POL_HIGH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 5, 5),
++	[HW_INTF_LOCK]		= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 3, 3),
++	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 2, 2),
++	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 1, 1),
++	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 0, 0),
++	[SW_RESET_RESET_ATX]	= REG_FIELD(ISP1763_HC_RESET, 3, 3),
++	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP1763_HC_RESET, 0, 0),
++	[HC_CHIP_ID_HIGH]	= REG_FIELD(ISP1763_HC_CHIP_ID, 0, 15),
++	[HC_CHIP_ID_LOW]	= REG_FIELD(ISP1763_HC_CHIP_REV, 8, 15),
++	[HC_CHIP_REV]		= REG_FIELD(ISP1763_HC_CHIP_REV, 0, 7),
++	[HC_SCRATCH]		= REG_FIELD(ISP1763_HC_SCRATCH, 0, 15),
++	[ISO_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 2, 2),
++	[INT_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 1, 1),
++	[ATL_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 0, 0),
++	[MEM_START_ADDR]	= REG_FIELD(ISP1763_HC_MEMORY, 0, 15),
++	[HC_DATA]		= REG_FIELD(ISP1763_HC_DATA, 0, 15),
++	[HC_INTERRUPT]		= REG_FIELD(ISP1763_HC_INTERRUPT, 0, 10),
++	[HC_ATL_IRQ_ENABLE]	= REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 8, 8),
++	[HC_INT_IRQ_ENABLE]	= REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 7, 7),
++	[HC_ISO_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_OR, 0, 15),
++	[HC_INT_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_INT_IRQ_MASK_OR, 0, 15),
++	[HC_ATL_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_OR, 0, 15),
++	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_AND, 0, 15),
++	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_INT_IRQ_MASK_AND, 0, 15),
++	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_AND, 0, 15),
++	[HW_HC_2_DIS]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 15, 15),
++	[HW_OTG_DISABLE]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 10, 10),
++	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 7, 7),
++	[HW_VBUS_DRV]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 4, 4),
++	[HW_SEL_CP_EXT]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 3, 3),
++	[HW_DM_PULLDOWN]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 2, 2),
++	[HW_DP_PULLDOWN]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 1, 1),
++	[HW_DP_PULLUP]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 0, 0),
++	[HW_HC_2_DIS_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 15, 15),
++	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 10, 10),
++	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 7, 7),
++	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 4, 4),
++	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 3, 3),
++	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 2, 2),
++	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 1, 1),
++	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 0, 0),
++};
++
++static const struct regmap_range isp1763_hc_volatile_ranges[] = {
++	regmap_reg_range(ISP1763_HC_USBCMD, ISP1763_HC_ATL_PTD_LASTPTD),
++	regmap_reg_range(ISP1763_HC_BUFFER_STATUS, ISP1763_HC_DATA),
++	regmap_reg_range(ISP1763_HC_INTERRUPT, ISP1763_HC_OTG_CTRL_CLEAR),
++};
++
++static const struct regmap_access_table isp1763_hc_volatile_table = {
++	.yes_ranges	= isp1763_hc_volatile_ranges,
++	.n_yes_ranges	= ARRAY_SIZE(isp1763_hc_volatile_ranges),
++};
++
++static const struct regmap_config isp1763_hc_regmap_conf = {
++	.name = "isp1763-hc",
++	.reg_bits = 8,
++	.reg_stride = 2,
++	.val_bits = 16,
++	.fast_io = true,
++	.max_register = ISP1763_HC_OTG_CTRL_CLEAR,
++	.volatile_table = &isp1763_hc_volatile_table,
+ };
+ 
+ static const struct regmap_range isp176x_dc_volatile_ranges[] = {
+ 	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
+ 	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
+-	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
+ };
+ 
+ static const struct regmap_access_table isp176x_dc_volatile_table = {
+@@ -188,13 +351,13 @@ static const struct regmap_access_table isp176x_dc_volatile_table = {
+ 	.n_yes_ranges	= ARRAY_SIZE(isp176x_dc_volatile_ranges),
+ };
+ 
+-static struct regmap_config isp1761_dc_regmap_conf = {
++static const struct regmap_config isp1761_dc_regmap_conf = {
+ 	.name = "isp1761-dc",
+ 	.reg_bits = 16,
+ 	.reg_stride = 4,
+ 	.val_bits = 32,
+ 	.fast_io = true,
+-	.max_register = ISP1761_DC_OTG_CTRL_CLEAR,
++	.max_register = ISP176x_DC_TESTMODE,
+ 	.volatile_table = &isp176x_dc_volatile_table,
+ };
+ 
+@@ -236,31 +399,84 @@ static const struct reg_field isp1761_dc_reg_fields[] = {
+ 	[DC_ENDPTYP]		= REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
+ 	[DC_UFRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
+ 	[DC_FRAMENUM]		= REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
+-	[HW_OTG_DISABLE]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
+-	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
+-	[HW_VBUS_DRV]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
+-	[HW_SEL_CP_EXT]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
+-	[HW_DM_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
+-	[HW_DP_PULLDOWN]	= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
+-	[HW_DP_PULLUP]		= REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
+-	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
+-	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
+-	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
+-	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
+-	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
+-	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
+-	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
++	[DC_CHIP_ID_HIGH]	= REG_FIELD(ISP176x_DC_CHIPID, 16, 31),
++	[DC_CHIP_ID_LOW]	= REG_FIELD(ISP176x_DC_CHIPID, 0, 15),
++	[DC_SCRATCH]		= REG_FIELD(ISP176x_DC_SCRATCH, 0, 15),
++};
++
++static const struct regmap_range isp1763_dc_volatile_ranges[] = {
++	regmap_reg_range(ISP1763_DC_EPMAXPKTSZ, ISP1763_DC_EPTYPE),
++	regmap_reg_range(ISP1763_DC_BUFLEN, ISP1763_DC_EPINDEX),
++};
++
++static const struct regmap_access_table isp1763_dc_volatile_table = {
++	.yes_ranges	= isp1763_dc_volatile_ranges,
++	.n_yes_ranges	= ARRAY_SIZE(isp1763_dc_volatile_ranges),
++};
++
++static const struct reg_field isp1763_dc_reg_fields[] = {
++	[DC_DEVEN]		= REG_FIELD(ISP1763_DC_ADDRESS, 7, 7),
++	[DC_DEVADDR]		= REG_FIELD(ISP1763_DC_ADDRESS, 0, 6),
++	[DC_VBUSSTAT]		= REG_FIELD(ISP1763_DC_MODE, 8, 8),
++	[DC_SFRESET]		= REG_FIELD(ISP1763_DC_MODE, 4, 4),
++	[DC_GLINTENA]		= REG_FIELD(ISP1763_DC_MODE, 3, 3),
++	[DC_CDBGMOD_ACK]	= REG_FIELD(ISP1763_DC_INTCONF, 6, 6),
++	[DC_DDBGMODIN_ACK]	= REG_FIELD(ISP1763_DC_INTCONF, 4, 4),
++	[DC_DDBGMODOUT_ACK]	= REG_FIELD(ISP1763_DC_INTCONF, 2, 2),
++	[DC_INTPOL]		= REG_FIELD(ISP1763_DC_INTCONF, 0, 0),
++	[DC_IEPRXTX_7]		= REG_FIELD(ISP1763_DC_INTENABLE, 25, 25),
++	[DC_IEPRXTX_6]		= REG_FIELD(ISP1763_DC_INTENABLE, 23, 23),
++	[DC_IEPRXTX_5]		= REG_FIELD(ISP1763_DC_INTENABLE, 21, 21),
++	[DC_IEPRXTX_4]		= REG_FIELD(ISP1763_DC_INTENABLE, 19, 19),
++	[DC_IEPRXTX_3]		= REG_FIELD(ISP1763_DC_INTENABLE, 17, 17),
++	[DC_IEPRXTX_2]		= REG_FIELD(ISP1763_DC_INTENABLE, 15, 15),
++	[DC_IEPRXTX_1]		= REG_FIELD(ISP1763_DC_INTENABLE, 13, 13),
++	[DC_IEPRXTX_0]		= REG_FIELD(ISP1763_DC_INTENABLE, 11, 11),
++	[DC_IEP0SETUP]		= REG_FIELD(ISP1763_DC_INTENABLE, 8, 8),
++	[DC_IEVBUS]		= REG_FIELD(ISP1763_DC_INTENABLE, 7, 7),
++	[DC_IEHS_STA]		= REG_FIELD(ISP1763_DC_INTENABLE, 5, 5),
++	[DC_IERESM]		= REG_FIELD(ISP1763_DC_INTENABLE, 4, 4),
++	[DC_IESUSP]		= REG_FIELD(ISP1763_DC_INTENABLE, 3, 3),
++	[DC_IEBRST]		= REG_FIELD(ISP1763_DC_INTENABLE, 0, 0),
++	[DC_EP0SETUP]		= REG_FIELD(ISP1763_DC_EPINDEX, 5, 5),
++	[DC_ENDPIDX]		= REG_FIELD(ISP1763_DC_EPINDEX, 1, 4),
++	[DC_EPDIR]		= REG_FIELD(ISP1763_DC_EPINDEX, 0, 0),
++	[DC_CLBUF]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 4, 4),
++	[DC_VENDP]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 3, 3),
++	[DC_DSEN]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 2, 2),
++	[DC_STATUS]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 1, 1),
++	[DC_STALL]		= REG_FIELD(ISP1763_DC_CTRLFUNC, 0, 0),
++	[DC_BUFLEN]		= REG_FIELD(ISP1763_DC_BUFLEN, 0, 15),
++	[DC_FFOSZ]		= REG_FIELD(ISP1763_DC_EPMAXPKTSZ, 0, 10),
++	[DC_EPENABLE]		= REG_FIELD(ISP1763_DC_EPTYPE, 3, 3),
++	[DC_ENDPTYP]		= REG_FIELD(ISP1763_DC_EPTYPE, 0, 1),
++	[DC_UFRAMENUM]		= REG_FIELD(ISP1763_DC_FRAMENUM, 11, 13),
++	[DC_FRAMENUM]		= REG_FIELD(ISP1763_DC_FRAMENUM, 0, 10),
++	[DC_CHIP_ID_HIGH]	= REG_FIELD(ISP1763_DC_CHIPID_HIGH, 0, 15),
++	[DC_CHIP_ID_LOW]	= REG_FIELD(ISP1763_DC_CHIPID_LOW, 0, 15),
++	[DC_SCRATCH]		= REG_FIELD(ISP1763_DC_SCRATCH, 0, 15),
++};
++
++static const struct regmap_config isp1763_dc_regmap_conf = {
++	.name = "isp1763-dc",
++	.reg_bits = 8,
++	.reg_stride = 2,
++	.val_bits = 16,
++	.fast_io = true,
++	.max_register = ISP1763_DC_TESTMODE,
++	.volatile_table = &isp1763_dc_volatile_table,
+ };
+ 
+ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 		     struct device *dev, unsigned int devflags)
+ {
++	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
++	const struct regmap_config *hc_regmap;
++	const struct reg_field *hc_reg_fields;
+ 	struct isp1760_device *isp;
+ 	struct isp1760_hcd *hcd;
+ 	struct isp1760_udc *udc;
+-	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
+ 	struct regmap_field *f;
+-	void __iomem *base;
+ 	int ret;
+ 	int i;
+ 
+@@ -281,9 +497,19 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 	hcd = &isp->hcd;
+ 	udc = &isp->udc;
+ 
+-	if (devflags & ISP1760_FLAG_BUS_WIDTH_16) {
+-		isp1760_hc_regmap_conf.val_bits = 16;
+-		isp1761_dc_regmap_conf.val_bits = 16;
++	hcd->is_isp1763 = !!(devflags & ISP1760_FLAG_ISP1763);
++
++	if (!hcd->is_isp1763 && (devflags & ISP1760_FLAG_BUS_WIDTH_8)) {
++		dev_err(dev, "isp1760/61 do not support data width 8\n");
++		return -EINVAL;
++	}
++
++	if (hcd->is_isp1763) {
++		hc_regmap = &isp1763_hc_regmap_conf;
++		hc_reg_fields = &isp1763_hc_reg_fields[0];
++	} else {
++		hc_regmap = &isp1760_hc_regmap_conf;
++		hc_reg_fields = &isp1760_hc_reg_fields[0];
+ 	}
+ 
+ 	isp->rst_gpio = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
+@@ -294,20 +520,20 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 	if (IS_ERR(hcd->base))
+ 		return PTR_ERR(hcd->base);
+ 
+-	hcd->regs = devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf);
++	hcd->regs = devm_regmap_init_mmio(dev, hcd->base, hc_regmap);
+ 	if (IS_ERR(hcd->regs))
+ 		return PTR_ERR(hcd->regs);
+ 
+ 	for (i = 0; i < HC_FIELD_MAX; i++) {
+-		f = devm_regmap_field_alloc(dev, hcd->regs,
+-					    isp1760_hc_reg_fields[i]);
++		f = devm_regmap_field_alloc(dev, hcd->regs, hc_reg_fields[i]);
+ 		if (IS_ERR(f))
+ 			return PTR_ERR(f);
+ 
+ 		hcd->fields[i] = f;
+ 	}
+ 
+-	udc->regs = devm_regmap_init_mmio(dev, base, &isp1761_dc_regmap_conf);
++	udc->regs = devm_regmap_init_mmio(dev, hcd->base,
++					  &isp1761_dc_regmap_conf);
+ 	if (IS_ERR(udc->regs))
+ 		return PTR_ERR(udc->regs);
+ 
+@@ -320,9 +546,14 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 		udc->fields[i] = f;
+ 	}
+ 
+-	hcd->memory_layout = &isp176x_memory_conf;
++	if (hcd->is_isp1763)
++		hcd->memory_layout = &isp1763_memory_conf;
++	else
++		hcd->memory_layout = &isp176x_memory_conf;
+ 
+-	isp1760_init_core(isp);
++	ret = isp1760_init_core(isp);
++	if (ret < 0)
++		return ret;
+ 
+ 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
+ 		ret = isp1760_hcd_register(hcd, mem, irq,
+diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
+index 7a6755d68d41..91e0ee3992a7 100644
+--- a/drivers/usb/isp1760/isp1760-core.h
++++ b/drivers/usb/isp1760/isp1760-core.h
+@@ -2,12 +2,14 @@
+ /*
+  * Driver for the NXP ISP1760 chip
+  *
++ * Copyright 2021 Linaro, Rui Miguel Silva
+  * Copyright 2014 Laurent Pinchart
+  * Copyright 2007 Sebastian Siewior
+  *
+  * Contacts:
+  *	Sebastian Siewior <bigeasy@linutronix.de>
+  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++ *	Rui Miguel Silva <rui.silva@linaro.org>
+  */
+ 
+ #ifndef _ISP1760_CORE_H_
+@@ -35,6 +37,8 @@ struct gpio_desc;
+ #define ISP1760_FLAG_ISP1761		0x00000040 /* Chip is ISP1761 */
+ #define ISP1760_FLAG_INTR_POL_HIGH	0x00000080 /* Interrupt polarity active high */
+ #define ISP1760_FLAG_INTR_EDGE_TRIG	0x00000100 /* Interrupt edge triggered */
++#define ISP1760_FLAG_ISP1763		0x00000200 /* Chip is ISP1763 */
++#define ISP1760_FLAG_BUS_WIDTH_8	0x00000400 /* 8-bit data bus width */
+ 
+ struct isp1760_device {
+ 	struct device *dev;
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index a65f5f917ebe..016a54ea76f4 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -11,6 +11,8 @@
+  *
+  * (c) 2011 Arvid Brodin <arvid.brodin@enea.com>
+  *
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
++ *
+  */
+ #include <linux/gpio/consumer.h>
+ #include <linux/module.h>
+@@ -44,6 +46,9 @@ static inline struct isp1760_hcd *hcd_to_priv(struct usb_hcd *hcd)
+ 	return *(struct isp1760_hcd **)hcd->hcd_priv;
+ }
+ 
++#define dw_to_le32(x)	(cpu_to_le32((__force u32)x))
++#define le32_to_dw(x)	((__force __dw)(le32_to_cpu(x)))
++
+ /* urb state*/
+ #define DELETE_URB		(0x0008)
+ #define NO_TRANSFER_ACTIVE	(0xffffffff)
+@@ -60,6 +65,18 @@ struct ptd {
+ 	__dw dw6;
+ 	__dw dw7;
+ };
++
++struct ptd_le32 {
++	__le32 dw0;
++	__le32 dw1;
++	__le32 dw2;
++	__le32 dw3;
++	__le32 dw4;
++	__le32 dw5;
++	__le32 dw6;
++	__le32 dw7;
++};
++
+ #define PTD_OFFSET		0x0400
+ #define ISO_PTD_OFFSET		0x0400
+ #define INT_PTD_OFFSET		0x0800
+@@ -96,7 +113,7 @@ struct ptd {
+ #define TO_DW2_RL(x)			TO_DW(((x) << 25))
+ #define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
+ /* DW3 */
+-#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x7fff)
++#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x3fff)
+ #define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	TO_U32((x) & 0x07ff)
+ #define TO_DW3_NAKCOUNT(x)		TO_DW(((x) << 19))
+ #define FROM_DW3_NAKCOUNT(x)		((TO_U32(x) >> 19) & 0xf)
+@@ -123,7 +140,7 @@ struct ptd {
+ /* Errata 1 */
+ #define RL_COUNTER	(0)
+ #define NAK_COUNTER	(0)
+-#define ERR_COUNTER	(2)
++#define ERR_COUNTER	(3)
+ 
+ struct isp1760_qtd {
+ 	u8 packet_type;
+@@ -165,6 +182,18 @@ struct urb_listitem {
+ 	struct urb *urb;
+ };
+ 
++static const u32 isp1763_hc_portsc1_fields[] = {
++	[PORT_OWNER]		= BIT(13),
++	[PORT_POWER]		= BIT(12),
++	[PORT_LSTATUS]		= BIT(10),
++	[PORT_RESET]		= BIT(8),
++	[PORT_SUSPEND]		= BIT(7),
++	[PORT_RESUME]		= BIT(6),
++	[PORT_PE]		= BIT(2),
++	[PORT_CSC]		= BIT(1),
++	[PORT_CONNECT]		= BIT(0),
++};
++
+ /*
+  * Access functions for isp176x registers regmap fields
+  */
+@@ -175,10 +204,30 @@ static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
+ 	return isp1760_field_read(priv->fields, field);
+ }
+ 
++/*
++ * We need, in isp1763, to write directly the values to the portsc1
++ * register so it will make the other values to trigger.
++ */
++static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32 field,
++					  u32 val)
++{
++	u32 bit = isp1763_hc_portsc1_fields[field];
++	u32 port_status = readl(priv->base + ISP1763_HC_PORTSC1);
++
++	if (val)
++		writel(port_status | bit, priv->base + ISP1763_HC_PORTSC1);
++	else
++		writel(port_status & ~bit, priv->base + ISP1763_HC_PORTSC1);
++}
++
+ static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 
++	if (unlikely(priv->is_isp1763 &&
++		     (field >= PORT_OWNER && field <= PORT_CONNECT)))
++		return isp1760_hcd_portsc1_set_clear(priv, field, val);
++
+ 	isp1760_field_write(priv->fields, field, val);
+ }
+ 
+@@ -192,28 +241,40 @@ static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
+ 	isp1760_hcd_write(hcd, field, 0);
+ }
+ 
+-static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
+-					u32 timeout_us)
++static int isp1760_hcd_set_and_wait(struct usb_hcd *hcd, u32 field,
++				    u32 timeout_us)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 val;
++
++	isp1760_hcd_set(hcd, field);
++
++	return regmap_field_read_poll_timeout(priv->fields[field], val,
++					      val, 10, timeout_us);
++}
++
++static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
++					 u32 timeout_us)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+-	unsigned int val;
++	u32 val;
+ 
+ 	isp1760_hcd_set(hcd, field);
+ 
+-	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
+-					      timeout_us);
++	return regmap_field_read_poll_timeout(priv->fields[field], val,
++					      !val, 10, timeout_us);
+ }
+ 
+-static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 field,
+-					  u32 timeout_us)
++static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
++				      u32 timeout_us)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+-	unsigned int val;
++	u32 val;
+ 
+ 	isp1760_hcd_clear(hcd, field);
+ 
+-	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
+-					      timeout_us);
++	return regmap_field_read_poll_timeout(priv->fields[field], val,
++					      !val, 10, timeout_us);
+ }
+ 
+ static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
+@@ -221,12 +282,32 @@ static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
+ 	return !!isp1760_hcd_read(hcd, field);
+ }
+ 
++static bool isp1760_hcd_ppc_is_set(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (priv->is_isp1763)
++		return true;
++
++	return isp1760_hcd_is_set(hcd, HCS_PPC);
++}
++
++static u32 isp1760_hcd_n_ports(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (priv->is_isp1763)
++		return 1;
++
++	return isp1760_hcd_read(hcd, HCS_N_PORTS);
++}
++
+ /*
+  * Access functions for isp176x memory (offset >= 0x0400).
+  *
+  * bank_reads8() reads memory locations prefetched by an earlier write to
+  * HC_MEMORY_REG (see isp176x datasheet). Unless you want to do fancy multi-
+- * bank optimizations, you should use the more generic mem_reads8() below.
++ * bank optimizations, you should use the more generic mem_read() below.
+  *
+  * For access to ptd memory, use the specialized ptd_read() and ptd_write()
+  * below.
+@@ -281,19 +362,59 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
+ 	}
+ }
+ 
+-static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
+-		       u32 src_offset, void *dst, u32 bytes)
++static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void *dst,
++			     u32 bytes)
+ {
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
+ 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
+ 	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
++	ndelay(100);
+ 
+-	ndelay(90);
++	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
++}
+ 
+-	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
++/*
++ * ISP1763 does not have the banks direct host controller memory access,
++ * needs to use the HC_DATA register. Add data read/write according to this,
++ * and also adjust 16bit access.
++ */
++static void isp1763_mem_read(struct usb_hcd *hcd, u16 srcaddr,
++			     u16 *dstptr, u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	/* Write the starting device address to the hcd memory register */
++	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, srcaddr);
++	ndelay(100); /* Delay between consecutive access */
++
++	/* As long there are at least 16-bit to read ... */
++	while (bytes >= 2) {
++		*dstptr = __raw_readw(priv->base + ISP1763_HC_DATA);
++		bytes -= 2;
++		dstptr++;
++	}
++
++	/* If there are no more bytes to read, return */
++	if (bytes <= 0)
++		return;
++
++	*((u8 *)dstptr) = (u8)(readw(priv->base + ISP1763_HC_DATA) & 0xFF);
++}
++
++static void mem_read(struct usb_hcd *hcd, u32 src_offset, __u32 *dst,
++		     u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_mem_read(hcd, src_offset, (u16 *)dst, bytes);
++
++	isp1763_mem_read(hcd, (u16)src_offset, (u16 *)dst, bytes);
+ }
+ 
+-static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
+-						__u32 const *src, u32 bytes)
++static void isp1760_mem_write(void __iomem *dst_base, u32 dst_offset,
++			      __u32 const *src, u32 bytes)
+ {
+ 	__u32 __iomem *dst;
+ 
+@@ -327,33 +448,136 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
+ 		__raw_writel(*src, dst);
+ }
+ 
++static void isp1763_mem_write(struct usb_hcd *hcd, u16 dstaddr, u16 *src,
++			      u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	/* Write the starting device address to the hcd memory register */
++	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, dstaddr);
++	ndelay(100); /* Delay between consecutive access */
++
++	while (bytes >= 2) {
++		/* Get and write the data; then adjust the data ptr and len */
++		__raw_writew(*src, priv->base + ISP1763_HC_DATA);
++		bytes -= 2;
++		src++;
++	}
++
++	/* If there are no more bytes to process, return */
++	if (bytes <= 0)
++		return;
++
++	/*
++	 * The only way to get here is if there is a single byte left,
++	 * get it and write it to the data reg;
++	 */
++	writew(*((u8 *)src), priv->base + ISP1763_HC_DATA);
++}
++
++static void mem_write(struct usb_hcd *hcd, u32 dst_offset, __u32 *src,
++		      u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_mem_write(priv->base, dst_offset, src, bytes);
++
++	isp1763_mem_write(hcd, dst_offset, (u16 *)src, bytes);
++}
++
+ /*
+  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
+  * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
+  */
+-static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
+-		     u32 ptd_offset, u32 slot, struct ptd *ptd)
++static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++			     struct ptd *ptd)
+ {
++	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
+ 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
+-	isp1760_hcd_write(hcd, MEM_START_ADDR,
+-			  ptd_offset + slot * sizeof(*ptd));
++	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
+ 	ndelay(90);
+-	bank_reads8(base, ptd_offset + slot * sizeof(*ptd), ISP_BANK_0,
+-		    (void *)ptd, sizeof(*ptd));
++
++	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *)ptd,
++		    sizeof(*ptd));
++}
++
++static void isp1763_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++			     struct ptd *ptd)
++{
++	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
++	struct ptd_le32 le32_ptd;
++
++	isp1763_mem_read(hcd, src_offset, (u16 *)&le32_ptd, sizeof(le32_ptd));
++	/* Normalize the data obtained */
++	ptd->dw0 = le32_to_dw(le32_ptd.dw0);
++	ptd->dw1 = le32_to_dw(le32_ptd.dw1);
++	ptd->dw2 = le32_to_dw(le32_ptd.dw2);
++	ptd->dw3 = le32_to_dw(le32_ptd.dw3);
++	ptd->dw4 = le32_to_dw(le32_ptd.dw4);
++	ptd->dw5 = le32_to_dw(le32_ptd.dw5);
++	ptd->dw6 = le32_to_dw(le32_ptd.dw6);
++	ptd->dw7 = le32_to_dw(le32_ptd.dw7);
++}
++
++static void ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++		     struct ptd *ptd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_ptd_read(hcd, ptd_offset, slot, ptd);
++
++	isp1763_ptd_read(hcd, ptd_offset, slot, ptd);
++}
++
++static void isp1763_ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++			      struct ptd *cpu_ptd)
++{
++	u16 dst_offset = ptd_offset + slot * sizeof(*cpu_ptd);
++	struct ptd_le32 ptd;
++
++	ptd.dw0 = dw_to_le32(cpu_ptd->dw0);
++	ptd.dw1 = dw_to_le32(cpu_ptd->dw1);
++	ptd.dw2 = dw_to_le32(cpu_ptd->dw2);
++	ptd.dw3 = dw_to_le32(cpu_ptd->dw3);
++	ptd.dw4 = dw_to_le32(cpu_ptd->dw4);
++	ptd.dw5 = dw_to_le32(cpu_ptd->dw5);
++	ptd.dw6 = dw_to_le32(cpu_ptd->dw6);
++	ptd.dw7 = dw_to_le32(cpu_ptd->dw7);
++
++	isp1763_mem_write(hcd, dst_offset,  (u16 *)&ptd.dw0,
++			  8 * sizeof(ptd.dw0));
+ }
+ 
+-static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
+-								struct ptd *ptd)
++static void isp1760_ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
++			      struct ptd *ptd)
+ {
+-	mem_writes8(base, ptd_offset + slot*sizeof(*ptd) + sizeof(ptd->dw0),
+-		    (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
+-	/* Make sure dw0 gets written last (after other dw's and after payload)
+-	   since it contains the enable bit */
++	u32 dst_offset = ptd_offset + slot * sizeof(*ptd);
++
++	/*
++	 * Make sure dw0 gets written last (after other dw's and after payload)
++	 *  since it contains the enable bit
++	 */
++	isp1760_mem_write(base, dst_offset + sizeof(ptd->dw0),
++			  (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
+ 	wmb();
+-	mem_writes8(base, ptd_offset + slot * sizeof(*ptd),
+-		    (__force u32 *)&ptd->dw0, sizeof(ptd->dw0));
++	isp1760_mem_write(base, dst_offset, (__force u32 *)&ptd->dw0,
++			  sizeof(ptd->dw0));
+ }
+ 
++static void ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++		      struct ptd *ptd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_ptd_write(priv->base, ptd_offset, slot, ptd);
++
++	isp1763_ptd_write(hcd, ptd_offset, slot, ptd);
++}
+ 
+ /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
+ static void init_memory(struct isp1760_hcd *priv)
+@@ -430,7 +654,7 @@ static int ehci_reset(struct usb_hcd *hcd)
+ 	hcd->state = HC_STATE_HALT;
+ 	priv->next_statechange = jiffies;
+ 
+-	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
++	return isp1760_hcd_set_and_wait_swap(hcd, CMD_RESET, 250 * 1000);
+ }
+ 
+ static struct isp1760_qh *qh_alloc(gfp_t flags)
+@@ -461,7 +685,6 @@ static int priv_init(struct usb_hcd *hcd)
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 	u32 isoc_cache;
+ 	u32 isoc_thres;
+-
+ 	int i;
+ 
+ 	spin_lock_init(&priv->lock);
+@@ -475,6 +698,11 @@ static int priv_init(struct usb_hcd *hcd)
+ 	 */
+ 	priv->periodic_size = DEFAULT_I_TDPS;
+ 
++	if (priv->is_isp1763) {
++		priv->i_thresh = 2;
++		return 0;
++	}
++
+ 	/* controllers may cache some of the periodic schedule ... */
+ 	isoc_cache = isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
+ 	isoc_thres = isp1760_hcd_read(hcd, HCC_ISOC_THRES);
+@@ -491,16 +719,24 @@ static int priv_init(struct usb_hcd *hcd)
+ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 atx_reset;
+ 	int result;
+ 	u32 scratch;
++	u32 pattern;
+ 
+-	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
++	if (priv->is_isp1763)
++		pattern = 0xcafe;
++	else
++		pattern = 0xdeadcafe;
++
++	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
+ 
+ 	/* Change bus pattern */
+-	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
+-	scratch = isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
+-	if (scratch != 0xdeadbabe) {
+-		dev_err(hcd->self.controller, "Scratch test failed.\n");
++	scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
++	dev_err(hcd->self.controller, "Scratch test 0x%08x\n", scratch);
++	scratch = isp1760_hcd_read(hcd, HC_SCRATCH);
++	if (scratch != pattern) {
++		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratch);
+ 		return -ENODEV;
+ 	}
+ 
+@@ -512,13 +748,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ 	 * the host controller through the EHCI USB Command register. The device
+ 	 * has been reset in core code anyway, so this shouldn't matter.
+ 	 */
+-	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
+-			  NO_TRANSFER_ACTIVE);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
+-			  NO_TRANSFER_ACTIVE);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
+-			  NO_TRANSFER_ACTIVE);
++	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
++	isp1760_hcd_clear(hcd, INT_BUF_FILL);
++	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
++
++	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
+ 
+ 	result = ehci_reset(hcd);
+ 	if (result)
+@@ -527,11 +763,26 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ 	/* Step 11 passed */
+ 
+ 	/* ATL reset */
+-	isp1760_hcd_set(hcd, ALL_ATX_RESET);
++	if (priv->is_isp1763)
++		atx_reset = SW_RESET_RESET_ATX;
++	else
++		atx_reset = ALL_ATX_RESET;
++
++	isp1760_hcd_set(hcd, atx_reset);
+ 	mdelay(10);
+-	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
++	isp1760_hcd_clear(hcd, atx_reset);
+ 
+-	isp1760_hcd_set(hcd, HC_INT_ENABLE);
++	if (priv->is_isp1763) {
++		isp1760_hcd_set(hcd, HW_OTG_DISABLE);
++		isp1760_hcd_set(hcd, HW_SW_SEL_HC_DC_CLEAR);
++		isp1760_hcd_set(hcd, HW_HC_2_DIS_CLEAR);
++		mdelay(10);
++
++		isp1760_hcd_set(hcd, HW_INTF_LOCK);
++	}
++
++	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
+ 
+ 	return priv_init(hcd);
+ }
+@@ -751,45 +1002,45 @@ static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int slot,
+ 				struct ptd *ptd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
+ 	int skip_map;
+ 
+-	WARN_ON((slot < 0) || (slot > 31));
++	WARN_ON((slot < 0) || (slot > mem->slot_num - 1));
+ 	WARN_ON(qtd->length && !qtd->payload_addr);
+ 	WARN_ON(slots[slot].qtd);
+ 	WARN_ON(slots[slot].qh);
+ 	WARN_ON(qtd->status != QTD_PAYLOAD_ALLOC);
+ 
++	if (priv->is_isp1763)
++		ndelay(100);
++
+ 	/* Make sure done map has not triggered from some unlinked transfer */
+ 	if (ptd_offset == ATL_PTD_OFFSET) {
+-		priv->atl_done_map |= isp1760_reg_read(priv->regs,
+-						ISP176x_HC_ATL_PTD_DONEMAP);
++		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
++		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP,
++				  skip_map | (1 << slot));
++		priv->atl_done_map |= isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
+ 		priv->atl_done_map &= ~(1 << slot);
+ 	} else {
+-		priv->int_done_map |= isp1760_reg_read(priv->regs,
+-					       ISP176x_HC_INT_PTD_DONEMAP);
++		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
++		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP,
++				  skip_map | (1 << slot));
++		priv->int_done_map |= isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
+ 		priv->int_done_map &= ~(1 << slot);
+ 	}
+ 
++	skip_map &= ~(1 << slot);
+ 	qh->slot = slot;
+ 	qtd->status = QTD_XFER_STARTED;
+ 	slots[slot].timestamp = jiffies;
+ 	slots[slot].qtd = qtd;
+ 	slots[slot].qh = qh;
+-	ptd_write(priv->base, ptd_offset, slot, ptd);
++	ptd_write(hcd, ptd_offset, slot, ptd);
+ 
+-	if (ptd_offset == ATL_PTD_OFFSET) {
+-		skip_map = isp1760_reg_read(priv->regs,
+-					    ISP176x_HC_ATL_PTD_SKIPMAP);
+-		skip_map &= ~(1 << qh->slot);
+-		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
+-				  skip_map);
+-	} else {
+-		skip_map = isp1760_reg_read(priv->regs,
+-					    ISP176x_HC_INT_PTD_SKIPMAP);
+-		skip_map &= ~(1 << qh->slot);
+-		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
+-				  skip_map);
+-	}
++	if (ptd_offset == ATL_PTD_OFFSET)
++		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
++	else
++		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
+ }
+ 
+ static int is_short_bulk(struct isp1760_qtd *qtd)
+@@ -801,7 +1052,6 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
+ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
+ 						struct list_head *urb_list)
+ {
+-	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 	struct isp1760_qtd *qtd, *qtd_next;
+ 	struct urb_listitem *urb_listitem;
+ 	int last_qtd;
+@@ -819,10 +1069,9 @@ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
+ 			if (qtd->actual_length) {
+ 				switch (qtd->packet_type) {
+ 				case IN_PID:
+-					mem_reads8(hcd, priv->base,
+-						   qtd->payload_addr,
+-						   qtd->data_buffer,
+-						   qtd->actual_length);
++					mem_read(hcd, qtd->payload_addr,
++						 qtd->data_buffer,
++						 qtd->actual_length);
+ 					fallthrough;
+ 				case OUT_PID:
+ 					qtd->urb->actual_length +=
+@@ -866,6 +1115,8 @@ static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
+ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	int slot_num = mem->slot_num;
+ 	int ptd_offset;
+ 	struct isp1760_slotinfo *slots;
+ 	int curr_slot, free_slot;
+@@ -892,7 +1143,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
+ 	}
+ 
+ 	free_slot = -1;
+-	for (curr_slot = 0; curr_slot < 32; curr_slot++) {
++	for (curr_slot = 0; curr_slot < slot_num; curr_slot++) {
+ 		if ((free_slot == -1) && (slots[curr_slot].qtd == NULL))
+ 			free_slot = curr_slot;
+ 		if (slots[curr_slot].qh == qh)
+@@ -907,11 +1158,10 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
+ 			if ((qtd->length) && (!qtd->payload_addr))
+ 				break;
+ 
+-			if ((qtd->length) &&
+-			    ((qtd->packet_type == SETUP_PID) ||
+-			     (qtd->packet_type == OUT_PID))) {
+-				mem_writes8(priv->base, qtd->payload_addr,
+-					    qtd->data_buffer, qtd->length);
++			if (qtd->length && (qtd->packet_type == SETUP_PID ||
++					    qtd->packet_type == OUT_PID)) {
++				mem_write(hcd, qtd->payload_addr,
++					  qtd->data_buffer, qtd->length);
+ 			}
+ 
+ 			qtd->status = QTD_PAYLOAD_ALLOC;
+@@ -924,7 +1174,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
+ 					"available for transfer\n", __func__);
+ */
+ 			/* Start xfer for this endpoint if not already done */
+-			if ((curr_slot > 31) && (free_slot > -1)) {
++			if ((curr_slot > slot_num - 1) && (free_slot > -1)) {
+ 				if (usb_pipeint(qtd->urb->pipe))
+ 					create_ptd_int(qh, qtd, &ptd);
+ 				else
+@@ -1111,9 +1361,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ 	int modified;
+ 	int skip_map;
+ 
+-	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
++	skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
+ 	priv->int_done_map &= ~skip_map;
+-	skip_map = isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
++	skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
+ 	priv->atl_done_map &= ~skip_map;
+ 
+ 	modified = priv->int_done_map || priv->atl_done_map;
+@@ -1131,7 +1381,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ 				continue;
+ 			}
+ 			ptd_offset = INT_PTD_OFFSET;
+-			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
++			ptd_read(hcd, INT_PTD_OFFSET, slot, &ptd);
+ 			state = check_int_transfer(hcd, &ptd,
+ 							slots[slot].qtd->urb);
+ 		} else {
+@@ -1146,7 +1396,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ 				continue;
+ 			}
+ 			ptd_offset = ATL_PTD_OFFSET;
+-			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
++			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
+ 			state = check_atl_transfer(hcd, &ptd,
+ 							slots[slot].qtd->urb);
+ 		}
+@@ -1239,27 +1489,30 @@ static void handle_done_ptds(struct usb_hcd *hcd)
+ static irqreturn_t isp1760_irq(struct usb_hcd *hcd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+-	u32 imask;
+ 	irqreturn_t irqret = IRQ_NONE;
++	u32 int_reg;
++	u32 imask;
+ 
+ 	spin_lock(&priv->lock);
+ 
+ 	if (!(hcd->state & HC_STATE_RUNNING))
+ 		goto leave;
+ 
+-	imask = isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
++	imask = isp1760_hcd_read(hcd, HC_INTERRUPT);
+ 	if (unlikely(!imask))
+ 		goto leave;
+-	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear */
+ 
+-	priv->int_done_map |= isp1760_reg_read(priv->regs,
+-					       ISP176x_HC_INT_PTD_DONEMAP);
+-	priv->atl_done_map |= isp1760_reg_read(priv->regs,
+-					       ISP176x_HC_ATL_PTD_DONEMAP);
++	int_reg = priv->is_isp1763 ? ISP1763_HC_INTERRUPT :
++		ISP176x_HC_INTERRUPT;
++	isp1760_reg_write(priv->regs, int_reg, imask);
++
++	priv->int_done_map |= isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
++	priv->atl_done_map |= isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
+ 
+ 	handle_done_ptds(hcd);
+ 
+ 	irqret = IRQ_HANDLED;
++
+ leave:
+ 	spin_unlock(&priv->lock);
+ 
+@@ -1300,17 +1553,18 @@ static void errata2_function(struct timer_list *unused)
+ {
+ 	struct usb_hcd *hcd = errata2_timer_hcd;
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
+ 	int slot;
+ 	struct ptd ptd;
+ 	unsigned long spinflags;
+ 
+ 	spin_lock_irqsave(&priv->lock, spinflags);
+ 
+-	for (slot = 0; slot < 32; slot++)
++	for (slot = 0; slot < mem->slot_num; slot++)
+ 		if (priv->atl_slots[slot].qh && time_after(jiffies,
+ 					priv->atl_slots[slot].timestamp +
+ 					msecs_to_jiffies(SLOT_TIMEOUT))) {
+-			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
++			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
+ 			if (!FROM_DW0_VALID(ptd.dw0) &&
+ 					!FROM_DW3_ACTIVE(ptd.dw3))
+ 				priv->atl_done_map |= 1 << slot;
+@@ -1325,23 +1579,113 @@ static void errata2_function(struct timer_list *unused)
+ 	add_timer(&errata2_timer);
+ }
+ 
++static int isp1763_run(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	int retval;
++	u32 chipid_h;
++	u32 chipid_l;
++	u32 chip_rev;
++	u32 ptd_atl_int;
++	u32 ptd_iso;
++
++	hcd->uses_new_polling = 1;
++	hcd->state = HC_STATE_RUNNING;
++
++	chipid_h = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
++	chipid_l = isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
++	chip_rev = isp1760_hcd_read(hcd, HC_CHIP_REV);
++	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n",
++		 chipid_h, chipid_l, chip_rev);
++
++	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
++	isp1760_hcd_clear(hcd, INT_BUF_FILL);
++	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
++
++	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
++	ndelay(100);
++	isp1760_hcd_clear(hcd, HC_ATL_PTD_DONEMAP);
++	isp1760_hcd_clear(hcd, HC_INT_PTD_DONEMAP);
++	isp1760_hcd_clear(hcd, HC_ISO_PTD_DONEMAP);
++
++	isp1760_hcd_set(hcd, HW_OTG_DISABLE);
++	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(7));
++	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(15));
++	mdelay(10);
++
++	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
++
++	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
++
++	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
++
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
++
++	ptd_atl_int = 0x8000;
++	ptd_iso = 0x0001;
++
++	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
++
++	isp1760_hcd_set(hcd, ATL_BUF_FILL);
++	isp1760_hcd_set(hcd, INT_BUF_FILL);
++
++	isp1760_hcd_clear(hcd, CMD_LRESET);
++	isp1760_hcd_clear(hcd, CMD_RESET);
++
++	retval = isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
++	if (retval)
++		return retval;
++
++	down_write(&ehci_cf_port_reset_rwsem);
++	retval = isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
++	up_write(&ehci_cf_port_reset_rwsem);
++	retval = 0;
++	if (retval)
++		return retval;
++
++	return 0;
++}
++
+ static int isp1760_run(struct usb_hcd *hcd)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 	int retval;
+-	u32 chipid;
++	u32 chipid_h;
++	u32 chipid_l;
++	u32 chip_rev;
++	u32 ptd_atl_int;
++	u32 ptd_iso;
++
++	/*
++	 * ISP1763 have some differences in the setup and order to enable
++	 * the ports, disable otg, setup buffers, and ATL, INT, ISO status.
++	 * So, just handle it a separate sequence.
++	 */
++	if (priv->is_isp1763)
++		return isp1763_run(hcd);
+ 
+ 	hcd->uses_new_polling = 1;
+ 
+ 	hcd->state = HC_STATE_RUNNING;
+ 
+ 	/* Set PTD interrupt AND & OR maps */
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
++	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
++
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
++
+ 	/* step 23 passed */
+ 
+ 	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
+@@ -1349,7 +1693,7 @@ static int isp1760_run(struct usb_hcd *hcd)
+ 	isp1760_hcd_clear(hcd, CMD_LRESET);
+ 	isp1760_hcd_clear(hcd, CMD_RESET);
+ 
+-	retval = isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
++	retval = isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
+ 	if (retval)
+ 		return retval;
+ 
+@@ -1360,7 +1704,7 @@ static int isp1760_run(struct usb_hcd *hcd)
+ 	 */
+ 	down_write(&ehci_cf_port_reset_rwsem);
+ 
+-	retval = isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
++	retval = isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
+ 	up_write(&ehci_cf_port_reset_rwsem);
+ 	if (retval)
+ 		return retval;
+@@ -1370,19 +1714,25 @@ static int isp1760_run(struct usb_hcd *hcd)
+ 	errata2_timer.expires = jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD);
+ 	add_timer(&errata2_timer);
+ 
+-	chipid = isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
+-	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
+-					chipid & 0xffff, chipid >> 16);
++	chipid_h = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
++	chipid_l = isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
++	chip_rev = isp1760_hcd_read(hcd, HC_CHIP_REV);
++	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n",
++		 chipid_h, chipid_l, chip_rev);
+ 
+ 	/* PTD Register Init Part 2, Step 28 */
+ 
+ 	/* Setup registers controlling PTD checking */
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
+-	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
++	ptd_atl_int = 0x80000000;
++	ptd_iso = 0x00000001;
++
++	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
++
++	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
+ 
+ 	isp1760_hcd_set(hcd, ATL_BUF_FILL);
+ 	isp1760_hcd_set(hcd, INT_BUF_FILL);
+@@ -1623,19 +1973,16 @@ static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
+ 	/* We need to forcefully reclaim the slot since some transfers never
+ 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
+ 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
+-		skip_map = isp1760_reg_read(priv->regs,
+-					    ISP176x_HC_ATL_PTD_SKIPMAP);
++		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
+ 		skip_map |= (1 << qh->slot);
+-		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
+-				  skip_map);
++		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
++		ndelay(100);
+ 		priv->atl_slots[qh->slot].qh = NULL;
+ 		priv->atl_slots[qh->slot].qtd = NULL;
+ 	} else {
+-		skip_map = isp1760_reg_read(priv->regs,
+-					    ISP176x_HC_INT_PTD_SKIPMAP);
++		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
+ 		skip_map |= (1 << qh->slot);
+-		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
+-				  skip_map);
++		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
+ 		priv->int_slots[qh->slot].qh = NULL;
+ 		priv->int_slots[qh->slot].qtd = NULL;
+ 	}
+@@ -1791,7 +2138,7 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
+ 	int ports;
+ 	u16 temp;
+ 
+-	ports = isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
++	ports = isp1760_hcd_n_ports(priv->hcd);
+ 
+ 	desc->bDescriptorType = USB_DT_HUB;
+ 	/* priv 1.0, 2.3.9 says 20ms max */
+@@ -1808,7 +2155,7 @@ static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
+ 
+ 	/* per-port overcurrent reporting */
+ 	temp = HUB_CHAR_INDV_PORT_OCPM;
+-	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
++	if (isp1760_hcd_ppc_is_set(priv->hcd))
+ 		/* per-port power control */
+ 		temp |= HUB_CHAR_INDV_PORT_LPSM;
+ 	else
+@@ -1849,7 +2196,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 	int retval = 0;
+ 	int ports;
+ 
+-	ports = isp1760_hcd_read(hcd, HCS_N_PORTS);
++	ports = isp1760_hcd_n_ports(hcd);
+ 
+ 	/*
+ 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
+@@ -1908,7 +2255,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 			/* we auto-clear this feature */
+ 			break;
+ 		case USB_PORT_FEAT_POWER:
+-			if (isp1760_hcd_is_set(hcd, HCS_PPC))
++			if (isp1760_hcd_ppc_is_set(hcd))
+ 				isp1760_hcd_clear(hcd, PORT_POWER);
+ 			break;
+ 		case USB_PORT_FEAT_C_CONNECTION:
+@@ -1923,7 +2270,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		default:
+ 			goto error;
+ 		}
+-		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
++		isp1760_hcd_read(hcd, CMD_RUN);
+ 		break;
+ 	case GetHubDescriptor:
+ 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
+@@ -1943,7 +2290,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		if (isp1760_hcd_is_set(hcd, PORT_CSC))
+ 			status |= USB_PORT_STAT_C_CONNECTION << 16;
+ 
+-
+ 		/* whoever resumes must GetPortStatus to complete it!! */
+ 		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
+ 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
+@@ -1966,7 +2312,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 				/* stop resume signaling */
+ 				isp1760_hcd_clear(hcd, PORT_CSC);
+ 
+-				retval = isp1760_hcd_clear_poll_timeout(hcd,
++				retval = isp1760_hcd_clear_and_wait(hcd,
+ 							  PORT_RESUME, 2000);
+ 				if (retval != 0) {
+ 					dev_err(hcd->self.controller,
+@@ -1987,11 +2333,11 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 			/* REVISIT:  some hardware needs 550+ usec to clear
+ 			 * this bit; seems too long to spin routinely...
+ 			 */
+-			retval = isp1760_hcd_clear_poll_timeout(hcd, PORT_RESET,
+-								750);
++			retval = isp1760_hcd_clear_and_wait(hcd, PORT_RESET,
++							    750);
+ 			if (retval != 0) {
+ 				dev_err(hcd->self.controller, "port %d reset error %d\n",
+-						wIndex + 1, retval);
++					wIndex + 1, retval);
+ 				goto error;
+ 			}
+ 
+@@ -2039,6 +2385,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		if (!wIndex || wIndex > ports)
+ 			goto error;
+ 		wIndex--;
++
+ 		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
+ 			break;
+ 
+@@ -2055,7 +2402,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 			isp1760_hcd_set(hcd, PORT_SUSPEND);
+ 			break;
+ 		case USB_PORT_FEAT_POWER:
+-			if (isp1760_hcd_is_set(hcd, HCS_PPC))
++			if (isp1760_hcd_ppc_is_set(hcd))
+ 				isp1760_hcd_set(hcd, PORT_POWER);
+ 			break;
+ 		case USB_PORT_FEAT_RESET:
+@@ -2084,7 +2431,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
+ 		default:
+ 			goto error;
+ 		}
+-		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
+ 		break;
+ 
+ 	default:
+@@ -2219,22 +2565,14 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
+ 
+ 	priv->hcd = hcd;
+ 
+-	priv->memory_pool = kcalloc(mem_layout->payload_blocks,
+-				    sizeof(struct isp1760_memory_chunk),
+-				    GFP_KERNEL);
+-	if (!priv->memory_pool) {
+-		ret = -ENOMEM;
+-		goto put_hcd;
+-	}
+-
+-	priv->atl_slots = kcalloc(mem_layout->ptd_num,
++	priv->atl_slots = kcalloc(mem_layout->slot_num,
+ 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
+ 	if (!priv->atl_slots) {
+ 		ret = -ENOMEM;
+-		goto free_mem_pool;
++		goto put_hcd;
+ 	}
+ 
+-	priv->int_slots = kcalloc(mem_layout->ptd_num,
++	priv->int_slots = kcalloc(mem_layout->slot_num,
+ 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
+ 	if (!priv->int_slots) {
+ 		ret = -ENOMEM;
+@@ -2262,8 +2600,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
+ 	kfree(priv->int_slots);
+ free_atl_slots:
+ 	kfree(priv->atl_slots);
+-free_mem_pool:
+-	kfree(priv->memory_pool);
+ put_hcd:
+ 	usb_put_hcd(hcd);
+ 	return ret;
+@@ -2278,5 +2614,4 @@ void isp1760_hcd_unregister(struct isp1760_hcd *priv)
+ 	usb_put_hcd(priv->hcd);
+ 	kfree(priv->atl_slots);
+ 	kfree(priv->int_slots);
+-	kfree(priv->memory_pool);
+ }
+diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
+index 9d2427ce3f1a..ee3063a34de3 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.h
++++ b/drivers/usb/isp1760/isp1760-hcd.h
+@@ -19,13 +19,14 @@ struct isp1760_slotinfo {
+ };
+ 
+ /* chip memory management */
++#define ISP176x_BLOCK_MAX (32 + 20 + 4)
+ #define ISP176x_BLOCK_NUM 3
+ 
+ struct isp1760_memory_layout {
+ 	unsigned int blocks[ISP176x_BLOCK_NUM];
+ 	unsigned int blocks_size[ISP176x_BLOCK_NUM];
+ 
+-	unsigned int ptd_num;
++	unsigned int slot_num;
+ 	unsigned int payload_blocks;
+ 	unsigned int payload_area_size;
+ };
+@@ -51,6 +52,7 @@ struct isp1760_hcd {
+ 	struct regmap		*regs;
+ 	struct regmap_field	*fields[HC_FIELD_MAX];
+ 
++	bool			is_isp1763;
+ 	const struct isp1760_memory_layout	*memory_layout;
+ 
+ 	spinlock_t		lock;
+@@ -58,7 +60,7 @@ struct isp1760_hcd {
+ 	int			atl_done_map;
+ 	struct isp1760_slotinfo	*int_slots;
+ 	int			int_done_map;
+-	struct isp1760_memory_chunk *memory_pool;
++	struct isp1760_memory_chunk memory_pool[ISP176x_BLOCK_MAX];
+ 	struct list_head	qh_list[QH_END];
+ 
+ 	/* periodic schedule support */
+diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
+index cb3e4d782315..7cc349c0b2ad 100644
+--- a/drivers/usb/isp1760/isp1760-if.c
++++ b/drivers/usb/isp1760/isp1760-if.c
+@@ -7,6 +7,7 @@
+  * - PDEV (generic platform device centralized driver model)
+  *
+  * (c) 2007 Sebastian Siewior <bigeasy@linutronix.de>
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
+  *
+  */
+ 
+@@ -209,10 +210,18 @@ static int isp1760_plat_probe(struct platform_device *pdev)
+ 		if (of_device_is_compatible(dp, "nxp,usb-isp1761"))
+ 			devflags |= ISP1760_FLAG_ISP1761;
+ 
+-		/* Some systems wire up only 16 of the 32 data lines */
++		if (of_device_is_compatible(dp, "nxp,usb-isp1763"))
++			devflags |= ISP1760_FLAG_ISP1763;
++
++		/*
++		 * Some systems wire up only 8 of 16 data lines or
++		 * 16 of the 32 data lines
++		 */
+ 		of_property_read_u32(dp, "bus-width", &bus_width);
+ 		if (bus_width == 16)
+ 			devflags |= ISP1760_FLAG_BUS_WIDTH_16;
++		else if (bus_width == 8)
++			devflags |= ISP1760_FLAG_BUS_WIDTH_8;
+ 
+ 		if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_PERIPHERAL)
+ 			devflags |= ISP1760_FLAG_PERIPHERAL_EN;
+@@ -250,6 +259,7 @@ static int isp1760_plat_remove(struct platform_device *pdev)
+ static const struct of_device_id isp1760_of_match[] = {
+ 	{ .compatible = "nxp,usb-isp1760", },
+ 	{ .compatible = "nxp,usb-isp1761", },
++	{ .compatible = "nxp,usb-isp1763", },
+ 	{ },
+ };
+ MODULE_DEVICE_TABLE(of, isp1760_of_match);
+diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
+index 0d5262c37c5b..4f632cbbbd1f 100644
+--- a/drivers/usb/isp1760/isp1760-regs.h
++++ b/drivers/usb/isp1760/isp1760-regs.h
+@@ -2,12 +2,14 @@
+ /*
+  * Driver for the NXP ISP1760 chip
+  *
++ * Copyright 2021 Linaro, Rui Miguel Silva
+  * Copyright 2014 Laurent Pinchart
+  * Copyright 2007 Sebastian Siewior
+  *
+  * Contacts:
+  *     Sebastian Siewior <bigeasy@linutronix.de>
+  *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++ *     Rui Miguel Silva <rui.silva@linaro.org>
+  */
+ 
+ #ifndef _ISP176x_REGS_H_
+@@ -17,8 +19,8 @@
+  * Host Controller
+  */
+ 
++/* ISP1760/31 */
+ /* EHCI capability registers */
+-#define ISP176x_HC_CAPLENGTH		0x000
+ #define ISP176x_HC_VERSION		0x002
+ #define ISP176x_HC_HCSPARAMS		0x004
+ #define ISP176x_HC_HCCPARAMS		0x008
+@@ -59,7 +61,13 @@
+ #define ISP176x_HC_INT_IRQ_MASK_AND	0x328
+ #define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
+ 
++#define ISP176x_HC_OTG_CTRL_SET		0x374
++#define ISP176x_HC_OTG_CTRL_CLEAR	0x376
++
+ enum isp176x_host_controller_fields {
++	/* HC_PORTSC1 */
++	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
++	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
+ 	/* HC_HCSPARAMS */
+ 	HCS_PPC, HCS_N_PORTS,
+ 	/* HC_HCCPARAMS */
+@@ -72,25 +80,86 @@ enum isp176x_host_controller_fields {
+ 	HC_FRINDEX,
+ 	/* HC_CONFIGFLAG */
+ 	FLAG_CF,
+-	/* HC_PORTSC1 */
+-	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
+-	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
++	/* ISO/INT/ATL PTD */
++	HC_ISO_PTD_DONEMAP, HC_ISO_PTD_SKIPMAP, HC_ISO_PTD_LASTPTD,
++	HC_INT_PTD_DONEMAP, HC_INT_PTD_SKIPMAP, HC_INT_PTD_LASTPTD,
++	HC_ATL_PTD_DONEMAP, HC_ATL_PTD_SKIPMAP, HC_ATL_PTD_LASTPTD,
+ 	/* HC_HW_MODE_CTRL */
+ 	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
+ 	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_ACT,
+-	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
++	HW_INTF_LOCK, HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
++	/* HC_CHIP_ID */
++	HC_CHIP_ID_HIGH, HC_CHIP_ID_LOW, HC_CHIP_REV,
++	/* HC_SCRATCH */
++	HC_SCRATCH,
+ 	/* HC_RESET */
+-	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
++	SW_RESET_RESET_ATX, SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
+ 	/* HC_BUFFER_STATUS */
+-	INT_BUF_FILL, ATL_BUF_FILL,
++	ISO_BUF_FILL, INT_BUF_FILL, ATL_BUF_FILL,
+ 	/* HC_MEMORY */
+ 	MEM_BANK_SEL, MEM_START_ADDR,
++	/* HC_DATA */
++	HC_DATA,
++	/* HC_INTERRUPT */
++	HC_INTERRUPT,
+ 	/* HC_INTERRUPT_ENABLE */
+-	HC_INT_ENABLE,
++	HC_INT_IRQ_ENABLE, HC_ATL_IRQ_ENABLE,
++	/* INTERRUPT MASKS */
++	HC_ISO_IRQ_MASK_OR, HC_INT_IRQ_MASK_OR, HC_ATL_IRQ_MASK_OR,
++	HC_ISO_IRQ_MASK_AND, HC_INT_IRQ_MASK_AND, HC_ATL_IRQ_MASK_AND,
++	/* HW_OTG_CTRL_SET */
++	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
++	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP, HW_HC_2_DIS,
++	/* HW_OTG_CTRL_CLR */
++	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
++	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
++	HW_DP_PULLUP_CLEAR, HW_HC_2_DIS_CLEAR,
+ 	/* Last element */
+ 	HC_FIELD_MAX,
+ };
+ 
++/* ISP1763 */
++/* EHCI operational registers */
++#define ISP1763_HC_USBCMD		0x8c
++#define ISP1763_HC_USBSTS		0x90
++#define ISP1763_HC_FRINDEX		0x98
++
++#define ISP1763_HC_CONFIGFLAG		0x9c
++#define ISP1763_HC_PORTSC1		0xa0
++
++#define ISP1763_HC_ISO_PTD_DONEMAP	0xa4
++#define ISP1763_HC_ISO_PTD_SKIPMAP	0xa6
++#define ISP1763_HC_ISO_PTD_LASTPTD	0xa8
++#define ISP1763_HC_INT_PTD_DONEMAP	0xaa
++#define ISP1763_HC_INT_PTD_SKIPMAP	0xac
++#define ISP1763_HC_INT_PTD_LASTPTD	0xae
++#define ISP1763_HC_ATL_PTD_DONEMAP	0xb0
++#define ISP1763_HC_ATL_PTD_SKIPMAP	0xb2
++#define ISP1763_HC_ATL_PTD_LASTPTD	0xb4
++
++/* Configuration Register */
++#define ISP1763_HC_HW_MODE_CTRL		0xb6
++#define ISP1763_HC_CHIP_REV		0x70
++#define ISP1763_HC_CHIP_ID		0x72
++#define ISP1763_HC_SCRATCH		0x78
++#define ISP1763_HC_RESET		0xb8
++#define ISP1763_HC_BUFFER_STATUS	0xba
++#define ISP1763_HC_MEMORY		0xc4
++#define ISP1763_HC_DATA			0xc6
++
++/* Interrupt Register */
++#define ISP1763_HC_INTERRUPT		0xd4
++#define ISP1763_HC_INTERRUPT_ENABLE	0xd6
++#define ISP1763_HC_ISO_IRQ_MASK_OR	0xd8
++#define ISP1763_HC_INT_IRQ_MASK_OR	0xda
++#define ISP1763_HC_ATL_IRQ_MASK_OR	0xdc
++#define ISP1763_HC_ISO_IRQ_MASK_AND	0xde
++#define ISP1763_HC_INT_IRQ_MASK_AND	0xe0
++#define ISP1763_HC_ATL_IRQ_MASK_AND	0xe2
++
++#define ISP1763_HC_OTG_CTRL_SET		0xe4
++#define ISP1763_HC_OTG_CTRL_CLEAR	0xe6
++
+ /* -----------------------------------------------------------------------------
+  * Peripheral Controller
+  */
+@@ -132,9 +201,6 @@ enum isp176x_host_controller_fields {
+ #define ISP176x_DC_CTRLFUNC		0x0228
+ #define ISP176x_DC_EPINDEX		0x022c
+ 
+-#define ISP1761_DC_OTG_CTRL_SET		0x374
+-#define ISP1761_DC_OTG_CTRL_CLEAR	0x376
+-
+ /* DMA Registers */
+ #define ISP176x_DC_DMACMD		0x0230
+ #define ISP176x_DC_DMATXCOUNT		0x0234
+@@ -177,13 +243,6 @@ enum isp176x_device_controller_fields {
+ 	DC_EPENABLE, DC_ENDPTYP,
+ 	/* DC_FRAMENUM */
+ 	DC_FRAMENUM, DC_UFRAMENUM,
+-	/* HW_OTG_CTRL_SET */
+-	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
+-	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
+-	/* HW_OTG_CTRL_CLR */
+-	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
+-	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
+-	HW_DP_PULLUP_CLEAR,
+ 	/* Last element */
+ 	DC_FIELD_MAX,
+ };
+diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
+index 1e2ca43fb152..30efc9d32506 100644
+--- a/drivers/usb/isp1760/isp1760-udc.c
++++ b/drivers/usb/isp1760/isp1760-udc.c
+@@ -2,10 +2,12 @@
+ /*
+  * Driver for the NXP ISP1761 device controller
+  *
++ * Copyright 2021 Linaro, Rui Miguel Silva
+  * Copyright 2014 Ideas on Board Oy
+  *
+  * Contacts:
+  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++ *	Rui Miguel Silva <rui.silva@linaro.org>
+  */
+ 
+ #include <linux/interrupt.h>
+diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
+index a49096c0ac8e..f2ab5929cc9f 100644
+--- a/drivers/usb/isp1760/isp1760-udc.h
++++ b/drivers/usb/isp1760/isp1760-udc.h
+@@ -2,10 +2,12 @@
+ /*
+  * Driver for the NXP ISP1761 device controller
+  *
++ * Copyright 2021 Linaro, Rui Miguel Silva
+  * Copyright 2014 Ideas on Board Oy
+  *
+  * Contacts:
+  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++ *	Rui Miguel Silva <rui.silva@linaro.org>
+  */
+ 
+ #ifndef _ISP1760_UDC_H_
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch
new file mode 100644
index 0000000..88a701c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch
@@ -0,0 +1,99 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From e7a990e00cb13ce66d4008e3b77e8507be0c2e27 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:16 +0100
+Subject: [PATCH 8/9] dt-bindings: usb: nxp,isp1760: add bindings
+
+The nxp,isp1760 driver is old in the tree, but did not had a bindings
+entry, since I am extend it to support isp1763 in the same family, use
+this to add a proper yaml bindings file.
+
+Reviewed-by: Rob Herring <robh@kernel.org>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-9-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ .../devicetree/bindings/usb/nxp,isp1760.yaml  | 69 +++++++++++++++++++
+ 1 file changed, 69 insertions(+)
+ create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
+
+diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
+new file mode 100644
+index 000000000000..a88f99adfe8e
+--- /dev/null
++++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
+@@ -0,0 +1,69 @@
++# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
++%YAML 1.2
++---
++$id: http://devicetree.org/schemas/usb/nxp,isp1760.yaml#
++$schema: http://devicetree.org/meta-schemas/core.yaml#
++
++title: NXP ISP1760 family controller bindings
++
++maintainers:
++  - Sebastian Siewior <bigeasy@linutronix.de>
++  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++
++description: |
++  NXP ISP1760 family, which includes ISP1760/1761/1763 devicetree controller
++  bindings
++
++properties:
++  compatible:
++    enum:
++      - nxp,usb-isp1760
++      - nxp,usb-isp1761
++      - nxp,usb-isp1763
++  reg:
++    maxItems: 1
++
++  interrupts:
++    minItems: 1
++    maxItems: 2
++    items:
++      - description: Host controller interrupt
++      - description: Device controller interrupt in isp1761
++
++  interrupt-names:
++    minItems: 1
++    maxItems: 2
++    items:
++      - const: host
++      - const: peripheral
++
++  bus-width:
++    description:
++      Number of data lines.
++    enum: [8, 16, 32]
++    default: 32
++
++  dr_mode:
++    enum:
++      - host
++      - peripheral
++
++required:
++  - compatible
++  - reg
++  - interrupts
++
++additionalProperties: false
++
++examples:
++  - |
++    #include <dt-bindings/interrupt-controller/arm-gic.h>
++    usb@40200000 {
++        compatible = "nxp,usb-isp1763";
++        reg = <0x40200000 0x100000>;
++        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
++        bus-width = <16>;
++        dr_mode = "host";
++    };
++
++...
+-- 
+2.32.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0009-usb-isp1763-add-peripheral-mode.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0009-usb-isp1763-add-peripheral-mode.patch
new file mode 100644
index 0000000..7b06c91
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0009-usb-isp1763-add-peripheral-mode.patch
@@ -0,0 +1,303 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From d369c9187c1897ce5339716354ce47b2c2f67352 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 13 May 2021 09:47:17 +0100
+Subject: [PATCH 08/23] usb: isp1763: add peripheral mode
+
+Besides the already host mode support add peripheral mode support for
+the isp1763 IP from the isp1760 family.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210513084717.2487366-10-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-core.c | 25 +++++++++++------
+ drivers/usb/isp1760/isp1760-regs.h | 42 ++++++++++++++++++++++++++++
+ drivers/usb/isp1760/isp1760-udc.c  | 45 ++++++++++++++++++++++--------
+ drivers/usb/isp1760/isp1760-udc.h  |  1 +
+ 4 files changed, 94 insertions(+), 19 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+index 1d847f13abab..ff07e2890692 100644
+--- a/drivers/usb/isp1760/isp1760-core.c
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -83,7 +83,8 @@ static int isp1760_init_core(struct isp1760_device *isp)
+ 	 *
+ 	 * TODO: Really support OTG. For now we configure port 1 in device mode
+ 	 */
+-	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
++	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
++	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
+ 	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
+ 		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
+ 		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
+@@ -470,13 +471,15 @@ static const struct regmap_config isp1763_dc_regmap_conf = {
+ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 		     struct device *dev, unsigned int devflags)
+ {
+-	bool udc_disabled = !(devflags & ISP1760_FLAG_ISP1761);
+ 	const struct regmap_config *hc_regmap;
+ 	const struct reg_field *hc_reg_fields;
++	const struct regmap_config *dc_regmap;
++	const struct reg_field *dc_reg_fields;
+ 	struct isp1760_device *isp;
+ 	struct isp1760_hcd *hcd;
+ 	struct isp1760_udc *udc;
+ 	struct regmap_field *f;
++	bool udc_enabled;
+ 	int ret;
+ 	int i;
+ 
+@@ -484,8 +487,11 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 	 * If neither the HCD not the UDC is enabled return an error, as no
+ 	 * device would be registered.
+ 	 */
++	udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
++		       (devflags & ISP1760_FLAG_ISP1761));
++
+ 	if ((!IS_ENABLED(CONFIG_USB_ISP1760_HCD) || usb_disabled()) &&
+-	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || udc_disabled))
++	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || !udc_enabled))
+ 		return -ENODEV;
+ 
+ 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
+@@ -498,6 +504,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 	udc = &isp->udc;
+ 
+ 	hcd->is_isp1763 = !!(devflags & ISP1760_FLAG_ISP1763);
++	udc->is_isp1763 = !!(devflags & ISP1760_FLAG_ISP1763);
+ 
+ 	if (!hcd->is_isp1763 && (devflags & ISP1760_FLAG_BUS_WIDTH_8)) {
+ 		dev_err(dev, "isp1760/61 do not support data width 8\n");
+@@ -507,9 +514,13 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 	if (hcd->is_isp1763) {
+ 		hc_regmap = &isp1763_hc_regmap_conf;
+ 		hc_reg_fields = &isp1763_hc_reg_fields[0];
++		dc_regmap = &isp1763_dc_regmap_conf;
++		dc_reg_fields = &isp1763_dc_reg_fields[0];
+ 	} else {
+ 		hc_regmap = &isp1760_hc_regmap_conf;
+ 		hc_reg_fields = &isp1760_hc_reg_fields[0];
++		dc_regmap = &isp1761_dc_regmap_conf;
++		dc_reg_fields = &isp1761_dc_reg_fields[0];
+ 	}
+ 
+ 	isp->rst_gpio = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
+@@ -532,14 +543,12 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 		hcd->fields[i] = f;
+ 	}
+ 
+-	udc->regs = devm_regmap_init_mmio(dev, hcd->base,
+-					  &isp1761_dc_regmap_conf);
++	udc->regs = devm_regmap_init_mmio(dev, hcd->base, dc_regmap);
+ 	if (IS_ERR(udc->regs))
+ 		return PTR_ERR(udc->regs);
+ 
+ 	for (i = 0; i < DC_FIELD_MAX; i++) {
+-		f = devm_regmap_field_alloc(dev, udc->regs,
+-					    isp1761_dc_reg_fields[i]);
++		f = devm_regmap_field_alloc(dev, udc->regs, dc_reg_fields[i]);
+ 		if (IS_ERR(f))
+ 			return PTR_ERR(f);
+ 
+@@ -562,7 +571,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 			return ret;
+ 	}
+ 
+-	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
++	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && udc_enabled) {
+ 		ret = isp1760_udc_register(isp, irq, irqflags);
+ 		if (ret < 0) {
+ 			isp1760_hcd_unregister(hcd);
+diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
+index 4f632cbbbd1f..94ea60c20b2a 100644
+--- a/drivers/usb/isp1760/isp1760-regs.h
++++ b/drivers/usb/isp1760/isp1760-regs.h
+@@ -243,8 +243,50 @@ enum isp176x_device_controller_fields {
+ 	DC_EPENABLE, DC_ENDPTYP,
+ 	/* DC_FRAMENUM */
+ 	DC_FRAMENUM, DC_UFRAMENUM,
++	/* DC_CHIP_ID */
++	DC_CHIP_ID_HIGH, DC_CHIP_ID_LOW,
++	/* DC_SCRATCH */
++	DC_SCRATCH,
+ 	/* Last element */
+ 	DC_FIELD_MAX,
+ };
+ 
++/* ISP1763 */
++/* Initialization Registers */
++#define ISP1763_DC_ADDRESS		0x00
++#define ISP1763_DC_MODE			0x0c
++#define ISP1763_DC_INTCONF		0x10
++#define ISP1763_DC_INTENABLE		0x14
++
++/* Data Flow Registers */
++#define ISP1763_DC_EPMAXPKTSZ		0x04
++#define ISP1763_DC_EPTYPE		0x08
++
++#define ISP1763_DC_BUFLEN		0x1c
++#define ISP1763_DC_BUFSTAT		0x1e
++#define ISP1763_DC_DATAPORT		0x20
++
++#define ISP1763_DC_CTRLFUNC		0x28
++#define ISP1763_DC_EPINDEX		0x2c
++
++/* DMA Registers */
++#define ISP1763_DC_DMACMD		0x30
++#define ISP1763_DC_DMATXCOUNT		0x34
++#define ISP1763_DC_DMACONF		0x38
++#define ISP1763_DC_DMAHW		0x3c
++#define ISP1763_DC_DMAINTREASON		0x50
++#define ISP1763_DC_DMAINTEN		0x54
++#define ISP1763_DC_DMAEP		0x58
++#define ISP1763_DC_DMABURSTCOUNT	0x64
++
++/* General Registers */
++#define ISP1763_DC_INTERRUPT		0x18
++#define ISP1763_DC_CHIPID_LOW		0x70
++#define ISP1763_DC_CHIPID_HIGH		0x72
++#define ISP1763_DC_FRAMENUM		0x74
++#define ISP1763_DC_SCRATCH		0x78
++#define ISP1763_DC_UNLOCKDEV		0x7c
++#define ISP1763_DC_INTPULSEWIDTH	0x80
++#define ISP1763_DC_TESTMODE		0x84
++
+ #endif
+diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
+index 30efc9d32506..3e05e3605435 100644
+--- a/drivers/usb/isp1760/isp1760-udc.c
++++ b/drivers/usb/isp1760/isp1760-udc.c
+@@ -1151,6 +1151,10 @@ static void isp1760_udc_disconnect(struct isp1760_udc *udc)
+ 
+ static void isp1760_udc_init_hw(struct isp1760_udc *udc)
+ {
++	u32 intconf = udc->is_isp1763 ? ISP1763_DC_INTCONF : ISP176x_DC_INTCONF;
++	u32 intena = udc->is_isp1763 ? ISP1763_DC_INTENABLE :
++						ISP176x_DC_INTENABLE;
++
+ 	/*
+ 	 * The device controller currently shares its interrupt with the host
+ 	 * controller, the DC_IRQ polarity and signaling mode are ignored. Set
+@@ -1160,11 +1164,11 @@ static void isp1760_udc_init_hw(struct isp1760_udc *udc)
+ 	 * ACK tokens only (and NYET for the out pipe). The default
+ 	 * configuration also generates an interrupt on the first NACK token.
+ 	 */
+-	isp1760_reg_write(udc->regs, ISP176x_DC_INTCONF,
++	isp1760_reg_write(udc->regs, intconf,
+ 			  ISP176x_DC_CDBGMOD_ACK | ISP176x_DC_DDBGMODIN_ACK |
+ 			  ISP176x_DC_DDBGMODOUT_ACK);
+ 
+-	isp1760_reg_write(udc->regs, ISP176x_DC_INTENABLE, DC_IEPRXTX(7) |
++	isp1760_reg_write(udc->regs, intena, DC_IEPRXTX(7) |
+ 			  DC_IEPRXTX(6) | DC_IEPRXTX(5) | DC_IEPRXTX(4) |
+ 			  DC_IEPRXTX(3) | DC_IEPRXTX(2) | DC_IEPRXTX(1) |
+ 			  DC_IEPRXTX(0) | ISP176x_DC_IEP0SETUP |
+@@ -1304,13 +1308,14 @@ static int isp1760_udc_start(struct usb_gadget *gadget,
+ static int isp1760_udc_stop(struct usb_gadget *gadget)
+ {
+ 	struct isp1760_udc *udc = gadget_to_udc(gadget);
++	u32 mode_reg = udc->is_isp1763 ? ISP1763_DC_MODE : ISP176x_DC_MODE;
+ 	unsigned long flags;
+ 
+ 	dev_dbg(udc->isp->dev, "%s\n", __func__);
+ 
+ 	del_timer_sync(&udc->vbus_timer);
+ 
+-	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
++	isp1760_reg_write(udc->regs, mode_reg, 0);
+ 
+ 	spin_lock_irqsave(&udc->lock, flags);
+ 	udc->driver = NULL;
+@@ -1332,15 +1337,30 @@ static const struct usb_gadget_ops isp1760_udc_ops = {
+  * Interrupt Handling
+  */
+ 
++static u32 isp1760_udc_irq_get_status(struct isp1760_udc *udc)
++{
++	u32 status;
++
++	if (udc->is_isp1763) {
++		status = isp1760_reg_read(udc->regs, ISP1763_DC_INTERRUPT)
++			& isp1760_reg_read(udc->regs, ISP1763_DC_INTENABLE);
++		isp1760_reg_write(udc->regs, ISP1763_DC_INTERRUPT, status);
++	} else {
++		status = isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
++			& isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
++		isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
++	}
++
++	return status;
++}
++
+ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
+ {
+ 	struct isp1760_udc *udc = dev;
+ 	unsigned int i;
+ 	u32 status;
+ 
+-	status = isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
+-	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
+-	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
++	status = isp1760_udc_irq_get_status(udc);
+ 
+ 	if (status & DC_IEVBUS) {
+ 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
+@@ -1475,6 +1495,7 @@ static void isp1760_udc_init_eps(struct isp1760_udc *udc)
+ 
+ static int isp1760_udc_init(struct isp1760_udc *udc)
+ {
++	u32 mode_reg = udc->is_isp1763 ? ISP1763_DC_MODE : ISP176x_DC_MODE;
+ 	u16 scratch;
+ 	u32 chipid;
+ 
+@@ -1484,9 +1505,10 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
+ 	 * register, and reading the scratch register value back. The chip ID
+ 	 * and scratch register contents must match the expected values.
+ 	 */
+-	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
+-	chipid = isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
+-	scratch = isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
++	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
++	chipid = isp1760_udc_read(udc, DC_CHIP_ID_HIGH) << 16;
++	chipid |= isp1760_udc_read(udc, DC_CHIP_ID_LOW);
++	scratch = isp1760_udc_read(udc, DC_SCRATCH);
+ 
+ 	if (scratch != 0xbabe) {
+ 		dev_err(udc->isp->dev,
+@@ -1495,7 +1517,8 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
+ 		return -ENODEV;
+ 	}
+ 
+-	if (chipid != 0x00011582 && chipid != 0x00158210) {
++	if (chipid != 0x00011582 && chipid != 0x00158210 &&
++	    chipid != 0x00176320) {
+ 		dev_err(udc->isp->dev, "udc: invalid chip ID 0x%08x\n", chipid);
+ 		return -ENODEV;
+ 	}
+@@ -1503,7 +1526,7 @@ static int isp1760_udc_init(struct isp1760_udc *udc)
+ 	/* Reset the device controller. */
+ 	isp1760_udc_set(udc, DC_SFRESET);
+ 	usleep_range(10000, 11000);
+-	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
++	isp1760_reg_write(udc->regs, mode_reg, 0);
+ 	usleep_range(10000, 11000);
+ 
+ 	return 0;
+diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
+index f2ab5929cc9f..22044e86bc0e 100644
+--- a/drivers/usb/isp1760/isp1760-udc.h
++++ b/drivers/usb/isp1760/isp1760-udc.h
+@@ -84,6 +84,7 @@ struct isp1760_udc {
+ 	u16 ep0_length;
+ 
+ 	bool connected;
++	bool is_isp1763;
+ 
+ 	unsigned int devstatus;
+ };
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch
new file mode 100644
index 0000000..7e85595
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 8268acfe1cc967dbe9fbb05b5f07a19675a81cff Mon Sep 17 00:00:00 2001
+From: Lee Jones <lee.jones@linaro.org>
+Date: Wed, 26 May 2021 14:00:19 +0100
+Subject: [PATCH 09/23] usb: isp1760: isp1760-udc: Provide missing description
+ for 'udc' param
+
+Fixes the following W=1 kernel build warning(s):
+
+ drivers/usb/isp1760/isp1760-udc.c:150: warning: Function parameter or member 'udc' not described in 'isp1760_udc_select_ep'
+
+Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Cc: Rui Miguel Silva <rui.silva@linaro.org>
+Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Cc: linux-usb@vger.kernel.org
+Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Lee Jones <lee.jones@linaro.org>
+Link: https://lore.kernel.org/r/20210526130037.856068-7-lee.jones@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/isp1760/isp1760-udc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
+index 3e05e3605435..a78da59d6417 100644
+--- a/drivers/usb/isp1760/isp1760-udc.c
++++ b/drivers/usb/isp1760/isp1760-udc.c
+@@ -137,6 +137,7 @@ static void __isp1760_udc_select_ep(struct isp1760_udc *udc,
+ /**
+  * isp1760_udc_select_ep - Select an endpoint for register access
+  * @ep: The endpoint
++ * @udc: Reference to the device controller
+  *
+  * The ISP1761 endpoint registers are banked. This function selects the target
+  * endpoint for banked register access. The selection remains valid until the
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch
new file mode 100644
index 0000000..a194d7b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 5f4dee73a4bc25a7781a5406b49439bc640981c2 Mon Sep 17 00:00:00 2001
+From: Tong Tiangen <tongtiangen@huawei.com>
+Date: Fri, 11 Jun 2021 09:40:55 +0800
+Subject: [PATCH 10/23] usb: isp1760: Fix meaningless check in isp1763_run()
+
+Remove attribution to retval before check, which make it completely
+meaningless, and does't check what it was supposed: the return
+value of the timed function to set up configuration flag.
+
+Fixes: 60d789f3bfbb ("usb: isp1760: add support for isp1763")
+Tested-by: Rui Miguel Silva <rui.silva@linaro.org>
+Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
+Link: https://lore.kernel.org/r/20210611014055.68551-1-tongtiangen@huawei.com
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 016a54ea76f4..27168b4a4ef2 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -1648,7 +1648,6 @@ static int isp1763_run(struct usb_hcd *hcd)
+ 	down_write(&ehci_cf_port_reset_rwsem);
+ 	retval = isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
+ 	up_write(&ehci_cf_port_reset_rwsem);
+-	retval = 0;
+ 	if (retval)
+ 		return retval;
+ 
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0024-usb-isp1760-remove-debug-message-as-error.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0024-usb-isp1760-remove-debug-message-as-error.patch
new file mode 100644
index 0000000..10ccfd7
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0024-usb-isp1760-remove-debug-message-as-error.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 7de14c88272c05d86fce83a5cead36832ce3a424 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 27 Jul 2021 11:05:14 +0100
+Subject: [PATCH 11/23] usb: isp1760: remove debug message as error
+
+Remove debug message leftover from the boot error buffer.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210727100516.4190681-2-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 27168b4a4ef2..a745c4c2b773 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -733,7 +733,6 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ 
+ 	/* Change bus pattern */
+ 	scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
+-	dev_err(hcd->self.controller, "Scratch test 0x%08x\n", scratch);
+ 	scratch = isp1760_hcd_read(hcd, HC_SCRATCH);
+ 	if (scratch != pattern) {
+ 		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratch);
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch
new file mode 100644
index 0000000..ab6627e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 41f673183862a183d4ea0522c045fabfbd1b28c8 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 27 Jul 2021 11:05:15 +0100
+Subject: [PATCH 12/23] usb: isp1760: do not sleep in field register poll
+
+When polling for a setup or clear of a register field we were sleeping
+in atomic context but using a very tight sleep interval.
+
+Since the use cases for this poll mechanism are only in setup and
+stop paths, and in practice this poll is not used most of the times
+but needs to be there to comply to hardware setup times, remove the
+sleep time and make the poll loop tighter.
+
+Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210727100516.4190681-3-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index a745c4c2b773..a018394d54f8 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -250,7 +250,7 @@ static int isp1760_hcd_set_and_wait(struct usb_hcd *hcd, u32 field,
+ 	isp1760_hcd_set(hcd, field);
+ 
+ 	return regmap_field_read_poll_timeout(priv->fields[field], val,
+-					      val, 10, timeout_us);
++					      val, 0, timeout_us);
+ }
+ 
+ static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
+@@ -262,7 +262,7 @@ static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
+ 	isp1760_hcd_set(hcd, field);
+ 
+ 	return regmap_field_read_poll_timeout(priv->fields[field], val,
+-					      !val, 10, timeout_us);
++					      !val, 0, timeout_us);
+ }
+ 
+ static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
+@@ -274,7 +274,7 @@ static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
+ 	isp1760_hcd_clear(hcd, field);
+ 
+ 	return regmap_field_read_poll_timeout(priv->fields[field], val,
+-					      !val, 10, timeout_us);
++					      !val, 0, timeout_us);
+ }
+ 
+ static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0026-usb-isp1760-rework-cache-initialization-error-handli.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0026-usb-isp1760-rework-cache-initialization-error-handli.patch
new file mode 100644
index 0000000..d03d647
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0026-usb-isp1760-rework-cache-initialization-error-handli.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From cbbdb3fe0d974d655c87c3e6ba2990d5496b9f82 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 27 Jul 2021 11:05:16 +0100
+Subject: [PATCH 13/23] usb: isp1760: rework cache initialization error
+ handling
+
+If we fail to create qtd cache we were not destroying the
+urb_listitem, rework the error handling logic to cope with that.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210727100516.4190681-4-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 16 +++++++++++-----
+ 1 file changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index a018394d54f8..825be736be33 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -2527,17 +2527,23 @@ int __init isp1760_init_kmem_once(void)
+ 			SLAB_MEM_SPREAD, NULL);
+ 
+ 	if (!qtd_cachep)
+-		return -ENOMEM;
++		goto destroy_urb_listitem;
+ 
+ 	qh_cachep = kmem_cache_create("isp1760_qh", sizeof(struct isp1760_qh),
+ 			0, SLAB_TEMPORARY | SLAB_MEM_SPREAD, NULL);
+ 
+-	if (!qh_cachep) {
+-		kmem_cache_destroy(qtd_cachep);
+-		return -ENOMEM;
+-	}
++	if (!qh_cachep)
++		goto destroy_qtd;
+ 
+ 	return 0;
++
++destroy_qtd:
++	kmem_cache_destroy(qtd_cachep);
++
++destroy_urb_listitem:
++	kmem_cache_destroy(urb_listitem_cachep);
++
++	return -ENOMEM;
+ }
+ 
+ void isp1760_deinit_kmem_cache(void)
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch
new file mode 100644
index 0000000..354291a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 8472896f39cfab2d8fec9ca746070aaf02609169 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 19 Aug 2021 19:09:25 +0100
+Subject: [PATCH 14/23] usb: isp1760: ignore return value for bus change
+ pattern
+
+We do not care about the return value of that read between the
+scratch register write and read, we really just want to make sure that
+the pattern in the bus get changed to make sure we are testing
+correctly the scratch pattern.
+
+Clang-analyzer complains about the never read scratch variable:
+>> drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'scratch' is never read [clang-analyzer-deadcode.DeadStores]
+    scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
+
+Just ignore the return value of that CHIP_ID_HIGH read, add more
+information to the comment above why we are doing this. And as at it,
+just do a small format change in the error message bellow.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210819180929.1327349-2-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 825be736be33..2a21fe5aa7a8 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -731,11 +731,15 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
+ 
+ 	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
+ 
+-	/* Change bus pattern */
+-	scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
++	/*
++	 * we do not care about the read value here we just want to
++	 * change bus pattern.
++	 */
++	isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
+ 	scratch = isp1760_hcd_read(hcd, HC_SCRATCH);
+ 	if (scratch != pattern) {
+-		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratch);
++		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n",
++			scratch);
+ 		return -ENODEV;
+ 	}
+ 
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0028-usb-isp1760-check-maxpacketsize-before-using-it.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0028-usb-isp1760-check-maxpacketsize-before-using-it.patch
new file mode 100644
index 0000000..67c3585
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0028-usb-isp1760-check-maxpacketsize-before-using-it.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 8e58b7710d6634ed46ae26fedb8459f84f08fd51 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 19 Aug 2021 19:09:26 +0100
+Subject: [PATCH 15/23] usb: isp1760: check maxpacketsize before using it
+
+When checking if we need one more packet on a bulk pipe we may, even
+though not probable at all, get there with a zero maxpacketsize.
+In that case for sure no packet, no even a one more, will be
+allocated.
+
+This will clean the clang-analyzer warning:
+drivers/usb/isp1760/isp1760-hcd.c:1856:38: warning: Division by zero [clang-analyzer-core.DivideZero]
+                                && !(urb->transfer_buffer_length %
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210819180929.1327349-3-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 2a21fe5aa7a8..5c947a1eae49 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -1854,7 +1854,7 @@ static void packetize_urb(struct usb_hcd *hcd,
+ 				packet_type = OUT_PID;
+ 			else
+ 				packet_type = IN_PID;
+-		} else if (usb_pipebulk(urb->pipe)
++		} else if (usb_pipebulk(urb->pipe) && maxpacketsize
+ 				&& (urb->transfer_flags & URB_ZERO_PACKET)
+ 				&& !(urb->transfer_buffer_length %
+ 							maxpacketsize)) {
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0029-usb-isp1760-do-not-reset-retval.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0029-usb-isp1760-do-not-reset-retval.patch
new file mode 100644
index 0000000..ccf3248
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0029-usb-isp1760-do-not-reset-retval.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 5e4cd1b6556302fe6a457e525c256cbef3563543 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 19 Aug 2021 19:09:27 +0100
+Subject: [PATCH 16/23] usb: isp1760: do not reset retval
+
+We do not really need to reset retval before get used bellow.
+This will avoid the clang-analyzer warning:
+
+drivers/usb/isp1760/isp1760-hcd.c:1919:2: warning: Value stored to 'retval' is never read [clang-analyzer-deadcode.DeadStores]
+        retval = 0;
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210819180929.1327349-4-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index 5c947a1eae49..aed2714ce0cf 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -1919,7 +1919,6 @@ static int isp1760_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
+ 	if (list_empty(&new_qtds))
+ 		return -ENOMEM;
+ 
+-	retval = 0;
+ 	spin_lock_irqsave(&priv->lock, spinflags);
+ 
+ 	if (!test_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)) {
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch
new file mode 100644
index 0000000..1de6c69
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch
@@ -0,0 +1,61 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 7d1d3882fd9da1ee42fe3ad3a5ffd41fb8204380 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 19 Aug 2021 19:09:28 +0100
+Subject: [PATCH 17/23] usb: isp1760: do not shift in uninitialized slot
+
+Even though it is not expected, and would trigger a WARN_ON, killing a
+transfer in a uninitialized slot this sequence is warned by clang
+analyzer, twice:
+
+drivers/usb/isp1760/isp1760-hcd.c:1976:18: warning: The result of the left shift is undefined because the right operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
+                skip_map |= (1 << qh->slot);
+drivers/usb/isp1760/isp1760-hcd.c:1983:18: warning: The result of the left shift is undefined because the right operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
+                skip_map |= (1 << qh->slot);
+
+Only set skip map if slot is active.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210819180929.1327349-5-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index aed2714ce0cf..bf8ab3fe2e5a 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -1974,16 +1974,20 @@ static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
+ 	/* We need to forcefully reclaim the slot since some transfers never
+ 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
+ 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
+-		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
+-		skip_map |= (1 << qh->slot);
+-		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
+-		ndelay(100);
++		if (qh->slot != -1) {
++			skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
++			skip_map |= (1 << qh->slot);
++			isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
++			ndelay(100);
++		}
+ 		priv->atl_slots[qh->slot].qh = NULL;
+ 		priv->atl_slots[qh->slot].qtd = NULL;
+ 	} else {
+-		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
+-		skip_map |= (1 << qh->slot);
+-		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
++		if (qh->slot != -1) {
++			skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
++			skip_map |= (1 << qh->slot);
++			isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
++		}
+ 		priv->int_slots[qh->slot].qh = NULL;
+ 		priv->int_slots[qh->slot].qtd = NULL;
+ 	}
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch
new file mode 100644
index 0000000..7d908de
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Accepted [merged with kernel 5.15]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From de940244e8987a76d73fb2b0057ecd494cbfeefd Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 19 Aug 2021 19:09:29 +0100
+Subject: [PATCH 18/23] usb: isp1760: clean never read udc_enabled warning
+
+When CONFIG_USB_ISP1761_UDC is not enabled the udc_enabled variable is
+never used since it is short circuited before in the logic operations.
+
+This would trigger the following warning by clang analyzer:
+
+drivers/usb/isp1760/isp1760-core.c:490:2: warning: Value stored to 'udc_enabled' is never read [clang-analyzer-deadcode.DeadStores]
+        udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
+        ^
+drivers/usb/isp1760/isp1760-core.c:490:2: note: Value stored to 'udc_enabled' is never read
+
+Just swap the other of the operands in the logic operations.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Link: https://lore.kernel.org/r/20210819180929.1327349-6-rui.silva@linaro.org
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/isp1760/isp1760-core.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+index ff07e2890692..cb70f9d63cdd 100644
+--- a/drivers/usb/isp1760/isp1760-core.c
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -491,7 +491,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 		       (devflags & ISP1760_FLAG_ISP1761));
+ 
+ 	if ((!IS_ENABLED(CONFIG_USB_ISP1760_HCD) || usb_disabled()) &&
+-	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || !udc_enabled))
++	    (!udc_enabled || !IS_ENABLED(CONFIG_USB_ISP1761_UDC)))
+ 		return -ENODEV;
+ 
+ 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
+@@ -571,7 +571,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
+ 			return ret;
+ 	}
+ 
+-	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && udc_enabled) {
++	if (udc_enabled && IS_ENABLED(CONFIG_USB_ISP1761_UDC)) {
+ 		ret = isp1760_udc_register(isp, irq, irqflags);
+ 		if (ret < 0) {
+ 			isp1760_hcd_unregister(hcd);
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0032-usb-isp1760-fix-memory-pool-initialization.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0032-usb-isp1760-fix-memory-pool-initialization.patch
new file mode 100644
index 0000000..6277d8a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0032-usb-isp1760-fix-memory-pool-initialization.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From d36713c344e0c963178e417911d2cd867597d2f0 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Fri, 27 Aug 2021 01:27:40 +0100
+Subject: [PATCH 19/23] usb: isp1760: fix memory pool initialization
+
+The loops to setup the memory pool were skipping some
+blocks, that was not visible on the ISP1763 because it has
+fewer blocks than the ISP1761. But won testing on that IP
+from the family that would be an issue.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index bf8ab3fe2e5a..b3a55c5d2155 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -588,8 +588,8 @@ static void init_memory(struct isp1760_hcd *priv)
+ 
+ 	payload_addr = PAYLOAD_OFFSET;
+ 
+-	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++) {
+-		for (j = 0; j < mem->blocks[i]; j++, curr++) {
++	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++, curr += j) {
++		for (j = 0; j < mem->blocks[i]; j++) {
+ 			priv->memory_pool[curr + j].start = payload_addr;
+ 			priv->memory_pool[curr + j].size = mem->blocks_size[i];
+ 			priv->memory_pool[curr + j].free = 1;
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0033-usb-isp1760-fix-qtd-fill-length.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0033-usb-isp1760-fix-qtd-fill-length.patch
new file mode 100644
index 0000000..ee913bc
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0033-usb-isp1760-fix-qtd-fill-length.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From fc22c0fb49d7858b3c7b8bd2a8e041263280e230 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 25 Aug 2021 00:10:02 +0100
+Subject: [PATCH 20/23] usb: isp1760: fix qtd fill length
+
+When trying to send bulks bigger than the biggest block size
+we need to split them over several qtd. Fix this limiting the
+maximum qtd size to largest block size.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index b3a55c5d2155..fba21122bb00 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -1829,9 +1829,11 @@ static void packetize_urb(struct usb_hcd *hcd,
+ 			goto cleanup;
+ 
+ 		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
+-			len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
++			this_qtd_len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
++		else
++			this_qtd_len = len;
+ 
+-		this_qtd_len = qtd_fill(qtd, buf, len);
++		this_qtd_len = qtd_fill(qtd, buf, this_qtd_len);
+ 		list_add_tail(&qtd->qtd_list, head);
+ 
+ 		len -= this_qtd_len;
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0034-usb-isp1760-write-to-status-and-address-register.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0034-usb-isp1760-write-to-status-and-address-register.patch
new file mode 100644
index 0000000..7b8d845
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0034-usb-isp1760-write-to-status-and-address-register.patch
@@ -0,0 +1,90 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From a5dca0d8c66fb40ef372b596cbcfad45112fa050 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 24 Aug 2021 09:37:27 +0100
+Subject: [PATCH 21/23] usb: isp1760: write to status and address register
+
+We were already writing directly the port status register to
+trigger changes in isp1763. The same is needed in other IP
+from the family, including also to setup the read address
+before reading from device.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/isp1760/isp1760-hcd.c | 23 +++++++++++------------
+ 1 file changed, 11 insertions(+), 12 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+index fba21122bb00..79d571f1429b 100644
+--- a/drivers/usb/isp1760/isp1760-hcd.c
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -182,7 +182,7 @@ struct urb_listitem {
+ 	struct urb *urb;
+ };
+ 
+-static const u32 isp1763_hc_portsc1_fields[] = {
++static const u32 isp176x_hc_portsc1_fields[] = {
+ 	[PORT_OWNER]		= BIT(13),
+ 	[PORT_POWER]		= BIT(12),
+ 	[PORT_LSTATUS]		= BIT(10),
+@@ -205,27 +205,28 @@ static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
+ }
+ 
+ /*
+- * We need, in isp1763, to write directly the values to the portsc1
++ * We need, in isp176x, to write directly the values to the portsc1
+  * register so it will make the other values to trigger.
+  */
+ static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32 field,
+ 					  u32 val)
+ {
+-	u32 bit = isp1763_hc_portsc1_fields[field];
+-	u32 port_status = readl(priv->base + ISP1763_HC_PORTSC1);
++	u32 bit = isp176x_hc_portsc1_fields[field];
++	u16 portsc1_reg = priv->is_isp1763 ? ISP1763_HC_PORTSC1 :
++		ISP176x_HC_PORTSC1;
++	u32 port_status = readl(priv->base + portsc1_reg);
+ 
+ 	if (val)
+-		writel(port_status | bit, priv->base + ISP1763_HC_PORTSC1);
++		writel(port_status | bit, priv->base + portsc1_reg);
+ 	else
+-		writel(port_status & ~bit, priv->base + ISP1763_HC_PORTSC1);
++		writel(port_status & ~bit, priv->base + portsc1_reg);
+ }
+ 
+ static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 
+-	if (unlikely(priv->is_isp1763 &&
+-		     (field >= PORT_OWNER && field <= PORT_CONNECT)))
++	if (unlikely((field >= PORT_OWNER && field <= PORT_CONNECT)))
+ 		return isp1760_hcd_portsc1_set_clear(priv, field, val);
+ 
+ 	isp1760_field_write(priv->fields, field, val);
+@@ -367,8 +368,7 @@ static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void *dst,
+ {
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 
+-	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
+-	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
++	isp1760_reg_write(priv->regs, ISP176x_HC_MEMORY, src_offset);
+ 	ndelay(100);
+ 
+ 	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
+@@ -496,8 +496,7 @@ static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
+ 	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
+ 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+ 
+-	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
+-	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
++	isp1760_reg_write(priv->regs, ISP176x_HC_MEMORY, src_offset);
+ 	ndelay(90);
+ 
+ 	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *)ptd,
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0035-usb-isp1760-use-the-right-irq-status-bit.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0035-usb-isp1760-use-the-right-irq-status-bit.patch
new file mode 100644
index 0000000..8faad8f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0035-usb-isp1760-use-the-right-irq-status-bit.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 8f238acb1dada56dc6898a6ce2551feed0e6e8c2 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 25 Aug 2021 00:36:55 +0100
+Subject: [PATCH 22/23] usb: isp1760: use the right irq status bit
+
+Instead of using the fields enum values to check interrupts
+trigged, use the correct bit values.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/isp1760/isp1760-udc.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
+index a78da59d6417..5cafd23345ca 100644
+--- a/drivers/usb/isp1760/isp1760-udc.c
++++ b/drivers/usb/isp1760/isp1760-udc.c
+@@ -1363,7 +1363,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
+ 
+ 	status = isp1760_udc_irq_get_status(udc);
+ 
+-	if (status & DC_IEVBUS) {
++	if (status & ISP176x_DC_IEVBUS) {
+ 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
+ 		/* The VBUS interrupt is only triggered when VBUS appears. */
+ 		spin_lock(&udc->lock);
+@@ -1371,7 +1371,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
+ 		spin_unlock(&udc->lock);
+ 	}
+ 
+-	if (status & DC_IEBRST) {
++	if (status & ISP176x_DC_IEBRST) {
+ 		dev_dbg(udc->isp->dev, "%s(BRST)\n", __func__);
+ 
+ 		isp1760_udc_reset(udc);
+@@ -1391,18 +1391,18 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
+ 		}
+ 	}
+ 
+-	if (status & DC_IEP0SETUP) {
++	if (status & ISP176x_DC_IEP0SETUP) {
+ 		dev_dbg(udc->isp->dev, "%s(EP0SETUP)\n", __func__);
+ 
+ 		isp1760_ep0_setup(udc);
+ 	}
+ 
+-	if (status & DC_IERESM) {
++	if (status & ISP176x_DC_IERESM) {
+ 		dev_dbg(udc->isp->dev, "%s(RESM)\n", __func__);
+ 		isp1760_udc_resume(udc);
+ 	}
+ 
+-	if (status & DC_IESUSP) {
++	if (status & ISP176x_DC_IESUSP) {
+ 		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
+ 
+ 		spin_lock(&udc->lock);
+@@ -1413,7 +1413,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *dev)
+ 		spin_unlock(&udc->lock);
+ 	}
+ 
+-	if (status & DC_IEHS_STA) {
++	if (status & ISP176x_DC_IEHS_STA) {
+ 		dev_dbg(udc->isp->dev, "%s(HS_STA)\n", __func__);
+ 		udc->gadget.speed = USB_SPEED_HIGH;
+ 	}
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0036-usb-isp1760-otg-control-register-access.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0036-usb-isp1760-otg-control-register-access.patch
new file mode 100644
index 0000000..e7ddc89
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0036-usb-isp1760-otg-control-register-access.patch
@@ -0,0 +1,134 @@
+Upstream-Status: Accepted [merged with kernel 5.14.9]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 6ccc598ff04d7f7babcbf194b5a0913119abb702 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Fri, 27 Aug 2021 08:22:26 +0100
+Subject: [PATCH 23/23] usb: isp1760: otg control register access
+
+The set/clear of the otg control values is done writing to
+two different 16bit registers, however we setup the regmap
+width for isp1760/61 to 32bit value bits.
+
+So, just access the clear register address (0x376)as the high
+part of the otg control register set (0x374), and write the
+values in one go to make sure they get clear/set.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/isp1760/isp1760-core.c | 50 ++++++++++++++++--------------
+ drivers/usb/isp1760/isp1760-regs.h | 16 ++++++++++
+ 2 files changed, 42 insertions(+), 24 deletions(-)
+
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+index cb70f9d63cdd..d1d9a7d5da17 100644
+--- a/drivers/usb/isp1760/isp1760-core.c
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -30,6 +30,7 @@ static int isp1760_init_core(struct isp1760_device *isp)
+ {
+ 	struct isp1760_hcd *hcd = &isp->hcd;
+ 	struct isp1760_udc *udc = &isp->udc;
++	u32 otg_ctrl;
+ 
+ 	/* Low-level chip reset */
+ 	if (isp->rst_gpio) {
+@@ -83,16 +84,17 @@ static int isp1760_init_core(struct isp1760_device *isp)
+ 	 *
+ 	 * TODO: Really support OTG. For now we configure port 1 in device mode
+ 	 */
+-	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
+-	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
+-	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
+-		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
+-		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
+-		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
+-	} else {
+-		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
+-		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
+-		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
++	if (isp->devflags & ISP1760_FLAG_ISP1761) {
++		if (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN) {
++			otg_ctrl = (ISP176x_HW_DM_PULLDOWN_CLEAR |
++				    ISP176x_HW_DP_PULLDOWN_CLEAR |
++				    ISP176x_HW_OTG_DISABLE);
++		} else {
++			otg_ctrl = (ISP176x_HW_SW_SEL_HC_DC_CLEAR |
++				    ISP176x_HW_VBUS_DRV |
++				    ISP176x_HW_SEL_CP_EXT);
++		}
++		isp1760_reg_write(hcd->regs, ISP176x_HC_OTG_CTRL, otg_ctrl);
+ 	}
+ 
+ 	dev_info(isp->dev, "%s bus width: %u, oc: %s\n",
+@@ -235,20 +237,20 @@ static const struct reg_field isp1760_hc_reg_fields[] = {
+ 	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31),
+ 	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31),
+ 	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31),
+-	[HW_OTG_DISABLE]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
+-	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
+-	[HW_VBUS_DRV]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
+-	[HW_SEL_CP_EXT]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
+-	[HW_DM_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
+-	[HW_DP_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
+-	[HW_DP_PULLUP]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
+-	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10),
+-	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7),
+-	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
+-	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
+-	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
+-	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
+-	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
++	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 26, 26),
++	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 23, 23),
++	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 20, 20),
++	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 19, 19),
++	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 18, 18),
++	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 17, 17),
++	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 16, 16),
++	[HW_OTG_DISABLE]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 10, 10),
++	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 7, 7),
++	[HW_VBUS_DRV]		= REG_FIELD(ISP176x_HC_OTG_CTRL, 4, 4),
++	[HW_SEL_CP_EXT]		= REG_FIELD(ISP176x_HC_OTG_CTRL, 3, 3),
++	[HW_DM_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 2, 2),
++	[HW_DP_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL, 1, 1),
++	[HW_DP_PULLUP]		= REG_FIELD(ISP176x_HC_OTG_CTRL, 0, 0),
+ };
+ 
+ static const struct reg_field isp1763_hc_reg_fields[] = {
+diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
+index 94ea60c20b2a..3a6751197e97 100644
+--- a/drivers/usb/isp1760/isp1760-regs.h
++++ b/drivers/usb/isp1760/isp1760-regs.h
+@@ -61,6 +61,7 @@
+ #define ISP176x_HC_INT_IRQ_MASK_AND	0x328
+ #define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
+ 
++#define ISP176x_HC_OTG_CTRL		0x374
+ #define ISP176x_HC_OTG_CTRL_SET		0x374
+ #define ISP176x_HC_OTG_CTRL_CLEAR	0x376
+ 
+@@ -179,6 +180,21 @@ enum isp176x_host_controller_fields {
+ #define ISP176x_DC_IESUSP		BIT(3)
+ #define ISP176x_DC_IEBRST		BIT(0)
+ 
++#define ISP176x_HW_OTG_DISABLE_CLEAR	BIT(26)
++#define ISP176x_HW_SW_SEL_HC_DC_CLEAR	BIT(23)
++#define ISP176x_HW_VBUS_DRV_CLEAR	BIT(20)
++#define ISP176x_HW_SEL_CP_EXT_CLEAR	BIT(19)
++#define ISP176x_HW_DM_PULLDOWN_CLEAR	BIT(18)
++#define ISP176x_HW_DP_PULLDOWN_CLEAR	BIT(17)
++#define ISP176x_HW_DP_PULLUP_CLEAR	BIT(16)
++#define ISP176x_HW_OTG_DISABLE		BIT(10)
++#define ISP176x_HW_SW_SEL_HC_DC		BIT(7)
++#define ISP176x_HW_VBUS_DRV		BIT(4)
++#define ISP176x_HW_SEL_CP_EXT		BIT(3)
++#define ISP176x_HW_DM_PULLDOWN		BIT(2)
++#define ISP176x_HW_DP_PULLDOWN		BIT(1)
++#define ISP176x_HW_DP_PULLUP		BIT(0)
++
+ #define ISP176x_DC_ENDPTYP_ISOC		0x01
+ #define ISP176x_DC_ENDPTYP_BULK		0x02
+ #define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/corstone1000_kernel_debug.cfg b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/corstone1000_kernel_debug.cfg
new file mode 100644
index 0000000..aad9e93
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/corstone1000_kernel_debug.cfg
@@ -0,0 +1,3 @@
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_INFO_DWARF4=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
new file mode 100644
index 0000000..cc7dc3e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -0,0 +1,88 @@
+CONFIG_LOCALVERSION="-yocto-standard"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_LOG_BUF_SHIFT=13
+CONFIG_LOG_CPU_MAX_BUF_SHIFT=13
+CONFIG_RELAY=y
+CONFIG_BOOT_CONFIG=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_CMDLINE="console=ttyAMA0 loglevel=9"
+# CONFIG_SUSPEND is not set
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_SYN_COOKIES=y
+CONFIG_NET_SCHED=y
+CONFIG_DEVTMPFS=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_AURORA is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_PENSANDO is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
+CONFIG_SMC91X=y
+CONFIG_SMSC911X=y
+# CONFIG_NET_VENDOR_SOCIONEXT is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_USB=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_ISP1760=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_CONFIGFS_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_860=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_15=y
+CONFIG_NLS_UTF8=y
+CONFIG_LIBCRC32C=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_DEBUG_FS=y
+CONFIG_PANIC_TIMEOUT=5
+CONFIG_STACKTRACE=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 57a2f5b..a32c393 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -81,6 +81,74 @@ KERNEL_FEATURES:append:corstone700-mps3 = " \
                          '', \
                           d)}"
 
+#
+# Corstone1000 KMACHINE
+#
+FILESEXTRAPATHS:prepend:corstone1000 := "${ARMBSPFILESPATHS}"
+COMPATIBLE_MACHINE:corstone1000 = "${MACHINE}"
+KCONFIG_MODE:corstone1000 = "--alldefconfig"
+KMACHINE:corstone1000 = "corstone1000"
+LINUX_KERNEL_TYPE:corstone1000 = "standard"
+#disabling the rootfs cpio file compression so it is not compressed twice when bundled with the kernel
+KERNEL_EXTRA_ARGS:corstone1000 += "CONFIG_INITRAMFS_COMPRESSION_NONE=y"
+SRC_URI:append:corstone1000 = " \
+           file://0001-usb-isp1760-fix-strict-typechecking.patch \
+           file://0002-usb-isp1760-move-to-regmap-for-register-access.patch \
+           file://0003-usb-isp1760-use-relaxed-primitives.patch \
+           file://0004-usb-isp1760-remove-platform-data-struct-and-code.patch \
+           file://0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch \
+           file://0006-usb-isp1760-use-dr_mode-binding.patch \
+           file://0007-usb-isp1760-add-support-for-isp1763.patch \
+           file://0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch \
+           file://0009-usb-isp1763-add-peripheral-mode.patch \
+           file://0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch \
+           file://0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch \
+           file://0024-usb-isp1760-remove-debug-message-as-error.patch \
+           file://0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch \
+           file://0026-usb-isp1760-rework-cache-initialization-error-handli.patch \
+           file://0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch \
+           file://0028-usb-isp1760-check-maxpacketsize-before-using-it.patch \
+           file://0029-usb-isp1760-do-not-reset-retval.patch \
+           file://0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch \
+           file://0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch \
+           file://0032-usb-isp1760-fix-memory-pool-initialization.patch \
+           file://0033-usb-isp1760-fix-qtd-fill-length.patch \
+           file://0034-usb-isp1760-write-to-status-and-address-register.patch \
+           file://0035-usb-isp1760-use-the-right-irq-status-bit.patch \
+           file://0036-usb-isp1760-otg-control-register-access.patch \
+           file://defconfig  \
+        "
+
+SRC_URI:append:corstone1000 = " ${@bb.utils.contains('MACHINE_FEATURES', \
+                                                            'corstone1000_kernel_debug', \
+                                                            'file://corstone1000_kernel_debug.cfg', \
+                                                            '', \
+                                                             d)}"
+
+# Default kernel features not needed for corstone1000
+# otherwise the extra kernel modules will increase the rootfs size
+# corstone1000 has limited flash memory constraints
+KERNEL_EXTRA_FEATURES:corstone1000 = ""
+KERNEL_FEATURES:corstone1000 = ""
+# No need to include the kernel image in the rootfs
+# So, let's delete the package doing that and uninstalling the initial
+# kernel binary.
+# The kernel binary needed is the initramfs bundle
+
+FILES:kernel-image-image:corstone1000=""
+
+# Uninstalling the initial kernel binary
+
+do_install:append:corstone1000() {
+    if [ -e "${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}" ]; then
+        rm ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
+    fi
+
+    if [ -e "${D}/${KERNEL_IMAGEDEST}/$imageType" ]; then
+        rm ${D}/${KERNEL_IMAGEDEST}/$imageType
+    fi
+}
+
 #
 # FVP BASE KMACHINE
 #
-- 
2.17.1


