Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31AAC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:44:56 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.37.1652719495206712793
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3feriey3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id k2so12508610qtp.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NA5U5euIVV205dS0GlQUP1S3EuPNAG9xrN/ACZpHJm8=;
        b=3feriey32vnZct9s27YD+61Ays0aXhaDLcSRU+9QZCdnZqo0kScZtRtd6AxVi1rIdM
         6csgMHCmmhdTzSRHLXhdW25iej/a893Y1E38U+dgK2eRvDKsFeR8MhKjKcAlSewY5W30
         utZc2ZqxJ1A07AK/xglNGOkE8uW+h9Ly78qcegabJBPUoi4eellobd3pUB/3GC4l04BA
         7GMLux0ts4VzR+6VKH3QZPr10x/sw6s0CLh9mglbTdGbFTRrQ0kCbmynXfgErsX60kPI
         VuU2e7Z1lMuzC6NqzHRGLaOZKKMvQOZj3cQVP10yjwuq926mB+6TiQPcoL5i/59mvKfj
         o3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NA5U5euIVV205dS0GlQUP1S3EuPNAG9xrN/ACZpHJm8=;
        b=HEgoTW9u19C+w104Ac9ng4IYV0HspOOTMArPfwx2cXLTXmYug6cYPM77iT2kQAr4Xq
         eiQWfg1DOiA06kry59sXMOkSJwEG1f0vz0bMcoegQMsK/doxEfxvMOesfwkbab8HFlRt
         K/gHJyv9iBHNaU2JPqFWR1Bb9S9oe2VJ1Ay7mBsnyZA/x9iCNNkQdE+KzRF9XzEnVWGT
         nLA9irt4RxAbqDcSm1aj1DGvQCl9M96o0AeXh6m4w4dkPNm0qCbiS2wdWzYO9Ym1xFHO
         1qY1W2heM29vKopaxSy7C/abjwmpYgblA4MG1ofSJluvxrOqjnP+Jj2yDgX7Bh/YGWiQ
         cLrg==
X-Gm-Message-State: AOAM532sZ6dgj3LWU+hOGm/LmdN8xoQoabJgnwQ5tSlsB7ZJZmWMhPzh
	nldEVJcabNlyzfsBlIsep6v+Ew==
X-Google-Smtp-Source: 
 ABdhPJyXybYTErL03auGd4Aqx8X1DHblqUgsLF7I6vdUTAzcCM+CqkK0roEGZqOXEqtAjDmx2netdA==
X-Received: by 2002:a05:622a:115:b0:2f3:ce1b:1361 with SMTP id
 u21-20020a05622a011500b002f3ce1b1361mr15830707qtw.373.1652719494168;
        Mon, 16 May 2022 09:44:54 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 d23-20020a05620a205700b0069fc13ce1ffsm6046193qka.48.2022.05.16.09.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:44:53 -0700 (PDT)
Date: Mon, 16 May 2022 12:44:52 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] arm/qemuarm64-secureboot: update to new kernel and hack
 around boot issue
Message-ID: <YoJ/hNZDsJhASQZD@kudzu.us>
References: <20220516130814.15959-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516130814.15959-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3405

Dropping this patch in favor of Ross's superior patch

Thanks,
Jon

