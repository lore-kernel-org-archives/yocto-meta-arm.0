Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C20AC0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 18:10:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.180799.1698257420219445672
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 11:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820172F4;
	Wed, 25 Oct 2023 11:11:01 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EF9D3F738;
	Wed, 25 Oct 2023 11:10:19 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: update to linux yocto kernel 6.5
Date: Wed, 25 Oct 2023 19:10:11 +0100
Message-Id: <20231025181011.2345557-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025181011.2345557-1-xueliang.zhong@arm.com>
References: <20231025181011.2345557-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 18:10:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5173

From: Xueliang Zhong <xueliang.zhong@arm.com>

Bump kernel version to v6.5 and rebased N1SDP kernel PCIe quirk patches t=
op of this new version.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf              |  2 +-
 .../recipes-kernel/linux/linux-arm-platforms.inc  |  2 +-
 ...mu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 14 ++++++--------
 ...i_quirk-add-acs-override-for-PCI-devices.patch | 15 +++++++--------
 ...uirk-for-the-Arm-Neoverse-N1SDP-platform.patch |  9 ++++-----
 ...dd-quirk-support-enabling-remote-chip-PC.patch |  2 +-
 ...hitelist-early-Arm-Neoverse-N1-revisions.patch |  6 +++---
 ...fig-disable-config-options-that-does-not.patch |  0
 .../n1sdp/enable-nvme.cfg                         |  0
 .../n1sdp/enable-realtek-R8169.cfg                |  0
 .../n1sdp/enable-usb_conn_gpio.cfg                |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg                |  0
 12 files changed, 23 insertions(+), 27 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.p=
