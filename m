Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.9023.1589384832185840705
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 08:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pQvnLG0U;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id d7so18549433ioq.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XVT3W0t0N+kOfOD54NKUsAdfBLLf9vHSp+G2+9+DqZ4=;
        b=pQvnLG0UGnmUaxINOwnU6z75KwbayPOZqCd+aamW9gR0ZPtIHZaiKNK1j9ns96wdPs
         sR8jNH2B9FXFdf0ovjJxKSZbNpeXuBTnLpc5vAQaicSBOvkooJStxcnRkO9CVu889pXF
         MZSD+VmHWMVu+AzHfVup+2jbSh6loyoK8ujn7+Q9w/ailCcVee4WwzGWSHgOsvdi7ANc
         xNmUezrxyabWR5O83BtqSjhy6eSfHECSO5sqQilo09ir6dzE1QFR1YSHvDYtR6vn3rFI
         iq5lPwX0h711Kih7OmkZUOMa8ppvJRtSSiEOhgw9fUmKoe2KKTEoj1XfzNw5NYxGUhkw
         ijCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XVT3W0t0N+kOfOD54NKUsAdfBLLf9vHSp+G2+9+DqZ4=;
        b=Zn79tOb8yZOvFDQ89iF3FUMIR7yxcnQxhbMDQgMtsrm8+kD2HFqUj7BkNgzVAbxViu
         CaMdFXF2v8OJjXRLdbanYfDyaLZ3sR+++yNdjYhV2jhWWKmg2lPWB0Z8S2SoP/gCKiMn
         tZYcd4yW429WtvQUIxBdrrPQiYn0rr5rN+8Bg3oij7D9/vIXMcU3bEgSpLspNr3ZCVjY
         Q6FBZs/eYnefYoqc2lE/goOFdFKHpIJMQbOvIz9C/KR/7tHzdXSL45MV3c8A54WNo2dX
         7fZnwxMuy+/OtA9ME4XZzFEyQxVm2F0kAN/McFZqn6fq6E5jXLnUgM7Q4gnKfk3NtDw6
         5Hew==
X-Gm-Message-State: AGi0PubkuTCpKr7vtPak3q+WvBStnGO6wuor1qCeACAO0Syx/q/DXRd8
	IDNofmsMQy/BhS6fFdSOfmVhhXMOWHo=
X-Google-Smtp-Source: APiQypIpwsE9SzkUgQB7/LyzkP5+sDVGchDBWnUowCYiIacs5QojHtOxJ3xMVLEAyQ88wtdHRGGNVQ==
X-Received: by 2002:a02:7113:: with SMTP id n19mr137330jac.113.1589384831196;
        Wed, 13 May 2020 08:47:11 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:11af:b72d:1039:51ec])
        by smtp.gmail.com with ESMTPSA id c10sm35412ioc.24.2020.05.13.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 08:47:10 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v3 1/2] trusted-firmware-a: Build out of tree
Date: Wed, 13 May 2020 10:47:06 -0500
Message-Id: <20200513154707.33747-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513154707.33747-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>

Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates
the need to set the TFA_BUILD_DIR.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index e6d48e4..febd8ce 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -15,12 +15,7 @@ TFA_PLATFORM ?= "invalid"
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?= "0"
 
-# Sub-directory in which to build.
-# This must be coherent with BUILD_PLAT make parameter so that deploy can find
-# the produced binaries
-TFA_BUILD_DIR ?= "build-${TFA_PLATFORM}"
-# set BUILD_PLAT depending on configured BUILD_DIR
-EXTRA_OEMAKE += "BUILD_PLAT=${TFA_BUILD_DIR}"
+B = "${WORKDIR}/build"
 
 # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
 TFA_MBEDTLS ?= "0"
@@ -68,7 +63,7 @@ do_configure[noexec] = "1"
 DEPENDS_append = " dtc-native openssl-native"
 
 # Add platform parameter
-EXTRA_OEMAKE += "PLAT=${TFA_PLATFORM}"
+EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
 
 # Handle TFA_DEBUG parameter
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
@@ -85,6 +80,8 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAG
 # TFA is forcing the host compiler and its flags in the Makefile using :=
 # assignment for GCC and CFLAGS.
 do_compile() {
+    cd ${S}
+
     # These changes are needed to have the fiptool compiling and executing properly
     sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},' ${S}/tools/fiptool/Makefile
     sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
@@ -92,8 +89,15 @@ do_compile() {
 
     oe_runmake ${TFA_BUILD_TARGET}
 }
+do_compile[cleandirs] = "${B}"
 
 do_install() {
+    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
+        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
+    else
+        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
+    fi
+
     install -d -m 755 ${D}/firmware
     for atfbin in ${TFA_INSTALL_TARGET}; do
         if [ "$atfbin" = "all" ]; then
@@ -102,21 +106,21 @@ do_install() {
             bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
             bberror "rewrite or turn off do_install"
             exit 1
-        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
+        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
             echo "Install $atfbin.bin"
-            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
+            install -m 0644 $BUILD_PLAT/$atfbin.bin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
-        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
+        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
-            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
+            install -m 0644 $BUILD_PLAT/$atfbin.elf \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
-        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
+        elif [ -f $BUILD_PLAT/$atfbin ]; then
             echo "Install $atfbin"
-            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
+            install -m 0644 $BUILD_PLAT/$atfbin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}
         elif [ "$atfbin" = "dtbs" ]; then
             echo "dtbs install, skipped"
-        elif [ -f ${S}/tools/$atfbin/$atfbin ]; then
+        elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
             echo "Tools $atfbin install, skipped"
         else
             bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
-- 
2.17.1