On Mon, May 16, 2022 at 09:08:14AM -0400, Jon Mason wrote:
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../conf/machine/qemuarm64-secureboot.conf    |   2 -
>  .../linux/linux-yocto/dma_hack.patch          |  18 ++
>  .../linux/linux-yocto/zone_dma_revert.patch   | 218 ------------------
>  .../linux/linux-yocto_%.bbappend              |   2 +-
>  4 files changed, 19 insertions(+), 221 deletions(-)
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/dma_hack.patch
>  delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
> 
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index a467b204..55c4cab4 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -23,5 +23,3 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>  
>  MACHINE_FEATURES += "optee-ftpm"
> -
> -PREFERRED_VERSION_linux-yocto ?= "5.10%"
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/dma_hack.patch b/meta-arm/recipes-kernel/linux/linux-yocto/dma_hack.patch
> new file mode 100644
> index 00000000..13d4d09d
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto/dma_hack.patch
> @@ -0,0 +1,18 @@
> +Hack around DMA issue
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Jon Mason <jon.mason@arm.com>
> +
> +diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> +index 3b269c756798..cac5d7f15de9 100644
> +--- a/arch/arm64/mm/init.c
> ++++ b/arch/arm64/mm/init.c
> +@@ -170,7 +170,7 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max)
> + #ifdef CONFIG_ZONE_DMA
> + 	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
> + 	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
> +-	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
> ++	zone_dma_bits = min3(30U, dt_zone_dma_bits, acpi_zone_dma_bits);
> + 	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
> + 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
> + #endif
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
> deleted file mode 100644
> index 8659d08e..00000000
> --- a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
> +++ /dev/null
> @@ -1,218 +0,0 @@
> -Revert ZONE_DMA patches
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Jon Mason <jon.mason@arm.com>
> -
> -diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> -index fce8cbecd6bc..a884d7773989 100644
> ---- a/arch/arm64/include/asm/processor.h
> -+++ b/arch/arm64/include/asm/processor.h
> -@@ -96,7 +96,8 @@
> - #endif /* CONFIG_ARM64_FORCE_52BIT */
> - 
> - extern phys_addr_t arm64_dma_phys_limit;
> --#define ARCH_LOW_ADDRESS_LIMIT	(arm64_dma_phys_limit - 1)
> -+extern phys_addr_t arm64_dma32_phys_limit;
> -+#define ARCH_LOW_ADDRESS_LIMIT	((arm64_dma_phys_limit ? : arm64_dma32_phys_limit) - 1)
> - 
> - struct debug_info {
> - #ifdef CONFIG_HAVE_HW_BREAKPOINT
> -diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> -index a985d292e820..7fbb9c85af8a 100644
> ---- a/arch/arm64/mm/init.c
> -+++ b/arch/arm64/mm/init.c
> -@@ -29,7 +29,6 @@
> - #include <linux/kexec.h>
> - #include <linux/crash_dump.h>
> - #include <linux/hugetlb.h>
> --#include <linux/acpi_iort.h>
> - 
> - #include <asm/boot.h>
> - #include <asm/fixmap.h>
> -@@ -43,6 +42,8 @@
> - #include <asm/tlb.h>
> - #include <asm/alternative.h>
> - 
> -+#define ARM64_ZONE_DMA_BITS	30
> -+
> - /*
> -  * We need to be able to catch inadvertent references to memstart_addr
> -  * that occur (potentially in generic code) before arm64_memblock_init()
> -@@ -53,13 +54,13 @@ s64 memstart_addr __ro_after_init = -1;
> - EXPORT_SYMBOL(memstart_addr);
> - 
> - /*
> -- * If the corresponding config options are enabled, we create both ZONE_DMA
> -- * and ZONE_DMA32. By default ZONE_DMA covers the 32-bit addressable memory
> -- * unless restricted on specific platforms (e.g. 30-bit on Raspberry Pi 4).
> -- * In such case, ZONE_DMA32 covers the rest of the 32-bit addressable memory,
> -- * otherwise it is empty.
> -+ * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
> -+ * memory as some devices, namely the Raspberry Pi 4, have peripherals with
> -+ * this limited view of the memory. ZONE_DMA32 will cover the rest of the 32
> -+ * bit addressable memory area.
> -  */
> - phys_addr_t arm64_dma_phys_limit __ro_after_init;
> -+phys_addr_t arm64_dma32_phys_limit __ro_after_init;
> - 
> - #ifdef CONFIG_KEXEC_CORE
> - /*
> -@@ -84,7 +85,7 @@ static void __init reserve_crashkernel(void)
> - 
> - 	if (crash_base == 0) {
> - 		/* Current arm64 boot protocol requires 2MB alignment */
> --		crash_base = memblock_find_in_range(0, arm64_dma_phys_limit,
> -+		crash_base = memblock_find_in_range(0, arm64_dma32_phys_limit,
> - 				crash_size, SZ_2M);
> - 		if (crash_base == 0) {
> - 			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> -@@ -187,24 +188,15 @@ static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
> - static void __init zone_sizes_init(unsigned long min, unsigned long max)
> - {
> - 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
> --	unsigned int __maybe_unused acpi_zone_dma_bits;
> --	unsigned int __maybe_unused dt_zone_dma_bits;
> --	phys_addr_t __maybe_unused dma32_phys_limit = max_zone_phys(32);
> - 
> - #ifdef CONFIG_ZONE_DMA
> --	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
> --	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
> --	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
> -+	zone_dma_bits = ARM64_ZONE_DMA_BITS;
> - 	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
> - 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
> - #endif
> - #ifdef CONFIG_ZONE_DMA32
> --	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
> --	if (!arm64_dma_phys_limit)
> --		arm64_dma_phys_limit = dma32_phys_limit;
> -+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(arm64_dma32_phys_limit);
> - #endif
> --	if (!arm64_dma_phys_limit)
> --		arm64_dma_phys_limit = PHYS_MASK + 1;
> - 	max_zone_pfns[ZONE_NORMAL] = max;
> - 
> - 	free_area_init(max_zone_pfns);
> -@@ -398,9 +390,16 @@ void __init arm64_memblock_init(void)
> - 
> - 	early_init_fdt_scan_reserved_mem();
> - 
> -+	if (IS_ENABLED(CONFIG_ZONE_DMA32))
> -+		arm64_dma32_phys_limit = max_zone_phys(32);
> -+	else
> -+		arm64_dma32_phys_limit = PHYS_MASK + 1;
> -+
> - 	reserve_elfcorehdr();
> - 
> - 	high_memory = __va(memblock_end_of_DRAM() - 1) + 1;
> -+
> -+	dma_contiguous_reserve(arm64_dma32_phys_limit);
> - }
> - 
> - void __init bootmem_init(void)
> -@@ -435,11 +434,6 @@ void __init bootmem_init(void)
> - 	sparse_init();
> - 	zone_sizes_init(min, max);
> - 
> --	/*
> --	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
> --	 */
> --	dma_contiguous_reserve(arm64_dma_phys_limit);
> --
> - 	/*
> - 	 * request_standard_resources() depends on crashkernel's memory being
> - 	 * reserved, so do it here.
> -@@ -522,7 +516,7 @@ static void __init free_unused_memmap(void)
> - void __init mem_init(void)
> - {
> - 	if (swiotlb_force == SWIOTLB_FORCE ||
> --	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
> -+	    max_pfn > PFN_DOWN(arm64_dma_phys_limit ? : arm64_dma32_phys_limit))
> - 		swiotlb_init(1);
> - 	else
> - 		swiotlb_force = SWIOTLB_NO_FORCE;
> -diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> -index 2494138a6905..94f34109695c 100644
> ---- a/drivers/acpi/arm64/iort.c
> -+++ b/drivers/acpi/arm64/iort.c
> -@@ -1730,58 +1730,3 @@ void __init acpi_iort_init(void)
> - 
> - 	iort_init_platform_devices();
> - }
> --
> --#ifdef CONFIG_ZONE_DMA
> --/*
> -- * Extract the highest CPU physical address accessible to all DMA masters in
> -- * the system. PHYS_ADDR_MAX is returned when no constrained device is found.
> -- */
> --phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
> --{
> --	phys_addr_t limit = PHYS_ADDR_MAX;
> --	struct acpi_iort_node *node, *end;
> --	struct acpi_table_iort *iort;
> --	acpi_status status;
> --	int i;
> --
> --	if (acpi_disabled)
> --		return limit;
> --
> --	status = acpi_get_table(ACPI_SIG_IORT, 0,
> --				(struct acpi_table_header **)&iort);
> --	if (ACPI_FAILURE(status))
> --		return limit;
> --
> --	node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
> --	end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
> --
> --	for (i = 0; i < iort->node_count; i++) {
> --		if (node >= end)
> --			break;
> --
> --		switch (node->type) {
> --			struct acpi_iort_named_component *ncomp;
> --			struct acpi_iort_root_complex *rc;
> --			phys_addr_t local_limit;
> --
> --		case ACPI_IORT_NODE_NAMED_COMPONENT:
> --			ncomp = (struct acpi_iort_named_component *)node->node_data;
> --			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
> --			limit = min_not_zero(limit, local_limit);
> --			break;
> --
> --		case ACPI_IORT_NODE_PCI_ROOT_COMPLEX:
> --			if (node->revision < 1)
> --				break;
> --
> --			rc = (struct acpi_iort_root_complex *)node->node_data;
> --			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
> --			limit = min_not_zero(limit, local_limit);
> --			break;
> --		}
> --		node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
> --	}
> --	acpi_put_table(&iort->header);
> --	return limit;
> --}
> --#endif
> -diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
> -index 1a12baa58e40..20a32120bb88 100644
> ---- a/include/linux/acpi_iort.h
> -+++ b/include/linux/acpi_iort.h
> -@@ -38,7 +38,6 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *size);
> - const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
> - 						const u32 *id_in);
> - int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
> --phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
> - #else
> - static inline void acpi_iort_init(void) { }
> - static inline u32 iort_msi_map_id(struct device *dev, u32 id)
> -@@ -56,9 +55,6 @@ static inline const struct iommu_ops *iort_iommu_configure_id(
> - static inline
> - int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
> - { return 0; }
> --
> --static inline phys_addr_t acpi_iort_dma_get_max_cpu_address(void)
> --{ return PHYS_ADDR_MAX; }
> - #endif
> - 
> - #endif /* __ACPI_IORT_H__ */
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
> index f9bd2d66..cbbf475b 100644
> --- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
> @@ -8,7 +8,7 @@ SRC_URI:append:generic-arm64 = " \
>  
>  FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
>  SRC_URI:append:qemuarm64-secureboot = " \
> -    file://zone_dma_revert.patch \
> +    file://dma_hack.patch \
>      file://tee.cfg \
>      "
>  
> -- 
> 2.17.1
> 
> 

