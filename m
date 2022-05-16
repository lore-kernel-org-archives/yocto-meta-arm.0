Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E6AC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:20:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.273.1652718049464054832
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACFE21063;
	Mon, 16 May 2022 09:20:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CB673F73D;
	Mon, 16 May 2022 09:20:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/linux-yocto: fix boot failure in qemuarm64-secureboot
Date: Mon, 16 May 2022 17:20:44 +0100
Message-Id: <20220516162044.2724659-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3404

The boot crash that appears to be triggered by the ZONE_DMA patches has
been root-caused, so work around the problem whilst upstream figure out
the best way to fix.

Also, upgrade qemuarm64-secureboot to 5.15 instead of pinning back to
5.10.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../conf/machine/qemuarm64-secureboot.conf    |   2 -
 .../linux-yocto/skip-unavailable-memory.patch |  47 ++++
 .../linux/linux-yocto/zone_dma_revert.patch   | 218 ------------------
 .../linux/linux-yocto_%.bbappend              |   2 +-
 4 files changed, 48 insertions(+), 221 deletions(-)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/skip-unavai=
lable-memory.patch
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_re=
vert.patch

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index a467b204..55c4cab4 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -23,5 +23,3 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
 IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
=20
 MACHINE_FEATURES +=3D "optee-ftpm"
