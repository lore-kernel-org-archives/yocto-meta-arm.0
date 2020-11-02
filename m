Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.859.1604331229729421004
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F09C30E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC35C3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:48 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm/optee-os: improve sysroot lookup
Date: Mon,  2 Nov 2020 15:33:35 +0000
Message-Id: <20201102153341.2844482-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

optee-test uses the same functionality to find libstdc++ and libgcc_eh,
so ensure that these libraries are found with the right sysroot too.

Change-Id: Ice0506a42655223045bcabec790eae3a3dbcf245
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 26 ++++++++++++++-----
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-=
sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-o=
s/0006-allow-setting-sysroot-for-libgcc-lookup.patch
index 86e8428..1700539 100644
--- a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot=
-for-libgcc-lookup.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot=
-for-libgcc-lookup.patch
@@ -1,22 +1,34 @@
-From 017994c477e2d082395460de83a7828d4e7d4b70 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
+From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 26 May 2020 14:38:02 -0500
 Subject: [PATCH] allow setting sysroot for libgcc lookup
=20
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
+for the compiler libraries as there's no easy way to reliably pass --sys=
root
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- mk/gcc.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..e238b9f3 100644
+index adc77a24..81bfa78a 100644
 --- a/mk/gcc.mk
 +++ b/mk/gcc.mk
-@@ -13,7 +13,7 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(sm=
)) \
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
  			-print-file-name=3Dinclude 2> /dev/null)
 =20
  # Get location of libgcc from gcc
 -libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
 +libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
  			-print-libgcc-file-name 2> /dev/null)
- libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
+-libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
  			-print-file-name=3Dlibstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
+=20
+ # Define these to something to discover accidental use
--=20
2.25.1

