Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE13CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:48:58 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.15914.1712332134027374480
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rfClCDVY;
 spf=pass (domain: linaro.org, ip: 209.85.214.177, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e2c725e234so7866795ad.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Apr 2024 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712332133; x=1712936933; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y93LGcBaKqPO9InxbN9XfuTRwgnug/82TPcHeXAdSpc=;
        b=rfClCDVYgNfkOwjSBqS7rfr04jgS1sQW6rt1ezjX/JW8IAgAHtzpE+VjbAg+NdrmEe
         D51uRm6NiQfwNoNBi+LwaBUGJb7bxX89xgCjgW5X8NaDCCqsVELEE3KJzo9DKNPVolky
         HRv9rBxVMdbVCRDQCV4WIoSnqfPemEjjrRsYcuO13cknjBqKQyopfr/lL4J4EqedeJHW
         KoNH2sWgdTg2QSSNDHJ3tqHczc+g3RK5vn4mQCWg0we/ACVjROL/kYT2xWjs5oFKR70V
         BUDpDvgS4hAr50B17XyQltDQkW5oGItgQHpaOupT2nd9h4xIZDW3ZiRsINIaqcvw131N
         EGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712332133; x=1712936933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y93LGcBaKqPO9InxbN9XfuTRwgnug/82TPcHeXAdSpc=;
        b=pl+3ATpaYFam7fVibiCPMZMy8YsRDFSoRT/dkyWTkUnt0gO79xfUlHzfZc8Q7/DUrv
         oBHlrCSDIwBTFBbiqCF4bUTTQGzPkawmLRNNEdps0EwILSktBnjD5/3z4LEvb/fCd+iB
         OpDt3lHP8fgKQOGC6G+krcctnpS6jnXEEl0ipPy1XbKD+J8vlUomtkRBn3gRLUWJacLI
         ayZbWTuAI9d527hMcFOlCmm86UbANEpz/NrsTEXeoVBmpVw0agFQ20SfY+1OQkZAGuhq
         +7ctkYi8qe95pimMVLs68J3d008KYqjbBZFxDEnLAU9dWGpLkJrodcPYc5oy1IQDP3FU
         l7Qw==
X-Gm-Message-State: AOJu0Yz1j3HFDh/RiKbhQYSxYbm0ash0P+Cn0YwNZq0mNvXWN3faNKm+
	6m2aXNbRQilzeyXCsCr8EtGQsvnll3eYmt3g6gidZsib9FQsEHbVwDTvtDqeteQ=
X-Google-Smtp-Source: AGHT+IG4psQczs2RphU9ZwSq9Sn3hS7J2tZzYOtY0Ms74fFg9GW7mVY5ibL4+IgBnAZOsBHqU/cJAA==
X-Received: by 2002:a17:902:c94d:b0:1dd:8ed0:59d0 with SMTP id i13-20020a170902c94d00b001dd8ed059d0mr2727461pla.17.1712332133416;
        Fri, 05 Apr 2024 08:48:53 -0700 (PDT)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:4fd8:98cc:ae26:b7fc])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902a38400b001e23fcdebe9sm1769463pla.98.2024.04.05.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:48:53 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: jon.mason@arm.com,
	ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and patch file for RMM
Date: Fri,  5 Apr 2024 09:48:50 -0600
Message-Id: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Apr 2024 15:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5511

Initial checking providing support for RMM on QEMU's "virt" machine.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
Changes for V3:
1) Setting RMM_CONFIG default to "" and restricting the compilation of
RMM to "qemuarm64" machines.
2) Removed setting of variable "B"
3) Setting CMAKE_INCLUDE_PATH to ${STAGING_INCDIR}
4) Removed CMAKE_BUILD_PARALLEL_LEVEL
5) Added comment to justify using CROSS_COMPILE
6) Reworked the declaration of SRC_URI and SRCREV
---
 ...tra-repositories-for-system-includes.patch | 56 +++++++++++++++++++
 .../trusted-firmware-rmm_0.4.bb               | 50 +++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