-
-PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-m=
emory.patch b/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-=
memory.patch
new file mode 100644
index 00000000..b75cd567
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.p=
atch
@@ -0,0 +1,47 @@
+When in secure mode, qemu's devicetree has the following node to mark th=
e
+secure memory as off-limits to non-secure environments:
+
+  secram@e000000 {
+    secure-status =3D "okay";
+    status =3D "disabled";
+    reg =3D <0x00 0xe000000 0x00 0x1000000>;
+    device_type =3D "memory";
+  };
+
+However, the kernel doesn't think that means the memory is off-limits:
+
+  Early memory node ranges
+    node   0: [mem 0x000000000e000000-0x000000000e0fffff]
+
+And not far into the boot accesses this region and crashes:
+
+  Internal error: synchronous external abort: 96000050 15 PREEMPT SMP
+
+This used to work more through luck than judgement, but recent changes t=
o
+memory zoning[1] means this region is accessed more frequently.
+
+At present there is debate between qemu and kernel engineers over whethe=
r
+the kernel should be ignoring regions marked like this, or if qemu
+should block out the region in a different way. Until this is resolved,
+we can make a choice and simply ignore memory ranges that are marked
+as disabled.
+
+Upstream-Status: Pending [discussion ongoing]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3D35ec3d09ff6a49ee90e1bfd09166596f017eb5bb
+
+diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
+index 59a7a9ee58ef..d151a31adbf9 100644
+--- a/drivers/of/fdt.c
++++ b/drivers/of/fdt.c
+@@ -1102,6 +1102,9 @@ int __init early_init_dt_scan_memory(unsigned long=
 node, const char *uname,
+ 	if (type =3D=3D NULL || strcmp(type, "memory") !=3D 0)
+ 		return 0;
+=20
++	if (!of_fdt_device_is_available(initial_boot_params, node))
++		return 0;
++
+ 	reg =3D of_get_flat_dt_prop(node, "linux,usable-memory", &l);
+ 	if (reg =3D=3D NULL)
+ 		reg =3D of_get_flat_dt_prop(node, "reg", &l);
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.pa=
tch b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
deleted file mode 100644
index 8659d08e..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-Revert ZONE_DMA patches
-
-Upstream-Status: Inappropriate
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm=
/processor.h
-index fce8cbecd6bc..a884d7773989 100644
---- a/arch/arm64/include/asm/processor.h
-+++ b/arch/arm64/include/asm/processor.h
-@@ -96,7 +96,8 @@
- #endif /* CONFIG_ARM64_FORCE_52BIT */
-=20
- extern phys_addr_t arm64_dma_phys_limit;
--#define ARCH_LOW_ADDRESS_LIMIT	(arm64_dma_phys_limit - 1)
-+extern phys_addr_t arm64_dma32_phys_limit;
-+#define ARCH_LOW_ADDRESS_LIMIT	((arm64_dma_phys_limit ? : arm64_dma32_p=
hys_limit) - 1)
-=20
- struct debug_info {
- #ifdef CONFIG_HAVE_HW_BREAKPOINT
-diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
-index a985d292e820..7fbb9c85af8a 100644
---- a/arch/arm64/mm/init.c
-+++ b/arch/arm64/mm/init.c
-@@ -29,7 +29,6 @@
- #include <linux/kexec.h>
- #include <linux/crash_dump.h>
- #include <linux/hugetlb.h>
--#include <linux/acpi_iort.h>
-=20
- #include <asm/boot.h>
- #include <asm/fixmap.h>
-@@ -43,6 +42,8 @@
- #include <asm/tlb.h>
- #include <asm/alternative.h>
-=20
-+#define ARM64_ZONE_DMA_BITS	30
-+
- /*
-  * We need to be able to catch inadvertent references to memstart_addr
-  * that occur (potentially in generic code) before arm64_memblock_init(=
)
-@@ -53,13 +54,13 @@ s64 memstart_addr __ro_after_init =3D -1;
- EXPORT_SYMBOL(memstart_addr);
-=20
- /*
-- * If the corresponding config options are enabled, we create both ZONE=
_DMA
-- * and ZONE_DMA32. By default ZONE_DMA covers the 32-bit addressable me=
mory
-- * unless restricted on specific platforms (e.g. 30-bit on Raspberry Pi=
 4).
-- * In such case, ZONE_DMA32 covers the rest of the 32-bit addressable m=
emory,
-- * otherwise it is empty.
-+ * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G=
 of
-+ * memory as some devices, namely the Raspberry Pi 4, have peripherals =
with
-+ * this limited view of the memory. ZONE_DMA32 will cover the rest of t=
he 32
-+ * bit addressable memory area.
-  */
- phys_addr_t arm64_dma_phys_limit __ro_after_init;
-+phys_addr_t arm64_dma32_phys_limit __ro_after_init;
-=20
- #ifdef CONFIG_KEXEC_CORE
- /*
-@@ -84,7 +85,7 @@ static void __init reserve_crashkernel(void)
-=20
- 	if (crash_base =3D=3D 0) {
- 		/* Current arm64 boot protocol requires 2MB alignment */
--		crash_base =3D memblock_find_in_range(0, arm64_dma_phys_limit,
-+		crash_base =3D memblock_find_in_range(0, arm64_dma32_phys_limit,
- 				crash_size, SZ_2M);
- 		if (crash_base =3D=3D 0) {
- 			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
-@@ -187,24 +188,15 @@ static phys_addr_t __init max_zone_phys(unsigned i=
nt zone_bits)
- static void __init zone_sizes_init(unsigned long min, unsigned long max=
)
- {
- 	unsigned long max_zone_pfns[MAX_NR_ZONES]  =3D {0};
--	unsigned int __maybe_unused acpi_zone_dma_bits;
--	unsigned int __maybe_unused dt_zone_dma_bits;
--	phys_addr_t __maybe_unused dma32_phys_limit =3D max_zone_phys(32);
-=20
- #ifdef CONFIG_ZONE_DMA
--	acpi_zone_dma_bits =3D fls64(acpi_iort_dma_get_max_cpu_address());
--	dt_zone_dma_bits =3D fls64(of_dma_get_max_cpu_address(NULL));
--	zone_dma_bits =3D min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
-+	zone_dma_bits =3D ARM64_ZONE_DMA_BITS;
- 	arm64_dma_phys_limit =3D max_zone_phys(zone_dma_bits);
- 	max_zone_pfns[ZONE_DMA] =3D PFN_DOWN(arm64_dma_phys_limit);
- #endif
- #ifdef CONFIG_ZONE_DMA32
--	max_zone_pfns[ZONE_DMA32] =3D PFN_DOWN(dma32_phys_limit);
--	if (!arm64_dma_phys_limit)
--		arm64_dma_phys_limit =3D dma32_phys_limit;
-+	max_zone_pfns[ZONE_DMA32] =3D PFN_DOWN(arm64_dma32_phys_limit);
- #endif
--	if (!arm64_dma_phys_limit)
--		arm64_dma_phys_limit =3D PHYS_MASK + 1;
- 	max_zone_pfns[ZONE_NORMAL] =3D max;
-=20
- 	free_area_init(max_zone_pfns);
-@@ -398,9 +390,16 @@ void __init arm64_memblock_init(void)
-=20
- 	early_init_fdt_scan_reserved_mem();
-=20
-+	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-+		arm64_dma32_phys_limit =3D max_zone_phys(32);
-+	else
-+		arm64_dma32_phys_limit =3D PHYS_MASK + 1;
-+
- 	reserve_elfcorehdr();
-=20
- 	high_memory =3D __va(memblock_end_of_DRAM() - 1) + 1;
-+
-+	dma_contiguous_reserve(arm64_dma32_phys_limit);
- }
-=20
- void __init bootmem_init(void)
-@@ -435,11 +434,6 @@ void __init bootmem_init(void)
- 	sparse_init();
- 	zone_sizes_init(min, max);
-=20
--	/*
--	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
--	 */
--	dma_contiguous_reserve(arm64_dma_phys_limit);
--
- 	/*
- 	 * request_standard_resources() depends on crashkernel's memory being
- 	 * reserved, so do it here.
-@@ -522,7 +516,7 @@ static void __init free_unused_memmap(void)
- void __init mem_init(void)
- {
- 	if (swiotlb_force =3D=3D SWIOTLB_FORCE ||
--	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
-+	    max_pfn > PFN_DOWN(arm64_dma_phys_limit ? : arm64_dma32_phys_limit=
))
- 		swiotlb_init(1);
- 	else
- 		swiotlb_force =3D SWIOTLB_NO_FORCE;
-diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
-index 2494138a6905..94f34109695c 100644
---- a/drivers/acpi/arm64/iort.c
-+++ b/drivers/acpi/arm64/iort.c
-@@ -1730,58 +1730,3 @@ void __init acpi_iort_init(void)
-=20
- 	iort_init_platform_devices();
- }
--
--#ifdef CONFIG_ZONE_DMA
--/*
-- * Extract the highest CPU physical address accessible to all DMA maste=
rs in
-- * the system. PHYS_ADDR_MAX is returned when no constrained device is =
found.
-- */
--phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
--{
--	phys_addr_t limit =3D PHYS_ADDR_MAX;
--	struct acpi_iort_node *node, *end;
--	struct acpi_table_iort *iort;
--	acpi_status status;
--	int i;
--
--	if (acpi_disabled)
--		return limit;
--
--	status =3D acpi_get_table(ACPI_SIG_IORT, 0,
--				(struct acpi_table_header **)&iort);
--	if (ACPI_FAILURE(status))
--		return limit;
--
--	node =3D ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
--	end =3D ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length)=
;
--
--	for (i =3D 0; i < iort->node_count; i++) {
--		if (node >=3D end)
--			break;
--
--		switch (node->type) {
--			struct acpi_iort_named_component *ncomp;
--			struct acpi_iort_root_complex *rc;
--			phys_addr_t local_limit;
--
--		case ACPI_IORT_NODE_NAMED_COMPONENT:
--			ncomp =3D (struct acpi_iort_named_component *)node->node_data;
--			local_limit =3D DMA_BIT_MASK(ncomp->memory_address_limit);
--			limit =3D min_not_zero(limit, local_limit);
--			break;
--
--		case ACPI_IORT_NODE_PCI_ROOT_COMPLEX:
--			if (node->revision < 1)
--				break;
--
--			rc =3D (struct acpi_iort_root_complex *)node->node_data;
--			local_limit =3D DMA_BIT_MASK(rc->memory_address_limit);
--			limit =3D min_not_zero(limit, local_limit);
--			break;
--		}
--		node =3D ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
--	}
--	acpi_put_table(&iort->header);
--	return limit;
--}
--#endif
-diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
-index 1a12baa58e40..20a32120bb88 100644
---- a/include/linux/acpi_iort.h
-+++ b/include/linux/acpi_iort.h
-@@ -38,7 +38,6 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr,=
 u64 *size);
- const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
- 						const u32 *id_in);
- int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_hea=
d *head);
--phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
- #else
- static inline void acpi_iort_init(void) { }
- static inline u32 iort_msi_map_id(struct device *dev, u32 id)
-@@ -56,9 +55,6 @@ static inline const struct iommu_ops *iort_iommu_confi=
gure_id(
- static inline
- int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_hea=
d *head)
- { return 0; }
--
--static inline phys_addr_t acpi_iort_dma_get_max_cpu_address(void)
--{ return PHYS_ADDR_MAX; }
- #endif
-=20
- #endif /* __ACPI_IORT_H__ */
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
arm/recipes-kernel/linux/linux-yocto_%.bbappend
index f12dc7cb..b75c1405 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -8,6 +8,6 @@ SRC_URI:append:generic-arm64 =3D " \
=20
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot =3D " \
-    file://zone_dma_revert.patch \
+    file://skip-unavailable-memory.patch \
     file://tee.cfg \
     "
--=20
2.25.1


