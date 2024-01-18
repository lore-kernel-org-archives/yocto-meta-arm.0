Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B77C47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 17:05:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18351.1705597497504445033
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jan 2024 09:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 303B911FB;
	Thu, 18 Jan 2024 09:05:42 -0800 (PST)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.199.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34CCC3F5A1;
	Thu, 18 Jan 2024 09:04:55 -0800 (PST)
From: vikas.katariya@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH 1/2] arm-bsp/n1sdp: Downgrade to 6.1 linux yocto kernel
Date: Thu, 18 Jan 2024 17:04:44 +0000
Message-Id: <20240118170445.564619-2-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118170445.564619-1-vikas.katariya@arm.com>
References: <20240118170445.564619-1-vikas.katariya@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jan 2024 17:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5342

From: Vikas Katariya <vikas.katariya@arm.com>

Since linux yocto kernel 6.5 is EOL and other layers like
meta-virtualization dropping support for it, it would be
sensible to downgrade the kernel to 6.1 which is a LTS.

This is a temporary change and later we would move to 6.6 when its
officially supported on N1SDP.

This revert the following commits:
* 1fe76c893cfa7496b2ae089707b5fc98e07a1900
* 21df60b921e0ec95df6723c8ee6cce617c96e2f0
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  2 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 14 +++++++------
 ...irk-add-acs-override-for-PCI-devices.patch | 15 ++++++-------
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 21 ++++++++++---------
 ...uirk-support-enabling-remote-chip-PC.patch |  2 +-
 ...list-early-Arm-Neoverse-N1-revisions.patch |  6 +++---
 ...disable-config-options-that-does-not.patch | 21 +++++--------------
 .../n1sdp/enable-nvme.cfg                     |  0
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 12 files changed, 38 insertions(+), 45 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.p=
atch (83%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch=
 (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.pat=
ch (95%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.p=
atch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.p=
atch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.p=
atch (65%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 2a246de0..51b6d56f 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -19,7 +19,7 @@ WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.5%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.1%"
=20
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 6c132c97..f43bbd63 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -67,7 +67,7 @@ COMPATIBLE_MACHINE:musca-s1 =3D "(^$)"
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-6.5/n1sdp:"
+FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-6.1/n1sdp:"
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
 KBUILD_DEFCONFIG:n1sdp =3D "defconfig"
 KCONFIG_MODE:n1sdp =3D "--alldefconfig"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0001=
-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-arm-smmu-v3-worka=
round-for-ATC_INV_SIZE_ALL-in.patch
similarity index 83%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0001-=
iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-io=
mmu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
index df7586cf..d7a47c65 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0001-iommu-=
arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-iommu-=
arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
@@ -1,4 +1,4 @@
-From 63da10da7a57776196a3c323e93ef66f1d553c0c Mon Sep 17 00:00:00 2001
+From 32ae4539865e64bcfb0c6955bdac8db5904e493d Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Mon, 1 Feb 2021 21:36:43 +0530
 Subject: [PATCH] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in N=
1SDP
@@ -9,9 +9,11 @@ N1SDP platform. This workaround manually sets the ATS ad=
dress
 field to proper value for ATC_INV_SIZE_ALL command.
=20
 Change-Id: If89465be94720a62be85e1e6612f17e93fa9b8a5
-Upstream-Status: Inappropriate [Workaround]
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Upstream-Status: Inappropriate [Workaround]
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 ---
@@ -20,10 +22,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.c
-index 6ccbae9b93a1..5387f152fb07 100644
+index d4d8bfee9feb..0524bf2ec021 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-@@ -1753,6 +1753,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
+@@ -1738,6 +1738,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
  	};
 =20
  	if (!size) {
@@ -32,10 +34,10 @@ index 6ccbae9b93a1..5387f152fb07 100644
  		return;
  	}
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.h
-index dcab85698a4e..12e12d03eebf 100644
+index cd48590ada30..20892b2bfe1d 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
-@@ -478,6 +478,7 @@ struct arm_smmu_cmdq_ent {
+@@ -472,6 +472,7 @@ struct arm_smmu_cmdq_ent {
 =20
  		#define CMDQ_OP_ATC_INV		0x40
  		#define ATC_INV_SIZE_ALL	52
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0002=
-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-ove=
rride-for-PCI-devices.patch
similarity index 93%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0002-=
n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1=
sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
index 73e7a583..cb72ed0a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0002-n1sdp-=
pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-=
pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -1,4 +1,4 @@
-From 7d24cc041cbcff07b21a9a380426b38e09149648 Mon Sep 17 00:00:00 2001
+From fc8605e74b51d9e0ab8efd0489eca2e11d807f07 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Tue, 31 Aug 2021 16:15:38 +0000
 Subject: [PATCH] n1sdp: pci_quirk: add acs override for PCI devices
@@ -7,8 +7,9 @@ Patch taken from:
 https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/=
5.4/acso.patch
=20
 Change-Id: Ib926bf50524ce9990fbaa2f2f8670fe84bd571f9
-Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+
+Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
@@ -18,10 +19,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  2 files changed, 110 insertions(+)
=20
 diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
-index 23ebe34ff901..054b6e6d22f3 100644
+index 963cdaecabcb..8e94af513b9f 100644
 --- a/Documentation/admin-guide/kernel-parameters.txt
 +++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -4271,6 +4271,14 @@
+@@ -4162,6 +4162,14 @@
  		nomsi		[MSI] If the PCI_MSI kernel config parameter is
  				enabled, this kernel boot option can be used to
  				disable the use of MSI interrupts system-wide.
@@ -37,10 +38,10 @@ index 23ebe34ff901..054b6e6d22f3 100644
  				Safety option to keep boot IRQs enabled. This
  				should never be necessary.
 diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index 321156ca273d..1144c3a8a3bb 100644
+index 285acc4aaccc..d6ebef1f30db 100644
 --- a/drivers/pci/quirks.c
 +++ b/drivers/pci/quirks.c
-@@ -3718,6 +3718,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
+@@ -3612,6 +3612,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
  	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
  }
 =20
@@ -148,7 +149,7 @@ index 321156ca273d..1144c3a8a3bb 100644
  /*
   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
   * prevented for those affected devices.
-@@ -5112,6 +5213,7 @@ static const struct pci_dev_acs_enabled {
+@@ -4980,6 +5081,7 @@ static const struct pci_dev_acs_enabled {
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs =
},
  	/* Wangxun nics */
  	{ PCI_VENDOR_ID_WANGXUN, PCI_ANY_ID, pci_quirk_wangxun_nic_acs },
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0003=
-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-Add-quirk-for-the-Ar=
m-Neoverse-N1SDP-platform.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0003-=
pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pc=
ie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
index e91147a1..9b439e47 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0003-pcie-A=
dd-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-pcie-A=
dd-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -1,4 +1,4 @@
-From 51879bfe6b0850b3746df9f9471120a6709807cb Mon Sep 17 00:00:00 2001
+From 5aa5769af625c79589fd84b8afc06149c2362218 Mon Sep 17 00:00:00 2001
 From: Deepak Pandey <Deepak.Pandey@arm.com>
 Date: Fri, 31 May 2019 16:42:43 +0100
 Subject: [PATCH] pcie: Add quirk for the Arm Neoverse N1SDP platform
@@ -24,6 +24,7 @@ Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
 Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
 [Andre: fix coding style issues, rewrite some parts, add DT support]
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+
 Change-Id: I1d3a4b9bf6b3b883d262e3c4ff1f88a0eb81c1fe
 Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
 Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
@@ -40,10 +41,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  create mode 100644 drivers/pci/controller/pcie-n1sdp.c
=20
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 02adc6ceb831..398a5429a8e2 100644
+index bbbc31391a65..973aa3b4d407 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -207,6 +207,7 @@ CONFIG_NFC_S3FWRN5_I2C=3Dm
+@@ -214,6 +214,7 @@ CONFIG_NFC_S3FWRN5_I2C=3Dm
  CONFIG_PCI=3Dy
  CONFIG_PCIEPORTBUS=3Dy
  CONFIG_PCIEAER=3Dy
@@ -70,12 +71,12 @@ index 860014b89b8e..2d4c1c699ffe 100644
 =20
  #ifdef CONFIG_LOONGARCH
 diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kco=
nfig
-index 0859be86e718..c51b89781472 100644
+index bfd9bac37e24..7a65799dded7 100644
 --- a/drivers/pci/controller/Kconfig
 +++ b/drivers/pci/controller/Kconfig
-@@ -21,6 +21,17 @@ config PCIE_ALTERA
- 	  Say Y here if you want to enable PCIe controller support on Altera
- 	  FPGA.
+@@ -50,6 +50,17 @@ config PCI_IXP4XX
+ 	  Say Y here if you want support for the PCI host controller found
+ 	  in the Intel IXP4xx XScale-based network processor SoC.
 =20
 +config PCIE_HOST_N1SDP_ECAM
 +	bool "ARM N1SDP PCIe Controller"
@@ -88,9 +89,9 @@ index 0859be86e718..c51b89781472 100644
 +	  The controller is ECAM compliant, but needs a quirk to workaround
 +	  an integration issue.
 +
- config PCIE_ALTERA_MSI
- 	tristate "Altera PCIe MSI feature"
- 	depends on PCIE_ALTERA
+ config PCI_TEGRA
+ 	bool "NVIDIA Tegra PCIe controller"
+ 	depends on ARCH_TEGRA || COMPILE_TEST
 diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Ma=
kefile
 index 37c8663de7fe..08e5afcf6e86 100644
 --- a/drivers/pci/controller/Makefile
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0004=
-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-pcie-add-quirk-su=
pport-enabling-remote-chip-PC.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0004-=
n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1=
sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
index f85abd9e..b804658b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0004-n1sdp-=
pcie-add-quirk-support-enabling-remote-chip-PC.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-n1sdp-=
pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -1,4 +1,4 @@
-From aa7c785aff4276aa8579a54f39347cd47eb48ebb Mon Sep 17 00:00:00 2001
+From b59e0d6c6035db80fc9044df0333f96ede53ad7a Mon Sep 17 00:00:00 2001
 From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
 Date: Wed, 9 Feb 2022 20:37:43 +0530
 Subject: [PATCH] n1sdp: pcie: add quirk support enabling remote chip PCI=
e
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0005=
-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-kpti-Whitelist-ea=
rly-Arm-Neoverse-N1-revisions.patch
similarity index 88%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0005-=
arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-ar=
m64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
index 42ef0ee3..cc9d8717 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0005-arm64-=
kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-arm64-=
kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
@@ -1,4 +1,4 @@
-From a9df434f077e7f1d8895e76381ba7179f3ebb1ba Mon Sep 17 00:00:00 2001
+From ff02f77788f8c01e9d675912c063e89415804b7d Mon Sep 17 00:00:00 2001
 From: Andre Przywara <andre.przywara@arm.com>
 Date: Fri, 17 May 2019 17:39:27 +0100
 Subject: [PATCH] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
@@ -20,10 +20,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatu=
re.c
-index 2c0b8444fea6..5c0ff40c6c8b 100644
+index b3f37e2209ad..b74210f38cd8 100644
 --- a/arch/arm64/kernel/cpufeature.c
 +++ b/arch/arm64/kernel/cpufeature.c
-@@ -1690,6 +1690,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
+@@ -1646,6 +1646,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0006=
-arm64-defconfig-disable-config-options-that-does-not.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-defconfig-disable=
-config-options-that-does-not.patch
similarity index 65%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0006-=
arm64-defconfig-disable-config-options-that-does-not.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-ar=
m64-defconfig-disable-config-options-that-does-not.patch
index dae3243f..8aea1f60 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0006-arm64-=
defconfig-disable-config-options-that-does-not.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-=
defconfig-disable-config-options-that-does-not.patch
@@ -1,4 +1,4 @@
-From d59c5c17d3345f923d66fc85a7681fc6c4fd657d Mon Sep 17 00:00:00 2001
+From 330a620b5c73505e62a2e0accc155fbc78859cee Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Wed, 21 Sep 2022 15:54:14 +0100
 Subject: [PATCH] arm64: defconfig: disable config options that does not =
apply
@@ -6,8 +6,6 @@ Subject: [PATCH] arm64: defconfig: disable config options=
 that does not apply
=20
 Following config options should be not set to be more accurate and
 works with build system like yocto
-CONFIG_BT_HCIBTUSB
-CONFIG_BT_HCIBTUSB_MTK
 CONFIG_BT_HCIUART_MRVL
 CONFIG_BT_MRVL
 CONFIG_BT_MRVL_SDIO
@@ -16,24 +14,15 @@ CONFIG_BT_QCOMSMD
 Upstream-Status: Pending [not submitted upstream yet]
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 ---
- arch/arm64/configs/defconfig | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
+ arch/arm64/configs/defconfig | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index cd73d1704dd2..958a43bd00e6 100644
+index 973aa3b4d407..61f040394a2d 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -181,16 +181,16 @@ CONFIG_BT_HIDP=3Dm
- # CONFIG_BT_LE is not set
- CONFIG_BT_LEDS=3Dy
- # CONFIG_BT_DEBUGFS is not set
--CONFIG_BT_HCIBTUSB=3Dm
--CONFIG_BT_HCIBTUSB_MTK=3Dy
-+# CONFIG_BT_HCIBTUSB is not set
-+# CONFIG_BT_HCIBTUSB_MTK is not set
- CONFIG_BT_HCIUART=3Dm
+@@ -198,10 +198,10 @@ CONFIG_BT_HCIUART=3Dm
  CONFIG_BT_HCIUART_LL=3Dy
  CONFIG_BT_HCIUART_BCM=3Dy
  CONFIG_BT_HCIUART_QCA=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enab=
le-nvme.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/ena=
ble-nvme.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enabl=
e-nvme.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-=
nvme.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enab=
le-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/=
n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enabl=
e-realtek-R8169.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-=
realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enab=
le-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/=
n1sdp/enable-usb_conn_gpio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enabl=
e-usb_conn_gpio.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-=
usb_conn_gpio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/usb_=
xhci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/=
n1sdp/usb_xhci_pci_renesas.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/usb_x=
hci_pci_renesas.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/usb_xhc=
i_pci_renesas.cfg
--=20
2.25.1


