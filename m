Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4145.1610576496128427153
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Jan 2021 14:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3150B1FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Jan 2021 14:21:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B0A43F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Jan 2021 14:21:34 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/n1sdp: port and migrate to linux yocto kernel 5.10
Date: Wed, 13 Jan 2021 22:21:28 +0000
Message-Id: <20210113222128.2093013-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Khasim Mohammed <khasim.mohammed@arm.com>

This commit includes :
    - rebased and fixed kernel 5.4 PCIe quirk patches to apply on 5.10
    - pci probe in n1sdp driver is modified to use 5.10 structure
    - USB_CON_GPIO config is added to remove build time warning
    - Updated n1sdp conf to use 5.10 yocto kernel
    - Fix defconfig to not use obsolete symbols (RB)

Change-Id: I9e3d3945057ac09768a4a4e4d7a3033138925955
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |   6 +-
 .../linux/linux-arm-platforms.inc             |  19 +
 ...drop-unused-BACKLIGHT_GENERIC-option.patch |  41 +++
 ...irk-add-acs-override-for-PCI-devices.patch | 161 +++++++++
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 329 ++++++++++++++++++
 ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  58 +++
 ...uirk-support-enabling-remote-chip-PC.patch | 137 ++++++++
 ...id-duplicate-sysfs-entry-creation-er.patch |  45 +++
 .../n1sdp/enable-realtek-R8169.cfg            |   3 +
 .../n1sdp/enable-usb_conn_gpio.cfg            |   2 +
 .../linux-yocto-5.10/n1sdp/no-power-avs.patch |  29 ++
 11 files changed, 827 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/enable-realtek-R8169.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/enable-usb_conn_gpio.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/no-power-avs.patch

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 67363ac..0fc4bb8 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -17,9 +17,9 @@ WKS_FILE ?=3D "n1sdp-efidisk.wks"
 IMAGE_EFI_BOOT_FILES ?=3D "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
 WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
-# Use kernel provided by linaro (Contains support for SCMi or HDMI)
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
-PREFERRED_VERSION_linux-linaro-arm ?=3D "5.4%"
+# Use kernel provided by yocto
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
=20
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 1c9fdc1..2165b0e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -78,6 +78,25 @@ SRC_URI_append_tc0 =3D " \
     file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.pat=
ch \
     "
=20
+#
+# N1SDP KMACHINE
+#
+FILESEXTRAPATHS_prepend_n1sdp :=3D "${THISDIR}/linux-yocto-5.10/n1sdp:"
+COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
+KBUILD_DEFCONFIG_n1sdp =3D "defconfig"
+KCONFIG_MODE_n1sdp =3D "--alldefconfig"
+SRC_URI_append_n1sdp =3D " \
+    file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
+    file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
+    file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.pat=
ch \
+    file://0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.pat=
ch \
+    file://0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.pat=
ch \
+    file://no-power-avs.patch \
+    file://enable-realtek-R8169.cfg \
+    file://enable-usb_conn_gpio.cfg \
+    "
+
 #
 # Musca B1/S2 can't run Linux
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/000=
1-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-arm64-defconfig-drop-=
unused-BACKLIGHT_GENERIC-option.patch
new file mode 100644
index 0000000..88a65fb
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-arm64=
-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 717c4c8336486781630893508b3347ae18953fae Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
+Date: Tue, 1 Dec 2020 22:29:19 +0000
+Subject: [PATCH] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
+
+Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
+unused") removed geenric_bl driver from the tree, together with
+corresponding config option.
+
+Remove BACKLIGHT_GENERIC config item from arm64 configuration.
+
+Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is=
 unused")
+Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
+Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
+Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
+Acked-by: Sam Ravnborg <sam@ravnborg.org>
+Cc: Sam Ravnborg <sam@ravnborg.org>
+Link: https://lore.kernel.org/r/20201201222922.3183-3-andrey.zhizhikin@l=
eica-geosystems.com'
+Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+---
+ arch/arm64/configs/defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 98e15de04c5d..6493079e2c54 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -698,7 +698,6 @@ CONFIG_DRM_PANFROST=3Dm
+ CONFIG_FB=3Dy
+ CONFIG_FB_MODE_HELPERS=3Dy
+ CONFIG_FB_EFI=3Dy
+-CONFIG_BACKLIGHT_GENERIC=3Dm
+ CONFIG_BACKLIGHT_PWM=3Dm
+ CONFIG_BACKLIGHT_LP855X=3Dm
+ CONFIG_LOGO=3Dy
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/000=
1-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipes=
-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-=
PCI-devices.patch
new file mode 100644
index 0000000..aa4e9e4
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_q=
uirk-add-acs-override-for-PCI-devices.patch
@@ -0,0 +1,161 @@
+From cfe5f638279e99cfc991cb38635cb9083c71f1e2 Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Mon, 4 Jan 2021 18:03:00 +0000
+Subject: [PATCH 1/4] pci_quirk: add acs override for PCI devices
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Patch taken from:
+https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/=
5.4/acso.patch
+
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+---
+ .../admin-guide/kernel-parameters.txt         |   9 ++
+ drivers/pci/quirks.c                          | 102 ++++++++++++++++++
+ 2 files changed, 111 insertions(+)
+
+diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
+index 44fde25bb221..866a8eac8c3f 100644
+--- a/Documentation/admin-guide/kernel-parameters.txt
++++ b/Documentation/admin-guide/kernel-parameters.txt
+@@ -3629,6 +3629,15 @@
+ 		nomsi		[MSI] If the PCI_MSI kernel config parameter is
+ 				enabled, this kernel boot option can be used to
+ 				disable the use of MSI interrupts system-wide.
++		pcie_acs_override =3D
++					[PCIE] Override missing PCIe ACS support for:
++				downstream
++					All downstream ports - full ACS capabilities
++				multfunction
++					All multifunction devices - multifunction ACS subset
++				id:nnnn:nnnn
++					Specfic device - full ACS capabilities
++					Specified as vid:did (vendor/device ID) in hex
+ 		noioapicquirk	[APIC] Disable all boot interrupt quirks.
+ 				Safety option to keep boot IRQs enabled. This
+ 				should never be necessary.
+diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
+index f70692ac79c5..bc758323c8f3 100644
+--- a/drivers/pci/quirks.c
++++ b/drivers/pci/quirks.c
+@@ -3557,6 +3557,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
+ 	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
+ }
+=20
++static bool acs_on_downstream;
++static bool acs_on_multifunction;
++
++#define NUM_ACS_IDS 16
++struct acs_on_id {
++	unsigned short vendor;
++	unsigned short device;
++};
++static struct acs_on_id acs_on_ids[NUM_ACS_IDS];
++static u8 max_acs_id;
++
++static __init int pcie_acs_override_setup(char *p)
++{
++	if (!p)
++		return -EINVAL;
++
++	while (*p) {
++		if (!strncmp(p, "downstream", 10))
++			acs_on_downstream =3D true;
++		if (!strncmp(p, "multifunction", 13))
++			acs_on_multifunction =3D true;
++		if (!strncmp(p, "id:", 3)) {
++			char opt[5];
++			int ret;
++			long val;
++
++			if (max_acs_id >=3D NUM_ACS_IDS - 1) {
++				pr_warn("Out of PCIe ACS override slots (%d)\n",
++						NUM_ACS_IDS);
++				goto next;
++			}
++
++			p +=3D 3;
++			snprintf(opt, 5, "%s", p);
++			ret =3D kstrtol(opt, 16, &val);
++			if (ret) {
++				pr_warn("PCIe ACS ID parse error %d\n", ret);
++				goto next;
++			}
++			acs_on_ids[max_acs_id].vendor =3D val;
++
++			p +=3D strcspn(p, ":");
++			if (*p !=3D ':') {
++				pr_warn("PCIe ACS invalid ID\n");
++				goto next;
++			}
++
++			p++;
++			snprintf(opt, 5, "%s", p);
++			ret =3D kstrtol(opt, 16, &val);
++			if (ret) {
++				pr_warn("PCIe ACS ID parse error %d\n", ret);
++				goto next;
++			}
++			acs_on_ids[max_acs_id].device =3D val;
++			max_acs_id++;
++		}
++next:
++		p +=3D strcspn(p, ",");
++		if (*p =3D=3D ',')
++			p++;
++	}
++
++	if (acs_on_downstream || acs_on_multifunction || max_acs_id)
++		pr_warn("Warning: PCIe ACS overrides enabled; This may allow non-IOMM=
U protected peer-to-peer DMA\n");
++
++	return 0;
++}
++early_param("pcie_acs_override", pcie_acs_override_setup);
++
++static int pcie_acs_overrides(struct pci_dev *dev, u16 acs_flags)
++{
++	int i;
++
++	/* Never override ACS for legacy devices or devices with ACS caps */
++	if (!pci_is_pcie(dev) ||
++		pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS))
++			return -ENOTTY;
++
++	for (i =3D 0; i < max_acs_id; i++)
++		if (acs_on_ids[i].vendor =3D=3D dev->vendor &&
++			acs_on_ids[i].device =3D=3D dev->device)
++				return 1;
++
++	switch (pci_pcie_type(dev)) {
++	case PCI_EXP_TYPE_DOWNSTREAM:
++	case PCI_EXP_TYPE_ROOT_PORT:
++		if (acs_on_downstream)
++			return 1;
++		break;
++	case PCI_EXP_TYPE_ENDPOINT:
++	case PCI_EXP_TYPE_UPSTREAM:
++	case PCI_EXP_TYPE_LEG_END:
++	case PCI_EXP_TYPE_RC_END:
++		if (acs_on_multifunction && dev->multifunction)
++			return 1;
++	}
++
++	return -ENOTTY;
++}
++
+ /*
+  * Some Atheros AR9xxx and QCA988x chips do not behave after a bus rese=
t.
+  * The device will throw a Link Down error on AER-capable systems and
+@@ -4769,6 +4870,7 @@ static const struct pci_dev_acs_enabled {
+ 	{ PCI_VENDOR_ID_ZHAOXIN, 0x9083, pci_quirk_mf_endpoint_acs },
+ 	/* Zhaoxin Root/Downstream Ports */
+ 	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs =
},
++	{ PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
+ 	{ 0 }
+ };
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/000=
2-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-=
Arm-Neoverse-N1SDP-platform.patch
new file mode 100644
index 0000000..7b35e3b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-=
Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -0,0 +1,329 @@
+From 5b9fd8da4deaabcd854c49286bf5c57c661e122f Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Mon, 4 Jan 2021 18:34:46 +0000
+Subject: [PATCH 2/4] pcie: Add quirk for the Arm Neoverse N1SDP platform
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
+
+The patch is taken from :
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tr=
ee/linux
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+The Arm N1SDP SoC suffers from some PCIe integration issues, most
+prominently config space accesses to not existing BDFs being answered
+with a bus abort, resulting in an SError.
+To mitigate this, the firmware scans the bus before boot (catching the
+SErrors) and creates a table with valid BDFs, which acts as a filter for
+Linux' config space accesses.
+
+Add code consulting the table as an ACPI PCIe quirk, also register the
+corresponding device tree based description of the host controller.
+Also fix the other two minor issues on the way, namely not being fully
+ECAM compliant and config space accesses being restricted to 32-bit
+accesses only.
+
+This allows the Arm Neoverse N1SDP board to boot Linux without crashing
+and to access *any* devices (there are no platform devices except UART).
+
+Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
+[Sudipto: extend to cover the CCIX root port as well]
+Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
+[Andre: fix coding style issues, rewrite some parts, add DT support]
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+[Khasim: port the patch to linux kernel 5.10]
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+---
+ arch/arm64/configs/defconfig        |   1 +
+ drivers/acpi/pci_mcfg.c             |   7 +
+ drivers/pci/controller/Kconfig      |  11 ++
+ drivers/pci/controller/Makefile     |   1 +
+ drivers/pci/controller/pcie-n1sdp.c | 198 ++++++++++++++++++++++++++++
+ include/linux/pci-ecam.h            |   2 +
+ 6 files changed, 220 insertions(+)
+ create mode 100644 drivers/pci/controller/pcie-n1sdp.c
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 5cfe3cf6f2ac..a035dcd7055d 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -205,6 +205,7 @@ CONFIG_NFC_NCI=3Dm
+ CONFIG_NFC_S3FWRN5_I2C=3Dm
+ CONFIG_PCI=3Dy
+ CONFIG_PCIEPORTBUS=3Dy
++CONFIG_PCI_QUIRKS=3Dy
+ CONFIG_PCI_IOV=3Dy
+ CONFIG_PCI_PASID=3Dy
+ CONFIG_HOTPLUG_PCI=3Dy
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index 95f23acd5b80..f7a7d6e87780 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -143,6 +143,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
+ 	XGENE_V2_ECAM_MCFG(4, 1),
+ 	XGENE_V2_ECAM_MCFG(4, 2),
+=20
++#define N1SDP_ECAM_MCFG(rev, seg, ops) \
++	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
++
++	/* N1SDP SoC with v1 PCIe controller */
++	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
++
+ #define ALTRA_ECAM_QUIRK(rev, seg) \
+ 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
+=20
+diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kco=
nfig
+index 64e2f5e379aa..df10736b2d9e 100644
+--- a/drivers/pci/controller/Kconfig
++++ b/drivers/pci/controller/Kconfig
+@@ -37,6 +37,17 @@ config PCI_FTPCI100
+ 	depends on OF
+ 	default ARCH_GEMINI
+=20
++config PCIE_HOST_N1SDP_ECAM
++	bool "ARM N1SDP PCIe Controller"
++	depends on ARM64
++	depends on OF || (ACPI && PCI_QUIRKS)
++	select PCI_HOST_COMMON
++	default y if ARCH_VEXPRESS
++	help
++	  Say Y here if you want PCIe support for the Arm N1SDP platform.
++	  The controller is ECAM compliant, but needs a quirk to workaround
++	  an integration issue.
++
+ config PCI_TEGRA
+ 	bool "NVIDIA Tegra PCIe controller"
+ 	depends on ARCH_TEGRA || COMPILE_TEST
+diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Ma=
kefile
+index 04c6edc285c5..6e5c3dcae8d3 100644
+--- a/drivers/pci/controller/Makefile
++++ b/drivers/pci/controller/Makefile
+@@ -29,6 +29,7 @@ obj-$(CONFIG_PCIE_ROCKCHIP_HOST) +=3D pcie-rockchip-ho=
st.o
+ obj-$(CONFIG_PCIE_MEDIATEK) +=3D pcie-mediatek.o
+ obj-$(CONFIG_PCIE_TANGO_SMP8759) +=3D pcie-tango.o
+ obj-$(CONFIG_VMD) +=3D vmd.o
++obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) +=3D pcie-n1sdp.o
+ obj-$(CONFIG_PCIE_BRCMSTB) +=3D pcie-brcmstb.o
+ obj-$(CONFIG_PCI_LOONGSON) +=3D pci-loongson.o
+ obj-$(CONFIG_PCIE_HISI_ERR) +=3D pcie-hisi-error.o
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
+new file mode 100644
+index 000000000000..327aee9c5564
+--- /dev/null
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -0,0 +1,198 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Copyright (C) 2018/2019 ARM Ltd.
++ *
++ * This quirk is to mask the following issues:
++ * - PCIE SLVERR: config space accesses to invalid PCIe BDFs cause a bu=
s
++ *		  error (signalled as an asynchronous SError)
++ * - MCFG BDF mapping: the root complex is mapped separately from the d=
evice
++ *		       config space
++ * - Non 32-bit accesses to config space are not supported.
++ *
++ * At boot time the SCP board firmware creates a discovery table with
++ * the root complex' base address and the valid BDF values, discovered =
while
++ * scanning the config space and catching the SErrors.
++ * Linux responds only to the EPs listed in this table, returning NULL
++ * for the rest.
++ */
++
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/ioport.h>
++#include <linux/sizes.h>
++#include <linux/of_pci.h>
++#include <linux/of.h>
++#include <linux/pci-ecam.h>
++#include <linux/platform_device.h>
++#include <linux/module.h>
++
++/* Platform specific values as hardcoded in the firmware. */
++#define AP_NS_SHARED_MEM_BASE	0x06000000
++#define MAX_SEGMENTS		2
++#define BDF_TABLE_SIZE		SZ_16K
++
++/*
++ * Shared memory layout as written by the SCP upon boot time:
++ *  ----
++ *  Discover data header --> RC base address
++ *                       \-> BDF Count
++ *  Discover data        --> BDF 0...n
++ *  ----
++ */
++struct pcie_discovery_data {
++	u32 rc_base_addr;
++	u32 nr_bdfs;
++	u32 valid_bdfs[0];
++} *pcie_discovery_data[MAX_SEGMENTS];
++
++void __iomem *rc_remapped_addr[MAX_SEGMENTS];
++
++/*
++ * map_bus() is called before we do a config space access for a certain
++ * device. We use this to check whether this device is valid, avoiding
++ * config space accesses which would result in an SError otherwise.
++ */
++static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned in=
t devfn,
++				       int where)
++{
++	struct pci_config_window *cfg =3D bus->sysdata;
++	unsigned int devfn_shift =3D cfg->ops->bus_shift - 8;
++	unsigned int busn =3D bus->number;
++	unsigned int segment =3D bus->domain_nr;
++	unsigned int bdf_addr;
++	unsigned int table_count, i;
++
++	if (segment >=3D MAX_SEGMENTS ||
++	    busn < cfg->busr.start || busn > cfg->busr.end)
++		return NULL;
++
++	/* The PCIe root complex has a separate config space mapping. */
++	if (busn =3D=3D 0 && devfn =3D=3D 0)
++		return rc_remapped_addr[segment] + where;
++
++	busn -=3D cfg->busr.start;
++	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
++	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
++	for (i =3D 0; i < table_count; i++) {
++		if (bdf_addr =3D=3D pcie_discovery_data[segment]->valid_bdfs[i])
++			return pci_ecam_map_bus(bus, devfn, where);
++	}
++
++	return NULL;
++}
++
++static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int s=
egment)
++{
++	phys_addr_t table_base;
++	struct device *dev =3D cfg->parent;
++	struct pcie_discovery_data *shared_data;
++	size_t bdfs_size;
++
++	if (segment >=3D MAX_SEGMENTS)
++		return -ENODEV;
++
++	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++
++	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
++				"PCIe valid BDFs")) {
++		dev_err(dev, "PCIe BDF shared region request failed\n");
++		return -ENOMEM;
++	}
++
++	shared_data =3D devm_ioremap(dev,
++				   table_base, BDF_TABLE_SIZE);
++	if (!shared_data)
++		return -ENOMEM;
++
++	/* Copy the valid BDFs structure to allocated normal memory. */
++	bdfs_size =3D sizeof(struct pcie_discovery_data) +
++		    sizeof(u32) * shared_data->nr_bdfs;
++	pcie_discovery_data[segment] =3D devm_kmalloc(dev, bdfs_size, GFP_KERN=
EL);
++	if (!pcie_discovery_data[segment])
++		return -ENOMEM;
++
++	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
++
++	rc_remapped_addr[segment] =3D devm_ioremap(dev,
++						shared_data->rc_base_addr,
++						PCI_CFG_SPACE_EXP_SIZE);
++	if (!rc_remapped_addr[segment]) {
++		dev_err(dev, "Cannot remap root port base\n");
++		return -ENOMEM;
++	}
++
++	devm_iounmap(dev, shared_data);
++
++	return 0;
++}
++
++static int pci_n1sdp_pcie_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 0);
++}
++
++static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 1);
++}
++
++const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
++	.bus_shift	=3D 20,
++	.init		=3D pci_n1sdp_pcie_init,
++	.pci_ops	=3D {
++		.map_bus        =3D pci_n1sdp_map_bus,
++		.read           =3D pci_generic_config_read32,
++		.write          =3D pci_generic_config_write32,
++	}
++};
++
++const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D {
++	.bus_shift	=3D 20,
++	.init		=3D pci_n1sdp_ccix_init,
++	.pci_ops	=3D {
++		.map_bus        =3D pci_n1sdp_map_bus,
++		.read           =3D pci_generic_config_read32,
++		.write          =3D pci_generic_config_write32,
++	}
++};
++
++struct of_device_id n1sdp_pcie_of_match[] =3D {
++	{ .compatible =3D "arm,n1sdp-pcie" },
++	{ },
++};
++MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
++
++static int n1sdp_pcie_probe(struct platform_device *pdev)
++{
++	const struct device_node *of_node =3D pdev->dev.of_node;
++	u32 segment;
++
++	if (of_property_read_u32(of_node, "linux,pci-domain", &segment)) {
++		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain p=
roperty\n");
++		return -EINVAL;
++	}
++
++	switch (segment) {
++	case 0:
++		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_pcie_ecam_ops;
++		return pci_host_common_probe(pdev);
++	case 1:
++		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_ccix_ecam_ops;
++		return pci_host_common_probe(pdev);
++	}
++
++	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n=
",
++		MAX_SEGMENTS);
++
++	return -EINVAL;
++}
++
++static struct platform_driver n1sdp_pcie_driver =3D {
++	.driver =3D {
++		.name =3D KBUILD_MODNAME,
++		.of_match_table =3D n1sdp_pcie_of_match,
++		.suppress_bind_attrs =3D true,
++	},
++	.probe =3D n1sdp_pcie_probe,
++};
++builtin_platform_driver(n1sdp_pcie_driver);
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index 033ce74f02e8..d3959ada44af 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -58,6 +58,8 @@ extern const struct pci_ecam_ops pci_thunder_ecam_ops;=
 /* Cavium ThunderX 1.x */
