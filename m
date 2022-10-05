Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B03C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:03:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.21845.1664964207070830968
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 03:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 739A011FB;
	Wed,  5 Oct 2022 03:03:33 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 081FD3F67D;
	Wed,  5 Oct 2022 03:03:25 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/corstone500: upgrade kernel to v5.19
Date: Wed,  5 Oct 2022 11:03:15 +0100
Message-Id: <20221005100315.15427-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221005100315.15427-1-vishnu.banavath@arm.com>
References: <20221005100315.15427-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 10:03:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3926

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to upgrade kernel to 5.19 for corstone500 target

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 ...op-CONFIG_SND_SOC_AC97-from-multi_v7.patch | 30 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  4 +++
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index adcfddd0..9db2ceb0 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -12,7 +12,7 @@ require conf/machine/include/arm/armv7a/tune-cortexa5.inc
 # apply.
 #
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.15%"
+PREFERRED_VERSION_linux-yocto ?= "5.19%"
 
 EXTRA_IMAGEDEPENDS += "trusted-firmware-a u-boot"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch
new file mode 100644
index 00000000..68c9ca00
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 7ee0e1c0a6498d376b38679c908f01a1528a1450 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Thu, 29 Sep 2022 17:16:45 +0100
+Subject: [PATCH] arm: defconfig: drop CONFIG_SND_SOC_AC97 from
+ multi_v7_defconfig
+
+The CONFIG_SND_SOC_AC97 symbol was recently enabled but does not
+actually exist. This change is to remove it to fix warnings when
+used some of the build tools like yocto.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
+index ce9826bce29b..b3662f126efa 100644
+--- a/arch/arm/configs/multi_v7_defconfig
++++ b/arch/arm/configs/multi_v7_defconfig
+@@ -817,7 +817,6 @@ CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
+ CONFIG_SND_SOC_TEGRA_ALC5632=m
+ CONFIG_SND_SOC_TEGRA_MAX98090=m
+ CONFIG_SND_SOC_DAVINCI_MCASP=m
+-CONFIG_SND_SOC_AC97=m
+ CONFIG_SND_SOC_AK4642=m
+ CONFIG_SND_SOC_CPCAP=m
+ CONFIG_SND_SOC_CS42L51_I2C=m
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 97de2d01..00520969 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -27,6 +27,10 @@ SRCREV:arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 COMPATIBLE_MACHINE:corstone500 = "corstone500"
 KBUILD_DEFCONFIG:corstone500  = "multi_v7_defconfig"
 KCONFIG_MODE:corstone500 = "--alldefconfig"
+FILESEXTRAPATHS:prepend:corstone500 := "${ARMBSPFILESPATHS}"
+SRC_URI:append:corstone500 = " \
+           file://0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch \
+           "
 
 #
 # Corstone1000 KMACHINE
-- 
2.17.1


