Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.9941.1621524395373909759
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 May 2021 08:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DvET2R57;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id eb9so8796432qvb.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 May 2021 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SITssSLGxO2YoMGWPFCGZGecO5tzwTNLHp9I5PlYQyk=;
        b=DvET2R57h2hhkgVc4vLvtr9oz1E1HrmBV+KbLIIqOWorGU7gdmTqdC9JZGtZo2AV5E
         UWZIlcrgtFY9/7rbwOnVQdPOeEKZ13KKAUvK+0GOcBsa/7xlWDURgiYet1SndMuHNDQE
         peybcli4ZTGUgZemC+HfC13v/0WwdKpg96TGlLt1eXMJlxWK5wt9L/Fnekaa0MwIxYB0
         3isk/UbioUX6JecY5vAeLnOgnLlY3XCpM9csqTi6Ja7eOfiBjCRIhg90Rq72A9DbYnOq
         XgwgwDmB+lWat3ar4C8U6bFtLgXaCNo8IkCqDNWKHgPhbhDLlZo3jmgjBPc1ToVUdZ7H
         vBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SITssSLGxO2YoMGWPFCGZGecO5tzwTNLHp9I5PlYQyk=;
        b=n3P8Ovq2Rhln9pOsTq/qjfuZHA+69V5j+eUF9H0Wy6vN1QNQ8LTrT5uQ5EewSs3T8n
         cOool5pBknYSEgkbYl7cTm4vhxuI2A1ZRuSSdXRrWbzsPi9uBY4DjlE3k/6yuOWAq95a
         tddE/ljdF1kKY85NODai9PiDgmmcYXw7MTPzGogG4pSPHF4wHCDOHSCXDfUvBlKr5CBa
         QDh3Q5O5ankdWUOiy/ez1sreY0eP946FRPeNStcXQ71FmI6RxYkoRYRlzbmMHI4UIASh
         Y5ewEYNHZgiWtSuZH/e8ffcG8AxJCiZ85TqD7LdHwGha+5fDN+DCwwYntvljWF3ChdWt
         h8Ew==
X-Gm-Message-State: AOAM532yqoeqLJmcds+v8z9Oc4c2To7wxv5dAOpEQvm1LCBESO2BDxJ+
	ieUjpYG0ts4JWqq+3RYxiWcJod8uMZof2RlW
X-Google-Smtp-Source: ABdhPJw7wvT2g3jD8bP5G+/bKc9CflyZoeNlejpTv2Yk2ikTHG/k+voBAXDDQp7+dKQ8k/aXZxgGgQ==
X-Received: by 2002:a0c:e1cb:: with SMTP id v11mr6401013qvl.52.1621524394470;
        Thu, 20 May 2021 08:26:34 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id s11sm1129117qtn.77.2021.05.20.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 08:26:33 -0700 (PDT)
Date: Thu, 20 May 2021 11:26:02 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm: additional workaround for qemuarm64-secureboot ZONE_DMA
Message-ID: <20210520152601.GB12500@kudzu.us>
References: <20210520100426.1648115-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210520100426.1648115-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 20, 2021 at 11:04:26AM +0100, Ross Burton wrote:
> From: Jon Mason <jon.mason@arm.com>
> 
> Reverting additional ZONE_DMA patch 2281df0b0226610e235f49ed75bf6ad57cb04762
> which was added in v5.10.37
> 
> Change-Id: I3700b95247a4224f4b56a403bc3dc10dde7dd5b5
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Applied to master

Thanks,
Jon

