Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E68FC4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 14:39:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20309.1671633592375027912
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 06:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 161522F4;
	Wed, 21 Dec 2022 06:40:33 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DDC13F71E;
	Wed, 21 Dec 2022 06:39:51 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 4/5] arm-bsp/optee-os: N1SDP support for optee-os 3.19
Date: Wed, 21 Dec 2022 14:39:41 +0000
Message-Id: <20221221143942.15196-5-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221143942.15196-1-emekcan.aras@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 14:39:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4219

From: Emekcan Aras <emekcan.aras@arm.com>

From: Emekcan <emekcan.aras@arm.com>

Adds build configuration to support optee-os 3.19 for N1SDP.
Also, it patches optee-os to support external DT for N1SDP.

Signed-off-by: Emekcan <emekcan.aras@arm.com>
---
 ...d-external-device-tree-base-and-size.patch |  44 ++++++
 .../recipes-security/optee/optee-os-n1sdp.inc |   7 +
 ...-Define-section-attributes-for-clang.patch | 135 ++++++++++--------
 .../recipes-security/optee/optee-os_3.19.0.bb |   4 +
 4 files changed, 129 insertions(+), 61 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0006-plat-n1sdp-add-external-device-tree-base-and-size.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0006-plat-n1sdp-add-external-device-tree-base-and-size.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0006-plat-n1sdp-add-external-device-tree-base-and-size.patch
new file mode 100644
index 00000000..74c94e0a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0006-plat-n1sdp-add-external-device-tree-base-and-size.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+From 1a9aeedda58228893add545e49d2d6cd4c316b4f Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Tue, 13 Dec 2022 13:45:06 +0000
+Subject: [PATCH] plat-n1sdp: add external device tree base and size
+
+Adds external device tree address and size. It also
+register this physical memory so optee can read the device tree.
+---
+ core/arch/arm/plat-n1sdp/main.c            | 1 +
+ core/arch/arm/plat-n1sdp/platform_config.h | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/main.c
+index bb951ce6b..ab76f60c6 100644
+--- a/core/arch/arm/plat-n1sdp/main.c
++++ b/core/arch/arm/plat-n1sdp/main.c
+@@ -31,6 +31,7 @@ static struct gic_data gic_data __nex_bss;
+ static struct pl011_data console_data __nex_bss;
+ 
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZE);
++register_phys_mem_pgdir(MEM_AREA_EXT_DT, EXT_DT_BASE, EXT_DT_SIZE);
+ 
+ register_ddr(DRAM0_BASE, DRAM0_SIZE);
+ register_ddr(DRAM1_BASE, DRAM1_SIZE);
+diff --git a/core/arch/arm/plat-n1sdp/platform_config.h b/core/arch/arm/plat-n1sdp/platform_config.h
+index bf0a3c834..8741a2503 100644
+--- a/core/arch/arm/plat-n1sdp/platform_config.h
++++ b/core/arch/arm/plat-n1sdp/platform_config.h
+@@ -42,6 +42,9 @@
+ #define GICC_BASE		0x2C000000
+ #define GICR_BASE		0x300C0000
+ 
++#define EXT_DT_BASE		0x04001600
++#define EXT_DT_SIZE		0x200
++
+ #ifndef UART_BAUDRATE
+ #define UART_BAUDRATE		115200
+ #endif
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
index 2719e4c0..a40c93dc 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -11,6 +11,7 @@ SRC_URI:append = " \
     file://0003-HACK-disable-instruction-cache-and-data-cache.patch \
     file://0004-Handle-logging-syscall.patch \
     file://0005-plat-n1sdp-register-DRAM1-to-optee-os.patch \
+    file://0006-plat-n1sdp-add-external-device-tree-base-and-size.patch \
     "
 
 EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
@@ -20,3 +21,9 @@ EXTRA_OEMAKE += " CFG_TEE_BENCHMARK=n"
 EXTRA_OEMAKE += " CFG_CORE_SEL1_SPMC=y CFG_CORE_FFA=y"
 
 EXTRA_OEMAKE += " CFG_WITH_SP=y"
