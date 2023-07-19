Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A58DEB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 16:06:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1236.1689782807549336414
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 09:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61BD82F4
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 09:07:30 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4ADC3F67D
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 09:06:46 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/optee-os: update/clean-up patches and recipes
Date: Wed, 19 Jul 2023 08:02:15 -0500
Message-Id: <20230719130215.3572270-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 16:06:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4907

The optee-os.inc was including patches which really should've been in
the versioned .bb file.  Move those references there and update the
FILESEXTRAPATHS to be more intelligent.  While there, rebase the files
via devtool and update the file names as necessary.

Also, remove unreferenced patches.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   5 +-
 .../0002-optee-enable-clang-support.patch     |   5 +-
 ...3-core-link-add-no-warn-rwx-segments.patch |   5 +-
 ...-Define-section-attributes-for-clang.patch |  12 +-
 ...0005-core-ldelf-link-add-z-execstack.patch |   7 +-
 ...ibutee-ta-add-.note.GNU-stack-sectio.patch |  17 +-
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   5 +-
 .../0002-optee-enable-clang-support.patch     |   5 +-
 ...3-core-link-add-no-warn-rwx-segments.patch |   5 +-
 ...-Define-section-attributes-for-clang.patch |  13 +-
 ...-core-arm-S-EL1-SPMC-boot-ABI-update.patch |  11 +-
 ...-core-ffa-add-TOS_FW_CONFIG-handling.patch |  19 +-
 ...re-spmc-handle-non-secure-interrupts.patch |  20 +--
 ...ure-SP-s-NS-interrupt-action-based-o.patch |  12 +-
 .../recipes-security/optee/optee-os_3.18.0.bb |   5 +-
 .../recipes-security/optee/optee-os_3.20.0.bb |   5 +-
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   5 +-
 ...Define-section-attributes-for-clang.patch} |  12 +-
 ... =3D> 0003-optee-enable-clang-support.patch} |   5 +-
 ...-core-link-add-no-warn-rwx-segments.patch} |   5 +-
 meta-arm/recipes-security/optee/optee-os.inc  |   6 -
 .../recipes-security/optee/optee-os_3.22.0.bb |   7 +-
 ...pdate-arm_ffa_user-driver-dependency.patch |  39 -----
 ..._ffa_user-driver-compatibility-check.patch | 163 ------------------
 24 files changed, 85 insertions(+), 308 deletions(-)
 rename meta-arm/recipes-security/optee/optee-os-3.22.0/{0001-core-Define=
-section-attributes-for-clang.patch =3D> 0002-core-Define-section-attribu=
tes-for-clang.patch} (96%)
 rename meta-arm/recipes-security/optee/optee-os-3.22.0/{0002-optee-enabl=
e-clang-support.patch =3D> 0003-optee-enable-clang-support.patch} (91%)
 rename meta-arm/recipes-security/optee/optee-os-3.22.0/{0003-core-link-a=
dd-no-warn-rwx-segments.patch =3D> 0004-core-link-add-no-warn-rwx-segment=
s.patch} (96%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/Update-arm=
_ffa_user-driver-dependency.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/ffa_spmc-A=
dd-arm_ffa_user-driver-compatibility-check.patch

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0001-all=
ow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-securit=
y/optee/optee-os-3.18.0/0001-allow-setting-sysroot-for-libgcc-lookup.patc=
h
index ab4a6dbc..2aec7fc3 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
@@ -1,4 +1,4 @@
-From 528aeb42652a3159c1bfd51d6c1442c3ff27b84c Mon Sep 17 00:00:00 2001
+From fed478758e495f35d18a9e2a89193e6577b06799 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 26 May 2020 14:38:02 -0500
 Subject: [PATCH] allow setting sysroot for libgcc lookup
@@ -9,13 +9,12 @@ otherwise.
=20
 Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  mk/gcc.mk | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..81bfa78a 100644
+index adc77a24f25e..81bfa78ad8d7 100644
 --- a/mk/gcc.mk
 +++ b/mk/gcc.mk
 @@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0002-opt=
ee-enable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee=
-os-3.18.0/0002-optee-enable-clang-support.patch
index 067ba6eb..7441e744 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0002-optee-enab=
le-clang-support.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0002-optee-enab=
le-clang-support.patch
@@ -1,4 +1,4 @@
-From db9e44af75c7cfd3316cab15aaa387383df3e57e Mon Sep 17 00:00:00 2001
+From f158e3af6633bd689a76d53be2c9c590c0385350 Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
@@ -10,13 +10,12 @@ compiler-rt. This is mitigated by including the varia=
ble as ammended.
 Upstream-Status: Pending
 ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
 Signed-off-by: Brett Warren <brett.warren@arm.com>
-
 ---
  mk/clang.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/mk/clang.mk b/mk/clang.mk
-index c141a3f2..7d067cc0 100644
+index c141a3f2ed0b..7d067cc007fa 100644
 --- a/mk/clang.mk
 +++ b/mk/clang.mk
 @@ -27,7 +27,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0003-cor=
e-link-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/opt=
ee/optee-os-3.18.0/0003-core-link-add-no-warn-rwx-segments.patch
index 6d48a760..62aee356 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0003-core-link-=
add-no-warn-rwx-segments.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0003-core-link-=
add-no-warn-rwx-segments.patch
@@ -1,4 +1,4 @@
-From cf2a2451f4e9300532d677bb3a8315494a3b3a82 Mon Sep 17 00:00:00 2001
+From fb69397234b1efe3528714b6c0c1921ce37ad6a6 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Fri, 5 Aug 2022 09:48:03 +0200
 Subject: [PATCH] core: link: add --no-warn-rwx-segments
@@ -18,13 +18,12 @@ Link: https://sourceware.org/bugzilla/show_bug.cgi?id=
=3D29448
 Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
 Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
 Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
 ---
  core/arch/arm/kernel/link.mk | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 7eed333a..c39d43cb 100644
+index 7eed333a32de..c39d43cbfc5b 100644
 --- a/core/arch/arm/kernel/link.mk
 +++ b/core/arch/arm/kernel/link.mk
 @@ -31,6 +31,7 @@ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-o=
ut-dir)/tee.map
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0004-cor=
e-Define-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-securi=
ty/optee/optee-os-3.18.0/0004-core-Define-section-attributes-for-clang.pa=
tch
index 0ab670f5..e3c509f6 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0004-core-Defin=
e-section-attributes-for-clang.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0004-core-Defin=
e-section-attributes-for-clang.patch
@@ -1,4 +1,4 @@
-From 7218af04ce3af466e95d69e4995138cd2d26dd3f Mon Sep 17 00:00:00 2001
+From 0690909f07779a8f35b1f3d0baf8d4c5c9305d14 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Aug 2022 19:24:55 -0700
 Subject: [PATCH] core: Define section attributes for clang
