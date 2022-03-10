Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F1AC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 09:58:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7637.1646906288897618651
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 01:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9BB21650;
	Thu, 10 Mar 2022 01:58:07 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2F4D3FA27;
	Thu, 10 Mar 2022 01:58:06 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: migrate to linux yocto kernel 5.15
Date: Thu, 10 Mar 2022 09:57:56 +0000
Message-Id: <20220310095756.23619-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310095756.23619-1-xueliang.zhong@arm.com>
References: <20220310095756.23619-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 09:58:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3145

From: Xueliang Zhong <xueliang.zhong@arm.com>

This commit includes :
- Rebased and fixed N1SDP kernel 5.4 PCIe quirk patches to apply on 5.15
- Removed 5.10 kernel recipe for N1SDP
- Dropped RT kernel support, as it is no longer supported on N1SDP

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |   3 +-
 .../linux/linux-arm-platforms.inc             |  12 +-
 ...drop-unused-BACKLIGHT_GENERIC-option.patch |  41 ------
 ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  58 --------
 ...uirk-support-enabling-remote-chip-PC.patch | 137 ------------------
 .../linux-yocto-5.10/n1sdp/no-power-avs.patch |  29 ----
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch |  49 +++++++
 ...rk-add-acs-override-for-PCI-devices.patch} |  45 +++---
 ...for-the-Arm-Neoverse-N1SDP-platform.patch} | 130 ++++++++---------
 ...uirk-support-enabling-remote-chip-PC.patch | 137 ++++++++++++++++++
 ...list-early-Arm-Neoverse-N1-revisions.patch |  34 +++++
 .../n1sdp/enable-realtek-R8169.cfg            |   0
 .../n1sdp/enable-usb_conn_gpio.cfg            |   0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |   2 +
 14 files changed, 313 insertions(+), 364 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/no-power-avs.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch => linux-yocto-5.15/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch} (75%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch => linux-yocto-5.15/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch} (78%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10 => linux-yocto-5.15}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10 => linux-yocto-5.15}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/usb_xhci_pci_renesas.cfg

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 1fadbc1..5e87e61 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -19,8 +19,7 @@ WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.10%"
-PREFERRED_VERSION_linux-yocto-rt ?= "5.10%"
+PREFERRED_VERSION_linux-yocto ?= "5.15%"
 
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 95ecfd5..a9f3b88 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -95,20 +95,20 @@ COMPATIBLE_MACHINE:musca-s1 = "(^$)"
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
+FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-5.15/n1sdp:"
 COMPATIBLE_MACHINE:n1sdp = "n1sdp"
 KBUILD_DEFCONFIG:n1sdp = "defconfig"
 KCONFIG_MODE:n1sdp = "--alldefconfig"
 FILESEXTRAPATHS:prepend:n1sdp := "${ARMBSPFILESPATHS}"
 SRC_URI:append:n1sdp = " \
-    file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
-    file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
-    file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch \
+    file://0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch \
+    file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
-    file://0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch \
-    file://no-power-avs.patch \
+    file://0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch \
     file://enable-realtek-R8169.cfg \
     file://enable-usb_conn_gpio.cfg \
