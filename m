Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6B0C54E4A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 23:16:50 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.8029.1709594204168090702
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 15:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WW1vbPXa;
 spf=pass (domain: linaro.org, ip: 209.85.215.178, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5dca1efad59so4278606a12.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 15:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709594203; x=1710199003; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvzxXyNg1dzrs+YtejNwCGJxEcgv7I3mbX7sRMRJ5/k=;
        b=WW1vbPXailzd0qQTj4zvel2gz5SdfR57m2kt6q6P0+KKxta+hxXqctOeGv2Z95jUs0
         mR4c6nz+ZGL70egR5mhrNSAVVnLMsIimqDsjnOdusbe58ENvEO4c+coYzrTmS6lHt91l
         wL5kVUujOMNKRM+iP7wmT+taOO9SIkEA+t/S7HkOh3HcHqzavS8kaB1rc1MzSM1GQ9CO
         7gKBliv4GD4oDOPd30V+PH+k1HEXS13qdOhcRuMcTSvlf55VQXLSSYh4qnr5/Gqa2ANc
         OHLl3n+IsbNDfzzuQrpABeftj8RXKiQ0VE3Bs/W+m4mir0PQPNG/g4ep5+XUns2Hd66m
         MWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709594203; x=1710199003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvzxXyNg1dzrs+YtejNwCGJxEcgv7I3mbX7sRMRJ5/k=;
        b=dY5txj6CK3EKBR8PaFaRuPpYUOlbB598tX3egzGhUKSZTMQ/4VTAjo9yrkC4ao8asV
         JDGtaQaSUXlbQwmCynYFA6IsdJ9g7Q7aYLE8cvYiZ1gUc7kUPOaIZDspvWootCiiWTFf
         XtEfn4Mc6UsdjvzTeMtGKuHFmHazEYIBgp1UEPb/BUPobEbN1rMzuKwkuyHPKnlLwnxc
         2lYp4u2qGAYbwOYPksCa9+Srg7+6Eknsmo0tUpXuJl2c3Q3zWirHunaI/4O32FpzuQXo
         J7jHRS4Vz4hWloasqkWVMOdVx08wF5zaSI3w07/F8GK4XlJH5KZPmI7JyUqwxfEXP+74
         qHhA==
X-Gm-Message-State: AOJu0YxRLlAaNDVTQxek4UWAsuRVfdaGnvzTJ072jnKKOihKlPWvR9a8
	J0GpHAuC9fifY7H+jyx2fyBefRqmayKlFl3YXIdgzhSS316UsMMhbOMA8HBVGY/CTEAfWCFeJNA
	j
X-Google-Smtp-Source: AGHT+IEZJq5jwcjrIOqvCIA7+/AyNO7+dLyhirnj/OeoRODE1Rlo8xyJgKW36VX8s6JwBoQQYUDq8g==
X-Received: by 2002:a05:6a20:54a3:b0:1a0:efae:53c7 with SMTP id i35-20020a056a2054a300b001a0efae53c7mr171162pzk.14.1709594202862;
        Mon, 04 Mar 2024 15:16:42 -0800 (PST)
Received: from p14s.. ([2604:3d09:148c:c800:164d:f5c6:5814:1e78])
        by smtp.gmail.com with ESMTPSA id d14-20020a056a00198e00b006e63961c058sm162042pfl.216.2024.03.04.15.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 15:16:41 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: mathieu.poirier@linaro.org
Subject: [PATCH 1/1] arm/rmm: Add bitbake, include and patch file for RMM firmware
Date: Mon,  4 Mar 2024 16:16:39 -0700
Message-ID: <20240304231639.4187147-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304231639.4187147-1-mathieu.poirier@linaro.org>
References: <20240304231639.4187147-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 23:16:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5411

Initial checking providing support for RMM on QEMU's "virt" machine.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 ...Add-repositories-for-system-includes.patch | 45 ++++++++++++++++
 meta-arm/recipes-bsp/rmm/rmm.inc              | 54 +++++++++++++++++++
 meta-arm/recipes-bsp/rmm/rmm_1.0.bb           |  5 ++
 3 files changed, 104 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
 create mode 100644 meta-arm/recipes-bsp/rmm/rmm.inc
 create mode 100644 meta-arm/recipes-bsp/rmm/rmm_1.0.bb

diff --git a/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
new file mode 100644
index 000000000000..a2f2137012d3
--- /dev/null
+++ b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
@@ -0,0 +1,45 @@
+From e9e6d5ded4c3e53254438a73a79f04209035603e Mon Sep 17 00:00:00 2001
+From: Mathieu Poirier <mathieu.poirier@linaro.org>
+Date: Mon, 4 Mar 2024 13:38:03 -0700
+Subject: [PATCH] CMakeLists: Add repositories for system includes
+
+Yocto's default aarch64 toolchain, i.e aarch64-poky-linux-, doesn't
+include assert.h and stderr.h by default, leading to a compilation error
+for files that need them.  As such add the path of the base sysroot
+directory to the list of directories to be included when compiling.
+
+Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
+---
+ lib/arch/CMakeLists.txt | 1 +
+ lib/libc/CMakeLists.txt | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
+index 93c0ae76bb65..628f4c981051 100644
+--- a/lib/arch/CMakeLists.txt
++++ b/lib/arch/CMakeLists.txt
+@@ -12,6 +12,7 @@ target_link_libraries(rmm-lib-arch
+ target_include_directories(rmm-lib-arch
+     PUBLIC  "include"
+             "include/${RMM_ARCH}"
++	    "../../../recipe-sysroot/usr/include/"
+     PRIVATE "src/${RMM_ARCH}"
+             "src/include")
+ 
+diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
+index 1631332dbc72..94d559b7aae0 100644
+--- a/lib/libc/CMakeLists.txt
++++ b/lib/libc/CMakeLists.txt
+@@ -12,7 +12,8 @@ if(NOT RMM_ARCH STREQUAL fake_host)
+            rmm-lib-debug)
+ 
+     target_include_directories(rmm-lib-libc SYSTEM
+-        PUBLIC "include")
++        PUBLIC "include"
++        "../../../recipe-sysroot/usr/include/")
+ 
+     target_sources(rmm-lib-libc
+         PRIVATE "src/abort.c"
+-- 
+2.43.0
+
diff --git a/meta-arm/recipes-bsp/rmm/rmm.inc b/meta-arm/recipes-bsp/rmm/rmm.inc
new file mode 100644
index 000000000000..0cdf62b412d5
--- /dev/null
+++ b/meta-arm/recipes-bsp/rmm/rmm.inc
@@ -0,0 +1,54 @@
+SUMMARY = "RMM Firmware"
+DESCRIPTION = "RMM Firmware for Arm reference platforms"
+LICENSE = "BSD-3-Clause & MIT"
+
+SRC_URI = "${SRC_URI_RMM};name=rmm;branch=${SRCBRANCH_rmm} \
+	   file://0001-CMakeLists-Add-repositories-for-system-includes.patch \
+	"
+
+LIC_FILES_CHKSUM += "file://${WORKDIR}/git/docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
+
+inherit deploy
+
+DEPENDS += "cmake-native"
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
+export CROSS_COMPILE="${TARGET_PREFIX}"
+export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
+
+do_configure[cleandirs] = "${B}"
+do_configure() {
+    cmake -S ${S} -B ${B} ${EXTRA_OECMAKE}
+}
+
+do_compile() {
+    cmake --build ${B}
+}
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
diff --git a/meta-arm/recipes-bsp/rmm/rmm_1.0.bb b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb
new file mode 100644
index 000000000000..95a4f4a4667a
--- /dev/null
+++ b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb
@@ -0,0 +1,5 @@
+SRC_URI_RMM	     ?= "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https"
+SRCREV_rmm	     ?= "01a3cb75c6e6c50851d5d939d237966d110ed91d"
+SRCBRANCH_rmm	     ?= "main"
+
+require recipes-bsp/rmm/rmm.inc
-- 
2.43.0