@@ -39,7 +39,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 104 insertions(+), 11 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index f083b159..432983c8 100644
+index f083b159e969..432983c86c9f 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
 @@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
@@ -76,7 +76,7 @@ index f083b159..432983c8 100644
 =20
  #ifdef ARM32
 diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
-index 3f08eec6..e6dc9261 100644
+index 3f08eec623f3..e6dc9261c41e 100644
 --- a/core/arch/arm/mm/core_mmu_lpae.c
 +++ b/core/arch/arm/mm/core_mmu_lpae.c
 @@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
@@ -131,7 +131,7 @@ index 3f08eec6..e6dc9261 100644
   * TAs page table entry inside a level 1 page table.
   *
 diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
-index cd85bd22..3e18f54f 100644
+index cd85bd22d385..3e18f54f6cf8 100644
 --- a/core/arch/arm/mm/core_mmu_v7.c
 +++ b/core/arch/arm/mm/core_mmu_v7.c
 @@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
@@ -185,7 +185,7 @@ index cd85bd22..3e18f54f 100644
  struct mmu_partition {
  	l1_xlat_tbl_t *l1_table;
 diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index dee1d207..382cae1c 100644
+index dee1d207943f..382cae1c3f30 100644
 --- a/core/arch/arm/mm/pgt_cache.c
 +++ b/core/arch/arm/mm/pgt_cache.c
 @@ -104,8 +104,18 @@ void pgt_init(void)
@@ -209,7 +209,7 @@ index dee1d207..382cae1c 100644
 =20
  	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
 diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 18d34e6a..086129e2 100644
+index 18d34e6adfe2..086129e282bc 100644
 --- a/core/kernel/thread.c
 +++ b/core/kernel/thread.c
 @@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_C=
ORE_NB_CORE] __nex_bss;
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0005-cor=
e-ldelf-link-add-z-execstack.patch b/meta-arm-bsp/recipes-security/optee/=
optee-os-3.18.0/0005-core-ldelf-link-add-z-execstack.patch
index 3ba6c4ef..862a76b4 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0005-core-ldelf=
-link-add-z-execstack.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0005-core-ldelf=
-link-add-z-execstack.patch
@@ -1,4 +1,4 @@
-From ea932656461865ab9ac4036245c756c082aeb3e1 Mon Sep 17 00:00:00 2001
+From 63445958678b58c5adc7eca476b216e5dc0f4195 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Tue, 23 Aug 2022 11:41:00 +0000
 Subject: [PATCH] core, ldelf: link: add -z execstack
@@ -20,14 +20,13 @@ Signed-off-by: Jerome Forissier <jerome.forissier@lin=
aro.org>
=20
 Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
 Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
-
 ---
  core/arch/arm/kernel/link.mk | 13 +++++++++----
  ldelf/link.mk                |  3 +++
  2 files changed, 12 insertions(+), 4 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index c39d43cb..0e96e606 100644
+index c39d43cbfc5b..0e96e606cd9d 100644
 --- a/core/arch/arm/kernel/link.mk
 +++ b/core/arch/arm/kernel/link.mk
 @@ -9,6 +9,11 @@ link-script-dep =3D $(link-out-dir)/.kern.ld.d
@@ -79,7 +78,7 @@ index c39d43cb..0e96e606 100644
  	      $(libgcccore)
  cleanfiles +=3D $(link-out-dir)/init.o
 diff --git a/ldelf/link.mk b/ldelf/link.mk
-index 64c8212a..bd49551e 100644
+index 64c8212a06fa..bd49551e7065 100644
 --- a/ldelf/link.mk
 +++ b/ldelf/link.mk
 @@ -20,6 +20,9 @@ link-ldflags +=3D -z max-page-size=3D4096 # OP-TEE alw=
ays uses 4K alignment
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0006-arm=
32-libutils-libutee-ta-add-.note.GNU-stack-sectio.patch b/meta-arm-bsp/re=
cipes-security/optee/optee-os-3.18.0/0006-arm32-libutils-libutee-ta-add-.=
note.GNU-stack-sectio.patch
index 4ea65d88..e82fdc71 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0006-arm32-libu=
tils-libutee-ta-add-.note.GNU-stack-sectio.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0006-arm32-libu=
tils-libutee-ta-add-.note.GNU-stack-sectio.patch
@@ -1,4 +1,4 @@
-From ec30e84671aac9a2e9549754eb7bc6201728db4c Mon Sep 17 00:00:00 2001
+From 1a991cbedf8647d5a1e7c312614f7867c3940968 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Tue, 23 Aug 2022 12:31:46 +0000
 Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack secti=
on to
@@ -24,7 +24,6 @@ Signed-off-by: Jerome Forissier <jerome.forissier@linar=
o.org>
=20
 Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
 Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
-
 ---
  lib/libutee/arch/arm/utee_syscalls_a32.S             | 2 ++
  lib/libutils/ext/arch/arm/atomic_a32.S               | 2 ++
@@ -36,7 +35,7 @@ Upstream-Status: Backport [https://github.com/OP-TEE/op=
tee_os/pull/5499]
  7 files changed, 14 insertions(+)
=20
 diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch=
/arm/utee_syscalls_a32.S
-index 6e621ca6..af405f62 100644
+index 6e621ca6e06d..af405f62723c 100644
 --- a/lib/libutee/arch/arm/utee_syscalls_a32.S
 +++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
 @@ -7,6 +7,8 @@
@@ -49,7 +48,7 @@ index 6e621ca6..af405f62 100644
          .balign 4
          .code 32
 diff --git a/lib/libutils/ext/arch/arm/atomic_a32.S b/lib/libutils/ext/a=
rch/arm/atomic_a32.S
-index eaef6914..2be73ffa 100644
+index eaef6914734e..2be73ffadcc9 100644
 --- a/lib/libutils/ext/arch/arm/atomic_a32.S
 +++ b/lib/libutils/ext/arch/arm/atomic_a32.S
 @@ -5,6 +5,8 @@
@@ -62,7 +61,7 @@ index eaef6914..2be73ffa 100644
  FUNC atomic_inc32 , :
  	ldrex	r1, [r0]
 diff --git a/lib/libutils/ext/arch/arm/mcount_a32.S b/lib/libutils/ext/a=
rch/arm/mcount_a32.S
-index 51439a23..54dc3c02 100644
+index 51439a23014e..54dc3c02da66 100644
 --- a/lib/libutils/ext/arch/arm/mcount_a32.S
 +++ b/lib/libutils/ext/arch/arm/mcount_a32.S
 @@ -7,6 +7,8 @@
