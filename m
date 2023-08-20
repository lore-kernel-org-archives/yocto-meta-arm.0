Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BACEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:48:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10098.1692622127707437300
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 05:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D122F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 05:49:28 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 299863F740
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 05:48:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/linux-yocto: change defconfig patch for 6.4
Date: Sun, 20 Aug 2023 16:51:06 -0500
Message-Id: <20230820215106.3643758-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 12:48:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4969

Use the patch that Mikko Rapeli is trying to upstream to work around the
Nuvoton defconfig issue instead of reverting the patch that added the
platform to the kernel.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch | 50 +++++++++++++++++++
 ...config-Add-Nuvoton-NPCM-family-suppo.patch | 45 -----------------
 .../linux/linux-yocto%.bbappend               |  5 ++
 .../linux/linux-yocto-rt_6.1%.bbappend        |  1 -
 .../linux/linux-yocto_6.1%.bbappend           |  1 -
 5 files changed, 55 insertions(+), 47 deletions(-)
 create mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0001-arm6=
4-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
 delete mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0002-Reve=
rt-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.patch

diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defco=
nfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch b/meta-arm/recipes-kernel/l=
inux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-=
y.patch
new file mode 100644
index 00000000..d7f01853
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-re=
move-CONFIG_COMMON_CLK_NPCM8XX-y.patch
@@ -0,0 +1,50 @@
+From 94a5e7ffe5855272708a94190820534c4f51bdd8 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Tue, 15 Aug 2023 10:36:56 +0300
+Subject: [PATCH] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=3Dy
+
+There is no code for this config option and enabling it in defconfig
+causes warnings from tools which are detecting unused and obsolete
+kernel config flags since the flag will be completely missing from
+effective build config after "make olddefconfig".
+
+Fixes yocto kernel recipe build time warning:
+
+WARNING: [kernel config]: This BSP contains fragments with warnings:
+...
+[INFO]: the following symbols were not found in the active
+configuration:
+     - CONFIG_COMMON_CLK_NPCM8XX
+
+The flag was added with commit 45472f1e5348c7b755b4912f2f529ec81cea044b
+v5.19-rc4-15-g45472f1e5348 so 6.1 and 6.4 stable kernel trees are
+affected.
+
+Fixes: 45472f1e5348c7b755b4912f2f529ec81cea044b ("arm64: defconfig: Add =
Nuvoton NPCM family support")
+Cc: stable@kernel.org
+Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
+Cc: Jon Mason <jon.mason@arm.com>
+Cc: Jon Mason <jdmason@kudzu.us>
+Cc: Ross Burton <ross@burtonini.com>
+Cc: Arnd Bergmann <arnd@arndb.de>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Inappropriate
+
+---
+ arch/arm64/configs/defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 0777bcae9104..1cf24537fda2 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -1146,7 +1146,6 @@ CONFIG_COMMON_CLK_S2MPS11=3Dy
+ CONFIG_COMMON_CLK_PWM=3Dy
+ CONFIG_COMMON_CLK_RS9_PCIE=3Dy
+ CONFIG_COMMON_CLK_VC5=3Dy
+-CONFIG_COMMON_CLK_NPCM8XX=3Dy
+ CONFIG_COMMON_CLK_BD718XX=3Dm
+ CONFIG_CLK_RASPBERRYPI=3Dm
+ CONFIG_CLK_IMX8MM=3Dy
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
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index 0a42ce4a..9d5266ba 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -1,5 +1,10 @@
 ARMFILESPATHS :=3D "${THISDIR}/files:"
=20
+FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
+SRC_URI:append:aarch64 =3D " \
+     file://0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patc=
h \
+    "
+
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend b=
/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
index d0a0ff0e..4d3beb1d 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
@@ -2,6 +2,5 @@
 FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:aarch64 =3D " \
     file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
     file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
     "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
index d0a0ff0e..4d3beb1d 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
@@ -2,6 +2,5 @@
 FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:aarch64 =3D " \
     file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    file://0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.pat=
ch \
     file://0001-gcc-plugins-Reorganize-gimple-includes-for-GCC-13.patch =
\
     "
--=20
2.30.2


