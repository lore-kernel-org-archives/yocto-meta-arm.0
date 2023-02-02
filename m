Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD45C636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 09:16:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2745.1675502200515559179
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Feb 2023 01:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24E0BC14
	for <meta-arm@lists.yoctoproject.org>; Sat,  4 Feb 2023 01:17:22 -0800 (PST)
Received: from jdm-VirtualBox.fosdem.net?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 864813F71E
	for <meta-arm@lists.yoctoproject.org>; Sat,  4 Feb 2023 01:16:39 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/linux-yocto: avoid kernel defconfig warning
Date: Thu,  2 Feb 2023 09:28:50 -0500
Message-Id: <20230202142850.795987-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Feb 2023 09:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4357

2 symbols were added to the arm64 kernel defconfig without the
corresponding code.  Remove these unnecessary pieces to avoid the
warning.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...4-defconfig-Enable-Tegra-MGBE-driver.patch | 28 ++++++++++++
 ...config-Add-Nuvoton-NPCM-family-suppo.patch | 45 +++++++++++++++++++
 .../linux/linux-yocto_%.bbappend              |  5 +++
 3 files changed, 78 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/files/0001-Revert-arm64=
-defconfig-Enable-Tegra-MGBE-driver.patch
 create mode 100644 meta-arm/recipes-kernel/linux/files/0002-Revert-arm64=
-defconfig-Add-Nuvoton-NPCM-family-suppo.patch

diff --git a/meta-arm/recipes-kernel/linux/files/0001-Revert-arm64-defcon=
fig-Enable-Tegra-MGBE-driver.patch b/meta-arm/recipes-kernel/linux/files/=
0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch
new file mode 100644
index 00000000..995bc2c5
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/0001-Revert-arm64-defconfig-Ena=
ble-Tegra-MGBE-driver.patch
@@ -0,0 +1,28 @@
+From 7bc0bae10b0f21cfc8df23848844b66bf1b4d751 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Fri, 3 Feb 2023 05:16:43 -0500
+Subject: [PATCH 1/2] Revert "arm64: defconfig: Enable Tegra MGBE driver"
+
+This reverts commit 4cac4de4b05f0a1d5920d12278bf8787011661d3.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Inappropriate
+---
+ arch/arm64/configs/defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 0b6af3348e79..70919b241469 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -362,7 +362,6 @@ CONFIG_SMSC911X=3Dy
+ CONFIG_SNI_AVE=3Dy
+ CONFIG_SNI_NETSEC=3Dy
+ CONFIG_STMMAC_ETH=3Dm
+-CONFIG_DWMAC_TEGRA=3Dm
+ CONFIG_TI_K3_AM65_CPSW_NUSS=3Dy
+ CONFIG_QCOM_IPA=3Dm
+ CONFIG_MESON_GXL_PHY=3Dm
+--=20
+2.30.2
+
diff --git a/meta-arm/recipes-kernel/linux/files/0002-Revert-arm64-defcon=
fig-Add-Nuvoton-NPCM-family-suppo.patch b/meta-arm/recipes-kernel/linux/f=
iles/0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.patch
new file mode 100644
index 00000000..d5b5363a
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/0002-Revert-arm64-defconfig-Add=
-Nuvoton-NPCM-family-suppo.patch
@@ -0,0 +1,45 @@
+From 891eeb87cddb0d52bc9eac39afcca5027a660be6 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Fri, 3 Feb 2023 05:21:07 -0500
+Subject: [PATCH 2/2] Revert "arm64: defconfig: Add Nuvoton NPCM family
+ support"
+
+This reverts commit 45472f1e5348c7b755b4912f2f529ec81cea044b
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Inappropriate
+---
+ arch/arm64/configs/defconfig | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 70919b241469..4f09b80a1b96 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -51,7 +51,6 @@ CONFIG_ARCH_MESON=3Dy
+ CONFIG_ARCH_MVEBU=3Dy
+ CONFIG_ARCH_NXP=3Dy
+ CONFIG_ARCH_MXC=3Dy
+-CONFIG_ARCH_NPCM=3Dy
+ CONFIG_ARCH_QCOM=3Dy
+ CONFIG_ARCH_RENESAS=3Dy
+ CONFIG_ARCH_ROCKCHIP=3Dy
+@@ -637,7 +636,6 @@ CONFIG_UNIPHIER_WATCHDOG=3Dy
+ CONFIG_PM8916_WATCHDOG=3Dm
+ CONFIG_BCM2835_WDT=3Dy
+ CONFIG_BCM7038_WDT=3Dm
+-CONFIG_NPCM7XX_WATCHDOG=3Dy
+ CONFIG_MFD_ALTERA_SYSMGR=3Dy
+ CONFIG_MFD_BD9571MWV=3Dy
+ CONFIG_MFD_AXP20X_I2C=3Dy
+@@ -1049,7 +1047,6 @@ CONFIG_COMMON_CLK_FSL_SAI=3Dy
+ CONFIG_COMMON_CLK_S2MPS11=3Dy
+ CONFIG_COMMON_CLK_PWM=3Dy
+ CONFIG_COMMON_CLK_VC5=3Dy
+-CONFIG_COMMON_CLK_NPCM8XX=3Dy
+ CONFIG_COMMON_CLK_BD718XX=3Dm
+ CONFIG_CLK_RASPBERRYPI=3Dm
+ CONFIG_CLK_IMX8MM=3Dy
+--=20
+2.30.2
+
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
arm/recipes-kernel/linux/linux-yocto_%.bbappend
index a641ec2d..24154275 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -3,9 +3,14 @@ ARMFILESPATHS :=3D "${THISDIR}/files:"
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D" \
+    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
+    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
     file://generic-arm64-kmeta;type=3Dkmeta;destsuffix=3Dgeneric-arm64-k=
meta \
     "
=20
+
+
+
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot =3D " \
     file://tee.cfg \
--=20
2.25.1


