Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF7AC4332F
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:16:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12276.1636035374590290283
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 07:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7151FB
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Nov 2021 07:16:13 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 697B83F7D7
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Nov 2021 07:16:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp: fix corstone u-boot
Date: Wed,  3 Nov 2021 14:36:18 -0400
Message-Id: <20211103183620.15870-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Nov 2021 14:16:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2340

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0001-arm-add-corstone1000-platform.patch          |  2 +-
 ...-corstone1000-enable-devicetree-in-defconfig.patch |  2 +-
 .../0003-usb-common-move-urb-code-to-common.patch     |  2 +-
 .../0004-usb-add-isp1760-family-driver.patch          | 11 +++++------
 ...05-corstone1000-enable-isp1763-and-usb-stack.patch |  2 +-
 .../0006-corstone1000-enable-support-for-FVP.patch    |  2 +-
 ...tone1000-sharing-PSCI-DTS-node-between-FVP-a.patch |  2 +-
 .../0008-arm-corstone1000-Emulated-RTC-Support.patch  |  2 +-
 ...0009-arm-corstone1000-execute-uboot-from-DDR.patch |  2 +-
 ...-cmd-load-add-load-command-for-memory-mapped.patch |  2 +-
 ...0011-arm-corstone1000-enable-boot-using-uefi.patch |  2 +-
 ...012-arm-corstone1000-enable-uefi-secure-boot.patch |  2 +-
 ...stone1000-enable-handlers-for-uefi-variables.patch |  2 +-
 ...-arm-corstone1000-enable-efi-capsule-options.patch |  2 +-
 14 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
index 4b2edc0..fa63de8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
@@ -1,4 +1,4 @@
-From 3a2ea6e1214b4f74dc99ae80637ea7bad451f6a4 Mon Sep 17 00:00:00 2001
+From 90608c0ac1636136f51b504805bdc81c7b22a0c4 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Jun 2021 10:58:24 +0100
 Subject: [PATCH] arm: add corstone1000 platform
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
index 384c9b0..b97b827 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
@@ -1,4 +1,4 @@
-From 293595471c5fb2b266d97e372dbf5f9279350272 Mon Sep 17 00:00:00 2001
+From 9c2c00f9aeb727c12096e6065cc2bab994bffa4f Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 22 Jun 2021 17:00:24 +0100
 Subject: [PATCH] arm: corstone1000: enable devicetree in defconfig
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
index 3d759d3..6db81e4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
@@ -1,4 +1,4 @@
-From 022b70e5f1ca6b5f2e6edbc7c150902989d3b586 Mon Sep 17 00:00:00 2001
+From 546a7151f29b5cec9de1b653594e004c7de259dd Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:20:55 +0100
 Subject: [PATCH] usb: common: move urb code to common
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
index f1ab119..1dbef23 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
@@ -1,4 +1,4 @@
-From ed07f24d76951a10b6be5ec964ed6dd9ef2cb0bf Mon Sep 17 00:00:00 2001
+From d2c4f00c05cc3c5ac25f46d69403de21de4e993d Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:31:25 +0100
 Subject: [PATCH] usb: add isp1760 family driver
@@ -15,7 +15,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  Makefile                            |    1 +
  drivers/usb/Kconfig                 |    2 +
  drivers/usb/common/Makefile         |    1 +
- drivers/usb/isp1760/Kconfig         |   13 +
+ drivers/usb/isp1760/Kconfig         |   12 +
  drivers/usb/isp1760/Makefile        |    6 +
  drivers/usb/isp1760/isp1760-core.c  |  378 ++++
  drivers/usb/isp1760/isp1760-core.h  |   96 +
@@ -25,7 +25,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  drivers/usb/isp1760/isp1760-regs.h  |  292 +++
  drivers/usb/isp1760/isp1760-uboot.c |   64 +
  drivers/usb/isp1760/isp1760-uboot.h |   27 +
- 13 files changed, 3663 insertions(+)
+ 13 files changed, 3662 insertions(+)
  create mode 100644 drivers/usb/isp1760/Kconfig
  create mode 100644 drivers/usb/isp1760/Makefile
  create mode 100644 drivers/usb/isp1760/isp1760-core.c
