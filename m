Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C412C6FA86
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 15:00:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40.1663858807074639881
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 08:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33CCE22BE;
	Thu, 22 Sep 2022 08:00:13 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D38973F73D;
	Thu, 22 Sep 2022 08:00:05 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: Add external system MHUs to u-boot device
 tree
Date: Thu, 22 Sep 2022 15:59:55 +0100
Message-Id: <20220922145956.56063-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220922145956.56063-1-emekcan.aras@arm.com>
References: <20220922145956.56063-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 15:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3812

From: Emekcan <emekcan.aras@arm.com>

The host uses MHUs to send/receive data from the external system
in corstone1000. This commit adds MHU mailbox bindings into the
u-boot device tree to enable data communication between the host
and external system.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...d-rpmsg-client-to-u-boot-device-tree.patch | 81 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
new file mode 100644
index 00000000..cd01732d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
@@ -0,0 +1,81 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+From a1b8b91a43cfa9dbaa2d907a6d9629da6f93fa3e Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Mon, 12 Sep 2022 15:47:06 +0100
+Subject: [PATCH] Add mhu and rpmsg client to u-boot device tree
+
+Adds external system controller and mhu driver to u-boot
+device tree. This enables communication between host and
+the external system.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+---
+ arch/arm/dts/corstone1000.dtsi | 50 ++++++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
+index 19b6e3ea72..61dd6c432c 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -161,6 +161,56 @@
+ 			status = "disabled";
+ 		};
+ 
++		mbox_es0mhu0_tx: mhu@1b000000 {
++			compatible = "arm,mhuv2-tx","arm,primecell";
++			reg = <0x1b000000 0x1000>;
++			clocks = <&refclk100mhz>;
++			clock-names = "apb_pclk";
++			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
++			#mbox-cells = <2>;
++			arm,mhuv2-protocols = <1 1>;
++			mbox-name = "arm-es0-mhu0_tx";
++		};
++
++		mbox_es0mhu0_rx: mhu@1b010000 {
++			compatible = "arm,mhuv2-rx","arm,primecell";
++			reg = <0x1b010000 0x1000>;
++			clocks = <&refclk100mhz>;
++			clock-names = "apb_pclk";
++			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
++			#mbox-cells = <2>;
++			arm,mhuv2-protocols = <1 1>;
++			mbox-name = "arm-es0-mhu0_rx";
++		};
++
++		mbox_es0mhu1_tx: mhu@1b020000 {
++			compatible = "arm,mhuv2-tx","arm,primecell";
++			reg = <0x1b020000 0x1000>;
++			clocks = <&refclk100mhz>;
++			clock-names = "apb_pclk";
++			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
++			#mbox-cells = <2>;
++			arm,mhuv2-protocols = <1 1>;
++			mbox-name = "arm-es0-mhu1_tx";
++		};
++
++		mbox_es0mhu1_rx: mhu@1b030000 {
++			compatible = "arm,mhuv2-rx","arm,primecell";
++			reg = <0x1b030000 0x1000>;
++			clocks = <&refclk100mhz>;
++			clock-names = "apb_pclk";
++			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
++			#mbox-cells = <2>;
++			arm,mhuv2-protocols = <1 1>;
++			mbox-name = "arm-es0-mhu1_rx";
++		};
++
++		client {
++			compatible = "arm,client";
++			mboxes = <&mbox_es0mhu0_tx 0 0>, <&mbox_es0mhu1_tx 0 0>, <&mbox_es0mhu0_rx 0 0>, <&mbox_es0mhu1_rx 0 0>;
++			mbox-names = "es0mhu0_tx", "es0mhu1_tx", "es0mhu0_rx", "es0mhu1_rx";
++		};
++
+ 		extsys0: extsys@1A010310 {
+ 			compatible = "arm,extsys_ctrl";
+ 			reg = <0x1A010310 0x4>,
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 3c316f30..08d4a8e1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -44,6 +44,7 @@ SRC_URI:append:corstone1000 = " \
         file://0024-arm-corstone1000-add-mmc-for-fvp.patch \
         file://0025-corstone1000-use-a-compressed-kernel.patch \
         file://0026-Introduce-external-sys-driver-to-device-tree.patch \
+        file://0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch \
       "
 
 #
-- 
2.17.1


