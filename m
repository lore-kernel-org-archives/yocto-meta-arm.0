Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.6883.1590070988199476497
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 May 2020 07:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gndq52Vw;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id r10so3228404pgv.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 May 2020 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mdgLq6KDROHDLF4qE32sz15uwRb//prWBohPYQgX6Dw=;
        b=gndq52VwBtNeOoaB3k3MsrKbPIH29qcqTz6Brimw5Sx+OPsiKfij4O/GonAMoOhlSb
         uBWCAxodjR42VBdLtuX47/lH5rI2B6Kf59DJg30kGNNtSmRDW6vXgwK/6+f3YoyJuscM
         VHJd7RmEfnztnHNXD8PW8YLg2gTqnP9nd4kmMhm6dxYxR6Vjs2YF8C65F+eNtSTQQm0A
         5FUly19H+ySPX2ZD+XAbHGKEM8KA7Legp4Mq+LxGNEYMpWgDLlR7Mkam1so6RqiIFRMA
         375cRFrdg7/Euw0xfF7UIPlhbkQWA61TNjcS7cMLF7cd85jqT+uJNoHsTBZ10CwW1AoY
         LUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mdgLq6KDROHDLF4qE32sz15uwRb//prWBohPYQgX6Dw=;
        b=ALJlHqpDsR6DWlw8EW/qoaff4q7lj/Roz3O1ImggOI5y3sOo/iy/nDgQp8+GIaioJQ
         nbMIbB+U3rjXsmIgjT0Uvmq4bOvWoTRO3cJ+FdP+cmQGCbw4QqwdYLDrjsHrE/Ij8tnu
         N3dGpn3B0nNKhSFAN3Id9dFeCJS4bjoWoRVO3PoA5UKEDTyZAFUtXEHWMsIIThrJXIZP
         WD7DA8zIqP8P2JSIHnV04mFKDfYM7x9RWpzigE9mHSbEak6zMPcfFNTuMKmGlU5yPHWH
         iSaQOvKf7MsL7TMwNlT/qvg7QDsH0HbERfTFmxqS5QSoYw/qHgw/trnw0/QHkGkopjAp
         /tSw==
X-Gm-Message-State: AOAM533RmTG0pMNldceIL+pRo+VAnSAbo4X8SfebUCh9aj0ep+lbSFCm
	M3FUdJ2KmrGJo0Z9QKUzcCoMICoQ1BI=
X-Google-Smtp-Source: ABdhPJxIfRr6DR8JP+73DPV3NQk1jGKP8VoLHssRQJ3XbGyOvD5KKESDSZdP0RLVqbP2phkrtIdqjQ==
X-Received: by 2002:a63:4cc:: with SMTP id 195mr9124262pge.294.1590070987345;
        Thu, 21 May 2020 07:23:07 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:dd2f:75de:f1b0:dc7a])
        by smtp.gmail.com with ESMTPSA id 5sm4556081pjf.19.2020.05.21.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 07:23:06 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v3 1/3] optee-{os,examples,client,test}: Build out of tree
Date: Thu, 21 May 2020 09:22:57 -0500
Message-Id: <20200521142259.15363-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521142259.15363-1-JPEWhacker@gmail.com>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200521142259.15363-1-JPEWhacker@gmail.com>

Modifies the optee recipes to all build out of tree. This is cleaner and
helps prevent build error from stale builds when dependencies change.
Also allows the elimination of the OPTEEOUTPUTMACHINE variable in
optee-os.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-security/optee/optee-client_git.bb   | 16 +++++++++++++---
 .../recipes-security/optee/optee-examples_git.bb |  8 ++++++--
 meta-arm/recipes-security/optee/optee-os_git.bb  | 10 ++++++----
 .../recipes-security/optee/optee-test_git.bb     |  8 ++++++--
 4 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
index bae7b20..64d7d57 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -18,20 +18,30 @@ SRC_URI = " \
 "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
 
 SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
 
+EXTRA_OEMAKE = "O=${B}"
+
+do_compile() {
+    cd ${S}
+    oe_runmake
+}
+do_compile[cleandirs] = "${B}"
+
 do_install() {
+    cd ${S}
     oe_runmake install
 
-    install -D -p -m0755 ${S}/out/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
+    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
 
-    install -D -p -m0644 ${S}/out/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
+    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
     ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
     ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
 
     install -d ${D}${includedir}
-    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
+    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
 
     sed -i -e s:/etc:${sysconfdir}:g \
            -e s:/usr/bin:${bindir}:g \
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
index 996e2cd..04cc5fd 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
 SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
 
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
@@ -28,17 +29,20 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  HOST_CROSS_COMPILE=${TARGET_PREFIX} \
                  TA_CROSS_COMPILE=${TARGET_PREFIX} \
                  V=1 \
+                 OUTPUT_DIR=${B} \
                "
 
 do_compile() {
+    cd ${S}
     oe_runmake
 }
+do_compile[cleandirs] = "${B}"
 
 do_install () {
     mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
     mkdir -p ${D}${bindir}
-    install -D -p -m0755 ${S}/out/ca/* ${D}${bindir}
-    install -D -p -m0444 ${S}/out/ta/* ${D}${nonarch_base_libdir}/optee_armtz
+    install -D -p -m0755 ${B}/ca/* ${D}${bindir}
+    install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz
 }
 
 FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index eced362..dcbe990 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -20,10 +20,9 @@ SRC_URI = " \
 "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
 
 OPTEEMACHINE ?= "${MACHINE}"
-OPTEEOUTPUTMACHINE ?= "${MACHINE}"
-
 OPTEE_ARCH = "null"
 OPTEE_ARCH_armv7a = "arm32"
 OPTEE_ARCH_aarch64 = "arm64"
@@ -38,6 +37,7 @@ EXTRA_OEMAKE = " \
     V=1 \
     ta-targets=ta_${OPTEE_ARCH} \
     LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+    O=${B} \
 "
 
 CFLAGS[unexport] = "1"
@@ -49,17 +49,19 @@ LD[unexport] = "1"
 do_configure[noexec] = "1"
 
 do_compile() {
+    cd ${S}
     oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
 }
+do_compile[cleandirs] = "${B}"
 
 do_install() {
     #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
+    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
 
     #install TA devkit
     install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
         cp -aR $f ${D}${includedir}/optee/export-user_ta/
     done
 }
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
index ee73a2c..f699972 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -16,6 +16,7 @@ SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
 SRC_URI = "git://github.com/OP-TEE/optee_test.git"
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
 
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
@@ -27,21 +28,24 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  CROSS_COMPILE_HOST=${TARGET_PREFIX} \
                  CROSS_COMPILE_TA=${TARGET_PREFIX} \
                  V=1 \
+                 O=${B} \
                "
 
 do_compile() {
+    cd ${S}
     # Top level makefile doesn't seem to handle parallel make gracefully
     oe_runmake xtest
     oe_runmake ta
 }
+do_compile[cleandirs] = "${B}"
 
 do_install () {
-    install -D -p -m0755 ${S}/out/xtest/xtest ${D}${bindir}/xtest
+    install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
 
     # install path should match the value set in optee-client/tee-supplicant
     # default TEEC_LOAD_PATH is /lib
     mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
-    install -D -p -m0444 ${S}/out/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
+    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
 }
 
 FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
-- 
2.17.1

