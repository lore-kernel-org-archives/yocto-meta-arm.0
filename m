Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12867.1603113844179656288
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBE36D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:24:03 -0700 (PDT)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1168E3F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:24:02 -0700 (PDT)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v4 6/7] optee: refactor into .inc files
Date: Mon, 19 Oct 2020 14:23:49 +0100
Message-Id: <20201019132350.25042-6-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019132350.25042-1-brett.warren@arm.com>
References: <20201019132350.25042-1-brett.warren@arm.com>

To reduce code duplication, .inc files are used to hold common parts
of recipes, allowing .bb files to only specify things specific to that
recipe version.

Changed-Id: 740e6c9d36a957e2988f3599dd830c745f240beb
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 ...optee-client_3.8.0.bb => optee-client.inc} |  2 +-
 .../optee/optee-client_3.10.0.bb              | 58 +------------
 .../optee/optee-client_3.8.0.bb               | 58 +------------
 ...-examples_3.10.0.bb => optee-examples.inc} | 21 ++---
 .../optee/optee-examples_3.10.0.bb            | 52 +-----------
 .../optee/optee-examples_3.8.0.bb             | 53 +-----------
 .../{optee-os_3.10.0.bb => optee-os.inc}      | 11 +--
 .../recipes-security/optee/optee-os_3.10.0.bb | 85 +------------------
 .../recipes-security/optee/optee-os_3.8.0.bb  | 82 +-----------------
 .../{optee-test_3.10.0.bb => optee-test.inc}  |  7 +-
 .../optee/optee-test_3.10.0.bb                | 58 +------------
 .../optee/optee-test_3.8.0.bb                 | 58 +------------
 12 files changed, 31 insertions(+), 514 deletions(-)
 copy meta-arm/recipes-security/optee/{optee-client_3.8.0.bb => optee-client.inc} (96%)
 copy meta-arm/recipes-security/optee/{optee-examples_3.10.0.bb => optee-examples.inc} (96%)
 copy meta-arm/recipes-security/optee/{optee-os_3.10.0.bb => optee-os.inc} (90%)
 copy meta-arm/recipes-security/optee/{optee-test_3.10.0.bb => optee-test.inc} (97%)

diff --git a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb b/meta-arm/recipes-security/optee/optee-client.inc
similarity index 96%
copy from meta-arm/recipes-security/optee/optee-client_3.8.0.bb
copy to meta-arm/recipes-security/optee/optee-client.inc
index d43ebf4..d82392c 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -9,7 +9,6 @@ require optee.inc
 
 inherit python3native systemd update-rc.d
 
-SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git \
     file://tee-supplicant.service \
@@ -57,3 +56,4 @@ INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME_${PN} = "tee-supplicant"
 INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
 
+
diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
index cbd3b93..c7cef19 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
@@ -1,59 +1,3 @@
-SUMMARY = "OP-TEE Client API"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World Client side of the TEE"
-HOMEPAGE = "https://www.op-tee.org/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
-
-require optee.inc
-
-inherit python3native systemd update-rc.d
+require optee-client.inc
 
 SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
-SRC_URI = " \
-    git://github.com/OP-TEE/optee_client.git \
-    file://tee-supplicant.service \
-    file://tee-supplicant.sh \
-"
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-EXTRA_OEMAKE = "O=${B}"
-
-do_compile() {
-    cd ${S}
-    oe_runmake
-}
-do_compile[cleandirs] = "${B}"
-
-do_install() {
-    cd ${S}
-    oe_runmake install
-
-    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
-
-    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
-
-    install -d ${D}${includedir}
-    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
-
-    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
-
-    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
-
-    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-           -e s:@sbindir@:${sbindir}:g \
-              ${D}${systemd_system_unitdir}/tee-supplicant.service \
-              ${D}${sysconfdir}/init.d/tee-supplicant
-}
-
-SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
-
-INITSCRIPT_PACKAGES = "${PN}"
-
-INITSCRIPT_NAME_${PN} = "tee-supplicant"
-INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
-
diff --git a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
index d43ebf4..b1587bb 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
@@ -1,59 +1,3 @@
-SUMMARY = "OP-TEE Client API"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World Client side of the TEE"
-HOMEPAGE = "https://www.op-tee.org/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
-
-require optee.inc
-
-inherit python3native systemd update-rc.d
+require optee-client.inc
 
 SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