atch (83%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch=
 (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.pat=
ch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.p=
atch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.p=
atch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index b960c3b1..74a0a66f 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -19,7 +19,7 @@ WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.4%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.5%"
=20
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4badfa8c..045c8568 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -68,7 +68,7 @@ COMPATIBLE_MACHINE:musca-s1 =3D "(^$)"
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-6.4/n1sdp:"
+FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-6.5/n1sdp:"
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
 KBUILD_DEFCONFIG:n1sdp =3D "defconfig"
 KCONFIG_MODE:n1sdp =3D "--alldefconfig"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0001=
-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0001-iommu-arm-smmu-v3-worka=
round-for-ATC_INV_SIZE_ALL-in.patch
similarity index 83%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0001-=
iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0001-io=
mmu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
index 869ca6f7..df7586cf 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0001-iommu-=
arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0001-iommu-=
arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
@@ -1,4 +1,4 @@
-From ec84afa8e74bc5df8b5794eef8f29b097adc7cb3 Mon Sep 17 00:00:00 2001
+From 63da10da7a57776196a3c323e93ef66f1d553c0c Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Mon, 1 Feb 2021 21:36:43 +0530
 Subject: [PATCH] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in N=
1SDP
@@ -9,11 +9,9 @@ N1SDP platform. This workaround manually sets the ATS ad=
dress
 field to proper value for ATC_INV_SIZE_ALL command.
=20
 Change-Id: If89465be94720a62be85e1e6612f17e93fa9b8a5
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
 Upstream-Status: Inappropriate [Workaround]
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 ---
@@ -22,10 +20,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.c
-index 3fd83fb75722..852ed05b14a3 100644
+index 6ccbae9b93a1..5387f152fb07 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-@@ -1747,6 +1747,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
+@@ -1753,6 +1753,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
  	};
 =20
  	if (!size) {
@@ -34,10 +32,10 @@ index 3fd83fb75722..852ed05b14a3 100644
  		return;
  	}
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.h
-index b574c58a3487..018086b65381 100644
+index dcab85698a4e..12e12d03eebf 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
-@@ -472,6 +472,7 @@ struct arm_smmu_cmdq_ent {
+@@ -478,6 +478,7 @@ struct arm_smmu_cmdq_ent {
 =20
  		#define CMDQ_OP_ATC_INV		0x40
  		#define ATC_INV_SIZE_ALL	52
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0002=
-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.5/n1sdp/0002-n1sdp-pci_quirk-add-acs-ove=
rride-for-PCI-devices.patch
similarity index 93%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0002-=
n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0002-n1=
sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
index 9bf8112b..73e7a583 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0002-n1sdp-=
pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0002-n1sdp-=
pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -1,4 +1,4 @@
-From 9761e48b2d6904a58996fcaadcf25684482a72c8 Mon Sep 17 00:00:00 2001
+From 7d24cc041cbcff07b21a9a380426b38e09149648 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Tue, 31 Aug 2021 16:15:38 +0000
 Subject: [PATCH] n1sdp: pci_quirk: add acs override for PCI devices
@@ -7,9 +7,8 @@ Patch taken from:
 https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/=
5.4/acso.patch
=20
 Change-Id: Ib926bf50524ce9990fbaa2f2f8670fe84bd571f9
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
-
 Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
@@ -19,10 +18,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  2 files changed, 110 insertions(+)
=20
 diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
-index 9e5bab29685f..7ee740a37e5d 100644
+index 23ebe34ff901..054b6e6d22f3 100644
 --- a/Documentation/admin-guide/kernel-parameters.txt
 +++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -4235,6 +4235,14 @@
+@@ -4271,6 +4271,14 @@
  		nomsi		[MSI] If the PCI_MSI kernel config parameter is
  				enabled, this kernel boot option can be used to
  				disable the use of MSI interrupts system-wide.
@@ -38,10 +37,10 @@ index 9e5bab29685f..7ee740a37e5d 100644
  				Safety option to keep boot IRQs enabled. This
  				should never be necessary.
 diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index b7c65193e786..16b81d1ccafa 100644
+index 321156ca273d..1144c3a8a3bb 100644
 --- a/drivers/pci/quirks.c
 +++ b/drivers/pci/quirks.c
-@@ -3625,6 +3625,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
+@@ -3718,6 +3718,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
  	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
  }
 =20
@@ -149,7 +148,7 @@ index b7c65193e786..16b81d1ccafa 100644
  /*
   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
   * prevented for those affected devices.
-@@ -5017,6 +5118,7 @@ static const struct pci_dev_acs_enabled {
+@@ -5112,6 +5213,7 @@ static const struct pci_dev_acs_enabled {
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs =
},
  	/* Wangxun nics */
  	{ PCI_VENDOR_ID_WANGXUN, PCI_ANY_ID, pci_quirk_wangxun_nic_acs },
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0003=
-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-yocto-6.5/n1sdp/0003-pcie-Add-quirk-for-the-Ar=
m-Neoverse-N1SDP-platform.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0003-=
pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0003-pc=
ie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
index 96d55ad8..e91147a1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0003-pcie-A=
dd-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0003-pcie-A=
dd-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -1,4 +1,4 @@
-From 268bfbcd8f16660bf5fc8e31b18b4090743c6dbe Mon Sep 17 00:00:00 2001
+From 51879bfe6b0850b3746df9f9471120a6709807cb Mon Sep 17 00:00:00 2001
 From: Deepak Pandey <Deepak.Pandey@arm.com>
 Date: Fri, 31 May 2019 16:42:43 +0100
 Subject: [PATCH] pcie: Add quirk for the Arm Neoverse N1SDP platform
@@ -24,7 +24,6 @@ Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
 Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
 [Andre: fix coding style issues, rewrite some parts, add DT support]
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-
 Change-Id: I1d3a4b9bf6b3b883d262e3c4ff1f88a0eb81c1fe
 Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
 Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
@@ -41,10 +40,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  create mode 100644 drivers/pci/controller/pcie-n1sdp.c
=20
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index a24609e14d50..cd73d1704dd2 100644
+index 02adc6ceb831..398a5429a8e2 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -203,6 +203,7 @@ CONFIG_NFC_S3FWRN5_I2C=3Dm
+@@ -207,6 +207,7 @@ CONFIG_NFC_S3FWRN5_I2C=3Dm
  CONFIG_PCI=3Dy
  CONFIG_PCIEPORTBUS=3Dy
  CONFIG_PCIEAER=3Dy
@@ -71,7 +70,7 @@ index 860014b89b8e..2d4c1c699ffe 100644
 =20
  #ifdef CONFIG_LOONGARCH
 diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kco=
nfig
-index 8d49bad7f847..7bb49afbcd5b 100644
+index 0859be86e718..c51b89781472 100644
 --- a/drivers/pci/controller/Kconfig
 +++ b/drivers/pci/controller/Kconfig
 @@ -21,6 +21,17 @@ config PCIE_ALTERA
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0004=
-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0004-n1sdp-pcie-add-quirk-su=
pport-enabling-remote-chip-PC.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0004-=
n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0004-n1=
sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
index ce28499e..f85abd9e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0004-n1sdp-=
pcie-add-quirk-support-enabling-remote-chip-PC.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0004-n1sdp-=
pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -1,4 +1,4 @@
-From 553801193c173711e9f7f6c56a44b5fac2385c1e Mon Sep 17 00:00:00 2001
+From aa7c785aff4276aa8579a54f39347cd47eb48ebb Mon Sep 17 00:00:00 2001
 From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
 Date: Wed, 9 Feb 2022 20:37:43 +0530
 Subject: [PATCH] n1sdp: pcie: add quirk support enabling remote chip PCI=
e
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0005=
-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0005-arm64-kpti-Whitelist-ea=
rly-Arm-Neoverse-N1-revisions.patch
similarity index 88%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0005-=
arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0005-ar=
m64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
index e4f15bbc..42ef0ee3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0005-arm64-=
kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0005-arm64-=
kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
@@ -1,4 +1,4 @@
-From d2e55d92eefd99ede330270b00c01b734a6b61c0 Mon Sep 17 00:00:00 2001
+From a9df434f077e7f1d8895e76381ba7179f3ebb1ba Mon Sep 17 00:00:00 2001
 From: Andre Przywara <andre.przywara@arm.com>
 Date: Fri, 17 May 2019 17:39:27 +0100
 Subject: [PATCH] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
@@ -20,10 +20,10 @@ Signed-off-by: Adam Johnston <adam.johnston@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatu=
re.c
-index 7d7128c65161..77e109ddd981 100644
+index 2c0b8444fea6..5c0ff40c6c8b 100644
 --- a/arch/arm64/kernel/cpufeature.c
 +++ b/arch/arm64/kernel/cpufeature.c
-@@ -1674,6 +1674,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
+@@ -1690,6 +1690,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0006=
-arm64-defconfig-disable-config-options-that-does-not.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0006-arm64-defconfig-disable=
-config-options-that-does-not.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/0006-=
arm64-defconfig-disable-config-options-that-does-not.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/0006-ar=
m64-defconfig-disable-config-options-that-does-not.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enab=
le-nvme.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/ena=
ble-nvme.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enabl=
e-nvme.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enable-=
nvme.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enab=
le-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/=
n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enabl=
e-realtek-R8169.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enable-=
realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enab=
le-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/=
n1sdp/enable-usb_conn_gpio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/enabl=
e-usb_conn_gpio.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/enable-=
usb_conn_gpio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/usb_=
xhci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/=
n1sdp/usb_xhci_pci_renesas.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.4/n1sdp/usb_x=
hci_pci_renesas.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.5/n1sdp/usb_xhc=
i_pci_renesas.cfg
--=20
2.25.1


