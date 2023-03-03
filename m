Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6D0C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 11:41:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20921.1677843693906088399
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Mar 2023 03:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF4372F4;
	Fri,  3 Mar 2023 03:42:16 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 953AA3F93E;
	Fri,  3 Mar 2023 03:41:32 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: update to linux yocto kernel 6.1
Date: Fri,  3 Mar 2023 11:41:21 +0000
Message-Id: <20230303114121.6297-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230303114121.6297-1-xueliang.zhong@arm.com>
References: <20230303114121.6297-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Mar 2023 11:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4466

From: Xueliang Zhong <xueliang.zhong@arm.com>

This commit includes :
- Rebased and fixed N1SDP kernel PCIe quirk patches to apply on 6.1 kernel

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  3 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 13 +++--
 ...irk-add-acs-override-for-PCI-devices.patch | 18 ++++---
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 52 +++++++++++--------
 ...uirk-support-enabling-remote-chip-PC.patch | 37 +++++++------
 ...list-early-Arm-Neoverse-N1-revisions.patch | 14 +++--
 ...disable-config-options-that-does-not.patch |  1 +
 .../linux-yocto-6.1/n1sdp/enable-nvme.cfg     |  3 ++
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 .../recipes-kernel/linux/linux-yocto_5.19.bb  | 28 ----------
 13 files changed, 85 insertions(+), 86 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch (83%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch (90%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch (84%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch (75%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch (95%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/usb_xhci_pci_renesas.cfg (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 581e6af0..0e047e8d 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -19,7 +19,7 @@ WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.19%"
+PREFERRED_VERSION_linux-yocto ?= "6.1%"
 
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 96873c90..3fdfe96f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -112,7 +112,7 @@ COMPATIBLE_MACHINE:musca-s1 = "(^$)"
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-5.19/n1sdp:"
+FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-6.1/n1sdp:"
 COMPATIBLE_MACHINE:n1sdp = "n1sdp"
 KBUILD_DEFCONFIG:n1sdp = "defconfig"
 KCONFIG_MODE:n1sdp = "--alldefconfig"
@@ -124,6 +124,7 @@ SRC_URI:append:n1sdp = " \
     file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
     file://0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch \
     file://0006-arm64-defconfig-disable-config-options-that-does-not.patch \
+    file://enable-nvme.cfg \
     file://enable-realtek-R8169.cfg \
     file://enable-usb_conn_gpio.cfg \
     file://usb_xhci_pci_renesas.cfg \
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
similarity index 83%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
index 188616f5..7b034782 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
@@ -1,7 +1,8 @@
-From 97caa9365f221b5aff93274a29ea894da55dce88 Mon Sep 17 00:00:00 2001
+From 224bcf856f890e561cd648d6638544e5c6ea35e6 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Mon, 1 Feb 2021 21:36:43 +0530
-Subject: [PATCH] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in N1SDP
+Subject: [PATCH 1/5] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in
+ N1SDP
 
 ATC_INV_SIZE_ALL request should automatically translate to ATS
 address which is not happening in SMMUv3 version gone into
@@ -16,16 +17,17 @@ Upstream-Status: Inappropriate [Workaround]
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-index 88817a3376ef..80e252d59a3a 100644
+index d4d8bfee9feb..0524bf2ec021 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-@@ -1731,6 +1731,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
+@@ -1738,6 +1738,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
  	};
  
  	if (!size) {
@@ -45,3 +47,6 @@ index cd48590ada30..20892b2bfe1d 100644
  		struct {
  			u32			sid;
  			u32			ssid;
+-- 
+2.37.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
similarity index 91%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
index 6fc83fbd..287584fa 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -1,7 +1,7 @@
-From ba5ed426f6587d96418bc8bbe4ae908329d4a7a9 Mon Sep 17 00:00:00 2001
+From fe324f420ea2bc24f760b3e4462f67e9a4eae1e5 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Tue, 31 Aug 2021 16:15:38 +0000
-Subject: [PATCH] n1sdp: pci_quirk: add acs override for PCI devices
+Subject: [PATCH 2/5] n1sdp: pci_quirk: add acs override for PCI devices
 
 Patch taken from:
 https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/5.4/acso.patch
@@ -13,16 +13,17 @@ Upstream-Status: Inappropriate [will not be submitted as its a workaround to add
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
  .../admin-guide/kernel-parameters.txt         |   8 ++
  drivers/pci/quirks.c                          | 102 ++++++++++++++++++
  2 files changed, 110 insertions(+)
 
 diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
-index 09836f2f1e74..b465592aa068 100644
+index 6b838869554b..6d7b217269b6 100644
 --- a/Documentation/admin-guide/kernel-parameters.txt
 +++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -4084,6 +4084,14 @@
+@@ -4162,6 +4162,14 @@
  		nomsi		[MSI] If the PCI_MSI kernel config parameter is
  				enabled, this kernel boot option can be used to
  				disable the use of MSI interrupts system-wide.
@@ -38,10 +39,10 @@ index 09836f2f1e74..b465592aa068 100644
  				Safety option to keep boot IRQs enabled. This
  				should never be necessary.
 diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index 2e68f50bc7ae..2d32fa0df411 100644
+index 285acc4aaccc..d6ebef1f30db 100644
 --- a/drivers/pci/quirks.c
 +++ b/drivers/pci/quirks.c
-@@ -3601,6 +3601,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
+@@ -3612,6 +3612,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
  	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
  }
  
@@ -149,7 +150,7 @@ index 2e68f50bc7ae..2d32fa0df411 100644
  /*
   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
   * prevented for those affected devices.
-@@ -4969,6 +5070,7 @@ static const struct pci_dev_acs_enabled {
+@@ -4980,6 +5081,7 @@ static const struct pci_dev_acs_enabled {
  	{ PCI_VENDOR_ID_NXP, 0x8d9b, pci_quirk_nxp_rp_acs },
  	/* Zhaoxin Root/Downstream Ports */
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs },
@@ -157,3 +158,6 @@ index 2e68f50bc7ae..2d32fa0df411 100644
  	{ 0 }
  };
  
+-- 
+2.37.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
similarity index 90%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
index ef2ad8db..0c423554 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -1,7 +1,7 @@
-From e88326f652ac6d126d5df8b3c0b2ac40e8b73797 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Tue, 23 Aug 2022 15:17:28 +0100
-Subject: [PATCH] pcie: Add quirk for the Arm Neoverse N1SDP platform
+From b331595a9e74f09108b95923c876a6f65493677f Mon Sep 17 00:00:00 2001
+From: Deepak Pandey <Deepak.Pandey@arm.com>
+Date: Fri, 31 May 2019 16:42:43 +0100
+Subject: [PATCH 3/5] pcie: Add quirk for the Arm Neoverse N1SDP platform
 
 The Arm N1SDP SoC suffers from some PCIe integration issues, most
 prominently config space accesses to not existing BDFs being answered
@@ -25,34 +25,36 @@ Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
 [Andre: fix coding style issues, rewrite some parts, add DT support]
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
 
+Change-Id: I1d3a4b9bf6b3b883d262e3c4ff1f88a0eb81c1fe
 Upstream-Status: Inappropriate [will not be submitted as its a workaround to address hardware issue]
 Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
  arch/arm64/configs/defconfig        |   1 +
  drivers/acpi/pci_mcfg.c             |   7 +
  drivers/pci/controller/Kconfig      |  11 ++
- drivers/pci/controller/Makefile     |   1 +
+ drivers/pci/controller/Makefile     |   2 +-
  drivers/pci/controller/pcie-n1sdp.c | 198 ++++++++++++++++++++++++++++
  include/linux/pci-ecam.h            |   2 +
- 6 files changed, 220 insertions(+)
+ 6 files changed, 220 insertions(+), 1 deletion(-)
  create mode 100644 drivers/pci/controller/pcie-n1sdp.c
 
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 3ccbe378f875..1ce32678ccc7 100644
+index 0b6af3348e79..933ae9bab661 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -236,6 +236,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
- CONFIG_PCI_ENDPOINT=y
- CONFIG_PCI_ENDPOINT_CONFIGFS=y
- CONFIG_PCI_EPF_TEST=m
+@@ -216,6 +216,7 @@ CONFIG_NFC_S3FWRN5_I2C=m
+ CONFIG_PCI=y
+ CONFIG_PCIEPORTBUS=y
+ CONFIG_PCIEAER=y
 +CONFIG_PCI_QUIRKS=y
- CONFIG_DEVTMPFS=y
- CONFIG_DEVTMPFS_MOUNT=y
- CONFIG_FW_LOADER_USER_HELPER=y
+ CONFIG_PCI_IOV=y
+ CONFIG_PCI_PASID=y
+ CONFIG_HOTPLUG_PCI=y
 diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 63b98eae5e75..7700d36393ec 100644
+index 860014b89b8e..2d4c1c699ffe 100644
 --- a/drivers/acpi/pci_mcfg.c
 +++ b/drivers/acpi/pci_mcfg.c
 @@ -171,6 +171,13 @@ static struct mcfg_fixup mcfg_quirks[] = {
@@ -67,10 +69,10 @@ index 63b98eae5e75..7700d36393ec 100644
 +	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
 +	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
  #endif /* ARM64 */
- };
  
+ #ifdef CONFIG_LOONGARCH
 diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
-index b8d96d38064d..3c5a8a218442 100644
+index bfd9bac37e24..7a65799dded7 100644
 --- a/drivers/pci/controller/Kconfig
 +++ b/drivers/pci/controller/Kconfig
 @@ -50,6 +50,17 @@ config PCI_IXP4XX
@@ -92,17 +94,18 @@ index b8d96d38064d..3c5a8a218442 100644
  	bool "NVIDIA Tegra PCIe controller"
  	depends on ARCH_TEGRA || COMPILE_TEST
 diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
-index 37c8663de7fe..5b8a9535a2f7 100644
+index 37c8663de7fe..08e5afcf6e86 100644
 --- a/drivers/pci/controller/Makefile
 +++ b/drivers/pci/controller/Makefile
-@@ -39,6 +39,7 @@ obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
+@@ -39,7 +39,7 @@ obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
  obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
  obj-$(CONFIG_PCIE_APPLE) += pcie-apple.o
  obj-$(CONFIG_PCIE_MT7621) += pcie-mt7621.o
+-
 +obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) += pcie-n1sdp.o
- 
  # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
  obj-y				+= dwc/
+ obj-y				+= mobiveil/
 diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
 new file mode 100644
 index 000000000000..408699b9dcb1
@@ -308,15 +311,18 @@ index 000000000000..408699b9dcb1
 +};
 +builtin_platform_driver(n1sdp_pcie_driver);
 diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index adea5a4771cf..e6bbc037cef8 100644
+index 6b1301e2498e..b3cf3adeab28 100644
 --- a/include/linux/pci-ecam.h
 +++ b/include/linux/pci-ecam.h
-@@ -87,6 +87,8 @@ extern const struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene PCIe v1 *
- extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x */
+@@ -88,6 +88,8 @@ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x
  extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
  extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
+ extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
 +extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
 +extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
  #endif
  
  #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
+-- 
+2.37.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
similarity index 84%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
index 10fae06b..08df5b99 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -1,13 +1,12 @@
-From 74e052b7533827af9f43d093af8f430c99357eac Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Tue, 23 Aug 2022 15:18:38 +0100
-Subject: [PATCH] n1sdp: pcie: add quirk support enabling remote chip PCIe
+From dbbf1cd4e12e89790ab6646e3761feb82d8b2269 Mon Sep 17 00:00:00 2001
+From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+Date: Wed, 9 Feb 2022 20:37:43 +0530
+Subject: [PATCH 4/5] n1sdp: pcie: add quirk support enabling remote chip PCIe
 
 Base address mapping for remote chip Root PCIe ECAM space.
 
 When two N1SDP boards are coupled via the CCIX connection, the PCI host
-complex of the remote board appears as PCIe segment 2 on the primary
-board.
+complex of the remote board appears as PCIe segment 2 on the primary board.
 The resources of the secondary board, including the host complex, are
 mapped at offset 0x40000000000 into the address space of the primary
 board, so take that into account when accessing the remote PCIe segment.
@@ -22,6 +21,7 @@ Upstream-Status: Inappropriate [will not be submitted as its an hack required to
 Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
  drivers/acpi/pci_mcfg.c             |  1 +
  drivers/pci/controller/pcie-n1sdp.c | 32 +++++++++++++++++++++++++----
@@ -29,7 +29,7 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  3 files changed, 30 insertions(+), 4 deletions(-)
 
 diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 7700d36393ec..806ed8dd0d81 100644
+index 2d4c1c699ffe..27f1e9a45c17 100644
 --- a/drivers/acpi/pci_mcfg.c
 +++ b/drivers/acpi/pci_mcfg.c
 @@ -178,6 +178,7 @@ static struct mcfg_fixup mcfg_quirks[] = {
@@ -38,10 +38,10 @@ index 7700d36393ec..806ed8dd0d81 100644
  	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
 +	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
  #endif /* ARM64 */
- };
  
+ #ifdef CONFIG_LOONGARCH
 diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
-index 408699b9dcb1..a03665dd056a 100644
+index 408699b9dcb1..b3b02417fd7d 100644
 --- a/drivers/pci/controller/pcie-n1sdp.c
 +++ b/drivers/pci/controller/pcie-n1sdp.c
 @@ -30,8 +30,10 @@
@@ -68,10 +68,10 @@ index 408699b9dcb1..a03665dd056a 100644
  
 -	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
 +	if (segment > 1) {
-+	    rc_base_addr = REMOTE_CHIP_ADDR_OFFSET;
-+	    table_base = AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
-+        } else {
-+            table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++		rc_base_addr = REMOTE_CHIP_ADDR_OFFSET;
++		table_base = AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
++	} else {
++		table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
 +	}
  
  	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
@@ -100,7 +100,7 @@ index 408699b9dcb1..a03665dd056a 100644
 +/* Called for ACPI segment 2. */
 +static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
 +{
-+        return pci_n1sdp_init(cfg, 2);
++	return pci_n1sdp_init(cfg, 2);
 +}
 +
  const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
@@ -124,14 +124,17 @@ index 408699b9dcb1..a03665dd056a 100644
  	{ .compatible = "arm,n1sdp-pcie", .data = &pci_n1sdp_pcie_ecam_ops },
  	{ },
 diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index e6bbc037cef8..7bd8c1d702ee 100644
+index b3cf3adeab28..d4316795c00d 100644
 --- a/include/linux/pci-ecam.h
 +++ b/include/linux/pci-ecam.h
-@@ -89,6 +89,7 @@ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
- extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
+@@ -90,6 +90,7 @@ extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
+ extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
  extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
  extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
 +extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N1SDP PCIe */
  #endif
  
  #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
+-- 
+2.37.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
similarity index 75%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
index 76518ae8..f6b11f65 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
@@ -1,7 +1,7 @@
-From 748cb5125b381330563b5339a4573827b015b0e9 Mon Sep 17 00:00:00 2001
+From 4a35a6018cf37538221147d6591ad3d6af7486f1 Mon Sep 17 00:00:00 2001
 From: Andre Przywara <andre.przywara@arm.com>
 Date: Fri, 17 May 2019 17:39:27 +0100
-Subject: [PATCH] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
+Subject: [PATCH 5/5] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
 
 Early revisions (r1p0) of the Neoverse N1 core did not feature the
 CSV3 field in ID_AA64PFR0_EL1 to advertise they are not affected by
@@ -10,20 +10,21 @@ the Spectre variant 3 (aka Meltdown) vulnerability.
 Add this particular revision to the whitelist to avoid enabling KPTI.
 
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-
+Change-Id: I78df055a3e674aefd195d41cc6dc4ee08b0af099
 Upstream-Status: Inappropriate
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
  arch/arm64/kernel/cpufeature.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
-index f34c9f8b9ee0..a778cf472d64 100644
+index b3f37e2209ad..b74210f38cd8 100644
 --- a/arch/arm64/kernel/cpufeature.c
 +++ b/arch/arm64/kernel/cpufeature.c
-@@ -1589,6 +1589,7 @@ static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
+@@ -1646,6 +1646,7 @@ static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
@@ -31,3 +32,6 @@ index f34c9f8b9ee0..a778cf472d64 100644
  		{ /* sentinel */ }
  	};
  	char const *str = "kpti command line option";
+-- 
+2.37.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
index d761a71f..ff6daf92 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
@@ -14,6 +14,7 @@ CONFIG_BT_QCOMSMD
 Upstream-Status: Pending [not submitted upstream yet]
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
  arch/arm64/configs/defconfig | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg
new file mode 100644
index 00000000..26810355
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg
@@ -0,0 +1,3 @@
+# Enable NVMe flash storage support
+CONFIG_NVME_CORE=y
+CONFIG_BLK_DEV_NVME=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/enable-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/enable-realtek-R8169.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/enable-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-usb_conn_gpio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/enable-usb_conn_gpio.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-usb_conn_gpio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/usb_xhci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/usb_xhci_pci_renesas.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/usb_xhci_pci_renesas.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/usb_xhci_pci_renesas.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb
deleted file mode 100644
index 3bd4c756..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-KBRANCH ?= "v5.19/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.17"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native libmpc-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-- 
2.17.1