-SRC_URI = " \
-    git://github.com/OP-TEE/optee_client.git \
-    file://tee-supplicant.service \
-    file://tee-supplicant.sh \
-"
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-EXTRA_OEMAKE = "O=${B}"
-
-do_compile() {
-    cd ${S}
-    oe_runmake
-}
-do_compile[cleandirs] = "${B}"
-
-do_install() {
-    cd ${S}
-    oe_runmake install
-
-    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
-
-    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
-
-    install -d ${D}${includedir}
-    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
-
-    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
-
-    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
-
-    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-           -e s:@sbindir@:${sbindir}:g \
-              ${D}${systemd_system_unitdir}/tee-supplicant.service \
-              ${D}${sysconfdir}/init.d/tee-supplicant
-}
-
-SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
-
-INITSCRIPT_PACKAGES = "${PN}"
-
-INITSCRIPT_NAME_${PN} = "tee-supplicant"
-INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
-
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples.inc
similarity index 96%
copy from meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
copy to meta-arm/recipes-security/optee/optee-examples.inc
index 2f3cc09..7d12858 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -13,28 +13,28 @@ require optee.inc
 
 SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
            file://0001-make-Pass-ldflags-during-link.patch \
-           "
-SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
+          "
 
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
 OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 
 EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  HOST_CROSS_COMPILE=${TARGET_PREFIX} \
-                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
-                 COMPILER=${OPTEE_COMPILER} \
                  LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+                 COMPILER=${OPTEE_COMPILER} \
