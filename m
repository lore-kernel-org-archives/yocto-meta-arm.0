Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0702FC32771
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 01:21:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.2254.1663809657594818248
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 18:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UMd/f84i;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id u132so7756669pfc.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 18:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+Tj3ds0aM9gMyYXsTePpeWqE7WC0+fyXWfrelgupyhs=;
        b=UMd/f84iFQS38ADpOkvYhZUCMLRDY54yh39SDeoMpGOSoBsPxpm6/irW2WVF7bUGti
         Wy3lnvgine8N2x5gFQV03Dv8GS5J1efvFEuK9QxzK8LWGgVQ9lrZVEUCUfYa+xd6hU4F
         PGZOzO48w1eVVG2oWP5gGIYwZWC2aAxLa1QEnTrCMP4Dh+NA32zUOlgkvbaVsSxHW83q
         t+aGQuagSQqDlEwk6VlrqgbAGFOK9qQOkZYiBV7pjcgvByLMYoCYlr9A/IZZ05AKJkEm
         U0B0VJTcQfrhEsOqRAxflaDoQe6Gf0+XRlLeYAAoAjpN071CHDmiPxz0VQLTLR9sgJfk
         2XAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+Tj3ds0aM9gMyYXsTePpeWqE7WC0+fyXWfrelgupyhs=;
        b=BexlfGM/UHPdPlLi2kJ8G53tK+vvhupyZdd2Wtf1/ZIbFTH3Yg2gjuqrr5XtGa4ap/
         RaK7EsKG7o1StfD2mO99Sv9VXW4PNAnMRy3ZnMDVRlAqghiIQs+DJWbeJodC9pefOqEO
         SEKp8PI9rkbHcdhPaHnliGxuevLKIMwXjSHvRbmZGzagxFbgD6QauLaDpLDvpZDmaGWf
         2QLx9UHh6evxvzt7zxy30k4k48JL8bv5JTjq55swoh1WmAS+PwW/BFYpiiNotmxVmp7J
         8kpsSmzymMJ98RrbWO/ue/ubppQadCK6GAR3Ue7rD5ONeNoPtEwu5upSNiifLuQOWrFQ
         KJxw==
X-Gm-Message-State: ACrzQf2Idqtf0TNjp+1wrktV3NFxKqk3jAqcgh0elejJEthdUIKmT8f4
	tMarXgxArHUz3l1ZMG5QEkCz8DHZVD20eA==
X-Google-Smtp-Source: 
 AMsMyM7a/kLfHC2J/ZX6euC25/Uworc7e44Q1XDaHM6Psqxr+O+5MLBPxjb1BfC1ov23lQ/tI4jkvg==
X-Received: by 2002:a05:6a00:17a1:b0:542:be09:7b23 with SMTP id
 s33-20020a056a0017a100b00542be097b23mr1088048pfg.12.1663809656727;
        Wed, 21 Sep 2022 18:20:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a170902c94300b00176acd80f69sm2688357pla.102.2022.09.21.18.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 18:20:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] optee-os: Extend clang pragma fixes to core_mmu_v7.c for
 3.18
Date: Wed, 21 Sep 2022 18:20:53 -0700
Message-Id: <20220922012053.3403697-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 01:21:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3808

3.18 builds are failing since the section stuff is also done in
core_mmu_v7.c therefore extend the patch to include this file as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: rebase
v3: rebase again to include the v7 patchlet

 ...-Define-section-attributes-for-clang.patch | 165 +++++++++++-------
 1 file changed, 104 insertions(+), 61 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
index d30fa5a..0659b03 100644
--- a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
@@ -1,4 +1,4 @@
-From 4ff172196d399217992110a47312c626954a844c Mon Sep 17 00:00:00 2001
+From f189457b79989543f65b8a4e8729eff2cdf9a758 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Aug 2022 19:24:55 -0700
 Subject: [PATCH] core: Define section attributes for clang
@@ -30,20 +30,16 @@ going and match the functionality with gcc.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
  core/arch/arm/mm/core_mmu_lpae.c | 35 ++++++++++++++++++++++++++++----
- core/arch/arm/mm/core_mmu_v7.c   | 27 +++++++++++++++++++++---
  core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
  core/kernel/thread.c             | 13 +++++++++++-
- 5 files changed, 95 insertions(+), 11 deletions(-)
+ 4 files changed, 71 insertions(+), 8 deletions(-)
 
-diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
-index f083b159..432983c8 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
-@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
+@@ -44,16 +44,31 @@ static size_t thread_user_kcode_size __n
  #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
  	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
  long thread_user_kdata_sp_offset __nex_bss;
@@ -66,18 +62,17 @@ index f083b159..432983c8 100644
 -	__section(".nex_nozi.kdata_page");
 +	__section(".nex_nozi.kdata_page")
  #endif
-+#endif
+ #endif
 +    ;
 +#endif
 +
 +/* reset BSS section to default ( .bss ) */
 +#ifdef __clang__
 +#pragma clang section bss=""
- #endif
++#endif
  
  #ifdef ARM32
-diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mmu_lpae.c
-index 3f08eec6..e6dc9261 100644
+ uint32_t __nostackcheck thread_get_exceptions(void)
 --- a/core/arch/arm/mm/core_mmu_lpae.c
 +++ b/core/arch/arm/mm/core_mmu_lpae.c
 @@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
@@ -131,53 +126,6 @@ index 3f08eec6..e6dc9261 100644
  /*
   * TAs page table entry inside a level 1 page table.
   *
-diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_v7.c
-index cd85bd22..ee78e6ee 100644
---- a/core/arch/arm/mm/core_mmu_v7.c
-+++ b/core/arch/arm/mm/core_mmu_v7.c
-@@ -204,16 +204,37 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
- typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
- typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
- 
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l1"
-+#endif
- static l1_xlat_tbl_t main_mmu_l1_ttb
--		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
-+		__aligned(L1_ALIGNMENT)
-+#ifndef __clang__
-+	__section(".nozi.mmu.l1")
-+#endif
-+;
- 
- /* L2 MMU tables */
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l2"
-+#endif
- static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
--		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
-+		__aligned(L2_ALIGNMENT)
-+#ifndef __clang__
-+	__section(".nozi.mmu.l2")
-+#endif
-+;
- 
- /* MMU L1 table for TAs, one for each thread */
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.ul1"
-+#endif
- static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
--		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
-+		__aligned(UL1_ALIGNMENT)
-+#ifndef __clang__
-+	__section(".nozi.mmu.ul1")
-+#endif
-+;
- 
- struct mmu_partition {
- 	l1_xlat_tbl_t *l1_table;
-diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index dee1d207..382cae1c 100644
 --- a/core/arch/arm/mm/pgt_cache.c
 +++ b/core/arch/arm/mm/pgt_cache.c
 @@ -104,8 +104,18 @@ void pgt_init(void)
@@ -200,11 +148,9 @@ index dee1d207..382cae1c 100644
  	size_t n;
  
  	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
-diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 18d34e6a..086129e2 100644
 --- a/core/kernel/thread.c
 +++ b/core/kernel/thread.c
-@@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_CORE_NB_CORE] __nex_bss;
+@@ -37,13 +37,24 @@ struct thread_core_local thread_core_loc
  	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
  #endif
  
@@ -230,3 +176,100 @@ index 18d34e6a..086129e2 100644
  #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
  
  DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
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
++diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_v7.c
++index cd85bd22..ee78e6ee 100644
++--- a/core/arch/arm/mm/core_mmu_v7.c
+++++ b/core/arch/arm/mm/core_mmu_v7.c
++@@ -204,16 +204,37 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
++ typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
++ typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
++ 
+++#ifdef __clang__
+++#pragma clang section bss=".nozi.mmu.l1"
+++#endif
++ static l1_xlat_tbl_t main_mmu_l1_ttb
++-		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
+++		__aligned(L1_ALIGNMENT)
+++#ifndef __clang__
+++	__section(".nozi.mmu.l1")
+++#endif
+++;
++ 
++ /* L2 MMU tables */
+++#ifdef __clang__
+++#pragma clang section bss=".nozi.mmu.l2"
+++#endif
++ static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
++-		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
+++		__aligned(L2_ALIGNMENT)
+++#ifndef __clang__
+++	__section(".nozi.mmu.l2")
+++#endif
+++;
++ 
++ /* MMU L1 table for TAs, one for each thread */
+++#ifdef __clang__
+++#pragma clang section bss=".nozi.mmu.ul1"
+++#endif
++ static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
++-		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
+++		__aligned(UL1_ALIGNMENT)
+++#ifndef __clang__
+++	__section(".nozi.mmu.ul1")
+++#endif
+++;
++ 
++ struct mmu_partition {
++ 	l1_xlat_tbl_t *l1_table;
-- 
2.37.3