@@ -76,15 +76,14 @@ index dc05cb0a5077..f08b064d2493 100644
  obj-$(CONFIG_USB_EHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
 diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
 new file mode 100644
-index 000000000000..e76fb5e4ccf5
+index 000000000000..9657dcfd8045
 --- /dev/null
 +++ b/drivers/usb/isp1760/Kconfig
-@@ -0,0 +1,13 @@
+@@ -0,0 +1,12 @@
 +# SPDX-License-Identifier: GPL-2.0
 +
 +config USB_ISP1760
 +	tristate "NXP ISP 1760/1761/1763 support"
-+	depends on DM_USB
 +	select USB_HOST
 +	help
 +	  Say Y or M here if your system as an ISP1760/1761/1763 USB host
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
index 9c75440..8341dc5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
@@ -1,4 +1,4 @@
-From c23a5b3c07e20586ab2d3fc0ea7bda3be633e936 Mon Sep 17 00:00:00 2001
+From 41d82f4dc4473803d1447a0eac524112bed032d1 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 27 Jul 2021 23:34:57 +0100
 Subject: [PATCH] corstone1000: enable isp1763 and usb stack
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
index 850ce18..a0a9e42 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
@@ -1,4 +1,4 @@
-From e2031439f590b260c5aa30f3a79e7118b20f0d88 Mon Sep 17 00:00:00 2001
+From 7db0cdef0831189e0cb33175a4c49be91e98d8e0 Mon Sep 17 00:00:00 2001
 From: "Arpita S.K" <Arpita.S.K@arm.com>
 Date: Mon, 11 Oct 2021 11:41:25 +0530
 Subject: [PATCH] corstone1000: enable support for FVP
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
index 267cbec..7ad5edc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
@@ -1,4 +1,4 @@
-From 845570f406ccc1919449d79a07bc166e54fedf58 Mon Sep 17 00:00:00 2001
+From a18f97b17c84006d7b73b40490f0cd135cce2361 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 25 Aug 2021 16:50:40 +0100
 Subject: [PATCH] arm: corstone1000: sharing PSCI DTS node between FVP
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
index 24f78cd..ec20a20 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
@@ -1,4 +1,4 @@
-From d365d3ecea5aed0620b953eb74024a5e5f5636c2 Mon Sep 17 00:00:00 2001
+From 36ed6e56242b342af38072b0ac3d26d4800a4db1 Mon Sep 17 00:00:00 2001
 From: "Arpita S.K" <Arpita.S.K@arm.com>
 Date: Mon, 11 Oct 2021 11:45:41 +0530
 Subject: [PATCH] arm: corstone1000: Emulated RTC Support
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
index 5002178..1ef62b1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
@@ -1,4 +1,4 @@
-From 380efa943bc1b2b6b7d79b3dffb37a751c5fb4c1 Mon Sep 17 00:00:00 2001
+From cf14e676dc61b91609ddc940663cdc876ec126fe Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Wed, 1 Sep 2021 18:33:32 +0100
 Subject: [PATCH] arm: corstone1000: execute uboot from DDR
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
index 9da2b2f..69217e9 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
@@ -1,4 +1,4 @@
-From 53641a3776dc6c96716c81d9ca522ddf4756a07f Mon Sep 17 00:00:00 2001
+From 4a22ea96d4352a87e39e8a9a74ccf8bb052f6293 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 24 Jun 2021 09:25:00 +0100
 Subject: [PATCH] cmd: load: add load command for memory mapped
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
index 06f1887..c47fe4f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
@@ -1,4 +1,4 @@
-From 98619983895e1bc2e33c3cf933b9699b8276d63a Mon Sep 17 00:00:00 2001
+From be832406f95d4d057871a30097d2b1223b356414 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 23 Jun 2021 00:45:38 +0100
 Subject: [PATCH] arm: corstone1000: enable boot using uefi
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
index 1860a4a..ec515ed 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
@@ -1,4 +1,4 @@
-From 4aaf08f3dc34300c537f703f5bd9aeea3a28260f Mon Sep 17 00:00:00 2001
+From ae0e151a224ad01870be570d6e8587e3e1c6dde9 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 14 Sep 2021 10:46:49 +0100
 Subject: [PATCH] arm: corstone1000: enable uefi secure boot
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
index 3af7e26..e01b5d0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
@@ -1,4 +1,4 @@
-From 47d4157afbc401577b606e9faeb70ec888b7cee5 Mon Sep 17 00:00:00 2001
+From b1fba083c3bd3b7ee7a3ba7fcef8e9c2ac2e49af Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 14 Sep 2021 22:00:47 +0100
 Subject: [PATCH] arm: corstone1000: enable handlers for uefi variables
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
index ab9c382..70423ca 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
@@ -1,4 +1,4 @@
-From 708229c83e1453ba796fbfa598ba70a1335fe1e1 Mon Sep 17 00:00:00 2001
+From 1ebe573020c9730f4a3f009328fc3d1f7f350b55 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 14 Sep 2021 22:07:15 +0100
 Subject: [PATCH] arm: dipha: enable efi capsule options
-- 
2.17.1


