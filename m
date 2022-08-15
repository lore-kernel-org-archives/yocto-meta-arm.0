Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377BCC00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:49:12 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.6160.1660589350829756238
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 11:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BkeYAkh9;
 spf=pass (domain: gmail.com, ip: 209.85.128.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-3246910dac3so94986247b3.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 11:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ormfJy/WLfnTO8ZTXWsYHbJU/rR5mFFakAi39KNyyus=;
        b=BkeYAkh9cVcPFalsYj9ykfJyf2bZiMM5xiITjJTryE69nnHBoiKGWwnw0ht8ovoAyM
         IN6iBBx4dz8cjTDygOn+Sx1JnV2B3gXp1jzgs81RGZYiaEPe4BnUDqvAMRIDLxttOFWZ
         NkzkkSXSK4aA0bFzlKPJnH9AflX6/jwywJy/uyRPWVPT1xTZwaMtN91pNLu9U6hdVBml
         ODMa/0iwFoPRZ/q+p6CBWj1qBCMlbRu1AkqGVdazc2h71BycSSpO58I2DIEokoNvaHfQ
         srSVM5VLyKYHeNkkIbVbp1JJKD04TRehinbZWi/SBPe9s9hcUeDqBJ6F9tqb8v+UYIjq
         8udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ormfJy/WLfnTO8ZTXWsYHbJU/rR5mFFakAi39KNyyus=;
        b=BJ327qMjQyUPsrcQhRMtzPmH5CGwzrlrVsfJtKMz1UEC8zkRhV1FHBn87Ls5ya2XG4
         JwCEDyCGVFc+7zKaBPNoBxoyIzUMh3p6cwIOf1SSe1VQZM8zLpadKPluyOhvtxtb+iyX
         DWpyGTxeAw+/hA3kLFjOdtWD4qGdllEJfJJ7tvYPVcvSbH4sT39C/YTmXs0Up6nmc7EG
         M8OlqnYt0p1jSs4HfmgzmuuCaZGnfpt2q9XgXELTr+GxnNyl/epRJkd/ROLCzrfYP2JH
         9E1BaKafXPfTrhZkgxf49BCaRELk0rLJDKAToCSIv6/3gZPT47T/LWLOyUOapAGFVG8+
         4U3A==
X-Gm-Message-State: ACgBeo1VB72ZW+eApk0ehynEG1CBDseYWqquUQGLDqkQcJS1CzlwxqSv
	CWf2K1zaY1fglKR27X+/bkfXOxF6YjUqnLg8l7s=
X-Google-Smtp-Source: 
 AA6agR6FZbqkTU+HMIjRNtK9xKVf2alXEJqQOqCk7RtvYjMzjvXPpD8fwmR9jACke0yKXKzKz6ruwhEvECp+CgaH7S0=
X-Received: by 2002:a81:55c2:0:b0:31f:645b:9858 with SMTP id
 j185-20020a8155c2000000b0031f645b9858mr14477589ywb.296.1660589349837; Mon, 15
 Aug 2022 11:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220814025124.229339-1-raj.khem@gmail.com>
 <20220814025124.229339-2-raj.khem@gmail.com>
 <YvqPtKgWHNmo+0T/@kudzu.us>
In-Reply-To: <YvqPtKgWHNmo+0T/@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Aug 2022 11:48:43 -0700
Message-ID: 
 <CAMKF1sogmSHmk9kr2FAVo3chSJsAhPM1QL+RpKX6U1Tf90wPLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] optee-os: Add section attribute parameters when clang
 is used
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 18:49:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3686

