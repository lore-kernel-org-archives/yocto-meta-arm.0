Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA167C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 16:58:38 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.22323.1654448317833137787
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Jun 2022 09:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=f3Jug5m5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id k6so6428651qkf.4
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Jun 2022 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5eIIEbEqrpsKGHaJom58jumJfnlXpX3zKUPVTyVhL4=;
        b=f3Jug5m5uNUa3967LdWXyr+ySKrI+MrRE9L2uLIXzhlP1QcoEfakdPmgul67UNNyqE
         ZHt9TZvMOlFsh9SfaNacSjDY7pLkaSFpmVcUdPuESfV3OIVYR/M1DCM1H4UweZDujr1T
         WjmIYlqn14mqGHyqeshhJvWtTUzmoyPqhcTkiQ/Mb3dOi0VjUrUh3B0A9t5MdP921cTW
         TsnX5N7Db4346XDyLb1YbANFzd4sWBqB0fRSQgaarsM6LKhNJUqFOpHFR0Ejz1eHdjvB
         DD2yXP3h2ivCPN8Kw6jaoQhgFPT1lVIMet5F4TU4i581TvpmTlcOWDgkvglLtxgKWUMV
         zXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5eIIEbEqrpsKGHaJom58jumJfnlXpX3zKUPVTyVhL4=;
        b=krahbKSgm3vkBzQvcG3h3e3PDf5MKl0ZOra8F8gCEoOD/atMWOTsIl+mLDhVbH5WZk
         qglZ6dnmRrW80uSDI38JsHkPKB5RaP9scKwNTWD8t9xoIes8mSI+e/Y9Lkmdow7ALHaE
         AGQPtlNkcxPuGAsHlZL8AcHirubqYwAGc9ogQhSp/8imDZ56JkoLu/0YqJlaxElMAmAQ
         CHfXAOpE+HvhrESylqxcGzMaig4BXoFV/lWuCz832Bsz/KT1ma6z3mnxAxlkmHhF3Eto
         LqsdZWz/wHNJWkFtE1lDZUUFd9xvqnFhX/xdoXc9B8Rh/0ZzEwUQmQOS6Hp8n24nTHO3
         h/qw==
X-Gm-Message-State: AOAM532QnYE1qnpIsSejbcGRZwsFTdTlYOW8f3NJcohkK9O1iajS2tyh
	Ya2KdnSGm3W9CufrULorvnyoMxzR1ySFiA==
X-Google-Smtp-Source: 
 ABdhPJxVtUcI8DBQRMXo6oO3UGfR8nwmrnH1AWy1VtIqyUQUYAlbCc3skbmD60PHq9Qszoqyhn5E3g==
X-Received: by 2002:a05:620a:2016:b0:6a6:af51:b981 with SMTP id
 c22-20020a05620a201600b006a6af51b981mr4201502qka.573.1654448316663;
        Sun, 05 Jun 2022 09:58:36 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bp13-20020a05620a458d00b006a6bfcd6df5sm412896qkb.37.2022.06.05.09.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:58:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH honister] arm/linux-yocto: fix boot failure in
 qemuarm64-secureboot
Date: Sun,  5 Jun 2022 12:58:35 -0400
Message-Id: <20220605165835.4126701-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Jun 2022 16:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3471

From: Ross Burton <ross.burton@arm.com>

The boot crash that appears to be triggered by the ZONE_DMA patches has
been root-caused, so work around the problem whilst upstream figure out
the best way to fix.

Also, upgrade qemuarm64-secureboot to 5.15 instead of pinning back to
5.10.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../conf/machine/qemuarm64-secureboot.conf    |   2 +-
 .../linux-yocto/skip-unavailable-memory.patch |  47 ++++
 .../linux/linux-yocto/zone_dma_revert.patch   | 218 ------------------
 .../linux/linux-yocto_%.bbappend              |   2 +-
 4 files changed, 49 insertions(+), 220 deletions(-)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index c45924a49510..7ca47342943c 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -20,4 +20,4 @@ WKS_FILE ?= "qemuarm64.wks"
 WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