+                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
                  V=1 \
                  OUTPUT_DIR=${B} \
                "
 
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
+
 do_compile() {
     cd ${S}
     oe_runmake
@@ -52,3 +52,4 @@ FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
 
 # Imports machine specific configs from staging to build
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
index 2f3cc09..1c52698 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
@@ -1,54 +1,4 @@
-SUMMARY = "OP-TEE examples"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Sample Applications"
-HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
+require optee-examples.inc
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
-
-DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
-
-inherit python3native
-
-require optee.inc
-
-SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
-           file://0001-make-Pass-ldflags-during-link.patch \
-           "
 SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
 
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
-OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
-                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
-                 TEEC_EXPORT=${TEEC_EXPORT} \
-                 HOST_CROSS_COMPILE=${TARGET_PREFIX} \
-                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
-                 COMPILER=${OPTEE_COMPILER} \
-                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-                 V=1 \
-                 OUTPUT_DIR=${B} \
-               "
-
-do_compile() {
-    cd ${S}
-    oe_runmake
-}
-do_compile[cleandirs] = "${B}"
-
-do_install () {
-    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
-    mkdir -p ${D}${bindir}
-    install -D -p -m0755 ${B}/ca/* ${D}${bindir}
-    install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz
-}
-
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
index f10b04d..bd9b317 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
@@ -1,54 +1,3 @@
-SUMMARY = "OP-TEE examples"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Sample Applications"
-HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
+require optee-examples.inc
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
-
-DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
-
-inherit python3native
-
-require optee.inc
-
-SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
-           file://0001-make-Pass-ldflags-during-link.patch \
-           "
 SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
-OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
-                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
-                 TEEC_EXPORT=${TEEC_EXPORT} \
-                 HOST_CROSS_COMPILE=${TARGET_PREFIX} \
-                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
-                 COMPILER=${OPTEE_COMPILER} \
-                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-                 V=1 \
-                 OUTPUT_DIR=${B} \
-               "
-
-do_compile() {
-    cd ${S}
-    oe_runmake
-}
-do_compile[cleandirs] = "${B}"
-
-do_install () {
-    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
-    mkdir -p ${D}${bindir}
-    install -D -p -m0755 ${B}/ca/* ${D}${bindir}
-    install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz
-}
-
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os.inc
similarity index 90%
copy from meta-arm/recipes-security/optee/optee-os_3.10.0.bb
copy to meta-arm/recipes-security/optee/optee-os.inc
index adc8510..3094b35 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -12,12 +12,7 @@ DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyel
 
 DEPENDS_append_toolchain-clang = " compiler-rt"
 
-SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
-SRC_URI = " \
-    git://github.com/OP-TEE/optee_os.git \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-"
+SRC_URI = "git://github.com/OP-TEE/optee_os.git"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
@@ -30,16 +25,17 @@ OPTEE_ARCH_aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
 OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 
+
 EXTRA_OEMAKE = " \
     PLATFORM=${OPTEEMACHINE} \
     CFG_${OPTEE_CORE}_core=y \
     CROSS_COMPILE_core=${HOST_PREFIX} \
     CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
-    COMPILER=${OPTEE_COMPILER} \
     NOWERROR=1 \
     V=1 \
     ta-targets=ta_${OPTEE_ARCH} \
     LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+    COMPILER=${OPTEE_COMPILER} \
     O=${B} \
 "
 
@@ -86,3 +82,4 @@ FILES_${PN}-dev = "${includedir}/optee/"
 INSANE_SKIP_${PN}-dev = "staticdev"
 
 INHIBIT_PACKAGE_STRIP = "1"
+
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
index adc8510..c3f7b12 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
@@ -1,88 +1,9 @@
-SUMMARY = "OP-TEE Trusted OS"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
-HOMEPAGE = "https://www.op-tee.org/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
-
-inherit deploy python3native
-require optee.inc
-
-DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
-
-DEPENDS_append_toolchain-clang = " compiler-rt"
+require optee-os.inc
 
 SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
-SRC_URI = " \
-    git://github.com/OP-TEE/optee_os.git \
+
+SRC_URI_append = " \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
 "
 
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-OPTEEMACHINE ?= "${MACHINE}"
-OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
-OPTEE_ARCH = "null"
-OPTEE_ARCH_armv7a = "arm32"
-OPTEE_ARCH_aarch64 = "arm64"
-OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
-OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE = " \
-    PLATFORM=${OPTEEMACHINE} \
-    CFG_${OPTEE_CORE}_core=y \
-    CROSS_COMPILE_core=${HOST_PREFIX} \
-    CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
-    COMPILER=${OPTEE_COMPILER} \
-    NOWERROR=1 \
-    V=1 \
-    ta-targets=ta_${OPTEE_ARCH} \
-    LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-    O=${B} \
-"
-
-CFLAGS[unexport] = "1"
-LDFLAGS[unexport] = "1"
-CPPFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-do_configure[noexec] = "1"
-
-do_compile() {
-    cd ${S}
-    oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
-}
-do_compile[cleandirs] = "${B}"
-
-do_install() {
-    #install core in firmware
-    install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
-
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_deploy() {
-    install -d ${DEPLOYDIR}/optee
-    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
-}
-
-addtask deploy before do_build after do_install
-
-SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
-
-FILES_${PN} = "${nonarch_base_libdir}/firmware/"
-FILES_${PN}-dev = "${includedir}/optee/"
-
-INSANE_SKIP_${PN}-dev = "staticdev"
-
-INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.8.0.bb b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
index 8791bc7..7e0fad5 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
@@ -1,18 +1,8 @@
-SUMMARY = "OP-TEE Trusted OS"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
-HOMEPAGE = "https://www.op-tee.org/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
-
-inherit deploy python3native
-require optee.inc
-
-DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
+require optee-os.inc
 
 SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
-SRC_URI = " \
-    git://github.com/OP-TEE/optee_os.git \
+
+SRC_URI_append = " \
     file://0001-mk-compile.mk-fix-cc-option-macro.patch \
     file://0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
     file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
@@ -21,69 +11,3 @@ SRC_URI = " \
     file://allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch\
     file://missing-mkdir.patch \
 "
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-OPTEEMACHINE ?= "${MACHINE}"
-OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
-OPTEE_ARCH = "null"
-OPTEE_ARCH_armv7a = "arm32"
-OPTEE_ARCH_aarch64 = "arm64"
-OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
-
-EXTRA_OEMAKE = " \
-    PLATFORM=${OPTEEMACHINE} \
-    CFG_${OPTEE_CORE}_core=y \
-    CROSS_COMPILE_core=${HOST_PREFIX} \
-    CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
-    NOWERROR=1 \
-    V=1 \
-    ta-targets=ta_${OPTEE_ARCH} \
-    LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-    O=${B} \
-"
-
-CFLAGS[unexport] = "1"
-LDFLAGS[unexport] = "1"
-CPPFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-do_configure[noexec] = "1"
-
-do_compile() {
-    cd ${S}
-    oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
-}
-do_compile[cleandirs] = "${B}"
-
-do_install() {
-    #install core in firmware
-    install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
-
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_deploy() {
-    install -d ${DEPLOYDIR}/optee
-    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
-}
-
-addtask deploy before do_build after do_install
-
-SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
-
-FILES_${PN} = "${nonarch_base_libdir}/firmware/"
-FILES_${PN}-dev = "${includedir}/optee/"
-
-INSANE_SKIP_${PN}-dev = "staticdev"
-
-INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test.inc
similarity index 97%
copy from meta-arm/recipes-security/optee/optee-test_3.10.0.bb
copy to meta-arm/recipes-security/optee/optee-test.inc
index 6541de4..95ed311 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -10,10 +10,9 @@ require optee.inc
 
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
-SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
-           file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
+           file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \ 
            file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
           "
 
@@ -28,10 +27,10 @@ OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+                 COMPILER=${OPTEE_COMPILER} \
                  CROSS_COMPILE_HOST=${TARGET_PREFIX} \
                  CROSS_COMPILE_TA=${TARGET_PREFIX} \
-                 COMPILER=${OPTEE_COMPILER} \
-                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  O=${B} \
                "
diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
index 6541de4..396f7cb 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
@@ -1,59 +1,3 @@
-SUMMARY = "OP-TEE sanity testsuite"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
-HOMEPAGE = "https://www.op-tee.org/"
-
-LICENSE = "BSD & GPLv2"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
-
-inherit python3native
-require optee.inc
-
-DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
+require optee-test.inc
 
 SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
-SRC_URI = "git://github.com/OP-TEE/optee_test.git \
-           file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
-           file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
-           file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
-          "
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
-OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
-                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
-                 TEEC_EXPORT=${TEEC_EXPORT} \
-                 CROSS_COMPILE_HOST=${TARGET_PREFIX} \
-                 CROSS_COMPILE_TA=${TARGET_PREFIX} \
-                 COMPILER=${OPTEE_COMPILER} \
-                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-                 V=1 \
-                 O=${B} \
-               "
-
-do_compile() {
-    cd ${S}
-    # Top level makefile doesn't seem to handle parallel make gracefully
-    oe_runmake xtest
-    oe_runmake ta
-}
-do_compile[cleandirs] = "${B}"
-
-do_install () {
-    install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
-
-    # install path should match the value set in optee-client/tee-supplicant
-    # default TEEC_LOAD_PATH is /lib
-    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
-    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
-}
-
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
index 7f3d49b..8ea3348 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
@@ -1,59 +1,3 @@
-SUMMARY = "OP-TEE sanity testsuite"
-DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
-HOMEPAGE = "https://www.op-tee.org/"
-
-LICENSE = "BSD & GPLv2"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
-
-inherit python3native
-require optee.inc
-
-DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
+require optee-test.inc
 
 SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
-SRC_URI = "git://github.com/OP-TEE/optee_test.git \
-           file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
-           file://0002-make-remove-Wno-unsafe-loop-for-clang.patch  \
-           file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
-          "
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
-OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
-                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
-                 TEEC_EXPORT=${TEEC_EXPORT} \
-                 CROSS_COMPILE_HOST=${TARGET_PREFIX} \
-                 CROSS_COMPILE_TA=${TARGET_PREFIX} \
-                 COMPILER=${OPTEE_COMPILER} \
-                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-                 V=1 \
-                 O=${B} \
-               "
-
-do_compile() {
-    cd ${S}
-    # Top level makefile doesn't seem to handle parallel make gracefully
-    oe_runmake xtest
-    oe_runmake ta
-}
-do_compile[cleandirs] = "${B}"
-
-do_install () {
-    install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
-
-    # install path should match the value set in optee-client/tee-supplicant
-    # default TEEC_LOAD_PATH is /lib
-    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
-    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
-}
-
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.17.1

