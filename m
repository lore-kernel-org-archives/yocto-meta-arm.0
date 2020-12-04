Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15579.1607095757809274497
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A28BF143D
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F15B3F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 04/17] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
Date: Fri,  4 Dec 2020 15:28:52 +0000
Message-Id: <20201204152905.1160276-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sumit Garg <sumit.garg@linaro.org>

OE native and cross compilers (in case of SDK) uses OE TARGET_SYS to
create standard paths to search for libraries and headers during
compilation.

Currently external-arm-toolchain recipe temporarily override TARGET_SYS
with EAT_TARGET_SYS and packages libraries and headers corresponding to
EAT_TARGET_SYS which leads to failures during native and cross compilatio=
n
(in case of SDK) such as:

$ $CXX -o hello++ hello.cpp
In file included from hello.cpp:1:
/tmp/armsdk/sysroots/armv7at2hf-neon-oe-linux-gnueabi/usr/include/c++/9.2=
.1/iostream:38:10: fatal error: bits/c++config.h: No such file or directo=
ry
   38 | #include <bits/c++config.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.

$ $CC hello.c
real-ld: cannot find crtbeginS.o: No such file or directory

So remove temp override of TARGET_SYS and rather package libraries and
headers corresponding to OE TARGET_SYS.

This fixes changes added in commit:
https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=3D91ea4d01=
7bf0598e49944e76c889e66d58c066ce

Also, update location for unwind.h gcc-arm-common.inc accordingly.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain.bb                  | 18 ++++++++++--------
 .../recipes-devtools/gcc/gcc-arm-common.inc    |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index 73a2cf6..4face74 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -54,7 +54,6 @@ PROVIDES +=3D "\
 PV =3D "${EAT_VER_MAIN}"
=20
 BINV =3D "${EAT_VER_GCC}"
-TARGET_SYS =3D "${EAT_TARGET_SYS}"
=20
 SRC_URI =3D "file://SUPPORTED"
=20
@@ -75,8 +74,8 @@ do_install() {
 	install -d ${D}${datadir}
 	install -d ${D}${includedir}
 	install -d ${D}/include
-	install -d ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-	install -d ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}
+	install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
=20
 	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  =
${D}${base_libdir}
@@ -105,6 +104,9 @@ do_install() {
 	fi
=20
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${i=
ncludedir}
+	if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
+		mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includ=
edir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
+	fi
 	ln -sf ../usr/include/c++ ${D}/include/c++
=20
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${=
D}${bindir}
@@ -116,11 +118,11 @@ do_install() {
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
=20
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
=20
 	# fix up the copied symlinks (they are still pointing to the multiarch =
directory)
 	linker_name=3D"${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-lin=
ux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard=
", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b=
/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
index 5599743..392c57f 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
@@ -12,7 +12,7 @@
 do_install_prepend_class-target () {
 	if [ "${TCMODE}" =3D "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${=
TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
 		install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${=
BINV}/include/
-		install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include=
/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV=
}/include/
+		install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unw=
ind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/in=
clude/
 	fi
 }
=20
--=20
2.25.1

