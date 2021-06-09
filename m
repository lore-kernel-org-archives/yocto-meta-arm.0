Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6044.1623235077000906746
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 03:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 546CF11B3
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Jun 2021 03:37:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05183F719
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Jun 2021 03:37:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] gem5/gem5: upgrade to 20.1.0.4
Date: Wed,  9 Jun 2021 11:37:52 +0100
Message-Id: <20210609103752.3138205-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is the latest point release in the 20.1 series, and also fixes the b=
uild with
scons 4.1 (which is now in master).

Change-Id: I31b8aabc8af47cc64af68f2fd0ee2b9b9b656e89
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gem5/files/pyinit-threads.patch           | 32 ----------------
 ...Fix-atomics-permission-checks-in-TLB.patch | 38 -------------------
 .../gem5/gem5-aarch64-native_20.bb            |  3 +-
 .../recipes-devtools/gem5/gem5-source_20.inc  |  9 ++---
 4 files changed, 5 insertions(+), 77 deletions(-)
 delete mode 100644 meta-gem5/recipes-devtools/gem5/files/pyinit-threads.=
patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0=
002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch

diff --git a/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch b=
/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch
deleted file mode 100644
index ac0c841..0000000
--- a/meta-gem5/recipes-devtools/gem5/files/pyinit-threads.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ae2ee2a4a51914cf78deb5c253a3b03cbb53ce72 Mon Sep 17 00:00:00 2001
-From: Boris Staletic <boris.staletic@gmail.com>
-Date: Mon, 15 Jun 2020 19:36:43 +0200
-Subject: [PATCH] Avoid using deprecated API in python 3.9
-
-The PyEval_InitThreads() and PyEval_ThreadsInitialized() functions are
-now deprecated and will be removed in Python 3.11. Calling
-PyEval_InitThreads() now does nothing. The GIL is initialized by
-Py_Initialize() since Python 3.7.
----
- include/pybind11/detail/internals.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/include/pybind11/detail/internals.h b/include/pybind11/deta=
il/internals.h
-index 6224dfb22..166a18a32 100644
---- a/ext/pybind11/include/pybind11/detail/internals.h
-+++ b/ext/pybind11/include/pybind11/detail/internals.h
-@@ -273,7 +273,10 @@ PYBIND11_NOINLINE inline internals &get_internals()=
 {
-         auto *&internals_ptr =3D *internals_pp;
-         internals_ptr =3D new internals();
- #if defined(WITH_THREAD)
--        PyEval_InitThreads();
-+
-+        #if PY_VERSION_HEX < 0x03090000
-+                PyEval_InitThreads();
-+        #endif
-         PyThreadState *tstate =3D PyThreadState_Get();
-         #if PY_VERSION_HEX >=3D 0x03070000
-             internals_ptr->tstate =3D PyThread_tss_alloc();
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arc=
h-arm-Fix-atomics-permission-checks-in-TLB.patch b/meta-gem5/recipes-devt=
ools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks=
-in-TLB.patch
deleted file mode 100644
index 36cb167..0000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-F=
ix-atomics-permission-checks-in-TLB.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c47920d81c4c29e8c868c005ff4330c46becbad5 Mon Sep 17 00:00:00 2001
-From: Giacomo Travaglini <giacomo.travaglini@arm.com>
-Date: Wed, 03 Mar 2021 11:38:06 +0000
-Subject: [PATCH] arch-arm: Fix atomics permission checks in TLB
-
-For stage 2 translations, atomic accesses were not checking the
-access permission bits in the page table descriptors, and were
-instead wrongly using the nature of the request itself
-(r/w booleans).
-
-Change-Id: I27fbc95f04ea659e77ad5a3afb551873c9c971f0
-Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
-Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/42073
-Reviewed-by: Jason Lowe-Power <power.jg@gmail.com>
-Reviewed-by: Richard Cooper <richard.cooper@arm.com>
-Reviewed-by: Bobby R. Bruce <bbruce@ucdavis.edu>
-Maintainer: Jason Lowe-Power <power.jg@gmail.com>
-Maintainer: Bobby R. Bruce <bbruce@ucdavis.edu>
-Tested-by: kokoro <noreply+kokoro@google.com>
-
-Upstream-Status: Backport
-Signed-off-By: Nathan Dunne <nathan.dunne@arm.com>
----
-
-diff --git a/src/arch/arm/tlb.cc b/src/arch/arm/tlb.cc
-index fd72d25..8e5b3ca 100644
---- a/src/arch/arm/tlb.cc
-+++ b/src/arch/arm/tlb.cc
-@@ -872,8 +872,7 @@
-             // sctlr.wxn overrides the xn bit
-             grant =3D !wxn && !xn;
-         } else if (is_atomic) {
--            grant =3D r && w;
--            grant_read =3D r;
-+            grant =3D hap;
-         } else if (is_write) {
-             grant =3D hap & 0x2;
-         } else { // is_read
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/=
meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index 711ab95..79cf910 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -1,7 +1,6 @@
 require gem5-source_20.inc
=20
-SRC_URI +=3D "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patc=
h \
-            file://0002-arch-arm-Fix-atomics-permission-checks-in-TLB.pa=
tch"
+SRC_URI +=3D "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patc=
h"
=20
 BPN =3D "gem5-aarch64-native"
=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc b/meta-ge=
m5/recipes-devtools/gem5/gem5-source_20.inc
index c586308..d03bb49 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
@@ -1,12 +1,11 @@
-#=C2=A0gem5 sources v20.1.0.3
+#=C2=A0gem5 sources v20.1.0.4
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
                     file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
=20
-SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1 \
-           file://pyinit-threads.patch"
-RELEASE_TAG =3D "v20.1.0.3"
-SRCREV =3D "cd21b5a5519940a0fa9b9a2dde68f30403d17f7e"
+SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1"
+RELEASE_TAG =3D "v20.1.0.4"
+SRCREV =3D "2373934b8224e33c55ce96a0fe7751caeee13baf"
=20
 PV =3D "${RELEASE_TAG}"
=20
--=20
2.25.1

