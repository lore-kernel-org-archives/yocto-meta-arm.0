Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C83C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 16:23:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23742.1678465400527235672
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Mar 2023 08:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53C4E1684
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 08:24:03 -0800 (PST)
Received: from jdm-VirtualBox.lan044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A633A3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 08:23:19 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/optee-os: update to 3.20.0
Date: Thu,  9 Mar 2023 16:15:21 -0500
Message-Id: <20230309211521.496531-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309211521.496531-1-jon.mason@arm.com>
References: <20230309211521.496531-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 16:23:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4485

Update to the latest version and regenerate the patches via devtool.
This causes some patch renumeration to occur, which causes some other
modifications.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-os-corstone1000-common.inc    |   2 +-
 ...w-setting-sysroot-for-libgcc-lookup.patch} |   0
 ... =3D> 0002-optee-enable-clang-support.patch} |   0
 ...-core-link-add-no-warn-rwx-segments.patch} |   0
 ...Define-section-attributes-for-clang.patch} | 126 +++++++++--------
 ...005-core-ldelf-link-add-z-execstack.patch} |   0
 ...butee-ta-add-.note.GNU-stack-sectio.patch} |   0
 .../0009-add-z-execstack.patch                |  94 -------------
 .../0010-add-note-GNU-stack-section.patch     | 128 ------------------
 ...w-setting-sysroot-for-libgcc-lookup.patch} |   0
 .../0002-optee-enable-clang-support.patch}    |   6 +-
 ...-core-link-add-no-warn-rwx-segments.patch} |   8 +-
 ...Define-section-attributes-for-clang.patch} |  12 +-
 meta-arm/recipes-security/optee/optee-os.inc  |   6 +-
 .../recipes-security/optee/optee-os_3.18.0.bb |   6 +-
 .../recipes-security/optee/optee-os_3.19.0.bb |  10 --
 .../recipes-security/optee/optee-os_3.20.0.bb |  10 ++
 17 files changed, 99 insertions(+), 309 deletions(-)
 rename meta-arm/recipes-security/optee/optee-os-3.18.0/{0006-allow-setti=
ng-sysroot-for-libgcc-lookup.patch =3D> 0001-allow-setting-sysroot-for-li=
bgcc-lookup.patch} (100%)
 rename meta-arm/recipes-security/optee/optee-os-3.18.0/{0007-allow-setti=
ng-sysroot-for-clang.patch =3D> 0002-optee-enable-clang-support.patch} (1=
00%)
 rename meta-arm/recipes-security/optee/optee-os-3.18.0/{0008-no-warn-rwx=
-segments.patch =3D> 0003-core-link-add-no-warn-rwx-segments.patch} (100%=
)
 rename meta-arm/recipes-security/optee/optee-os-3.18.0/{0001-core-Define=
-section-attributes-for-clang.patch =3D> 0004-core-Define-section-attribu=
tes-for-clang.patch} (87%)
 rename meta-arm/recipes-security/optee/optee-os-3.18.0/{0009-add-z-execs=
tack.patch =3D> 0005-core-ldelf-link-add-z-execstack.patch} (100%)
 rename meta-arm/recipes-security/optee/optee-os-3.18.0/{0010-add-note-GN=
U-stack-section.patch =3D> 0006-arm32-libutils-libutee-ta-add-.note.GNU-s=
tack-sectio.patch} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0009-=
add-z-execstack.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0010-=
add-note-GNU-stack-section.patch
 rename meta-arm/recipes-security/optee/{optee-os-3.19.0/0006-allow-setti=
ng-sysroot-for-libgcc-lookup.patch =3D> optee-os-3.20.0/0001-allow-settin=
g-sysroot-for-libgcc-lookup.patch} (100%)
 rename meta-arm/recipes-security/optee/{optee-os-3.19.0/0007-allow-setti=
ng-sysroot-for-clang.patch =3D> optee-os-3.20.0/0002-optee-enable-clang-s=
upport.patch} (86%)
 rename meta-arm/recipes-security/optee/{optee-os-3.19.0/0008-no-warn-rwx=
-segments.patch =3D> optee-os-3.20.0/0003-core-link-add-no-warn-rwx-segme=
nts.patch} (93%)
 rename meta-arm/recipes-security/optee/{optee-os-3.19.0/0001-core-Define=
-section-attributes-for-clang.patch =3D> optee-os-3.20.0/0004-core-Define=
-section-attributes-for-clang.patch} (97%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.19.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.20.0.bb

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index c54e0041..71b5ee62 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -2,7 +2,7 @@ SRCREV =3D "42f6617108fa43712652ef52f9d5b4ec5b2665f8"
 PV =3D "3.18.0+git${SRCPV}"
=20
 SRC_URI:remove =3D " \
-                  file://0008-no-warn-rwx-segments.patch \
+                  file://0003-core-link-add-no-warn-rwx-segments.patch \
                  "
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000:"
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0006-allow-s=
etting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/=
optee-os-3.18.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0006-allow-se=
tting-sysroot-for-libgcc-lookup.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0007-allow-s=
etting-sysroot-for-clang.patch b/meta-arm/recipes-security/optee/optee-os=
-3.18.0/0002-optee-enable-clang-support.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0007-allow-se=
tting-sysroot-for-clang.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0002-optee-enab=
le-clang-support.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0008-no-warn=
-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/000=
3-core-link-add-no-warn-rwx-segments.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0008-no-warn-=
rwx-segments.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0003-core-link-=
add-no-warn-rwx-segments.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-De=
fine-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee=
/optee-os-3.18.0/0004-core-Define-section-attributes-for-clang.patch
similarity index 87%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Def=
ine-section-attributes-for-clang.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0004-core-Defin=
e-section-attributes-for-clang.patch
index a69d7776..0ab670f5 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.18.0/0001-core-Define-se=
ction-attributes-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.18.0/0004-core-Define-se=
ction-attributes-for-clang.patch
@@ -1,4 +1,4 @@
-From f189457b79989543f65b8a4e8729eff2cdf9a758 Mon Sep 17 00:00:00 2001
+From 7218af04ce3af466e95d69e4995138cd2d26dd3f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Aug 2022 19:24:55 -0700
 Subject: [PATCH] core: Define section attributes for clang
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
=20
+diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
+index f083b159..432983c8 100644
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
 +#pragma clang section bss=3D""
-+#endif
+ #endif
 =20
  #ifdef ARM32
- uint32_t __nostackcheck thread_get_exceptions(void)
+diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
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
---- a/core/kernel/thread.c
-+++ b/core/kernel/thread.c
-@@ -37,13 +37,24 @@ struct thread_core_local thread_core_loc
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
+diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
+index cd85bd22..3e18f54f 100644
 --- a/core/arch/arm/mm/core_mmu_v7.c
 +++ b/core/arch/arm/mm/core_mmu_v7.c
-@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_EN
+@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
  typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
  typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
 =20
@@ -228,3 +184,57 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 =20
  struct mmu_partition {
  	l1_xlat_tbl_t *l1_table;
+diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
+index dee1d207..382cae1c 100644
+--- a/core/arch/arm/mm/pgt_cache.c
++++ b/core/arch/arm/mm/pgt_cache.c
+@@ -104,8 +104,18 @@ void pgt_init(void)
+ 	 * has a large alignment, while .bss has a small alignment. The curren=
t
+ 	 * link script is optimized for small alignment in .bss
+ 	 */
++#ifdef __clang__
++#pragma clang section bss=3D".nozi.mmu.l2"
++#endif
+ 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
+-			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
++			__aligned(PGT_SIZE)
++#ifndef __clang__
++			__section(".nozi.pgt_cache")
++#endif
++			;
++#ifdef __clang__
++#pragma clang section bss=3D""
++#endif
+ 	size_t n;
+=20
+ 	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
+diff --git a/core/kernel/thread.c b/core/kernel/thread.c
+index 18d34e6a..086129e2 100644
+--- a/core/kernel/thread.c
++++ b/core/kernel/thread.c
+@@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_C=
ORE_NB_CORE] __nex_bss;
+ 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
+ #endif
+=20
++#define DO_PRAGMA(x) _Pragma (#x)
++
++#ifdef __clang__
++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
++DO_PRAGMA (clang section bss=3D".nozi_stack." #name) \
++linkage uint32_t name[num_stacks] \
++		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
++			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
++		__attribute__((aligned(STACK_ALIGNMENT))); \
++DO_PRAGMA(clang section bss=3D"")
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
+=20
+ DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-e=
xecstack.patch b/meta-arm/recipes-security/optee/optee-os-3.18.0/0005-cor=
e-ldelf-link-add-z-execstack.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0009-add-z-ex=
ecstack.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0005-core-ldelf=
-link-add-z-execstack.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-not=
e-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os-3.18=
.0/0006-arm32-libutils-libutee-ta-add-.note.GNU-stack-sectio.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.18.0/0010-add-note=
-GNU-stack-section.patch
rename to meta-arm/recipes-security/optee/optee-os-3.18.0/0006-arm32-libu=
tils-libutee-ta-add-.note.GNU-stack-sectio.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0009-add-z-e=
xecstack.patch b/meta-arm/recipes-security/optee/optee-os-3.19.0/0009-add=
-z-execstack.patch
deleted file mode 100644
index 3ba6c4ef..00000000
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0009-add-z-execstac=
k.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From ea932656461865ab9ac4036245c756c082aeb3e1 Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 23 Aug 2022 11:41:00 +0000
-Subject: [PATCH] core, ldelf: link: add -z execstack
-
-When building for arm32 with GNU binutils 2.39, the linker outputs
-warnings when generating some TEE core binaries (all_obj.o, init.o,
-unpaged.o and tee.elf) as well as ldelf.elf:
-
- arm-poky-linux-gnueabi-ld.bfd: warning: atomic_a32.o: missing .note.GNU=
-stack section implies executable stack
- arm-poky-linux-gnueabi-ld.bfd: NOTE: This behaviour is deprecated and w=
ill be removed in a future version of the linker
-
-The permissions used when mapping the TEE core stacks do not depend on
-any metadata found in the ELF file. Similarly when the TEE core loads
-ldelf it already creates a non-executable stack regardless of ELF
-information. Therefore we can safely ignore the warnings. This is done
-by adding the '-z execstack' option.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
-
----
- core/arch/arm/kernel/link.mk | 13 +++++++++----
- ldelf/link.mk                |  3 +++
- 2 files changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index c39d43cb..0e96e606 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -9,6 +9,11 @@ link-script-dep =3D $(link-out-dir)/.kern.ld.d
-=20
- AWK	 =3D awk
-=20
-+link-ldflags-common +=3D $(call ld-option,--no-warn-rwx-segments)
-+ifeq ($(CFG_ARM32_core),y)
-+link-ldflags-common +=3D $(call ld-option,--no-warn-execstack)
-+endif
-+
- link-ldflags  =3D $(LDFLAGS)
- ifeq ($(CFG_CORE_ASLR),y)
- link-ldflags +=3D -pie -Bsymbolic -z norelro $(ldflag-apply-dynamic-rel=
ocs)
-@@ -31,7 +36,7 @@ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-o=
ut-dir)/tee.map
- link-ldflags +=3D --sort-section=3Dalignment
- link-ldflags +=3D --fatal-warnings
- link-ldflags +=3D --gc-sections
--link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
-+link-ldflags +=3D $(link-ldflags-common)
-=20
- link-ldadd  =3D $(LDADD)
- link-ldadd +=3D $(ldflags-external)
-@@ -56,7 +61,7 @@ link-script-cppflags :=3D \
- 		$(cppflagscore))
-=20
- ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
--		   $(call ld-option,--no-warn-rwx-segments) \
-+		   $(link-ldflags-common) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/all_objs.o
- $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
-@@ -70,7 +75,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
-=20
- unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
--		 $(call ld-option,--no-warn-rwx-segments)
-+		 $(link-ldflags-common)
- unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -99,7 +104,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all=
_objs.o
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
-=20
- init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
--	       $(call ld-option,--no-warn-rwx-segments)
-+	       $(link-ldflags-common)
- init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
- 	      $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/init.o
-diff --git a/ldelf/link.mk b/ldelf/link.mk
-index 64c8212a..bd49551e 100644
---- a/ldelf/link.mk
-+++ b/ldelf/link.mk
-@@ -20,6 +20,9 @@ link-ldflags +=3D -z max-page-size=3D4096 # OP-TEE alw=
ays uses 4K alignment
- ifeq ($(CFG_CORE_BTI),y)
- link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings
- endif
-+ifeq ($(CFG_ARM32_$(sm)), y)
-+link-ldflags +=3D $(call ld-option,--no-warn-execstack)
-+endif
- link-ldflags +=3D $(link-ldflags$(sm))
-=20
- link-ldadd  =3D $(addprefix -L,$(libdirs))
diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0010-add-not=
e-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os-3.19=
.0/0010-add-note-GNU-stack-section.patch
deleted file mode 100644
index 4ea65d88..00000000
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0010-add-note-GNU-s=
tack-section.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From ec30e84671aac9a2e9549754eb7bc6201728db4c Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 23 Aug 2022 12:31:46 +0000
-Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack secti=
on to
-
- .S files
-
-When building for arm32 with GNU binutils 2.39, the linker outputs
-warnings when linking Trusted Applications:
-
- arm-unknown-linux-uclibcgnueabihf-ld.bfd: warning: utee_syscalls_a32.o:=
 missing .note.GNU-stack section implies executable stack
