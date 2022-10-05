Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B53C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 11:47:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22315.1664970439413761228
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 04:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4859113E;
	Wed,  5 Oct 2022 04:47:25 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 178453F73B;
	Wed,  5 Oct 2022 04:47:17 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux-yocto: Upgrade kernel to v5.19 for N1SDP
Date: Wed,  5 Oct 2022 12:47:06 +0100
Message-Id: <20221005114706.2444304-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005114706.2444304-1-adam.johnston@arm.com>
References: <20221005114706.2444304-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 11:47:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3928

From: Adam Johnston <adam.johnston@arm.com>

This change is to upgrade the Linux kernel version to 5.19 for N1SDP
target to align with post N1SDP-2022.06.22 refresh

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  3 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 12 +++--
 ...irk-add-acs-override-for-PCI-devices.patch | 14 ++---
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 54 ++++++++++---------
 ...uirk-support-enabling-remote-chip-PC.patch | 29 +++++-----
 ...list-early-Arm-Neoverse-N1-revisions.patch |  8 +--
 ...disable-config-options-that-does-not.patch | 39 ++++++++++++++
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 11 files changed, 106 insertions(+), 55 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in=
.patch (80%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.pat=
ch (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.p=
atch (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC=
.patch (87%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions=
.patch (79%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1=
sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 5d1be823..581e6af0 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -19,7 +19,7 @@ WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.15%"
+PREFERRED_VERSION_linux-yocto ?=3D "5.19%"
=20
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 97de2d01..70d09a01 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -105,7 +105,7 @@ COMPATIBLE_MACHINE:musca-s1 =3D "(^$)"
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-5.15/n1sdp:"
+FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-5.19/n1sdp:"
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
 KBUILD_DEFCONFIG:n1sdp =3D "defconfig"
 KCONFIG_MODE:n1sdp =3D "--alldefconfig"
@@ -116,6 +116,7 @@ SRC_URI:append:n1sdp =3D " \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
     file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.pat=
ch \
     file://0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.pat=
ch \
+    file://0006-arm64-defconfig-disable-config-options-that-does-not.pat=
ch \
     file://enable-realtek-R8169.cfg \
     file://enable-usb_conn_gpio.cfg \
     file://usb_xhci_pci_renesas.cfg \
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
1-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0001-iommu-arm-smmu-v3-wor=
karound-for-ATC_INV_SIZE_ALL-in.patch
similarity index 80%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001=
-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0001-i=
ommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
index e1cbb809..188616f5 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu=
-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0001-iommu=
-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
@@ -1,4 +1,4 @@
-From f88153a427046f92d52694708adc5ee0eefa8d55 Mon Sep 17 00:00:00 2001
+From 97caa9365f221b5aff93274a29ea894da55dce88 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Mon, 1 Feb 2021 21:36:43 +0530
 Subject: [PATCH] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in N=
1SDP
@@ -14,16 +14,18 @@ Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@=
arm.com>
=20
 Upstream-Status: Inappropriate [Workaround]
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 ---
  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 1 +
  2 files changed, 2 insertions(+)
=20
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.c
-index 79edfdca6607..ded17e199ee4 100644
+index 88817a3376ef..80e252d59a3a 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-@@ -1725,6 +1725,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
+@@ -1731,6 +1731,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
  	};
 =20
  	if (!size) {
@@ -32,10 +34,10 @@ index 79edfdca6607..ded17e199ee4 100644
  		return;
  	}
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.h
-index 4cb136f07914..5615ffd24e46 100644
+index cd48590ada30..20892b2bfe1d 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
-@@ -473,6 +473,7 @@ struct arm_smmu_cmdq_ent {
+@@ -472,6 +472,7 @@ struct arm_smmu_cmdq_ent {
 =20
  		#define CMDQ_OP_ATC_INV		0x40
  		#define ATC_INV_SIZE_ALL	52
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
2-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-yocto-5.19/n1sdp/0002-n1sdp-pci_quirk-add-acs-o=
verride-for-PCI-devices.patch
similarity index 91%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0002=
-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0002-n=
1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
index b4e2a8c5..6fc83fbd 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0002-n1sdp=
-pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0002-n1sdp=
-pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -1,4 +1,4 @@
-From 478d96ce8a4d30ef80975271a2ad89a77012c1b8 Mon Sep 17 00:00:00 2001
+From ba5ed426f6587d96418bc8bbe4ae908329d4a7a9 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Tue, 31 Aug 2021 16:15:38 +0000
 Subject: [PATCH] n1sdp: pci_quirk: add acs override for PCI devices
@@ -11,16 +11,18 @@ Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
=20
 Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 ---
  .../admin-guide/kernel-parameters.txt         |   8 ++
  drivers/pci/quirks.c                          | 102 ++++++++++++++++++
  2 files changed, 110 insertions(+)
=20
 diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
-index 4445baac48c1..ee90aeeb1dbb 100644
+index 09836f2f1e74..b465592aa068 100644
 --- a/Documentation/admin-guide/kernel-parameters.txt
 +++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -3935,6 +3935,14 @@
+@@ -4084,6 +4084,14 @@
  		nomsi		[MSI] If the PCI_MSI kernel config parameter is
  				enabled, this kernel boot option can be used to
  				disable the use of MSI interrupts system-wide.
@@ -36,10 +38,10 @@ index 4445baac48c1..ee90aeeb1dbb 100644
  				Safety option to keep boot IRQs enabled. This
  				should never be necessary.
 diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index a531064233f9..ebe192134a97 100644
+index 2e68f50bc7ae..2d32fa0df411 100644
 --- a/drivers/pci/quirks.c
 +++ b/drivers/pci/quirks.c
-@@ -3600,6 +3600,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
+@@ -3601,6 +3601,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
  	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
  }
 =20
@@ -147,7 +149,7 @@ index a531064233f9..ebe192134a97 100644
  /*
   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
   * prevented for those affected devices.
-@@ -4968,6 +5069,7 @@ static const struct pci_dev_acs_enabled {
+@@ -4969,6 +5070,7 @@ static const struct pci_dev_acs_enabled {
  	{ PCI_VENDOR_ID_NXP, 0x8d9b, pci_quirk_nxp_rp_acs },
  	/* Zhaoxin Root/Downstream Ports */
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs =
},
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
3-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0003-pcie-Add-quirk-for-the-=
Arm-Neoverse-N1SDP-platform.patch
similarity index 91%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003=
-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0003-p=
cie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
index 4ffe347a..ef2ad8db 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003-pcie-=
Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0003-pcie-=
Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -1,6 +1,6 @@
-From 4877796976647a24a3a9102facd0577586f5ac9a Mon Sep 17 00:00:00 2001
-From: Deepak Pandey <Deepak.Pandey@arm.com>
-Date: Fri, 31 May 2019 16:42:43 +0100
+From e88326f652ac6d126d5df8b3c0b2ac40e8b73797 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Tue, 23 Aug 2022 15:17:28 +0100
 Subject: [PATCH] pcie: Add quirk for the Arm Neoverse N1SDP platform
=20
 The Arm N1SDP SoC suffers from some PCIe integration issues, most
@@ -27,6 +27,8 @@ Signed-off-by: Andre Przywara <andre.przywara@arm.com>
=20
 Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
 Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 ---
  arch/arm64/configs/defconfig        |   1 +
  drivers/acpi/pci_mcfg.c             |   7 +
@@ -38,40 +40,40 @@ Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
  create mode 100644 drivers/pci/controller/pcie-n1sdp.c
=20
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index c27d0fed2ce2..70ed38cecee9 100644
+index 3ccbe378f875..1ce32678ccc7 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -209,6 +209,7 @@ CONFIG_NFC_NCI=3Dm
- CONFIG_NFC_S3FWRN5_I2C=3Dm
- CONFIG_PCI=3Dy
- CONFIG_PCIEPORTBUS=3Dy
+@@ -236,6 +236,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
+ CONFIG_PCI_ENDPOINT=3Dy
+ CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
+ CONFIG_PCI_EPF_TEST=3Dm
 +CONFIG_PCI_QUIRKS=3Dy
- CONFIG_PCI_IOV=3Dy
- CONFIG_PCI_PASID=3Dy
- CONFIG_HOTPLUG_PCI=3Dy
+ CONFIG_DEVTMPFS=3Dy
+ CONFIG_DEVTMPFS_MOUNT=3Dy
+ CONFIG_FW_LOADER_USER_HELPER=3Dy
 diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 63b98eae5e75..67c34e6c24a7 100644
+index 63b98eae5e75..7700d36393ec 100644
 --- a/drivers/acpi/pci_mcfg.c
 +++ b/drivers/acpi/pci_mcfg.c
-@@ -152,6 +152,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
- 	XGENE_V2_ECAM_MCFG(4, 1),
- 	XGENE_V2_ECAM_MCFG(4, 2),
-=20
+@@ -171,6 +171,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
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
+ #endif /* ARM64 */
+ };
 =20
 diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kco=
nfig
-index 326f7d13024f..f9700d037c46 100644
+index b8d96d38064d..3c5a8a218442 100644
 --- a/drivers/pci/controller/Kconfig
 +++ b/drivers/pci/controller/Kconfig
-@@ -46,6 +46,17 @@ config PCI_IXP4XX
+@@ -50,6 +50,17 @@ config PCI_IXP4XX
  	  Say Y here if you want support for the PCI host controller found
  	  in the Intel IXP4xx XScale-based network processor SoC.
 =20
@@ -90,17 +92,17 @@ index 326f7d13024f..f9700d037c46 100644
  	bool "NVIDIA Tegra PCIe controller"
  	depends on ARCH_TEGRA || COMPILE_TEST
 diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Ma=
kefile
-index aaf30b3dcc14..2012ab2b7913 100644
+index 37c8663de7fe..5b8a9535a2f7 100644
 --- a/drivers/pci/controller/Makefile
 +++ b/drivers/pci/controller/Makefile
-@@ -37,6 +37,7 @@ obj-$(CONFIG_VMD) +=3D vmd.o
- obj-$(CONFIG_PCIE_BRCMSTB) +=3D pcie-brcmstb.o
- obj-$(CONFIG_PCI_LOONGSON) +=3D pci-loongson.o
+@@ -39,6 +39,7 @@ obj-$(CONFIG_PCI_LOONGSON) +=3D pci-loongson.o
  obj-$(CONFIG_PCIE_HISI_ERR) +=3D pcie-hisi-error.o
+ obj-$(CONFIG_PCIE_APPLE) +=3D pcie-apple.o
+ obj-$(CONFIG_PCIE_MT7621) +=3D pcie-mt7621.o
 +obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) +=3D pcie-n1sdp.o
+=20
  # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
  obj-y				+=3D dwc/
- obj-y				+=3D mobiveil/
 diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
 new file mode 100644
 index 000000000000..408699b9dcb1
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
4-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0004-n1sdp-pcie-add-quirk-=
support-enabling-remote-chip-PC.patch
similarity index 87%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004=
-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0004-n=
1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
index bd88fa49..10fae06b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp=
-pcie-add-quirk-support-enabling-remote-chip-PC.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0004-n1sdp=
-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -1,12 +1,13 @@
-From 7a5147f51f2eb80ecb6f62a28b8bd86aa5ceebf7 Mon Sep 17 00:00:00 2001
-From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
-Date: Wed, 9 Feb 2022 20:37:43 +0530
+From 74e052b7533827af9f43d093af8f430c99357eac Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Tue, 23 Aug 2022 15:18:38 +0100
 Subject: [PATCH] n1sdp: pcie: add quirk support enabling remote chip PCI=
e
=20
 Base address mapping for remote chip Root PCIe ECAM space.
=20
 When two N1SDP boards are coupled via the CCIX connection, the PCI host
-complex of the remote board appears as PCIe segment 2 on the primary boa=
rd.
+complex of the remote board appears as PCIe segment 2 on the primary
+board.
 The resources of the secondary board, including the host complex, are
 mapped at offset 0x40000000000 into the address space of the primary
 board, so take that into account when accessing the remote PCIe segment.
@@ -19,6 +20,8 @@ Signed-off-by: sahil <sahil@arm.com>
=20
 Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
 Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 ---
  drivers/acpi/pci_mcfg.c             |  1 +
  drivers/pci/controller/pcie-n1sdp.c | 32 +++++++++++++++++++++++++----
@@ -26,17 +29,17 @@ Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak=
@arm.com>
  3 files changed, 30 insertions(+), 4 deletions(-)
=20
 diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 67c34e6c24a7..4584a5a2ca20 100644
+index 7700d36393ec..806ed8dd0d81 100644
 --- a/drivers/acpi/pci_mcfg.c
 +++ b/drivers/acpi/pci_mcfg.c
-@@ -158,6 +158,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
+@@ -178,6 +178,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
  	/* N1SDP SoC with v1 PCIe controller */
  	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
  	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
 +	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
+ #endif /* ARM64 */
+ };
 =20
- #define ALTRA_ECAM_QUIRK(rev, seg) \
- 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
 diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
 index 408699b9dcb1..a03665dd056a 100644
 --- a/drivers/pci/controller/pcie-n1sdp.c
@@ -121,14 +124,14 @@ index 408699b9dcb1..a03665dd056a 100644
  	{ .compatible =3D "arm,n1sdp-pcie", .data =3D &pci_n1sdp_pcie_ecam_ops=
 },
  	{ },
 diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index e6bbc037cef8..d936d3f14bce 100644
+index e6bbc037cef8..7bd8c1d702ee 100644
 --- a/include/linux/pci-ecam.h
 +++ b/include/linux/pci-ecam.h
-@@ -91,6 +91,7 @@ extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_o=
ps; /* Arm N1SDP PCIe */
+@@ -89,6 +89,7 @@ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazo=
n Annapurna Labs PCIe */
+ extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
+ extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP =
PCIe */
  extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP =
PCIe */
++extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm=
 N1SDP PCIe */
  #endif
 =20
-+extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm=
 N1SDP PCIe */
  #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
- /* for DT-based PCI controllers that support ECAM */
- int pci_host_common_probe(struct platform_device *pdev);
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
5-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0005-arm64-kpti-Whitelist-=
early-Arm-Neoverse-N1-revisions.patch
similarity index 79%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005=
-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0005-a=
rm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
index b89c5987..76518ae8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64=
-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0005-arm64=
-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
@@ -1,4 +1,4 @@
-From 85581abbfc7e3df12091c5004788b0729cfd99f1 Mon Sep 17 00:00:00 2001
+From 748cb5125b381330563b5339a4573827b015b0e9 Mon Sep 17 00:00:00 2001
 From: Andre Przywara <andre.przywara@arm.com>
 Date: Fri, 17 May 2019 17:39:27 +0100
 Subject: [PATCH] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
@@ -13,15 +13,17 @@ Signed-off-by: Andre Przywara <andre.przywara@arm.com=
>
=20
 Upstream-Status: Inappropriate
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 ---
  arch/arm64/kernel/cpufeature.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatu=
re.c
-index 3e52a9e8b50b..2e64bc4689a0 100644
+index f34c9f8b9ee0..a778cf472d64 100644
 --- a/arch/arm64/kernel/cpufeature.c
 +++ b/arch/arm64/kernel/cpufeature.c
-@@ -1530,6 +1530,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
+@@ -1589,6 +1589,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/000=
6-arm64-defconfig-disable-config-options-that-does-not.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0006-arm64-defconfig-disab=
le-config-options-that-does-not.patch
new file mode 100644
index 00000000..d761a71f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/0006-arm64=
-defconfig-disable-config-options-that-does-not.patch
@@ -0,0 +1,39 @@
+From ecd97611c3cc5169de45b8d0f87111ed5bb375b8 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 21 Sep 2022 15:54:14 +0100
+Subject: [PATCH] arm64: defconfig: disable config options that does not =
apply
+ anymore
+
+Following config options should be not set to be more accurate and
+works with build system like yocto
+CONFIG_BT_HCIUART_MRVL
+CONFIG_BT_MRVL
+CONFIG_BT_MRVL_SDIO
+CONFIG_BT_QCOMSMD
+
+Upstream-Status: Pending [not submitted upstream yet]
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+---
+ arch/arm64/configs/defconfig | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 1ce32678ccc7..224b0fc152a4 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -191,10 +191,10 @@ CONFIG_BT_HCIUART=3Dm
+ CONFIG_BT_HCIUART_LL=3Dy
+ CONFIG_BT_HCIUART_BCM=3Dy
+ CONFIG_BT_HCIUART_QCA=3Dy
+-CONFIG_BT_HCIUART_MRVL=3Dy
+-CONFIG_BT_MRVL=3Dm
+-CONFIG_BT_MRVL_SDIO=3Dm
+-CONFIG_BT_QCOMSMD=3Dm
++# CONFIG_BT_HCIUART_MRVL is not set
++# CONFIG_BT_MRVL is not set
++# CONFIG_BT_MRVL_SDIO is not set
++# CONFIG_BT_QCOMSMD is not set
+ CONFIG_CFG80211=3Dm
+ CONFIG_MAC80211=3Dm
+ CONFIG_MAC80211_LEDS=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/ena=
ble-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.1=
9/n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/enab=
le-realtek-R8169.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/enable=
-realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/ena=
ble-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.1=
9/n1sdp/enable-usb_conn_gpio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/enab=
le-usb_conn_gpio.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/enable=
-usb_conn_gpio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/usb=
_xhci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.1=
9/n1sdp/usb_xhci_pci_renesas.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/usb_=
xhci_pci_renesas.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1sdp/usb_xh=
ci_pci_renesas.cfg
--=20
2.37.3


