Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9109C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:32:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21130.1704817931293804993
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 08:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8006014BF
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:32:56 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 612713F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:32:10 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/optee-os: remove unneeded clang patches
Date: Mon,  8 Jan 2024 15:18:46 -0600
Message-Id: <20240108211846.29349-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240108211846.29349-1-jon.mason@arm.com>
References: <20240108211846.29349-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 16:32:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5325

These patches don't appear to be needed anymore.  Removing them.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-Define-section-attributes-for-clang.patch | 241 ------------------
 .../0003-optee-enable-clang-support.patch     |   2 +-
 ...4-core-link-add-no-warn-rwx-segments.patch |  63 -----
 .../recipes-security/optee/optee-os_4.0.0.bb  |   2 -
 4 files changed, 1 insertion(+), 307 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-core-De=
fine-section-attributes-for-clang.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0004-core-li=
nk-add-no-warn-rwx-segments.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0002-core-Define-se=
ction-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-=
os/0002-core-Define-section-attributes-for-clang.patch
deleted file mode 100644
index 64fa9e45..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0002-core-Define-section-a=
ttributes-for-clang.patch
+++ /dev/null
@@ -1,241 +0,0 @@
-From fc930e468045dda9eab4ebe6927cc322bb294f3b Mon Sep 17 00:00:00 2001
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
-
----
- core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
- core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
- core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
- core/kernel/thread.c             | 13 +++++++++++-
- core/mm/pgt_cache.c              | 12 ++++++++++-
- 5 files changed, 104 insertions(+), 11 deletions(-)
-
-diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 66833b3a0..b3eb9cf9a 100644
---- a/core/arch/arm/kernel/thread.c
-+++ b/core/arch/arm/kernel/thread.c
-@@ -45,15 +45,30 @@ static size_t thread_user_kcode_size __nex_bss;
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
-index 7e79f780a..ec4db9dc9 100644
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
-index 61e703da8..1960c08ca 100644
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
-diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 2a1f22dce..5516b6771 100644
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
-diff --git a/core/mm/pgt_cache.c b/core/mm/pgt_cache.c
-index 79553c6d2..b9efdf427 100644
---- a/core/mm/pgt_cache.c
-+++ b/core/mm/pgt_cache.c
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
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-c=
lang-support.patch b/meta-arm/recipes-security/optee/optee-os/0003-optee-=
enable-clang-support.patch
index 299a24ea..3c13ce3f 100644
--- a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-su=
pport.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-su=
pport.patch
@@ -1,4 +1,4 @@
-From b33de2f059f1394028a94ee9da081fa6644b50a2 Mon Sep 17 00:00:00 2001
+From 59d4c190eae11c93b26cca5a7b005a17dadc8248 Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
diff --git a/meta-arm/recipes-security/optee/optee-os/0004-core-link-add-=
no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os/000=
4-core-link-add-no-warn-rwx-segments.patch
deleted file mode 100644
index 54b19efa..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0004-core-link-add-no-warn=
-rwx-segments.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 024314135e8dfe40f26f63da55d0a1426f0a8691 Mon Sep 17 00:00:00 2001
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
-
----
- core/arch/arm/kernel/link.mk | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 49e9f4fa1..9e1cc172f 100644
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
diff --git a/meta-arm/recipes-security/optee/optee-os_4.0.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.0.0.bb
index a5a594fb..cb326042 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.0.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.0.0.bb
@@ -6,7 +6,5 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
 SRC_URI +=3D " \
-    file://0002-core-Define-section-attributes-for-clang.patch \
     file://0003-optee-enable-clang-support.patch \
-    file://0004-core-link-add-no-warn-rwx-segments.patch \
    "
--=20
2.30.2