On Mon, Aug 15, 2022 at 11:25 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Sat, Aug 13, 2022 at 07:51:24PM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-arm/recipes-security/optee/optee-os.inc  |   1 +
> >  ...-Define-section-attributes-for-clang.patch | 188 ++++++++++++++++++
> >  2 files changed, 189 insertions(+)
> >  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > index 11193dc..7834aae 100644
> > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > @@ -19,6 +19,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
> >  SRC_URI:append = " \
> >      file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> >      file://0007-allow-setting-sysroot-for-clang.patch \
> > +    file://0001-core-Define-section-attributes-for-clang.patch \
> >     "
>
> This breaks the 3.14 recipe.  So, I'm modifying the patch to only
> apply it to 3.18.  Hopefully that is acceptable.
>
> Also, I'll have a patch shortly that will update all of the 3.17
> recipes to 3.18 (assuming it passes cI), which should close any
> exposure there.

Thanks Jon, I have done builds for 3.18 and 3.17 but not for 3.14

>
> Thanks,
> Jon
>
> >
> >  S = "${WORKDIR}/git"
> > diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
> > new file mode 100644
> > index 0000000..db88e7f
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
> > @@ -0,0 +1,188 @@
> > +From f189457b79989543f65b8a4e8729eff2cdf9a758 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 13 Aug 2022 19:24:55 -0700
> > +Subject: [PATCH] core: Define section attributes for clang
> > +
> > +Clang's attribute section is not same as gcc, here we need to add flags
> > +to sections so they can be eventually collected by linker into final
> > +output segments. Only way to do so with clang is to use
> > +
> > +pragma clang section ...
> > +
> > +The behavious is described here [1], this allows us to define names bss
> > +sections. This was not an issue until clang-15 where LLD linker starts
> > +to detect the section flags before merging them and throws the following
> > +errors
> > +
> > +| ld.lld: error: section type mismatch for .nozi.kdata_page
> > +| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SHT_PROGBITS
> > +| >>> output section .nozi: SHT_NOBITS
> > +|
> > +| ld.lld: error: section type mismatch for .nozi.mmu.l2
> > +| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT_PROGBITS
> > +| >>> output section .nozi: SHT_NOBITS
> > +
> > +These sections should be carrying SHT_NOBITS but so far it was not
> > +possible to do so, this patch tries to use clangs pragma to get this
> > +going and match the functionality with gcc.
> > +
> > +[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#specifying-section-names-for-global-objects-pragma-clang-section
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
> > + core/arch/arm/mm/core_mmu_lpae.c | 35 ++++++++++++++++++++++++++++----
> > + core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
> > + core/kernel/thread.c             | 13 +++++++++++-
> > + 4 files changed, 71 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
> > +index f083b159e..432983c86 100644
> > +--- a/core/arch/arm/kernel/thread.c
> > ++++ b/core/arch/arm/kernel/thread.c
> > +@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
> > + #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
> > +     defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
> > + long thread_user_kdata_sp_offset __nex_bss;
> > ++#ifdef __clang__
> > ++#ifndef CFG_VIRTUALIZATION
> > ++#pragma clang section bss=".nozi.kdata_page"
> > ++#else
> > ++#pragma clang section bss=".nex_nozi.kdata_page"
> > ++#endif
> > ++#endif
> > + static uint8_t thread_user_kdata_page[
> > +     ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
> > +             SMALL_PAGE_SIZE)]
> > +     __aligned(SMALL_PAGE_SIZE)
> > ++#ifndef __clang__
> > + #ifndef CFG_VIRTUALIZATION
> > +-    __section(".nozi.kdata_page");
> > ++    __section(".nozi.kdata_page")
> > + #else
> > +-    __section(".nex_nozi.kdata_page");
> > ++    __section(".nex_nozi.kdata_page")
> > + #endif
> > ++#endif
> > ++    ;
> > ++#endif
> > ++
> > ++/* reset BSS section to default ( .bss ) */
> > ++#ifdef __clang__
> > ++#pragma clang section bss=""
> > + #endif
> > +
> > + #ifdef ARM32
> > +diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mmu_lpae.c
> > +index 19cd7b61b..78f5910c5 100644
> > +--- a/core/arch/arm/mm/core_mmu_lpae.c
> > ++++ b/core/arch/arm/mm/core_mmu_lpae.c
> > +@@ -230,19 +230,46 @@ typedef uint16_t l1_idx_t;
> > + typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
> > + typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
> > +
> > ++#ifdef __clang__
> > ++#pragma clang section bss=".nozi.mmu.base_table"
> > ++#endif
> > + static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
> > +     __aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
> > +-    __section(".nozi.mmu.base_table");
> > ++#ifndef __clang__
> > ++    __section(".nozi.mmu.base_table")
> > ++#endif
> > ++;
> > ++#ifdef __clang__
> > ++#pragma clang section bss=""
> > ++#endif
> > +
> > ++#ifdef __clang__
> > ++#pragma clang section bss=".nozi.mmu.l2"
> > ++#endif
> > + static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
> > +-    __aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
> > ++    __aligned(XLAT_TABLE_SIZE)
> > ++#ifndef __clang__
> > ++    __section(".nozi.mmu.l2")
> > ++#endif
> > ++;
> > ++#ifdef __clang__
> > ++#pragma clang section bss=""
> > ++#endif
> > +
> > + #define XLAT_TABLES_SIZE    (sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
> > +
> > ++#ifdef __clang__
> > ++#pragma clang section bss=".nozi.mmu.l2"
> > ++#endif
> > + /* MMU L2 table for TAs, one for each thread */
> > + static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
> > +-    __aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
> > +-
> > ++#ifndef __clang__
> > ++    __aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
> > ++#endif
> > ++;
> > ++#ifdef __clang__
> > ++#pragma clang section bss=""
> > ++#endif
> > + /*
> > +  * TAs page table entry inside a level 1 page table.
> > +  *
> > +diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
> > +index d658b3e68..6c36706c0 100644
> > +--- a/core/arch/arm/mm/pgt_cache.c
> > ++++ b/core/arch/arm/mm/pgt_cache.c
> > +@@ -104,8 +104,18 @@ void pgt_init(void)
> > +      * has a large alignment, while .bss has a small alignment. The current
> > +      * link script is optimized for small alignment in .bss
> > +      */
> > ++#ifdef __clang__
> > ++#pragma clang section bss=".nozi.mmu.l2"
> > ++#endif
> > +     static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
> > +-                    __aligned(PGT_SIZE) __section(".nozi.pgt_cache");
> > ++                    __aligned(PGT_SIZE)
> > ++#ifndef __clang__
> > ++                    __section(".nozi.pgt_cache")
> > ++#endif
> > ++                    ;
> > ++#ifdef __clang__
> > ++#pragma clang section bss=""
> > ++#endif
> > +     size_t n;
> > +
> > +     for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
> > +diff --git a/core/kernel/thread.c b/core/kernel/thread.c
> > +index 18d34e6ad..086129e28 100644
> > +--- a/core/kernel/thread.c
> > ++++ b/core/kernel/thread.c
> > +@@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_CORE_NB_CORE] __nex_bss;
> > +     name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
> > + #endif
> > +
> > ++#define DO_PRAGMA(x) _Pragma (#x)
> > ++
> > ++#ifdef __clang__
> > ++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> > ++DO_PRAGMA (clang section bss=".nozi_stack." #name) \
> > ++linkage uint32_t name[num_stacks] \
> > ++            [ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> > ++                     STACK_ALIGNMENT) / sizeof(uint32_t)] \
> > ++            __attribute__((aligned(STACK_ALIGNMENT))); \
> > ++DO_PRAGMA(clang section bss="")
> > ++#else
> > + #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> > + linkage uint32_t name[num_stacks] \
> > +             [ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> > +                      STACK_ALIGNMENT) / sizeof(uint32_t)] \
> > +             __attribute__((section(".nozi_stack." # name), \
> > +                            aligned(STACK_ALIGNMENT)))
> > +-
> > ++#endif
> > + #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
> > +
> > + DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
> > +--
> > +2.37.2
> > +
> > --
> > 2.37.2
> >
> >

