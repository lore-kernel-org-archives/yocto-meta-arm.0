Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B424C54764
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 09:25:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9437.1708507503626433701
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 01:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBA461480;
	Wed, 21 Feb 2024 01:25:41 -0800 (PST)
Received: from PW04GXMM.arm.com (unknown [10.1.36.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76F833F73F;
	Wed, 21 Feb 2024 01:25:02 -0800 (PST)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 2/2] arm-bsp/n1sdp: update to linux yocto kernel 6.6
Date: Wed, 21 Feb 2024 09:24:49 +0000
Message-Id: <20240221092449.507-3-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221092449.507-1-anusmita.duttamazumder@arm.com>
References: <20240221092449.507-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Feb 2024 09:25:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5394

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Bumped kernel version to v6.6 and rebased N1SDP kernel PCIe quirk patches=
 on top of this new version.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  2 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch |  0
 ...irk-add-acs-override-for-PCI-devices.patch |  0
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch |  0
 ...uirk-support-enabling-remote-chip-PC.patch |  0
 ...list-early-Arm-Neoverse-N1-revisions.patch |  0
 ...disable-config-options-that-does-not.patch | 30 +++++++++++++++----
 .../n1sdp/enable-nvme.cfg                     |  0
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 12 files changed, 26 insertions(+), 8 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch=
 (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.pat=
ch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.p=
atch (58%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 7ac1f020..12b22cec 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -19,7 +19,7 @@ WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.1%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.6%"
=20
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index f43bbd63..d0df9ce3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -67,7 +67,7 @@ COMPATIBLE_MACHINE:musca-s1 =3D "(^$)"
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-6.1/n1sdp:"
+FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-6.6/n1sdp:"
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
 KBUILD_DEFCONFIG:n1sdp =3D "defconfig"
 KCONFIG_MODE:n1sdp =3D "--alldefconfig"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001=
-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0001-iommu-arm-smmu-v3-worka=
round-for-ATC_INV_SIZE_ALL-in.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0001-=
iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0001-io=
mmu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002=
-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.6/n1sdp/0002-n1sdp-pci_quirk-add-acs-ove=
rride-for-PCI-devices.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-=
n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0002-n1=
sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003=
-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-yocto-6.6/n1sdp/0003-pcie-Add-quirk-for-the-Ar=
m-Neoverse-N1SDP-platform.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0003-=
pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0003-pc=
ie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004=
-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0004-n1sdp-pcie-add-quirk-su=
pport-enabling-remote-chip-PC.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0004-=
n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0004-n1=
sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005=
-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0005-arm64-kpti-Whitelist-ea=
rly-Arm-Neoverse-N1-revisions.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0005-=
arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0005-ar=
m64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006=
-arm64-defconfig-disable-config-options-that-does-not.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0006-arm64-defconfig-disable=
-config-options-that-does-not.patch
similarity index 58%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-=
arm64-defconfig-disable-config-options-that-does-not.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0006-ar=
m64-defconfig-disable-config-options-that-does-not.patch
index 8aea1f60..6660ea51 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0006-arm64-=
defconfig-disable-config-options-that-does-not.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0006-arm64-=
defconfig-disable-config-options-that-does-not.patch
@@ -1,28 +1,41 @@
-From 330a620b5c73505e62a2e0accc155fbc78859cee Mon Sep 17 00:00:00 2001
+From afdd5ae3eeb44381f906b6227422373d4af2811d Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Wed, 21 Sep 2022 15:54:14 +0100
-Subject: [PATCH] arm64: defconfig: disable config options that does not =
apply
+Subject: [PATCH] arm64: defconfig: disable config options that does not =
apply=20
  anymore
=20
 Following config options should be not set to be more accurate and
 works with build system like yocto
+CONFIG_BT_HCIBTUSB
+CONFIG_BT_HCIBTUSB_MTK
 CONFIG_BT_HCIUART_MRVL
 CONFIG_BT_MRVL
 CONFIG_BT_MRVL_SDIO
 CONFIG_BT_QCOMSMD
+CONFIG_BT_NXPUART
=20
 Upstream-Status: Pending [not submitted upstream yet]
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
 ---
- arch/arm64/configs/defconfig | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ arch/arm64/configs/defconfig | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
=20
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 973aa3b4d407..61f040394a2d 100644
+index d2b5208eb55d..b3028113de25 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -198,10 +198,10 @@ CONFIG_BT_HCIUART=3Dm
+@@ -186,17 +186,17 @@ CONFIG_BT_HIDP=3Dm
+ # CONFIG_BT_LE is not set
+ CONFIG_BT_LEDS=3Dy
+ # CONFIG_BT_DEBUGFS is not set
+-CONFIG_BT_HCIBTUSB=3Dm
+-CONFIG_BT_HCIBTUSB_MTK=3Dy
++# CONFIG_BT_HCIBTUSB is not set
++# CONFIG_BT_HCIBTUSB_MTK is not set
+ CONFIG_BT_HCIUART=3Dm
  CONFIG_BT_HCIUART_LL=3Dy
  CONFIG_BT_HCIUART_BCM=3Dy
  CONFIG_BT_HCIUART_QCA=3Dy
@@ -30,10 +43,15 @@ index 973aa3b4d407..61f040394a2d 100644
 -CONFIG_BT_MRVL=3Dm
 -CONFIG_BT_MRVL_SDIO=3Dm
 -CONFIG_BT_QCOMSMD=3Dm
+-CONFIG_BT_NXPUART=3Dm
 +# CONFIG_BT_HCIUART_MRVL is not set
 +# CONFIG_BT_MRVL is not set
 +# CONFIG_BT_MRVL_SDIO is not set
 +# CONFIG_BT_QCOMSMD is not set
++# CONFIG_BT_NXPUART is not set
  CONFIG_CFG80211=3Dm
  CONFIG_MAC80211=3Dm
  CONFIG_MAC80211_LEDS=3Dy
+--=20
+2.38.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enab=
le-nvme.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/ena=
ble-nvme.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enabl=
e-nvme.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable-=
nvme.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enab=
le-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/=
n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enabl=
e-realtek-R8169.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable-=
realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enab=
le-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/=
n1sdp/enable-usb_conn_gpio.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enabl=
e-usb_conn_gpio.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable-=
usb_conn_gpio.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/usb_=
xhci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/=
n1sdp/usb_xhci_pci_renesas.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/usb_x=
hci_pci_renesas.cfg
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/usb_xhc=
i_pci_renesas.cfg
--=20
2.40.0.windows.1


