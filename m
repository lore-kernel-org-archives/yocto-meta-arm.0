Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.313.1592503146536941364
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 10:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB2F240B96;
	Thu, 18 Jun 2020 17:59:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbZPGyz4SF3Y; Thu, 18 Jun 2020 17:59:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C46940A9E;
	Thu, 18 Jun 2020 17:59:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 237621707D8;
	Thu, 18 Jun 2020 13:59:04 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 4/4] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
Date: Thu, 18 Jun 2020 13:59:02 -0400
Message-Id: <1592503142-8504-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Allows re-use of prebuilt ARM toolchain binaries for SDK generation.

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - in addition to INSANE_SKIP, use SKIP_FILEDEPS for RPM to skip rdeps checks

 .../conf/distro/include/tcmode-external-arm.inc    |   4 +
 .../external-arm-sdk-toolchain.bb                  | 140 +++++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index eee1a51..7d5aecc 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -45,6 +45,10 @@ PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
 PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
 
+PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
 
 DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
new file mode 100644
index 0000000..df42b88
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
@@ -0,0 +1,140 @@
+inherit cross-canadian
+
+PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
+BPN = "external-arm-sdk-toolchain"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_SHLIBS = "1"
+
+EAT_LICENSE ??= ""
+
+LICENSE = "${EAT_LICENSE}"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+# Skip packaging QA checks for prebuilt binaries
+INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
+INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
+INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
+
+# Skip file dependencies in RPM for prebuilt binaries
+SKIP_FILEDEPS = "1"
+
+PROVIDES = "\
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+"
+
+PACKAGES = "\
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+"
+
+# Adjust defaults in line with external toolchain
+bindir = "${exec_prefix}/bin"
+libdir = "${exec_prefix}/lib"
+libexecdir = "${exec_prefix}/libexec"
+datadir = "${exec_prefix}/share"
+gcclibdir = "${libdir}/gcc"
+
+FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
+	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
+	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
+	${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
+	${bindir}/${TARGET_PREFIX}gcov \
+	${bindir}/${TARGET_PREFIX}gcc* \
+	${bindir}/${TARGET_PREFIX}g++ \
+	${bindir}/${TARGET_PREFIX}cpp \
+	${libexecdir}/* \
+"
+
+FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+	${bindir}/${TARGET_PREFIX}gdb* \
+	${datadir}/gdb/* \
+"
+
+FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
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
+DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
+DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
+DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
+
+LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
+LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
+LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
+
+PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
+PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
+PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
+
+do_install() {
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
+	install -d ${D}${bindir}
+	install -d ${D}${libdir}
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
+	install -d ${D}${libexecdir}
+	install -d ${D}${datadir}/gdb
+	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
+
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+	# gcc
+	for i in libstdc++.* libgcc_s.* libsupc++.*; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i ${D}${prefix}/${EAT_TARGET_SYS}/lib
+	done
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
+	for i in gcov gcc* g++ cpp; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
+	done
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
+
+	# gdb
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
+
+	# binutils
+	for i in ld* objcopy strip nm ranlib as ar objdump; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${prefix}/${EAT_TARGET_SYS}/bin
+	done
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
+	for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt ar strings objdump size; do
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
+	done
+}
+
+python () {
+    if not d.getVar("EAT_VER_MAIN", False):
+        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
+    if d.getVar('TCLIBC', True) != "glibc":
+        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
+}
-- 
2.7.4