@@ -75,7 +74,7 @@ index 51439a23..54dc3c02 100644
   * Convert return address to call site address by subtracting the size =
of the
   * mcount call instruction (blx __gnu_mcount_nc).
 diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S b/lib/l=
ibutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-index a600c879..37ae9ec6 100644
+index a600c879668c..37ae9ec6f9f1 100644
 --- a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
 +++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
 @@ -5,6 +5,8 @@
@@ -88,7 +87,7 @@ index a600c879..37ae9ec6 100644
   * signed ret_idivmod_values(signed quot, signed rem);
   * return quotient and remaining the EABI way (regs r0,r1)
 diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S b/lib/=
libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-index 2dc50bc9..5c3353e2 100644
+index 2dc50bc98bbf..5c3353e2c1ba 100644
 --- a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
 +++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
 @@ -5,6 +5,8 @@
@@ -101,7 +100,7 @@ index 2dc50bc9..5c3353e2 100644
   * __value_in_regs lldiv_t __aeabi_ldivmod( long long n, long long d)
   */
 diff --git a/lib/libutils/isoc/arch/arm/setjmp_a32.S b/lib/libutils/isoc=
/arch/arm/setjmp_a32.S
-index 43ea5937..f8a0b70d 100644
+index 43ea593758c9..f8a0b70df705 100644
 --- a/lib/libutils/isoc/arch/arm/setjmp_a32.S
 +++ b/lib/libutils/isoc/arch/arm/setjmp_a32.S
 @@ -51,6 +51,8 @@
@@ -114,7 +113,7 @@ index 43ea5937..f8a0b70d 100644
 =20
     The interworking scheme expects functions to use a BX instruction
 diff --git a/ta/arch/arm/ta_entry_a32.S b/ta/arch/arm/ta_entry_a32.S
-index d2f8a69d..cd9a12f9 100644
+index d2f8a69daa7f..cd9a12f9dbf9 100644
 --- a/ta/arch/arm/ta_entry_a32.S
 +++ b/ta/arch/arm/ta_entry_a32.S
 @@ -5,6 +5,8 @@
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0001-all=
ow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-securit=
y/optee/optee-os-3.20.0/0001-allow-setting-sysroot-for-libgcc-lookup.patc=
h
index ab4a6dbc..54b667a6 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
@@ -1,4 +1,4 @@
-From 528aeb42652a3159c1bfd51d6c1442c3ff27b84c Mon Sep 17 00:00:00 2001
+From 843eb2ef918d5ae3d09de088110cb026ca25306b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 26 May 2020 14:38:02 -0500
 Subject: [PATCH] allow setting sysroot for libgcc lookup
@@ -9,13 +9,12 @@ otherwise.
=20
 Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  mk/gcc.mk | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..81bfa78a 100644
+index adc77a24f25e..81bfa78ad8d7 100644
 --- a/mk/gcc.mk
 +++ b/mk/gcc.mk
 @@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0002-opt=
ee-enable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee=
-os-3.20.0/0002-optee-enable-clang-support.patch
index af0ec94f..b3e30980 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0002-optee-enab=
le-clang-support.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0002-optee-enab=
le-clang-support.patch
@@ -1,4 +1,4 @@
-From 8846ab2b37781364088cc5c02b6bc6f518a66a0a Mon Sep 17 00:00:00 2001
+From 0ca5ef7c8256dbd9690a01a82397bc16a123e179 Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
@@ -10,13 +10,12 @@ compiler-rt. This is mitigated by including the varia=
ble as ammended.
 Upstream-Status: Pending
 ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
 Signed-off-by: Brett Warren <brett.warren@arm.com>
-
 ---
  mk/clang.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee..1ebe2f70 100644
+index a045beee8482..1ebe2f702dcd 100644
 --- a/mk/clang.mk
 +++ b/mk/clang.mk
 @@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0003-cor=
e-link-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/opt=
ee/optee-os-3.20.0/0003-core-link-add-no-warn-rwx-segments.patch
index 5740461f..5d4191ff 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0003-core-link-=
add-no-warn-rwx-segments.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0003-core-link-=
add-no-warn-rwx-segments.patch
@@ -1,4 +1,4 @@
-From 188a39b139e0e2ccceb22bcf63559b451f0483e0 Mon Sep 17 00:00:00 2001
+From 741df4df0ec7b69b0573cff265dc1ae7cb70b55c Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Fri, 5 Aug 2022 09:48:03 +0200
 Subject: [PATCH] core: link: add --no-warn-rwx-segments
@@ -18,13 +18,12 @@ Link: https://sourceware.org/bugzilla/show_bug.cgi?id=
=3D29448
 Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
 Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
 Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
 ---
  core/arch/arm/kernel/link.mk | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 0e96e606..3fbcb680 100644
+index 0e96e606cd9d..3fbcb6804c6f 100644
 --- a/core/arch/arm/kernel/link.mk
 +++ b/core/arch/arm/kernel/link.mk
 @@ -37,6 +37,7 @@ link-ldflags +=3D --sort-section=3Dalignment
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0004-cor=
e-Define-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-securi=
ty/optee/optee-os-3.20.0/0004-core-Define-section-attributes-for-clang.pa=
tch
index f94d19ff..6229be99 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0004-core-Defin=
e-section-attributes-for-clang.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0004-core-Defin=
e-section-attributes-for-clang.patch
@@ -1,4 +1,4 @@
-From e74d8a02edd8c431c87786e22dbceee8e1e85bb8 Mon Sep 17 00:00:00 2001
+From 162493e5b212b9d7391669a55be09b69b97a9cf8 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 21 Dec 2022 10:55:58 +0000
 Subject: [PATCH] core: Define section attributes for clang
@@ -30,7 +30,6 @@ going and match the functionality with gcc.
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
  core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
@@ -40,7 +39,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 104 insertions(+), 11 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 1cf76a0c..1e7f9f96 100644
+index 1cf76a0ca690..1e7f9f96b558 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
 @@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
@@ -77,7 +76,7 @@ index 1cf76a0c..1e7f9f96 100644
 =20
  #ifdef ARM32
 diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
-index 3f08eec6..e6dc9261 100644
+index 3f08eec623f3..e6dc9261c41e 100644
 --- a/core/arch/arm/mm/core_mmu_lpae.c
 +++ b/core/arch/arm/mm/core_mmu_lpae.c
 @@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
@@ -132,7 +131,7 @@ index 3f08eec6..e6dc9261 100644
   * TAs page table entry inside a level 1 page table.
   *
 diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
-index cd85bd22..3e18f54f 100644
+index cd85bd22d385..3e18f54f6cf8 100644
 --- a/core/arch/arm/mm/core_mmu_v7.c
 +++ b/core/arch/arm/mm/core_mmu_v7.c
 @@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
