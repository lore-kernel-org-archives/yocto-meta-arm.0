Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE20C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 20:20:11 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.20710.1711484405065902566
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Mar 2024 13:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=L53VIyWA;
 spf=pass (domain: linaro.org, ip: 209.85.161.42, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a4a14c52fcso2756926eaf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 Mar 2024 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484404; x=1712089204; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4R6xnmjs4mnlAtxhSNFHRXIfKkkeUYuCLs2Dgu1RO0I=;
        b=L53VIyWAG71cdbHoL27XMdYLBh3kAgU8ynIwkL2LktwiKMsihKqUsnc2cbY85u6Kse
         lWz+cHVKW6HLx/7sETUkYmuq1SF3MYDJboR7miUzCLghNqrmE2RORzcF+GuLVgISiK2O
         YA/YHPi/MucFtH5tWUvGVDztCQnmSV9BWrL2bLjxvzYJmJAnZqJHIHo+k4z8t98YzULG
         HKb+RwZQ/UvrCo9jw07337gnntiJBejL65BVLRigFWMhSqDgPcQ0TNQPJxFJvAiZKVoW
         8L8eHRzDtqRiQFM9fdVd/E2cQg3VLLe4UW9qI6b8LX9hUIvERexr9CDjBa5z/eidBrZw
         q6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484404; x=1712089204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4R6xnmjs4mnlAtxhSNFHRXIfKkkeUYuCLs2Dgu1RO0I=;
        b=UGd3ROqpwQTozypE4JnuCS04MGDAvP3G+rQ07acrKyzvC2g901czjZwubH9eMiyRuS
         wbSo0PF2OScrMrSCB/qEEmlqNMJgFZsZ7UVLpVcs9Yxe73f/Xdr8UIx+HrCjfqqzA8gL
         qayp1Z3HsGzAV8JveG0Ad1nXZ+hOBJfVfTBUWQvs43iMUHTbZFuvS08zrLS6yLW5EYkz
         /6iZJwwy/Ks+mBcQErpk27VbmdCPVw3vrKsf7sWBCmIOX4dJpKzW3Hy1R60NBXuTg4Lt
         TQudZsSF1AgUtMt2tMQ8mGp36i6SmyXY380O7zLqn3Fhozh9J4DJ98jYmPdWDhVXvf0I
         2m9A==
X-Gm-Message-State: AOJu0YzbW+/SjddV/RjPnOuL/Ba6FWJugF4xEwUJ8BO1j5mzi4rIdpoe
	pocM0/lPEKk45cz4HWP2pgMpEOgxz87M0y7gKQSK0QNxnWfY4UYJfdreHRyo/pY=
X-Google-Smtp-Source: AGHT+IHlyhmgeqBZivlay+61r3Ibr89JntddtEHLvHQ5QozY8UIRcEvgWUNFcqHXK4OYnAu3vjU3iw==
X-Received: by 2002:a05:6359:4c08:b0:17f:77e5:85df with SMTP id kj8-20020a0563594c0800b0017f77e585dfmr1000571rwc.2.1711484404163;
        Tue, 26 Mar 2024 13:20:04 -0700 (PDT)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:d511:8fd:aa72:6ac])
        by smtp.gmail.com with ESMTPSA id 32-20020a631560000000b005dccf9e3b74sm7875697pgv.92.2024.03.26.13.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:20:03 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: jon.mason@arm.com,
	ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and patch file for RMM
Date: Tue, 26 Mar 2024 14:20:01 -0600
Message-Id: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Mar 2024 20:20:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5489

Initial checking providing support for RMM on QEMU's "virt" machine.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
Changes for V2:
1) Added an "Upstream-Status" tag to the patch
2) Fixed LIC_FILES_CHKSUM variable to conform to Yocto declarations
3) Using the cmake class for configuration and compilation
4) Set the recipe's SHA to align with RMM release 0.4.0
5) Using "trusted-firmware-rmm" rather than "rmm" 
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
index 000000000000..d8a802a5175f
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
@@ -0,0 +1,50 @@
+SUMMARY = "RMM Firmware"
+DESCRIPTION = "RMM Firmware for Arm reference platforms"
+LICENSE = "BSD-3-Clause & MIT"
+
+SRC_URI_RMM	     ?= "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https"
+SRCREV_rmm	     ?= "0a02656945d69757b0779192cebb9b41dd9037d1"
+SRCBRANCH_rmm	     ?= "main"
+
+SRC_URI = "${SRC_URI_RMM};name=rmm;branch=${SRCBRANCH_rmm} \
+	   file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
+	"
+
+LIC_FILES_CHKSUM += "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
+
+inherit deploy cmake
+
+RMM_CONFIG ?= "qemu_virt_defcfg"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
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
+EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${WORKDIR}/recipe-sysroot/usr/include"
+
+export CROSS_COMPILE="${TARGET_PREFIX}"
+export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
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


