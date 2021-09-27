Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9053CC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:54:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.30926.1632747272600375509
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44BE0D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:54:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E32283F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:54:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: add back linux-yocto defconfig changes
Date: Mon, 27 Sep 2021 13:54:27 +0100
Message-Id: <20210927125427.3400688-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:54:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2228

linux-yocto has moved to 5.14, which still needs defconfig tweaks to
build without warnings.

Change-Id: Ia14c02562cf0ccb5fb8fd8544901530a0cfb487b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/linux-yocto/defconfig.patch         | 132 ++++++++++++++++++
 .../linux/linux-yocto_%.bbappend              |   6 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/defconfig.p=
atch

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch b/=
meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
new file mode 100644
index 00000000..921d6557
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
@@ -0,0 +1,132 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 976241eed25267bae5a535c01971c7c81ddcf38b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 13 Jan 2021 15:32:22 +0000
+Subject: [PATCH 2/5] arm64: defconfig: drop unused POWER_AVS option
+
+Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
+corresponding Kconfig") moved AVS code to SOC-specific folders, and
+removed corresponding Kconfig from drivers/power, leaving original
+POWER_AVS config option enabled in some defconfigs.
+
+Remove the options, which have no references in the tree anymore.
+
+Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the correspond=
ing Kconfig")
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ arch/arm64/configs/defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 9907a431db0d..f50751b6eaec 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -538,7 +538,6 @@ CONFIG_GPIO_PCA953X_IRQ=3Dy
+ CONFIG_GPIO_BD9571MWV=3Dm
+ CONFIG_GPIO_MAX77620=3Dy
+ CONFIG_GPIO_SL28CPLD=3Dm
+-CONFIG_POWER_AVS=3Dy
+ CONFIG_QCOM_CPR=3Dy
+ CONFIG_ROCKCHIP_IODOMAIN=3Dy
+ CONFIG_POWER_RESET_MSM=3Dy
+--=20
+2.25.1
+
+
+From 07fbdbcb768d70ccd8e7fe66aee9f4705a60400b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 28 Jul 2021 16:05:56 +0100
+Subject: [PATCH 3/5] arm64: defconfig: set CONFIG_USB_CONN_GPIO=3Dy
+
+Since 10a7b37b5b ("arm64: Update default configuration") PHY_TEGRA_XUSB
+is set to y. That option needs USB_CONN_GPIO to also be y not m, so
+set USB_CONN_GPIO explicitly to y to reflect reality.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ arch/arm64/configs/defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index f50751b6eaec..15595d6db256 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -789,7 +789,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
+ CONFIG_HID_MULTITOUCH=3Dm
+ CONFIG_I2C_HID_ACPI=3Dm
+ CONFIG_I2C_HID_OF=3Dm
+-CONFIG_USB_CONN_GPIO=3Dm
++CONFIG_USB_CONN_GPIO=3Dy
+ CONFIG_USB=3Dy
+ CONFIG_USB_OTG=3Dy
+ CONFIG_USB_XHCI_HCD=3Dy
+--=20
+2.25.1
+
+
+From 26e4f7955080cc0f5670471823d73b972d3fe080 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 8 Sep 2021 11:51:03 +0100
+Subject: [PATCH 4/5] arm64: defconfig: remove obsolete CONFIG_ARCH_AGILE=
X and
+ CONFIG_ARCH_N5X
+
+These config options were removed in 4a9a1a5602 ("arm64: socfpga: merge
+Agilex and N5X into ARCH_INTEL_SOCFPGA"), so remove them from the
+defconfig.
+
+Fixes: 4a9a1a5602 ("arm64: socfpga: merge Agilex and N5X into ARCH_INTEL=
_SOCFPGA")
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ arch/arm64/configs/defconfig | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 15595d6db256..257167463b60 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -28,8 +28,6 @@ CONFIG_KALLSYMS_ALL=3Dy
+ # CONFIG_COMPAT_BRK is not set
+ CONFIG_PROFILING=3Dy
+ CONFIG_ARCH_ACTIONS=3Dy
+-CONFIG_ARCH_AGILEX=3Dy
+-CONFIG_ARCH_N5X=3Dy
+ CONFIG_ARCH_SUNXI=3Dy
+ CONFIG_ARCH_ALPINE=3Dy
+ CONFIG_ARCH_APPLE=3Dy
+--=20
+2.25.1
+
+
+From 0931745bfa4e9a8db2885dd20d07426dbaf2fa73 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 8 Sep 2021 12:19:33 +0100
+Subject: [PATCH 5/5] arm64: defconfig: don't set CONFIG_ACPI_APEI_PCIEAE=
R
+
+Since 8c8ff55 ("PCI/AER: Don't select CONFIG_PCIEAER by default"), PCIe
+Advanced Error Reporting isn't enabled by default.. As this means just
+enabling CONFIG_CPI_APEI_PCIEAR does not have an effect, remove it from
+the defconfig for clarity.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ arch/arm64/configs/defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 257167463b60..f620f31b0323 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -110,7 +110,6 @@ CONFIG_IMX_SCU_PD=3Dy
+ CONFIG_ACPI=3Dy
+ CONFIG_ACPI_APEI=3Dy
+ CONFIG_ACPI_APEI_GHES=3Dy
+-CONFIG_ACPI_APEI_PCIEAER=3Dy
+ CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
+ CONFIG_ACPI_APEI_EINJ=3Dy
+ CONFIG_VIRTUALIZATION=3Dy
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
arm/recipes-kernel/linux/linux-yocto_%.bbappend
index f12dc7cb..d215d8b5 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -3,9 +3,15 @@ ARMFILESPATHS :=3D "${THISDIR}/${PN}:"
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
+    file://defconfig.patch \
     file://tcpci.cfg \
     "
=20
+FILESEXTRAPATHS:prepend:qemuarm64-sbsa =3D "${ARMFILESPATHS}"
+SRC_URI:append:qemuarm64-sbsa =3D " \
+    file://defconfig.patch \
+    "
+
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot =3D " \
     file://zone_dma_revert.patch \
--=20
2.25.1


