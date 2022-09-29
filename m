Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84F4C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 11:17:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9105.1664450268277691890
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 04:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCF551A9A;
	Thu, 29 Sep 2022 04:17:53 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 609603F73B;
	Thu, 29 Sep 2022 04:17:46 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH kirkstone 1/1] arm-bsp/n1sdp: update linux-yocto patches
Date: Thu, 29 Sep 2022 12:17:35 +0100
Message-Id: <20220929111735.1517124-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929111735.1517124-1-adam.johnston@arm.com>
References: <20220929111735.1517124-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 11:17:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3869

From: Jon Mason <jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 18 ++++------
 ...irk-add-acs-override-for-PCI-devices.patch | 23 ++++++-------
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 33 +++++++++----------
 ...uirk-support-enabling-remote-chip-PC.patch | 31 ++++++++---------
 ...list-early-Arm-Neoverse-N1-revisions.patch | 17 ++++------
 5 files changed, 53 insertions(+), 69 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
1-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu-arm-smmu-v3-wor=
karound-for-ATC_INV_SIZE_ALL-in.patch
index a75ca247..e1cbb809 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu=
-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu=
-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
@@ -1,11 +1,7 @@
-Upstream-Status: Inappropriate [Workaround]
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
-
-From 949ba3f12ec1f3177a82a9228dc402ab5d8c9d60 Mon Sep 17 00:00:00 2001
+From f88153a427046f92d52694708adc5ee0eefa8d55 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Mon, 1 Feb 2021 21:36:43 +0530
-Subject: [PATCH 1/5] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL =
in
- N1SDP
+Subject: [PATCH] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in N=
1SDP
=20
 ATC_INV_SIZE_ALL request should automatically translate to ATS
 address which is not happening in SMMUv3 version gone into
@@ -15,16 +11,19 @@ field to proper value for ATC_INV_SIZE_ALL command.
 Change-Id: If89465be94720a62be85e1e6612f17e93fa9b8a5
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Upstream-Status: Inappropriate [Workaround]
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
 ---
  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 1 +
  2 files changed, 2 insertions(+)
=20
 diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu=
/arm/arm-smmu-v3/arm-smmu-v3.c
-index a388e318f86e..ceca576b0bf6 100644
+index 79edfdca6607..ded17e199ee4 100644
 --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
 +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-@@ -1724,6 +1724,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
+@@ -1725,6 +1725,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long io=
va, size_t size,
  	};
 =20
  	if (!size) {
@@ -44,6 +43,3 @@ index 4cb136f07914..5615ffd24e46 100644
  		struct {
  			u32			sid;
  			u32			ssid;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
2-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-yocto-5.15/n1sdp/0002-n1sdp-pci_quirk-add-acs-o=
verride-for-PCI-devices.patch
index a6284098..b4e2a8c5 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0002-n1sdp=
-pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0002-n1sdp=
-pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -1,26 +1,26 @@
-Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From e47ab593ee36b2480f8c2196722cded42749629a Mon Sep 17 00:00:00 2001
+From 478d96ce8a4d30ef80975271a2ad89a77012c1b8 Mon Sep 17 00:00:00 2001
 From: Manoj Kumar <manoj.kumar3@arm.com>
 Date: Tue, 31 Aug 2021 16:15:38 +0000
-Subject: [PATCH 2/5] n1sdp: pci_quirk: add acs override for PCI devices
+Subject: [PATCH] n1sdp: pci_quirk: add acs override for PCI devices
=20
 Patch taken from:
 https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/=
5.4/acso.patch
=20
 Change-Id: Ib926bf50524ce9990fbaa2f2f8670fe84bd571f9
 Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+
+Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 ---
  .../admin-guide/kernel-parameters.txt         |   8 ++
  drivers/pci/quirks.c                          | 102 ++++++++++++++++++
  2 files changed, 110 insertions(+)
=20
 diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
-index 43dc35fe5bc0..a60e454854d7 100644
+index 4445baac48c1..ee90aeeb1dbb 100644
 --- a/Documentation/admin-guide/kernel-parameters.txt
 +++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -3892,6 +3892,14 @@
+@@ -3935,6 +3935,14 @@
  		nomsi		[MSI] If the PCI_MSI kernel config parameter is
  				enabled, this kernel boot option can be used to
  				disable the use of MSI interrupts system-wide.
@@ -36,10 +36,10 @@ index 43dc35fe5bc0..a60e454854d7 100644
  				Safety option to keep boot IRQs enabled. This
  				should never be necessary.
 diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index 4537d1ea14fd..984f30d25a6d 100644
+index a531064233f9..ebe192134a97 100644
 --- a/drivers/pci/quirks.c
 +++ b/drivers/pci/quirks.c
-@@ -3588,6 +3588,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
+@@ -3600,6 +3600,107 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
  	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
  }
 =20
@@ -147,7 +147,7 @@ index 4537d1ea14fd..984f30d25a6d 100644
  /*
   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
   * prevented for those affected devices.
-@@ -4949,6 +5050,7 @@ static const struct pci_dev_acs_enabled {
+@@ -4968,6 +5069,7 @@ static const struct pci_dev_acs_enabled {
  	{ PCI_VENDOR_ID_NXP, 0x8d9b, pci_quirk_nxp_rp_acs },
  	/* Zhaoxin Root/Downstream Ports */
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs =
},
@@ -155,6 +155,3 @@ index 4537d1ea14fd..984f30d25a6d 100644
  	{ 0 }
  };
 =20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
