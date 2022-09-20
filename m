Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E21C6FA8E
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 12:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5911.1663765131028995822
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 05:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 197BC143D
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F6463F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/optee-os: add ARMv7 changes to clang patch and update
 patches
Date: Tue, 20 Sep 2022 18:38:43 -0400
Message-Id: <20220920223846.8000-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 12:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3796

ARMv7 does not have fixes for the clang issues already fixed for ARMv8.
Make the necessary changes in that patch for it to work.  Also, update
the patches (via devtool).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-Define-section-attributes-for-clang.patch | 64 ++++++++++++++++---
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  3 +-
 ...0007-allow-setting-sysroot-for-clang.patch |  5 +-
 .../optee-os/0008-no-warn-rwx-segments.patch  | 11 ++--
 .../optee-os/3.18/0009-add-z-execstack.patch  |  6 +-
 .../0010-add-note-GNU-stack-section.patch     |  2 +-
 6 files changed, 71 insertions(+), 20 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
index db88e7f0..d30fa5ae 100644
--- a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
@@ -1,4 +1,4 @@
-From f189457b79989543f65b8a4e8729eff2cdf9a758 Mon Sep 17 00:00:00 2001
+From 4ff172196d399217992110a47312c626954a844c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Aug 2022 19:24:55 -0700
 Subject: [PATCH] core: Define section attributes for clang
@@ -30,15 +30,17 @@ going and match the functionality with gcc.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
  core/arch/arm/mm/core_mmu_lpae.c | 35 ++++++++++++++++++++++++++++----
+ core/arch/arm/mm/core_mmu_v7.c   | 27 +++++++++++++++++++++---
  core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
  core/kernel/thread.c             | 13 +++++++++++-
- 4 files changed, 71 insertions(+), 8 deletions(-)
+ 5 files changed, 95 insertions(+), 11 deletions(-)
 
 diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
-index f083b159e..432983c86 100644
+index f083b159..432983c8 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
 @@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
@@ -75,10 +77,10 @@ index f083b159e..432983c86 100644
  
  #ifdef ARM32
 diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mmu_lpae.c
-index 19cd7b61b..78f5910c5 100644
+index 3f08eec6..e6dc9261 100644
 --- a/core/arch/arm/mm/core_mmu_lpae.c
 +++ b/core/arch/arm/mm/core_mmu_lpae.c
-@@ -230,19 +230,46 @@ typedef uint16_t l1_idx_t;
+@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
  typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
  typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
  
@@ -129,8 +131,53 @@ index 19cd7b61b..78f5910c5 100644
  /*
   * TAs page table entry inside a level 1 page table.
   *
+diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_v7.c
+index cd85bd22..ee78e6ee 100644
+--- a/core/arch/arm/mm/core_mmu_v7.c
++++ b/core/arch/arm/mm/core_mmu_v7.c
+@@ -204,16 +204,37 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
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
++	__section(".nozi.mmu.l1")
++#endif
++;
+ 
+ /* L2 MMU tables */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
+-		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
++		__aligned(L2_ALIGNMENT)
++#ifndef __clang__
++	__section(".nozi.mmu.l2")
++#endif
++;
+ 
+ /* MMU L1 table for TAs, one for each thread */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.ul1"
++#endif
+ static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
+-		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
++		__aligned(UL1_ALIGNMENT)
++#ifndef __clang__
++	__section(".nozi.mmu.ul1")
++#endif
++;
+ 
+ struct mmu_partition {
+ 	l1_xlat_tbl_t *l1_table;
 diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index d658b3e68..6c36706c0 100644
+index dee1d207..382cae1c 100644
 --- a/core/arch/arm/mm/pgt_cache.c
 +++ b/core/arch/arm/mm/pgt_cache.c
 @@ -104,8 +104,18 @@ void pgt_init(void)
@@ -154,7 +201,7 @@ index d658b3e68..6c36706c0 100644
  
  	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
 diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 18d34e6ad..086129e28 100644
+index 18d34e6a..086129e2 100644
 --- a/core/kernel/thread.c
 +++ b/core/kernel/thread.c
 @@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_CORE_NB_CORE] __nex_bss;
