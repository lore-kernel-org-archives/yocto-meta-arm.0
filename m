Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.76108.1629406798192391241
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Aug 2021 13:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4823012FC
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 235573F70D
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm-bsp/linux-yocto: Alphabetize platform inc file
Date: Thu, 19 Aug 2021 16:59:47 -0400
Message-Id: <20210819205951.24259-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

This file was mostly alphabetized from previous attempts.  Restore them
to being alphabetized again.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-arm-platforms.inc             | 72 +++++++++----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4397bb6..cdffcfb 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -15,9 +15,9 @@ ARMBSPFILESPATHS := "${THISDIR}:${THISDIR}/files:"
 SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
 SRC_URI:append:fvp-base = " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-base-arm32 = " ${SRC_URI_KMETA}"
+SRC_URI:append:fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
 SRC_URI:append:juno = " ${SRC_URI_KMETA}"
 SRC_URI:append:n1sdp = " ${SRC_URI_KMETA}"
-SRC_URI:append:fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
 SRCREV:arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
 #
@@ -44,6 +44,13 @@ FILESEXTRAPATHS:prepend:fvp-base-arm32 := "${ARMBSPFILESPATHS}"
 SRC_URI:append:fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
                                   file://0001-ARM-vexpress-enable-GICv3.patch"
 
+#
+# FVP BaseR AEMv8r64 Machine
+#
+COMPATIBLE_MACHINE:fvp-baser-aemv8r64 = "fvp-baser-aemv8r64"
+FILESEXTRAPATHS:prepend:fvp-baser-aemv8r64 := "${ARMBSPFILESPATHS}"
+SRC_URI:append:fvp-baser-aemv8r64 = " file://fvp-baser-aemv8r64.dts;subdir=git/arch/arm64/boot/dts/arm"
+
 #
 # Juno KMACHINE
 #
@@ -67,6 +74,34 @@ SRC_URI:append:juno = " \
     file://0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch \
     "
 
+#
+# Musca B1/S2 can't run Linux
+#
+COMPATIBLE_MACHINE:musca-b1 = "(^$)"
+COMPATIBLE_MACHINE:musca-s1 = "(^$)"
+
+#
+# N1SDP KMACHINE
+#
+FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
+KBUILD_DEFCONFIG:n1sdp = "defconfig"
+KCONFIG_MODE:n1sdp = "--alldefconfig"
+FILESEXTRAPATHS:prepend:n1sdp := "${ARMBSPFILESPATHS}"
+SRC_URI:append:n1sdp = " \
+    file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
+    file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
+    file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
+    file://0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch \
+    file://no-power-avs.patch \
+    file://enable-realtek-R8169.cfg \
+    file://enable-usb_conn_gpio.cfg \
+    "
+# Since we use the intree defconfig and the preempt-rt turns off some configs
+# do_kernel_configcheck will display warnings. So, lets disable it.
+KCONF_AUDIT_LEVEL:n1sdp:pn-linux-yocto-rt = "0"
+
 #
 # SGI575 KMACHINE
 #
@@ -117,38 +152,3 @@ FILESEXTRAPATHS:prepend:tc1 := "${THISDIR}/linux-arm64-ack-5.10/tc:"
 SRC_URI:append:tc1 = " \
     file://0022-arm_ffa-add-support-for-FFA-v1.1.patch \
     "
-
-#
-# N1SDP KMACHINE
-#
-FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
-COMPATIBLE_MACHINE:n1sdp = "n1sdp"
-KBUILD_DEFCONFIG:n1sdp = "defconfig"
-KCONFIG_MODE:n1sdp = "--alldefconfig"
-FILESEXTRAPATHS:prepend:n1sdp := "${ARMBSPFILESPATHS}"
-SRC_URI:append:n1sdp = " \
-    file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
-    file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
-    file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
-    file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
-    file://0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch \
-    file://no-power-avs.patch \
-    file://enable-realtek-R8169.cfg \
-    file://enable-usb_conn_gpio.cfg \
-    "
-# Since we use the intree defconfig and the preempt-rt turns off some configs
-# do_kernel_configcheck will display warnings. So, lets disable it.
-KCONF_AUDIT_LEVEL:n1sdp:pn-linux-yocto-rt = "0"
-
-#
-# Musca B1/S2 can't run Linux
-#
-COMPATIBLE_MACHINE:musca-b1 = "(^$)"
-COMPATIBLE_MACHINE:musca-s1 = "(^$)"
-
-#
-# FVP BaseR AEMv8r64 Machine
-#
-COMPATIBLE_MACHINE:fvp-baser-aemv8r64 = "fvp-baser-aemv8r64"
-FILESEXTRAPATHS:prepend:fvp-baser-aemv8r64 := "${ARMBSPFILESPATHS}"
-SRC_URI:append:fvp-baser-aemv8r64 = " file://fvp-baser-aemv8r64.dts;subdir=git/arch/arm64/boot/dts/arm"
-- 
2.17.1