> ---
>  .../linux/linux-yocto/zone_dma_revert.patch   | 96 ++++++++++++++++++-
>  1 file changed, 94 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
> index 1295416..8659d08 100644
> --- a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
> @@ -3,8 +3,22 @@ Revert ZONE_DMA patches
>  Upstream-Status: Inappropriate
>  Signed-off-by: Jon Mason <jon.mason@arm.com>
>  
> +diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> +index fce8cbecd6bc..a884d7773989 100644
> +--- a/arch/arm64/include/asm/processor.h
> ++++ b/arch/arm64/include/asm/processor.h
> +@@ -96,7 +96,8 @@
> + #endif /* CONFIG_ARM64_FORCE_52BIT */
> + 
> + extern phys_addr_t arm64_dma_phys_limit;
> +-#define ARCH_LOW_ADDRESS_LIMIT	(arm64_dma_phys_limit - 1)
> ++extern phys_addr_t arm64_dma32_phys_limit;
> ++#define ARCH_LOW_ADDRESS_LIMIT	((arm64_dma_phys_limit ? : arm64_dma32_phys_limit) - 1)
> + 
> + struct debug_info {
> + #ifdef CONFIG_HAVE_HW_BREAKPOINT
>  diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> -index 916e0547fdcc..7fbb9c85af8a 100644
> +index a985d292e820..7fbb9c85af8a 100644
>  --- a/arch/arm64/mm/init.c
>  +++ b/arch/arm64/mm/init.c
>  @@ -29,7 +29,6 @@
> @@ -24,12 +38,41 @@ index 916e0547fdcc..7fbb9c85af8a 100644
>   /*
>    * We need to be able to catch inadvertent references to memstart_addr
>    * that occur (potentially in generic code) before arm64_memblock_init()
> -@@ -187,13 +188,9 @@ static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
> +@@ -53,13 +54,13 @@ s64 memstart_addr __ro_after_init = -1;
> + EXPORT_SYMBOL(memstart_addr);
> + 
> + /*
> +- * If the corresponding config options are enabled, we create both ZONE_DMA
> +- * and ZONE_DMA32. By default ZONE_DMA covers the 32-bit addressable memory
> +- * unless restricted on specific platforms (e.g. 30-bit on Raspberry Pi 4).
> +- * In such case, ZONE_DMA32 covers the rest of the 32-bit addressable memory,
> +- * otherwise it is empty.
> ++ * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
> ++ * memory as some devices, namely the Raspberry Pi 4, have peripherals with
> ++ * this limited view of the memory. ZONE_DMA32 will cover the rest of the 32
> ++ * bit addressable memory area.
> +  */
> + phys_addr_t arm64_dma_phys_limit __ro_after_init;
> ++phys_addr_t arm64_dma32_phys_limit __ro_after_init;
> + 
> + #ifdef CONFIG_KEXEC_CORE
> + /*
> +@@ -84,7 +85,7 @@ static void __init reserve_crashkernel(void)
> + 
> + 	if (crash_base == 0) {
> + 		/* Current arm64 boot protocol requires 2MB alignment */
> +-		crash_base = memblock_find_in_range(0, arm64_dma_phys_limit,
> ++		crash_base = memblock_find_in_range(0, arm64_dma32_phys_limit,
> + 				crash_size, SZ_2M);
> + 		if (crash_base == 0) {
> + 			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> +@@ -187,24 +188,15 @@ static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
>   static void __init zone_sizes_init(unsigned long min, unsigned long max)
>   {
>   	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
>  -	unsigned int __maybe_unused acpi_zone_dma_bits;
>  -	unsigned int __maybe_unused dt_zone_dma_bits;
> +-	phys_addr_t __maybe_unused dma32_phys_limit = max_zone_phys(32);
>   
>   #ifdef CONFIG_ZONE_DMA
>  -	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
> @@ -39,6 +82,55 @@ index 916e0547fdcc..7fbb9c85af8a 100644
>   	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
>   	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
>   #endif
> + #ifdef CONFIG_ZONE_DMA32
> +-	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
> +-	if (!arm64_dma_phys_limit)
> +-		arm64_dma_phys_limit = dma32_phys_limit;
> ++	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(arm64_dma32_phys_limit);
> + #endif
> +-	if (!arm64_dma_phys_limit)
> +-		arm64_dma_phys_limit = PHYS_MASK + 1;
> + 	max_zone_pfns[ZONE_NORMAL] = max;
> + 
> + 	free_area_init(max_zone_pfns);
> +@@ -398,9 +390,16 @@ void __init arm64_memblock_init(void)
> + 
> + 	early_init_fdt_scan_reserved_mem();
> + 
> ++	if (IS_ENABLED(CONFIG_ZONE_DMA32))
> ++		arm64_dma32_phys_limit = max_zone_phys(32);
> ++	else
> ++		arm64_dma32_phys_limit = PHYS_MASK + 1;
> ++
> + 	reserve_elfcorehdr();
> + 
> + 	high_memory = __va(memblock_end_of_DRAM() - 1) + 1;
> ++
> ++	dma_contiguous_reserve(arm64_dma32_phys_limit);
> + }
> + 
> + void __init bootmem_init(void)
> +@@ -435,11 +434,6 @@ void __init bootmem_init(void)
> + 	sparse_init();
> + 	zone_sizes_init(min, max);
> + 
> +-	/*
> +-	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
> +-	 */
> +-	dma_contiguous_reserve(arm64_dma_phys_limit);
> +-
> + 	/*
> + 	 * request_standard_resources() depends on crashkernel's memory being
> + 	 * reserved, so do it here.
> +@@ -522,7 +516,7 @@ static void __init free_unused_memmap(void)
> + void __init mem_init(void)
> + {
> + 	if (swiotlb_force == SWIOTLB_FORCE ||
> +-	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
> ++	    max_pfn > PFN_DOWN(arm64_dma_phys_limit ? : arm64_dma32_phys_limit))
> + 		swiotlb_init(1);
> + 	else
> + 		swiotlb_force = SWIOTLB_NO_FORCE;
>  diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
>  index 2494138a6905..94f34109695c 100644
>  --- a/drivers/acpi/arm64/iort.c
> -- 
> 2.25.1
> 

> 
> 
> 