@@ -186,7 +185,7 @@ index cd85bd22..3e18f54f 100644
  struct mmu_partition {
  	l1_xlat_tbl_t *l1_table;
 diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index 79553c6d..b9efdf42 100644
+index 79553c6d2183..b9efdf42780b 100644
 --- a/core/arch/arm/mm/pgt_cache.c
 +++ b/core/arch/arm/mm/pgt_cache.c
 @@ -410,8 +410,18 @@ void pgt_init(void)
@@ -210,7 +209,7 @@ index 79553c6d..b9efdf42 100644
 =20
  	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
 diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index d1f2f382..8de124ae 100644
+index d1f2f3823be7..8de124ae5357 100644
 --- a/core/kernel/thread.c
 +++ b/core/kernel/thread.c
 @@ -38,13 +38,24 @@ struct thread_core_local thread_core_local[CFG_TEE_C=
ORE_NB_CORE] __nex_bss;
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-cor=
e-arm-S-EL1-SPMC-boot-ABI-update.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.20.0/0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch
index 4313a829..381cad9a 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-core-arm-S=
-EL1-SPMC-boot-ABI-update.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-core-arm-S=
-EL1-SPMC-boot-ABI-update.patch
@@ -1,7 +1,7 @@
-From 11f4ea86579bc1a58e4adde2849326f4213694f2 Mon Sep 17 00:00:00 2001
+From d0e32b6e202cde672c2b38dc568122a52be716b4 Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Mon, 21 Nov 2022 18:17:33 +0100
-Subject: core: arm: S-EL1 SPMC: boot ABI update
+Subject: [PATCH] core: arm: S-EL1 SPMC: boot ABI update
=20
 Updates the boot ABI for S-EL1 SPMC to align better with other SPMCs,
 like Hafnium, but also with the non-FF-A configuration.
@@ -30,7 +30,7 @@ Signed-off-by: Jens Wiklander <jens.wiklander@linaro.or=
g>
  2 files changed, 15 insertions(+), 10 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
-index dd34173e8..e02c02b60 100644
+index dd34173e838d..e02c02b6097d 100644
 --- a/core/arch/arm/kernel/boot.c
 +++ b/core/arch/arm/kernel/boot.c
 @@ -1502,11 +1502,17 @@ struct ns_entry_context *boot_core_hpen(void)
@@ -53,7 +53,7 @@ index dd34173e8..e02c02b60 100644
  		DMSG("Bad fdt: %d", rc);
  		goto err;
 diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
-index 4c6e9d75c..047ae1f25 100644
+index 4c6e9d75ca45..047ae1f25cc9 100644
 --- a/core/arch/arm/kernel/entry_a64.S
 +++ b/core/arch/arm/kernel/entry_a64.S
 @@ -143,21 +143,20 @@
@@ -86,6 +86,3 @@ index 4c6e9d75c..047ae1f25 100644
  #endif
 =20
  	adr	x0, reset_vect_table
---=20
-2.39.1.windows.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-cor=
e-ffa-add-TOS_FW_CONFIG-handling.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.20.0/0006-core-ffa-add-TOS_FW_CONFIG-handling.patch
index add39076..5421b10e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-core-ffa-a=
dd-TOS_FW_CONFIG-handling.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-core-ffa-a=
dd-TOS_FW_CONFIG-handling.patch
@@ -1,7 +1,7 @@
-From 84f4ef4c4f2f45e2f54597f1afe80d8f8396cc57 Mon Sep 17 00:00:00 2001
+From 9da324001fd93e1b3d9bca076e4afddbb5cac289 Mon Sep 17 00:00:00 2001
 From: Balint Dobszay <balint.dobszay@arm.com>
 Date: Fri, 10 Feb 2023 11:07:27 +0100
-Subject: core: ffa: add TOS_FW_CONFIG handling
+Subject: [PATCH] core: ffa: add TOS_FW_CONFIG handling
=20
 At boot TF-A passes two DT addresses (HW_CONFIG and TOS_FW_CONFIG), but
 currently only the HW_CONFIG address is saved, the other one is dropped.
@@ -23,7 +23,7 @@ Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
  6 files changed, 81 insertions(+), 8 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
-index e02c02b60..98e13c072 100644
+index e02c02b6097d..98e13c072d8e 100644
 --- a/core/arch/arm/kernel/boot.c
 +++ b/core/arch/arm/kernel/boot.c
 @@ -1,6 +1,7 @@
@@ -118,7 +118,7 @@ index e02c02b60..98e13c072 100644
  	update_external_dt();
  	configure_console_from_dt();
 diff --git a/core/arch/arm/kernel/entry_a32.S b/core/arch/arm/kernel/ent=
ry_a32.S
-index 0f14ca2f6..3758fd8b7 100644
+index 0f14ca2f6ad9..3758fd8b7674 100644
 --- a/core/arch/arm/kernel/entry_a32.S
 +++ b/core/arch/arm/kernel/entry_a32.S
 @@ -1,7 +1,7 @@
@@ -139,7 +139,7 @@ index 0f14ca2f6..3758fd8b7 100644
  #ifndef CFG_VIRTUALIZATION
  	mov	r0, #THREAD_CLF_TMP
 diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
-index 047ae1f25..fa76437fb 100644
+index 047ae1f25cc9..fa76437fb73c 100644
 --- a/core/arch/arm/kernel/entry_a64.S
 +++ b/core/arch/arm/kernel/entry_a64.S
 @@ -1,7 +1,7 @@
@@ -178,7 +178,7 @@ index 047ae1f25..fa76437fb 100644
  #ifdef CFG_CORE_PAUTH
  	init_pauth_per_cpu
 diff --git a/core/arch/arm/kernel/link_dummies_paged.c b/core/arch/arm/k=
ernel/link_dummies_paged.c
-index 3b8287e06..023a5f3f5 100644
+index 3b8287e06a11..023a5f3f558b 100644
 --- a/core/arch/arm/kernel/link_dummies_paged.c
 +++ b/core/arch/arm/kernel/link_dummies_paged.c
 @@ -1,6 +1,7 @@
@@ -200,7 +200,7 @@ index 3b8287e06..023a5f3f5 100644
  }
 =20
 diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
-index 1d36e90b1..d386f1e4d 100644
+index 1d36e90b1cf7..d386f1e4d211 100644
 --- a/core/arch/arm/kernel/secure_partition.c
 +++ b/core/arch/arm/kernel/secure_partition.c
 @@ -1212,7 +1212,7 @@ static TEE_Result fip_sp_map_all(void)
@@ -213,7 +213,7 @@ index 1d36e90b1..d386f1e4d 100644
  		EMSG("No SPMC manifest found");
  		return TEE_ERROR_GENERIC;
 diff --git a/core/include/kernel/boot.h b/core/include/kernel/boot.h
