Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A6BC47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 15:12:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.574.1706281958565889738
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 07:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A5161474
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 07:13:22 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 057823F73F
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 07:12:37 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/optee: remove unused v3.22.0 recipes
Date: Fri, 26 Jan 2024 10:12:36 -0500
Message-Id: <20240126151236.59981-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240126151236.59981-1-jon.mason@arm.com>
References: <20240126151236.59981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 15:12:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5362

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client_3.22.0.bb              |   7 -
 .../optee/optee-examples_3.22.0.bb            |   3 -
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  34 ---
 ...-Define-section-attributes-for-clang.patch | 240 ------------------
 .../0003-optee-enable-clang-support.patch     |  29 ---
 ...4-core-link-add-no-warn-rwx-segments.patch |  62 -----
 .../optee/optee-os-tadevkit_3.22.0.bb         |  29 ---
 .../optee/optee-os-tadevkit_3.22.0.bbappend   |   6 -
 .../recipes-security/optee/optee-os_3.22.0.bb |  13 -
 .../optee/optee-os_3.22.0.bbappend            |   9 -
 .../optee/optee-test_3.22.0.bb                |  14 -
 .../optee/optee-test_3.22.0.bbappend          |   6 -
 12 files changed, 452 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_3.22=
.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-examples_3.=
22.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0=
001-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0=
002-core-Define-section-attributes-for-clang.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0=
003-optee-enable-clang-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0=
004-core-link-add-no-warn-rwx-segments.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.22.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.22.0.bbappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.b=
b
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.b=
bappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.22.0=
.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.22.0=
.bbappend

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.22.0.bb b=
/meta-arm-bsp/recipes-security/optee/optee-client_3.22.0.bb
deleted file mode 100644
index 904c25650941..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.22.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-SRCREV =3D "8533e0e6329840ee96cf81b6453f257204227e6c"
-
-inherit pkgconfig
-DEPENDS +=3D "util-linux"
-EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-examples_3.22.0.bb=
 b/meta-arm-bsp/recipes-security/optee/optee-examples_3.22.0.bb
