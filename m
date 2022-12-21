Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78522C3DA7C
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 14:39:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20304.1671633589319188131
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 06:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F151FAD7;
	Wed, 21 Dec 2022 06:40:29 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19C833F71E;
	Wed, 21 Dec 2022 06:39:47 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/5] arm/optee: Move optee-3.18 patches
Date: Wed, 21 Dec 2022 14:39:38 +0000
Message-Id: <20221221143942.15196-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221143942.15196-1-emekcan.aras@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 14:39:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4216

From: Emekcan Aras <emekcan.aras@arm.com>

Moves optee-3.18 and optee-tadevkit patches into
related directories.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...-Define-section-attributes-for-clang.patch |   0
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   0
 ...0007-allow-setting-sysroot-for-clang.patch |   0
 .../0008-no-warn-rwx-segments.patch           |   0
 .../0009-add-z-execstack.patch                |   0
 .../0010-add-note-GNU-stack-section.patch     |   0
 ...-Define-section-attributes-for-clang.patch | 230 ++++++++++++++++++
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  35 +++
 ...0007-allow-setting-sysroot-for-clang.patch |  30 +++
 .../0008-no-warn-rwx-segments.patch           |  65 +++++
 .../0009-add-z-execstack.patch                |  94 +++++++
 .../0010-add-note-GNU-stack-section.patch     | 128 ++++++++++
 .../recipes-security/optee/optee-os_3.18.0.bb |   2 +
 13 files changed, 584 insertions(+)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0001-core-Define-section-attributes-for-clang.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0006-allow-setting-sysroot-for-libgcc-lookup.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0007-allow-setting-sysroot-for-clang.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0008-no-warn-rwx-segments.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0009-add-z-execstack.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0010-add-note-GNU-stack-section.patch (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0001-core-Define-section-attributes-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0008-no-warn-rwx-segments.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0009-add-z-execstack.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0010-add-note-GNU-stack-section.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Define-section-attributes-for-clang.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Define-section-attributes-for-clang.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0007-allow-setting-sysroot-for-clang.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0007-allow-setting-sysroot-for-clang.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0008-no-warn-rwx-segments.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-segments.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0008-no-warn-rwx-segments.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/0009-add-z-execstack.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-execstack.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/0009-add-z-execstack.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-execstack.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/0010-add-note-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-note-GNU-stack-section.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/0010-add-note-GNU-stack-section.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-note-GNU-stack-section.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0001-core-Define-section-attributes-for-clang.patch
new file mode 100644
index 00000000..a69d7776
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0001-core-Define-section-attributes-for-clang.patch
@@ -0,0 +1,230 @@
+From f189457b79989543f65b8a4e8729eff2cdf9a758 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Aug 2022 19:24:55 -0700
+Subject: [PATCH] core: Define section attributes for clang
+
+Clang's attribute section is not same as gcc, here we need to add flags
+to sections so they can be eventually collected by linker into final
+output segments. Only way to do so with clang is to use
+
+pragma clang section ...
+
+The behavious is described here [1], this allows us to define names bss
+sections. This was not an issue until clang-15 where LLD linker starts
+to detect the section flags before merging them and throws the following
+errors
+
+| ld.lld: error: section type mismatch for .nozi.kdata_page
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SHT_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+|
+| ld.lld: error: section type mismatch for .nozi.mmu.l2
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+
+These sections should be carrying SHT_NOBITS but so far it was not
+possible to do so, this patch tries to use clangs pragma to get this
+going and match the functionality with gcc.
+
+[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#specifying-section-names-for-global-objects-pragma-clang-section
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
+ core/arch/arm/mm/core_mmu_lpae.c | 35 ++++++++++++++++++++++++++++----
+ core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
+ core/kernel/thread.c             | 13 +++++++++++-
+ 4 files changed, 71 insertions(+), 8 deletions(-)
+
+--- a/core/arch/arm/kernel/thread.c
++++ b/core/arch/arm/kernel/thread.c
+@@ -44,16 +44,31 @@ static size_t thread_user_kcode_size __n
+ #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
+ 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
+ long thread_user_kdata_sp_offset __nex_bss;
++#ifdef __clang__
++#ifndef CFG_VIRTUALIZATION
++#pragma clang section bss=".nozi.kdata_page"
++#else
++#pragma clang section bss=".nex_nozi.kdata_page"
++#endif
++#endif
+ static uint8_t thread_user_kdata_page[
+ 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
+ 		SMALL_PAGE_SIZE)]
+ 	__aligned(SMALL_PAGE_SIZE)
++#ifndef __clang__
+ #ifndef CFG_VIRTUALIZATION
+-	__section(".nozi.kdata_page");
++	__section(".nozi.kdata_page")
+ #else
+-	__section(".nex_nozi.kdata_page");
++	__section(".nex_nozi.kdata_page")
+ #endif
+ #endif
++    ;
++#endif
++
++/* reset BSS section to default ( .bss ) */
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ #ifdef ARM32
+ uint32_t __nostackcheck thread_get_exceptions(void)
+--- a/core/arch/arm/mm/core_mmu_lpae.c
++++ b/core/arch/arm/mm/core_mmu_lpae.c
+@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
+ typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
+ typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.base_table"
++#endif
+ static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
+ 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
+-	__section(".nozi.mmu.base_table");
++#ifndef __clang__
++	__section(".nozi.mmu.base_table")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
++	__aligned(XLAT_TABLE_SIZE)
++#ifndef __clang__
++	__section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ /* MMU L2 table for TAs, one for each thread */
+ static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
+-
++#ifndef __clang__
++	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ /*
+  * TAs page table entry inside a level 1 page table.
+  *
+--- a/core/arch/arm/mm/pgt_cache.c
++++ b/core/arch/arm/mm/pgt_cache.c
+@@ -104,8 +104,18 @@ void pgt_init(void)
+ 	 * has a large alignment, while .bss has a small alignment. The current
+ 	 * link script is optimized for small alignment in .bss
+ 	 */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
+-			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
++			__aligned(PGT_SIZE)
++#ifndef __clang__
++			__section(".nozi.pgt_cache")
++#endif
++			;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 	size_t n;
+ 
+ 	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
+--- a/core/kernel/thread.c
++++ b/core/kernel/thread.c
+@@ -37,13 +37,24 @@ struct thread_core_local thread_core_loc
+ 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
+ #endif
+ 
++#define DO_PRAGMA(x) _Pragma (#x)
++
++#ifdef __clang__
++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
++DO_PRAGMA (clang section bss=".nozi_stack." #name) \
++linkage uint32_t name[num_stacks] \
++		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
++			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
++		__attribute__((aligned(STACK_ALIGNMENT))); \
++DO_PRAGMA(clang section bss="")
++#else
+ #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
+ linkage uint32_t name[num_stacks] \
+ 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
+ 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
+ 		__attribute__((section(".nozi_stack." # name), \
+ 			       aligned(STACK_ALIGNMENT)))
+-
++#endif
+ #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
+ 
+ DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
+--- a/core/arch/arm/mm/core_mmu_v7.c
++++ b/core/arch/arm/mm/core_mmu_v7.c
+@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_EN
+ typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
+ typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l1"
++#endif
+ static l1_xlat_tbl_t main_mmu_l1_ttb
+-		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
++		__aligned(L1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ /* L2 MMU tables */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
+-		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
++		__aligned(L2_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ /* MMU L1 table for TAs, one for each thread */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.ul1"
++#endif
+ static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
+-		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
++		__aligned(UL1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.ul1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ struct mmu_partition {
+ 	l1_xlat_tbl_t *l1_table;
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..ab4a6dbc
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,35 @@
+From 528aeb42652a3159c1bfd51d6c1442c3ff27b84c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
+for the compiler libraries as there's no easy way to reliably pass --sysroot
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24..81bfa78a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libgcc_eh.a 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0007-allow-setting-sysroot-for-clang.patch b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0007-allow-setting-sysroot-for-clang.patch
new file mode 100644
index 00000000..067ba6eb
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0007-allow-setting-sysroot-for-clang.patch
@@ -0,0 +1,30 @@
+From db9e44af75c7cfd3316cab15aaa387383df3e57e Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index c141a3f2..7d067cc0 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
+ 
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
+ # libgcc for clang
+-libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
+ 
+ # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0008-no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0008-no-warn-rwx-segments.patch
new file mode 100644
index 00000000..6d48a760
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0008-no-warn-rwx-segments.patch
@@ -0,0 +1,65 @@
+From cf2a2451f4e9300532d677bb3a8315494a3b3a82 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 5 Aug 2022 09:48:03 +0200
+Subject: [PATCH] core: link: add --no-warn-rwx-segments
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+binutils ld.bfd generates one RWX LOAD segment by merging several sections
+with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 it
+also warns by default when that happens [1], which breaks the build due to
+--fatal-warnings. The RWX segment is not a problem for the TEE core, since
+that information is not used to set memory permissions. Therefore, silence
+the warning.
+
+Link: [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+Link: https://sourceware.org/bugzilla/show_bug.cgi?id=29448
+Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+---
+ core/arch/arm/kernel/link.mk | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 7eed333a..c39d43cb 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -31,6 +31,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
+ link-ldflags += --sort-section=alignment
+ link-ldflags += --fatal-warnings
+ link-ldflags += --gc-sections
++link-ldflags += $(call ld-option,--no-warn-rwx-segments)
+ 
+ link-ldadd  = $(LDADD)
+ link-ldadd += $(ldflags-external)
+@@ -55,6 +56,7 @@ link-script-cppflags := \
+ 		$(cppflagscore))
+ 
+ ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
++		   $(call ld-option,--no-warn-rwx-segments) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/all_objs.o
+ $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
+@@ -67,7 +69,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
+ 
+-unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections
++unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
++		 $(call ld-option,--no-warn-rwx-segments)
+ unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/unpaged.o
+ $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
+@@ -95,7 +98,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
+ 
+-init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections
++init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
++	       $(call ld-option,--no-warn-rwx-segments)
+ init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
+ 	      $(libgcccore)
+ cleanfiles += $(link-out-dir)/init.o
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0009-add-z-execstack.patch b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0009-add-z-execstack.patch
new file mode 100644
index 00000000..3ba6c4ef
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0009-add-z-execstack.patch
@@ -0,0 +1,94 @@
+From ea932656461865ab9ac4036245c756c082aeb3e1 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Tue, 23 Aug 2022 11:41:00 +0000
+Subject: [PATCH] core, ldelf: link: add -z execstack
+
+When building for arm32 with GNU binutils 2.39, the linker outputs
+warnings when generating some TEE core binaries (all_obj.o, init.o,
+unpaged.o and tee.elf) as well as ldelf.elf:
+
+ arm-poky-linux-gnueabi-ld.bfd: warning: atomic_a32.o: missing .note.GNU-stack section implies executable stack
+ arm-poky-linux-gnueabi-ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+
+The permissions used when mapping the TEE core stacks do not depend on
+any metadata found in the ELF file. Similarly when the TEE core loads
+ldelf it already creates a non-executable stack regardless of ELF
+information. Therefore we can safely ignore the warnings. This is done
+by adding the '-z execstack' option.
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
+
+---
+ core/arch/arm/kernel/link.mk | 13 +++++++++----
+ ldelf/link.mk                |  3 +++
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index c39d43cb..0e96e606 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -9,6 +9,11 @@ link-script-dep = $(link-out-dir)/.kern.ld.d
+ 
+ AWK	 = awk
+ 
++link-ldflags-common += $(call ld-option,--no-warn-rwx-segments)
++ifeq ($(CFG_ARM32_core),y)
++link-ldflags-common += $(call ld-option,--no-warn-execstack)
++endif
++
+ link-ldflags  = $(LDFLAGS)
+ ifeq ($(CFG_CORE_ASLR),y)
+ link-ldflags += -pie -Bsymbolic -z norelro $(ldflag-apply-dynamic-relocs)
+@@ -31,7 +36,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
+ link-ldflags += --sort-section=alignment
+ link-ldflags += --fatal-warnings
+ link-ldflags += --gc-sections
+-link-ldflags += $(call ld-option,--no-warn-rwx-segments)
++link-ldflags += $(link-ldflags-common)
+ 
+ link-ldadd  = $(LDADD)
+ link-ldadd += $(ldflags-external)
+@@ -56,7 +61,7 @@ link-script-cppflags := \
+ 		$(cppflagscore))
+ 
+ ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
+-		   $(call ld-option,--no-warn-rwx-segments) \
++		   $(link-ldflags-common) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/all_objs.o
+ $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
+@@ -70,7 +75,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
+ 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
+ 
+ unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
+-		 $(call ld-option,--no-warn-rwx-segments)
++		 $(link-ldflags-common)
+ unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/unpaged.o
+ $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
+@@ -99,7 +104,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
+ 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
+ 
+ init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
+-	       $(call ld-option,--no-warn-rwx-segments)
++	       $(link-ldflags-common)
+ init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
+ 	      $(libgcccore)
+ cleanfiles += $(link-out-dir)/init.o
+diff --git a/ldelf/link.mk b/ldelf/link.mk
+index 64c8212a..bd49551e 100644
+--- a/ldelf/link.mk
++++ b/ldelf/link.mk
+@@ -20,6 +20,9 @@ link-ldflags += -z max-page-size=4096 # OP-TEE always uses 4K alignment
+ ifeq ($(CFG_CORE_BTI),y)
+ link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
+ endif
++ifeq ($(CFG_ARM32_$(sm)), y)
++link-ldflags += $(call ld-option,--no-warn-execstack)
++endif
+ link-ldflags += $(link-ldflags$(sm))
+ 
+ link-ldadd  = $(addprefix -L,$(libdirs))
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0010-add-note-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0010-add-note-GNU-stack-section.patch
new file mode 100644
index 00000000..4ea65d88
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0010-add-note-GNU-stack-section.patch
@@ -0,0 +1,128 @@
+From ec30e84671aac9a2e9549754eb7bc6201728db4c Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Tue, 23 Aug 2022 12:31:46 +0000
+Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack section to
+
+ .S files
+
+When building for arm32 with GNU binutils 2.39, the linker outputs
+warnings when linking Trusted Applications:
+
+ arm-unknown-linux-uclibcgnueabihf-ld.bfd: warning: utee_syscalls_a32.o: missing .note.GNU-stack section implies executable stack
+ arm-unknown-linux-uclibcgnueabihf-ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+
+We could silence the warning by adding the '-z execstack' option to the
+TA link flags, like we did in the parent commit for the TEE core and
+ldelf. Indeed, ldelf always allocates a non-executable piece of memory
+for the TA to use as a stack.
+
+However it seems preferable to comply with the common ELF practices in
+this case. A better fix is therefore to add the missing .note.GNU-stack
+sections in the assembler files.
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
+
+---
+ lib/libutee/arch/arm/utee_syscalls_a32.S             | 2 ++
+ lib/libutils/ext/arch/arm/atomic_a32.S               | 2 ++
+ lib/libutils/ext/arch/arm/mcount_a32.S               | 2 ++
+ lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S  | 2 ++
+ lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S | 2 ++
+ lib/libutils/isoc/arch/arm/setjmp_a32.S              | 2 ++
+ ta/arch/arm/ta_entry_a32.S                           | 2 ++
+ 7 files changed, 14 insertions(+)
+
+diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch/arm/utee_syscalls_a32.S
+index 6e621ca6..af405f62 100644
+--- a/lib/libutee/arch/arm/utee_syscalls_a32.S
++++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
+@@ -7,6 +7,8 @@
+ #include <tee_syscall_numbers.h>
+ #include <asm.S>
+ 
++	.section .note.GNU-stack,"",%progbits
++
+         .section .text
+         .balign 4
+         .code 32
+diff --git a/lib/libutils/ext/arch/arm/atomic_a32.S b/lib/libutils/ext/arch/arm/atomic_a32.S
+index eaef6914..2be73ffa 100644
+--- a/lib/libutils/ext/arch/arm/atomic_a32.S
++++ b/lib/libutils/ext/arch/arm/atomic_a32.S
+@@ -5,6 +5,8 @@
+ 
+ #include <asm.S>
+ 
++	.section .note.GNU-stack,"",%progbits
++
+ /* uint32_t atomic_inc32(uint32_t *v); */
+ FUNC atomic_inc32 , :
+ 	ldrex	r1, [r0]
+diff --git a/lib/libutils/ext/arch/arm/mcount_a32.S b/lib/libutils/ext/arch/arm/mcount_a32.S
+index 51439a23..54dc3c02 100644
+--- a/lib/libutils/ext/arch/arm/mcount_a32.S
++++ b/lib/libutils/ext/arch/arm/mcount_a32.S
+@@ -7,6 +7,8 @@
+ 
+ #if defined(CFG_TA_GPROF_SUPPORT) || defined(CFG_FTRACE_SUPPORT)
+ 
++	.section .note.GNU-stack,"",%progbits
++
+ /*
+  * Convert return address to call site address by subtracting the size of the
+  * mcount call instruction (blx __gnu_mcount_nc).
+diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
+index a600c879..37ae9ec6 100644
+--- a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
++++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
+@@ -5,6 +5,8 @@
+ 
+ #include <asm.S>
+ 
++	.section .note.GNU-stack,"",%progbits
++
+ /*
+  * signed ret_idivmod_values(signed quot, signed rem);
+  * return quotient and remaining the EABI way (regs r0,r1)
+diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
+index 2dc50bc9..5c3353e2 100644
+--- a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
++++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
+@@ -5,6 +5,8 @@
+ 
+ #include <asm.S>
+ 
++	.section .note.GNU-stack,"",%progbits
++
+ /*
+  * __value_in_regs lldiv_t __aeabi_ldivmod( long long n, long long d)
+  */
+diff --git a/lib/libutils/isoc/arch/arm/setjmp_a32.S b/lib/libutils/isoc/arch/arm/setjmp_a32.S
+index 43ea5937..f8a0b70d 100644
+--- a/lib/libutils/isoc/arch/arm/setjmp_a32.S
++++ b/lib/libutils/isoc/arch/arm/setjmp_a32.S
+@@ -51,6 +51,8 @@
+ #define SIZE(x)
+ #endif
+ 
++	.section .note.GNU-stack,"",%progbits
++
+ /* Arm/Thumb interworking support:
+ 
+    The interworking scheme expects functions to use a BX instruction
+diff --git a/ta/arch/arm/ta_entry_a32.S b/ta/arch/arm/ta_entry_a32.S
+index d2f8a69d..cd9a12f9 100644
+--- a/ta/arch/arm/ta_entry_a32.S
++++ b/ta/arch/arm/ta_entry_a32.S
+@@ -5,6 +5,8 @@
+ 
+ #include <asm.S>
+ 
++	.section .note.GNU-stack,"",%progbits
++
+ /*
+  * This function is the bottom of the user call stack. Mark it as such so that
+  * the unwinding code won't try to go further down.
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
index 59e58ed3..31da5ded 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
@@ -2,6 +2,8 @@ require optee-os.inc
 
 DEPENDS += "dtc-native"
 
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-3.18.0:"
+
 SRCREV = "1ee647035939e073a2e8dddb727c0f019cc035f1"
 SRC_URI:append = " \
     file://0001-core-Define-section-attributes-for-clang.patch \
-- 
2.17.1


