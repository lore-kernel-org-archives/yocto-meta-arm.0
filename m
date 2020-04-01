Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2408.1585782799812710659
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 16:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E73B409AA;
	Wed,  1 Apr 2020 23:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJikRBZHG74p; Wed,  1 Apr 2020 23:13:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2417740B30;
	Wed,  1 Apr 2020 23:13:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B88451718F5;
	Wed,  1 Apr 2020 19:13:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/5] optee-os: upgrade 3.7.0 -> 3.8.0, cleanup
Date: Wed,  1 Apr 2020 19:13:03 -0400
Message-Id: <1585782786-34477-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585782786-34477-1-git-send-email-denis@denix.org>
References: <1585782786-34477-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* Cleanup the recipe - add HOMEPAGE, update DESCRIPTION, indentation
* Depend on PyCryptodomex, but old PyCrypto is still required
* Ensure full support for arm32 platforms - build corresponding core and TA

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/recipes-security/optee/optee-os_git.bb | 63 ++++++++++++++-----------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index 872fd48..47ced12 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -1,52 +1,63 @@
 SUMMARY = "OP-TEE Trusted OS"
-DESCRIPTION = "OPTEE OS"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
+HOMEPAGE = "https://www.op-tee.org/"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
-PV="3.7.0+git${SRCPV}"
+PV = "3.8.0+git${SRCPV}"
 
 inherit deploy python3native
 
-DEPENDS = "python3-pycrypto-native python3-pyelftools-native"
+DEPENDS = "python3-pycrypto-native python3-pyelftools-native python3-pycryptodomex-native"
 
-SRCREV = "a2fa5018cb595a9cd9ab62e82c7485ca57a62084"
-SRC_URI = "git://github.com/OP-TEE/optee_os.git \
-           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
-          "
+SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
+SRC_URI = " \
+    git://github.com/OP-TEE/optee_os.git \
+    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+"
 
 S = "${WORKDIR}/git"
 
 OPTEEMACHINE ?= "${MACHINE}"
 OPTEEOUTPUTMACHINE ?= "${MACHINE}"
 
-EXTRA_OEMAKE = "PLATFORM=${OPTEEMACHINE} CFG_ARM64_core=y \
-                CROSS_COMPILE_core=${HOST_PREFIX} \
-                CROSS_COMPILE_ta_arm64=${HOST_PREFIX} \
-                NOWERROR=1 \
-                ta-targets=ta_arm64 \
-                LDFLAGS= \
-                LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-        "
-
 OPTEE_ARCH_armv7a = "arm32"
 OPTEE_ARCH_aarch64 = "arm64"
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
+"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+CPPFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
 
 do_compile() {
-    unset LDFLAGS
     oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
 }
 
 do_install() {
-    #install core on boot directory
+    #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
-
     install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
-    #install TA devkit
-    install -d ${D}/usr/include/optee/export-user_ta/
 
-    for f in  ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR  $f  ${D}/usr/include/optee/export-user_ta/
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
     done
 }
 
@@ -54,15 +65,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_deploy() {
     install -d ${DEPLOYDIR}/optee
-    for f in ${D}${nonarch_base_libdir}/firmware/*; do
-        install -m 644 $f ${DEPLOYDIR}/optee/
-    done
+    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
 }
 
 addtask deploy before do_build after do_install
 
 FILES_${PN} = "${nonarch_base_libdir}/firmware/"
-FILES_${PN}-dev = "/usr/include/optee"
+FILES_${PN}-dev = "${includedir}/optee/"
 
 INSANE_SKIP_${PN}-dev = "staticdev"
 
-- 
2.7.4