-index 260854473..941e093b2 100644
+index 260854473b8b..941e093b29a1 100644
 --- a/core/include/kernel/boot.h
 +++ b/core/include/kernel/boot.h
 @@ -1,7 +1,7 @@
@@ -244,6 +244,3 @@ index 260854473..941e093b2 100644
  /*
   * get_aslr_seed() - return a random seed for core ASLR
   * @fdt:	Pointer to a device tree if CFG_DT_ADDR=3Dy
---=20
-2.39.1.windows.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0007-cor=
e-spmc-handle-non-secure-interrupts.patch b/meta-arm-bsp/recipes-security=
/optee/optee-os-3.20.0/0007-core-spmc-handle-non-secure-interrupts.patch
index 28d1f03c..94c1e049 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0007-core-spmc-=
handle-non-secure-interrupts.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0007-core-spmc-=
handle-non-secure-interrupts.patch
@@ -1,4 +1,4 @@
-From f4b4f5bccc1be9a709008cc8e6107302745796c8 Mon Sep 17 00:00:00 2001
+From 18ad0cce24addd45271edf3172ab9ce873186d7a Mon Sep 17 00:00:00 2001
 From: Imre Kis <imre.kis@arm.com>
 Date: Tue, 18 Apr 2023 16:41:51 +0200
 Subject: [PATCH] core: spmc: handle non-secure interrupts
@@ -18,7 +18,6 @@ Upstream-Status: Submitted [https://github.com/OP-TEE/o=
ptee_os/pull/6002]
=20
 Signed-off-by: Imre Kis <imre.kis@arm.com>
 Change-Id: I577ebe86d416ee494963216a66a3bfc8206921b4
-
 ---
  core/arch/arm/include/ffa.h                   |  2 +-
  .../arch/arm/include/kernel/spmc_sp_handler.h | 11 +++++++
@@ -30,7 +29,7 @@ Change-Id: I577ebe86d416ee494963216a66a3bfc8206921b4
  7 files changed, 122 insertions(+), 2 deletions(-)
=20
 diff --git a/core/arch/arm/include/ffa.h b/core/arch/arm/include/ffa.h
-index 5a19fb0c..b3d1d354 100644
+index 5a19fb0c7ff3..b3d1d354735d 100644
 --- a/core/arch/arm/include/ffa.h
 +++ b/core/arch/arm/include/ffa.h
 @@ -50,7 +50,7 @@
@@ -43,7 +42,7 @@ index 5a19fb0c..b3d1d354 100644
  #define FFA_MSG_SEND_DIRECT_REQ_32	U(0x8400006F)
  #define FFA_MSG_SEND_DIRECT_REQ_64	U(0xC400006F)
 diff --git a/core/arch/arm/include/kernel/spmc_sp_handler.h b/core/arch/=
arm/include/kernel/spmc_sp_handler.h
-index f5bda7bf..30c1e469 100644
+index f5bda7bfe7d0..30c1e4691273 100644
 --- a/core/arch/arm/include/kernel/spmc_sp_handler.h
 +++ b/core/arch/arm/include/kernel/spmc_sp_handler.h
 @@ -25,6 +25,8 @@ void spmc_sp_start_thread(struct thread_smc_args *args=
);
@@ -72,7 +71,7 @@ index f5bda7bf..30c1e469 100644
 =20
  #endif /* __KERNEL_SPMC_SP_HANDLER_H */
 diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
-index 1d36e90b..6e351e43 100644
+index d386f1e4d211..740be6d22e47 100644
 --- a/core/arch/arm/kernel/secure_partition.c
 +++ b/core/arch/arm/kernel/secure_partition.c
 @@ -999,6 +999,8 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_sess=
ion *s,
@@ -109,7 +108,7 @@ index 1d36e90b..6e351e43 100644
 =20
  	thread_user_clear_vfp(&ctx->uctx);
 diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kern=
el/spmc_sp_handler.c
-index 5d3326fc..f4c7ff81 100644
+index 46a15646ecf0..12681151a796 100644
 --- a/core/arch/arm/kernel/spmc_sp_handler.c
 +++ b/core/arch/arm/kernel/spmc_sp_handler.c
 @@ -366,6 +366,32 @@ cleanup:
