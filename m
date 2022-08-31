Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B687ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 18:42:18 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web10.2640.1661971327510554633
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 11:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27VIiIV8011556;
	Wed, 31 Aug 2022 19:44:19 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH 3/7] ARM-FFA kernel drivers and kernel configs for Trusted
 Services
Date: Wed, 31 Aug 2022 19:41:53 +0100
Message-Id: <20220831184157.84687-3-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831184157.84687-1-Anton.Antonov@arm.com>
References: <20220831184157.84687-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Aug 2022 18:42:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3730

This commit includes:
- arm-ffa-tee and arm-ffa-user kernel drivers
- ARM_FFA_TRANSPORT kernel option
- Backported pacthes for kernel 5.15

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../arm-ffa-tee/arm-ffa-tee_1.1.1.bb          | 22 +++++
 .../recipes-kernel/arm-ffa-tee/files/Makefile | 14 +++
 .../arm-ffa-user/arm-ffa-user_5.0.0.bb        | 29 +++++++
 .../arm-ffa-user/files/Makefile               | 14 +++
 .../recipes-kernel/linux/arm-ffa-5.15.inc     |  5 ++
 .../linux/arm-ffa-transport.inc               |  6 ++
 .../Add-sec_world_id-to-struct-tee_shm.patch  | 44 ++++++++++
 .../skip-unavailable-memory.patch             | 85 +++++++++++++++++++
 .../linux/linux-yocto/arm-ffa-transport.cfg   |  1 +
 .../linux/linux-yocto/no-strict-devmem.cfg    |  1 +
 .../linux/linux-yocto_%.bbappend              |  8 ++
 .../linux/linux-yocto_5.15%.bbappend          |  8 ++
 12 files changed, 237 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.1.bb
 create mode 100644 meta-arm/recipes-kernel/arm-ffa-tee/files/Makefile
 create mode 100644 meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.0.bb
 create mode 100644 meta-arm/recipes-kernel/arm-ffa-user/files/Makefile
 create mode 100644 meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
 create mode 100644 meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-5.15/Add-sec_world_id-to-struct-tee_shm.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-unavailable-memory.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend

diff --git a/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.1.bb b/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.1.bb
new file mode 100644
index 00000000..9e997de1
--- /dev/null
+++ b/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A Linux kernel module providing user space access to Trusted Services"
+DESCRIPTION = "${SUMMARY}"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=05e355bbd617507216a836c56cf24983"
+
+inherit module
+
+SRC_URI = "git://gitlab.arm.com/linux-arm/linux-trusted-services;protocol=https;branch=main \
+           file://Makefile;subdir=git \
+          "
+S = "${WORKDIR}/git"
+
+# Tag tee-v1.1
+SRCREV = "3b543b7591505b715f332c972248a3ea41604d83"
+
+COMPATIBLE_HOST = "(arm|aarch64).*-linux"
+KERNEL_MODULE_AUTOLOAD += "arm-ffa-tee"
+
+do_install:append() {
+    install -d ${D}${includedir}
+    install -m 0644 ${S}/uapi/arm_ffa_tee.h ${D}${includedir}/
+}
diff --git a/meta-arm/recipes-kernel/arm-ffa-tee/files/Makefile b/meta-arm/recipes-kernel/arm-ffa-tee/files/Makefile
new file mode 100644
index 00000000..40a6e474
--- /dev/null
+++ b/meta-arm/recipes-kernel/arm-ffa-tee/files/Makefile
@@ -0,0 +1,14 @@
+obj-m := arm-ffa-tee.o
+
+SRC := $(shell pwd)
+
+all:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
+
+modules_install:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+
+clean:
+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
+	rm -f Module.markers Module.symvers modules.order
+	rm -rf .tmp_versions Modules.symvers
diff --git a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.0.bb b/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.0.bb
new file mode 100644
index 00000000..8d86197d
--- /dev/null
+++ b/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "FF-A Debugfs Linux kernel module"
+DESCRIPTION = "This out-of-tree kernel module exposes FF-A operations to user space \
+used for development purposes"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=05e355bbd617507216a836c56cf24983"
+
+inherit module
+
+SRC_URI = "git://gitlab.arm.com/linux-arm/linux-trusted-services;protocol=https;branch=debugfs \
+           file://Makefile;subdir=git \
+          "
+S = "${WORKDIR}/git"
+
+# Tag 5.0.0.
+SRCREV = "6ec4196a59db8204ed670ef3b78f24a8234b85a6"
+
+COMPATIBLE_HOST = "(arm|aarch64).*-linux"
+KERNEL_MODULE_AUTOLOAD += "arm-ffa-user"
+KERNEL_MODULE_PROBECONF += "arm-ffa-user"
+
+# This debugfs driver is used only by uefi-test for testing SmmGW SP
+# UUIDs = SMM Gateway SP
+FFA-USER-UUID-LIST ?= "ed32d533-99e6-4209-9cc0-2d72cdd998a7"
+module_conf_arm-ffa-user = "options arm-ffa-user uuid_str_list=${FFA-USER-UUID-LIST}"
+
+do_install:append() {
+    install -d ${D}${includedir}
+    install -m 0644 ${S}/arm_ffa_user.h ${D}${includedir}/
+}
diff --git a/meta-arm/recipes-kernel/arm-ffa-user/files/Makefile b/meta-arm/recipes-kernel/arm-ffa-user/files/Makefile
new file mode 100644
index 00000000..c54d1fc3
--- /dev/null
+++ b/meta-arm/recipes-kernel/arm-ffa-user/files/Makefile
@@ -0,0 +1,14 @@
+obj-m := arm-ffa-user.o
+
+SRC := $(shell pwd)
+
+all:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
+
+modules_install:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+
+clean:
+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
+	rm -f Module.markers Module.symvers modules.order
+	rm -rf .tmp_versions Modules.symvers
diff --git a/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc b/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
new file mode 100644
index 00000000..bc66efbf
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
@@ -0,0 +1,5 @@
+# Include a backport kernel patch for TEE driver
+
+SRC_URI:append = " \
+    file://Add-sec_world_id-to-struct-tee_shm.patch \
+    "
diff --git a/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
new file mode 100644
index 00000000..dec31dd4
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+# Enable ARM-FFA transport
+SRC_URI:append = " \
+    file://arm-ffa-transport.cfg \
+    "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-5.15/Add-sec_world_id-to-struct-tee_shm.patch b/meta-arm/recipes-kernel/linux/linux-yocto-5.15/Add-sec_world_id-to-struct-tee_shm.patch
new file mode 100644
index 00000000..8f54b308
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-5.15/Add-sec_world_id-to-struct-tee_shm.patch
@@ -0,0 +1,44 @@
+From 9028b2463c1ea96f51c3ba53e2479346019ff6ad Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 25 Mar 2021 15:08:44 +0100
+Subject: [PATCH] tee: add sec_world_id to struct tee_shm
+
+Adds sec_world_id to struct tee_shm which describes a shared memory
+object. sec_world_id can be used by a driver to store an id assigned by
+secure world.
+
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Submitted [https://github.com/torvalds/linux/commit/9028b2463c1ea96f51c3ba53e2479346019ff6ad]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ include/linux/tee_drv.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
+index 3ebfea0781f100..a1f03461369bd9 100644
+--- a/include/linux/tee_drv.h
++++ b/include/linux/tee_drv.h
+@@ -197,7 +197,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
+  * @num_pages:	number of locked pages
+  * @dmabuf:	dmabuf used to for exporting to user space
+  * @flags:	defined by TEE_SHM_* in tee_drv.h
+- * @id:		unique id of a shared memory object on this device
++ * @id:		unique id of a shared memory object on this device, shared
++ *		with user space
++ * @sec_world_id:
++ *		secure world assigned id of this shared memory object, not
++ *		used by all drivers
+  *
+  * This pool is only supposed to be accessed directly from the TEE
+  * subsystem and from drivers that implements their own shm pool manager.
+@@ -213,6 +217,7 @@ struct tee_shm {
+ 	struct dma_buf *dmabuf;
+ 	u32 flags;
+ 	int id;
++	u64 sec_world_id;
+ };
+ 
+ /**
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-unavailable-memory.patch b/meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-unavailable-memory.patch
new file mode 100644
index 00000000..d157ef70
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-5.15/skip-unavailable-memory.patch
@@ -0,0 +1,85 @@
+From 7bfeda1c9224270af97adf799ce0b5a4292bceb6 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Tue, 17 May 2022 11:14:10 +0100
+Subject: [PATCH] of/fdt: Ignore disabled memory nodes
+
+When we boot a machine using a devicetree, the generic DT code goes
+through all nodes with a 'device_type = "memory"' property, and collects
+all memory banks mentioned there. However it does not check for the
+status property, so any nodes which are explicitly "disabled" will still
+be added as a memblock.
+This ends up badly for QEMU, when booting with secure firmware on
+arm/arm64 machines, because QEMU adds a node describing secure-only
+memory:
+===================
+	secram@e000000 {
+		secure-status = "okay";
+		status = "disabled";
+		reg = <0x00 0xe000000 0x00 0x1000000>;
+		device_type = "memory";
+	};
+===================
+
+The kernel will eventually use that memory block (which is located below
+the main DRAM bank), but accesses to that will be answered with an
+SError:
+===================
+[    0.000000] Internal error: synchronous external abort: 96000050 [#1] PREEMPT SMP
+[    0.000000] Modules linked in:
+[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc6-00014-g10c8acb8b679 #524
+[    0.000000] Hardware name: linux,dummy-virt (DT)
+[    0.000000] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
+[    0.000000] pc : new_slab+0x190/0x340
+[    0.000000] lr : new_slab+0x184/0x340
+[    0.000000] sp : ffff80000a4b3d10
+....
+==================
+The actual crash location and call stack will be somewhat random, and
+depend on the specific allocation of that physical memory range.
+
+As the DT spec[1] explicitly mentions standard properties, add a simple
+check to skip over disabled memory nodes, so that we only use memory
+that is meant for non-secure code to use.
+
+That fixes booting a QEMU arm64 VM with EL3 enabled ("secure=on"), when
+not using UEFI. In this case the QEMU generated DT will be handed on
+to the kernel, which will see the secram node.
+This issue is reproducible when using TF-A together with U-Boot as
+firmware, then booting with the "booti" command.
+
+When using U-Boot as an UEFI provider, the code there [2] explicitly
+filters for disabled nodes when generating the UEFI memory map, so we
+are safe.
+EDK/2 only reads the first bank of the first DT memory node [3] to learn
+about memory, so we got lucky there.
+
+[1] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#memory-node (after the table)
+[2] https://source.denx.de/u-boot/u-boot/-/blob/master/lib/fdtdec.c#L1061-1063
+[3] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/PrePi/FdtParser.c
+
+Reported-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-arm-kernel/20220517101410.3493781-1-andre.przywara@arm.com/T/#u]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ drivers/of/fdt.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
+index 59a7a9ee58ef..5439c899fe04 100644
+--- a/drivers/of/fdt.c
++++ b/drivers/of/fdt.c
+@@ -1102,6 +1102,9 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
+ 	if (type == NULL || strcmp(type, "memory") != 0)
+ 		return 0;
+ 
++	if (!of_fdt_device_is_available(initial_boot_params, node))
++		return 0;
++
+ 	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
+ 	if (reg == NULL)
+ 		reg = of_get_flat_dt_prop(node, "reg", &l);
+-- 
+2.25.1
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg
new file mode 100644
index 00000000..34de78e8
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/arm-ffa-transport.cfg
@@ -0,0 +1 @@
+CONFIG_ARM_FFA_TRANSPORT=y
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg
new file mode 100644
index 00000000..d372acae
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/no-strict-devmem.cfg
@@ -0,0 +1 @@
+CONFIG_STRICT_DEVMEM=n
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 24ace0e7..896add8d 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -11,6 +11,11 @@ SRC_URI:append:qemuarm64-secureboot = " \
     file://tee.cfg \
     "
 
+# for Trusted Services uefi-test tool if SMM-Gateway is included
+SRC_URI:append:qemuarm64-secureboot = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', 'file://no-strict-devmem.cfg', '' , d)} \
+    "
+
 FILESEXTRAPATHS:prepend:qemuarm-secureboot = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm-secureboot = " \
     file://tee.cfg \
@@ -21,3 +26,6 @@ SRC_URI:append:qemuarm64 = " file://efi.cfg"
 
 FILESEXTRAPATHS:prepend:qemuarm = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm = " file://efi.cfg"
+
+FFA_TRANSPORT_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-transport.inc', '' , d)}"
+require ${FFA_TRANSPORT_INCLUDE}
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend
new file mode 100644
index 00000000..9a18dd8a
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.15:"
+
+SRC_URI:append:qemuarm64-secureboot = " \
+    file://skip-unavailable-memory.patch \
+    "
+
+FFA_TEE_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-5.15.inc', '' , d)}"
+require ${FFA_TEE_INCLUDE}
-- 
2.25.1