+ extern const struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene =
PCIe v1 */
+ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene =
PCIe v2.x */
+ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs =
PCIe */
++extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP =
PCIe */
++extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP =
PCIe */
+ #endif
+=20
+ #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/000=
3-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-qui=
rk-for-SR-IOV-support.patch
new file mode 100644
index 0000000..5a53460
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp=
-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
@@ -0,0 +1,58 @@
+From f3662513b224d9704355afc61a9dc26493bbdf13 Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 5 Jan 2021 17:57:46 +0000
+Subject: [PATCH 3/4] n1sdp: update n1sdp pci quirk for SR-IOV support
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
+
+The patch is taken from:
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tr=
ee/linux
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+VFs are not probing the vendor ID first, which is otherwise
+the gate keeper for undiscovered devices. So any accesses using
+a config space offset greater than 0 must be coming for an
+already discovered device or from a VF that has just been created.
+
+Also if Linux already has a struct pci_dev* for a given BDF,
+this device is safe to access.
+
+Skip the firmware table in these cases and allow accesses to
+those devices. That enables SR-IOV support on the N1SDP board.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+---
+ drivers/pci/controller/pcie-n1sdp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
+index 327aee9c5564..45bbe506045a 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -61,6 +61,7 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus =
*bus, unsigned int devfn,
+ 	unsigned int segment =3D bus->domain_nr;
+ 	unsigned int bdf_addr;
+ 	unsigned int table_count, i;
++	struct pci_dev *dev;
+=20
+ 	if (segment >=3D MAX_SEGMENTS ||
+ 	    busn < cfg->busr.start || busn > cfg->busr.end)
+@@ -70,6 +71,14 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus=
 *bus, unsigned int devfn,
