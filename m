Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12571.1618932478076829915
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 08:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C790A1474
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 08:27:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CC423F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 08:27:56 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: workaround qemuarm64-secureboot ZONE_DMA issues
Date: Mon, 19 Apr 2021 13:04:29 -0400
Message-Id: <20210419170429.9203-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Upstream stable patches for ZONE_DMA size and dma-ranges are causing:

Segmentation fault
[    3.156012] Internal error: synchronous external abort: 96000050 [#15] PREEMPT SMP
[    3.156172] Modules linked in:
[    3.156247] CPU: 0 PID: 139 Comm: rc Tainted: G      D           5.10.21-yocto-standard #1
[    3.156391] Hardware name: linux,dummy-virt (DT)
[    3.156490] pstate: 00000005 (nzcv daif -PAN -UAO -TCO BTYPE=--)
[    3.156619] pc : copy_page+0x40/0xc0
[    3.156691] lr : copy_highpage+0x58/0xe0
[    3.156786] sp : ffffffc01192bc10
[    3.156855] x29: ffffffc01192bc10 x28: ffffff804036a880
[    3.156958] x27: 0000000000000000 x26: ffffff80432e56f0
[    3.157063] x25: ffffff8043955c38 x24: 000000557a600000
[    3.157167] x23: ffffff80432e5680 x22: ffffffff00e4e940
[    3.157268] x21: ffffffff00180600 x20: ffffff800e018000
[    3.157378] x19: ffffff80413a5000 x18: 0000000000000000
[    3.157495] x17: 0000000000000000 x16: 000000557a5ffc48
[    3.157611] x15: 0000000000000001 x14: 0000000000000000
[    3.157715] x13: 000000557a60ae08 x12: 0000000000000000
[    3.157832] x11: 0000000000000000 x10: 0000000000000000
[    3.157920] x9 : 000000557a5fd010 x8 : 000000000557a600
[    3.158033] x7 : 0000000000000161 x6 : 0000000000000000
[    3.158140] x5 : 0000000000000000 x4 : 00005b0000000002
[    3.158238] x3 : 000000557a5fa550 x2 : 0000000000000000
[    3.158348] x1 : ffffff80413a5080 x0 : ffffff800e018100
[    3.158451] Call trace:
[    3.158501]  copy_page+0x40/0xc0
[    3.158572]  copy_user_highpage+0x24/0x40
[    3.158654]  wp_page_copy+0x90/0x790
[    3.158723]  do_wp_page+0xa4/0x490
[    3.158786]  handle_mm_fault+0x7b8/0xc30
[    3.158867]  do_page_fault+0x15c/0x400
[    3.158937]  do_mem_abort+0x4c/0xac
[    3.159004]  el0_da+0x3c/0x50
[    3.159070]  el0_sync_handler+0x168/0x1b0
[    3.159153]  el0_sync+0x174/0x180
[    3.159224] Code: 91040000 91020021 f2402c1f d503201f (a8300c02)
[    3.159343] ---[ end trace 06748391c33610de ]---

Temporarily revert these patches to allow for qemuarm64-secureboot to
continue working while the root cause is being investigated.  The
patches in question are:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=35ec3d09ff6a49ee90e1bfd09166596f017eb5bb
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8eaef922e9381af7b923c4e3c57a632a87101acb

Change-Id: I3cdea9469d940f6458d0ef65460f945c55eef3e3
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-yocto/zone_dma_revert.patch   | 126 ++++++++++++++++++
 .../linux/linux-yocto_5.10.bbappend           |   3 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
new file mode 100644
index 0000000..1295416
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
@@ -0,0 +1,126 @@
+Revert ZONE_DMA patches
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
+index 916e0547fdcc..7fbb9c85af8a 100644
+--- a/arch/arm64/mm/init.c
++++ b/arch/arm64/mm/init.c
+@@ -29,7 +29,6 @@
+ #include <linux/kexec.h>
+ #include <linux/crash_dump.h>
+ #include <linux/hugetlb.h>
+-#include <linux/acpi_iort.h>
+ 
+ #include <asm/boot.h>
+ #include <asm/fixmap.h>
+@@ -43,6 +42,8 @@
+ #include <asm/tlb.h>
+ #include <asm/alternative.h>
+ 
++#define ARM64_ZONE_DMA_BITS	30
++
+ /*
+  * We need to be able to catch inadvertent references to memstart_addr
+  * that occur (potentially in generic code) before arm64_memblock_init()
+@@ -187,13 +188,9 @@ static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
+ static void __init zone_sizes_init(unsigned long min, unsigned long max)
+ {
+ 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
+-	unsigned int __maybe_unused acpi_zone_dma_bits;
+-	unsigned int __maybe_unused dt_zone_dma_bits;
+ 
+ #ifdef CONFIG_ZONE_DMA
+-	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
+-	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
+-	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
++	zone_dma_bits = ARM64_ZONE_DMA_BITS;
+ 	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
+ 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
+ #endif
+diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
+index 2494138a6905..94f34109695c 100644
+--- a/drivers/acpi/arm64/iort.c
++++ b/drivers/acpi/arm64/iort.c
+@@ -1730,58 +1730,3 @@ void __init acpi_iort_init(void)
+ 
+ 	iort_init_platform_devices();
+ }
+-
+-#ifdef CONFIG_ZONE_DMA
+-/*
+- * Extract the highest CPU physical address accessible to all DMA masters in
+- * the system. PHYS_ADDR_MAX is returned when no constrained device is found.
+- */
+-phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
+-{
+-	phys_addr_t limit = PHYS_ADDR_MAX;
+-	struct acpi_iort_node *node, *end;
+-	struct acpi_table_iort *iort;
+-	acpi_status status;
+-	int i;
+-
+-	if (acpi_disabled)
+-		return limit;
+-
+-	status = acpi_get_table(ACPI_SIG_IORT, 0,
+-				(struct acpi_table_header **)&iort);
+-	if (ACPI_FAILURE(status))
+-		return limit;
+-
+-	node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
+-	end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
+-
+-	for (i = 0; i < iort->node_count; i++) {
+-		if (node >= end)
+-			break;
+-
+-		switch (node->type) {
+-			struct acpi_iort_named_component *ncomp;
+-			struct acpi_iort_root_complex *rc;
+-			phys_addr_t local_limit;
+-
+-		case ACPI_IORT_NODE_NAMED_COMPONENT:
+-			ncomp = (struct acpi_iort_named_component *)node->node_data;
+-			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
+-			limit = min_not_zero(limit, local_limit);
+-			break;
+-
+-		case ACPI_IORT_NODE_PCI_ROOT_COMPLEX:
+-			if (node->revision < 1)
+-				break;
+-
+-			rc = (struct acpi_iort_root_complex *)node->node_data;
+-			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
+-			limit = min_not_zero(limit, local_limit);
+-			break;
+-		}
+-		node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
+-	}
+-	acpi_put_table(&iort->header);
+-	return limit;
+-}
+-#endif
+diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
+index 1a12baa58e40..20a32120bb88 100644
+--- a/include/linux/acpi_iort.h
++++ b/include/linux/acpi_iort.h
+@@ -38,7 +38,6 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *size);
+ const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
+ 						const u32 *id_in);
+ int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
+-phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
+ #else
+ static inline void acpi_iort_init(void) { }
+ static inline u32 iort_msi_map_id(struct device *dev, u32 id)
+@@ -56,9 +55,6 @@ static inline const struct iommu_ops *iort_iommu_configure_id(
+ static inline
+ int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
+ { return 0; }
+-
+-static inline phys_addr_t acpi_iort_dma_get_max_cpu_address(void)
+-{ return PHYS_ADDR_MAX; }
+ #endif
+ 
+ #endif /* __ACPI_IORT_H__ */
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
new file mode 100644
index 0000000..a538dbb
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
-- 
2.17.1

