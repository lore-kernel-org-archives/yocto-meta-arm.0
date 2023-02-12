Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0865C636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 17:27:56 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.15548.1676222868105502011
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 09:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RX8F9Iue;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-16df32f2ffdso2149889fac.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 09:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ij97tnSrCtzqtSToYRjQpD6RC/oU5zVVKDUGvtjdGP0=;
        b=RX8F9IuepHtTvrw1njqe6E4QSf6SXajK+SLxCcAqAe0qLDPzS8MFRTtvzhG4QrDx+m
         0FZSncX6NCA9fNhxOyOh7BqKcnL2xERMjwwcrwX1wOzhqDtT+8kWWc9eg67/6wNGVREI
         BkU8AQNaeIlKCm927GxF8ofN0Sv0DYCsr5AGc5YfqXAfqVv/1QYpddDjfddHZiIQSMBD
         pKju+0/S3KMDw0omI4ATNTOCr7bicwzlQewkaM1UqTcsAgson8PR0UwpKQh1/+hK7bPa
         OOH5Rs+tsAkWOtLltEKs2Y22LLEuLgRqwviiC6eWnT7fH8cKZaEMfwgBDObMibQpx0Ac
         VjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij97tnSrCtzqtSToYRjQpD6RC/oU5zVVKDUGvtjdGP0=;
        b=A6gM+fMJlrYZmOVrM3dPfNe6rQ0MMqBs+6V1Oif+PD0OH3tLqfX05XA+Cc97YKWF71
         BZiOlhlNG0r+UqBMi0lBUYCKhW/mzZJzoAf9200uyQWepJIg4B0bgPJnj/o8OLck29Jw
         l22yvMbWFp5+SoUZ/0QFTrjSu5KLvjj2h0Z7EsSZKYcni6m2pHDg8NTnDIYl9qaxAq8I
         JiiNyON2G52Drq4NOZfiquod8W6N51Va5yNuzR1zbUwNxCleLxubepM4AaRnHrqtv5Uu
         B67Zldjm80Omx1rj+H7q53PTabuUxxFCChjnwBdDikXNqHV0SjaBKm6U1klp0/VWDB5t
         BTiA==
X-Gm-Message-State: AO0yUKWZRKXoJKp813Oe2S/GqEPxUacCr5W1Xmp+dl2VTceRXc8BYnFJ
	cN/4TSfFl1t52jnz6K+qqJoaSKgv9sCrIBeRAEgGdAJUxAQ=
X-Google-Smtp-Source: AK7set8abjnexgruDeP+NWsP0vgosnQXZEJKRsbK+d6gRGgvXgpWNXPzOQ7xRNcYWwBtgEyEgCDDqX0HPRmtJqyIuqk=
X-Received: by 2002:a05:6870:170b:b0:16e:d9d:ce59 with SMTP id
 h11-20020a056870170b00b0016e0d9dce59mr18729oae.55.1676222867047; Sun, 12 Feb
 2023 09:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20230212171624.2889953-1-raj.khem@gmail.com>
In-Reply-To: <20230212171624.2889953-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Feb 2023 09:27:21 -0800
Message-ID: <CAMKF1srOBNp=OPkSj_iGbm9BANhVO73U4o50tAn1pe6=Kdtzog@mail.gmail.com>
Subject: Re: [PATCH] optee-os: Refresh 0001-core-Define-section-attributes-for-clang.patch
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 17:27:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4382

ignore this patch.