@@ -183,6 +230,3 @@ index 18d34e6ad..086129e28 100644
  #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
  
  DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
--- 
-2.37.2
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
index 17005396..ab4a6dbc 100644
--- a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -1,4 +1,4 @@
-From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
+From 528aeb42652a3159c1bfd51d6c1442c3ff27b84c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 26 May 2020 14:38:02 -0500
 Subject: [PATCH] allow setting sysroot for libgcc lookup
@@ -9,6 +9,7 @@ otherwise.
 
 Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 ---
  mk/gcc.mk | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
index 5c0d0a56..067ba6eb 100644
--- a/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
@@ -1,4 +1,4 @@
-From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 2001
+From db9e44af75c7cfd3316cab15aaa387383df3e57e Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
@@ -10,12 +10,13 @@ compiler-rt. This is mitigated by including the variable as ammended.
 Upstream-Status: Pending
 ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
 Signed-off-by: Brett Warren <brett.warren@arm.com>
+
 ---
  mk/clang.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mk/clang.mk b/mk/clang.mk
-index 0f48c836..47465523 100644
+index c141a3f2..7d067cc0 100644
 --- a/mk/clang.mk
 +++ b/mk/clang.mk
 @@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
diff --git a/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-segments.patch
index 1dd70b31..6d48a760 100644
--- a/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-segments.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0008-no-warn-rwx-segments.patch
@@ -1,11 +1,11 @@
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
-
-From 0b8a917fa51a366806edc0f04b88cd23b24098c4 Mon Sep 17 00:00:00 2001
+From cf2a2451f4e9300532d677bb3a8315494a3b3a82 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Fri, 5 Aug 2022 09:48:03 +0200
 Subject: [PATCH] core: link: add --no-warn-rwx-segments
 
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
 binutils ld.bfd generates one RWX LOAD segment by merging several sections
 with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 it
 also warns by default when that happens [1], which breaks the build due to
@@ -18,12 +18,13 @@ Link: https://sourceware.org/bugzilla/show_bug.cgi?id=29448
 Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
 Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
 Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
 ---
  core/arch/arm/kernel/link.mk | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 7eed333a32..c39d43cbfc 100644
+index 7eed333a..c39d43cb 100644
 --- a/core/arch/arm/kernel/link.mk
 +++ b/core/arch/arm/kernel/link.mk
 @@ -31,6 +31,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
diff --git a/meta-arm/recipes-security/optee/optee-os/3.18/0009-add-z-execstack.patch b/meta-arm/recipes-security/optee/optee-os/3.18/0009-add-z-execstack.patch
index 5463a345..3ba6c4ef 100644
--- a/meta-arm/recipes-security/optee/optee-os/3.18/0009-add-z-execstack.patch
+++ b/meta-arm/recipes-security/optee/optee-os/3.18/0009-add-z-execstack.patch
@@ -1,4 +1,4 @@
-From a9d099d17ef0af6deac4c3b4d15ad0555d258ec8 Mon Sep 17 00:00:00 2001
+From ea932656461865ab9ac4036245c756c082aeb3e1 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Tue, 23 Aug 2022 11:41:00 +0000
 Subject: [PATCH] core, ldelf: link: add -z execstack
@@ -22,6 +22,10 @@ Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
 Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
 
 ---
+ core/arch/arm/kernel/link.mk | 13 +++++++++----
+ ldelf/link.mk                |  3 +++
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
 index c39d43cb..0e96e606 100644
 --- a/core/arch/arm/kernel/link.mk
diff --git a/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch
index 95d5e676..4ea65d88 100644
--- a/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch
+++ b/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch
@@ -1,4 +1,4 @@
-From 38bf606653ee08b10db6bb298e369cb3a9cdcda9 Mon Sep 17 00:00:00 2001
+From ec30e84671aac9a2e9549754eb7bc6201728db4c Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Tue, 23 Aug 2022 12:31:46 +0000
 Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack section to
-- 
2.17.1


