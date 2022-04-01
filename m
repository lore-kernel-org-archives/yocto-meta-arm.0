Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B5FC4167E
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 14:43:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.926.1648830050503013375
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 09:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1CD5139F;
	Fri,  1 Apr 2022 09:20:49 -0700 (PDT)
Received: from e127954.cambridge.arm.com (e127954.cambridge.arm.com
 [10.1.195.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 453B33F66F;
	Fri,  1 Apr 2022 09:20:49 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/u-boot: add SDCard support for corstone1000 FVP
Date: Fri,  1 Apr 2022 17:20:35 +0100
Message-Id: <20220401162035.1690655-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401162035.1690655-1-vishnu.banavath@arm.com>
References: <20220401162035.1690655-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Apr 2022 14:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3232

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to add SDCard support for corstone1000 FVP

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...-corstone1000-add-support-for-SDCard.patch | 166 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
053-plat-corstone1000-add-support-for-SDCard.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-pla=
t-corstone1000-add-support-for-SDCard.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0053-plat-corstone1000-add-support-for-SDCard.pa=
tch
new file mode 100644
index 0000000..4fe4395
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-plat-corst=
one1000-add-support-for-SDCard.patch
@@ -0,0 +1,166 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From fb675d2367b012161711f74f39c498379435d537 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Thu, 31 Mar 2022 14:59:12 +0100
+Subject: [PATCH] plat/corstone1000: add support for SDCard
+
+These changes are to add SDCard support for corstone1000 FVP.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
+index 92da15df4e..fc2fabd1cd 100644
+--- a/arch/arm/dts/corstone1000-fvp.dts
++++ b/arch/arm/dts/corstone1000-fvp.dts
+@@ -21,6 +21,42 @@
+                smsc,irq-push-pull;
+        };
+=20
++       regulators {
++               compatible =3D "simple-bus";
++               #address-cells =3D <1>;
++               #size-cells =3D <0>;
++
++               corstone1000_fixed_3v3: fixed-regulator-0 {
++                       compatible =3D "regulator-fixed";
++                       regulator-name =3D "3V3";
++                       regulator-min-microvolt =3D <3300000>;
++                       regulator-max-microvolt =3D <3300000>;
++                       regulator-always-on;
++               };
++       };
++
++       mmc0: mmci@40300000 {
++               compatible =3D "arm,pl18x", "arm,primecell";
++               reg =3D <0x40300000 0x1000>;
++               interrupt-parent =3D <&gic>;
++               interrupts =3D <GIC_SPI 117 0xf04>;
++               max-frequency =3D <12000000>;
++               vmmc-supply =3D <&corstone1000_fixed_3v3>;
++               clocks =3D <&smbclk>, <&refclk100mhz>;
++               clock-names =3D "smclk", "apb_pclk";
++       };
++
++       mmc1: mmci@50000000 {
++               compatible =3D "arm,pl18x", "arm,primecell";
++               reg =3D <0x50000000 0x10000>;
++               interrupt-parent =3D <&gic>;
++               interrupts =3D <GIC_SPI 115 0xf04>;
++               max-frequency =3D <12000000>;
++               vmmc-supply =3D <&corstone1000_fixed_3v3>;
++               clocks =3D <&smbclk>, <&refclk100mhz>;
++               clock-names =3D "smclk", "apb_pclk";
++       };
++
+ };
+=20
+ &refclk {
+diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
+index 7609367884..b1846938c7 100644
+--- a/arch/arm/include/asm/gpio.h
++++ b/arch/arm/include/asm/gpio.h
+@@ -4,7 +4,7 @@
+ 	!defined(CONFIG_ARCH_ROCKCHIP) && !defined(CONFIG_ARCH_ASPEED) && \
+ 	!defined(CONFIG_ARCH_U8500) && !defined(CONFIG_CORTINA_PLATFORM) && \
+ 	!defined(CONFIG_TARGET_BCMNS3) && !defined(CONFIG_TARGET_TOTAL_COMPUTE=
) && \
+-	!defined(CONFIG_ARCH_QEMU)
++	!defined(CONFIG_ARCH_QEMU) && !defined(CONFIG_TARGET_CORSTONE1000)
+ #include <asm/arch/gpio.h>
+ #endif
+ #include <asm-generic/gpio.h>
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 113a8238c7..32e5d3034f 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -46,14 +46,30 @@ static struct mm_region corstone1000_mem_map[] =3D {
+ 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+ 			 PTE_BLOCK_NON_SHARE |
+ 			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+-        }, {
+-                /* USB */
+-                .virt =3D 0x40200000UL,
+-                .phys =3D 0x40200000UL,
+-                .size =3D 0x00100000UL,
+-                .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+-                         PTE_BLOCK_NON_SHARE |
+-                         PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* USB */
++		.virt =3D 0x40200000UL,
++		.phys =3D 0x40200000UL,
++		.size =3D 0x00100000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				 PTE_BLOCK_NON_SHARE |
++				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* MMC0 */
++		.virt =3D 0x40300000UL,
++		.phys =3D 0x40300000UL,
++		.size =3D 0x00100000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				 PTE_BLOCK_NON_SHARE |
++				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* MMC1 */
++		.virt =3D 0x50000000UL,
++		.phys =3D 0x50000000UL,
++		.size =3D 0x00100000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				 PTE_BLOCK_NON_SHARE |
++				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+                  /* ethernet */
+                 .virt =3D 0x40100000UL,
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 45904ec98d..e72cd30aee 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -38,7 +38,13 @@ CONFIG_CMD_EFIDEBUG=3Dy
+ CONFIG_CMD_FAT=3Dy
+ CONFIG_OF_CONTROL=3Dy
+ CONFIG_REGMAP=3Dy
+-# CONFIG_MMC is not set
++CONFIG_CLK=3Dy
++CONFIG_CMD_MMC=3Dy
++CONFIG_DM_MMC=3Dy
++CONFIG_ARM_PL180_MMCI=3Dy
++CONFIG_MMC_SDHCI_ADMA_HELPERS=3Dy
++CONFIG_MMC_WRITE=3Dy
++CONFIG_DM_GPIO=3Dy
+ CONFIG_DM_ETH=3Dy
+ CONFIG_DM_SERIAL=3Dy
+ CONFIG_USB=3Dy
+diff --git a/drivers/mmc/arm_pl180_mmci.c b/drivers/mmc/arm_pl180_mmci.c
+index b2d1b4f9aa..5d1ee64356 100644
+--- a/drivers/mmc/arm_pl180_mmci.c
++++ b/drivers/mmc/arm_pl180_mmci.c
+@@ -539,7 +539,7 @@ static int arm_pl180_mmc_of_to_plat(struct udevice *=
dev)
+=20
+ static const struct udevice_id arm_pl180_mmc_match[] =3D {
+ 	{ .compatible =3D "arm,pl180" },
+-	{ .compatible =3D "arm,primecell" },
++	{ .compatible =3D "arm,pl18x" },
+ 	{ /* sentinel */ }
+ };
+=20
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
+index c4a1146b52..114aca2059 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -99,7 +99,10 @@
+ #define CONFIG_SYS_MAXARGS		64	/* max command args */
+=20
+ #define BOOT_TARGET_DEVICES(func) \
+-    func(USB, usb, 0)
++	func(USB, usb, 0) \
++	func(MMC, mmc, 0) \
++	func(MMC, mmc, 1)
++
+ #include <config_distro_bootcmd.h>
+ #define CONFIG_EXTRA_ENV_SETTINGS				\
+ 				BOOTENV                         \
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 2eef58c..844f708 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -64,6 +64,7 @@ SRC_URI:append:corstone1000 =3D " \
       file://0050-Comment-mm_communicate-failure-log.patch \
       file://0051-efi_loader-send-bootcomplete-message-to-secure-encla.p=
atch \
       file://0052-efi_loader-fix-null-pointer-exception-with-get_image.p=
atch \
+      file://0053-plat-corstone1000-add-support-for-SDCard.patch \
       "
=20
 #
--=20
2.25.1


