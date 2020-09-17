Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.13970.1600344960363169949
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 05:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oSnC4g8b;
 spf=pass (domain: linaro.org, ip: 209.85.210.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f195.google.com with SMTP id k15so1083078pfc.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Sep 2020 05:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oAM/655JqDT4VHvpSV1vmTOkfSYQNT15k4ojrQZmtm8=;
        b=oSnC4g8bvxyEIo7MT/lZ9Dk47abTWqUu3M28mJ+u5y3YQFEPRJRuYYROMD5dEQ6wjj
         bV28Fvq2r47B6ihPahH0PHDDHXm2ZxixAhbXLTEfbgRA701CJhqRKe821PVSVLYOlBHo
         u9HyCkHB47T+L0G/4r/BST+3Ivdpl39dfAKcFPYBa5uWVB6Ktdli5F3/wIIOv0qSsl38
         jdTriD0jMpwm8GKSvorAA3YSU353C8f5oIwnExj1ZJilRct4I7G6vQc1uHHdsFtf8W6s
         oUocrP+8VukPlc2ZMs4VCaTJtYu+LAdTtsOhk1cIHO/eewcskmV7p7MVrPBA+dvkBLdA
         DIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oAM/655JqDT4VHvpSV1vmTOkfSYQNT15k4ojrQZmtm8=;
        b=PyOkC7gQEtr0hoRPOluT+PuPMYGAJs84Sg6oMUDVaK7JQSDwySPGLbczqL8UE7WIPY
         3cihgQW8aJtYiPbcLFYNu74PUJprKxxtZkrzJ0eQCGec22rGuKcIF34+uO9F6prut2kr
         wuYcWAGTrDvvB4MQpBGBsUyghs1Hbxbz5nzRm0JbxTSUBejx5E+/T8yZ1RfWYpWVr2z1
         tOwpyxaVyeUTHpRznXWkzTT0O5mJ6fe+PP0NY47mjRGgYhPaWOKbUO49cv+K+o/DeW7d
         kAR59g5LWgHsNZarIH9O0ok3lgzcKZ16OaipBtjx/c4232gW2r7uHN6aQn8c4zJBURWt
         Tczg==
X-Gm-Message-State: AOAM532pRD6Wdy7RLmIoBYmbySK62srfq9bP5kGdEjFZ2miEdNN+mE63
	9QrHICBCbUpF6xG87fMcl25TyCzTaSF5ag==
X-Google-Smtp-Source: ABdhPJyoY76Mc6Wiy9beWwsk39SM4Rk/sGuQf5T3wlizBcjdSilNOcthiwUf1iVBULwDkAy6Bnn9dQ==
X-Received: by 2002:a63:2d47:: with SMTP id t68mr4636711pgt.41.1600344959240;
        Thu, 17 Sep 2020 05:15:59 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.66.163])
        by smtp.gmail.com with ESMTPSA id m188sm21441629pfd.56.2020.09.17.05.15.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:15:58 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Denys Dmytriyenko <denys@ti.com>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [meta-arm][PATCH v4 4/5] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
Date: Thu, 17 Sep 2020 17:45:31 +0530
Message-Id: <1600344931-30670-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Allows re-use of prebuilt ARM toolchain binaries for SDK generation.

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
[Sumit: package headers corresponding to EAT_TARGET_SYS and add PV]
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v4:
- Package headers corresponding to EAT_TARGET_SYS.
- Add PV for external-arm-sdk-toolchain.bb recipe.
- After these changes, we don't need patch #5 hack.
- Patches #1 to #3 are already applied.

 .../conf/distro/include/tcmode-external-arm.inc    |   4 +
 .../external-arm-sdk-toolchain.bb                  | 144 +++++++++++++++++++++
 2 files changed, 148 insertions(+)
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
index 0000000..3f12b4d
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
@@ -0,0 +1,144 @@
+inherit cross-canadian
+
+PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
+BPN = "external-arm-sdk-toolchain"
+PV = "${EAT_VER_MAIN}"
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
+	${prefix}/${EAT_TARGET_SYS}/include \
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
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/include
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
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${prefix}/${EAT_TARGET_SYS}/include
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

