Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E46C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:26:02 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.5887.1660587960048581085
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 11:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=YnMAvJDQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id c20so6077933qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=m3Vuxa6ZjSJ+q2Y4qNqJkSNof5cihnP2Qqz/i0eGa08=;
        b=YnMAvJDQ4K9ZixbtbTq/xR+Lb1YLZJHQrFUwDle0WHNYlNgZ6WYlpclGonngX3NKkP
         68fJe4PQKS6fPTKITk2JQyT6e98Z2CRiYrz5KwscVDhWrMOgyDW59B9GwaBj1uY/4CGA
         eCqcXfiN7gFquj7hLcKhZW20kGo75j+T2Blg0kHFBe5JAGzT+AofGgzxEievVZbu5XNo
         amE5D4Kw8mE5EC1FjmKpk7d3DHI0mDYOcLowlwnlfP6eJCh2ZAazu+EzY2ps0SMidj+S
         +dvIK3KKU1EQ6R48/DqWhwukHGg9cJaijNl+CMBa862RDS+S4ydFRxaFsU2SK1xYF7fr
         3shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=m3Vuxa6ZjSJ+q2Y4qNqJkSNof5cihnP2Qqz/i0eGa08=;
        b=H/6pGTwuXB7mUa/KM8zHQHdGyOcBtJcNRo3dr/M0ecKvjwx2GKjYJcCZVai2wXm46V
         wCBbMDxeuaX+/dFFCDHTkgb1z/ZkZ+jVeSnta7TWeLXRnDPUKFW5iEiR9aXls7PBuYCp
         M5ASJw4QvSOuLtkon53tn/qxrR+wEUmvramDxpjHl1GcSUtcUGhj7uN38q5r59/NMMpt
         5PmTz7dTRxjyEl5TaRmI+YwSNlcCLe9/SNERwmX3rWr7A4jmmtRjSGjHDldPIIrMJgqR
         mSr8v5wH/ZzpduoPkaiAQj2JKheMKc7oImVzZNBDkBzEnPfG5n1QwPH8Y2KJgtK5PyFl
         XceA==
X-Gm-Message-State: ACgBeo0cbrDU5Gju+EDGgIihNGpwI09hUjJLnWQp6AM/IYwlDcZlGORv
	B8rZPVuP8lFZLBrdp2RlI7whfg==
X-Google-Smtp-Source: 
 AA6agR6/fq1RVfARPu1tPOC/6uMF43E9OGly90i/ObdFUIEcO7dDLQjJz3PBRJl+dT/JVxcxHgbkvA==
X-Received: by 2002:a05:622a:1108:b0:343:463:ace1 with SMTP id
 e8-20020a05622a110800b003430463ace1mr14841012qty.30.1660587959045;
        Mon, 15 Aug 2022 11:25:59 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 2-20020ac85742000000b0031eeecd21d6sm9219797qtx.69.2022.08.15.11.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 11:25:58 -0700 (PDT)
Date: Mon, 15 Aug 2022 14:25:56 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 2/2] optee-os: Add section attribute parameters when
 clang is used
Message-ID: <YvqPtKgWHNmo+0T/@kudzu.us>
References: <20220814025124.229339-1-raj.khem@gmail.com>
 <20220814025124.229339-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814025124.229339-2-raj.khem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 18:26:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3685

On Sat, Aug 13, 2022 at 07:51:24PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm/recipes-security/optee/optee-os.inc  |   1 +
>  ...-Define-section-attributes-for-clang.patch | 188 ++++++++++++++++++
>  2 files changed, 189 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index 11193dc..7834aae 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -19,6 +19,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
>  SRC_URI:append = " \
>      file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
>      file://0007-allow-setting-sysroot-for-clang.patch \
> +    file://0001-core-Define-section-attributes-for-clang.patch \
>     "

This breaks the 3.14 recipe.  So, I'm modifying the patch to only
apply it to 3.18.  Hopefully that is acceptable.  

Also, I'll have a patch shortly that will update all of the 3.17
recipes to 3.18 (assuming it passes cI), which should close any
exposure there.

Thanks,
Jon