+    file://usb_xhci_pci_renesas.cfg \
     "
 # Since we use the intree defconfig and the preempt-rt turns off some configs
 # do_kernel_configcheck will display warnings. So, lets disable it.
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch
deleted file mode 100644
index 88a65fb..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 717c4c8336486781630893508b3347ae18953fae Mon Sep 17 00:00:00 2001
-From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
-Date: Tue, 1 Dec 2020 22:29:19 +0000
-Subject: [PATCH] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
-
-Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
-unused") removed geenric_bl driver from the tree, together with
-corresponding config option.
-
-Remove BACKLIGHT_GENERIC config item from arm64 configuration.
-
-Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
-Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
-Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
-Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
-Acked-by: Sam Ravnborg <sam@ravnborg.org>
-Cc: Sam Ravnborg <sam@ravnborg.org>
-Link: https://lore.kernel.org/r/20201201222922.3183-3-andrey.zhizhikin@leica-geosystems.com'
-Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
- arch/arm64/configs/defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 98e15de04c5d..6493079e2c54 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -698,7 +698,6 @@ CONFIG_DRM_PANFROST=m
- CONFIG_FB=y
- CONFIG_FB_MODE_HELPERS=y
- CONFIG_FB_EFI=y
--CONFIG_BACKLIGHT_GENERIC=m
- CONFIG_BACKLIGHT_PWM=m
- CONFIG_BACKLIGHT_LP855X=m
- CONFIG_LOGO=y
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
deleted file mode 100644
index 5a53460..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From f3662513b224d9704355afc61a9dc26493bbdf13 Mon Sep 17 00:00:00 2001
-From: Khasim Mohammed <khasim.mohammed@arm.com>
-Date: Tue, 5 Jan 2021 17:57:46 +0000
-Subject: [PATCH 3/4] n1sdp: update n1sdp pci quirk for SR-IOV support
-
-Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
-
-The patch is taken from:
-https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree/linux
-
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-VFs are not probing the vendor ID first, which is otherwise
-the gate keeper for undiscovered devices. So any accesses using
-a config space offset greater than 0 must be coming for an
-already discovered device or from a VF that has just been created.
-
-Also if Linux already has a struct pci_dev* for a given BDF,
-this device is safe to access.
-
-Skip the firmware table in these cases and allow accesses to
-those devices. That enables SR-IOV support on the N1SDP board.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
----
- drivers/pci/controller/pcie-n1sdp.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
-index 327aee9c5564..45bbe506045a 100644
---- a/drivers/pci/controller/pcie-n1sdp.c
-+++ b/drivers/pci/controller/pcie-n1sdp.c
-@@ -61,6 +61,7 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
- 	unsigned int segment = bus->domain_nr;
- 	unsigned int bdf_addr;
- 	unsigned int table_count, i;
-+	struct pci_dev *dev;
- 
- 	if (segment >= MAX_SEGMENTS ||
- 	    busn < cfg->busr.start || busn > cfg->busr.end)
-@@ -70,6 +71,14 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
- 	if (busn == 0 && devfn == 0)
- 		return rc_remapped_addr[segment] + where;
- 
-+	dev = pci_get_domain_bus_and_slot(segment, busn, devfn);
-+	if (dev && dev->is_virtfn)
-+		return pci_ecam_map_bus(bus, devfn, where);
-+
-+	/* Accesses beyond the vendor ID always go to existing devices. */
-+	if (where > 0)
-+		return pci_ecam_map_bus(bus, devfn, where);
-+
- 	busn -= cfg->busr.start;
- 	bdf_addr = (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
- 	table_count = pcie_discovery_data[segment]->nr_bdfs;
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
deleted file mode 100644
index 10a59e8..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 604e0130dff007f28a510291064edf20aff3ddea Mon Sep 17 00:00:00 2001
-From: Khasim Mohammed <khasim.mohammed@arm.com>
-Date: Tue, 5 Jan 2021 18:20:16 +0000
-Subject: [PATCH 4/4] n1sdp: pcie: add quirk support enabling remote chip PCIe
-
-Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
-
-This patch is picked from the git repository and ported 5.10:
-https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/patch/?id=04b7e76d0fe6481a803f58e54e008a1489d713a5
-
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-Base address mapping for remote chip Root PCIe ECAM space.
-
-Remote Chip PCIe topology is enumerated in Firmware and current
-change takes referecne of enumerated PCIe hierarchy of Remote chip into the
-kernel and include in complete PCIe topology for kernel framework.
-
-Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
----
- drivers/acpi/pci_mcfg.c             |  1 +
- drivers/pci/controller/pcie-n1sdp.c | 36 ++++++++++++++++++++++++++---
- include/linux/pci-ecam.h            |  1 +
- 3 files changed, 35 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index f7a7d6e87780..0523f485c930 100644
---- a/drivers/acpi/pci_mcfg.c
-+++ b/drivers/acpi/pci_mcfg.c
-@@ -149,6 +149,7 @@ static struct mcfg_fixup mcfg_quirks[] = {
- 	/* N1SDP SoC with v1 PCIe controller */
- 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
- 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
-+	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
- 
- #define ALTRA_ECAM_QUIRK(rev, seg) \
- 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
-diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
-index 45bbe506045a..01f601e36343 100644
---- a/drivers/pci/controller/pcie-n1sdp.c
-+++ b/drivers/pci/controller/pcie-n1sdp.c
-@@ -28,8 +28,11 @@
- 
- /* Platform specific values as hardcoded in the firmware. */
- #define AP_NS_SHARED_MEM_BASE	0x06000000
--#define MAX_SEGMENTS		2
-+
-+/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip*/
-+#define MAX_SEGMENTS		3
- #define BDF_TABLE_SIZE		SZ_16K
-+#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
- 
- /*
-  * Shared memory layout as written by the SCP upon boot time:
-@@ -100,7 +103,10 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
- 	if (segment >= MAX_SEGMENTS)
- 		return -ENODEV;
- 
--	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
-+	if (segment > 1)
-+		table_base = AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
-+	else
-+		table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
- 
- 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
- 				"PCIe valid BDFs")) {
-@@ -122,9 +128,15 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
- 
- 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
- 
--	rc_remapped_addr[segment] = devm_ioremap(dev,
-+	if (segment > 1)
-+		rc_remapped_addr[segment] = devm_ioremap(dev,
-+						shared_data->rc_base_addr + REMOTE_CHIP_ADDR_OFFSET,
-+						PCI_CFG_SPACE_EXP_SIZE);
-+	else
-+		rc_remapped_addr[segment] = devm_ioremap(dev,
- 						shared_data->rc_base_addr,
- 						PCI_CFG_SPACE_EXP_SIZE);
-+
- 	if (!rc_remapped_addr[segment]) {
- 		dev_err(dev, "Cannot remap root port base\n");
- 		return -ENOMEM;
-@@ -145,6 +157,11 @@ static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
- 	return pci_n1sdp_init(cfg, 1);
- }
- 
-+static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
-+{
-+	return pci_n1sdp_init(cfg, 2);
-+}
-+
- const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
- 	.bus_shift	= 20,
- 	.init		= pci_n1sdp_pcie_init,
-@@ -165,6 +182,16 @@ const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops = {
- 	}
- };
- 
-+const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops = {
-+	.bus_shift	= 20,
-+	.init		= pci_n1sdp_remote_pcie_init,
-+	.pci_ops	= {
-+		.map_bus	= pci_n1sdp_map_bus,
-+		.read		= pci_generic_config_read32,
-+		.write		= pci_generic_config_write32,
-+	}
-+};
-+
- struct of_device_id n1sdp_pcie_of_match[] = {
- 	{ .compatible = "arm,n1sdp-pcie" },
- 	{ },
-@@ -188,6 +215,9 @@ static int n1sdp_pcie_probe(struct platform_device *pdev)
- 	case 1:
- 		n1sdp_pcie_of_match[0].data = &pci_n1sdp_ccix_ecam_ops;
- 		return pci_host_common_probe(pdev);
-+	case 2:
-+		n1sdp_pcie_of_match[0].data = &pci_n1sdp_remote_pcie_ecam_ops;
-+		return pci_host_common_probe(pdev);
- 	}
- 
- 	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
-diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index d3959ada44af..08d9684b7dc8 100644
---- a/include/linux/pci-ecam.h
-+++ b/include/linux/pci-ecam.h
-@@ -60,6 +60,7 @@ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x
- extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
- extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
- extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
-+extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N1SDP PCIe */
- #endif
- 
- #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/no-power-avs.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/no-power-avs.patch
deleted file mode 100644
index a8c608c..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/no-power-avs.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Remove CONFIG_POWER_AVS, this config option was removed in 785b5bb41b0a.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
-index c5f25710fedc..62650dc10119 100644
---- a/arch/arm/configs/multi_v7_defconfig
-+++ b/arch/arm/configs/multi_v7_defconfig
-@@ -475,7 +475,6 @@ CONFIG_GPIO_TPS6586X=y
- CONFIG_GPIO_TPS65910=y
- CONFIG_GPIO_TWL4030=y
- CONFIG_GPIO_MXC=y
--CONFIG_POWER_AVS=y
- CONFIG_ROCKCHIP_IODOMAIN=y
- CONFIG_POWER_RESET_AS3722=y
- CONFIG_POWER_RESET_GPIO=y
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 838301650a79..1146f2904bff 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -523,7 +523,6 @@ CONFIG_GPIO_PCA953X_IRQ=y
- CONFIG_GPIO_BD9571MWV=m
- CONFIG_GPIO_MAX77620=y
- CONFIG_GPIO_SL28CPLD=m
--CONFIG_POWER_AVS=y
- CONFIG_QCOM_CPR=y
- CONFIG_ROCKCHIP_IODOMAIN=y
- CONFIG_POWER_RESET_MSM=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
new file mode 100644
index 0000000..a75ca24
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
@@ -0,0 +1,49 @@
+Upstream-Status: Inappropriate [Workaround]
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+
+From 949ba3f12ec1f3177a82a9228dc402ab5d8c9d60 Mon Sep 17 00:00:00 2001
+From: Manoj Kumar <manoj.kumar3@arm.com>
+Date: Mon, 1 Feb 2021 21:36:43 +0530
+Subject: [PATCH 1/5] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in
+ N1SDP
+
+ATC_INV_SIZE_ALL request should automatically translate to ATS
+address which is not happening in SMMUv3 version gone into
+N1SDP platform. This workaround manually sets the ATS address
+field to proper value for ATC_INV_SIZE_ALL command.
+
+Change-Id: If89465be94720a62be85e1e6612f17e93fa9b8a5
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+---
+ drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
+ drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+index a388e318f86e..ceca576b0bf6 100644
+--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
++++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+@@ -1724,6 +1724,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
+ 	};
+ 
+ 	if (!size) {
++		cmd->atc.addr = ATC_INV_ADDR_ALL;
+ 		cmd->atc.size = ATC_INV_SIZE_ALL;
+ 		return;
+ 	}
+diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+index 4cb136f07914..5615ffd24e46 100644
+--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
++++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+@@ -473,6 +473,7 @@ struct arm_smmu_cmdq_ent {
+ 
+ 		#define CMDQ_OP_ATC_INV		0x40
+ 		#define ATC_INV_SIZE_ALL	52
++		#define ATC_INV_ADDR_ALL        0x7FFFFFFFFFFFF000UL
+ 		struct {
+ 			u32			sid;
+ 			u32			ssid;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
similarity index 75%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
index aa4e9e4..a628409 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -1,46 +1,45 @@
-From cfe5f638279e99cfc991cb38635cb9083c71f1e2 Mon Sep 17 00:00:00 2001
-From: Khasim Mohammed <khasim.mohammed@arm.com>
-Date: Mon, 4 Jan 2021 18:03:00 +0000
-Subject: [PATCH 1/4] pci_quirk: add acs override for PCI devices
-
-Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
-
+Upstream-Status: Inappropriate [will not be submitted as its a workaround to address hardware issue]
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 
+From e47ab593ee36b2480f8c2196722cded42749629a Mon Sep 17 00:00:00 2001
+From: Manoj Kumar <manoj.kumar3@arm.com>
+Date: Tue, 31 Aug 2021 16:15:38 +0000
+Subject: [PATCH 2/5] n1sdp: pci_quirk: add acs override for PCI devices
+
 Patch taken from:
 https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/5.4/acso.patch
 
+Change-Id: Ib926bf50524ce9990fbaa2f2f8670fe84bd571f9
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
 ---
- .../admin-guide/kernel-parameters.txt         |   9 ++
+ .../admin-guide/kernel-parameters.txt         |   8 ++
  drivers/pci/quirks.c                          | 102 ++++++++++++++++++
- 2 files changed, 111 insertions(+)
+ 2 files changed, 110 insertions(+)
 
 diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
-index 44fde25bb221..866a8eac8c3f 100644
+index 43dc35fe5bc0..a60e454854d7 100644
 --- a/Documentation/admin-guide/kernel-parameters.txt
 +++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -3629,6 +3629,15 @@
+@@ -3892,6 +3892,14 @@
  		nomsi		[MSI] If the PCI_MSI kernel config parameter is
  				enabled, this kernel boot option can be used to
  				disable the use of MSI interrupts system-wide.
-+		pcie_acs_override =
-+					[PCIE] Override missing PCIe ACS support for:
++		pcie_acs_override [PCIE] Override missing PCIe ACS support for
 +				downstream
-+					All downstream ports - full ACS capabilities
++				All downstream ports - full ACS capabilities
 +				multfunction
-+					All multifunction devices - multifunction ACS subset
++				All multifunction devices - multifunction ACS subset
 +				id:nnnn:nnnn
-+					Specfic device - full ACS capabilities
-+					Specified as vid:did (vendor/device ID) in hex
++				Specfic device - full ACS capabilities
++				Specified as vid:did (vendor/device ID) in hex
  		noioapicquirk	[APIC] Disable all boot interrupt quirks.
  				Safety option to keep boot IRQs enabled. This
  				should never be necessary.
 diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index f70692ac79c5..bc758323c8f3 100644
+index 4537d1ea14fd..984f30d25a6d 100644
 --- a/drivers/pci/quirks.c
 +++ b/drivers/pci/quirks.c
-@@ -3557,6 +3557,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
+@@ -3588,6 +3588,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
  	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
  }
  
@@ -146,10 +145,10 @@ index f70692ac79c5..bc758323c8f3 100644
 +}
 +
  /*
-  * Some Atheros AR9xxx and QCA988x chips do not behave after a bus reset.
-  * The device will throw a Link Down error on AER-capable systems and
-@@ -4769,6 +4870,7 @@ static const struct pci_dev_acs_enabled {
- 	{ PCI_VENDOR_ID_ZHAOXIN, 0x9083, pci_quirk_mf_endpoint_acs },
+  * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
+  * prevented for those affected devices.
+@@ -4949,6 +5050,7 @@ static const struct pci_dev_acs_enabled {
+ 	{ PCI_VENDOR_ID_NXP, 0x8d9b, pci_quirk_nxp_rp_acs },
  	/* Zhaoxin Root/Downstream Ports */
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs },
 +	{ PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
similarity index 78%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
index 7b35e3b..f0184a0 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -1,14 +1,10 @@
-From 5b9fd8da4deaabcd854c49286bf5c57c661e122f Mon Sep 17 00:00:00 2001
-From: Khasim Mohammed <khasim.mohammed@arm.com>
-Date: Mon, 4 Jan 2021 18:34:46 +0000
-Subject: [PATCH 2/4] pcie: Add quirk for the Arm Neoverse N1SDP platform
-
-Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
-
-The patch is taken from :
-https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree/linux
+Upstream-Status: Inappropriate [will not be submitted as its a workaround to address hardware issue]
+Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
 
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+From 63ee3a71eeb778a632f5683f3b9e404a70760e75 Mon Sep 17 00:00:00 2001
+From: Deepak Pandey <Deepak.Pandey@arm.com>
+Date: Fri, 31 May 2019 16:42:43 +0100
+Subject: [PATCH 3/5] pcie: Add quirk for the Arm Neoverse N1SDP platform
 
 The Arm N1SDP SoC suffers from some PCIe integration issues, most
 prominently config space accesses to not existing BDFs being answered
@@ -31,8 +27,6 @@ Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
 Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
 [Andre: fix coding style issues, rewrite some parts, add DT support]
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-[Khasim: port the patch to linux kernel 5.10]
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 ---
  arch/arm64/configs/defconfig        |   1 +
  drivers/acpi/pci_mcfg.c             |   7 +
@@ -44,10 +38,10 @@ Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
  create mode 100644 drivers/pci/controller/pcie-n1sdp.c
 
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 5cfe3cf6f2ac..a035dcd7055d 100644
+index 545197bc0501..57ae850ccdf0 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -205,6 +205,7 @@ CONFIG_NFC_NCI=m
+@@ -212,6 +212,7 @@ CONFIG_NFC_NCI=m
  CONFIG_NFC_S3FWRN5_I2C=m
  CONFIG_PCI=y
  CONFIG_PCIEPORTBUS=y
@@ -56,30 +50,30 @@ index 5cfe3cf6f2ac..a035dcd7055d 100644
  CONFIG_PCI_PASID=y
  CONFIG_HOTPLUG_PCI=y
 diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 95f23acd5b80..f7a7d6e87780 100644
+index 53cab975f612..f31727da21ac 100644
 --- a/drivers/acpi/pci_mcfg.c
 +++ b/drivers/acpi/pci_mcfg.c
-@@ -143,6 +143,13 @@ static struct mcfg_fixup mcfg_quirks[] = {
- 	XGENE_V2_ECAM_MCFG(4, 1),
- 	XGENE_V2_ECAM_MCFG(4, 2),
- 
+@@ -169,6 +169,13 @@ static struct mcfg_fixup mcfg_quirks[] = {
+ 	ALTRA_ECAM_QUIRK(1, 13),
+ 	ALTRA_ECAM_QUIRK(1, 14),
+ 	ALTRA_ECAM_QUIRK(1, 15),
++
 +#define N1SDP_ECAM_MCFG(rev, seg, ops) \
 +	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
 +
 +	/* N1SDP SoC with v1 PCIe controller */
 +	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
 +	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
-+
- #define ALTRA_ECAM_QUIRK(rev, seg) \
- 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
+ };
  
+ static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
 diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
-index 64e2f5e379aa..df10736b2d9e 100644
+index 326f7d13024f..f9700d037c46 100644
 --- a/drivers/pci/controller/Kconfig
 +++ b/drivers/pci/controller/Kconfig
-@@ -37,6 +37,17 @@ config PCI_FTPCI100
- 	depends on OF
- 	default ARCH_GEMINI
+@@ -46,6 +46,17 @@ config PCI_IXP4XX
+ 	  Say Y here if you want support for the PCI host controller found
+ 	  in the Intel IXP4xx XScale-based network processor SoC.
  
 +config PCIE_HOST_N1SDP_ECAM
 +	bool "ARM N1SDP PCIe Controller"
@@ -96,20 +90,20 @@ index 64e2f5e379aa..df10736b2d9e 100644
  	bool "NVIDIA Tegra PCIe controller"
  	depends on ARCH_TEGRA || COMPILE_TEST
 diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
-index 04c6edc285c5..6e5c3dcae8d3 100644
+index aaf30b3dcc14..2012ab2b7913 100644
 --- a/drivers/pci/controller/Makefile
 +++ b/drivers/pci/controller/Makefile
-@@ -29,6 +29,7 @@ obj-$(CONFIG_PCIE_ROCKCHIP_HOST) += pcie-rockchip-host.o
- obj-$(CONFIG_PCIE_MEDIATEK) += pcie-mediatek.o
- obj-$(CONFIG_PCIE_TANGO_SMP8759) += pcie-tango.o
- obj-$(CONFIG_VMD) += vmd.o
-+obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) += pcie-n1sdp.o
+@@ -37,6 +37,7 @@ obj-$(CONFIG_VMD) += vmd.o
  obj-$(CONFIG_PCIE_BRCMSTB) += pcie-brcmstb.o
  obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
  obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
++obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) += pcie-n1sdp.o
+ # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
+ obj-y				+= dwc/
+ obj-y				+= mobiveil/
 diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
 new file mode 100644
