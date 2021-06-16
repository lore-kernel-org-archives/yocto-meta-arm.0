Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8138.1623852808610897789
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 07:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 674D931B
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:13:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1105A3F719
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:13:26 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/trusted-firmware-a: drop clang tweaks
Date: Wed, 16 Jun 2021 15:13:22 +0100
Message-Id: <20210616141324.346056-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These Clang patches don't appear to be needed anymore.  TF-A doesn't
build for various platforms but the unusual errors these patches work
around are not the cause.

Change-Id: I41dffc4f19d298d5861bb0274e6ffef6c24f4ca3
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-PMF_STOTE_ENABLE-pass-Wtautological.patch | 31 -------------------
 ...tables-v2-remove-tautological-assert.patch | 31 -------------------
 .../trusted-firmware-a/trusted-firmware-a.inc |  5 ---
 3 files changed, 67 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0002-pm=
f.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0003-xl=
at-tables-v2-remove-tautological-assert.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-pmf.h-mad=
e-PMF_STOTE_ENABLE-pass-Wtautological.patch b/meta-arm/recipes-bsp/truste=
d-firmware-a/files/0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.pa=
tch
deleted file mode 100644
index 42e0f5b..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-pmf.h-made-PMF_S=
TOTE_ENABLE-pass-Wtautological.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c9209fa0f474d41bc5ecf2b988ab404123038c1b Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Tue, 3 Nov 2020 13:34:26 +0000
-Subject: [PATCH] pmf.h: made PMF_STOTE_ENABLE pass -Wtautological
-
-When compiling with clang, PMF_STORE_ENABLE triggers
--Wtautological-constant-compare. To mitigate, the definition
-is modified cosmetically to not trigger this error.
-
-Upstream-Status: Pending
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- include/lib/pmf/pmf.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/lib/pmf/pmf.h b/include/lib/pmf/pmf.h
-index df7c9ff31..baa2dfd60 100644
---- a/include/lib/pmf/pmf.h
-+++ b/include/lib/pmf/pmf.h
-@@ -25,7 +25,7 @@
- /*
-  * Flags passed to PMF_REGISTER_SERVICE
-  */
--#define PMF_STORE_ENABLE	(1 << 0)
-+#define PMF_STORE_ENABLE	1
- #define PMF_DUMP_ENABLE		(1 << 1)
-=20
- /*
---=20
-2.17.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0003-xlat-tabl=
es-v2-remove-tautological-assert.patch b/meta-arm/recipes-bsp/trusted-fir=
mware-a/files/0003-xlat-tables-v2-remove-tautological-assert.patch
deleted file mode 100644
index c24b1cf..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0003-xlat-tables-v2-r=
emove-tautological-assert.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a0b72074ee4cfdf0ff3b807b01a962898761def4 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Fri, 27 Nov 2020 10:29:48 +0000
-Subject: [PATCH] xlat_tables_v2: remove tautological assert
-
-When compiling with clang for aarch32, an assert triggered
--Wtautological error. This assertion is removed, as
-this means there is no way for it to resolve as false anyway.
-
-Upstream-Status: Pending
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- lib/xlat_tables_v2/aarch32/xlat_tables_arch.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c b/lib/xlat_ta=
bles_v2/aarch32/xlat_tables_arch.c
-index b69c6702b..52a75b37a 100644
---- a/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
-+++ b/lib/xlat_tables_v2/aarch32/xlat_tables_arch.c
-@@ -203,8 +203,6 @@ void setup_mmu_cfg(uint64_t *params, unsigned int fl=
ags,
-=20
- 		assert(virtual_addr_space_size >=3D
- 			xlat_get_min_virt_addr_space_size());
--		assert(virtual_addr_space_size <=3D
--			MAX_VIRT_ADDR_SPACE_SIZE);
- 		assert(IS_POWER_OF_TWO(virtual_addr_space_size));
-=20
- 		/*
---=20
-2.17.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 33ae64b..a3de645 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -55,11 +55,6 @@ LIC_FILES_CHKSUM_append =3D "${@bb.utils.contains('TFA=
_MBEDTLS', '1', ' ${LIC_FILE
 # add mbed TLS to version
 SRCREV_FORMAT_append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
=20
-SRC_URI_append =3D " \
-    file://0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch  \
-    file://0003-xlat-tables-v2-remove-tautological-assert.patch \
-    "
-
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin fil=
e
 TFA_UBOOT ?=3D "0"
--=20
2.25.1