-PREFERRED_VERSION_linux-yocto ?= "5.10%"
+MACHINE_FEATURES += "optee-ftpm"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch b/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch
new file mode 100644
index 000000000000..b75cd5677c38
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/skip-unavailable-memory.patch
@@ -0,0 +1,47 @@
+When in secure mode, qemu's devicetree has the following node to mark the
+secure memory as off-limits to non-secure environments:
+
+  secram@e000000 {
+    secure-status = "okay";
+    status = "disabled";
+    reg = <0x00 0xe000000 0x00 0x1000000>;
+    device_type = "memory";
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
+This used to work more through luck than judgement, but recent changes to
+memory zoning[1] means this region is accessed more frequently.
+
+At present there is debate between qemu and kernel engineers over whether
+the kernel should be ignoring regions marked like this, or if qemu
+should block out the region in a different way. Until this is resolved,
+we can make a choice and simply ignore memory ranges that are marked
+as disabled.
+
+Upstream-Status: Pending [discussion ongoing]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=35ec3d09ff6a49ee90e1bfd09166596f017eb5bb
+
+diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
+index 59a7a9ee58ef..d151a31adbf9 100644
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
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
deleted file mode 100644
index 8659d08e14ab..000000000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-Revert ZONE_DMA patches
-
-Upstream-Status: Inappropriate
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
-index fce8cbecd6bc..a884d7773989 100644
---- a/arch/arm64/include/asm/processor.h
-+++ b/arch/arm64/include/asm/processor.h
-@@ -96,7 +96,8 @@
- #endif /* CONFIG_ARM64_FORCE_52BIT */
- 
- extern phys_addr_t arm64_dma_phys_limit;
--#define ARCH_LOW_ADDRESS_LIMIT	(arm64_dma_phys_limit - 1)
-+extern phys_addr_t arm64_dma32_phys_limit;
-+#define ARCH_LOW_ADDRESS_LIMIT	((arm64_dma_phys_limit ? : arm64_dma32_phys_limit) - 1)
- 
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
-@@ -53,13 +54,13 @@ s64 memstart_addr __ro_after_init = -1;
- EXPORT_SYMBOL(memstart_addr);
- 
- /*
-- * If the corresponding config options are enabled, we create both ZONE_DMA
-- * and ZONE_DMA32. By default ZONE_DMA covers the 32-bit addressable memory
-- * unless restricted on specific platforms (e.g. 30-bit on Raspberry Pi 4).
-- * In such case, ZONE_DMA32 covers the rest of the 32-bit addressable memory,
-- * otherwise it is empty.
-+ * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
-+ * memory as some devices, namely the Raspberry Pi 4, have peripherals with
-+ * this limited view of the memory. ZONE_DMA32 will cover the rest of the 32
-+ * bit addressable memory area.
-  */
- phys_addr_t arm64_dma_phys_limit __ro_after_init;
-+phys_addr_t arm64_dma32_phys_limit __ro_after_init;
- 
- #ifdef CONFIG_KEXEC_CORE
- /*
-@@ -84,7 +85,7 @@ static void __init reserve_crashkernel(void)
- 
- 	if (crash_base == 0) {
- 		/* Current arm64 boot protocol requires 2MB alignment */
--		crash_base = memblock_find_in_range(0, arm64_dma_phys_limit,
-+		crash_base = memblock_find_in_range(0, arm64_dma32_phys_limit,
- 				crash_size, SZ_2M);
- 		if (crash_base == 0) {
- 			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
-@@ -187,24 +188,15 @@ static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
- static void __init zone_sizes_init(unsigned long min, unsigned long max)
- {
- 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
--	unsigned int __maybe_unused acpi_zone_dma_bits;
--	unsigned int __maybe_unused dt_zone_dma_bits;
--	phys_addr_t __maybe_unused dma32_phys_limit = max_zone_phys(32);
- 
- #ifdef CONFIG_ZONE_DMA
--	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
--	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
--	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
-+	zone_dma_bits = ARM64_ZONE_DMA_BITS;
- 	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
- 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
- #endif
- #ifdef CONFIG_ZONE_DMA32
--	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
--	if (!arm64_dma_phys_limit)
--		arm64_dma_phys_limit = dma32_phys_limit;
-+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(arm64_dma32_phys_limit);
- #endif
--	if (!arm64_dma_phys_limit)
--		arm64_dma_phys_limit = PHYS_MASK + 1;
- 	max_zone_pfns[ZONE_NORMAL] = max;
- 
- 	free_area_init(max_zone_pfns);
-@@ -398,9 +390,16 @@ void __init arm64_memblock_init(void)
- 
- 	early_init_fdt_scan_reserved_mem();
- 
-+	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-+		arm64_dma32_phys_limit = max_zone_phys(32);
-+	else
-+		arm64_dma32_phys_limit = PHYS_MASK + 1;
-+
- 	reserve_elfcorehdr();
- 
- 	high_memory = __va(memblock_end_of_DRAM() - 1) + 1;
-+
-+	dma_contiguous_reserve(arm64_dma32_phys_limit);
- }
- 
- void __init bootmem_init(void)
-@@ -435,11 +434,6 @@ void __init bootmem_init(void)
- 	sparse_init();
- 	zone_sizes_init(min, max);
- 
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
- 	if (swiotlb_force == SWIOTLB_FORCE ||
--	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
-+	    max_pfn > PFN_DOWN(arm64_dma_phys_limit ? : arm64_dma32_phys_limit))
- 		swiotlb_init(1);
- 	else
- 		swiotlb_force = SWIOTLB_NO_FORCE;
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
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index d215d8b55a00..23bd146be1c9 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -14,6 +14,6 @@ SRC_URI:append:qemuarm64-sbsa = " \
 
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot = " \
-    file://zone_dma_revert.patch \
+    file://skip-unavailable-memory.patch \
     file://tee.cfg \
     "
-- 
2.30.2


