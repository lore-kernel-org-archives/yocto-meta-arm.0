Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.19554.1602864025740095062
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 09:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4B413D5
	for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 09:00:25 -0700 (PDT)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 788823F719
	for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 09:00:24 -0700 (PDT)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 2/6] optee: upgraded recipes to 3.10
Date: Fri, 16 Oct 2020 17:00:18 +0100
Message-Id: <20201016160018.23449-1-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1

The optee recipes were upgraded due to issues booting with 3.8
on qemuarm64-secureboot, which were resolved by the upgrade.
The 3.8 recipes are retained for backwards compatibility.

optee-test and optee-examples were modified to pass a sysroot
to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
of the libgcc library.

Recipes have been renamed to reflect their current version.
As this makes the PV variables redundent, these have been removed.

Patch 0006 has been refreshed to work with 3.10 without fuzzing.
The original copy has been retained for the 3.8 recipes to use.

Change-Id: Iacaba02d64570a790d5cc20eca8be58246e39019
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 .../optee/optee-client_3.10.0.bb              | 59 +++++++++++++
 ...ee-client_git.bb => optee-client_3.8.0.bb} |  2 -
 .../optee/optee-examples_3.10.0.bb            | 52 ++++++++++++
 ...xamples_git.bb => optee-examples_3.8.0.bb} |  3 +-
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 15 ++--
 ...-sysroot-for-libgcc-lookup-for-3.8.0.patch | 25 ++++++
 .../recipes-security/optee/optee-os_3.10.0.bb | 83 +++++++++++++++++++
 .../{optee-os_git.bb => optee-os_3.8.0.bb}    |  4 +-
 .../optee/optee-test_3.10.0.bb                | 55 ++++++++++++
 ...{optee-test_git.bb => optee-test_3.8.0.bb} |  3 +-
 10 files changed, 283 insertions(+), 18 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.10.0.bb
 rename meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.8.0.bb} (98%)
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
 rename meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.8.0.bb} (95%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.10.0.bb
 rename meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.8.0.bb} (96%)
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb
 rename meta-arm/recipes-security/optee/{optee-test_git.bb => optee-test_3.8.0.bb} (96%)

diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
new file mode 100644
index 0000000..cbd3b93
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
@@ -0,0 +1,59 @@
+SUMMARY = "OP-TEE Client API"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World Client side of the TEE"
+HOMEPAGE = "https://www.op-tee.org/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
+
+require optee.inc
+
+inherit python3native systemd update-rc.d
+
+SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
+SRC_URI = " \
+    git://github.com/OP-TEE/optee_client.git \
+    file://tee-supplicant.service \
+    file://tee-supplicant.sh \
+"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+EXTRA_OEMAKE = "O=${B}"
+
+do_compile() {
+    cd ${S}
+    oe_runmake
+}
+do_compile[cleandirs] = "${B}"
+
+do_install() {
+    cd ${S}
+    oe_runmake install
+
+    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
+
+    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
+    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
+    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
+
+    install -d ${D}${includedir}
+    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
+
+    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
+
+    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
+
+    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
+           -e s:@sbindir@:${sbindir}:g \
+              ${D}${systemd_system_unitdir}/tee-supplicant.service \
+              ${D}${sysconfdir}/init.d/tee-supplicant
+}
+
+SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
+
+INITSCRIPT_PACKAGES = "${PN}"
+
+INITSCRIPT_NAME_${PN} = "tee-supplicant"
+INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
+
diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
similarity index 98%
rename from meta-arm/recipes-security/optee/optee-client_git.bb
rename to meta-arm/recipes-security/optee/optee-client_3.8.0.bb
index 5dbbfe9..d43ebf4 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.8.0+git${SRCPV}"
-
 require optee.inc
 
 inherit python3native systemd update-rc.d
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
new file mode 100644
index 0000000..4a7db10
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
@@ -0,0 +1,52 @@
+SUMMARY = "OP-TEE examples"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Sample Applications"
+HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
+
+DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
+
+inherit python3native
+
+require optee.inc
+
+SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
+           file://0001-make-Pass-ldflags-during-link.patch \
+           "
+SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
+                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
+                 TEEC_EXPORT=${TEEC_EXPORT} \
+                 HOST_CROSS_COMPILE=${TARGET_PREFIX} \
+                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+                 V=1 \
+                 OUTPUT_DIR=${B} \
+               "
+
+do_compile() {
+    cd ${S}
+    oe_runmake
+}
+do_compile[cleandirs] = "${B}"
+
+do_install () {
+    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
+    mkdir -p ${D}${bindir}
+    install -D -p -m0755 ${B}/ca/* ${D}${bindir}
+    install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz
+}
+
+FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
similarity index 95%
rename from meta-arm/recipes-security/optee/optee-examples_git.bb
rename to meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
index 71be593..7ed3dfa 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
 
-PV = "3.8.0+git${SRCPV}"
-
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
 inherit python3native
@@ -30,6 +28,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  HOST_CROSS_COMPILE=${TARGET_PREFIX} \
                  TA_CROSS_COMPILE=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  OUTPUT_DIR=${B} \
                "
diff --git a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
index d911d80..86e8428 100644
--- a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -1,25 +1,22 @@
-From 030cd84cf0df1c27355ec02e0226317684897a97 Mon Sep 17 00:00:00 2001
+From 017994c477e2d082395460de83a7828d4e7d4b70 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH 6/6] allow setting sysroot for libgcc lookup
+Subject: [PATCH] allow setting sysroot for libgcc lookup
 
 ---
  mk/gcc.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mk/gcc.mk b/mk/gcc.mk
-index c53a23b1..330b200a 100644
+index adc77a24..e238b9f3 100644
 --- a/mk/gcc.mk
 +++ b/mk/gcc.mk
-@@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+@@ -13,7 +13,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
  			-print-file-name=include 2> /dev/null)
  
  # Get location of libgcc from gcc
 -libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
 +libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
  			-print-libgcc-file-name 2> /dev/null)
- 
- # Define these to something to discover accidental use
--- 
-2.17.1
-
+ libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libstdc++.a 2> /dev/null)
diff --git a/meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch b/meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
new file mode 100644
index 0000000..d911d80
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
@@ -0,0 +1,25 @@
+From 030cd84cf0df1c27355ec02e0226317684897a97 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH 6/6] allow setting sysroot for libgcc lookup
+
+---
+ mk/gcc.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index c53a23b1..330b200a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
new file mode 100644
index 0000000..369e011
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
@@ -0,0 +1,83 @@
+SUMMARY = "OP-TEE Trusted OS"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
+HOMEPAGE = "https://www.op-tee.org/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
+
+inherit deploy python3native
+require optee.inc
+
+DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
+
+SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
+SRC_URI = " \
+    git://github.com/OP-TEE/optee_os.git \
+    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+OPTEEMACHINE ?= "${MACHINE}"
+OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
+OPTEE_ARCH = "null"
+OPTEE_ARCH_armv7a = "arm32"
+OPTEE_ARCH_aarch64 = "arm64"
+OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
+
+EXTRA_OEMAKE = " \
+    PLATFORM=${OPTEEMACHINE} \
+    CFG_${OPTEE_CORE}_core=y \
+    CROSS_COMPILE_core=${HOST_PREFIX} \
+    CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
+    NOWERROR=1 \
+    V=1 \
+    ta-targets=ta_${OPTEE_ARCH} \
+    LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+    O=${B} \
+"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+CPPFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+    cd ${S}
+    oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
+}
+do_compile[cleandirs] = "${B}"
+
+do_install() {
+    #install core in firmware
+    install -d ${D}${nonarch_base_libdir}/firmware/
+    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
+
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_deploy() {
+    install -d ${DEPLOYDIR}/optee
+    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
+}
+
+addtask deploy before do_build after do_install
+
+SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
+
+FILES_${PN} = "${nonarch_base_libdir}/firmware/"
+FILES_${PN}-dev = "${includedir}/optee/"
+
+INSANE_SKIP_${PN}-dev = "staticdev"
+
+INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
similarity index 96%
rename from meta-arm/recipes-security/optee/optee-os_git.bb
rename to meta-arm/recipes-security/optee/optee-os_3.8.0.bb
index deeb515..8791bc7 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
-PV = "3.8.0+git${SRCPV}"
-
 inherit deploy python3native
 require optee.inc
 
@@ -20,7 +18,7 @@ SRC_URI = " \
     file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
     file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
     file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch\
     file://missing-mkdir.patch \
 "
 
diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
new file mode 100644
index 0000000..96e612a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
@@ -0,0 +1,55 @@
+SUMMARY = "OP-TEE sanity testsuite"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
+HOMEPAGE = "https://www.op-tee.org/"
+
+LICENSE = "BSD & GPLv2"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
+
+inherit python3native
+require optee.inc
+
+DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
+
+SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
+SRC_URI = "git://github.com/OP-TEE/optee_test.git \
+           file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
+          "
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
+                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
+                 TEEC_EXPORT=${TEEC_EXPORT} \
+                 CROSS_COMPILE_HOST=${TARGET_PREFIX} \
+                 CROSS_COMPILE_TA=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+                 V=1 \
+                 O=${B} \
+               "
+
+do_compile() {
+    cd ${S}
+    # Top level makefile doesn't seem to handle parallel make gracefully
+    oe_runmake xtest
+    oe_runmake ta
+}
+do_compile[cleandirs] = "${B}"
+
+do_install () {
+    install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
+
+    # install path should match the value set in optee-client/tee-supplicant
+    # default TEEC_LOAD_PATH is /lib
+    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
+    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
+}
+
+FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
similarity index 96%
rename from meta-arm/recipes-security/optee/optee-test_git.bb
rename to meta-arm/recipes-security/optee/optee-test_3.8.0.bb
index 957286c..65e6cd1 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
@@ -10,8 +10,6 @@ require optee.inc
 
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
-PV = "3.8.0+git${SRCPV}"
-
 SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
@@ -29,6 +27,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  CROSS_COMPILE_HOST=${TARGET_PREFIX} \
                  CROSS_COMPILE_TA=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  O=${B} \
                "
-- 
2.17.1

