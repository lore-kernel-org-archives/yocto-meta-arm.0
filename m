Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2670DC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 10:31:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5554.1652783477831132732
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 03:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC7331042;
	Tue, 17 May 2022 03:31:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 385883F66F;
	Tue, 17 May 2022 03:31:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/linux-yocto: refresh skip-unavailable-memory.patch
Date: Tue, 17 May 2022 11:31:12 +0100
Message-Id: <20220517103112.3058441-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 10:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3413

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-yocto/skip-unavailable-memory.patch | 87 ++++++++++++++-----
 1 file changed, 63 insertions(+), 24 deletions(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-m=
emory.patch b/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-=
memory.patch
index b75cd567..c5dac6aa 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.p=
atch
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.p=
atch
@@ -1,38 +1,75 @@
-When in secure mode, qemu's devicetree has the following node to mark th=
e
-secure memory as off-limits to non-secure environments:
+Backported to 5.15.
=20
-  secram@e000000 {
-    secure-status =3D "okay";
-    status =3D "disabled";
-    reg =3D <0x00 0xe000000 0x00 0x1000000>;
-    device_type =3D "memory";
-  };
+Upstream-Status: Submitted [https://lore.kernel.org/linux-arm-kernel/202=
20517101410.3493781-1-andre.przywara@arm.com/T/#u]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
-However, the kernel doesn't think that means the memory is off-limits:
+From 7bfeda1c9224270af97adf799ce0b5a4292bceb6 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Tue, 17 May 2022 11:14:10 +0100
+Subject: [PATCH] of/fdt: Ignore disabled memory nodes
=20
-  Early memory node ranges
-    node   0: [mem 0x000000000e000000-0x000000000e0fffff]
+When we boot a machine using a devicetree, the generic DT code goes
+through all nodes with a 'device_type =3D "memory"' property, and collec=
ts
+all memory banks mentioned there. However it does not check for the
+status property, so any nodes which are explicitly "disabled" will still
+be added as a memblock.
+This ends up badly for QEMU, when booting with secure firmware on
+arm/arm64 machines, because QEMU adds a node describing secure-only
+memory:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+	secram@e000000 {
+		secure-status =3D "okay";
+		status =3D "disabled";
+		reg =3D <0x00 0xe000000 0x00 0x1000000>;
+		device_type =3D "memory";
+	};
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-And not far into the boot accesses this region and crashes:
+The kernel will eventually use that memory block (which is located below
+the main DRAM bank), but accesses to that will be answered with an
+SError:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+[    0.000000] Internal error: synchronous external abort: 96000050 [#1]=
 PREEMPT SMP
+[    0.000000] Modules linked in:
+[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc6-00014-=
g10c8acb8b679 #524
+[    0.000000] Hardware name: linux,dummy-virt (DT)
+[    0.000000] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
+[    0.000000] pc : new_slab+0x190/0x340
+[    0.000000] lr : new_slab+0x184/0x340
+[    0.000000] sp : ffff80000a4b3d10
+....
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+The actual crash location and call stack will be somewhat random, and
+depend on the specific allocation of that physical memory range.
=20
-  Internal error: synchronous external abort: 96000050 15 PREEMPT SMP
+As the DT spec[1] explicitly mentions standard properties, add a simple
+check to skip over disabled memory nodes, so that we only use memory
+that is meant for non-secure code to use.
=20
-This used to work more through luck than judgement, but recent changes t=
o
-memory zoning[1] means this region is accessed more frequently.
+That fixes booting a QEMU arm64 VM with EL3 enabled ("secure=3Don"), whe=
n
+not using UEFI. In this case the QEMU generated DT will be handed on
+to the kernel, which will see the secram node.
+This issue is reproducible when using TF-A together with U-Boot as
+firmware, then booting with the "booti" command.
=20
-At present there is debate between qemu and kernel engineers over whethe=
r
-the kernel should be ignoring regions marked like this, or if qemu
-should block out the region in a different way. Until this is resolved,
-we can make a choice and simply ignore memory ranges that are marked
-as disabled.
+When using U-Boot as an UEFI provider, the code there [2] explicitly
+filters for disabled nodes when generating the UEFI memory map, so we
+are safe.
+EDK/2 only reads the first bank of the first DT memory node [3] to learn
+about memory, so we got lucky there.
=20
-Upstream-Status: Pending [discussion ongoing]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
+[1] https://github.com/devicetree-org/devicetree-specification/blob/main=
/source/chapter3-devicenodes.rst#memory-node (after the table)
+[2] https://source.denx.de/u-boot/u-boot/-/blob/master/lib/fdtdec.c#L106=
1-1063
+[3] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/PrePi/FdtPa=
rser.c
=20
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3D35ec3d09ff6a49ee90e1bfd09166596f017eb5bb
+Reported-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+---
+ drivers/of/fdt.c | 3 +++
+ 1 file changed, 3 insertions(+)
=20
 diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
-index 59a7a9ee58ef..d151a31adbf9 100644
+index 59a7a9ee58ef..5439c899fe04 100644
 --- a/drivers/of/fdt.c
 +++ b/drivers/of/fdt.c
 @@ -1102,6 +1102,9 @@ int __init early_init_dt_scan_memory(unsigned long=
 node, const char *uname,
@@ -45,3 +82,5 @@ index 59a7a9ee58ef..d151a31adbf9 100644
  	reg =3D of_get_flat_dt_prop(node, "linux,usable-memory", &l);
  	if (reg =3D=3D NULL)
  		reg =3D of_get_flat_dt_prop(node, "reg", &l);
+--=20
+2.25.1
--=20
2.25.1


