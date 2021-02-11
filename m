Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11124.1613061414406520874
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 08:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E4B71063
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Feb 2021 08:36:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CDDB3F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Feb 2021 08:36:52 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: Fix potential runtime crash
Date: Thu, 11 Feb 2021 11:36:47 -0500
Message-Id: <20210211163647.32239-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

GCCv9 tree vectorization code is faulty and can cause random crashes at
runtime (when using -O3).  Add the backported patch to address this
issue.

Change-Id: If7bb0ba0720bab42e7d34f3679d988934f657392
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-devtools/gcc/gcc-arm-9.2.inc      |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
index 08ad796..6378ecf 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
@@ -68,6 +68,7 @@ SRC_URI = "\
            file://0035-Fix-for-testsuite-failure.patch \
            file://0036-Re-introduce-spe-commandline-options.patch \
            file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \
+           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
 "
 SRC_URI[md5sum] = "9c570fc4286825b4e6f67b3d34aade23"
 
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
new file mode 100644
index 0000000..dc1039d
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
@@ -0,0 +1,119 @@
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=97b668f9a8c6ec565c278a60e7d1492a6932e409]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
+From: Matthias Klose <doko@ubuntu.com>
+Date: Tue, 6 Oct 2020 13:41:37 +0200
+Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
+ VMAT_CONTIGUOUS
+
+This avoids using VMAT_CONTIGUOUS with single-element interleaving
+when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
+continue to avoid load-lanes and gathers.
+
+2020-10-01  Richard Biener  <rguenther@suse.de>
+
+	PR tree-optimization/97236
+	* tree-vect-stmts.c (get_group_load_store_type): Keep
+	VMAT_ELEMENTWISE for single-element vectors.
+
+	* gcc.dg/vect/pr97236.c: New testcase.
+
+(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
+---
+ gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
+ gcc/tree-vect-stmts.c               | 20 ++++++--------
+ 2 files changed, 52 insertions(+), 11 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
+
+diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
+new file mode 100644
+index 000000000000..9d3dc20d953d
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
+@@ -0,0 +1,43 @@
++typedef unsigned char __uint8_t;
++typedef __uint8_t uint8_t;
++typedef struct plane_t {
++  uint8_t *p_pixels;
++  int i_lines;
++  int i_pitch;
++} plane_t;
++
++typedef struct {
++  plane_t p[5];
++} picture_t;
++
++#define N 4
++
++void __attribute__((noipa))
++picture_Clone(picture_t *picture, picture_t *res)
++{
++  for (int i = 0; i < N; i++) {
++    res->p[i].p_pixels = picture->p[i].p_pixels;
++    res->p[i].i_lines = picture->p[i].i_lines;
++    res->p[i].i_pitch = picture->p[i].i_pitch;
++  }
++}
++
++int
++main()
++{
++  picture_t aaa, bbb;
++  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
++
++  for (unsigned i = 0; i < N; i++)
++    aaa.p[i].p_pixels = pixels;
++
++  picture_Clone (&aaa, &bbb);
++
++  uint8_t c = 0;
++  for (unsigned i = 0; i < N; i++)
++    c += bbb.p[i].p_pixels[0];
++
++  if (c != N)
++    __builtin_abort ();
++  return 0;
++}
+diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
+index 507f81b0a0e8..ffbba3441de2 100644
+--- a/gcc/tree-vect-stmts.c
++++ b/gcc/tree-vect-stmts.c
+@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
+ 	  /* First cope with the degenerate case of a single-element
+ 	     vector.  */
+ 	  if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
+-	    *memory_access_type = VMAT_CONTIGUOUS;
++	    ;
+ 
+ 	  /* Otherwise try using LOAD/STORE_LANES.  */
+-	  if (*memory_access_type == VMAT_ELEMENTWISE
+-	      && (vls_type == VLS_LOAD
+-		  ? vect_load_lanes_supported (vectype, group_size, masked_p)
+-		  : vect_store_lanes_supported (vectype, group_size,
+-						masked_p)))
++	  else if (vls_type == VLS_LOAD
++		   ? vect_load_lanes_supported (vectype, group_size, masked_p)
++		   : vect_store_lanes_supported (vectype, group_size,
++						 masked_p))
+ 	    {
+ 	      *memory_access_type = VMAT_LOAD_STORE_LANES;
+ 	      overrun_p = would_overrun_p;
+ 	    }
+ 
+ 	  /* If that fails, try using permuting loads.  */
+-	  if (*memory_access_type == VMAT_ELEMENTWISE
+-	      && (vls_type == VLS_LOAD
+-		  ? vect_grouped_load_supported (vectype, single_element_p,
+-						 group_size)
+-		  : vect_grouped_store_supported (vectype, group_size)))
++	  else if (vls_type == VLS_LOAD
++		   ? vect_grouped_load_supported (vectype, single_element_p,
++						  group_size)
++		   : vect_grouped_store_supported (vectype, group_size))
+ 	    {
+ 	      *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
+ 	      overrun_p = would_overrun_p;
+-- 
+2.20.1
+
-- 
2.17.1