deleted file mode 100644
index f082a25d05c7..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-examples_3.22.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0001-all=
ow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-securit=
y/optee/optee-os-3.22.0/0001-allow-setting-sysroot-for-libgcc-lookup.patc=
h
deleted file mode 100644
index 392e8d82bdb2..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 02ea8e616ac615efe3507d627dfba9820d3357f6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH] allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
-for the compiler libraries as there's no easy way to reliably pass --sys=
root
-otherwise.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- mk/gcc.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24f25e..81bfa78ad8d7 100644
---- a/mk/gcc.mk
-+++ b/mk/gcc.mk
-@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
- 			-print-file-name=3Dinclude 2> /dev/null)
-=20
- # Get location of libgcc from gcc
--libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
- 			-print-libgcc-file-name 2> /dev/null)
--libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibstdc++.a 2> /dev/null)
--libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
-=20
- # Define these to something to discover accidental use
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0002-cor=
e-Define-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-securi=
ty/optee/optee-os-3.22.0/0002-core-Define-section-attributes-for-clang.pa=
tch
deleted file mode 100644
index 15bdf07df26e..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0002-core-Defin=
e-section-attributes-for-clang.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-From 6f588813a170a671ebf1d6b51cebc7bc761295dc Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 21 Dec 2022 10:55:58 +0000
-Subject: [PATCH] core: Define section attributes for clang
-
-Clang's attribute section is not same as gcc, here we need to add flags
-to sections so they can be eventually collected by linker into final
-output segments. Only way to do so with clang is to use
-
-pragma clang section ...
-
-The behavious is described here [1], this allows us to define names bss
-sections. This was not an issue until clang-15 where LLD linker starts
-to detect the section flags before merging them and throws the following
-errors
-
-| ld.lld: error: section type mismatch for .nozi.kdata_page
-| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SH=
T_PROGBITS
-| >>> output section .nozi: SHT_NOBITS
-|
-| ld.lld: error: section type mismatch for .nozi.mmu.l2
-| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT=
_PROGBITS
-| >>> output section .nozi: SHT_NOBITS
-
-These sections should be carrying SHT_NOBITS but so far it was not
-possible to do so, this patch tries to use clangs pragma to get this
-going and match the functionality with gcc.
-
-[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#spec=
ifying-section-names-for-global-objects-pragma-clang-section
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
- core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
- core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
- core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
- core/kernel/thread.c             | 13 +++++++++++-
- 5 files changed, 104 insertions(+), 11 deletions(-)
-
-diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 4487ef026df9..f3624389611b 100644
---- a/core/arch/arm/kernel/thread.c
-+++ b/core/arch/arm/kernel/thread.c
-@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
- #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
- 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
- long thread_user_kdata_sp_offset __nex_bss;
-+#ifdef __clang__
-+#ifndef CFG_VIRTUALIZATION
-+#pragma clang section bss=3D".nozi.kdata_page"
-+#else
-+#pragma clang section bss=3D".nex_nozi.kdata_page"
-+#endif
-+#endif
- static uint8_t thread_user_kdata_page[
- 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
- 		SMALL_PAGE_SIZE)]
- 	__aligned(SMALL_PAGE_SIZE)
-+#ifndef __clang__
- #ifndef CFG_NS_VIRTUALIZATION
--	__section(".nozi.kdata_page");
-+	__section(".nozi.kdata_page")
- #else
--	__section(".nex_nozi.kdata_page");
-+	__section(".nex_nozi.kdata_page")
- #endif
-+#endif
-+    ;
-+#endif
-+
-+/* reset BSS section to default ( .bss ) */
-+#ifdef __clang__
-+#pragma clang section bss=3D""
- #endif
-=20
- #ifdef ARM32
-diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
-index 7e79f780ad28..ec4db9dc98c5 100644
---- a/core/arch/arm/mm/core_mmu_lpae.c
-+++ b/core/arch/arm/mm/core_mmu_lpae.c
-@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
- typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_=
ENTRIES];
- typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.base_table"
-+#endif
- static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
- 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
--	__section(".nozi.mmu.base_table");
-+#ifndef __clang__
-+	__section(".nozi.mmu.base_table")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
--	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
-+	__aligned(XLAT_TABLE_SIZE)
-+#ifndef __clang__
-+	__section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- /* MMU L2 table for TAs, one for each thread */
- static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
--	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
--
-+#ifndef __clang__
-+	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
- /*
-  * TAs page table entry inside a level 1 page table.
-  *
-diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
-index 61e703da89c8..1960c08ca688 100644
---- a/core/arch/arm/mm/core_mmu_v7.c
-+++ b/core/arch/arm/mm/core_mmu_v7.c
-@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
- typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
- typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l1"
-+#endif
- static l1_xlat_tbl_t main_mmu_l1_ttb
--		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
-+		__aligned(L1_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.l1")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- /* L2 MMU tables */
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
--		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
-+		__aligned(L2_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- /* MMU L1 table for TAs, one for each thread */
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.ul1"
-+#endif
- static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
--		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
-+		__aligned(UL1_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.ul1")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- struct mmu_partition {
- 	l1_xlat_tbl_t *l1_table;
-diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index 79553c6d2183..b9efdf42780b 100644
---- a/core/arch/arm/mm/pgt_cache.c
-+++ b/core/arch/arm/mm/pgt_cache.c
-@@ -410,8 +410,18 @@ void pgt_init(void)
- 	 * has a large alignment, while .bss has a small alignment. The curren=
t
- 	 * link script is optimized for small alignment in .bss
- 	 */
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
--			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
-+			__aligned(PGT_SIZE)
-+#ifndef __clang__
-+			__section(".nozi.pgt_cache")
-+#endif
-+			;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
- 	size_t n;
-=20
- 	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
-diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 2a1f22dce635..5516b677141a 100644
---- a/core/kernel/thread.c
-+++ b/core/kernel/thread.c
-@@ -39,13 +39,24 @@ static uint32_t end_canary_value =3D 0xababab00;
- 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
- #endif
-=20
-+#define DO_PRAGMA(x) _Pragma (#x)
-+
-+#ifdef __clang__
-+#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
-+DO_PRAGMA (clang section bss=3D".nozi_stack." #name) \
-+linkage uint32_t name[num_stacks] \
-+		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
-+			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
-+		__attribute__((aligned(STACK_ALIGNMENT))); \
-+DO_PRAGMA(clang section bss=3D"")
-+#else
- #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
- linkage uint32_t name[num_stacks] \
- 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
- 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
- 		__attribute__((section(".nozi_stack." # name), \
- 			       aligned(STACK_ALIGNMENT)))
--
-+#endif
- #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
-=20
- DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0003-opt=
ee-enable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee=
-os-3.22.0/0003-optee-enable-clang-support.patch
deleted file mode 100644
index b4ea8ed35639..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0003-optee-enab=
le-clang-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9c55b7a4e39617c2abbf4e0e39fd8041c7b2b9b6 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee8482..1ebe2f702dcd 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
-=20
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
- # libgcc for clang
--libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
- 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
-=20
- # Core ASLR relies on the executable being ready to run from its prefer=
red load
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0004-cor=
e-link-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/opt=
ee/optee-os-3.22.0/0004-core-link-add-no-warn-rwx-segments.patch
deleted file mode 100644
index d418d4612fa6..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0004-core-link-=
add-no-warn-rwx-segments.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3e191f732b3eba699b91ffd7ffa2ae0787f08947 Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Fri, 5 Aug 2022 09:48:03 +0200
-Subject: [PATCH] core: link: add --no-warn-rwx-segments
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
-
-binutils ld.bfd generates one RWX LOAD segment by merging several sectio=
ns
-with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 =
it
-also warns by default when that happens [1], which breaks the build due =
to
---fatal-warnings. The RWX segment is not a problem for the TEE core, sin=
ce
-that information is not used to set memory permissions. Therefore, silen=
ce
-the warning.
-
-Link: [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
ba951afb99912da01a6e8434126b8fac7aa75107
-Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D29448
-Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- core/arch/arm/kernel/link.mk | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 49e9f4fa18a5..9e1cc172fb8a 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -37,6 +37,7 @@ link-ldflags +=3D --sort-section=3Dalignment
- link-ldflags +=3D --fatal-warnings
- link-ldflags +=3D --gc-sections
- link-ldflags +=3D $(link-ldflags-common)
-+link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
-=20
- link-ldadd  =3D $(LDADD)
- link-ldadd +=3D $(ldflags-external)
-@@ -61,6 +62,7 @@ link-script-cppflags :=3D \
- 		$(cppflagscore))
-=20
- ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
-+		   $(call ld-option,--no-warn-rwx-segments) \
- 		   $(link-ldflags-common) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/all_objs.o
-@@ -75,7 +77,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
-=20
- unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
--		 $(link-ldflags-common)
-+		 $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
- unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -104,7 +106,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/al=
l_objs.o
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
-=20
- init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
--	       $(link-ldflags-common)
-+	       $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
- init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
- 	      $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/init.o
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0=
.bb b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
deleted file mode 100644
index 44496164b690..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require optee-os_3.22.0.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
-
-do_install() {
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-	echo "Do not inherit do_deploy from optee-os."
-}
-
-FILES:${PN} =3D "${includedir}/optee/"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
-
-# Include extra headers needed by SPMC tests to TA DEVKIT.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0.=
bbappend
deleted file mode 100644
index e09c4a5ea7fa..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.22.0.bbappe=
nd
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
-
-require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb
deleted file mode 100644
index e12201920e31..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${P}:"
-
-SRCREV =3D "001ace6655dd6bb9cbe31aa31b4ba69746e1a1d9"
-SRC_URI +=3D " \
-    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0002-core-Define-section-attributes-for-clang.patch \
-    file://0003-optee-enable-clang-support.patch \
-    file://0004-core-link-add-no-warn-rwx-segments.patch \
-   "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
deleted file mode 100644
index ee4ca17f53cb..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-# Include Trusted Services Secure Partitions
-require recipes-security/optee/optee-os-ts.inc
-
-# Machine specific configurations
-MACHINE_OPTEE_OS_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.=
inc"
-MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
-
-require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb
deleted file mode 100644
index eddf04d86cbf..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-SRC_URI +=3D " \
-    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.pat=
ch \
-   "
-SRCREV =3D "a286b57f1721af215ace318d5807e63f40186df6"
-
-# Include ffa_spmc test group if the SPMC test is enabled.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
-
-RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                                              ' arm-ffa-user', '' , d)}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bbappend
deleted file mode 100644
index 05e2abca63f1..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
-MACHINE_OPTEE_TEST_REQUIRE:n1sdp =3D "optee-os-generic-n1sdp.inc"
-
-require ${MACHINE_OPTEE_TEST_REQUIRE}
--=20
2.39.3 (Apple Git-145)


