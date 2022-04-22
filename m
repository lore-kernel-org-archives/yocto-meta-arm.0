Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F49C636C8
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10743.1650643782310551838
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E120F1FB;
	Fri, 22 Apr 2022 09:09:41 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.95.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A54EC3F5A1;
	Fri, 22 Apr 2022 09:09:40 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 4/6] arm-bsp/boot-wrapper-aarch64: Add fvp-baser support for
 EL2 SMP payloads
Date: Fri, 22 Apr 2022 17:08:58 +0100
Message-Id: <20220422160900.1861031-4-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422160900.1861031-1-peter.hoyes@arm.com>
References: <20220422160900.1861031-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3289

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add additional fvp-baser-aemv8r64-specific patches for
boot-wrapper-aarch64. These patches add a "function call" entry point
for the PSCI services, so that payloads starting at S-EL2 (e.g. Xen) can
boot the secondary cores.

Issue-ID: SCM-4386
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I961c78352987f711664e06ab39b00f6eb97a81de
---
 .../documentation/fvp-baser-aemv8r64.md       |   1 +
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |   5 +
 ...lush-cache-after-setting-branch_data.patch |  52 +++
 ...8-PSCI-Add-function-call-entry-point.patch |  74 ++++
 ...-lds-Rearrange-and-mark-the-sections.patch |  61 ++++
 ...n-Provide-firmware-info-using-libfdt.patch | 345 ++++++++++++++++++
 ...-Enable-firmware-node-initialization.patch |  98 +++++
 7 files changed, 636 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0017-PSCI-Apply-flush-cache-after-setting-branch_data.p=
atch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0018-PSCI-Add-function-call-entry-point.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0019-lds-Rearrange-and-mark-the-sections.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0020-common-Provide-firmware-info-using-libfdt.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0021-boot-Enable-firmware-node-initialization.patch

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 9880896..4cd18f0 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -234,6 +234,7 @@ Known Issues and Limitations
=20
 Change Log
 ----------
+- Added boot-wrapper-aarch64 support for booting SMP payloads at S-EL2.
 - Enabled testimage support by default.
 - Added virtio\_rng to improve random number generation.
 - Added U-Boot v2022.01 for UEFI support.
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-a=
arch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aar=
ch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
index 6bc7385..8ffa0aa 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
@@ -18,6 +18,11 @@ SRC_URI:append =3D " \
     file://0014-common-Add-mem-usage-to-memreserve.patch \
     file://0015-boot-Add-the-enable-keep-el-compile-option.patch \
     file://0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch \
+    file://0017-PSCI-Apply-flush-cache-after-setting-branch_data.patch \
+    file://0018-PSCI-Add-function-call-entry-point.patch \
+    file://0019-lds-Rearrange-and-mark-the-sections.patch \
+    file://0020-common-Provide-firmware-info-using-libfdt.patch \
+    file://0021-boot-Enable-firmware-node-initialization.patch \
     "
