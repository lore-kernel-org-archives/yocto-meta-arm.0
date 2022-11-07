Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDE6C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:33:51 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web11.43.1667835223662967998
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 07:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 2A7FXeVG013324;
	Mon, 7 Nov 2022 15:33:40 GMT
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH] arm-bsp/fvp-base: Enable virtio-rng support and unset preferred 5.15 kernel
Date: Mon,  7 Nov 2022 15:33:33 +0000
Message-Id: <20221107153333.256114-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 15:33:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4106

Without virtio-rng enabled kernel 5.19 takes ages to finish
random number generator initialisation which causes
issues with ssh and other crypto related services.

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |  4 +--
 .../conf/machine/fvp-baser-aemv8r64.conf      |  2 --
 ...64-dts-fvp-Enable-virtio-rng-support.patch | 29 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  1 +
 4 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0001-arm64-dts-fvp-Enable-virtio-rng-support.patch

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 320e22ce..1ba07082 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -10,10 +10,10 @@ require conf/machine/include/arm/arch-armv8a.inc
 TUNE_FEATURES = "aarch64"
 
 PREFERRED_VERSION_u-boot ?= "2022.04"
-PREFERRED_VERSION_linux-yocto ?= "5.15%"
-PREFERRED_VERSION_linux-yocto-rt ?= "5.15%"
 
 # FVP u-boot configuration
 UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
 
 KERNEL_IMAGETYPE = "Image"
+
+FVP_CONFIG[bp.virtio_rng.enabled] ?= "1"
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 8119cb68..06bef291 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -9,8 +9,6 @@ require conf/machine/include/arm/armv8r/arch-armv8r64.inc
 EXTRA_IMAGEDEPENDS += "boot-wrapper-aarch64"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.15%"
-PREFERRED_VERSION_linux-yocto-rt ?= "5.15%"
 PREFERRED_VERSION_u-boot ?= "2022.07"
 
 KERNEL_IMAGETYPE = "Image"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0001-arm64-dts-fvp-Enable-virtio-rng-support.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0001-arm64-dts-fvp-Enable-virtio-rng-support.patch
new file mode 100644
index 00000000..1cbdc9af
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0001-arm64-dts-fvp-Enable-virtio-rng-support.patch
@@ -0,0 +1,29 @@
+From b443c8efd563dc372c60e7ad9f52aeddf7c13706 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Mon, 7 Nov 2022 11:37:51 +0000
+Subject: [PATCH] arm64: dts: fvp: Enable virtio-rng support
+
+The virtio-rng is available from FVP_Base_RevC-2xAEMvA version 11.17.
+Enable it since Yocto includes a recipe for a newer FVP version.
+
+Upstream-Status: Inappropriate [Yocto specific]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi
+index ec2d5280a30b..acafdcbf1063 100644
+--- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi
++++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi
+@@ -26,7 +26,6 @@ virtio@200000 {
+ 					compatible = "virtio,mmio";
+ 					reg = <0x200000 0x200>;
+ 					interrupts = <46>;
+-					status = "disabled";
+ 				};
+ 			};
+ 		};
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 99a40e77..3dcb6116 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -70,6 +70,7 @@ KERNEL_FEATURES:corstone1000 = ""
 COMPATIBLE_MACHINE:fvp-base = "fvp-base"
 KMACHINE:fvp-base = "fvp"
 FILESEXTRAPATHS:prepend:fvp-base := "${ARMBSPFILESPATHS}"
+SRC_URI:append:fvp-base = " file://0001-arm64-dts-fvp-Enable-virtio-rng-support.patch"
 
 #
 # FVP BASE ARM32 KMACHINE
-- 
2.25.1