@@ -146,7 +145,7 @@ index 5d3326fc..f4c7ff81 100644
  {
  	return rxtx && rxtx->rx && rxtx->tx && rxtx->size > 0;
 diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 1e7f9f96..8cd4dc96 100644
+index 1e7f9f96b558..8cd4dc961b02 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
 @@ -531,6 +531,13 @@ int thread_state_suspend(uint32_t flags, uint32_t c=
psr, vaddr_t pc)
@@ -164,7 +163,7 @@ index 1e7f9f96..8cd4dc96 100644
 =20
  	if (IS_ENABLED(CFG_VIRTUALIZATION))
 diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/t=
hread_spmc.c
-index 3b4ac0b4..bc4e7687 100644
+index 3b4ac0b4e35c..bc4e7687d618 100644
 --- a/core/arch/arm/kernel/thread_spmc.c
 +++ b/core/arch/arm/kernel/thread_spmc.c
 @@ -45,7 +45,7 @@ struct mem_frag_state {
@@ -220,7 +219,7 @@ index 3b4ac0b4..bc4e7687 100644
  	case FFA_INTERRUPT:
  		itr_core_handler();
 diff --git a/core/arch/arm/kernel/thread_spmc_a64.S b/core/arch/arm/kern=
el/thread_spmc_a64.S
-index 21cb6251..7297005a 100644
+index 21cb62513a42..7297005a6038 100644
 --- a/core/arch/arm/kernel/thread_spmc_a64.S
 +++ b/core/arch/arm/kernel/thread_spmc_a64.S
 @@ -14,6 +14,20 @@
@@ -274,6 +273,3 @@ index 21cb6251..7297005a 100644
  	mov	x2, #FFA_PARAM_MBZ
  	mov	w3, #FFA_PARAM_MBZ
  	mov	w4, #OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT
-
---=20
-2.17.1
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0008-cor=
e-spmc-configure-SP-s-NS-interrupt-action-based-o.patch b/meta-arm-bsp/re=
cipes-security/optee/optee-os-3.20.0/0008-core-spmc-configure-SP-s-NS-int=
errupt-action-based-o.patch
index 6b502d78..9f7d781e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0008-core-spmc-=
configure-SP-s-NS-interrupt-action-based-o.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0008-core-spmc-=
configure-SP-s-NS-interrupt-action-based-o.patch
@@ -1,8 +1,8 @@
-From cad33cffb5be17fc0654aaf03c4d5227ae682e7a Mon Sep 17 00:00:00 2001
+From e7835c526aabd8e5b6db335619a0d86165c587ed Mon Sep 17 00:00:00 2001
 From: Imre Kis <imre.kis@arm.com>
 Date: Tue, 25 Apr 2023 14:19:14 +0200
-Subject: [PATCH] core: spmc: configure SP's NS interrupt action based on
- the manifest
+Subject: [PATCH] core: spmc: configure SP's NS interrupt action based on=
 the
+ manifest
=20
 Used mandatory ns-interrupts-action SP manifest property to configure
 signaled or queued non-secure interrupt handling.
@@ -17,7 +17,7 @@ Change-Id: I843e69e5dbb9613ecd8b95654e8ca1730a594ca6
  2 files changed, 63 insertions(+), 5 deletions(-)
=20
 diff --git a/core/arch/arm/include/kernel/secure_partition.h b/core/arch=
/arm/include/kernel/secure_partition.h
-index 290750936..3bf339d3c 100644
+index 24b0a8cc07d2..51f6b697e5eb 100644
 --- a/core/arch/arm/include/kernel/secure_partition.h
 +++ b/core/arch/arm/include/kernel/secure_partition.h
 @@ -43,6 +43,8 @@ struct sp_session {
@@ -30,7 +30,7 @@ index 290750936..3bf339d3c 100644
  };
 =20
 diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
-index 52365553b..e54069c17 100644
+index 740be6d22e47..b644e1c72e6a 100644
 --- a/core/arch/arm/kernel/secure_partition.c
 +++ b/core/arch/arm/kernel/secure_partition.c
 @@ -46,6 +46,10 @@
@@ -146,5 +146,3 @@ index 52365553b..e54069c17 100644
  	/* Restore rpc_target_info */
  	thread_get_tsd()->rpc_target_info =3D rpc_target_info;
 =20
---=20
-2.17.1
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb
index 17f2e795..6e1e6ad4 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb
@@ -2,10 +2,13 @@ require recipes-security/optee/optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.18.0:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${P}:"
=20
 SRCREV =3D "1ee647035939e073a2e8dddb727c0f019cc035f1"
 SRC_URI +=3D " \
+    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0002-optee-enable-clang-support.patch \
+    file://0003-core-link-add-no-warn-rwx-segments.patch \
     file://0004-core-Define-section-attributes-for-clang.patch \
     file://0005-core-ldelf-link-add-z-execstack.patch \
     file://0006-arm32-libutils-libutee-ta-add-.note.GNU-stack-sectio.pat=
ch \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
index 590d1327..0f3e58de 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
@@ -2,10 +2,13 @@ require recipes-security/optee/optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.20.0:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${P}:"
=20
 SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
 SRC_URI +=3D " \
+    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0002-optee-enable-clang-support.patch \
+    file://0003-core-link-add-no-warn-rwx-segments.patch \
     file://0004-core-Define-section-attributes-for-clang.patch \
     file://0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch \
     file://0006-core-ffa-add-TOS_FW_CONFIG-handling.patch \
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-allow-s=
etting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/=
optee-os-3.22.0/0001-allow-setting-sysroot-for-libgcc-lookup.patch
index ab4a6dbc..392e8d82 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-allow-setting-=
sysroot-for-libgcc-lookup.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-allow-setting-=
sysroot-for-libgcc-lookup.patch
@@ -1,4 +1,4 @@
-From 528aeb42652a3159c1bfd51d6c1442c3ff27b84c Mon Sep 17 00:00:00 2001
+From 02ea8e616ac615efe3507d627dfba9820d3357f6 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 26 May 2020 14:38:02 -0500
 Subject: [PATCH] allow setting sysroot for libgcc lookup
@@ -9,13 +9,12 @@ otherwise.
=20
 Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  mk/gcc.mk | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..81bfa78a 100644
+index adc77a24f25e..81bfa78ad8d7 100644
 --- a/mk/gcc.mk
 +++ b/mk/gcc.mk
 @@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-core-De=
fine-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee=
/optee-os-3.22.0/0002-core-Define-section-attributes-for-clang.patch
similarity index 96%
rename from meta-arm/recipes-security/optee/optee-os-3.22.0/0001-core-Def=
ine-section-attributes-for-clang.patch
rename to meta-arm/recipes-security/optee/optee-os-3.22.0/0002-core-Defin=
e-section-attributes-for-clang.patch
index 1fcc2fb9..15bdf07d 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.22.0/0001-core-Define-se=
ction-attributes-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0002-core-Define-se=
ction-attributes-for-clang.patch
@@ -1,4 +1,4 @@
-From 2449af30e09e172216ec9aa8b07502ae9ddc0a03 Mon Sep 17 00:00:00 2001
+From 6f588813a170a671ebf1d6b51cebc7bc761295dc Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 21 Dec 2022 10:55:58 +0000
 Subject: [PATCH] core: Define section attributes for clang
@@ -39,7 +39,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 104 insertions(+), 11 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 4487ef026..f36243896 100644
+index 4487ef026df9..f3624389611b 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
 @@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
@@ -76,7 +76,7 @@ index 4487ef026..f36243896 100644
 =20
  #ifdef ARM32
 diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
-index 7e79f780a..ec4db9dc9 100644
+index 7e79f780ad28..ec4db9dc98c5 100644
 --- a/core/arch/arm/mm/core_mmu_lpae.c
 +++ b/core/arch/arm/mm/core_mmu_lpae.c
 @@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
@@ -131,7 +131,7 @@ index 7e79f780a..ec4db9dc9 100644
   * TAs page table entry inside a level 1 page table.
   *
 diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
-index 61e703da8..1960c08ca 100644
+index 61e703da89c8..1960c08ca688 100644
 --- a/core/arch/arm/mm/core_mmu_v7.c
 +++ b/core/arch/arm/mm/core_mmu_v7.c
 @@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
@@ -185,7 +185,7 @@ index 61e703da8..1960c08ca 100644
  struct mmu_partition {
  	l1_xlat_tbl_t *l1_table;
 diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index 79553c6d2..b9efdf427 100644
+index 79553c6d2183..b9efdf42780b 100644
 --- a/core/arch/arm/mm/pgt_cache.c
 +++ b/core/arch/arm/mm/pgt_cache.c
 @@ -410,8 +410,18 @@ void pgt_init(void)
@@ -209,7 +209,7 @@ index 79553c6d2..b9efdf427 100644
 =20
  	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
 diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 2a1f22dce..5516b6771 100644
+index 2a1f22dce635..5516b677141a 100644
 --- a/core/kernel/thread.c
 +++ b/core/kernel/thread.c
 @@ -39,13 +39,24 @@ static uint32_t end_canary_value =3D 0xababab00;
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0002-optee-e=
nable-clang-support.patch b/meta-arm/recipes-security/optee/optee-os-3.22=
.0/0003-optee-enable-clang-support.patch
similarity index 91%
rename from meta-arm/recipes-security/optee/optee-os-3.22.0/0002-optee-en=
able-clang-support.patch
rename to meta-arm/recipes-security/optee/optee-os-3.22.0/0003-optee-enab=
le-clang-support.patch
index af0ec94f..b4ea8ed3 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.22.0/0002-optee-enable-c=
lang-support.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0003-optee-enable-c=
lang-support.patch
@@ -1,4 +1,4 @@
-From 8846ab2b37781364088cc5c02b6bc6f518a66a0a Mon Sep 17 00:00:00 2001
+From 9c55b7a4e39617c2abbf4e0e39fd8041c7b2b9b6 Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
@@ -10,13 +10,12 @@ compiler-rt. This is mitigated by including the varia=
ble as ammended.
 Upstream-Status: Pending
 ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
 Signed-off-by: Brett Warren <brett.warren@arm.com>
-
 ---
  mk/clang.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee..1ebe2f70 100644
+index a045beee8482..1ebe2f702dcd 100644
 --- a/mk/clang.mk
 +++ b/mk/clang.mk
 @@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
diff --git a/meta-arm/recipes-security/optee/optee-os-3.22.0/0003-core-li=
nk-add-no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee=
-os-3.22.0/0004-core-link-add-no-warn-rwx-segments.patch
similarity index 96%
rename from meta-arm/recipes-security/optee/optee-os-3.22.0/0003-core-lin=
k-add-no-warn-rwx-segments.patch
rename to meta-arm/recipes-security/optee/optee-os-3.22.0/0004-core-link-=
add-no-warn-rwx-segments.patch
index 5740461f..d418d461 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.22.0/0003-core-link-add-=
no-warn-rwx-segments.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.22.0/0004-core-link-add-=
no-warn-rwx-segments.patch
@@ -1,4 +1,4 @@
-From 188a39b139e0e2ccceb22bcf63559b451f0483e0 Mon Sep 17 00:00:00 2001
+From 3e191f732b3eba699b91ffd7ffa2ae0787f08947 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Fri, 5 Aug 2022 09:48:03 +0200
 Subject: [PATCH] core: link: add --no-warn-rwx-segments
@@ -18,13 +18,12 @@ Link: https://sourceware.org/bugzilla/show_bug.cgi?id=
=3D29448
 Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
 Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
 Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
 ---
  core/arch/arm/kernel/link.mk | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 0e96e606..3fbcb680 100644
+index 49e9f4fa18a5..9e1cc172fb8a 100644
 --- a/core/arch/arm/kernel/link.mk
 +++ b/core/arch/arm/kernel/link.mk
 @@ -37,6 +37,7 @@ link-ldflags +=3D --sort-section=3Dalignment
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index ad97316b..8e25d361 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -16,12 +16,6 @@ DEPENDS:append:toolchain-clang =3D " compiler-rt"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branch=3Dmaster;protoc=
ol=3Dhttps"
=20
-SRC_URI +=3D " \
-    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0002-optee-enable-clang-support.patch \
-    file://0003-core-link-add-no-warn-rwx-segments.patch \
-   "
-
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
diff --git a/meta-arm/recipes-security/optee/optee-os_3.22.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.22.0.bb
index 7be0c45b..eba2c037 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.22.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.22.0.bb
@@ -2,9 +2,12 @@ require optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.22.0:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${P}:"
=20
 SRCREV =3D "001ace6655dd6bb9cbe31aa31b4ba69746e1a1d9"
 SRC_URI +=3D " \
-    file://0001-core-Define-section-attributes-for-clang.patch \
+    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0002-core-Define-section-attributes-for-clang.patch \
+    file://0003-optee-enable-clang-support.patch \
+    file://0004-core-link-add-no-warn-rwx-segments.patch \
    "
diff --git a/meta-arm/recipes-security/optee/optee-test/Update-arm_ffa_us=
er-driver-dependency.patch b/meta-arm/recipes-security/optee/optee-test/U=
pdate-arm_ffa_user-driver-dependency.patch
deleted file mode 100644
index e889f740..00000000
--- a/meta-arm/recipes-security/optee/optee-test/Update-arm_ffa_user-driv=
er-dependency.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7e15470f3dd45c844f0e0901f0c85c46a0882b8b Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Fri, 3 Mar 2023 12:23:45 +0100
-Subject: [PATCH 1/2] Update arm_ffa_user driver dependency
-
-Updating arm-ffa-user to v5.0.1 to get the following changes:
- - move to 64 bit direct messages
- - add Linux Kernel v6.1 compatibility
-The motivation is to update x-test to depend on the same driver
-version as TS uefi-test and thus to enable running these in a single
-configuration.
-Note: arm_ffa_user.h was copied from:
- - URL:https://git.gitlab.arm.com/linux-arm/linux-trusted-services.git
- - SHA:18e3be71f65a405dfb5d97603ae71b3c11759861
-
-Upstream-Status: Backport
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- host/xtest/include/uapi/linux/arm_ffa_user.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/xtest/include/uapi/linux/arm_ffa_user.h b/host/xtest/i=
nclude/uapi/linux/arm_ffa_user.h
-index 9ef0be3..0acde4f 100644
---- a/host/xtest/include/uapi/linux/arm_ffa_user.h
-+++ b/host/xtest/include/uapi/linux/arm_ffa_user.h
-@@ -33,7 +33,7 @@ struct ffa_ioctl_ep_desc {
-  * @dst_id:	[in] 16-bit ID of destination endpoint.
-  */
- struct ffa_ioctl_msg_args {
--	__u32 args[5];
-+	__u64 args[5];
- 	__u16 dst_id;
- };
- #define FFA_IOC_MSG_SEND	_IOWR(FFA_IOC_MAGIC, FFA_IOC_BASE + 1, \
---=20
-2.39.1.windows.1
-
diff --git a/meta-arm/recipes-security/optee/optee-test/ffa_spmc-Add-arm_=
ffa_user-driver-compatibility-check.patch b/meta-arm/recipes-security/opt=
ee/optee-test/ffa_spmc-Add-arm_ffa_user-driver-compatibility-check.patch
deleted file mode 100644
index d333e860..00000000
--- a/meta-arm/recipes-security/optee/optee-test/ffa_spmc-Add-arm_ffa_use=
r-driver-compatibility-check.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 6734d14cc249af37705129de7874533df9535cd3 Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Fri, 3 Mar 2023 12:25:58 +0100
-Subject: [PATCH 2/2] ffa_spmc: Add arm_ffa_user driver compatibility che=
ck
-
-Check the version of the arm_ffa_user Kernel Driver and fail with a
-meaningful message if incompatible driver is detected.
-
-Upstream-Status: Backport
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- host/xtest/ffa_spmc_1000.c | 68 ++++++++++++++++++++++++++++++++++----
- 1 file changed, 61 insertions(+), 7 deletions(-)
-
-diff --git a/host/xtest/ffa_spmc_1000.c b/host/xtest/ffa_spmc_1000.c
-index 15f4a46..1839d03 100644
---- a/host/xtest/ffa_spmc_1000.c
-+++ b/host/xtest/ffa_spmc_1000.c
-@@ -1,11 +1,12 @@
- // SPDX-License-Identifier: BSD-3-Clause
- /*
-- * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2022-2023, Arm Limited and Contributors. All rights re=
served.
-  */
- #include <fcntl.h>
- #include <ffa.h>
- #include <stdio.h>
- #include <string.h>
-+#include <errno.h>
- #include <sys/ioctl.h>
- #include <unistd.h>
- #include "include/uapi/linux/arm_ffa_user.h"
-@@ -17,6 +18,10 @@
- #define INCORRECT_ENDPOINT_ID 0xffff
- #define NORMAL_WORLD_ENDPOINT_ID	0
-=20
-+#define FFA_USER_REQ_VER_MAJOR 5
-+#define FFA_USER_REQ_VER_MINOR 0
-+#define FFA_USER_REQ_VER_PATCH 1
-+
- /* Get the 32 least significant bits of a handle.*/
- #define MEM_SHARE_HANDLE_LOW(x) ((x) & 0xffffffff)
- /* Get the 32 most significant bits of a handle.*/
-@@ -62,6 +67,50 @@ static struct ffa_ioctl_ep_desc test_endpoint3 =3D {
- 	.uuid_ptr =3D (uint64_t)test_endpoint3_uuid,
- };
-=20
-+static bool check_ffa_user_version(void)
-+{
-+	FILE *f =3D NULL;
-+	int ver_major =3D -1;
-+	int ver_minor =3D -1;
-+	int ver_patch =3D -1;
-+	int scan_cnt =3D 0;
-+
-+	f =3D fopen("/sys/module/arm_ffa_user/version", "r");
-+	if (f) {
-+		scan_cnt =3D fscanf(f, "%d.%d.%d",
-+				  &ver_major, &ver_minor, &ver_patch);
-+		fclose(f);
-+		if (scan_cnt !=3D 3) {
-+			printf("error: failed to parse arm_ffa_user version\n");
-+			return false;
-+		}
-+	} else {
-+		printf("error: failed to read arm_ffa_user module info - %s\n",
-+		       strerror(errno));
-+		return false;
-+	}
-+
-+	if (ver_major !=3D FFA_USER_REQ_VER_MAJOR)
-+		goto err;
-+
-+	if (ver_minor < FFA_USER_REQ_VER_MINOR)
-+		goto err;
-+
-+	if (ver_minor =3D=3D FFA_USER_REQ_VER_MINOR)
-+		if (ver_patch < FFA_USER_REQ_VER_PATCH)
-+			goto err;
-+
-+	return true;
-+
-+err:
-+	printf("error: Incompatible arm_ffa_user driver detected.");
-+	printf("Found v%d.%d.%d wanted >=3D v%d.%d.%d)\n",
-+	       ver_major, ver_minor, ver_patch, FFA_USER_REQ_VER_MAJOR,
-+		   FFA_USER_REQ_VER_MINOR, FFA_USER_REQ_VER_PATCH);
-+
-+	return false;
-+}
-+
- static void close_debugfs(void)
- {
- 	int err =3D 0;
-@@ -76,6 +125,9 @@ static void close_debugfs(void)
-=20
- static bool init_sp_xtest(ADBG_Case_t *c)
- {
-+	if (!check_ffa_user_version())
-+		return false;
-+
- 	if (ffa_fd < 0) {
- 		ffa_fd =3D open(FFA_DRIVER_FS_PATH, O_RDWR);
- 		if (ffa_fd < 0) {
-@@ -83,6 +135,7 @@ static bool init_sp_xtest(ADBG_Case_t *c)
- 			return false;
- 		}
- 	}
-+
- 	return true;
- }
-=20
-@@ -99,7 +152,7 @@ static uint16_t get_endpoint_id(uint64_t endp)
- 	struct ffa_ioctl_ep_desc sid =3D { .uuid_ptr =3D endp };
-=20
- 	/* Get ID of destination SP based on UUID */
--	if(ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
-+	if (ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
- 		return INCORRECT_ENDPOINT_ID;
-=20
- 	return sid.id;
-@@ -213,14 +266,15 @@ static int set_up_mem(struct ffa_ioctl_ep_desc *en=
dp,
- 	rc =3D share_mem(endpoint, handle);
- 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
-=20
--	if (!ADBG_EXPECT_TRUE(c, handle !=3D NULL))
--	     return TEEC_ERROR_GENERIC;
-+	if (!ADBG_EXPECT_NOT_NULL(c, handle))
-+		return TEEC_ERROR_GENERIC;
-=20
- 	/* SP will retrieve the memory region. */
- 	memset(args, 0, sizeof(*args));
- 	args->dst_id =3D endpoint;
- 	args->args[MEM_SHARE_HANDLE_LOW_INDEX] =3D MEM_SHARE_HANDLE_LOW(*handl=
e);
--	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D MEM_SHARE_HANDLE_HIGH(*han=
dle);
-+	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D
-+		MEM_SHARE_HANDLE_HIGH(*handle);
- 	args->args[MEM_SHARE_HANDLE_ENDPOINT_INDEX] =3D NORMAL_WORLD_ENDPOINT_=
ID;
-=20
- 	rc =3D start_sp_test(endpoint, EP_RETRIEVE, args);
-@@ -254,7 +308,7 @@ static void xtest_ffa_spmc_test_1002(ADBG_Case_t *c)
- 	rc =3D start_sp_test(endpoint1_id, EP_TEST_SP, &args);
- 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
- 	if (!ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_O=
K))
--	     goto out;
-+		goto out;
-=20
- 	/* Set up memory and have the SP retrieve it. */
- 	Do_ADBG_BeginSubCase(c, "Test memory set-up");
-@@ -469,7 +523,7 @@ static void xtest_ffa_spmc_test_1005(ADBG_Case_t *c)
- 	memset(&args, 0, sizeof(args));
- 	args.args[1] =3D endpoint2;
- 	args.args[2] =3D endpoint3;
--	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI,&args);
-+	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI, &args);
- 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
- 	ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_OK);
-=20
---=20
-2.39.1.windows.1
-
--=20
2.30.2


