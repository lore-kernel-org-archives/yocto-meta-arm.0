Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F02C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 13:42:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6474.1660225362926122859
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 06:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E25FA113E
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 06:42:42 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D16C3F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 06:42:41 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/qemuarm64-secureboot: remove tfa memory patch
Date: Thu, 11 Aug 2022 09:42:35 -0400
Message-Id: <20220811134236.3502-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220811134236.3502-1-jon.mason@arm.com>
References: <20220811134236.3502-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 13:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3673

The TF-A memory patch was upstreamed and is not needed for newer kernels
(like v5.19)

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux-yocto/skip-unavailable-memory.patch | 86 -------------------
 .../linux/linux-yocto_%.bbappend              |  1 -
 2 files changed, 87 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch b/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch
deleted file mode 100644
index c5dac6aa..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Backported to 5.15.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-arm-kernel/20220517101410.3493781-1-andre.przywara@arm.com/T/#u]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 7bfeda1c9224270af97adf799ce0b5a4292bceb6 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Tue, 17 May 2022 11:14:10 +0100
-Subject: [PATCH] of/fdt: Ignore disabled memory nodes
-
-When we boot a machine using a devicetree, the generic DT code goes
-through all nodes with a 'device_type = "memory"' property, and collects
-all memory banks mentioned there. However it does not check for the
-status property, so any nodes which are explicitly "disabled" will still
-be added as a memblock.
-This ends up badly for QEMU, when booting with secure firmware on
-arm/arm64 machines, because QEMU adds a node describing secure-only
-memory:
-===================
-	secram@e000000 {
-		secure-status = "okay";
-		status = "disabled";
-		reg = <0x00 0xe000000 0x00 0x1000000>;
-		device_type = "memory";
-	};
-===================
-
-The kernel will eventually use that memory block (which is located below
-the main DRAM bank), but accesses to that will be answered with an
-SError:
-===================
-[    0.000000] Internal error: synchronous external abort: 96000050 [#1] PREEMPT SMP
-[    0.000000] Modules linked in:
-[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc6-00014-g10c8acb8b679 #524
-[    0.000000] Hardware name: linux,dummy-virt (DT)
-[    0.000000] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
-[    0.000000] pc : new_slab+0x190/0x340
-[    0.000000] lr : new_slab+0x184/0x340
-[    0.000000] sp : ffff80000a4b3d10
-....
-==================
-The actual crash location and call stack will be somewhat random, and
-depend on the specific allocation of that physical memory range.
-
-As the DT spec[1] explicitly mentions standard properties, add a simple
-check to skip over disabled memory nodes, so that we only use memory
-that is meant for non-secure code to use.
-
-That fixes booting a QEMU arm64 VM with EL3 enabled ("secure=on"), when
-not using UEFI. In this case the QEMU generated DT will be handed on
-to the kernel, which will see the secram node.
-This issue is reproducible when using TF-A together with U-Boot as
-firmware, then booting with the "booti" command.
-
-When using U-Boot as an UEFI provider, the code there [2] explicitly
-filters for disabled nodes when generating the UEFI memory map, so we
-are safe.
-EDK/2 only reads the first bank of the first DT memory node [3] to learn
-about memory, so we got lucky there.
-
-[1] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#memory-node (after the table)
-[2] https://source.denx.de/u-boot/u-boot/-/blob/master/lib/fdtdec.c#L1061-1063
-[3] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/PrePi/FdtParser.c
-
-Reported-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
----
- drivers/of/fdt.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
-index 59a7a9ee58ef..5439c899fe04 100644
---- a/drivers/of/fdt.c
-+++ b/drivers/of/fdt.c
-@@ -1102,6 +1102,9 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
- 	if (type == NULL || strcmp(type, "memory") != 0)
- 		return 0;
- 
-+	if (!of_fdt_device_is_available(initial_boot_params, node))
-+		return 0;
-+
- 	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
- 	if (reg == NULL)
- 		reg = of_get_flat_dt_prop(node, "reg", &l);
--- 
-2.25.1
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 1d01daa0..24ace0e7 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -8,7 +8,6 @@ SRC_URI:append:generic-arm64 =" \
 
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot = " \
-    file://skip-unavailable-memory.patch \
     file://tee.cfg \
     "
 
-- 
2.17.1


