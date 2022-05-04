Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD582C43219
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.625.1651683512293632214
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E16AD1042;
	Wed,  4 May 2022 09:58:31 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35CB33FA27;
	Wed,  4 May 2022 09:58:31 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 04/10] arm-bsp/hafnium: TC: update SHA and remove upstreamed
 patches
Date: Wed,  4 May 2022 17:58:14 +0100
Message-Id: <20220504165820.882784-4-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3360

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I33a7cc01040c6a2392d87763da9c0adc0c5bbe2d
---
 ...-if-start-address-exceeds-page-table.patch |  36 ----
 .../0002-Extend-Stage-1-mapping-limit.patch   | 197 ------------------
 .../recipes-bsp/hafnium/hafnium-tc.inc        |  13 +-
 3 files changed, 9 insertions(+), 237 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-fix-fa=
il-mapping-if-start-address-exceeds-page-table.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Extend=
-Stage-1-mapping-limit.patch

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-fix-fail-mapp=
ing-if-start-address-exceeds-page-table.patch b/meta-arm-bsp/recipes-bsp/=
hafnium/files/tc/0001-fix-fail-mapping-if-start-address-exceeds-page-tabl=
e.patch
deleted file mode 100644
index 79aee241..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-fix-fail-mapping-if-=
start-address-exceeds-page-table.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From dace8802ae6332eb4ca29faf288b96c83fadb2ae Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Tue, 28 Sep 2021 11:22:27 +0100
-Subject: [PATCH 1/2] fix: fail mapping if start address exceeds page tab=
le
- mapping limit
-
-Currently the end address is capped to stay within bounds of page
-table range. If in case the start address is beyond bounds of
-page table then no mapping is made but the mm_map_root incorrectly
-returns success.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I858ac653aafff62e9a2cf5771a32dc38690cd899
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- src/mm.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/mm.c b/src/mm.c
-index 6f15748..c57e24e 100644
---- a/src/mm.c
-+++ b/src/mm.c
-@@ -472,6 +472,10 @@ static bool mm_ptable_identity_map(struct mm_ptable=
 *t, paddr_t pa_begin,
- 	 */
- 	CHECK(root_level >=3D 2);
-=20
-+	if (begin >=3D ptable_end) {
-+		return false;
-+	}
-+
- 	/* Cap end to stay within the bounds of the page table. */
- 	if (end > ptable_end) {
- 		end =3D ptable_end;
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Extend-Stage-=
1-mapping-limit.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Ex=
tend-Stage-1-mapping-limit.patch
deleted file mode 100644
index 8493310d..00000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Extend-Stage-1-mappi=
ng-limit.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From 45187e2f9c73ea96e69d1f46f0c24ff31d7f9298 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Tue, 28 Sep 2021 11:25:25 +0100
-Subject: [PATCH 2/2] Extend Stage 1 mapping limit
-
-As Stage 1 mappings are limited to 512GB, registering FF-A RxTx buffers
-fails when the physical address of these buffers exceeds 512GB. This
-fix removes the limitation and allows Stage 1 mapping up to the
-supported PA range.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I4cb8d68fc18e0edf4a7ee06ae636849d552d72a9
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- inc/hf/arch/mm.h      |  7 ++++++-
- src/arch/aarch64/mm.c | 38 ++++++++++++++++++++++++++------------
- src/arch/fake/mm.c    |  9 +++++++--
- src/mm.c              |  8 +++++++-
- 4 files changed, 46 insertions(+), 16 deletions(-)
-
-diff --git a/inc/hf/arch/mm.h b/inc/hf/arch/mm.h
-index ef64dd3..d277369 100644
---- a/inc/hf/arch/mm.h
-+++ b/inc/hf/arch/mm.h
-@@ -162,7 +162,12 @@ uint32_t arch_mm_stage1_attrs_to_mode(uint64_t attr=
s);
- /**
-  * Initializes the arch specific memory management.
-  */
--bool arch_mm_init(paddr_t table);
-+bool arch_mm_init(void);
-+
-+/**
-+ * Set ptable base address.
-+ */
-+void arch_mm_set_ptable(paddr_t table);
-=20
- /**
-  * Return the arch specific mm mode for send/recv pages of given VM ID.
-diff --git a/src/arch/aarch64/mm.c b/src/arch/aarch64/mm.c
-index 7256c28..0ee0bb6 100644
---- a/src/arch/aarch64/mm.c
-+++ b/src/arch/aarch64/mm.c
-@@ -141,6 +141,7 @@ struct arch_mm_config {
- 	uintreg_t hcr_el2;
- } arch_mm_config;
-=20
-+static uint8_t mm_s1_max_level;
- static uint8_t mm_s2_max_level;
- static uint8_t mm_s2_root_table_count;
-=20
-@@ -676,12 +677,7 @@ uint32_t arch_mm_stage2_attrs_to_mode(uint64_t attr=
s)
-=20
- uint8_t arch_mm_stage1_max_level(void)
- {
--	/*
--	 * For stage 1 we hard-code this to 2 for now so that we can
--	 * save one page table level at the expense of limiting the
--	 * physical memory to 512GB.
--	 */
--	return 2;
-+	return mm_s1_max_level;
- }
-=20
- uint8_t arch_mm_stage2_max_level(void)
-@@ -735,10 +731,16 @@ uint64_t arch_mm_combine_table_entry_attrs(uint64_=
t table_attrs,
- 	return block_attrs;
- }
-=20
-+void
-+arch_mm_set_ptable(paddr_t table)
-+{
-+	arch_mm_config.ttbr0_el2 =3D pa_addr(table);
-+}
-+
- /**
-  * This is called early in initialization without MMU or caches enabled=
.
-  */
--bool arch_mm_init(paddr_t table)
-+bool arch_mm_init(void)
- {
- 	static const int pa_bits_table[16] =3D {32, 36, 40, 42, 44, 48};
- 	uint64_t features =3D read_msr(id_aa64mmfr0_el1);
-@@ -784,6 +786,13 @@ bool arch_mm_init(paddr_t table)
- 		mm_s2_max_level =3D 1;
- 	}
-=20
-+	if (pa_bits >=3D 40) {
-+		mm_s1_max_level =3D 3;
-+	} else {
-+		/* Setting to 2 covers physical memory upto 512GB */
-+		mm_s1_max_level =3D 2;
-+	}
-+
- 	/*
- 	 * Since the shallowest possible tree is used, the maximum number of
- 	 * concatenated tables must be used. This means if no more than 4 bits
-@@ -800,6 +809,10 @@ bool arch_mm_init(paddr_t table)
- 		"Stage 2 has %d page table levels with %d pages at the root.\n",
- 		mm_s2_max_level + 1, mm_s2_root_table_count);
-=20
-+	dlog_info("Stage 1 has %d page table levels with %d pages at the "
-+		  "root.\n", mm_s1_max_level + 1,
-+		  arch_mm_stage1_root_table_count());
-+
- 	/*
- 	 * If the PE implements S-EL2 then VTCR_EL2.NSA/NSW bits are significa=
nt
- 	 * in secure state. In non-secure state, NSA/NSW behave as if set to
-@@ -818,8 +831,6 @@ bool arch_mm_init(paddr_t table)
- 	}
-=20
- 	arch_mm_config =3D (struct arch_mm_config){
--		.ttbr0_el2 =3D pa_addr(table),
--
- 		.vtcr_el2 =3D
- 			(1U << 31) |		   /* RES1. */
- 			(nsa_nsw << 29) |	   /* NSA/NSW. */
-@@ -879,14 +890,16 @@ bool arch_mm_init(paddr_t table)
- 			 << 24) | /* IRGN1, normal mem, WB RA WA Cacheable. */
- 			(1UL << 23) | /* EPD1 - Disable TTBR1_EL2 translation */
- 			(0UL << 22) | /* TTBR0_EL2.ASID defines ASID */
--			(25UL << 16) | /* T1SZ, input address is 2^39 bytes. */
-+			((64 - pa_bits) << 16) | /* T1SZ, input address is *
-+						    2^pa_bits bytes. */
- 			(0UL << 14) |  /* TG0, granule size, 4KB. */
- 			(3UL << 12) |  /* SH0, inner shareable. */
- 			(1UL
- 			 << 10) | /* ORGN0, normal mem, WB RA WA Cacheable. */
- 			(1UL
- 			 << 8) | /* IRGN0, normal mem, WB RA WA Cacheable. */
--			(25UL << 0) | /* T0SZ, input address is 2^39 bytes. */
-+			((64 - pa_bits) << 0) | /* T0SZ, input address is *
-+						   2^pa_bits bytes. */
- 			0;
- 	} else {
- 		arch_mm_config.tcr_el2 =3D
-@@ -896,7 +909,8 @@ bool arch_mm_init(paddr_t table)
- 			(3 << 12) |		   /* SH0, inner shareable. */
- 			(1 << 10) | /* ORGN0, normal mem, WB RA WA Cacheable. */
- 			(1 << 8) |  /* IRGN0, normal mem, WB RA WA Cacheable. */
--			(25 << 0) | /* T0SZ, input address is 2^39 bytes. */
-+			((64 - pa_bits) << 0) | /* T0SZ, input address is *
-+						   2^pa_bits bytes. */
- 			0;
- 	}
- 	return true;
-diff --git a/src/arch/fake/mm.c b/src/arch/fake/mm.c
-index e06a8b7..8ac63fa 100644
---- a/src/arch/fake/mm.c
-+++ b/src/arch/fake/mm.c
-@@ -161,13 +161,18 @@ uint32_t arch_mm_stage1_attrs_to_mode(uint64_t att=
rs)
- 	return attrs >> PTE_ATTR_MODE_SHIFT;
- }
-=20
--bool arch_mm_init(paddr_t table)
-+bool arch_mm_init(void)
- {
- 	/* No initialization required. */
--	(void)table;
- 	return true;
- }
-=20
-+void arch_mm_set_ptable(paddr_t table)
-+{
-+	/* No initialization required. */
-+	(void)table;
-+}
-+
- uint32_t arch_mm_extra_attributes_from_vm(ffa_vm_id_t id)
- {
- 	(void)id;
-diff --git a/src/mm.c b/src/mm.c
-index c57e24e..aa0c512 100644
---- a/src/mm.c
-+++ b/src/mm.c
-@@ -1114,6 +1114,10 @@ bool mm_init(struct mpool *ppool)
- 	dlog_info("data: %#x - %#x\n", pa_addr(layout_data_begin()),
- 		  pa_addr(layout_data_end()));
-=20
-+	if (!arch_mm_init()) {
-+		return false;
-+	}
-+
- 	/* ASID 0 is reserved for use by the hypervisor. */
- 	if (!mm_ptable_init(&ptable, 0, MM_FLAG_STAGE1, ppool)) {
- 		dlog_error("Unable to allocate memory for page table.\n");
-@@ -1133,5 +1137,7 @@ bool mm_init(struct mpool *ppool)
- 	mm_identity_map(stage1_locked, layout_data_begin(), layout_data_end(),
- 			MM_MODE_R | MM_MODE_W, ppool);
-=20
--	return arch_mm_init(ptable.root);
-+	arch_mm_set_ptable(ptable.root);
-+
-+	return true;
- }
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index 27f77773..14330856 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -3,8 +3,13 @@
 COMPATIBLE_MACHINE =3D "(tc?)"
 HAFNIUM_PLATFORM =3D "secure_tc"
=20
+SRCREV =3D "4eb7b54348234d7f4bbac64bac28f683d6574ba9"
 FILESEXTRAPATHS:prepend:tc :=3D "${THISDIR}/files/tc:"
-SRC_URI:append =3D " \
-		file://0001-fix-fail-mapping-if-start-address-exceeds-page-table.patch=
 \
-		file://0002-Extend-Stage-1-mapping-limit.patch \
-		 "
+
+SRC_URI:remove =3D " \
+    file://host-ld.patch \
+    file://native-dtc.patch"
+
+do_compile() {
+    PATH=3D"${S}/prebuilts/linux-x64/clang/bin:$PATH" oe_runmake -C ${S}
+}
--=20
2.30.2