=20
 BOOT_WRAPPER_AARCH64_CMDLINE =3D "\
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0017-PSCI-Apply-flush-cache-after-setting-branch_data.patch b/=
meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/00=
17-PSCI-Apply-flush-cache-after-setting-branch_data.patch
new file mode 100644
index 0000000..8d981f5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0017-PSCI-Apply-flush-cache-after-setting-branch_data.patch
@@ -0,0 +1,52 @@
+From 6923f2a0c59cf92ba5ad50ec1d658a357b4ba5d7 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 2 Nov 2021 10:48:39 +0800
+Subject: [PATCH] PSCI: Apply flush cache after setting branch_data
+
+For v8-R64, Hypervisor calls boot-wrapper's PSCI service using simple
+function call (instead of hvc).
+
+In this case, hypervisor's main core has enabled MPU and cache, but
+the secondary cores which are spinning have not enabled cache.
+That means if the main core set the branch_data to 1 to boot other
+cores, the secondary cores cannot see the change of branch_data and
+also cannot break the spin.
+
+Thus, the PSCI service in boot-wrapper needs a cache flush after
+setting branch_data in order to let other cores see the change.
+
+Issue-ID: SCM-3816
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: Ifc282091c54d8fb2ffdb8cfa7fd3ffc1f4be717e
+---
+ common/psci.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/common/psci.c b/common/psci.c
+index 945780b..6efc695 100644
+--- a/common/psci.c
++++ b/common/psci.c
+@@ -24,12 +24,18 @@ static unsigned long branch_table[NR_CPUS];
+=20
+ bakery_ticket_t branch_table_lock[NR_CPUS];
+=20
++static inline void flush_per_cpu_data(void *data)
++{
++	asm volatile ("dc cvac, %0" : : "r" (data));
++}
++
+ static int psci_store_address(unsigned int cpu, unsigned long address)
+ {
+ 	if (branch_table[cpu] !=3D PSCI_ADDR_INVALID)
+ 		return PSCI_RET_ALREADY_ON;
+=20
+ 	branch_table[cpu] =3D address;
++	flush_per_cpu_data((void*)&(branch_table[cpu]));
+ 	return PSCI_RET_SUCCESS;
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0018-PSCI-Add-function-call-entry-point.patch b/meta-arm-bsp/r=
ecipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0018-PSCI-Add-fu=
nction-call-entry-point.patch
new file mode 100644
index 0000000..97cd3cb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0018-PSCI-Add-function-call-entry-point.patch
@@ -0,0 +1,74 @@
+From ed46e83df2400b1b3f3364169aacf787bd91bd45 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 25 Jan 2022 14:56:36 +0800
+Subject: [PATCH] PSCI: Add function call entry point
+
+The max exception level of Armv8R AArch64 is EL2, which means it has no
+exclusive EL for firmware. That is, firmware and hypervisors have to sha=
re
+the EL2. Also, hypervisors cannot call firmware services via a 'smc'
+instruction. Thus, boot-wrapper has to provide a function entry point
+for Armv8R AArch64.
+
+Issue-Id: SCM-3816
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I06ec8e50298603155c6d8ae2330e71db2f111182
+---
+ common/psci.c | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/common/psci.c b/common/psci.c
+index 6efc695..8fdefb5 100644
+--- a/common/psci.c
++++ b/common/psci.c
+@@ -20,6 +20,8 @@
+=20
+ extern unsigned int spsr_to_elx;
+=20
++unsigned long flag_from_smc_fn[NR_CPUS];
++
+ static unsigned long branch_table[NR_CPUS];
+=20
+ bakery_ticket_t branch_table_lock[NR_CPUS];
+@@ -49,12 +51,14 @@ static int psci_cpu_on(unsigned long target_mpidr, u=
nsigned long address)
+ 		return PSCI_RET_INVALID_PARAMETERS;
+=20
+ 	bakery_lock(branch_table_lock, this_cpu);
+-	ret =3D psci_store_address(cpu, address);
+-	bakery_unlock(branch_table_lock, this_cpu);
+-
+ #ifdef KEEP_EL
+-	spsr_to_elx =3D SPSR_KERNEL_EL1;
++	if (!flag_from_smc_fn[this_cpu]) {
++		spsr_to_elx =3D SPSR_KERNEL_EL1;
++		flush_per_cpu_data((void*)&(spsr_to_elx));
++	}
+ #endif
++	ret =3D psci_store_address(cpu, address);
++	bakery_unlock(branch_table_lock, this_cpu);
+=20
+ 	return ret;
+ }
+@@ -90,6 +94,18 @@ long psci_call(unsigned long fid, unsigned long arg1,=
 unsigned long arg2)
