Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15582.1607095761306177885
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 049FB11FB
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3D2B3F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:10 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 01/17] external-arm-toolchain: un-break target compilation
Date: Fri,  4 Dec 2020 15:28:49 +0000
Message-Id: <20201204152905.1160276-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@ti.com>

Compiling on the target using runtime libs from external-arm-toolchain
requires libgcc.a, as libgcc_s.so explains:

/* GNU ld script
   Use the shared library, but some functions are only in
   the static library.  */
GROUP ( libgcc_s.so.1 -lgcc )

Otherwise it results in errors like:
| /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/=
ld: cannot find -lgcc
| /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/=
ld: cannot find -lgcc
| collect2: error: ld returned 1 exit status

This already has been fixed before in this commit:
https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=3D91ea4d01=
7bf0598e49944e76c889e66d58c066ce

But then it got broken/undone here w/o due review:
https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=3Db43d5f0c=
e431ba1e242504641266a63293ded5db

Even though it's a static library, we want it to be in libgcc-dev as it's
not optional, but rather required for development.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index 04d8923..8cfc208 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -117,7 +117,7 @@ do_install() {
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
=20
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
@@ -310,6 +310,7 @@ INSANE_SKIP_${PN}-utils +=3D "ldflags"
 INSANE_SKIP_libstdc++ +=3D "ldflags"
 INSANE_SKIP_libgfortran +=3D "ldflags"
 INSANE_SKIP_libgcc +=3D "ldflags dev-deps"
+INSANE_SKIP_libgcc-dev +=3D "staticdev"
 INSANE_SKIP_libgfortran +=3D "ldflags dev-deps"
 INSANE_SKIP_libstdc++ +=3D "ldflags dev-deps"
 INSANE_SKIP_libatomic +=3D "ldflags"
--=20
2.25.1

