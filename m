Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D87BECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 04:29:37 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3957.1662956974249677246
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 21:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KV4qvGMX;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id y136so7452978pfb.3
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 21:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=au6UPRM446KDrS3smLaLPq2r6AyBY69lKzxYJkk5c+o=;
        b=KV4qvGMXiE1zTclLJbkFe2CK2TO3RamH1TNgxEB3Hww6gveNXyH/YYWA0jx0oVRmA2
         SEDFudr1kHXhQMBTCdFg6VPR+ASq0xMZKGQN1W/SkBfc3tW8sLX0oJFPwJMmlrXx5yk/
         mZejIl/PZXu/mNB/G5klVw6XDi0rhuy1+9xZzqD+huFQQx/C9neKH/53eanP+VbgRkYF
         TBsZwNZVpphYZ9HOGwJv1fHTKU+V4Q8feojRK9RFtPUgdGF8IReKJQrHXBk6riV0BU6o
         lOoCNAqtmX0nkwP2rigoQ+maLEHeSGEJNPw5Tb5ESKi69etDwfhhlJBjeQRMreIiCMWQ
         txqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=au6UPRM446KDrS3smLaLPq2r6AyBY69lKzxYJkk5c+o=;
        b=OwbeYLnOQnbXNKk+GIJB+uIEptPaGNKRDZHWUy8BX2vzbiM1yWbctQI36iYGGYFGiE
         QYMAC9iDweGdpmqovoJL8z5KQTX+dbxsTgo3WquqT+TXsN2QqG6KoaLTzpFkKrEFv53d
         qZxcYjTTeY4wD0wS+siE2B4vz0rQ8Khx9nUvG0rPyq9zY8ySLWsL6NSN4HhEGh/+ttko
         0CYIwS0Iloz7y2gjHTvMYNwt9T5UNWc8Z5yRQirsdpUW7XxuWYm4vYH5O+7Fu64k67ar
         XekJ+hmv/EBDRPB0ZM+vTFQdeOeZOSpumRg5hB3aKZuYfg59uViItoii7FhS7N9Bcdvx
         EFXw==
X-Gm-Message-State: ACgBeo0mDxgfzbBa/pXvuDiGWGIE2qGciMwIl7meIlWXFQ/21BtrmfCI
	76XyTbo4VK0lEx8ZCjMlkFVIwrvW/aJxaQ==
X-Google-Smtp-Source: 
 AA6agR7SPpWdXn4RsGym6XgqjyxlVAeZ2dI/mzSsNJ1TwMxfbuXliaLfjw3I/u4nDsQ77Z9tNeLnzQ==
X-Received: by 2002:a63:485c:0:b0:42a:ad58:9599 with SMTP id
 x28-20020a63485c000000b0042aad589599mr21391442pgk.565.1662956973195;
        Sun, 11 Sep 2022 21:29:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 g12-20020aa79f0c000000b005380c555ba1sm4311351pfr.13.2022.09.11.21.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 21:29:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-os: Extend clang pragma fixes to core_mmu_v7.c for 3.18
Date: Sun, 11 Sep 2022 21:28:54 -0700
Message-Id: <20220912042854.1958192-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Sep 2022 04:29:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3765

3.18 builds are failing since the section stuff is also done in
core_mmu_v7.c therefore extend the patch to include this file as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Define-section-attributes-for-clang.patch | 74 +++++++++++++++----
 1 file changed, 58 insertions(+), 16 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
index db88e7f..a69d777 100644
--- a/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0001-core-Define-section-attributes-for-clang.patch
@@ -37,11 +37,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  core/kernel/thread.c             | 13 +++++++++++-
  4 files changed, 71 insertions(+), 8 deletions(-)
 
-diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
-index f083b159e..432983c86 100644
 --- a/core/arch/arm/kernel/thread.c
 +++ b/core/arch/arm/kernel/thread.c
-@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
+@@ -44,16 +44,31 @@ static size_t thread_user_kcode_size __n
  #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
  	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
  long thread_user_kdata_sp_offset __nex_bss;
@@ -64,21 +62,20 @@ index f083b159e..432983c86 100644
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
-index 19cd7b61b..78f5910c5 100644
+ uint32_t __nostackcheck thread_get_exceptions(void)
 --- a/core/arch/arm/mm/core_mmu_lpae.c
 +++ b/core/arch/arm/mm/core_mmu_lpae.c
-@@ -230,19 +230,46 @@ typedef uint16_t l1_idx_t;
+@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
  typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
  typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
  
@@ -129,8 +126,6 @@ index 19cd7b61b..78f5910c5 100644
  /*
   * TAs page table entry inside a level 1 page table.
   *
-diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index d658b3e68..6c36706c0 100644
 --- a/core/arch/arm/mm/pgt_cache.c
 +++ b/core/arch/arm/mm/pgt_cache.c
 @@ -104,8 +104,18 @@ void pgt_init(void)
@@ -153,11 +148,9 @@ index d658b3e68..6c36706c0 100644
  	size_t n;
  
  	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
-diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 18d34e6ad..086129e28 100644
 --- a/core/kernel/thread.c
 +++ b/core/kernel/thread.c
-@@ -37,13 +37,24 @@ struct thread_core_local thread_core_local[CFG_TEE_CORE_NB_CORE] __nex_bss;
+@@ -37,13 +37,24 @@ struct thread_core_local thread_core_loc
  	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
  #endif
  
@@ -183,6 +176,55 @@ index 18d34e6ad..086129e28 100644
  #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
  
  DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE,
--- 
-2.37.2
-
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


