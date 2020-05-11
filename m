Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.13066.1589207180431432489
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 07:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FBae+wfA;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id i19so9813131ioh.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=abxl8Z2XHSTk4hLoRBBpigH+uDKXHTva0x1+w4uMlsE=;
        b=FBae+wfAJjjxY8XnFYWFdwDDNDQ64mXzGRosDBz8KL4CbnhwO1CU4YXckrrr5a2It3
         32EVdtMV6fOBpYa2sq3bO3JvWmcy4BtS+/bW9lkdVB0N+65aWOna14+KoMGgJp9/HEDJ
         SPtys9xkbqepsHdrytDAw/ZL7kn8+ExnkLiyqUpA+JclgZSegGO/hEYGjqwHNIL5Bsz5
         4msawnyB1NRp+ugtOGozPwKZ26q+BYcFZKqgr8VNj1aH0P7hmmkWQ/vhHtiRPtOIsMej
         bBsP5n1c6UZLjP3oEk4unNKQulO0Vx9csCUUDM6EWM7m4bZLpmadMrXcPc0FRoCXEHXN
         txoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=abxl8Z2XHSTk4hLoRBBpigH+uDKXHTva0x1+w4uMlsE=;
        b=iH26hJ56CKvIvh+Q7+OVSh2mNNOnV2BlMzw512nM1izchbfcc8hE7WIneKHsETIT6X
         CgJOyetH1mQyly62HurXqbeM4naZOQxINXJ5X+BXx75IIvgC3HGUKeul4SM6vCra51Az
         po14w4zPzYC8S4ptQaqpFaE3vrgExBfEmu9fgty/MqItG6UFWX2S1CwWha0H21736ciP
         jpPjMS90u/uGAIAWX/zwhj5fBD+UT8E13En3HOXQ9op9u3AfNEYzyWTIThFNAS7B8Wz9
         ZwSmS65O6wSaPeko284SZPg/2xkzRtYQCULGho0ns6gs21erq9FRycVoO57NiZA+fD/q
         nCKw==
X-Gm-Message-State: AGi0PubzyruI8A6IFv4MiVq8NbSDfID6DDynuXf27XD5gnu+jJgV9jE6
	ldtY3jN0+fc68S4ESh38NHWm5hAp
X-Google-Smtp-Source: APiQypIf7msjYpjJWkfNwvRb8gOQUyfrAIvxdlsPDyQbc9t3anM9vuVvzD5kIG9SaWMqPVWRmk97qw==
X-Received: by 2002:a5d:9d51:: with SMTP id k17mr9210746iok.85.1589207179567;
        Mon, 11 May 2020 07:26:19 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:ac13:ea07:8c16:df2d])
        by smtp.gmail.com with ESMTPSA id a1sm5152256ilq.75.2020.05.11.07.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:26:19 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH 1/3] trusted-firmware-a: Build out of tree
Date: Mon, 11 May 2020 09:26:02 -0500
Message-Id: <20200511142604.11860-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511142604.11860-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>

Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates
the need to set the TFA_BUILD_DIR.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 93ca199..197ab92 100644
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
@@ -83,10 +78,16 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAG
 
 
 do_compile() {
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
@@ -95,21 +96,21 @@ do_install() {
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

