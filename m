Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5EBC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:16:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9999.1646151381501153903
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEEF41042
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Mar 2022 08:16:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A34F3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Mar 2022 08:16:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/generic-arm64: use latest linux-yocto
Date: Tue,  1 Mar 2022 16:16:16 +0000
Message-Id: <20220301161616.1959578-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:16:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3084

We were pinning generic-arm64 to 5.10 because 5.14 was hanging during
boot in qemu, but this appears to have been fixed in 5.15.

Unpin the kernel to use 5.15, and drop the defconfig patch which has
been upstreamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf      |  3 -
 .../linux/linux-yocto/defconfig.patch         | 81 -------------------
 .../linux/linux-yocto_%.bbappend              |  1 -
 3 files changed, 85 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/defconfig.p=
atch

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index dc411f67..2ee78056 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -6,9 +6,6 @@
 require conf/machine/include/arm/arch-armv8a.inc
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-# Newer versions of the kernel are not booting on QEMU.  Hold it back to=
 a
-#  known working version until it is determined why
-PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
 KBUILD_DEFCONFIG =3D "defconfig"
 KCONFIG_MODE =3D "--alldefconfig"
 KERNEL_IMAGETYPE =3D "Image"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch b/=
meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
deleted file mode 100644
index 2b7cbbb7..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 976241eed25267bae5a535c01971c7c81ddcf38b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 13 Jan 2021 15:32:22 +0000
-Subject: [PATCH 2/5] arm64: defconfig: drop unused POWER_AVS option
-
-Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
-corresponding Kconfig") moved AVS code to SOC-specific folders, and
-removed corresponding Kconfig from drivers/power, leaving original
-POWER_AVS config option enabled in some defconfigs.
-
-Remove the options, which have no references in the tree anymore.
-
-Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the correspond=
ing Kconfig")
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 6d84761d1285..9bb5a97d24f0 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -514,7 +514,6 @@ CONFIG_GPIO_PCA953X_IRQ=3Dy
- CONFIG_GPIO_BD9571MWV=3Dm
- CONFIG_GPIO_MAX77620=3Dy
- CONFIG_GPIO_SL28CPLD=3Dm
--CONFIG_POWER_AVS=3Dy
- CONFIG_QCOM_CPR=3Dy
- CONFIG_ROCKCHIP_IODOMAIN=3Dy
- CONFIG_POWER_RESET_MSM=3Dy
---=20
-2.25.1
-
-
-From 07fbdbcb768d70ccd8e7fe66aee9f4705a60400b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 28 Jul 2021 16:05:56 +0100
-Subject: [PATCH 3/5] arm64: defconfig: set CONFIG_USB_CONN_GPIO=3Dy
-
-Since 10a7b37b5b ("arm64: Update default configuration") PHY_TEGRA_XUSB
-is set to y. That option needs USB_CONN_GPIO to also be y not m, so
-set USB_CONN_GPIO explicitly to y to reflect reality.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 6d84761d1285..84a75ed7e167 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -727,7 +727,7 @@ CONFIG_SND_SOC_WSA881X=3Dm
- CONFIG_SND_SIMPLE_CARD=3Dm
- CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
- CONFIG_I2C_HID=3Dm
--CONFIG_USB_CONN_GPIO=3Dm
-+CONFIG_USB_CONN_GPIO=3Dy
- CONFIG_USB=3Dy
- CONFIG_USB_OTG=3Dy
- CONFIG_USB_XHCI_HCD=3Dy
---=20
-2.25.1
-
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 6d84761d1285..0f45921cf5b2 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -683,7 +683,6 @@ CONFIG_DRM_PANFROST=3Dm
- CONFIG_FB=3Dy
- CONFIG_FB_MODE_HELPERS=3Dy
- CONFIG_FB_EFI=3Dy
--CONFIG_BACKLIGHT_GENERIC=3Dm
- CONFIG_BACKLIGHT_PWM=3Dm
- CONFIG_BACKLIGHT_LP855X=3Dm
- CONFIG_LOGO=3Dy
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 957cc3f1..f12dc7cb 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -3,7 +3,6 @@ ARMFILESPATHS :=3D "${THISDIR}/${PN}:"
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
-    file://defconfig.patch \
     file://tcpci.cfg \
     "
=20
--=20
2.25.1