>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
> new file mode 100644
> index 0000000..db88e7f
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
> @@ -0,0 +1,188 @@
> +From f189457b79989543f65b8a4e8729eff2cdf9a758 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 13 Aug 2022 19:24:55 -0700
> +Subject: [PATCH] core: Define section attributes for clang
> +
> +Clang's attribute section is not same as gcc, here we need to add flags
> +to sections so they can be eventually collected by linker into final
> +output segments. Only way to do so with clang is to use
> +
> +pragma clang section ...
> +
> +The behavious is described here [1], this allows us to define names bss
> +sections. This was not an issue until clang-15 where LLD linker starts
> +to detect the section flags before merging them and throws the following
> +errors
> +
> +| ld.lld: error: section type mismatch for .nozi.kdata_page
> +| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SHT_PROGBITS
> +| >>> output section .nozi: SHT_NOBITS
> +|
> +| ld.lld: error: section type mismatch for .nozi.mmu.l2
> +| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT_PROGBITS
> +| >>> output section .nozi: SHT_NOBITS
> +
> +These sections should be carrying SHT_NOBITS but so far it was not
> +possible to do so, this patch tries to use clangs pragma to get this
> +going and match the functionality with gcc.
> +
> +[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#specifying-section-names-for-global-objects-pragma-clang-section
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
> + core/arch/arm/mm/core_mmu_lpae.c | 35 ++++++++++++++++++++++++++++----
> + core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
> + core/kernel/thread.c             | 13 +++++++++++-
> + 4 files changed, 71 insertions(+), 8 deletions(-)
> +
> +diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
> +index f083b159e..432983c86 100644
> +--- a/core/arch/arm/kernel/thread.c
> ++++ b/core/arch/arm/kernel/thread.c
> +@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
> + #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
> + 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
> + long thread_user_kdata_sp_offset __nex_bss;
> ++#ifdef __clang__
> ++#ifndef CFG_VIRTUALIZATION
> ++#pragma clang section bss=".nozi.kdata_page"
> ++#else
> ++#pragma clang section bss=".nex_nozi.kdata_page"
> ++#endif
> ++#endif
> + static uint8_t thread_user_kdata_page[
> + 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
> + 		SMALL_PAGE_SIZE)]
> + 	__aligned(SMALL_PAGE_SIZE)
> ++#ifndef __clang__
> + #ifndef CFG_VIRTUALIZATION
> +-	__section(".nozi.kdata_page");
> ++	__section(".nozi.kdata_page")
> + #else
> +-	__section(".nex_nozi.kdata_page");
> ++	__section(".nex_nozi.kdata_page")
> + #endif
> ++#endif
> ++    ;
> ++#endif
> ++
> ++/* reset BSS section to default ( .bss ) */
> ++#ifdef __clang__
> ++#pragma clang section bss=""
> + #endif
> + 
> + #ifdef ARM32
> +diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mmu_lpae.c
> +index 19cd7b61b..78f5910c5 100644
> +--- a/core/arch/arm/mm/core_mmu_lpae.c
> ++++ b/core/arch/arm/mm/core_mmu_lpae.c
> +@@ -230,19 +230,46 @@ typedef uint16_t l1_idx_t;
> + typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
> + typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
> + 
> ++#ifdef __clang__
> ++#pragma clang section bss=".nozi.mmu.base_table"
> ++#endif
> + static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
> + 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
> +-	__section(".nozi.mmu.base_table");
> ++#ifndef __clang__
> ++	__section(".nozi.mmu.base_table")
> ++#endif
> ++;
> ++#ifdef __clang__
> ++#pragma clang section bss=""
> ++#endif
> + 
> ++#ifdef __clang__
> ++#pragma clang section bss=".nozi.mmu.l2"
> ++#endif
> + static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
> +-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
> ++	__aligned(XLAT_TABLE_SIZE)
> ++#ifndef __clang__
> ++	__section(".nozi.mmu.l2")
> ++#endif
> ++;
> ++#ifdef __clang__
> ++#pragma clang section bss=""
> ++#endif
> + 
> + #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
> + 
> ++#ifdef __clang__
> ++#pragma clang section bss=".nozi.mmu.l2"
> ++#endif
> + /* MMU L2 table for TAs, one for each thread */
> + static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
> +-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
> +-
> ++#ifndef __clang__
> ++	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
> ++#endif
> ++;
> ++#ifdef __clang__
> ++#pragma clang section bss=""
> ++#endif
> + /*
> +  * TAs page table entry inside a level 1 page table.
> +  *
> +diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
> +index d658b3e68..6c36706c0 100644
> +--- a/core/arch/arm/mm/pgt_cache.c
> ++++ b/core/arch/arm/mm/pgt_cache.c
> +@@ -104,8 +104,18 @@ void pgt_init(void)
> + 	 * has a large alignment, while .bss has a small alignment. The current
> + 	 * link script is optimized for small alignment in .bss
> + 	 */
> ++#ifdef __clang__
> ++#pragma clang section bss=".nozi.mmu.l2"
> ++#endif
> + 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
> +-			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
> ++			__aligned(PGT_SIZE)
> ++#ifndef __clang__
> ++			__section(".nozi.pgt_cache")
> ++#endif
> ++			;
> ++#ifdef __clang__
> ++#pragma clang section bss=""
> ++#endif
> + 	size_t n;
> + 
> + 	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
> +diff --git a/core/kernel/thread.c b/core/kernel/thread.c
> +index 18d34e6ad..086129e28 100644
> +--- a/core/kernel/thread.c
> ++++ b/core/kernel/thread.c
> +@@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_CORE_NB_CORE] __nex_bss;
> + 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
> + #endif
> + 
> ++#define DO_PRAGMA(x) _Pragma (#x)
> ++
> ++#ifdef __clang__
> ++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> ++DO_PRAGMA (clang section bss=".nozi_stack." #name) \
> ++linkage uint32_t name[num_stacks] \
> ++		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> ++			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
> ++		__attribute__((aligned(STACK_ALIGNMENT))); \
> ++DO_PRAGMA(clang section bss="")
> ++#else
> + #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> + linkage uint32_t name[num_stacks] \
> + 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> + 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
> + 		__attribute__((section(".nozi_stack." # name), \
> + 			       aligned(STACK_ALIGNMENT)))
> +-
> ++#endif
> + #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
> + 
> + DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
> +-- 
> +2.37.2
> +
> -- 
> 2.37.2
> 
> 

