Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4429.1616586160115548814
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 04:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2E731B
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3E373F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/edk2-firmware: clean up build invocation
Date: Wed, 24 Mar 2021 11:42:23 +0000
Message-Id: <20210324114224.600705-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add some comments to make it clear what variables are being passed as
what arguments to build.

The build tool is on PATH, so there's no need to use an absolute path.

Change-Id: If9229d4927205e1b9a9a0bf7f7526e33006a03fd
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 4748ae3..073f5c9 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -25,11 +25,14 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>=
\d+)$"
=20
 EDK2_BUILD_RELEASE =3D ""
 EDK2_PLATFORM      =3D ""
+# build --platform
 EDK2_PLATFORM_DSC  =3D ""
 EDK2_BIN_NAME      =3D ""
+# build --arch
 EDK2_ARCH          =3D ""
=20
-EDK2_BUILD_MODE =3D "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RE=
LEASE', 'DEBUG', d)}"
+# build --buildtarget
+EDK2_BUILD_MODE ?=3D "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'R=
ELEASE', 'DEBUG', d)}"
=20
 # Baremetal, no need for a C library
 DEPENDS_remove =3D "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
@@ -72,11 +75,11 @@ do_compile() {
     oe_runmake -C ${S}/BaseTools
=20
     PATH=3D"${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
-    "${S}/BaseTools/BinWrappers/PosixLike/build" \
-       -a "${EDK2_ARCH}" \
-       -b ${EDK2_BUILD_MODE} \
-       -t ${EDK_COMPILER} \
-       -p ${EDK2_PLATFORM_DSC}
+    build \
+       --arch "${EDK2_ARCH}" \
+       --buildtarget ${EDK2_BUILD_MODE} \
+       --tagname ${EDK_COMPILER} \
+       --platform ${EDK2_PLATFORM_DSC}
 }
=20
 do_install() {
--=20
2.25.1

