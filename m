Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F41AC77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:02:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6905.1685970122286774281
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 06:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEEA1D75
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:46 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39C423F663
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:01 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/linux-yocto: remove unused 5.15 patches and inc file
Date: Mon,  5 Jun 2023 08:01:53 -0500
Message-Id: <20230605130156.3309199-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 13:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4722

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/arm-ffa-5.15.inc     |  5 --
 .../Add-sec_world_id-to-struct-tee_shm.patch  | 44 ----------
 .../skip-unavailable-memory.patch             | 85 -------------------
 3 files changed, 134 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-5.15/Add-se=
c_world_id-to-struct-tee_shm.patch
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-u=
navailable-memory.patch

diff --git a/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc b/meta-arm/re=
cipes-kernel/linux/arm-ffa-5.15.inc
deleted file mode 100644
index bc66efbf..00000000
--- a/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# Include a backport kernel patch for TEE driver
-
-SRC_URI:append =3D " \
-    file://Add-sec_world_id-to-struct-tee_shm.patch \
-    "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-5.15/Add-sec_world=
_id-to-struct-tee_shm.patch b/meta-arm/recipes-kernel/linux/linux-yocto-5=
.15/Add-sec_world_id-to-struct-tee_shm.patch
deleted file mode 100644
index 8f54b308..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto-5.15/Add-sec_world_id-to-=
struct-tee_shm.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9028b2463c1ea96f51c3ba53e2479346019ff6ad Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Thu, 25 Mar 2021 15:08:44 +0100
-Subject: [PATCH] tee: add sec_world_id to struct tee_shm
-
-Adds sec_world_id to struct tee_shm which describes a shared memory
-object. sec_world_id can be used by a driver to store an id assigned by
-secure world.
-
-Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream-Status: Submitted [https://github.com/torvalds/linux/commit/902=
8b2463c1ea96f51c3ba53e2479346019ff6ad]
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-
----
- include/linux/tee_drv.h | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
-index 3ebfea0781f100..a1f03461369bd9 100644
---- a/include/linux/tee_drv.h
-+++ b/include/linux/tee_drv.h
-@@ -197,7 +197,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 =
connection_method,
-  * @num_pages:	number of locked pages
-  * @dmabuf:	dmabuf used to for exporting to user space
-  * @flags:	defined by TEE_SHM_* in tee_drv.h
-- * @id:		unique id of a shared memory object on this device
-+ * @id:		unique id of a shared memory object on this device, shared
-+ *		with user space
-+ * @sec_world_id:
-+ *		secure world assigned id of this shared memory object, not
-+ *		used by all drivers
-  *
-  * This pool is only supposed to be accessed directly from the TEE
-  * subsystem and from drivers that implements their own shm pool manage=
r.
-@@ -213,6 +217,7 @@ struct tee_shm {
- 	struct dma_buf *dmabuf;
- 	u32 flags;
- 	int id;
-+	u64 sec_world_id;
- };
-=20
- /**
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-unavaila=
ble-memory.patch b/meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-un=
available-memory.patch
deleted file mode 100644
index d157ef70..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-unavailable-mem=
ory.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 7bfeda1c9224270af97adf799ce0b5a4292bceb6 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Tue, 17 May 2022 11:14:10 +0100
-Subject: [PATCH] of/fdt: Ignore disabled memory nodes
-
-When we boot a machine using a devicetree, the generic DT code goes
-through all nodes with a 'device_type =3D "memory"' property, and collec=
ts
-all memory banks mentioned there. However it does not check for the
-status property, so any nodes which are explicitly "disabled" will still
-be added as a memblock.
-This ends up badly for QEMU, when booting with secure firmware on
-arm/arm64 machines, because QEMU adds a node describing secure-only
-memory:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	secram@e000000 {
-		secure-status =3D "okay";
-		status =3D "disabled";
-		reg =3D <0x00 0xe000000 0x00 0x1000000>;
-		device_type =3D "memory";
-	};
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The kernel will eventually use that memory block (which is located below
-the main DRAM bank), but accesses to that will be answered with an
-SError:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-[    0.000000] Internal error: synchronous external abort: 96000050 [#1]=
 PREEMPT SMP
-[    0.000000] Modules linked in:
-[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc6-00014-=
g10c8acb8b679 #524
-[    0.000000] Hardware name: linux,dummy-virt (DT)
-[    0.000000] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
-[    0.000000] pc : new_slab+0x190/0x340
-[    0.000000] lr : new_slab+0x184/0x340
-[    0.000000] sp : ffff80000a4b3d10
-....
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-The actual crash location and call stack will be somewhat random, and
-depend on the specific allocation of that physical memory range.
-
-As the DT spec[1] explicitly mentions standard properties, add a simple
-check to skip over disabled memory nodes, so that we only use memory
-that is meant for non-secure code to use.
-
-That fixes booting a QEMU arm64 VM with EL3 enabled ("secure=3Don"), whe=
n
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
-[1] https://github.com/devicetree-org/devicetree-specification/blob/main=
/source/chapter3-devicenodes.rst#memory-node (after the table)
-[2] https://source.denx.de/u-boot/u-boot/-/blob/master/lib/fdtdec.c#L106=
1-1063
-[3] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/PrePi/FdtPa=
rser.c
-
-Reported-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-arm-kernel/202=
20517101410.3493781-1-andre.przywara@arm.com/T/#u]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- drivers/of/fdt.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
-index 59a7a9ee58ef..5439c899fe04 100644
---- a/drivers/of/fdt.c
-+++ b/drivers/of/fdt.c
-@@ -1102,6 +1102,9 @@ int __init early_init_dt_scan_memory(unsigned long=
 node, const char *uname,
- 	if (type =3D=3D NULL || strcmp(type, "memory") !=3D 0)
- 		return 0;
-=20
-+	if (!of_fdt_device_is_available(initial_boot_params, node))
-+		return 0;
-+
- 	reg =3D of_get_flat_dt_prop(node, "linux,usable-memory", &l);
- 	if (reg =3D=3D NULL)
- 		reg =3D of_get_flat_dt_prop(node, "reg", &l);
---=20
-2.25.1
--=20
2.30.2


