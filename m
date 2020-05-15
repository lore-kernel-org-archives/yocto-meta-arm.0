Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.16646.1589558568501066704
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 May 2020 09:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ge2wTP1L;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id l20so3034770ilj.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 May 2020 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mKBHCkjtCX9/oFAHRqNihtVvqqkeEwjGQz2w+dV4SEQ=;
        b=ge2wTP1LAlIODvIjoS2YtddMzz9wy2S7lW7m1OHA6iyPOtsbPwmXwsaI7v6+1By6/4
         Jm7h1Ut06AXCizWAPHvcLsgsthMpcKGy78bhKQ+zXhIGyTrFOOJjBl4yUG13vf87gBbz
         vUHZjUviU6OfJB6/AK1rsmZIim6QocEAncTYCO201WZ5ttm3sWcOFOqnbnMk/Xzz8IeZ
         hogP+NDPdyPsCxOdg9ttCS8w6EebMlNVQ46u1+1y5PboPMnbQLB192AT0L7cMo1IWL2T
         EqEf7j9eCujGK8sF4K01iDuJ3H9n436PM2Y2rWEtX4tF2bUs/WOu+sNvQCnuwxlCS2vu
         /Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mKBHCkjtCX9/oFAHRqNihtVvqqkeEwjGQz2w+dV4SEQ=;
        b=PI+pvfZFzE1sbuOayPlzRonS9ToZu7L+87G3pV3/EoFPBmTHrkQ9J/ZiUDlDsVy7xA
         3C+nXcCDie3/3sitW2QUyEFWhhe6MsKQZmIePidTgOqKFxXOAaP/QzBFQJxgCEPqFvIq
         9T8FO0fDo441FMo4JWCYIJMMXWr1dFxXHz1JDlG9h5xJK5s6xhsFJb+2iaGPYit71LS2
         FkkXm7kAh3D3dVI7TdvwgDPkZu4gYi0UXiIA21Fb08/cv6XxsIlZAAdK0HWmvV0K9rgr
         Xd/TA545NVixjpSgtVZW53XuyMdKB3yey8nqpFMpJoq8MNqbIZOUx/q+RBxXFLeCTGG4
         Da4A==
X-Gm-Message-State: AOAM533bSQ2/YjleQqPrNYaXCzHX3e0tnGm4ZjPfHRw4dikDxmLjBbSu
	VNST3Qghtgx30frIVFSLQEtP59ZA3bY=
X-Google-Smtp-Source: ABdhPJzSXcuhkgy+5Xp5rWbD3hIT5A3gujLrxLXmo1f6igGHtYIxbXpdHaAC7zI5mt0lCir24L/1LA==
X-Received: by 2002:a92:2a0d:: with SMTP id r13mr3886796ile.21.1589558567505;
        Fri, 15 May 2020 09:02:47 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:7472:a058:3fd7:24e9])
        by smtp.gmail.com with ESMTPSA id c10sm878132ioc.24.2020.05.15.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 09:02:46 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2 1/3] optee-{os,examples,client,test}: Build out of tree
Date: Fri, 15 May 2020 11:02:38 -0500
Message-Id: <20200515160240.16395-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515160240.16395-1-JPEWhacker@gmail.com>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>

Modifies the optee recipes to all build out of tree. This is cleaner and
helps prevent build error from stale builds when dependencies change.
Also allows the elimination of the OPTEEOUTPUTMACHINE variable in
optee-os.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-security/optee/optee-client_git.bb  | 17 +++++++++++++----
 .../optee/optee-examples_git.bb                 |  8 ++++++--
 meta-arm/recipes-security/optee/optee-os_git.bb | 10 ++++++----
 .../recipes-security/optee/optee-test_git.bb    |  8 ++++++--
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
index bae7b20..ec0826c 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -18,20 +18,29 @@ SRC_URI = " \
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
-    oe_runmake install
+    (cd ${S} && oe_runmake install)
 
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
index dfff6d1..d58b89f 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -19,10 +19,9 @@ SRC_URI = " \
 "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
 
 OPTEEMACHINE ?= "${MACHINE}"
-OPTEEOUTPUTMACHINE ?= "${MACHINE}"
-
 OPTEE_ARCH = "null"
 OPTEE_ARCH_armv7a = "arm32"
 OPTEE_ARCH_aarch64 = "arm64"
@@ -37,6 +36,7 @@ EXTRA_OEMAKE = " \
     V=1 \
     ta-targets=ta_${OPTEE_ARCH} \
     LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+    O=${B} \
 "
 
 CFLAGS[unexport] = "1"
@@ -48,17 +48,19 @@ LD[unexport] = "1"
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

