Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9871EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:57:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.59114.1694440642912916587
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 06:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0FA91007;
	Mon, 11 Sep 2023 06:57:59 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADBBC3F738;
	Mon, 11 Sep 2023 06:57:21 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: update to linux yocto kernel 6.4
Date: Mon, 11 Sep 2023 14:57:13 +0100
Message-Id: <20230911135713.34756-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230911135713.34756-1-xueliang.zhong@arm.com>
References: <20230911135713.34756-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 13:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5033

From: Xueliang Zhong <xueliang.zhong@arm.com>

Bump kernel version to v6.4 and rebased N1SDP kernel PCIe quirk patches
top of this new version.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  2 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch |  8 +++----
 ...irk-add-acs-override-for-PCI-devices.patch | 12 +++++------
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 20 +++++++++---------
 ...uirk-support-enabling-remote-chip-PC.patch |  2 +-
 ...list-early-Arm-Neoverse-N1-revisions.patch |  6 +++---
 ...disable-config-options-that-does-not.patch | 21 ++++++++++++++-----
 .../n1sdp/enable-nvme.cfg                     |  0
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 12 files changed, 42 insertions(+), 31 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch (96%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch (65%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index c25a32dc..7de6761e 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -19,7 +19,7 @@ WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "6.1%"
+PREFERRED_VERSION_linux-yocto ?= "6.4%"
 
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index b49ac800..666ed41d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -80,7 +80,7 @@ COMPATIBLE_MACHINE:musca-s1 = "(^$)"
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-6.1/n1sdp:"
+FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-6.4/n1sdp:"
 COMPATIBLE_MACHINE:n1sdp = "n1sdp"
 KBUILD_DEFCONFIG:n1sdp = "defconfig"
 KCONFIG_MODE:n1sdp = "--alldefconfig"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
similarity index 88%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
index d7a47c65..869ca6f7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
@@ -1,4 +1,4 @@
-From 32ae4539865e64bcfb0c6955bdac8db5904e493d Mon Sep 17 00:00:00 2001
+From ec84afa8e74bc5df8b5794eef8f29b097adc7cb3 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Mon, 1 Feb 2021 21:36:43 +0530
 Subject: [PATCH] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in N1SDP
@@ -22,10 +22,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-index d4d8bfee9feb..0524bf2ec021 100644
+index 3fd83fb75722..852ed05b14a3 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-@@ -1738,6 +1738,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
+@@ -1747,6 +1747,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
  	};
  
  	if (!size) {
@@ -34,7 +34,7 @@ index d4d8bfee9feb..0524bf2ec021 100644
  		return;
  	}
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
-index cd48590ada30..20892b2bfe1d 100644
+index b574c58a3487..018086b65381 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
 @@ -472,6 +472,7 @@ struct arm_smmu_cmdq_ent {
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
similarity index 93%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
index cb72ed0a..9bf8112b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -1,4 +1,4 @@
-From fc8605e74b51d9e0ab8efd0489eca2e11d807f07 Mon Sep 17 00:00:00 2001
+From 9761e48b2d6904a58996fcaadcf25684482a72c8 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Tue, 31 Aug 2021 16:15:38 +0000
 Subject: [PATCH] n1sdp: pci_quirk: add acs override for PCI devices
@@ -19,10 +19,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  2 files changed, 110 insertions(+)
 
 diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
-index 963cdaecabcb..8e94af513b9f 100644
+index 9e5bab29685f..7ee740a37e5d 100644
 --- a/Documentation/admin-guide/kernel-parameters.txt
 +++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -4162,6 +4162,14 @@
+@@ -4235,6 +4235,14 @@
  		nomsi		[MSI] If the PCI_MSI kernel config parameter is
  				enabled, this kernel boot option can be used to
  				disable the use of MSI interrupts system-wide.
@@ -38,10 +38,10 @@ index 963cdaecabcb..8e94af513b9f 100644
  				Safety option to keep boot IRQs enabled. This
  				should never be necessary.
 diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index 285acc4aaccc..d6ebef1f30db 100644
+index b7c65193e786..16b81d1ccafa 100644
 --- a/drivers/pci/quirks.c
 +++ b/drivers/pci/quirks.c
-@@ -3612,6 +3612,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
+@@ -3625,6 +3625,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
  	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
  }
  
@@ -149,7 +149,7 @@ index 285acc4aaccc..d6ebef1f30db 100644
  /*
   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
   * prevented for those affected devices.
-@@ -4980,6 +5081,7 @@ static const struct pci_dev_acs_enabled {
+@@ -5017,6 +5118,7 @@ static const struct pci_dev_acs_enabled {
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs },
  	/* Wangxun nics */
  	{ PCI_VENDOR_ID_WANGXUN, PCI_ANY_ID, pci_quirk_wangxun_nic_acs },
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
similarity index 96%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
index 9b439e47..96d55ad8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -1,4 +1,4 @@
-From 5aa5769af625c79589fd84b8afc06149c2362218 Mon Sep 17 00:00:00 2001
+From 268bfbcd8f16660bf5fc8e31b18b4090743c6dbe Mon Sep 17 00:00:00 2001
 From: Deepak Pandey <Deepak.Pandey@arm.com>
 Date: Fri, 31 May 2019 16:42:43 +0100
 Subject: [PATCH] pcie: Add quirk for the Arm Neoverse N1SDP platform
@@ -41,10 +41,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  create mode 100644 drivers/pci/controller/pcie-n1sdp.c
 
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index bbbc31391a65..973aa3b4d407 100644
+index a24609e14d50..cd73d1704dd2 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -214,6 +214,7 @@ CONFIG_NFC_S3FWRN5_I2C=m
+@@ -203,6 +203,7 @@ CONFIG_NFC_S3FWRN5_I2C=m
  CONFIG_PCI=y
  CONFIG_PCIEPORTBUS=y
  CONFIG_PCIEAER=y
@@ -71,12 +71,12 @@ index 860014b89b8e..2d4c1c699ffe 100644
  
  #ifdef CONFIG_LOONGARCH
 diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
-index bfd9bac37e24..7a65799dded7 100644
+index 8d49bad7f847..7bb49afbcd5b 100644
 --- a/drivers/pci/controller/Kconfig
 +++ b/drivers/pci/controller/Kconfig
-@@ -50,6 +50,17 @@ config PCI_IXP4XX
- 	  Say Y here if you want support for the PCI host controller found
- 	  in the Intel IXP4xx XScale-based network processor SoC.
+@@ -21,6 +21,17 @@ config PCIE_ALTERA
+ 	  Say Y here if you want to enable PCIe controller support on Altera
+ 	  FPGA.
  
 +config PCIE_HOST_N1SDP_ECAM
 +	bool "ARM N1SDP PCIe Controller"
@@ -89,9 +89,9 @@ index bfd9bac37e24..7a65799dded7 100644
 +	  The controller is ECAM compliant, but needs a quirk to workaround
 +	  an integration issue.
 +
- config PCI_TEGRA
- 	bool "NVIDIA Tegra PCIe controller"
- 	depends on ARCH_TEGRA || COMPILE_TEST
+ config PCIE_ALTERA_MSI
+ 	tristate "Altera PCIe MSI feature"
+ 	depends on PCIE_ALTERA
 diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
 index 37c8663de7fe..08e5afcf6e86 100644
 --- a/drivers/pci/controller/Makefile
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
index b804658b..ce28499e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -1,4 +1,4 @@
-From b59e0d6c6035db80fc9044df0333f96ede53ad7a Mon Sep 17 00:00:00 2001
+From 553801193c173711e9f7f6c56a44b5fac2385c1e Mon Sep 17 00:00:00 2001
 From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
 Date: Wed, 9 Feb 2022 20:37:43 +0530
 Subject: [PATCH] n1sdp: pcie: add quirk support enabling remote chip PCIe
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
similarity index 88%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
index cc9d8717..e4f15bbc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
@@ -1,4 +1,4 @@
-From ff02f77788f8c01e9d675912c063e89415804b7d Mon Sep 17 00:00:00 2001
+From d2e55d92eefd99ede330270b00c01b734a6b61c0 Mon Sep 17 00:00:00 2001
 From: Andre Przywara <andre.przywara@arm.com>
 Date: Fri, 17 May 2019 17:39:27 +0100
 Subject: [PATCH] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
@@ -20,10 +20,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
-index b3f37e2209ad..b74210f38cd8 100644
+index 7d7128c65161..77e109ddd981 100644
 --- a/arch/arm64/kernel/cpufeature.c
 +++ b/arch/arm64/kernel/cpufeature.c
-@@ -1646,6 +1646,7 @@ static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
+@@ -1674,6 +1674,7 @@ static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
similarity index 65%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
index 8aea1f60..dae3243f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
@@ -1,4 +1,4 @@
-From 330a620b5c73505e62a2e0accc155fbc78859cee Mon Sep 17 00:00:00 2001
+From d59c5c17d3345f923d66fc85a7681fc6c4fd657d Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Wed, 21 Sep 2022 15:54:14 +0100
 Subject: [PATCH] arm64: defconfig: disable config options that does not apply
@@ -6,6 +6,8 @@ Subject: [PATCH] arm64: defconfig: disable config options that does not apply
 
 Following config options should be not set to be more accurate and
 works with build system like yocto
+CONFIG_BT_HCIBTUSB
+CONFIG_BT_HCIBTUSB_MTK
 CONFIG_BT_HCIUART_MRVL
 CONFIG_BT_MRVL
 CONFIG_BT_MRVL_SDIO
@@ -14,15 +16,24 @@ CONFIG_BT_QCOMSMD
 Upstream-Status: Pending [not submitted upstream yet]
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
- arch/arm64/configs/defconfig | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ arch/arm64/configs/defconfig | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 973aa3b4d407..61f040394a2d 100644
+index cd73d1704dd2..958a43bd00e6 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -198,10 +198,10 @@ CONFIG_BT_HCIUART=m
+@@ -181,16 +181,16 @@ CONFIG_BT_HIDP=m
+ # CONFIG_BT_LE is not set
+ CONFIG_BT_LEDS=y
+ # CONFIG_BT_DEBUGFS is not set
+-CONFIG_BT_HCIBTUSB=m
+-CONFIG_BT_HCIBTUSB_MTK=y
++# CONFIG_BT_HCIBTUSB is not set
++# CONFIG_BT_HCIBTUSB_MTK is not set
+ CONFIG_BT_HCIUART=m
  CONFIG_BT_HCIUART_LL=y
  CONFIG_BT_HCIUART_BCM=y
  CONFIG_BT_HCIUART_QCA=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enable-nvme.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enable-nvme.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-realtek-R8169.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enable-realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enable-usb_conn_gpio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-usb_conn_gpio.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enable-usb_conn_gpio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/usb_xhci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/usb_xhci_pci_renesas.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/usb_xhci_pci_renesas.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/usb_xhci_pci_renesas.cfg
-- 
2.17.1