+
+EXTRA_OEMAKE += " CFG_DT=y"
+
+EXTRA_OEMAKE += " CFG_SECURE_PARTITION=y"
+
+EXTRA_OEMAKE += " CFG_MAP_EXT_DT_SECURE=y"
diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-Define-section-attributes-for-clang.patch
index a69d7776..a1dc251a 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-Define-section-attributes-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-Define-section-attributes-for-clang.patch
@@ -1,7 +1,7 @@
-From f189457b79989543f65b8a4e8729eff2cdf9a758 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Aug 2022 19:24:55 -0700
-Subject: [PATCH] core: Define section attributes for clang
+From ff1b556ac2cd6bbb857a1ac03e0557eb490bc845 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 21 Dec 2022 10:55:58 +0000
+Subject: [PATCH] [PATCH] core: Define section attributes for clang
 
 Clang's attribute section is not same as gcc, here we need to add flags
 to sections so they can be eventually collected by linker into final
@@ -32,14 +32,17 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
- core/arch/arm/mm/core_mmu_lpae.c | 35 ++++++++++++++++++++++++++++----
+ core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
+ core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
  core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
  core/kernel/thread.c             | 13 +++++++++++-
- 4 files changed, 71 insertions(+), 8 deletions(-)
+ 5 files changed, 104 insertions(+), 11 deletions(-)
 
+diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
+index 05dbbe56..8e6ea034 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
-@@ -44,16 +44,31 @@ static size_t thread_user_kcode_size __n
+@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
  #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
  	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
  long thread_user_kdata_sp_offset __nex_bss;
@@ -62,17 +65,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -	__section(".nex_nozi.kdata_page");
 +	__section(".nex_nozi.kdata_page")
  #endif
- #endif
++#endif
 +    ;
 +#endif
 +
 +/* reset BSS section to default ( .bss ) */
 +#ifdef __clang__
 +#pragma clang section bss=""
-+#endif
+ #endif
  
  #ifdef ARM32
- uint32_t __nostackcheck thread_get_exceptions(void)
+diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mmu_lpae.c
+index 3f08eec6..e6dc9261 100644
 --- a/core/arch/arm/mm/core_mmu_lpae.c
 +++ b/core/arch/arm/mm/core_mmu_lpae.c
 @@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
@@ -126,59 +130,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /*
   * TAs page table entry inside a level 1 page table.
   *
---- a/core/arch/arm/mm/pgt_cache.c
-+++ b/core/arch/arm/mm/pgt_cache.c
-@@ -104,8 +104,18 @@ void pgt_init(void)
- 	 * has a large alignment, while .bss has a small alignment. The current
- 	 * link script is optimized for small alignment in .bss
- 	 */
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l2"
-+#endif
- 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
--			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
-+			__aligned(PGT_SIZE)
-+#ifndef __clang__
-+			__section(".nozi.pgt_cache")
-+#endif
-+			;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- 	size_t n;
- 
- 	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
---- a/core/kernel/thread.c
-+++ b/core/kernel/thread.c
-@@ -37,13 +37,24 @@ struct thread_core_local thread_core_loc
- 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
- #endif
- 
-+#define DO_PRAGMA(x) _Pragma (#x)
-+
-+#ifdef __clang__
-+#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
-+DO_PRAGMA (clang section bss=".nozi_stack." #name) \
-+linkage uint32_t name[num_stacks] \
-+		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
-+			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
-+		__attribute__((aligned(STACK_ALIGNMENT))); \
-+DO_PRAGMA(clang section bss="")
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
- 
- DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
+diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_v7.c
+index cd85bd22..3e18f54f 100644
 --- a/core/arch/arm/mm/core_mmu_v7.c
 +++ b/core/arch/arm/mm/core_mmu_v7.c
-@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_EN
+@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
  typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
  typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
  
@@ -228,3 +184,60 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  struct mmu_partition {
  	l1_xlat_tbl_t *l1_table;
+diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
+index a7b1b10e..489859ce 100644
+--- a/core/arch/arm/mm/pgt_cache.c
++++ b/core/arch/arm/mm/pgt_cache.c
+@@ -410,8 +410,18 @@ void pgt_init(void)
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
+diff --git a/core/kernel/thread.c b/core/kernel/thread.c
+index d1f2f382..8de124ae 100644
+--- a/core/kernel/thread.c
++++ b/core/kernel/thread.c
+@@ -38,13 +38,24 @@ struct thread_core_local thread_core_local[CFG_TEE_CORE_NB_CORE] __nex_bss;
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
+ DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
index 9ad8a148..656a0974 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
@@ -3,3 +3,7 @@ require optee-os-3_19.inc
 DEPENDS += "dtc-native"
 
 SRCREV = "afacf356f9593a7f83cae9f96026824ec242ff52"
+
+SRC_URI:append = " \
+    file://0001-core-Define-section-attributes-for-clang.patch \ 
+    "
-- 
2.17.1


