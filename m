Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679FDC624B4
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 15:39:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.93557.1700753975824000128
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 07:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E14511595;
	Thu, 23 Nov 2023 07:40:21 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3E803F6C4;
	Thu, 23 Nov 2023 07:39:34 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 5/5] arm-bsp/u-boot: corstone1000: enable virtio-net support for FVP
Date: Thu, 23 Nov 2023 15:39:19 +0000
Message-Id: <20231123153919.2154288-6-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123153919.2154288-1-emekcan.aras@arm.com>
References: <20231123153919.2154288-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 15:39:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5260

From: Emekcan Aras <emekcan.aras@arm.com>

Use Ethernet over VirtIO on FVP due to lan91c111 Ethernet driver support =
dropped from U-Boot.
This patch enables virtio-net device in u-boot to pass ACS tests related =
to
NIC and PXE. The current ethernet device still works in linux kernel and
corstone1000-mps3 Ethernet device is supported by u-boot, so no change is
required regarding existing Ethernet device.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...rstone1000-enable-virtio-net-support.patch | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
042-corstone1000-enable-virtio-net-support.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 01a8683c..b6b7a04f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -49,6 +49,7 @@ SRC_URI:append =3D " \
     file://0039-enables-ondisk-capsule-update-feature.patch		  \
     file://0040-fix-runtime-capsule-update-flags-checks.patch		  \
     file://0041-scatter-gather-flag-workaround.patch			  \
+    file://0042-corstone1000-enable-virtio-net-support.patch		  \
     "
=20
 do_configure:append(){
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-cor=
stone1000-enable-virtio-net-support.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0042-corstone1000-enable-virtio-net-support.patch
new file mode 100644
index 00000000..d94e26a5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone10=
00-enable-virtio-net-support.patch
@@ -0,0 +1,97 @@
+From 2ddd34b6838e836cf94a9da2f65cd01a21252846 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 15 Nov 2023 16:04:06 +0000
+Subject: [PATCH] corstone1000: enable virtio-net support
+
+Adds virtio-net support in corstone1000-fvp.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ arch/arm/dts/corstone1000-fvp.dts        |  6 ++++++
+ board/armltd/corstone1000/corstone1000.c | 24 +++++++++++++++++++++++-
+ configs/corstone1000_defconfig           |  2 ++
+ 3 files changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
+index 26b0f1b3ce..8e54a40113 100644
+--- a/arch/arm/dts/corstone1000-fvp.dts
++++ b/arch/arm/dts/corstone1000-fvp.dts
+@@ -21,6 +21,12 @@
+ 		reg-io-width =3D <2>;
+ 	};
+=20
++	virtio: virtio-net@40400000 {
++		compatible =3D "virtio,mmio";
++		reg =3D <0x40400000 0x10000>;
++		interrupts =3D <145>;
++	};
++
+ 	vmmc_v3_3d: fixed_v3_3d {
+ 		compatible =3D "regulator-fixed";
+ 		regulator-name =3D "vmmc_supply";
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index e3c0e5bf50..ef74dc9032 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -18,6 +18,7 @@
+ #include <dm/platform_data/serial_pl01x.h>
+ #include <asm/armv8/mmu.h>
+ #include <asm/global_data.h>
++#include <generated/dt.h>
+=20
+ /* remove the DT nodes not needed in Linux */
+ DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
+@@ -101,6 +102,14 @@ static struct mm_region corstone1000_mem_map[] =3D =
{
+ 		.size =3D 0x80000000UL,
+ 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
+ 			PTE_BLOCK_INNER_SHARE
++	}, {
++		/* ethernet */
++		.virt =3D 0x40400000UL,
++			.phys =3D 0x40400000UL,
++			.size =3D 0x00100000UL,
++			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				PTE_BLOCK_NON_SHARE |
++				PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+ 		/* List terminator */
+ 		0,
+@@ -150,10 +159,23 @@ void fwu_plat_get_bootidx(uint *boot_idx)
+ int board_late_init(void)
+ {
+ 	struct disk_partition part_info;
+-	struct udevice *dev, *bdev;
++	struct udevice *dev, *bdev,*virtio_bus, *virtio_child;;
+ 	struct nvmxip_plat *plat;
+ 	struct blk_desc *desc;
+ 	int ret;
++	const char *cmp_dtb =3D DEVICE_TREE;
++
++	if (!strcmp(cmp_dtb, "corstone1000-fvp")) {
++		ret =3D uclass_first_device_err(UCLASS_VIRTIO, &virtio_bus);
++		if (!virtio_bus){
++			log_err("Cannot find virtio device\n");
++			return ret;
++		}
++		while (virtio_bus) {
++			device_foreach_child_probe(virtio_child, virtio_bus);
++			uclass_next_device(&virtio_bus);
++		}
++	}
+=20
+ 	ret =3D uclass_first_device_err(UCLASS_NVMXIP, &dev);
+ 	if (ret < 0) {
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 2de3f5d7b3..8770b474e2 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -78,3 +78,5 @@ CONFIG_DM_GPIO=3Dy
+ CONFIG_SYSRESET_PSCI=3Dy
+ CONFIG_EFI_SET_TIME=3Dy
+ CONFIG_EFI_GET_TIME=3Dy
++CONFIG_VIRTIO_NET=3Dy
++CONFIG_VIRTIO_MMIO=3Dy
+--=20
+2.25.1
+
--=20
2.25.1


