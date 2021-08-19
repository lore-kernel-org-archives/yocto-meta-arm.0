Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.75587.1629406798190823900
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Aug 2021 13:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738C51396
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 560FA3F70D
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm-bsp/linux-yocto: migrate corstone700 to the common file
Date: Thu, 19 Aug 2021 16:59:48 -0400
Message-Id: <20210819205951.24259-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819205951.24259-1-jon.mason@arm.com>
References: <20210819205951.24259-1-jon.mason@arm.com>

The Linux kernel entries for corstone700 are not much more than any
other BSP.  Migrate them to the common file for easier development and
debugging.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-arm-platforms.inc             | 53 +++++++++++++++++
 .../linux/linux-yocto-corstone700.inc         | 58 -------------------
 .../linux/linux-yocto_5.6%.bbappend           |  8 ---
 3 files changed, 53 insertions(+), 66 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index cdffcfb..092d92c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -13,6 +13,7 @@ ARMBSPFILESPATHS := "${THISDIR}:${THISDIR}/files:"
 
 # Arm platforms kmeta
 SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
+SRC_URI:append:corstone700 = " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-base = " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-base-arm32 = " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
@@ -28,6 +29,58 @@ KMACHINE:corstone500 = "corstone500"
 KBUILD_DEFCONFIG:corstone500  = "multi_v7_defconfig"
 KCONFIG_MODE:corstone500 = "--alldefconfig"
 
+#
+# Corstone-700 Machines
+#
+COMPATIBLE_MACHINE:corstone700 = "${MACHINE}"
+KMACHINE:corstone700 = "corstone700"
+KERNEL_IMAGETYPE:corstone700  = "xipImage"
+KCONFIG_MODE:corstone700  = "--alldefconfig"
+FILESEXTRAPATHS:prepend:corstone700 := "${ARMBSPFILESPATHS}"
+SRC_URI:append:corstone700 = " \
+           file://0001-arm-support-for-a-single-ARMv7-A-based-platform.patch       \
+           file://0002-arm-Add-tiny-vexpress-machine.patch                         \
+           file://0003-arm-introduce-corstone700_defconfig.patch                   \
+           file://0004-add-driver-of-mailbox-handling-unit-controller-versi.patch  \
+           file://0005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch    \
+           file://0006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch           \
+           file://0007-allow-creation-of-multiple-arm-rpmsg-channels.patch         \
+           file://0008-mailbox-enable-combined-receiver-interrupt-when-usin.patch  \
+           file://0009-misc-arm-add-corstone700-external-system-harness-dri.patch  \
+           file://0010-arm-containerize-endpoint-and-mailbox-information.patch     \
+           file://0011-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch  \
+           file://0012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch  \
+           file://0013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch     \
+           file://0014-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch   \
+           file://0015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch  \
+           file://0016-corstone700_defconfig-use-DDR-address-instead-of-sha.patch  \
+           file://0017-corstone700_defconfig-enable-configs-for-cramfs-xip.patch   \
+           file://0018-usb-isp1760-move-to-regmap-for-register-access.patch        \
+           file://0019-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch     \
+           file://0020-usb-isp1760-add-support-for-isp1763.patch                   \
+           "
+
+KERNEL_FEATURES:append:corstone700 = " bsp/arm-platforms/corstone700-bsp.scc"
+KERNEL_FEATURES:append:corstone700-fvp = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'eth_lan91c111', \
+                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
+                          bsp/arm-platforms/corstone700/eth_lan91c111.scc', \
+                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
+                          d)}"
+KERNEL_FEATURES:append:corstone700-mps3 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'eth_lan9115', \
+                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
+                          bsp/arm-platforms/corstone700/eth_lan9115.scc', \
+                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
+                          d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'usb_host', \
+                         'bsp/arm-platforms/corstone700/usb_host.cfg', \
+                         '', \
+                          d)}"
+
 #
 # FVP BASE KMACHINE
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
deleted file mode 100644
index e21f059..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}:${THISDIR}/files:"
-
-COMPATIBLE_MACHINE = "${MACHINE}"
-
-KMACHINE = "corstone700"
-
-SRC_URI += " \
-           file://0001-arm-support-for-a-single-ARMv7-A-based-platform.patch       \
-           file://0002-arm-Add-tiny-vexpress-machine.patch                         \
-           file://0003-arm-introduce-corstone700_defconfig.patch                   \
-           file://0004-add-driver-of-mailbox-handling-unit-controller-versi.patch  \
-           file://0005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch    \
-           file://0006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch           \
-           file://0007-allow-creation-of-multiple-arm-rpmsg-channels.patch         \
-           file://0008-mailbox-enable-combined-receiver-interrupt-when-usin.patch  \
-           file://0009-misc-arm-add-corstone700-external-system-harness-dri.patch  \
-           file://0010-arm-containerize-endpoint-and-mailbox-information.patch     \
-           file://0011-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch  \
-           file://0012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch  \
-           file://0013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch     \
-           file://0014-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch   \
-           file://0015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch  \
-           file://0016-corstone700_defconfig-use-DDR-address-instead-of-sha.patch  \
-           file://0017-corstone700_defconfig-enable-configs-for-cramfs-xip.patch   \
-           file://0018-usb-isp1760-move-to-regmap-for-register-access.patch        \
-           file://0019-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch     \
-           file://0020-usb-isp1760-add-support-for-isp1763.patch                   \
-           "
-
-KERNEL_IMAGETYPE = "xipImage"
-
-KCONFIG_MODE = "--alldefconfig"
-
-SRC_URI:append = " ${SRC_URI_KMETA}"
-
-KERNEL_EXTRA_FEATURES = "bsp/arm-platforms/corstone700-bsp.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-
-KERNEL_FEATURES:append:corstone700-fvp = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', \
-                         'eth_lan91c111', \
-                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
-                          bsp/arm-platforms/corstone700/eth_lan91c111.scc', \
-                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
-                          d)}"
-
-KERNEL_FEATURES:append:corstone700-mps3 = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', \
-                         'eth_lan9115', \
-                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
-                          bsp/arm-platforms/corstone700/eth_lan9115.scc', \
-                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
-                          d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES', \
-                         'usb_host', \
-                         'bsp/arm-platforms/corstone700/usb_host.cfg', \
-                        '', \
-                          d)}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
index 02fbf05..cf3af8a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
@@ -2,11 +2,3 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.6:"
 
 SRC_URI:append = " file://0001-libtraceevent-Fix-build-with-binutils-2.35.patch \
                    file://0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch"
-
-#
-# Corstone700 KMACHINE
-#
-MACHINE_KERNEL_REQUIRE ?= ""
-MACHINE_KERNEL_REQUIRE:corstone700 = "linux-yocto-corstone700.inc"
-
-require ${MACHINE_KERNEL_REQUIRE}
-- 
2.17.1