- arm-unknown-linux-uclibcgnueabihf-ld.bfd: NOTE: This behaviour is depre=
cated and will be removed in a future version of the linker
-
-We could silence the warning by adding the '-z execstack' option to the
-TA link flags, like we did in the parent commit for the TEE core and
-ldelf. Indeed, ldelf always allocates a non-executable piece of memory
-for the TA to use as a stack.
-
-However it seems preferable to comply with the common ELF practices in
-this case. A better fix is therefore to add the missing .note.GNU-stack
-sections in the assembler files.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
-
----
- lib/libutee/arch/arm/utee_syscalls_a32.S             | 2 ++
- lib/libutils/ext/arch/arm/atomic_a32.S               | 2 ++
- lib/libutils/ext/arch/arm/mcount_a32.S               | 2 ++
- lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S  | 2 ++
- lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S | 2 ++
- lib/libutils/isoc/arch/arm/setjmp_a32.S              | 2 ++
- ta/arch/arm/ta_entry_a32.S                           | 2 ++
- 7 files changed, 14 insertions(+)
-
-diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch=
/arm/utee_syscalls_a32.S
-index 6e621ca6..af405f62 100644
---- a/lib/libutee/arch/arm/utee_syscalls_a32.S
-+++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
-@@ -7,6 +7,8 @@
- #include <tee_syscall_numbers.h>
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
-         .section .text
-         .balign 4
-         .code 32
-diff --git a/lib/libutils/ext/arch/arm/atomic_a32.S b/lib/libutils/ext/a=
rch/arm/atomic_a32.S
-index eaef6914..2be73ffa 100644
---- a/lib/libutils/ext/arch/arm/atomic_a32.S
-+++ b/lib/libutils/ext/arch/arm/atomic_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /* uint32_t atomic_inc32(uint32_t *v); */
- FUNC atomic_inc32 , :
- 	ldrex	r1, [r0]
-diff --git a/lib/libutils/ext/arch/arm/mcount_a32.S b/lib/libutils/ext/a=
rch/arm/mcount_a32.S
-index 51439a23..54dc3c02 100644
---- a/lib/libutils/ext/arch/arm/mcount_a32.S
-+++ b/lib/libutils/ext/arch/arm/mcount_a32.S
-@@ -7,6 +7,8 @@
-=20
- #if defined(CFG_TA_GPROF_SUPPORT) || defined(CFG_FTRACE_SUPPORT)
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * Convert return address to call site address by subtracting the size =
of the
-  * mcount call instruction (blx __gnu_mcount_nc).
-diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S b/lib/l=
ibutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-index a600c879..37ae9ec6 100644
---- a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-+++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * signed ret_idivmod_values(signed quot, signed rem);
-  * return quotient and remaining the EABI way (regs r0,r1)
-diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S b/lib/=
libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-index 2dc50bc9..5c3353e2 100644
---- a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-+++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * __value_in_regs lldiv_t __aeabi_ldivmod( long long n, long long d)
-  */
-diff --git a/lib/libutils/isoc/arch/arm/setjmp_a32.S b/lib/libutils/isoc=
/arch/arm/setjmp_a32.S
-index 43ea5937..f8a0b70d 100644
---- a/lib/libutils/isoc/arch/arm/setjmp_a32.S
-+++ b/lib/libutils/isoc/arch/arm/setjmp_a32.S
-@@ -51,6 +51,8 @@
- #define SIZE(x)
- #endif
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /* Arm/Thumb interworking support:
-=20
-    The interworking scheme expects functions to use a BX instruction
-diff --git a/ta/arch/arm/ta_entry_a32.S b/ta/arch/arm/ta_entry_a32.S
-index d2f8a69d..cd9a12f9 100644
---- a/ta/arch/arm/ta_entry_a32.S
-+++ b/ta/arch/arm/ta_entry_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * This function is the bottom of the user call stack. Mark it as such =
so that
-  * the unwinding code won't try to go further down.
diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0006-allow-s=
etting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/=
optee-os-3.20.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-3.19.0/0006-allow-se=
tting-sysroot-for-libgcc-lookup.patch
rename to meta-arm/recipes-security/optee/optee-os-3.20.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0007-allow-s=
etting-sysroot-for-clang.patch b/meta-arm/recipes-security/optee/optee-os=
-3.20.0/0002-optee-enable-clang-support.patch
similarity index 86%
rename from meta-arm/recipes-security/optee/optee-os-3.19.0/0007-allow-se=
tting-sysroot-for-clang.patch
rename to meta-arm/recipes-security/optee/optee-os-3.20.0/0002-optee-enab=
le-clang-support.patch
index 067ba6eb..af0ec94f 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0007-allow-setting-=
sysroot-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.20.0/0002-optee-enable-c=
lang-support.patch
@@ -1,4 +1,4 @@
-From db9e44af75c7cfd3316cab15aaa387383df3e57e Mon Sep 17 00:00:00 2001
+From 8846ab2b37781364088cc5c02b6bc6f518a66a0a Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
@@ -16,10 +16,10 @@ Signed-off-by: Brett Warren <brett.warren@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/mk/clang.mk b/mk/clang.mk
-index c141a3f2..7d067cc0 100644
+index a045beee..1ebe2f70 100644
 --- a/mk/clang.mk
 +++ b/mk/clang.mk
-@@ -27,7 +27,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
+@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
 =20
  # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
  # libgcc for clang
diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn=
-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os-3.20.0/000=
3-core-link-add-no-warn-rwx-segments.patch
similarity index 93%
rename from meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-=
rwx-segments.patch
rename to meta-arm/recipes-security/optee/optee-os-3.20.0/0003-core-link-=
add-no-warn-rwx-segments.patch
index 64a3d7e5..5740461f 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-se=
gments.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.20.0/0003-core-link-add-=
no-warn-rwx-segments.patch
@@ -1,4 +1,4 @@
-From cf2a2451f4e9300532d677bb3a8315494a3b3a82 Mon Sep 17 00:00:00 2001
+From 188a39b139e0e2ccceb22bcf63559b451f0483e0 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Fri, 5 Aug 2022 09:48:03 +0200
 Subject: [PATCH] core: link: add --no-warn-rwx-segments
@@ -19,8 +19,12 @@ Reported-by: Dominique Martinet <dominique.martinet@at=
mark-techno.com>
 Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
 Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
=20
+---
+ core/arch/arm/kernel/link.mk | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 0e96e606c..3fbcb6804 100644
+index 0e96e606..3fbcb680 100644
 --- a/core/arch/arm/kernel/link.mk
 +++ b/core/arch/arm/kernel/link.mk
 @@ -37,6 +37,7 @@ link-ldflags +=3D --sort-section=3Dalignment
diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-De=
fine-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee=
/optee-os-3.20.0/0004-core-Define-section-attributes-for-clang.patch
similarity index 97%
rename from meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-Def=
ine-section-attributes-for-clang.patch
rename to meta-arm/recipes-security/optee/optee-os-3.20.0/0004-core-Defin=
e-section-attributes-for-clang.patch
index a1dc251a..f94d19ff 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-Define-se=
ction-attributes-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.20.0/0004-core-Define-se=
ction-attributes-for-clang.patch
@@ -1,7 +1,7 @@
-From ff1b556ac2cd6bbb857a1ac03e0557eb490bc845 Mon Sep 17 00:00:00 2001
+From e74d8a02edd8c431c87786e22dbceee8e1e85bb8 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 21 Dec 2022 10:55:58 +0000
-Subject: [PATCH] [PATCH] core: Define section attributes for clang
+Subject: [PATCH] core: Define section attributes for clang
=20
 Clang's attribute section is not same as gcc, here we need to add flags
 to sections so they can be eventually collected by linker into final
@@ -30,6 +30,7 @@ going and match the functionality with gcc.
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
  core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
@@ -39,7 +40,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 104 insertions(+), 11 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 05dbbe56..8e6ea034 100644
+index 1cf76a0c..1e7f9f96 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
 @@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
@@ -185,7 +186,7 @@ index cd85bd22..3e18f54f 100644
  struct mmu_partition {
  	l1_xlat_tbl_t *l1_table;
 diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index a7b1b10e..489859ce 100644
+index 79553c6d..b9efdf42 100644
 --- a/core/arch/arm/mm/pgt_cache.c
 +++ b/core/arch/arm/mm/pgt_cache.c
 @@ -410,8 +410,18 @@ void pgt_init(void)
@@ -238,6 +239,3 @@ index d1f2f382..8de124ae 100644
  #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
 =20
  DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
---=20
-2.17.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index a03ea6a3..bb6974b2 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -17,9 +17,9 @@ DEPENDS:append:toolchain-clang =3D " compiler-rt"
 SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branch=3Dmaster;protoc=
ol=3Dhttps"
=20
 SRC_URI:append =3D " \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-    file://0008-no-warn-rwx-segments.patch \
+    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0002-optee-enable-clang-support.patch \
+    file://0003-core-link-add-no-warn-rwx-segments.patch \
    "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.18.0.bb
index c51d4568..41b65c2b 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
@@ -6,7 +6,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.18.0:=
"
=20
 SRCREV =3D "1ee647035939e073a2e8dddb727c0f019cc035f1"
 SRC_URI:append =3D " \
-    file://0001-core-Define-section-attributes-for-clang.patch \
-    file://0009-add-z-execstack.patch \
-    file://0010-add-note-GNU-stack-section.patch \
+    file://0004-core-Define-section-attributes-for-clang.patch \
+    file://0005-core-ldelf-link-add-z-execstack.patch \
+    file://0006-arm32-libutils-libutee-ta-add-.note.GNU-stack-sectio.pat=
ch \
    "
diff --git a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.19.0.bb
deleted file mode 100644
index c08faf6b..00000000
--- a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.19.0:"
-
-SRCREV =3D "afacf356f9593a7f83cae9f96026824ec242ff52"
-SRC_URI:append =3D " \
-    file://0001-core-Define-section-attributes-for-clang.patch \
-   "
diff --git a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.20.0.bb
new file mode 100644
index 00000000..5f4b066a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
@@ -0,0 +1,10 @@
+require optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.20.0:"
+
+SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
+SRC_URI:append =3D " \
+    file://0004-core-Define-section-attributes-for-clang.patch \
+   "
--=20
2.25.1


