Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web10.15667.1607095758624299140
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60086142F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C9AB3F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:19 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 17/17] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
Date: Fri,  4 Dec 2020 15:29:05 +0000
Message-Id: <20201204152905.1160276-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@ti.com>

Allows re-use of prebuilt ARM toolchain binaries for SDK generation.

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
[Sumit: package headers corresponding to EAT_TARGET_SYS and add PV]
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../distro/include/tcmode-external-arm.inc    |   4 +
 .../external-arm-sdk-toolchain.bb             | 144 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/external-arm-sdk-toolchain.bb

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index eee1a51..7d5aecc 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -45,6 +45,10 @@ PREFERRED_PROVIDER_glibc-mtrace =3D "external-arm-tool=
chain"
 PREFERRED_PROVIDER_libc-mtrace =3D "external-arm-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers =3D "external-arm-toolchai=
n"
=20
+PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+
 TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_HOST}"
=20
 DISTRO_FEATURES_LIBC =3D "ipv4 ipv6 libc-backtrace libc-big-macros libc-=
bsd libc-cxx-tests libc-catgets libc-crypt \
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/extern=
al-arm-toolchain/external-arm-sdk-toolchain.bb
new file mode 100644
index 0000000..3f12b4d
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-sdk-toolchain.bb
@@ -0,0 +1,144 @@
+inherit cross-canadian
+
+PN =3D "external-arm-sdk-toolchain-${TARGET_ARCH}"
+BPN =3D "external-arm-sdk-toolchain"
+PV =3D "${EAT_VER_MAIN}"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+INHIBIT_PACKAGE_STRIP =3D "1"
+INHIBIT_SYSROOT_STRIP =3D "1"
+INHIBIT_DEFAULT_DEPS =3D "1"
+EXCLUDE_FROM_SHLIBS =3D "1"
+
+EAT_LICENSE ??=3D ""
+
+LICENSE =3D "${EAT_LICENSE}"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+# Skip packaging QA checks for prebuilt binaries
+INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so sta=
ticdev file-rdeps libdir"
+INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so fil=
e-rdeps"
+INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-s=
o file-rdeps"
+
+# Skip file dependencies in RPM for prebuilt binaries
+SKIP_FILEDEPS =3D "1"
+
+PROVIDES =3D "\
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+"
+
+PACKAGES =3D "\
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+"
+
+# Adjust defaults in line with external toolchain
+bindir =3D "${exec_prefix}/bin"
+libdir =3D "${exec_prefix}/lib"
+libexecdir =3D "${exec_prefix}/libexec"
+datadir =3D "${exec_prefix}/share"
+gcclibdir =3D "${libdir}/gcc"
+
+FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
+	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
+	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
+	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
+	${prefix}/${EAT_TARGET_SYS}/include \
+	${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
+	${bindir}/${TARGET_PREFIX}gcov \
+	${bindir}/${TARGET_PREFIX}gcc* \
+	${bindir}/${TARGET_PREFIX}g++ \
+	${bindir}/${TARGET_PREFIX}cpp \
+	${libexecdir}/* \
+"
+
+FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
+	${bindir}/${TARGET_PREFIX}gdb* \
+	${datadir}/gdb/* \
+"
+
+FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
+	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
+	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
+	${prefix}/${EAT_TARGET_SYS}/bin/strip \
+	${prefix}/${EAT_TARGET_SYS}/bin/nm \
+	${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
+	${prefix}/${EAT_TARGET_SYS}/bin/as \
+	${prefix}/${EAT_TARGET_SYS}/bin/ar \
+	${prefix}/${EAT_TARGET_SYS}/bin/objdump \
+	${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
+	${bindir}/${TARGET_PREFIX}ld* \
+	${bindir}/${TARGET_PREFIX}addr2line \
+	${bindir}/${TARGET_PREFIX}objcopy \
+	${bindir}/${TARGET_PREFIX}readelf \
+	${bindir}/${TARGET_PREFIX}strip \
+	${bindir}/${TARGET_PREFIX}nm \
+	${bindir}/${TARGET_PREFIX}ranlib \
+	${bindir}/${TARGET_PREFIX}gprof \
+	${bindir}/${TARGET_PREFIX}as \
+	${bindir}/${TARGET_PREFIX}c++filt \
+	${bindir}/${TARGET_PREFIX}ar \
+	${bindir}/${TARGET_PREFIX}strings \
+	${bindir}/${TARGET_PREFIX}objdump \
+	${bindir}/${TARGET_PREFIX}size \
+"
+
+DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "The GNU cc=
 and gcc C compilers"
+DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb - GNU =
debugger"
+DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "A GNU=
 collection of binary utilities"
+
+LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_GCC_LICE=
NSE}"
+LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_GDB_LICE=
NSE}"
+LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_BFD=
_LICENSE}"
+
+PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GCC}"
+PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GDB}"
+PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_BF=
D}"
+
+do_install() {
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/include
+	install -d ${D}${bindir}
+	install -d ${D}${libdir}
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
+	install -d ${D}${libexecdir}
+	install -d ${D}${datadir}/gdb
+	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
+
+	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
+
+	# gcc
+	for i in libstdc++.* libgcc_s.* libsupc++.*; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i=
 ${D}${prefix}/${EAT_TARGET_SYS}/lib
+	done
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${p=
refix}/${EAT_TARGET_SYS}/include
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
+	for i in gcov gcc* g++ cpp; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindi=
r}
+	done
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
+
+	# gdb
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bind=
ir}
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
+
+	# binutils
+	for i in ld* objcopy strip nm ranlib as ar objdump; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${pre=
fix}/${EAT_TARGET_SYS}/bin
+	done
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* $=
{D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
+	for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt=
 ar strings objdump size; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindi=
r}
+	done
+}
+
+python () {
+    if not d.getVar("EAT_VER_MAIN", False):
+        raise bb.parse.SkipPackage("External ARM toolchain not configure=
d (EAT_VER_MAIN not set).")
+    if d.getVar('TCLIBC', True) !=3D "glibc":
+        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TC=
LIBC', True))
+}
--=20
2.25.1