On Sun, Feb 12, 2023 at 9:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> thread.c is moved from core/kernel/thread.c to core/arch/arm/kernel/thread.c
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-Define-section-attributes-for-clang.patch | 69 +++++++++----------
>  .../0009-add-z-execstack.patch                | 18 ++---
>  .../0010-add-note-GNU-stack-section.patch     | 14 ----
>  3 files changed, 40 insertions(+), 61 deletions(-)
>
> diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Define-section-attributes-for-clang.patch
> index a69d7776..d0f258a7 100644
> --- a/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Define-section-attributes-for-clang.patch
> +++ b/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Define-section-attributes-for-clang.patch
> @@ -34,12 +34,38 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
>   core/arch/arm/mm/core_mmu_lpae.c | 35 ++++++++++++++++++++++++++++----
>   core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
> - core/kernel/thread.c             | 13 +++++++++++-
> + core/arch/arm/kernel/thread.c    | 13 +++++++++++-
>   4 files changed, 71 insertions(+), 8 deletions(-)
>
>  --- a/core/arch/arm/kernel/thread.c
>  +++ b/core/arch/arm/kernel/thread.c
> -@@ -44,16 +44,31 @@ static size_t thread_user_kcode_size __n
> +@@ -118,13 +118,24 @@ struct thread_core_local thread_core_loc
> + #define STACK_CHECK_EXTRA     0
> + #endif
> +
> ++#define DO_PRAGMA(x) _Pragma (#x)
> ++
> ++#ifdef __clang__
> ++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> ++DO_PRAGMA (clang section bss=".nozi_stack." #name) \
> ++linkage uint32_t name[num_stacks] \
> ++              [ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> ++                       STACK_ALIGNMENT) / sizeof(uint32_t)] \
> ++              __attribute__((aligned(STACK_ALIGNMENT))); \
> ++DO_PRAGMA(clang section bss="")
> ++#else
> + #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> + linkage uint32_t name[num_stacks] \
> +               [ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> +                        STACK_ALIGNMENT) / sizeof(uint32_t)] \
> +               __attribute__((section(".nozi_stack." # name), \
> +                              aligned(STACK_ALIGNMENT)))
> +-
> ++#endif
> + #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
> +
> + DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
> +@@ -163,15 +174,30 @@ static size_t thread_user_kcode_size __n
>   #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
>         defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
>   long thread_user_kdata_sp_offset __nex_bss;
> @@ -51,8 +77,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +#endif
>  +#endif
>   static uint8_t thread_user_kdata_page[
> -       ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
> -               SMALL_PAGE_SIZE)]
> +       ROUNDUP(sizeof(thread_core_local), SMALL_PAGE_SIZE)]
>         __aligned(SMALL_PAGE_SIZE)
>  +#ifndef __clang__
>   #ifndef CFG_VIRTUALIZATION
> @@ -71,11 +96,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +#pragma clang section bss=""
>  +#endif
>
> - #ifdef ARM32
> - uint32_t __nostackcheck thread_get_exceptions(void)
> + static unsigned int thread_global_lock __nex_bss = SPINLOCK_UNLOCK;
> +
>  --- a/core/arch/arm/mm/core_mmu_lpae.c
>  +++ b/core/arch/arm/mm/core_mmu_lpae.c
> -@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
> +@@ -230,19 +230,46 @@ typedef uint16_t l1_idx_t;
>   typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
>   typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
>
> @@ -148,37 +173,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>         size_t n;
>
>         for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
> ---- a/core/kernel/thread.c
> -+++ b/core/kernel/thread.c
> -@@ -37,13 +37,24 @@ struct thread_core_local thread_core_loc
> -       name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
> - #endif
> -
> -+#define DO_PRAGMA(x) _Pragma (#x)
> -+
> -+#ifdef __clang__
> -+#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> -+DO_PRAGMA (clang section bss=".nozi_stack." #name) \
> -+linkage uint32_t name[num_stacks] \
> -+              [ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> -+                       STACK_ALIGNMENT) / sizeof(uint32_t)] \
> -+              __attribute__((aligned(STACK_ALIGNMENT))); \
> -+DO_PRAGMA(clang section bss="")
> -+#else
> - #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
> - linkage uint32_t name[num_stacks] \
> -               [ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
> -                        STACK_ALIGNMENT) / sizeof(uint32_t)] \
> -               __attribute__((section(".nozi_stack." # name), \
> -                              aligned(STACK_ALIGNMENT)))
> --
> -+#endif
> - #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
> -
> - DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
>  --- a/core/arch/arm/mm/core_mmu_v7.c
>  +++ b/core/arch/arm/mm/core_mmu_v7.c
> -@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_EN
> +@@ -190,16 +190,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_EN
>   typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
>   typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
>
> diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-execstack.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-execstack.patch
> index 3ba6c4ef..a822185e 100644
> --- a/meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-execstack.patch
> +++ b/meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-execstack.patch
> @@ -26,11 +26,9 @@ Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
>   ldelf/link.mk                |  3 +++
>   2 files changed, 12 insertions(+), 4 deletions(-)
>
> -diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
> -index c39d43cb..0e96e606 100644
>  --- a/core/arch/arm/kernel/link.mk
>  +++ b/core/arch/arm/kernel/link.mk
> -@@ -9,6 +9,11 @@ link-script-dep = $(link-out-dir)/.kern.ld.d
> +@@ -9,6 +9,11 @@ link-script-dep = $(link-out-dir)/.kern.
>
>   AWK    = awk
>
> @@ -41,8 +39,8 @@ index c39d43cb..0e96e606 100644
>  +
>   link-ldflags  = $(LDFLAGS)
>   ifeq ($(CFG_CORE_ASLR),y)
> - link-ldflags += -pie -Bsymbolic -z norelro $(ldflag-apply-dynamic-relocs)
> -@@ -31,7 +36,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
> + link-ldflags += -pie -Bsymbolic -z notext -z norelro $(ldflag-apply-dynamic-relocs)
> +@@ -25,7 +30,7 @@ link-ldflags += -T $(link-script-pp) -Ma
>   link-ldflags += --sort-section=alignment
>   link-ldflags += --fatal-warnings
>   link-ldflags += --gc-sections
> @@ -51,7 +49,7 @@ index c39d43cb..0e96e606 100644
>
>   link-ldadd  = $(LDADD)
>   link-ldadd += $(ldflags-external)
> -@@ -56,7 +61,7 @@ link-script-cppflags := \
> +@@ -50,7 +55,7 @@ link-script-cppflags := \
>                 $(cppflagscore))
>
>   ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
> @@ -60,7 +58,7 @@ index c39d43cb..0e96e606 100644
>                    $(link-objs) $(link-ldadd) $(libgcccore)
>   cleanfiles += $(link-out-dir)/all_objs.o
>   $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
> -@@ -70,7 +75,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
> +@@ -64,7 +69,7 @@ $(link-out-dir)/unpaged_entries.txt: $(l
>                 $(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
>
>   unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
> @@ -69,7 +67,7 @@ index c39d43cb..0e96e606 100644
>   unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
>   cleanfiles += $(link-out-dir)/unpaged.o
>   $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
> -@@ -99,7 +104,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
> +@@ -93,7 +98,7 @@ $(link-out-dir)/init_entries.txt: $(link
>                 $(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
>
>   init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
> @@ -78,11 +76,9 @@ index c39d43cb..0e96e606 100644
>   init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
>               $(libgcccore)
>   cleanfiles += $(link-out-dir)/init.o
> -diff --git a/ldelf/link.mk b/ldelf/link.mk
> -index 64c8212a..bd49551e 100644
>  --- a/ldelf/link.mk
>  +++ b/ldelf/link.mk
> -@@ -20,6 +20,9 @@ link-ldflags += -z max-page-size=4096 # OP-TEE always uses 4K alignment
> +@@ -20,6 +20,9 @@ link-ldflags += -z max-page-size=4096 #
>   ifeq ($(CFG_CORE_BTI),y)
>   link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
>   endif
> diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-note-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-note-GNU-stack-section.patch
> index 4ea65d88..88ee35c2 100644
> --- a/meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-note-GNU-stack-section.patch
> +++ b/meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-note-GNU-stack-section.patch
> @@ -35,8 +35,6 @@ Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
>   ta/arch/arm/ta_entry_a32.S                           | 2 ++
>   7 files changed, 14 insertions(+)
>
> -diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch/arm/utee_syscalls_a32.S
> -index 6e621ca6..af405f62 100644
>  --- a/lib/libutee/arch/arm/utee_syscalls_a32.S
>  +++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
>  @@ -7,6 +7,8 @@
> @@ -48,8 +46,6 @@ index 6e621ca6..af405f62 100644
>           .section .text
>           .balign 4
>           .code 32
> -diff --git a/lib/libutils/ext/arch/arm/atomic_a32.S b/lib/libutils/ext/arch/arm/atomic_a32.S
> -index eaef6914..2be73ffa 100644
>  --- a/lib/libutils/ext/arch/arm/atomic_a32.S
>  +++ b/lib/libutils/ext/arch/arm/atomic_a32.S
>  @@ -5,6 +5,8 @@
> @@ -61,8 +57,6 @@ index eaef6914..2be73ffa 100644
>   /* uint32_t atomic_inc32(uint32_t *v); */
>   FUNC atomic_inc32 , :
>         ldrex   r1, [r0]
> -diff --git a/lib/libutils/ext/arch/arm/mcount_a32.S b/lib/libutils/ext/arch/arm/mcount_a32.S
> -index 51439a23..54dc3c02 100644
>  --- a/lib/libutils/ext/arch/arm/mcount_a32.S
>  +++ b/lib/libutils/ext/arch/arm/mcount_a32.S
>  @@ -7,6 +7,8 @@
> @@ -74,8 +68,6 @@ index 51439a23..54dc3c02 100644
>   /*
>    * Convert return address to call site address by subtracting the size of the
>    * mcount call instruction (blx __gnu_mcount_nc).
> -diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
> -index a600c879..37ae9ec6 100644
>  --- a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
>  +++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
>  @@ -5,6 +5,8 @@
> @@ -87,8 +79,6 @@ index a600c879..37ae9ec6 100644
>   /*
>    * signed ret_idivmod_values(signed quot, signed rem);
>    * return quotient and remaining the EABI way (regs r0,r1)
> -diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
> -index 2dc50bc9..5c3353e2 100644
>  --- a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
>  +++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
>  @@ -5,6 +5,8 @@
> @@ -100,8 +90,6 @@ index 2dc50bc9..5c3353e2 100644
>   /*
>    * __value_in_regs lldiv_t __aeabi_ldivmod( long long n, long long d)
>    */
> -diff --git a/lib/libutils/isoc/arch/arm/setjmp_a32.S b/lib/libutils/isoc/arch/arm/setjmp_a32.S
> -index 43ea5937..f8a0b70d 100644
>  --- a/lib/libutils/isoc/arch/arm/setjmp_a32.S
>  +++ b/lib/libutils/isoc/arch/arm/setjmp_a32.S
>  @@ -51,6 +51,8 @@
> @@ -113,8 +101,6 @@ index 43ea5937..f8a0b70d 100644
>   /* Arm/Thumb interworking support:
>
>      The interworking scheme expects functions to use a BX instruction
> -diff --git a/ta/arch/arm/ta_entry_a32.S b/ta/arch/arm/ta_entry_a32.S
> -index d2f8a69d..cd9a12f9 100644
>  --- a/ta/arch/arm/ta_entry_a32.S
>  +++ b/ta/arch/arm/ta_entry_a32.S
>  @@ -5,6 +5,8 @@
> --
> 2.39.1
>

