Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7918.1631713970038022991
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 06:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81D916D
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Sep 2021 06:52:48 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 642923F719
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Sep 2021 06:52:48 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: drop linux-yocto defconfig patch
Date: Tue, 14 Sep 2021 16:59:27 -0400
Message-Id: <20210914205927.24346-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

defconfig patch was upstreamed and is no longer necessary here.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-yocto/defconfig.patch         | 132 ------------------
 .../linux/linux-yocto_%.bbappend              |   6 -
 2 files changed, 138 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
deleted file mode 100644
index 921d655..0000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 976241eed25267bae5a535c01971c7c81ddcf38b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 13 Jan 2021 15:32:22 +0000
-Subject: [PATCH 2/5] arm64: defconfig: drop unused POWER_AVS option
-
-Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
-corresponding Kconfig") moved AVS code to SOC-specific folders, and
-removed corresponding Kconfig from drivers/power, leaving original
-POWER_AVS config option enabled in some defconfigs.
-
-Remove the options, which have no references in the tree anymore.
-
-Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the corresponding Kconfig")
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 9907a431db0d..f50751b6eaec 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -538,7 +538,6 @@ CONFIG_GPIO_PCA953X_IRQ=y
- CONFIG_GPIO_BD9571MWV=m
- CONFIG_GPIO_MAX77620=y
- CONFIG_GPIO_SL28CPLD=m
--CONFIG_POWER_AVS=y
- CONFIG_QCOM_CPR=y
- CONFIG_ROCKCHIP_IODOMAIN=y
- CONFIG_POWER_RESET_MSM=y
--- 
-2.25.1
-
-
-From 07fbdbcb768d70ccd8e7fe66aee9f4705a60400b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 28 Jul 2021 16:05:56 +0100
-Subject: [PATCH 3/5] arm64: defconfig: set CONFIG_USB_CONN_GPIO=y
-
-Since 10a7b37b5b ("arm64: Update default configuration") PHY_TEGRA_XUSB
-is set to y. That option needs USB_CONN_GPIO to also be y not m, so
-set USB_CONN_GPIO explicitly to y to reflect reality.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index f50751b6eaec..15595d6db256 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -789,7 +789,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=m
- CONFIG_HID_MULTITOUCH=m
- CONFIG_I2C_HID_ACPI=m
- CONFIG_I2C_HID_OF=m
--CONFIG_USB_CONN_GPIO=m
-+CONFIG_USB_CONN_GPIO=y
- CONFIG_USB=y
- CONFIG_USB_OTG=y
- CONFIG_USB_XHCI_HCD=y
--- 
-2.25.1
-
-
-From 26e4f7955080cc0f5670471823d73b972d3fe080 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 8 Sep 2021 11:51:03 +0100
-Subject: [PATCH 4/5] arm64: defconfig: remove obsolete CONFIG_ARCH_AGILEX and
- CONFIG_ARCH_N5X
-
-These config options were removed in 4a9a1a5602 ("arm64: socfpga: merge
-Agilex and N5X into ARCH_INTEL_SOCFPGA"), so remove them from the
-defconfig.
-
-Fixes: 4a9a1a5602 ("arm64: socfpga: merge Agilex and N5X into ARCH_INTEL_SOCFPGA")
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 15595d6db256..257167463b60 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -28,8 +28,6 @@ CONFIG_KALLSYMS_ALL=y
- # CONFIG_COMPAT_BRK is not set
- CONFIG_PROFILING=y
- CONFIG_ARCH_ACTIONS=y
--CONFIG_ARCH_AGILEX=y
--CONFIG_ARCH_N5X=y
- CONFIG_ARCH_SUNXI=y
- CONFIG_ARCH_ALPINE=y
- CONFIG_ARCH_APPLE=y
--- 
-2.25.1
-
-
-From 0931745bfa4e9a8db2885dd20d07426dbaf2fa73 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 8 Sep 2021 12:19:33 +0100
-Subject: [PATCH 5/5] arm64: defconfig: don't set CONFIG_ACPI_APEI_PCIEAER
-
-Since 8c8ff55 ("PCI/AER: Don't select CONFIG_PCIEAER by default"), PCIe
-Advanced Error Reporting isn't enabled by default.. As this means just
-enabling CONFIG_CPI_APEI_PCIEAR does not have an effect, remove it from
-the defconfig for clarity.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 257167463b60..f620f31b0323 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -110,7 +110,6 @@ CONFIG_IMX_SCU_PD=y
- CONFIG_ACPI=y
- CONFIG_ACPI_APEI=y
- CONFIG_ACPI_APEI_GHES=y
--CONFIG_ACPI_APEI_PCIEAER=y
- CONFIG_ACPI_APEI_MEMORY_FAILURE=y
- CONFIG_ACPI_APEI_EINJ=y
- CONFIG_VIRTUALIZATION=y
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index d215d8b..f12dc7c 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -3,15 +3,9 @@ ARMFILESPATHS := "${THISDIR}/${PN}:"
 COMPATIBLE_MACHINE:generic-arm64 = "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 = "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 = " \
-    file://defconfig.patch \
     file://tcpci.cfg \
     "
 
-FILESEXTRAPATHS:prepend:qemuarm64-sbsa = "${ARMFILESPATHS}"
-SRC_URI:append:qemuarm64-sbsa = " \
-    file://defconfig.patch \
-    "
-
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot = " \
     file://zone_dma_revert.patch \
-- 
2.17.1