-index 000000000000..327aee9c5564
+index 000000000000..408699b9dcb1
 --- /dev/null
 +++ b/drivers/pci/controller/pcie-n1sdp.c
 @@ -0,0 +1,198 @@
@@ -141,9 +135,11 @@ index 000000000000..327aee9c5564
 +#include <linux/platform_device.h>
 +#include <linux/module.h>
 +
++#include "../pci.h"
++
 +/* Platform specific values as hardcoded in the firmware. */
 +#define AP_NS_SHARED_MEM_BASE	0x06000000
-+#define MAX_SEGMENTS		2
++#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
 +#define BDF_TABLE_SIZE		SZ_16K
 +
 +/*
@@ -176,6 +172,7 @@ index 000000000000..327aee9c5564
 +	unsigned int segment = bus->domain_nr;
 +	unsigned int bdf_addr;
 +	unsigned int table_count, i;
++	struct pci_dev *dev;
 +
 +	if (segment >= MAX_SEGMENTS ||
 +	    busn < cfg->busr.start || busn > cfg->busr.end)
@@ -185,6 +182,14 @@ index 000000000000..327aee9c5564
 +	if (busn == 0 && devfn == 0)
 +		return rc_remapped_addr[segment] + where;
 +
++	dev = pci_get_domain_bus_and_slot(segment, busn, devfn);
++	if (dev && dev->is_virtfn)
++		return pci_ecam_map_bus(bus, devfn, where);
++
++	/* Accesses beyond the vendor ID always go to existing devices. */
++	if (where > 0)
++		return pci_ecam_map_bus(bus, devfn, where);
++
 +	busn -= cfg->busr.start;
 +	bdf_addr = (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
 +	table_count = pcie_discovery_data[segment]->nr_bdfs;
@@ -229,8 +234,8 @@ index 000000000000..327aee9c5564
 +	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
 +
 +	rc_remapped_addr[segment] = devm_ioremap(dev,
-+						shared_data->rc_base_addr,
-+						PCI_CFG_SPACE_EXP_SIZE);
++						 shared_data->rc_base_addr,
++						 PCI_CFG_SPACE_EXP_SIZE);
 +	if (!rc_remapped_addr[segment]) {
 +		dev_err(dev, "Cannot remap root port base\n");
 +		return -ENOMEM;
@@ -241,11 +246,25 @@ index 000000000000..327aee9c5564
 +	return 0;
 +}
 +
