Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AAAC433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 16:52:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14288.1637859128205845781
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 08:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515841042;
	Thu, 25 Nov 2021 08:52:01 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.79.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B66973F73B;
	Thu, 25 Nov 2021 08:51:59 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	vishnu.banavath@arm.com
Cc: nd@arm.com,
	"Arpita S.K" <Arpita.S.K@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/5] arm-bsp/u-boot: introducing corstone1000 MPS3 machine
Date: Thu, 25 Nov 2021 16:51:44 +0000
Message-Id: <20211125165147.25286-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125165147.25286-1-abdellatif.elkhlifi@arm.com>
References: <20211125165147.25286-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 16:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2455

From: "Arpita S.K" <Arpita.S.K@arm.com>

Add support for corstone1000-mps3 machine which have a cortex-a35
aarch64, this will boot till u-boot prompt.

Change-Id: Ifdd81d35a5409cdd1563388a841885c14b748cad
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...initial-devicetree-corstone1000-mps3.patch | 64 +++++++++++++++++++
 ...one1000-adding-PSCI-device-tree-node.patch | 34 ++++++++++
 ...-amend-kernel-bootargs-with-ip-dhcp-.patch | 32 ++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  5 +-
 4 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm-dts-add-initial-devicetree-corstone1000-mps3.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-arm-corstone1000-adding-PSCI-device-tree-node.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corstone1000-amend-kernel-bootargs-with-ip-dhcp-.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm-dts-add-initial-devicetree-corstone1000-mps3.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm-dts-add-initial-devicetree-corstone1000-mps3.patch
new file mode 100644
index 0000000..cb48478
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm-dts-add-initial-devicetree-corstone1000-mps3.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From a3b3ff8fc2d4e52748989aa61f155fc92a63261a Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 22 Jun 2021 11:35:10 +0100
+Subject: [PATCH 15/16] arm: dts: add initial devicetree corstone1000 mps3
+
+Corstone1000 is a platform enabled on MPS3 FPGA Arm board. It is a cortex-a35
+with with 8MB of CVM and 32MB of QSPI, with the peripherals USB,
+ethernet and others available on the MPS3 board.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/dts/corstone1000-mps3.dts | 37 ++++++++++++++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+ create mode 100644 arch/arm/dts/corstone1000-mps3.dts
+
+diff --git a/arch/arm/dts/corstone1000-mps3.dts b/arch/arm/dts/corstone1000-mps3.dts
+new file mode 100644
+index 0000000000..d93915dbb7
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-mps3.dts
+@@ -0,0 +1,37 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/dts-v1/;
++
++#include "corstone1000.dtsi"
++
++/ {
++	model = "corstone1000-mps3";
++
++	ethernet: eth@4010000 {
++		compatible = "smsc,lan9220", "smsc,lan9115";
++		reg = <0x40100000 0x10000>;
++		phy-mode = "mii";
++		interrupt-parent = <&gic>;
++		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
++		reg-io-width = <2>;
++		smsc,irq-push-pull;
++	};
++
++	usb: usb@40200000 {
++		compatible = "nxp,usb-isp1763";
++		reg = <0x40200000 0x100000>;
++		interrupts-parent = <&gic>;
++		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
++		bus-width = <16>;
++		dr_mode = "host";
++	};
++
++};
++
++&refclk {
++	clock-frequency = <50000000>;
++};
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-arm-corstone1000-adding-PSCI-device-tree-node.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-arm-corstone1000-adding-PSCI-device-tree-node.patch
new file mode 100644
index 0000000..4faa883
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-arm-corstone1000-adding-PSCI-device-tree-node.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From b5ec956659c3e419fd2e95431d9359db497e4afb Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 22 Jul 2021 18:11:33 +0100
+Subject: [PATCH 16/16] arm: corstone1000: adding PSCI device tree node
+
+At this level of development PSCI is needed to initialize the SMCCC.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ arch/arm/dts/corstone1000-mps3.dts | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000-mps3.dts b/arch/arm/dts/corstone1000-mps3.dts
+index d93915dbb7..a3726f1e1f 100644
+--- a/arch/arm/dts/corstone1000-mps3.dts
++++ b/arch/arm/dts/corstone1000-mps3.dts
+@@ -30,6 +30,11 @@
+ 		dr_mode = "host";
+ 	};
+ 
++	psci {
++		compatible = "arm,psci-1.0", "arm,psci-0.2";
++		method = "smc";
++	};
++
+ };
+ 
+ &refclk {
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corstone1000-amend-kernel-bootargs-with-ip-dhcp-.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corstone1000-amend-kernel-bootargs-with-ip-dhcp-.patch
new file mode 100644
index 0000000..022fee9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corstone1000-amend-kernel-bootargs-with-ip-dhcp-.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 3ee38ef07bd82c843497dc4e69a4d4c5f21dbbf7 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Tue, 26 Oct 2021 18:29:05 +0100
+Subject: [PATCH] arm: corstone1000: amend kernel bootargs with ip=dhcp
+ earlyprintk
+
+This change is to
+* pass ip=dhcp required for ethernet to get and ip
+* enable earlyprintk to print kernel logs before the actual
+kernel driver comes up
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index cfe80cf5f4..7574553e83 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -8,7 +8,7 @@ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+ CONFIG_FIT=y
+ CONFIG_BOOTDELAY=3
+ CONFIG_USE_BOOTARGS=y
+-CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9"
++CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9 ip=dhcp earlyprintk"
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
+ CONFIG_HUSH_PARSER=y
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 864a568..c75eec3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 #
 # Corstone1000 64-bit machines
 #
-
+CORSTONE1000_DEVICE_TREE:corstone1000-mps3 = "corstone1000-mps3"
 CORSTONE1000_DEVICE_TREE:corstone1000-fvp = "corstone1000-fvp"
 EXTRA_OEMAKE:append:corstone1000 = ' DEVICE_TREE=${CORSTONE1000_DEVICE_TREE}'
 
@@ -24,6 +24,9 @@ SRC_URI:append:corstone1000 = " \
       file://0012-arm-corstone1000-enable-uefi-secure-boot.patch \
       file://0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch \
       file://0014-arm-corstone1000-enable-efi-capsule-options.patch \
+      file://0015-arm-dts-add-initial-devicetree-corstone1000-mps3.patch \
+      file://0016-arm-corstone1000-adding-PSCI-device-tree-node.patch \
+      file://0017-arm-corstone1000-amend-kernel-bootargs-with-ip-dhcp-.patch \
       "
 
 #
-- 
2.17.1


