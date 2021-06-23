Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7729.1624455586311759772
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jun 2021 06:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D09ED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Jun 2021 06:39:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB40B3F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Jun 2021 06:39:45 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott] arm/linux: temporarily use 5.10.21 kernel for qemuarm64-secureboot
Date: Tue, 22 Jun 2021 21:12:40 -0400
Message-Id: <20210623011240.4042-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Patches for ZONE_DMA continue to be added to the 5.10.x kernel, causing
the removal patch to constantly break.  While working on a better fix,
regress the kernel to 5.10.21 (last version before ZONE_DMA was added)
to keep the CI working.

Change-Id: I537dd061ae0c6d2adce6649d03bd63a3d5dfffe9
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-yocto/zone_dma_revert.patch   | 126 ------------------
 .../linux/linux-yocto_5.10.bbappend           |   4 +-
 2 files changed, 2 insertions(+), 128 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
deleted file mode 100644
index 1295416..0000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-Revert ZONE_DMA patches
-
-Upstream-Status: Inappropriate
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
-index 916e0547fdcc..7fbb9c85af8a 100644
---- a/arch/arm64/mm/init.c
-+++ b/arch/arm64/mm/init.c
-@@ -29,7 +29,6 @@
- #include <linux/kexec.h>
- #include <linux/crash_dump.h>
- #include <linux/hugetlb.h>
--#include <linux/acpi_iort.h>
- 
- #include <asm/boot.h>
- #include <asm/fixmap.h>
-@@ -43,6 +42,8 @@
- #include <asm/tlb.h>
- #include <asm/alternative.h>
- 
-+#define ARM64_ZONE_DMA_BITS	30
-+
- /*
-  * We need to be able to catch inadvertent references to memstart_addr
-  * that occur (potentially in generic code) before arm64_memblock_init()
-@@ -187,13 +188,9 @@ static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
- static void __init zone_sizes_init(unsigned long min, unsigned long max)
- {
- 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
--	unsigned int __maybe_unused acpi_zone_dma_bits;
--	unsigned int __maybe_unused dt_zone_dma_bits;
- 
- #ifdef CONFIG_ZONE_DMA
--	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
--	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
--	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
-+	zone_dma_bits = ARM64_ZONE_DMA_BITS;
- 	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
- 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
- #endif
-diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
-index 2494138a6905..94f34109695c 100644
---- a/drivers/acpi/arm64/iort.c
-+++ b/drivers/acpi/arm64/iort.c
-@@ -1730,58 +1730,3 @@ void __init acpi_iort_init(void)
- 
- 	iort_init_platform_devices();
- }
--
--#ifdef CONFIG_ZONE_DMA
--/*
-- * Extract the highest CPU physical address accessible to all DMA masters in
-- * the system. PHYS_ADDR_MAX is returned when no constrained device is found.
-- */
--phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
--{
--	phys_addr_t limit = PHYS_ADDR_MAX;
--	struct acpi_iort_node *node, *end;
--	struct acpi_table_iort *iort;
--	acpi_status status;
--	int i;
--
--	if (acpi_disabled)
--		return limit;
--
--	status = acpi_get_table(ACPI_SIG_IORT, 0,
--				(struct acpi_table_header **)&iort);
--	if (ACPI_FAILURE(status))
--		return limit;
--
--	node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
--	end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
--
--	for (i = 0; i < iort->node_count; i++) {
--		if (node >= end)
--			break;
--
--		switch (node->type) {
--			struct acpi_iort_named_component *ncomp;
--			struct acpi_iort_root_complex *rc;
--			phys_addr_t local_limit;
--
--		case ACPI_IORT_NODE_NAMED_COMPONENT:
--			ncomp = (struct acpi_iort_named_component *)node->node_data;
--			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
--			limit = min_not_zero(limit, local_limit);
--			break;
--
--		case ACPI_IORT_NODE_PCI_ROOT_COMPLEX:
--			if (node->revision < 1)
--				break;
--
--			rc = (struct acpi_iort_root_complex *)node->node_data;
--			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
--			limit = min_not_zero(limit, local_limit);
--			break;
--		}
--		node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
--	}
--	acpi_put_table(&iort->header);
--	return limit;
--}
--#endif
-diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
-index 1a12baa58e40..20a32120bb88 100644
---- a/include/linux/acpi_iort.h
-+++ b/include/linux/acpi_iort.h
-@@ -38,7 +38,6 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *size);
- const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
- 						const u32 *id_in);
- int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
--phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
- #else
- static inline void acpi_iort_init(void) { }
- static inline u32 iort_msi_map_id(struct device *dev, u32 id)
-@@ -56,9 +55,6 @@ static inline const struct iommu_ops *iort_iommu_configure_id(
- static inline
- int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
- { return 0; }
--
--static inline phys_addr_t acpi_iort_dma_get_max_cpu_address(void)
--{ return PHYS_ADDR_MAX; }
- #endif
- 
- #endif /* __ACPI_IORT_H__ */
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index b9995e0..9a9a00f 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -13,5 +13,5 @@ SRC_URI_append_qemuarm64-sbsa = " \
     file://defconfig.patch \
     "
 
-FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
-SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
+LINUX_VERSION_qemuarm64-secureboot = "5.10.21"
+SRCREV_machine_qemuarm64-secureboot = "012f78dadb7186c479343b77e97df2925caf681e"
-- 
2.17.1

