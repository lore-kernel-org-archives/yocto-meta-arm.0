Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.24788.1590708746866725159
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 May 2020 16:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mUqmNVCG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id p15so234214qvr.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 May 2020 16:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2VdhsiJjx2DxeP2Lo6i4ne/ydJU1WQlCVHDacCBlzg=;
        b=mUqmNVCG8do+hg3A5XIA9vpe2IDNQR3FyBO6Sd6COnscyYaV4wOj9C0RhTHjNyuIfB
         wGHSsxZEwCXHVvfnNHV6RUYzfRnRV+yDntywsW5zPdYSvL9K/onSbTk3Ie6N5GCEL+9V
         +IvnSi7V7mpDtI41Gm4Nvzza/fwzFm00c03WT+D8Kg3RDf4UAqEvJqaLqaKlf51Ej2n6
         9XVN0kY6UKQLZ3dyT5pYsBRqafM7nIcFw/EFrUgO6ffRe1d8wTrcKB6SJnSgCQswBxZF
         WRpecB74jnjoMnBWBeNz4k+/d1+EokTHuQhX/CCGcM3QNYmIl+Od50vea6wYwiiTDbzQ
         VUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2VdhsiJjx2DxeP2Lo6i4ne/ydJU1WQlCVHDacCBlzg=;
        b=aV7ZDJvS0fhLhVnO59ASn1J6xHE4FD7HimvW1bFg4JW8fNS8H9DtCCM9wccgYLQ6kD
         2hhUSYG/o7fmtJAk6vKdbeae9DJNhNDSdLPhr2JCb835xskaLaCKaM0VtPkggnGlUrBC
         1MguHW4GeFl1FAnwZiOjDPmdEg+RuhbWTnvpJKktSo9YDnWVJP3c5TUD+Cy9rowTSDj8
         CIUQaasdSHU/GBuJWxmHbg91gXLwoe1+l65jYKeMk6uLkyO8dQgV4a097K9k0RzF9vl6
         S8NUgZf4wKavYOpMEHd3Ll6VjUzD3AidCvwXky/R5yTsH00AH/TH3c0ms6ciOJse6Mfd
         RUWA==
X-Gm-Message-State: AOAM5319dbnWi2LoTdxhLHNVdHwTqRUQB6U06b2ALbLXxS+SYCOtI+2q
	RLRSzlaCCZRdO+Byh6JcZ3bm717yHp0=
X-Google-Smtp-Source: ABdhPJwh7uk94xZZpxQ651a2ccZ/FGprngUpN5CXG3Sp7RrSlTGw/RYtTjObjwff10itruA/s1SScw==
X-Received: by 2002:ad4:48c5:: with SMTP id v5mr5774469qvx.203.1590708745696;
        Thu, 28 May 2020 16:32:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a664:2e00:a424:8d51:840f:7f5c])
        by smtp.gmail.com with ESMTPSA id r13sm2000060qtp.38.2020.05.28.16.32.25
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 16:32:25 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: merge binary toolchain recipes
Date: Thu, 28 May 2020 19:32:24 -0400
Message-Id: <20200528233224.28139-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the majority of the binary toolchain recipes for building on an
x86 host into a common include file.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../gcc-aarch64-none-elf_9.2-2019.12.bb       | 25 ------------------
 .../gcc-arm-none-eabi_9-2019-q4-major.bb      | 25 ------------------
 .../external-arm-toolchain/gcc-x86host.inc    | 26 +++++++++++++++++++
 3 files changed, 26 insertions(+), 50 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 2ec0f9c..1c61755 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -11,28 +11,3 @@ PROVIDES = "virtual/aarch64-none-elf-gcc"
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
index 84f6dba..e0c220b 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -12,28 +12,3 @@ SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${B
 
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
index 0000000..7cfe5a3
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
@@ -0,0 +1,26 @@
+S = "${WORKDIR}/${BPN}-${PV}"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+FILES_${PN} = "${datadir} ${bindir}"
+
+NAME = "${BPN}".strip("gcc-")
+
+do_install() {
+    install -d ${D}${datadir}/${NAME}/
+    cp -r ${S}/. ${D}${datadir}/${NAME}/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/${NAME}/bin/${NAME}-*; do
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