+ 	if (busn =3D=3D 0 && devfn =3D=3D 0)
+ 		return rc_remapped_addr[segment] + where;
+=20
++	dev =3D pci_get_domain_bus_and_slot(segment, busn, devfn);
++	if (dev && dev->is_virtfn)
++		return pci_ecam_map_bus(bus, devfn, where);
++
++	/* Accesses beyond the vendor ID always go to existing devices. */
++	if (where > 0)
++		return pci_ecam_map_bus(bus, devfn, where);
++
+ 	busn -=3D cfg->busr.start;
+ 	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
+ 	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/000=
4-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-=
support-enabling-remote-chip-PC.patch
new file mode 100644
index 0000000..10a59e8
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp=
-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -0,0 +1,137 @@
+From 604e0130dff007f28a510291064edf20aff3ddea Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 5 Jan 2021 18:20:16 +0000
+Subject: [PATCH 4/4] n1sdp: pcie: add quirk support enabling remote chip=
 PCIe
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
+
+This patch is picked from the git repository and ported 5.10:
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/pa=
tch/?id=3D04b7e76d0fe6481a803f58e54e008a1489d713a5
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Base address mapping for remote chip Root PCIe ECAM space.
+
+Remote Chip PCIe topology is enumerated in Firmware and current
+change takes referecne of enumerated PCIe hierarchy of Remote chip into =
the
+kernel and include in complete PCIe topology for kernel framework.
+
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+---
+ drivers/acpi/pci_mcfg.c             |  1 +
+ drivers/pci/controller/pcie-n1sdp.c | 36 ++++++++++++++++++++++++++---
+ include/linux/pci-ecam.h            |  1 +
+ 3 files changed, 35 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index f7a7d6e87780..0523f485c930 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -149,6 +149,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
+ 	/* N1SDP SoC with v1 PCIe controller */
+ 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
+ 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
+=20
+ #define ALTRA_ECAM_QUIRK(rev, seg) \
+ 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
+index 45bbe506045a..01f601e36343 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -28,8 +28,11 @@
+=20
+ /* Platform specific values as hardcoded in the firmware. */
+ #define AP_NS_SHARED_MEM_BASE	0x06000000
+-#define MAX_SEGMENTS		2
++
++/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip*/
++#define MAX_SEGMENTS		3
+ #define BDF_TABLE_SIZE		SZ_16K
++#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
+=20
+ /*
+  * Shared memory layout as written by the SCP upon boot time:
+@@ -100,7 +103,10 @@ static int pci_n1sdp_init(struct pci_config_window =
*cfg, unsigned int segment)
+ 	if (segment >=3D MAX_SEGMENTS)
+ 		return -ENODEV;
+=20
+-	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++	if (segment > 1)
++		table_base =3D AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
++	else
++		table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
+=20
+ 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
+ 				"PCIe valid BDFs")) {
+@@ -122,9 +128,15 @@ static int pci_n1sdp_init(struct pci_config_window =
*cfg, unsigned int segment)
+=20
+ 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
+=20
+-	rc_remapped_addr[segment] =3D devm_ioremap(dev,
++	if (segment > 1)
++		rc_remapped_addr[segment] =3D devm_ioremap(dev,
++						shared_data->rc_base_addr + REMOTE_CHIP_ADDR_OFFSET,
++						PCI_CFG_SPACE_EXP_SIZE);
++	else
++		rc_remapped_addr[segment] =3D devm_ioremap(dev,
+ 						shared_data->rc_base_addr,
+ 						PCI_CFG_SPACE_EXP_SIZE);
++
+ 	if (!rc_remapped_addr[segment]) {
+ 		dev_err(dev, "Cannot remap root port base\n");
+ 		return -ENOMEM;
+@@ -145,6 +157,11 @@ static int pci_n1sdp_ccix_init(struct pci_config_wi=
ndow *cfg)
+ 	return pci_n1sdp_init(cfg, 1);
+ }
+=20
++static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 2);
++}
++
+ const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
+ 	.bus_shift	=3D 20,
+ 	.init		=3D pci_n1sdp_pcie_init,
+@@ -165,6 +182,16 @@ const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D=
 {
+ 	}
+ };
+=20
++const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops =3D {
++	.bus_shift	=3D 20,
++	.init		=3D pci_n1sdp_remote_pcie_init,
++	.pci_ops	=3D {
++		.map_bus	=3D pci_n1sdp_map_bus,
++		.read		=3D pci_generic_config_read32,
++		.write		=3D pci_generic_config_write32,
++	}
++};
++
+ struct of_device_id n1sdp_pcie_of_match[] =3D {
+ 	{ .compatible =3D "arm,n1sdp-pcie" },
+ 	{ },
+@@ -188,6 +215,9 @@ static int n1sdp_pcie_probe(struct platform_device *=
pdev)
+ 	case 1:
+ 		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_ccix_ecam_ops;
+ 		return pci_host_common_probe(pdev);
++	case 2:
++		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_remote_pcie_ecam_ops;
++		return pci_host_common_probe(pdev);
+ 	}
+=20
+ 	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n=
",
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index d3959ada44af..08d9684b7dc8 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -60,6 +60,7 @@ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_op=
s; /* APM X-Gene PCIe v2.x
+ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs =
PCIe */
+ extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP =
PCIe */
+ extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP =
PCIe */
++extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm=
 N1SDP PCIe */