++/* Called for ACPI segment 0, and for all segments when using DT. */
 +static int pci_n1sdp_pcie_init(struct pci_config_window *cfg)
 +{
-+	return pci_n1sdp_init(cfg, 0);
++	struct platform_device *pdev = to_platform_device(cfg->parent);
++	int segment = 0;
++
++	if (pdev->dev.of_node)
++		segment = of_get_pci_domain_nr(pdev->dev.of_node);
++	if (segment < 0 || segment > MAX_SEGMENTS) {
++		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain property\n");
++		dev_err(&pdev->dev, "Or invalid segment number, must be smaller than %d\n",
++			MAX_SEGMENTS);
++		return -EINVAL;
++	}
++
++	return pci_n1sdp_init(cfg, segment);
 +}
 +
++/* Called for ACPI segment 1. */
 +static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
 +{
 +	return pci_n1sdp_init(cfg, 1);
@@ -271,54 +290,29 @@ index 000000000000..327aee9c5564
 +	}
 +};
 +
-+struct of_device_id n1sdp_pcie_of_match[] = {
-+	{ .compatible = "arm,n1sdp-pcie" },
++static const struct of_device_id n1sdp_pcie_of_match[] = {
++	{ .compatible = "arm,n1sdp-pcie", .data = &pci_n1sdp_pcie_ecam_ops },
 +	{ },
 +};
 +MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
 +
-+static int n1sdp_pcie_probe(struct platform_device *pdev)
-+{
-+	const struct device_node *of_node = pdev->dev.of_node;
-+	u32 segment;
-+
-+	if (of_property_read_u32(of_node, "linux,pci-domain", &segment)) {
-+		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain property\n");
-+		return -EINVAL;
-+	}
-+
-+	switch (segment) {
-+	case 0:
-+		n1sdp_pcie_of_match[0].data = &pci_n1sdp_pcie_ecam_ops;
-+		return pci_host_common_probe(pdev);
-+	case 1:
-+		n1sdp_pcie_of_match[0].data = &pci_n1sdp_ccix_ecam_ops;
-+		return pci_host_common_probe(pdev);
-+	}
-+
-+	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
-+		MAX_SEGMENTS);
-+
-+	return -EINVAL;
-+}
-+
 +static struct platform_driver n1sdp_pcie_driver = {
 +	.driver = {
 +		.name = KBUILD_MODNAME,
 +		.of_match_table = n1sdp_pcie_of_match,
 +		.suppress_bind_attrs = true,
 +	},
-+	.probe = n1sdp_pcie_probe,
++	.probe = pci_host_common_probe,
 +};
 +builtin_platform_driver(n1sdp_pcie_driver);
 diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index 033ce74f02e8..d3959ada44af 100644
