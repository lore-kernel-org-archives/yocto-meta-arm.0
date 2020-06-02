Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.2165.1591056347939745140
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 17:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Mu51n7j0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id v79so10890612qkb.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 17:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XvMUMFWF4oz7huv5oaQGwTyi6p9oA4yYunqbjYUgoeI=;
        b=Mu51n7j05P9JHnbHXljgjwZhGbluJcmrQ1G6weCyvQludC6tCYP6oanKbp985r+Op9
         SbONrVWTVsjUpzO5Zr8d5HlMR2ODUni8cofhd/9qqHnJPZLgfPUfikWj2//u/mWLjsVp
         CNihNTgKVJvDPYNGICQPxoth/6/tAAXvux75fsRE31+iE+VQoWdHZQeNdyzLwOtu8HPy
         C88qrGxMJfZXYtjT8+EhxSKe8B5ufSk+37qNaYE9TUfbwfYx4NlEgyTCOigpxFmajZwK
         FVBA1qYhJv9bPo+Lx0saTN6BztASxfvTaRZEoAew4j4mKcbdaL08EA/REjyX10+zrHo9
         v6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XvMUMFWF4oz7huv5oaQGwTyi6p9oA4yYunqbjYUgoeI=;
        b=G2XfO5dQKFIqIcKpEqmWUZEMpTcZ9HPLkiIpw4zhxSMbVSvjvLd/hMr0hLKcIQxceL
         WJzO2kI9r1eulFmJbSDRYntTyfbuUM38Lf+qEai1gOmI/SMIiUoAqrwYdVRmlLDmTy81
         9UQ81G7K2Pcgyu3Y146D4fF/QhtPOVqMWji8xC5KCHGubVRiSvp1S0FtXBp1yDUXrBQM
         lXWO3kqNURMgQgbgRajXnZCGm4Wc+2vaPvhjsmnrsBPlnanxWDDSP/078ey03ZUUZFV1
         kEEzaEZUbj76/TXIC7gCSUOwBNNw9ecKGCkUVVf3YhWQbipZgeKfjwX8MXxWDnL+kUbH
         olfQ==
X-Gm-Message-State: AOAM5318qiuWtwx+HJITdOAiL5QiVEVU5/3t9ZNLnAc3RjnMYEGS/mle
	Y+RJ3ABdR+dzzqvvQ61ySL+m4nn5my0=
X-Google-Smtp-Source: ABdhPJw4Z6EGxTFbTF8Y0QsopBwGcVcOlPH8tNkoP8b+/pq5WsvAXZFb4WY8T3XOUJ+vtDX0+UQ9IQ==
X-Received: by 2002:a37:4c97:: with SMTP id z145mr22487717qka.165.1591056346560;
        Mon, 01 Jun 2020 17:05:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a664:2e00:40d9:962b:46e7:a335])
        by smtp.gmail.com with ESMTPSA id s74sm778953qka.54.2020.06.01.17.05.46
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:05:46 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm-toolchain: merge binary toolchain recipes
Date: Mon,  1 Jun 2020 20:05:45 -0400
Message-Id: <20200602000545.25028-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the majority of the binary toolchain recipes for building on an
x86 host into a common include file.

Also, found and fixed an error with both install commands where the name
was double nested on the copy.  For example,
/usr/share/arm-none-eabi/arm-none-eabi/ due to the way it was being
copied.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../gcc-aarch64-none-elf_9.2-2019.12.bb       | 27 ++-----------------
 .../gcc-arm-none-eabi_9-2019-q4-major.bb      | 27 ++-----------------
 .../external-arm-toolchain/gcc-x86host.inc    | 26 ++++++++++++++++++
 3 files changed, 30 insertions(+), 50 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 2ec0f9c..1e4689c 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -1,6 +1,8 @@
 # Copyright (C) 2020 Texas Instruments Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
 
+require gcc-x86host.inc
+
 SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
@@ -11,28 +13,3 @@ PROVIDES = "virtual/aarch64-none-elf-gcc"
 SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
 
 SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
-
-S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
-
-COMPATIBLE_HOST = "x86_64.*-linux"
-
-do_install() {
-    install -d ${D}${datadir}/aarch64-none-elf/
-    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
-
-    install -d ${D}${bindir}
-    # Symlink all executables into bindir
-    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
-        lnr $f ${D}${bindir}/$(basename $f)
-    done
-}
-
-FILES_${PN} = "${datadir} ${bindir}"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
-
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index 84f6dba..a36f0aa 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -1,6 +1,8 @@
 # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
 # Released under the MIT license (see COPYING.MIT for the terms)
 
+require gcc-x86host.inc
+
 SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
@@ -12,28 +14,3 @@ SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${B
 
 SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
 SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-COMPATIBLE_HOST = "x86_64.*-linux"
-
-do_install() {
-    install -d ${D}${datadir}/arm-none-eabi/
-    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
-
-    install -d ${D}${bindir}
-    # Symlink all executables into bindir
-    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
-        lnr $f ${D}${bindir}/$(basename $f)
-    done
-}
-
-FILES_${PN} = "${datadir} ${bindir}"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
-
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
new file mode 100644
index 0000000..332ffab
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
@@ -0,0 +1,26 @@
+S = "${WORKDIR}/${BPN}-${PV}"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+FILES_${PN} = "${datadir} ${bindir}"
+
+BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
+
+do_install() {
+    install -d ${D}${datadir}/${BINNAME}/
+    cp -r ${S}/. ${D}${datadir}/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/${BINNAME}/bin/${BINNAME}-*; do
+        lnr $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

