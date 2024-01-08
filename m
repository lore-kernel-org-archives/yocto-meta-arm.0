Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4FFC47077
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:32:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21129.1704817931098198424
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 08:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB6A6DA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:32:55 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6D133F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:32:09 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/optee-os: remove unused 3.18 files
Date: Mon,  8 Jan 2024 15:18:44 -0600
Message-Id: <20240108211846.29349-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 16:32:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5323

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  34 ---
 .../0002-optee-enable-clang-support.patch     |  29 ---
 ...3-core-link-add-no-warn-rwx-segments.patch |  64 -----
 ...-Define-section-attributes-for-clang.patch | 240 ------------------
 .../optee/optee-os-ts-3.18.inc                |  54 ----
 5 files changed, 421 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0=
001-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0=
002-optee-enable-clang-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0=
003-core-link-add-no-warn-rwx-segments.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0=
004-core-Define-section-attributes-for-clang.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-ts-3.18.=
inc

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0001-all=
ow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-securit=
y/optee/optee-os-3.18.0/0001-allow-setting-sysroot-for-libgcc-lookup.patc=
h
deleted file mode 100644
index 2aec7fc3..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fed478758e495f35d18a9e2a89193e6577b06799 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0002-opt=
ee-enable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee=
-os-3.18.0/0002-optee-enable-clang-support.patch
deleted file mode 100644
index 7441e744..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0002-optee-enab=
le-clang-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f158e3af6633bd689a76d53be2c9c590c0385350 Mon Sep 17 00:00:00 2001
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
-index c141a3f2ed0b..7d067cc007fa 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -27,7 +27,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
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
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0003-cor=
e-link-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/opt=
ee/optee-os-3.18.0/0003-core-link-add-no-warn-rwx-segments.patch
deleted file mode 100644
index 62aee356..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0003-core-link-=
add-no-warn-rwx-segments.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From fb69397234b1efe3528714b6c0c1921ce37ad6a6 Mon Sep 17 00:00:00 2001
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
- core/arch/arm/kernel/link.mk | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 7eed333a32de..c39d43cbfc5b 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -31,6 +31,7 @@ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-o=
ut-dir)/tee.map
- link-ldflags +=3D --sort-section=3Dalignment
- link-ldflags +=3D --fatal-warnings
- link-ldflags +=3D --gc-sections
-+link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
-=20
- link-ldadd  =3D $(LDADD)
- link-ldadd +=3D $(ldflags-external)
-@@ -55,6 +56,7 @@ link-script-cppflags :=3D \
- 		$(cppflagscore))
-=20
- ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
-+		   $(call ld-option,--no-warn-rwx-segments) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/all_objs.o
- $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
-@@ -67,7 +69,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
- 	$(q)$(NMcore) $< | \
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
-=20
--unpaged-ldargs =3D -T $(link-script-dummy) --no-check-sections --gc-sec=
tions
-+unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
-+		 $(call ld-option,--no-warn-rwx-segments)
- unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -95,7 +98,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_=
objs.o
- 	$(q)$(NMcore) $< | \
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
-=20
--init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons
-+init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
-+	       $(call ld-option,--no-warn-rwx-segments)
- init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
- 	      $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/init.o
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0004-cor=
e-Define-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-securi=
ty/optee/optee-os-3.18.0/0004-core-Define-section-attributes-for-clang.pa=
tch
deleted file mode 100644
index e3c509f6..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0004-core-Defin=
e-section-attributes-for-clang.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-From 0690909f07779a8f35b1f3d0baf8d4c5c9305d14 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Aug 2022 19:24:55 -0700
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
-index f083b159e969..432983c86c9f 100644
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
- #ifndef CFG_VIRTUALIZATION
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
-index 3f08eec623f3..e6dc9261c41e 100644
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
-index cd85bd22d385..3e18f54f6cf8 100644
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
-index dee1d207943f..382cae1c3f30 100644
---- a/core/arch/arm/mm/pgt_cache.c
-+++ b/core/arch/arm/mm/pgt_cache.c
-@@ -104,8 +104,18 @@ void pgt_init(void)
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
-index 18d34e6adfe2..086129e282bc 100644
---- a/core/kernel/thread.c
-+++ b/core/kernel/thread.c
-@@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_C=
ORE_NB_CORE] __nex_bss;
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
- DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-ts-3.18.inc b/m=
eta-arm-bsp/recipes-security/optee/optee-os-ts-3.18.inc
deleted file mode 100644
index 4dffc46d..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-ts-3.18.inc
+++ /dev/null
@@ -1,54 +0,0 @@
-# Include Trusted Services SPs accordingly to defined machine features
-
-# Please notice that OPTEE will load SPs in the order listed in this fil=
e.
-# If an SP requires another SP to be already loaded it must be listed lo=
wer.
-
-# TS SPs UUIDs definitions
-require recipes-security/trusted-services/ts-uuid.inc
-
-TS_ENV =3D "opteesp"
-TS_BIN =3D "${RECIPE_SYSROOT}/usr/${TS_ENV}/bin"
-
-# ITS SP
-DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', =
\
-                                        ' ts-sp-its', '' , d)}"
-SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', =
\
-                                        ' ${TS_BIN}/${ITS_UUID}.stripped=
.elf', '', d)}"
-
-# Storage SP
-DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storag=
e', \
-                                        ' ts-sp-storage', '' , d)}"
-SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storag=
e', \
-                                        ' ${TS_BIN}/${STORAGE_UUID}.stri=
pped.elf', '', d)}"
-
-# Crypto SP.
-DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto=
', \
-                                        ' ts-sp-crypto', '' , d)}"
-SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto=
', \
-                                        ' ${TS_BIN}/${CRYPTO_UUID}.strip=
ped.elf', '', d)}"
-
-# Attestation SP
-DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attest=
ation', \
-                                        ' ts-sp-attestation', '' , d)}"
-SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attest=
ation', \
-                                        ' ${TS_BIN}/${ATTESTATION_UUID}.=
stripped.elf', '', d)}"
-
-# Env-test SP
-DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-te=
st', \
-                                        ' ts-sp-env-test', '' , d)}"
-SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-te=
st', \
-                                        ' ${TS_BIN}/${ENV_TEST_UUID}.str=
ipped.elf', '', d)}"
-
-# SE-Proxy SP
-DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-pro=
xy', \
-                                        ' ts-sp-se-proxy', '' , d)}"
-SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-pro=
xy', \
-                                        ' ${TS_BIN}/${SE_PROXY_UUID}.str=
ipped.elf', '', d)}"
-
-# SMM Gateway
-DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-ga=
teway', \
-                                        ' ts-sp-smm-gateway', '' , d)}"
-SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-ga=
teway', \
-                                        ' ${TS_BIN}/${SMM_GATEWAY_UUID}.=
stripped.elf', '', d)}"
-
-EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', ' C=
FG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=3Dy SP_PATHS=3D"${SP_PATHS}=
" ', d)}"
--=20
2.30.2