+ 	}
+ }
+=20
++long smc_fn_entry(unsigned long fid, unsigned long arg1, unsigned long =
arg2)
++{
++	long ret;
++	unsigned int this_cpu =3D this_cpu_logical_id();
++
++	flag_from_smc_fn[this_cpu] =3D 1;
++	ret =3D psci_call(fid, arg1, arg2);
++	flag_from_smc_fn[this_cpu] =3D 0;
++
++	return ret;
++}
++
+ void __noreturn psci_first_spin(unsigned int cpu)
+ {
+ 	if (cpu =3D=3D MPIDR_INVALID)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0019-lds-Rearrange-and-mark-the-sections.patch b/meta-arm-bsp/=
recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0019-lds-Rearra=
nge-and-mark-the-sections.patch
new file mode 100644
index 0000000..1f10209
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0019-lds-Rearrange-and-mark-the-sections.patch
@@ -0,0 +1,61 @@
+From 36b5fa3f4db49ac7aef42ff1d58a895226c7e96c Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 2 Nov 2021 15:10:28 +0800
+Subject: [PATCH] lds: Rearrange and mark the sections
+
+To make it possible for the next stage to protect sections with MPU,
+boot-wrapper needs to provide the text and data section information.
+By rearranging the .data .rodata and .vector sections, all sections
+can be split into 2 big sections:
+ - RO and Executable
+ - RW and Non-Executable
+Add firmware_data to mark the boundry, thus:
+firmware_start to firmware_data - 1 indicates RO and Executable section,
+firmware_data to firmware_end - 1 indicates RW and Non-Executable
+section.
+
+Also, the firmware_data and firmware_end should align with 64 bytes,
+since Armv8R AArch64 MPU requires it.
+
+Issue-ID: SCM-3816
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I55342aa7492f2c7b5c16ab9a6472c8cb45cff8fd
+---
+ model.lds.S | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/model.lds.S b/model.lds.S
+index ab98ddf..85451f9 100644
+--- a/model.lds.S
++++ b/model.lds.S
+@@ -63,12 +63,16 @@ SECTIONS
+ 	}
+ #endif
+=20
++#define FIRMWARE_ALIGN . =3D ALIGN(1 << 6)
+ 	.boot PHYS_OFFSET: {
+ 		PROVIDE(firmware_start =3D .);
+ 		*(.init)
+ 		*(.text*)
+-		*(.data* .rodata* .bss* COMMON)
+ 		*(.vectors)
++		*(.rodata*)
++		FIRMWARE_ALIGN;
++		PROVIDE(firmware_data =3D .);
++		*(.data* .bss* COMMON)
+ 		*(.stack)
+ 		PROVIDE(etext =3D .);
+ 	}
+@@ -77,6 +81,7 @@ SECTIONS
+ 		mbox =3D .;
+ 		QUAD(0x0)
+ 	}
++	FIRMWARE_ALIGN;
+ 	PROVIDE(firmware_end =3D .);
+=20
+ 	ASSERT(etext <=3D (PHYS_OFFSET + TEXT_LIMIT), ".text overflow!")
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0020-common-Provide-firmware-info-using-libfdt.patch b/meta-ar=
m-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0020-comm=
on-Provide-firmware-info-using-libfdt.patch
new file mode 100644
index 0000000..cafcc09
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0020-common-Provide-firmware-info-using-libfdt.patch
@@ -0,0 +1,345 @@
+From 8bdbb64d13f14d40546b71dbcfee2b2a8ea002a5 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Wed, 29 Dec 2021 15:17:38 +0800
+Subject: [PATCH] common: Provide firmware info using libfdt
+
+Boot-wrapper uses libfdt to provide more info in device tree.
+We add a new node to include those new firmware relevant infomation.
+The new node defined as follows:
+  fw-shared-info {
+        compatible =3D "firmware,shared_info";
+
+        #address-cells =3D <0x02>;
+        #size-cells =3D <0x02>;
+
+        version =3D "1.0";
+        regions =3D <START_ADDR_HIGH START_ADDR_LOW SIZE_HIGH SIZE_LOW
+                   0x0 0x80000000 0x0 0x400000
+                   0x0 0x90000000 0x0 0x400000
+                   0x0 0xA0000000 0x0 0x400000>;
+        regions-permission =3D "RX", "R", "RWX", "RW";
+        regions-cache =3D "Cache", "NCache", "Cache", "Device"
+
+        function_entry =3D <ENTRY_ADDR_HIGH ENRTY_ADDR_LOW>;
+  };
+The node path is /fw-shared-info.
+For boot-wrapper, in real case, it will be:
+  fw-shared-info {
+        compatible =3D "firmware,shared_info";
+
+        #address-cells =3D <0x02>;
+        #size-cells =3D <0x02>;
+
+        version =3D "1.0";
+        regions =3D <0x0 firmware_start 0x0 firmware_code_size
+                   0x0 firmware_data 0x0 firmware_data_size>;
+        regions-permission =3D "RX", "RW";
+        regions-cache =3D "Cache", "Cache";
+
+        function_entry =3D <0x0 smc_fn_entry>;
+  };
+
+Issue-Id: SCM-3816
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I6ebc59ce2bd3939b0fe066720d57821eaa1bed27
+---
+ common/device_tree.c | 271 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 270 insertions(+), 1 deletion(-)
+
+diff --git a/common/device_tree.c b/common/device_tree.c
+index 4d0876c..7f7befc 100644
+--- a/common/device_tree.c
++++ b/common/device_tree.c
+@@ -8,13 +8,225 @@
+  */
+ #include <libfdt.h>
+=20
++#define DEVICE_TREE_DEBUG 1
++
++#define FW_NODE_NAME	"/fw-shared-info"
++#define FW_COMPAT	"firmware,shared_info"
++#define FW_INFO_VER	"1.0"
++
++#ifdef BOOTWRAPPER_32
++#define CELL_NUM	1
++#define VAL_TYPE	uint32_t
++#else
++#define CELL_NUM	2
++#define VAL_TYPE	uint64_t
++#endif
++
++#define ALIGN(x)	(((x) + (FDT_TAGSIZE) - 1) & ~((FDT_TAGSIZE) - 1))
++
+ extern unsigned long dtb;
+-extern char firmware_start[], firmware_end[];
++extern char firmware_start[], firmware_data[], firmware_end[];
++
++extern long smc_fn_entry(unsigned long, unsigned long, unsigned long);
+=20
+ extern void print_string(const char *str);
++extern void print_hex(unsigned int val);
+=20
+ static void *blob;
+=20
++static char *realloc_node(char *fdt, const char *name)
++{
++	int delta;
++	int new_sz;
++	/* FDT_BEGIN_NODE, node name in off_struct and FDT_END_NODE */
++	delta =3D sizeof(struct fdt_node_header) + ALIGN(strlen(name) + 1)
++			+ FDT_TAGSIZE;
++	new_sz =3D fdt_totalsize(fdt) + delta;
++	fdt_open_into(fdt, fdt, new_sz);
++	return fdt;
++}
++
++static int create_node(const char *node_name)
++{
++	int node =3D 0;
++	char *p;
++
++	p =3D strrchr(node_name, '/');
++	if (!p) {
++		print_string("node name without '/'\r\n");
++		return -1;
++	}
++	*p =3D '\0';
++
++	blob =3D realloc_node(blob, p + 1);
++
++	if (p > node_name) {
++		node =3D fdt_path_offset(blob, node_name);
++		if (node < 0) {
++			print_string("no node name\r\n");
++			return -1;
++		}
++	}
++
++	node =3D fdt_add_subnode(blob, node, p + 1);
++	if (node < 0) {
++		print_string("add subnode err\r\n");
++		return -1;
++	}
++
++	return node;
++}
++
++static int dt_create_fw_node(void) {
++	int fw_node;
++
++	fw_node =3D fdt_path_offset(blob, FW_NODE_NAME);
++
++	if(fw_node < 0) {
++		fw_node =3D create_node(FW_NODE_NAME);
++	}
++
++	return fw_node;
++}
++
++static char *realloc_property(char *fdt, int nodeoffset, const char *na=
me,
++			      int newlen)
++{
++	int delta =3D 0;
++	int oldlen =3D 0;
++	int new_sz;
++
++	if (!fdt_get_property(fdt, nodeoffset, name, &oldlen))
++		delta =3D sizeof(struct fdt_property) + strlen(name) + 1;
++
++	if (newlen > oldlen)
++		delta +=3D ALIGN(newlen) - ALIGN(oldlen);
++
++	new_sz =3D fdt_totalsize(fdt) + delta;
++	fdt_open_into(fdt, fdt, new_sz);
++	return fdt;
++}
++
++static void dt_set_prop(int node, char *property, void *buf, int len)
++{
++	int err;
++
++	err =3D fdt_setprop(blob, node, property, buf, len);
++	if (err =3D=3D -FDT_ERR_NOSPACE) {
++		blob =3D realloc_property(blob, node, property, len);
++		err =3D fdt_setprop(blob, node, property, buf, len);
++	}
++	if (err) {
++		print_string("fdt error\n\r");
++	}
++}
++
++static void dt_set_prop_u32(int node, char *property, uint32_t val)
++{
++	fdt32_t fdt_val =3D cpu_to_fdt32(val);
++	int len =3D sizeof(fdt32_t);
++
++	dt_set_prop(node, property, (void*)&fdt_val, len);
++}
++
++static void dt_set_prop_u64(int node, char *property, uint64_t val)
++{
++	fdt64_t fdt_val =3D cpu_to_fdt64(val);
++	int len =3D sizeof(fdt64_t);
++
++	dt_set_prop(node, property, (void*)&fdt_val, len);
++}
++
++/* This dt_set_prop_u32_array maybe unused according to the BOOTWRAPPER=
_32 */
++__attribute__((unused))
++static void dt_set_prop_u32_array(int node, char *property, uint32_t *v=
als,
++				       int size)
++{
++	fdt32_t *fdt_vals =3D (fdt32_t*)vals;
++	int len =3D sizeof(fdt32_t) * size;
++
++	for (int i =3D 0; i < size; i++) {
++		fdt_vals[i] =3D cpu_to_fdt32(vals[i]);
++	}
++
++	dt_set_prop(node, property, (void*)fdt_vals, len);
++}
++
++static void dt_set_prop_u64_array(int node, char *property, uint64_t *v=
als,
++				       int size)
++{
++	fdt64_t *fdt_vals =3D (fdt64_t*)vals;
++	int len =3D sizeof(fdt64_t) * size;
++
++	for (int i =3D 0; i < size; i++) {
++		fdt_vals[i] =3D cpu_to_fdt64(vals[i]);
++	}
++
++	dt_set_prop(node, property, (void*)fdt_vals, len);
++}
++
++#if DEVICE_TREE_DEBUG
++static void dt_dump_string(const void *s, int len)
++{
++	char *sub =3D (char*)s;
++	int sublen;
++	while(*sub && ((uint64_t)sub - (uint64_t)s) < len) {
++		sublen =3D strlen(sub) + 1;
++		print_string(sub);
++		print_string(" ");
++		sub +=3D sublen;
++	}
++	print_string("\n\r");
++}
++
++static void dt_dump_fdt32_array(const void *vals, int len)
++{
++	fdt32_t *fdt_vals =3D (fdt32_t*)vals;
++	len =3D len / sizeof(fdt32_t);
++	for (int i =3D 0; i < len; i++) {
++		print_hex(fdt32_to_cpu(fdt_vals[i]));
++		print_string(" ");
++	}
++	print_string("\n\r");
++}
++
++static void dt_dump(int node, char *property, char type)
++{
++	const void *val;
++	int len;
++
++	val =3D fdt_getprop(blob, node, property, &len);
++	print_string(property);
++	print_string(": ");
++
++	if (type =3D=3D 's') {
++		/* string type */
++		dt_dump_string(val, len);
++		return;
++	}
++
++	/* uint type */
++	dt_dump_fdt32_array(val, len);
++}
++
++void dt_dump_all(int node)
++{
++	if (node >=3D 0) {
++		print_string(FW_NODE_NAME" info:\r\n");
++		dt_dump(node, "compatible", 's');
++		dt_dump(node, "version", 's');
++		dt_dump(node, "function_entry", 'i');
++		dt_dump(node, "address-cells", 'i');
++		dt_dump(node, "size-cells", 'i');
++		dt_dump(node, "regions", 'i');
++		dt_dump(node, "regions-permission", 's');
++		dt_dump(node, "regions-cache", 's');
++		print_string("\r\n");
++	}
++}
++#else
++void dt_dump_all(int node) { (void*)node; return; }
++#endif
+=20
+ void dt_add_memreserve(void)
+ {
+@@ -32,3 +244,60 @@ void dt_add_memreserve(void)
+ 		print_string("reserve mem add err\n\r");
+ 	}
+ }
++
++void dt_fw_node_init(int enable)
++{
++	int fw_node;
++
++	VAL_TYPE regions[] =3D {
++		/* code region: start, end, ro, x, cachable */
++		(VAL_TYPE)firmware_start,
++		(VAL_TYPE)(firmware_data - firmware_start),
++		/* data region: start, end, rw, xn, cachable */
++		(VAL_TYPE)firmware_data,
++		(VAL_TYPE)(firmware_end - firmware_data),
++	};
++	int regions_num =3D sizeof(regions) / sizeof(VAL_TYPE);
++	char regions_permission[] =3D "RX\0RW";
++	char regions_cache[] =3D "Cache\0Cache";
++
++	if (!enable)
++		return;
++
++	print_string("Prepare "FW_NODE_NAME" node\n\r");
++
++	blob =3D (void*)&dtb;
++
++	if(fdt_path_offset(blob, "/psci") < 0) {
++		print_string("/psci node not found\n\r");
++		return;
++	}
++
++	fw_node =3D dt_create_fw_node();
++
++	if(fw_node < 0) {
++		print_string(FW_NODE_NAME" node create err\n\r");
++	}
++
++	dt_set_prop(fw_node, "compatible", FW_COMPAT, sizeof(FW_COMPAT));
++	dt_set_prop(fw_node, "version", FW_INFO_VER, sizeof(FW_INFO_VER));
++
++	dt_set_prop_u32(fw_node, "address-cells", CELL_NUM);
++	dt_set_prop_u32(fw_node, "size-cells", CELL_NUM);
++	dt_set_prop(fw_node, "regions-permission", regions_permission,
++		    sizeof(regions_permission));
++	dt_set_prop(fw_node, "regions-cache", regions_cache,
++		    sizeof(regions_cache));
++
++#ifdef BOOTWRAPPER_32
++	dt_set_prop_u32_array(fw_node, "regions", regions, regions_num);
++	dt_set_prop_u32(fw_node, "function_entry", (VAL_TYPE)smc_fn_entry);
++#else
++	dt_set_prop_u64_array(fw_node, "regions", regions, regions_num);
++	dt_set_prop_u64(fw_node, "function_entry", (VAL_TYPE)smc_fn_entry);
++#endif
++
++	fdt_pack(blob);
++
++	dt_dump_all(fw_node);
++}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0021-boot-Enable-firmware-node-initialization.patch b/meta-arm=
-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0021-boot-=
Enable-firmware-node-initialization.patch
new file mode 100644
index 0000000..943afde
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0021-boot-Enable-firmware-node-initialization.patch
@@ -0,0 +1,98 @@
+From 6dfc937d1ae54d2ae9f8c60ca29ba73ca14dc8c4 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Wed, 29 Dec 2021 15:33:17 +0800
+Subject: [PATCH] boot: Enable firmware node initialization
+
+Enable the firmware node initialization, so that the next stage
+(hypervisor) could share the EL2 with firmware (boot-wrapper). The next
+stage (hypervisor) get the smccc entry point, code/data sections, the
+sections attrs and firmware node version and so on.
+It is worth noting that this EL2 sharing mechanism is only for Armv8R
+AArch64, thus add flag_v8r to record if the arch is Armv8R AArch64.
+Enable the firmware node initialization only if it is Armv8R AArch64.
+Also, we increase the stack size to 1024 to fix the stack overflow issue
+when using the libfdt.
+
+Add -fno-builtin options to CFLAGS to avoid the issue that the 'memset'
+in common/lib.c conflicts with builtin 'memset' function. GCC version
+>=3D 10 will have an incorrect compilation without -fno-builtin;
+
+Issue-Id: SCM-3816
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: Ib274485a34d26215595fd0cd737be86610289817
+---
+ Makefile.am         | 4 ++--
+ arch/aarch64/boot.S | 6 ++++++
+ common/boot.c       | 4 ++++
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 054becd..b01809c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -23,7 +23,7 @@ DEFINES		+=3D -DCPU_IDS=3D$(CPU_IDS)
+ DEFINES		+=3D -DNR_CPUS=3D$(NR_CPUS)
+ DEFINES		+=3D $(if $(SYSREGS_BASE), -DSYSREGS_BASE=3D$(SYSREGS_BASE), )
+ DEFINES		+=3D -DUART_BASE=3D$(UART_BASE)
+-DEFINES		+=3D -DSTACK_SIZE=3D256
++DEFINES		+=3D -DSTACK_SIZE=3D1024
+=20
+ if KERNEL_32
+ DEFINES		+=3D -DKERNEL_32
+@@ -132,7 +132,7 @@ CHOSEN_NODE	:=3D chosen {						\
+ CPPFLAGS	+=3D $(INITRD_FLAGS)
+ CFLAGS		+=3D -I$(top_srcdir)/include/ -I$(top_srcdir)/$(ARCH_SRC)/inclu=
de/
+ CFLAGS		+=3D -Wall -fomit-frame-pointer
+-CFLAGS 		+=3D -fno-stack-protector
++CFLAGS 		+=3D -fno-stack-protector -fno-builtin
+ CFLAGS		+=3D -ffunction-sections -fdata-sections
+ CFLAGS		+=3D -fno-pic -fno-pie
+ LDFLAGS		+=3D --gc-sections
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index 157c097..f310387 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -240,6 +240,10 @@ el2_init:
+ #endif
+ 	ldr	x1, =3Dspsr_to_elx
+ 	str	w0, [x1]
++
++	mov	w0, #1
++	ldr	x1, =3Dflag_v8r
++	str	w0, [x1]
+ 	// fall through
+=20
+ el_max_init:
+@@ -319,3 +323,5 @@ flag_keep_el:
+ 	.long 0
+ ASM_DATA(spsr_to_elx)
+ 	.long 0
++ASM_DATA(flag_v8r)
++	.long 0
+diff --git a/common/boot.c b/common/boot.c
+index ee2bea0..38b2dca 100644
+--- a/common/boot.c
++++ b/common/boot.c
+@@ -11,6 +11,9 @@
+=20
+ extern unsigned long entrypoint;
+ extern unsigned long dtb;
++extern unsigned int  flag_v8r;
++
++extern void dt_fw_node_init(int enable);
+=20
+ void init_platform(void);
+=20
+@@ -64,6 +67,7 @@ void __noreturn first_spin(unsigned int cpu, unsigned =
long *mbox,
+ 	if (cpu =3D=3D 0) {
+ 		init_platform();
+ 		dt_add_memreserve();
++		dt_fw_node_init(flag_v8r =3D=3D 1);
+=20
+ 		*mbox =3D (unsigned long)&entrypoint;
+ 		sevl();
+--=20
+2.25.1
+
--=20
2.25.1