3-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003-pcie-Add-quirk-for-the-=
Arm-Neoverse-N1SDP-platform.patch
index f0184a0b..4ffe347a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003-pcie-=
Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0003-pcie-=
Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
-Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
-
-From 63ee3a71eeb778a632f5683f3b9e404a70760e75 Mon Sep 17 00:00:00 2001
+From 4877796976647a24a3a9102facd0577586f5ac9a Mon Sep 17 00:00:00 2001
 From: Deepak Pandey <Deepak.Pandey@arm.com>
 Date: Fri, 31 May 2019 16:42:43 +0100
-Subject: [PATCH 3/5] pcie: Add quirk for the Arm Neoverse N1SDP platform
+Subject: [PATCH] pcie: Add quirk for the Arm Neoverse N1SDP platform
=20
 The Arm N1SDP SoC suffers from some PCIe integration issues, most
 prominently config space accesses to not existing BDFs being answered
@@ -27,6 +24,9 @@ Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
 Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
 [Andre: fix coding style issues, rewrite some parts, add DT support]
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+
+Upstream-Status: Inappropriate [will not be submitted as its a workaroun=
d to address hardware issue]
+Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
 ---
  arch/arm64/configs/defconfig        |   1 +
  drivers/acpi/pci_mcfg.c             |   7 +
@@ -38,10 +38,10 @@ Signed-off-by: Andre Przywara <andre.przywara@arm.com=
>
  create mode 100644 drivers/pci/controller/pcie-n1sdp.c
=20
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 545197bc0501..57ae850ccdf0 100644
+index c27d0fed2ce2..70ed38cecee9 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -212,6 +212,7 @@ CONFIG_NFC_NCI=3Dm
+@@ -209,6 +209,7 @@ CONFIG_NFC_NCI=3Dm
  CONFIG_NFC_S3FWRN5_I2C=3Dm
  CONFIG_PCI=3Dy
  CONFIG_PCIEPORTBUS=3Dy
@@ -50,23 +50,23 @@ index 545197bc0501..57ae850ccdf0 100644
  CONFIG_PCI_PASID=3Dy
  CONFIG_HOTPLUG_PCI=3Dy
 diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 53cab975f612..f31727da21ac 100644
+index 63b98eae5e75..67c34e6c24a7 100644
 --- a/drivers/acpi/pci_mcfg.c
 +++ b/drivers/acpi/pci_mcfg.c
-@@ -169,6 +169,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
- 	ALTRA_ECAM_QUIRK(1, 13),
- 	ALTRA_ECAM_QUIRK(1, 14),
- 	ALTRA_ECAM_QUIRK(1, 15),
-+
+@@ -152,6 +152,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
+ 	XGENE_V2_ECAM_MCFG(4, 1),
+ 	XGENE_V2_ECAM_MCFG(4, 2),
+=20
 +#define N1SDP_ECAM_MCFG(rev, seg, ops) \
 +	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
 +
 +	/* N1SDP SoC with v1 PCIe controller */
 +	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
 +	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
- };
++
+ #define ALTRA_ECAM_QUIRK(rev, seg) \
+ 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
 =20
- static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
 diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kco=
nfig
 index 326f7d13024f..f9700d037c46 100644
 --- a/drivers/pci/controller/Kconfig
@@ -318,6 +318,3 @@ index adea5a4771cf..e6bbc037cef8 100644
  #endif
 =20
  #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
4-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp-pcie-add-quirk-=
support-enabling-remote-chip-PC.patch
index c15b464c..bd88fa49 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp=
-pcie-add-quirk-support-enabling-remote-chip-PC.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp=
-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
-Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
-
-From 4d69e38213bf52a48f2f0239da8c7b76501428b2 Mon Sep 17 00:00:00 2001
+From 7a5147f51f2eb80ecb6f62a28b8bd86aa5ceebf7 Mon Sep 17 00:00:00 2001
 From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
 Date: Wed, 9 Feb 2022 20:37:43 +0530