+index adea5a4771cf..e6bbc037cef8 100644
 --- a/include/linux/pci-ecam.h
 +++ b/include/linux/pci-ecam.h
-@@ -58,6 +58,8 @@ extern const struct pci_ecam_ops pci_thunder_ecam_ops; /* Cavium ThunderX 1.x */
- extern const struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene PCIe v1 */
+@@ -87,6 +87,8 @@ extern const struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene PCIe v1 *
  extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x */
  extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
+ extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
 +extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
 +extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
  #endif
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
new file mode 100644
index 0000000..c15b464
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -0,0 +1,137 @@
+Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+
+From 4d69e38213bf52a48f2f0239da8c7b76501428b2 Mon Sep 17 00:00:00 2001
+From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+Date: Wed, 9 Feb 2022 20:37:43 +0530
+Subject: [PATCH 4/5] n1sdp: pcie: add quirk support enabling remote chip PCIe
+
+Base address mapping for remote chip Root PCIe ECAM space.
+
+When two N1SDP boards are coupled via the CCIX connection, the PCI host
+complex of the remote board appears as PCIe segment 2 on the primary board.
+The resources of the secondary board, including the host complex, are
+mapped at offset 0x40000000000 into the address space of the primary
+board, so take that into account when accessing the remote PCIe segment.
+
+Change-Id: I0e8d1eb119aef6444b9df854a39b24441c12195a
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+---
+ drivers/acpi/pci_mcfg.c             |  1 +
+ drivers/pci/controller/pcie-n1sdp.c | 32 +++++++++++++++++++++++++----
+ include/linux/pci-ecam.h            |  1 +
+ 3 files changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index f31727da21ac..58f59b5fffa2 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -176,6 +176,7 @@ static struct mcfg_fixup mcfg_quirks[] = {
+ 	/* N1SDP SoC with v1 PCIe controller */
+ 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
+ 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
+ };
+ 
+ static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
+index 408699b9dcb1..a03665dd056a 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -30,8 +30,10 @@
+ 
+ /* Platform specific values as hardcoded in the firmware. */
+ #define AP_NS_SHARED_MEM_BASE	0x06000000
+-#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
++/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip */
++#define MAX_SEGMENTS		3
+ #define BDF_TABLE_SIZE		SZ_16K
++#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
+ 
+ /*
+  * Shared memory layout as written by the SCP upon boot time:
+@@ -97,12 +99,17 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
+ 	phys_addr_t table_base;
+ 	struct device *dev = cfg->parent;
+ 	struct pcie_discovery_data *shared_data;
+-	size_t bdfs_size;
++	size_t bdfs_size, rc_base_addr = 0;
+ 
+ 	if (segment >= MAX_SEGMENTS)
+ 		return -ENODEV;
+ 
+-	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++	if (segment > 1) {
++	    rc_base_addr = REMOTE_CHIP_ADDR_OFFSET;
++	    table_base = AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
++        } else {
++            table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++	}
+ 
+ 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
+ 				"PCIe valid BDFs")) {
+@@ -114,6 +121,7 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
+ 				   table_base, BDF_TABLE_SIZE);
+ 	if (!shared_data)
+ 		return -ENOMEM;
++	rc_base_addr += shared_data->rc_base_addr;
+ 
+ 	/* Copy the valid BDFs structure to allocated normal memory. */
+ 	bdfs_size = sizeof(struct pcie_discovery_data) +
+@@ -125,7 +133,7 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
+ 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
+ 
+ 	rc_remapped_addr[segment] = devm_ioremap(dev,
+-						 shared_data->rc_base_addr,
++						 rc_base_addr,
+ 						 PCI_CFG_SPACE_EXP_SIZE);
+ 	if (!rc_remapped_addr[segment]) {
+ 		dev_err(dev, "Cannot remap root port base\n");
+@@ -161,6 +169,12 @@ static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
+ 	return pci_n1sdp_init(cfg, 1);
+ }
+ 
++/* Called for ACPI segment 2. */
++static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
++{
++        return pci_n1sdp_init(cfg, 2);
++}
++
+ const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
+ 	.bus_shift	= 20,
+ 	.init		= pci_n1sdp_pcie_init,
+@@ -181,6 +195,16 @@ const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops = {
+ 	}
+ };
+ 
++const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops = {
++	.bus_shift	= 20,
++	.init		= pci_n1sdp_remote_pcie_init,
++	.pci_ops	= {
++		.map_bus        = pci_n1sdp_map_bus,
++		.read           = pci_generic_config_read32,
++		.write          = pci_generic_config_write32,
++	}
++};
++
+ static const struct of_device_id n1sdp_pcie_of_match[] = {
+ 	{ .compatible = "arm,n1sdp-pcie", .data = &pci_n1sdp_pcie_ecam_ops },
+ 	{ },
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index e6bbc037cef8..7bd8c1d702ee 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -89,6 +89,7 @@ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
+ extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
+ extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
+ extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
++extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N1SDP PCIe */
+ #endif
+ 
+ #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
new file mode 100644
index 0000000..0404086
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+
+From d20f5afffadcdbaca7032f547cce80720d8a414a Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Fri, 17 May 2019 17:39:27 +0100
+Subject: [PATCH 5/5] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
+
+Early revisions (r1p0) of the Neoverse N1 core did not feature the
+CSV3 field in ID_AA64PFR0_EL1 to advertise they are not affected by
+the Spectre variant 3 (aka Meltdown) vulnerability.
+
+Add this particular revision to the whitelist to avoid enabling KPTI.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+---
+ arch/arm64/kernel/cpufeature.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
+index 6ec7036ef7e1..ceba98773608 100644
+--- a/arch/arm64/kernel/cpufeature.c
++++ b/arch/arm64/kernel/cpufeature.c
+@@ -1509,6 +1509,7 @@ static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
+ 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
+ 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
+ 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
++		MIDR_REV(MIDR_NEOVERSE_N1, 1, 0),	/* missing CSV3 */
+ 		{ /* sentinel */ }
+ 	};
+ 	char const *str = "kpti command line option";
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-realtek-R8169.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/enable-realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/enable-usb_conn_gpio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb_conn_gpio.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/enable-usb_conn_gpio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/usb_xhci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/usb_xhci_pci_renesas.cfg
new file mode 100644
index 0000000..c06507c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/usb_xhci_pci_renesas.cfg
@@ -0,0 +1,2 @@
+# CONFIG_USB_XHCI_PCI is not set
+# CONFIG_USB_XHCI_PCI_RENESAS is not set
-- 
2.17.1