+ #endif
+=20
+ #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/000=
5-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-du=
plicate-sysfs-entry-creation-er.patch
new file mode 100644
index 0000000..143f78b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169=
-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch
@@ -0,0 +1,45 @@
+From 914fe7871fc2f00ec94cd4d17722158e94fa88df Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Fri, 8 Jan 2021 04:21:23 +0000
+Subject: [PATCH] r8169: Fix to avoid duplicate sysfs entry creation erro=
r
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending [yet to submit]
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Patch taken from :
+https://git.linaro.org/landing-teams/working/arm/kernel-release.git/comm=
it/?h=3Dn1sdp&id=3D84baaae9e751c058717d9702438429257f077f03
+
+Following error observed with r8169 driver, this patch fix the issue.
+
+[ 27.544136] r8169 0002:07:00.0: enabling device (0000 -> 0003)
+[ 27.559734] sysfs: cannot create duplicate filename '/class/mdio_bus/r8=
169-700'
+=E2=80=A6
+[ 27.684858] libphy: mii_bus r8169-700 failed to register
+[ 27.695602] r8169: probe of 0002:07:00.0 failed with error -22
+
+Change-Id: Id696abbabd794ecef5c551c5c45630963d9502a6
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+---
+ drivers/net/ethernet/realtek/r8169_main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/eth=
ernet/realtek/r8169_main.c
+index 85d9c3e30c69..6d6b24978fd5 100644
+--- a/drivers/net/ethernet/realtek/r8169_main.c
++++ b/drivers/net/ethernet/realtek/r8169_main.c
+@@ -5088,7 +5088,7 @@ static int r8169_mdio_register(struct rtl8169_priv=
ate *tp)
+ 	new_bus->priv =3D tp;
+ 	new_bus->parent =3D &pdev->dev;
+ 	new_bus->irq[0] =3D PHY_IGNORE_INTERRUPT;
+-	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x", pci_dev_id(pdev));
++	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x-%x", pdev->bus->domai=
n_nr, pci_dev_id(pdev));
+=20
+ 	new_bus->read =3D r8169_mdio_read_reg;
+ 	new_bus->write =3D r8169_mdio_write_reg;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/ena=
ble-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.1=
0/n1sdp/enable-realtek-R8169.cfg
new file mode 100644
index 0000000..7a57474
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-rea=
ltek-R8169.cfg
@@ -0,0 +1,3 @@
+# Enable Realtek Gigabit Ethernet adapter
+CONFIG_REALTEK_PHY=3Dy
+CONFIG_R8169=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/ena=
ble-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.1=
0/n1sdp/enable-usb_conn_gpio.cfg
new file mode 100644
index 0000000..128c902
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb=
_conn_gpio.cfg
@@ -0,0 +1,2 @@
+# PHY_TEGRA_XUSB sets this to y, but its set as m in defconfig
+CONFIG_USB_CONN_GPIO=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/no-=
power-avs.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/no-power-avs.patch
new file mode 100644
index 0000000..a8c608c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/no-power-a=
vs.patch
@@ -0,0 +1,29 @@
+Remove CONFIG_POWER_AVS, this config option was removed in 785b5bb41b0a.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/mult=
i_v7_defconfig
+index c5f25710fedc..62650dc10119 100644
+--- a/arch/arm/configs/multi_v7_defconfig
++++ b/arch/arm/configs/multi_v7_defconfig
+@@ -475,7 +475,6 @@ CONFIG_GPIO_TPS6586X=3Dy
+ CONFIG_GPIO_TPS65910=3Dy
+ CONFIG_GPIO_TWL4030=3Dy
+ CONFIG_GPIO_MXC=3Dy
+-CONFIG_POWER_AVS=3Dy
+ CONFIG_ROCKCHIP_IODOMAIN=3Dy
+ CONFIG_POWER_RESET_AS3722=3Dy
+ CONFIG_POWER_RESET_GPIO=3Dy
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 838301650a79..1146f2904bff 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -523,7 +523,6 @@ CONFIG_GPIO_PCA953X_IRQ=3Dy
+ CONFIG_GPIO_BD9571MWV=3Dm
+ CONFIG_GPIO_MAX77620=3Dy
+ CONFIG_GPIO_SL28CPLD=3Dm
+-CONFIG_POWER_AVS=3Dy
+ CONFIG_QCOM_CPR=3Dy
+ CONFIG_ROCKCHIP_IODOMAIN=3Dy
+ CONFIG_POWER_RESET_MSM=3Dy
--=20
2.25.1