-Subject: [PATCH 4/5] n1sdp: pcie: add quirk support enabling remote chip=
 PCIe
+Subject: [PATCH] n1sdp: pcie: add quirk support enabling remote chip PCI=
e
=20
 Base address mapping for remote chip Root PCIe ECAM space.
=20
@@ -19,6 +16,9 @@ Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@a=
rm.com>
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
 Signed-off-by: sahil <sahil@arm.com>
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
 ---
  drivers/acpi/pci_mcfg.c             |  1 +
  drivers/pci/controller/pcie-n1sdp.c | 32 +++++++++++++++++++++++++----
@@ -26,17 +26,17 @@ Signed-off-by: sahil <sahil@arm.com>
  3 files changed, 30 insertions(+), 4 deletions(-)
=20
 diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index f31727da21ac..58f59b5fffa2 100644
+index 67c34e6c24a7..4584a5a2ca20 100644
 --- a/drivers/acpi/pci_mcfg.c
 +++ b/drivers/acpi/pci_mcfg.c
-@@ -176,6 +176,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
+@@ -158,6 +158,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
  	/* N1SDP SoC with v1 PCIe controller */
  	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
  	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
 +	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
- };
 =20
- static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
+ #define ALTRA_ECAM_QUIRK(rev, seg) \
+ 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
 diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
 index 408699b9dcb1..a03665dd056a 100644
 --- a/drivers/pci/controller/pcie-n1sdp.c
@@ -121,17 +121,14 @@ index 408699b9dcb1..a03665dd056a 100644
  	{ .compatible =3D "arm,n1sdp-pcie", .data =3D &pci_n1sdp_pcie_ecam_ops=
 },
  	{ },
 diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index e6bbc037cef8..7bd8c1d702ee 100644
+index e6bbc037cef8..d936d3f14bce 100644
 --- a/include/linux/pci-ecam.h
 +++ b/include/linux/pci-ecam.h
-@@ -89,6 +89,7 @@ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazo=
n Annapurna Labs PCIe */
- extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
- extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP =
PCIe */
+@@ -91,6 +91,7 @@ extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_o=
ps; /* Arm N1SDP PCIe */
  extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP =
PCIe */
-+extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm=
 N1SDP PCIe */
  #endif
 =20
++extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm=
 N1SDP PCIe */
  #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
---=20
-2.17.1
-
+ /* for DT-based PCI controllers that support ECAM */
+ int pci_host_common_probe(struct platform_device *pdev);
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/000=
5-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64-kpti-Whitelist-=
early-Arm-Neoverse-N1-revisions.patch
index 04040861..b89c5987 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64=
-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64=
-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Inappropriate
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-
-From d20f5afffadcdbaca7032f547cce80720d8a414a Mon Sep 17 00:00:00 2001
+From 85581abbfc7e3df12091c5004788b0729cfd99f1 Mon Sep 17 00:00:00 2001
 From: Andre Przywara <andre.przywara@arm.com>
 Date: Fri, 17 May 2019 17:39:27 +0100
-Subject: [PATCH 5/5] arm64: kpti: Whitelist early Arm Neoverse N1 revisi=
ons
+Subject: [PATCH] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
=20
 Early revisions (r1p0) of the Neoverse N1 core did not feature the
 CSV3 field in ID_AA64PFR0_EL1 to advertise they are not affected by
@@ -12,16 +9,19 @@ the Spectre variant 3 (aka Meltdown) vulnerability.
=20
 Add this particular revision to the whitelist to avoid enabling KPTI.
=20
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+
+Upstream-Status: Inappropriate
 Signed-off-by: Andre Przywara <andre.przywara@arm.com>
 ---
  arch/arm64/kernel/cpufeature.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatu=
re.c
-index 6ec7036ef7e1..ceba98773608 100644
+index 3e52a9e8b50b..2e64bc4689a0 100644
 --- a/arch/arm64/kernel/cpufeature.c
 +++ b/arch/arm64/kernel/cpufeature.c
-@@ -1509,6 +1509,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
+@@ -1530,6 +1530,7 @@ static bool unmap_kernel_at_el0(const struct arm64=
_cpu_capabilities *entry,
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
@@ -29,6 +29,3 @@ index 6ec7036ef7e1..ceba98773608 100644
  		{ /* sentinel */ }
  	};
  	char const *str =3D "kpti command line option";
---=20
-2.17.1
-
--=20
2.37.3


