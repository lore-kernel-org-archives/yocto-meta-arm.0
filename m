Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.2917.1596017512710797794
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=NDaZR4mv;
 spf=pass (domain: burtonini.com, ip: 209.85.128.68, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f68.google.com with SMTP id g8so2195023wmk.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEQprHgtnaKjgUq7DXsP4aHoAf/UDCqTg3VSxm+mlP8=;
        b=NDaZR4mvGMeZIPgI966lUKrMNnNeiBme/o9oBqZhoFlgJyoLYoRfaIwceqWua+w+B0
         y+Gjs4q/m04f7YHYIJ8McJVJK7W9H+/h33zW4ZAWgECU42A6MiXtIpj+fHX1ZGlG194o
         t+FgBAaaWKzhvNNqW+/POpwJxtfP7mfQJOhpsV70xxgK4uozKKLsrwhHQcHS/ZTdhRwD
         Cj3oNE6X/DlU9tHVVA87T0zHasbUi+hnbtGtdexx/bOpK7iHpqZq365DgNN0/r+8iTuR
         hv+w7zp404zTVChUp8FTdIyZPl2fOR0zFN73ErRtRmE6+H9lDwgpcLtJN1s+p8aPDW4V
         m4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEQprHgtnaKjgUq7DXsP4aHoAf/UDCqTg3VSxm+mlP8=;
        b=U95L1PK2Mk6ry6fFJZEuFHUdeAy6Z41EkTyq/E5FlwU30UtrBAs11+PVGRl/YaU48y
         lxQxDKt3Rwsm64Yr8gbamidpq0iqtAMzOqbwYhxMzLEKbacvAGmpBSPoNf69FEHuAejE
         5e47oiPasLPzu8KQgppvzMj5bPkWPniwnphJmLQoFumW+VAZKhymi24LkfAfoapSsWYn
         X97A2e7fDs0MDSt9Gn6My5BnQMFkSOrXPR/GtU/fFnRsyAvdW/LMtefbRnuC7sb1mSGH
         june6ACHkbUZZtaDEUq51PlC/LrkRBwnMDrH7WNQeZXhn0VxQHWyXF3APXGWSfVaDPqz
         MRBQ==
X-Gm-Message-State: AOAM530KgIlHdZ1RDRZfC9wsqFwFBY6pRKWKyhqZyn5NJOz9OBpietX+
	AtVKlPMCF+RQpt1Cwt21mT3qrTwvnkt34EjL
X-Google-Smtp-Source: ABdhPJx/qqz3UbtvdKi1jr6rrJDsMeh0Ifp+TO0FLlbkA43iFPzCk2Io+1kaf9tm3fL/s033ctkhGA==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr7718918wme.19.1596017510770;
        Wed, 29 Jul 2020 03:11:50 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.49
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:49 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/9] arm/scp-firmware: merge bb/inc
Date: Wed, 29 Jul 2020 11:11:37 +0100
Message-Id: <20200729101145.1794231-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

There's no other recipe that uses scp-firmware.inc, so merge it into the
recipe for clarity.

Change-Id: Ife1874b54c8b2be2704e1d0f5a7013ff89b8ca6e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware.inc | 73 -------------------
 .../scp-firmware/scp-firmware_git.bb          | 73 ++++++++++++++++++-
 2 files changed, 72 insertions(+), 74 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
