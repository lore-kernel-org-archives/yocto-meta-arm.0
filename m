Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73B9CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:29:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55935.1697812155996907542
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 07:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 556352F4;
	Fri, 20 Oct 2023 07:29:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F2C3A3F762;
	Fri, 20 Oct 2023 07:29:14 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][mickledore] arm/linux-yocto: remove defconfig patch
Date: Fri, 20 Oct 2023 15:29:11 +0100
Message-Id: <20231020142911.2755434-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 14:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5158

From: Jon Mason <jon.mason@arm.com>

Mikko Rapeli upstreamed the patch for the Nuvoton defconfig issue and it
has been pulled back the 6.1 kernel.  So, it is no longer needed here.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...config-Add-Nuvoton-NPCM-family-suppo.patch | 45 -------------------
 .../linux/linux-yocto-rt_6.1%.bbappend        |  1 -
 .../linux/linux-yocto_6.1%.bbappend           |  1 -
 3 files changed, 47 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0002-Reve=
rt-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.patch

diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0002-Revert-arm6=
4-defconfig-Add-Nuvoton-NPCM-family-suppo.patch b/meta-arm/recipes-kernel=
/linux/files/aarch64/0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-=
suppo.patch
deleted file mode 100644
index d5b5363a..00000000
--- a/meta-arm/recipes-kernel/linux/files/aarch64/0002-Revert-arm64-defco=
nfig-Add-Nuvoton-NPCM-family-suppo.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 891eeb87cddb0d52bc9eac39afcca5027a660be6 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jdmason@kudzu.us>
-Date: Fri, 3 Feb 2023 05:21:07 -0500
-Subject: [PATCH 2/2] Revert "arm64: defconfig: Add Nuvoton NPCM family
- support"
-
-This reverts commit 45472f1e5348c7b755b4912f2f529ec81cea044b
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Inappropriate
----
- arch/arm64/configs/defconfig | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 70919b241469..4f09b80a1b96 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -51,7 +51,6 @@ CONFIG_ARCH_MESON=3Dy
- CONFIG_ARCH_MVEBU=3Dy
- CONFIG_ARCH_NXP=3Dy
- CONFIG_ARCH_MXC=3Dy
--CONFIG_ARCH_NPCM=3Dy
- CONFIG_ARCH_QCOM=3Dy
- CONFIG_ARCH_RENESAS=3Dy
- CONFIG_ARCH_ROCKCHIP=3Dy
-@@ -637,7 +636,6 @@ CONFIG_UNIPHIER_WATCHDOG=3Dy
- CONFIG_PM8916_WATCHDOG=3Dm
- CONFIG_BCM2835_WDT=3Dy
- CONFIG_BCM7038_WDT=3Dm
--CONFIG_NPCM7XX_WATCHDOG=3Dy
- CONFIG_MFD_ALTERA_SYSMGR=3Dy
- CONFIG_MFD_BD9571MWV=3Dy
- CONFIG_MFD_AXP20X_I2C=3Dy
-@@ -1049,7 +1047,6 @@ CONFIG_COMMON_CLK_FSL_SAI=3Dy
- CONFIG_COMMON_CLK_S2MPS11=3Dy
- CONFIG_COMMON_CLK_PWM=3Dy
- CONFIG_COMMON_CLK_VC5=3Dy
--CONFIG_COMMON_CLK_NPCM8XX=3Dy
- CONFIG_COMMON_CLK_BD718XX=3Dm
- CONFIG_CLK_RASPBERRYPI=3Dm
- CONFIG_CLK_IMX8MM=3Dy
---=20
-2.30.2
-
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend b=
/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
index e6d50a4b..94d3398c 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
@@ -2,5 +2,4 @@
 FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:aarch64 =3D " \
     file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
     "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
index e6d50a4b..94d3398c 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
@@ -2,5 +2,4 @@
 FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:aarch64 =3D " \
     file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
     "
--=20
2.34.1