new file mode 100644
index 000000000000..7c3e637f0d63
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
@@ -0,0 +1,56 @@
+From bc7dbac20a6674eb2834bd6176665f1a2ae42edc Mon Sep 17 00:00:00 2001
+From: Mathieu Poirier <mathieu.poirier@linaro.org>
+Date: Thu, 14 Mar 2024 14:59:30 -0600
+Subject: [PATCH] build(lib): Add extra repositories for system includes
+
+Toolchains such as aarch64-none-elf, aarch64-none-linux-gnu and
+aarch64-linux-gnu include assert.h and limits.h in a directory that is
+part of their search path.  This is not the case when compiling with
+Yocto where aarch64-poky-linux places those files in the sysroot
+directory of the component being compiled.
+
+Since the sysroot directory of the component is not part of the cmake
+search path, compiling the RMM in Yocto fails.  This patch fixes the
+problem by expanding the search path when needed, allowing the RMM to be
+compiled in Yocto.
+
+Upstream-Status: Backport [bc7dbac20a6674eb2834bd6176665f1a2ae42edc]
+Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
+---
+ lib/arch/CMakeLists.txt | 3 +++
+ lib/libc/CMakeLists.txt | 5 ++++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
+index d3afc5f2bfc8..a52185f02695 100644
+--- a/lib/arch/CMakeLists.txt
++++ b/lib/arch/CMakeLists.txt
+@@ -12,6 +12,9 @@ target_link_libraries(rmm-lib-arch
+ target_include_directories(rmm-lib-arch
+     PUBLIC  "include"
+             "include/${RMM_ARCH}"
++            # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
++            # Yocto recipe will define this variable as part of the build.
++            ${CMAKE_INCLUDE_PATH}
+     PRIVATE "src/${RMM_ARCH}"
+             "src/include")
+ 
+diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
+index 1631332dbc72..a2adf37f7cb8 100644
+--- a/lib/libc/CMakeLists.txt
++++ b/lib/libc/CMakeLists.txt
+@@ -12,7 +12,10 @@ if(NOT RMM_ARCH STREQUAL fake_host)
+            rmm-lib-debug)
+ 
+     target_include_directories(rmm-lib-libc SYSTEM
+-        PUBLIC "include")
++        PUBLIC "include"
++        # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
++        # Yocto recipe will define this variable as part of the build.
++        ${CMAKE_INCLUDE_PATH})
+ 
+     target_sources(rmm-lib-libc
+         PRIVATE "src/abort.c"
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
new file mode 100644
index 000000000000..0726cd3d2497
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
@@ -0,0 +1,50 @@
+SUMMARY = "RMM Firmware"
+DESCRIPTION = "RMM Firmware for Arm reference platforms"
+LICENSE = "BSD-3-Clause & MIT"
+
+SRC_URI = "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https;branch=main \
+           file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
+          "
+
+SRCREV = "0a02656945d69757b0779192cebb9b41dd9037d1"
+
+LIC_FILES_CHKSUM += "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
+
+inherit deploy cmake
+
+RMM_CONFIG ?= ""
+RMM_CONFIG:qemuarm64 = "qemu_virt_defcfg"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "qemuarm64"
+
+S = "${WORKDIR}/git"
+
+# Build for debug (set RMM_DEBUG to 1 to activate)
+RMM_DEBUG ?= "0"
+RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
+
+# Handle RMM_DEBUG parameter
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
+EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
+
+# Supplement include path
+EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${STAGING_INCDIR}"
+
+# When compiling for Aarch64 on non-native hosts, the RMM code base gets its
+# toolchain from CROSS_COMPILE rather than CMAKE_TOOLCHAIN_FILE
+export CROSS_COMPILE="${TARGET_PREFIX}"
+
+do_install() {
+    install -d -m 755 ${D}/firmware
+    install -m 0644 ${B}/${RMM_BUILD_MODE}/* ${D}/firmware/
+}
+
+FILES:${PN} = "/firmware"
+SYSROOT_DIRS += "/firmware"
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+
+addtask deploy after do_install
-- 
2.34.1


