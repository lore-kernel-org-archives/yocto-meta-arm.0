Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.1431.1589317945517656572
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 14:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R05wA0i0;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id s10so15722907iog.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2020 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vpn7fL/bQdwrwfO+n8YiV6G5FH0j+c2ugEsUWCO82Og=;
        b=R05wA0i0Z9fq6vb3UmElhegfjfeir2HfIxghaDwhJc5rrIjqdKBdM30mOBi80S936J
         aEyFxQHdHjQG5jenxuwjB/x9FoFqw2oZVe7rLeI4FdvDqGnN3ofpv5uLGFG05c+8q88o
         lcaMdUxUiibg1lCjQB/b2G4T49KjeUnT8gK+judA/pYdgrMdVcAQx7oKQW7c5C3zvjj7
         +auzkWmnn3Cqw5qZQ7xtGj+Yqw1FSK+VcGidVgzPbMY43yXou6k8z9AIJnhMpN1OwBMQ
         aTmus4bEZDByJJnklUTafanQh2bchvfPeJepk94EHyhSwV2wE1+LUcosORzAukoQDGhD
         i7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vpn7fL/bQdwrwfO+n8YiV6G5FH0j+c2ugEsUWCO82Og=;
        b=hYE/zwI/Geo+7pirM13tp9cjmYSGqJd7FEAWj0Ie5VVhbXkvJve9QdZRP2uaoWYdKF
         lct/rmFETtLFMlYl9xWZDeZOZZoXsqiX9Kq1BMy3SmuwdDtoLBdWBoujsdf9Eeii89/c
         JrYvThF665eogYmeqUXOT6kfDnfEzhW1UyAmKglOzRfBZnkGmZY9rje0yIzj2Dgc6WTf
         pMFO1Mt0lT4BIL0QSlAv8tRQArVYcgL1B6X4WdoWy2cnmTGw7nQLTSVOutW+zCJCPTeQ
         bLzWxN9rc7/H59V2aUAThUlST/U0DATyCOVIXfcjr2D5U42xeFFx8QHLs0PDudP8Kv43
         ZR2w==
X-Gm-Message-State: AGi0PubPBXDxt4M4dlUFHasXlpzJrtTIOuhJZnTeTP9lVRr0LzO9/Zna
	lJg2rotNQHhxzHb6AcVhLmFWuiIXl84=
X-Google-Smtp-Source: APiQypLkDhcYF4GUTz9ZDLlpFm6JcaLBG51dLvYSyqHRXiA1cpccP3+twI7GrzU3VVrcQfTgAh5xSw==
X-Received: by 2002:a5d:8c95:: with SMTP id g21mr4128244ion.72.1589317944569;
        Tue, 12 May 2020 14:12:24 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:48c7:8e3e:3527:79a])
        by smtp.gmail.com with ESMTPSA id f143sm4008138ilh.17.2020.05.12.14.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:12:23 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
Date: Tue, 12 May 2020 16:12:18 -0500
Message-Id: <20200512211219.19262-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512211219.19262-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200512211219.19262-1-JPEWhacker@gmail.com>

Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates
the need to set the TFA_BUILD_DIR.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index e6d48e4..5600568 100644
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
@@ -90,10 +85,16 @@ do_compile() {
     sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
     export LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}${libdir}:$LD_LIBRARY_PATH
 
-    oe_runmake ${TFA_BUILD_TARGET}
+    (cd ${S} && oe_runmake ${TFA_BUILD_TARGET})
 }
 
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
@@ -102,21 +103,21 @@ do_install() {
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

