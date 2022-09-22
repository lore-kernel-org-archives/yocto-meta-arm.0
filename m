Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF2BECAAD8
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 00:54:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.1995.1663808053316412882
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H130CuQz;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id u132so7706443pfc.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 17:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=KGK2mHsZko8gHSfh0YW8ApMH856EYrsvY1M8bgpzphw=;
        b=H130CuQzvRdl1kY/6Jn/PhB+L8RLd4uQcC6GOF73qd0GyyprnUxRzPfZUNm9R4csbo
         5w9xU4dr8I34Kxs9ADFV43Zai+X6MQJZ+C39cFeVS63TPUJh0AtoUp5kPXtq6aJGiBzJ
         A/36z5LS99HWj0muKkw5fG33X/45T1fftoyILwNOi3oJZ8x5Xp/dYniLCnyE7u+IZEG3
         zFTqatd3ycdb5lnDdOVjDB2T6hvPSQ7WF7b+Nr6HrRRXxWn5Qs8Kx2BW1GzPlw6xsTwU
         2tqvLAkgW5t2vgLfhCO+P5Ap6ResN9MVtMnZRVe5T4Ao9Z9xlMkXM9sb52XPJeo6Zgm1
         iPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=KGK2mHsZko8gHSfh0YW8ApMH856EYrsvY1M8bgpzphw=;
        b=ZWF6/dn/NM2RVeST9otffKPA6BvnZlXfxmQ5HQFkr5Zd1z/yXlNMI+ObDetjXeW8lp
         U4MfZ0XZZkXl/8yFHOnN5OzMtyVquUIewpdkixDMJVhHv8CqsACg0WqjMG+WAD7R8KFT
         NuQ+QyoAGKXsGiSHC5pOCKotsoKmHU6xPDXKs3LyVf3foJAPbH4nauWRw7SO9AnMQbGw
         23q/PCt3B8VXRw3rFuQJciKOt6lpyNzQlRjXBfVoDyKBotnffv2OHrDLQacc4cZwi4o5
         M69f758ILPx3tIscjcKHI8wNtJ1LaiYI3NmtkFUQsS3eYhSuNrTOayQy8hPqnsN7UGZS
         FH9w==
X-Gm-Message-State: ACrzQf1IYwQAl18hao/30hxUn/jMXL7L3/MXpFkhclQRTb3GRWLyLnZG
	PdL486tmR2AzRwwM71jJoZTt/BiH2wCo4w==
X-Google-Smtp-Source: 
 AMsMyM7ardpzTxb6dTyHQ/SlRoEsqaU4k9fX0tOomfZiuI1belXjePc8I1Hb5q/yNEGH1+7deGLn+Q==
X-Received: by 2002:aa7:8c4e:0:b0:54e:fa98:5031 with SMTP id
 e14-20020aa78c4e000000b0054efa985031mr893740pfd.44.1663808052449;
        Wed, 21 Sep 2022 17:54:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 u9-20020a1709026e0900b00176953f7997sm476597plk.158.2022.09.21.17.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 17:54:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/4] optee-os: Extend clang pragma fixes to core_mmu_v7.c
 for 3.18
Date: Wed, 21 Sep 2022 17:54:06 -0700
Message-Id: <20220922005409.3378701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 00:54:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3804

3.18 builds are failing since the section stuff is also done in
core_mmu_v7.c therefore extend the patch to include this file as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 ...-Define-section-attributes-for-clang.patch | 120 +++++++++---------
 1 file changed, 59 insertions(+), 61 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
index d30fa5a..a69d777 100644
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
  
@@ -230,3 +176,55 @@ index 18d34e6a..086129e2 100644
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
-- 
2.37.3