deleted file mode 100644
index 2db59d3..0000000
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
+++ /dev/null
@@ -1,73 +0,0 @@
-SUMMARY = "SCP and MCP Firmware"
-
-PROVIDES += "virtual/control-processor-firmware"
-
-SCP_BUILD_RELEASE   ?= "1"
-SCP_COMPILE_VERBOSE ?= "0"
-SCP_PLATFORM        ?= "invalid"
-SCP_COMPILER        ?= "arm-none-eabi"
-SCP_LOG_LEVEL       ?= "WARN"
-
-DEPENDS += "virtual/arm-none-eabi-gcc-native"
-
-SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
-SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0', '', 'V=1', d)}"
-
-inherit python3native
-inherit deploy
-
-B = "${WORKDIR}/build"
-S = "${WORKDIR}/src"
-
-# Allow platform specific copying of only scp or both scp & mcp, default to both
-FW_TARGETS ?= "scp mcp"
-
-COMPATIBLE_MACHINE ?= "invalid"
-
-LDFLAGS[unexport] = "1"
-
-# The gcc-arm-none-eabi version does not support -fmacro-prefix-max
-DEBUG_PREFIX_MAP_pn-scp = "\
-    -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
-"
-
-# No configure
-do_configure[noexec] = "1"
-
-EXTRA_OEMAKE = "${SCP_COMP_STR} \
-                BUILD_PATH='${B}' \
-                PRODUCT='${SCP_PLATFORM}' \
-                MODE='${SCP_BUILD_STR}' \
-                LOG_LEVEL='${SCP_LOG_LEVEL}' \
-                CC='${SCP_COMPILER}-gcc' \
-                AR='${SCP_COMPILER}-ar' \
-                SIZE='${SCP_COMPILER}-size' \
-                OBJCOPY='${SCP_COMPILER}-objcopy' \
-                "
-
-do_compile() {
-    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
-}
-do_compile[cleandirs] += "${B}"
-
-do_install() {
-     install -d ${D}/firmware
-     for FW in ${FW_TARGETS}; do
-        for TYPE in ramfw romfw; do
-           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
-        done
-     done
-}
-
-FILES_${PN} = "/firmware"
-SYSROOT_DIRS += "/firmware"
-# Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN} = "textrel"
-
-do_deploy() {
-    # Copy the images to deploy directory
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
index 9cb8b64..e9d8057 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -1,3 +1,4 @@
+SUMMARY = "SCP and MCP Firmware"
 DESCRIPTION = "Firmware for SCP and MCP software reference implementation"
 HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
 
@@ -17,4 +18,74 @@ SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
 SRCREV_cmsis  = "refs/tags/5.2.0"
 SRCREV_FORMAT = "scp_cmsis"
 
-require scp-firmware.inc
+PROVIDES += "virtual/control-processor-firmware"
+
+SCP_BUILD_RELEASE   ?= "1"
+SCP_COMPILE_VERBOSE ?= "0"
+SCP_PLATFORM        ?= "invalid"
+SCP_COMPILER        ?= "arm-none-eabi"
+SCP_LOG_LEVEL       ?= "WARN"
+
+DEPENDS += "virtual/arm-none-eabi-gcc-native"
+
+SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
+SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0', '', 'V=1', d)}"
+
+inherit python3native
+inherit deploy
+
+B = "${WORKDIR}/build"
+S = "${WORKDIR}/src"
+
+# Allow platform specific copying of only scp or both scp & mcp, default to both
+FW_TARGETS ?= "scp mcp"
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+LDFLAGS[unexport] = "1"
+
+# The gcc-arm-none-eabi version does not support -fmacro-prefix-max
+DEBUG_PREFIX_MAP_pn-scp = "\
+    -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+"
+
+# No configure
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = "${SCP_COMP_STR} \
+                BUILD_PATH='${B}' \
+                PRODUCT='${SCP_PLATFORM}' \
+                MODE='${SCP_BUILD_STR}' \
+                LOG_LEVEL='${SCP_LOG_LEVEL}' \
+                CC='${SCP_COMPILER}-gcc' \
+                AR='${SCP_COMPILER}-ar' \
+                SIZE='${SCP_COMPILER}-size' \
+                OBJCOPY='${SCP_COMPILER}-objcopy' \
+                "
+
+do_compile() {
+    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
+}
+do_compile[cleandirs] += "${B}"
+
+do_install() {
+     install -d ${D}/firmware
+     for FW in ${FW_TARGETS}; do
+        for TYPE in ramfw romfw; do
+           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
+        done
+     done
+}
+
+FILES_${PN} = "/firmware"
+SYSROOT_DIRS += "/firmware"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP_${PN} = "textrel"
+
+do_deploy() {
+    # Copy the images to deploy directory
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
-- 
2.26.2

