Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9109.1608027370847806362
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 02:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F42731B
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 02:16:10 -0800 (PST)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9DCA3F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 02:16:09 -0800 (PST)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 2/2] arm/trusted-firmware-a: -Wtautological triggers removed
Date: Tue, 15 Dec 2020 10:16:04 +0000
Message-Id: <20201215101604.29534-2-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215101604.29534-1-brett.warren@arm.com>
References: <20201215101604.29534-1-brett.warren@arm.com>

When compiling under clang, certain lines triggered
-Wtautological errors. Cosmetic modifications were made
via patches to mitigate this.

Change-Id: I3d17dd5102267e03a8b7d157e66e0788b542bdd8
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 ...-PMF_STOTE_ENABLE-pass-Wtautological.patch | 31 +++++++++++++++++++
 ...tables-v2-remove-tautological-assert.patch | 31 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  5 +++
 3 files changed, 67 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0003-xlat-tables-v2-remove-tautological-assert.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch
new file mode 100644
index 0000000..42e0f5b
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch
@@ -0,0 +1,31 @@
+From c9209fa0f474d41bc5ecf2b988ab404123038c1b Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Tue, 3 Nov 2020 13:34:26 +0000
+Subject: [PATCH] pmf.h: made PMF_STOTE_ENABLE pass -Wtautological
+
+When compiling with clang, PMF_STORE_ENABLE triggers
+-Wtautological-constant-compare. To mitigate, the definition
+is modified cosmetically to not trigger this error.
+
+Upstream-Status: Pending
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ include/lib/pmf/pmf.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/lib/pmf/pmf.h b/include/lib/pmf/pmf.h
+index df7c9ff31..baa2dfd60 100644
+--- a/include/lib/pmf/pmf.h
++++ b/include/lib/pmf/pmf.h
+@@ -25,7 +25,7 @@
+ /*
+  * Flags passed to PMF_REGISTER_SERVICE
+  */
+-#define PMF_STORE_ENABLE	(1 << 0)
++#define PMF_STORE_ENABLE	1
+ #define PMF_DUMP_ENABLE		(1 << 1)
+ 
+ /*
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0003-xlat-tables-v2-remove-tautological-assert.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0003-xlat-tables-v2-remove-tautological-assert.patch
new file mode 100644
index 0000000..c24b1cf
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0003-xlat-tables-v2-remove-tautological-assert.patch
@@ -0,0 +1,31 @@
+From a0b72074ee4cfdf0ff3b807b01a962898761def4 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Fri, 27 Nov 2020 10:29:48 +0000
+Subject: [PATCH] xlat_tables_v2: remove tautological assert
+
+When compiling with clang for aarch32, an assert triggered
+-Wtautological error. This assertion is removed, as
+this means there is no way for it to resolve as false anyway.
+
+Upstream-Status: Pending
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ lib/xlat_tables_v2/aarch32/xlat_tables_arch.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c b/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
+index b69c6702b..52a75b37a 100644
+--- a/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
++++ b/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
+@@ -203,8 +203,6 @@ void setup_mmu_cfg(uint64_t *params, unsigned int flags,
+ 
+ 		assert(virtual_addr_space_size >=
+ 			xlat_get_min_virt_addr_space_size());
+-		assert(virtual_addr_space_size <=
+-			MAX_VIRT_ADDR_SPACE_SIZE);
+ 		assert(IS_POWER_OF_TWO(virtual_addr_space_size));
+ 
+ 		/*
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index bed2bad..680313a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -48,6 +48,11 @@ LIC_FILES_CHKSUM_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILE
 # add mbed TLS to version
 SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
 
+SRC_URI_append = " \
+    file://0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch  \
+    file://0003-xlat-tables-v2-remove-tautological-assert.patch \
+    "
+
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin file
 TFA_UBOOT ?= "0"
-- 
2.17.1

