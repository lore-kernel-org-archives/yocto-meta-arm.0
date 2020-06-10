Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.11120.1591796617840845673
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 06:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iFxJT9Ww;
 spf=pass (domain: linaro.org, ip: 209.85.210.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f193.google.com with SMTP id a127so1111816pfa.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bsRkVY2fZx1dNf7gqch1g5/kB0ZSWyF94cEYRvbkwi0=;
        b=iFxJT9Ww6HAL64zj8dalOX+e9GzMTJFZbmBcGdKqvNF3pQ69WH0+auTLdP2nPueZdt
         2d8CLDm0rnCzlKk9siCsetZTnKbX/af5Qnl5VEqQW5Oc1vvel+AY5oCQjrzygjuEkyam
         YUV9srwLxPvUD6Jmslk2WuCZsnOFgI8/5PgUXhy2AEe33i64fWvdEA8ZxihJKjn6C+kG
         Dp0X/+SzjVZQBE8HyyQ7EbMWG2oqKTJOvlhZiy7VU/cgkreJeFPikrMzSoKJA9XyBNbh
         LdUpEpVju/vPboQyJ0miTS3ybLFKkbTO5fdv8bUbgZP8qX533RRCE6iZTL4aTQAVqOx8
         FMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bsRkVY2fZx1dNf7gqch1g5/kB0ZSWyF94cEYRvbkwi0=;
        b=L4LCBgNArAhbjpxOTndoF8UPYbR2p6sTdIoHOOEc5NFC4kCKd0OwOmpHcHMYFhbeYQ
         Eu1tkcPhiNmf33tQF9x9dHdF5WKgtJ7iz4ITVPhFGNPIa2vFx1pJHlLz155qeJerT50E
         1MZznldC2LfndwkBPakh5ySgMvT445qwHBI8tKbN0Hwlc1r3pxCRAmWbchOH+dUZ4aMN
         NSN1K/Y3H/7mLlrzok2zmbQzyDnqdz/0Terrl7Q9q4lLmooSDu3buPLywKDD3Fr/7UAJ
         gcaET8dw7UpmFDhf2Np6FBtjdtKOot3IEYy1wxMPgn8g6BsYN4eiQYS5akp7tYeiOLL7
         2j/w==
X-Gm-Message-State: AOAM533hJjn+TGpOom470jm7y0L6Wo6FrxMLj+ZgqyvU1xWZiTk/oo9v
	e4GQcAbA1B63hui1NHFc6q/2uhlxdhU=
X-Google-Smtp-Source: ABdhPJxjGN5EBFoiGOm+2llk4j+1ymVDbmqAt2tYiLffNRp8Ml1VaKcVujq6s4Evq1vDYewUjEbVDA==
X-Received: by 2002:a62:25c5:: with SMTP id l188mr2825004pfl.178.1591796616830;
        Wed, 10 Jun 2020 06:43:36 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id u12sm5227530pjy.37.2020.06.10.06.43.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:43:35 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 3/5] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
Date: Wed, 10 Jun 2020 19:13:00 +0530
Message-Id: <1591796582-5015-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>

OE native and cross compilers (in case of SDK) uses OE TARGET_SYS to
create standard paths to search for libraries and headers during
compilation.

Currently external-arm-toolchain recipe temporarily override TARGET_SYS
with EAT_TARGET_SYS and packages libraries and headers corresponding to
EAT_TARGET_SYS which leads to failures during native and cross compilation
(in case of SDK) such as:

$ $CXX -o hello++ hello.cpp
In file included from hello.cpp:1:
/tmp/armsdk/sysroots/armv7at2hf-neon-oe-linux-gnueabi/usr/include/c++/9.2.1/iostream:38:10: fatal error: bits/c++config.h: No such file or directory
   38 | #include <bits/c++config.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.

$ $CC hello.c
real-ld: cannot find crtbeginS.o: No such file or directory

So remove temp override of TARGET_SYS and rather package libraries and
headers corresponding to OE TARGET_SYS.

This fixes changes added in commit:
https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce

Also, update location for unwind.h gcc-arm-common.inc accordingly.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain/external-arm-toolchain.bb   | 18 ++++++++++--------
 .../recipes-devtools/gcc/gcc-arm-common.inc            |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 5d9a0a8..7c7c607 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -54,7 +54,6 @@ PROVIDES += "\
 PV = "${EAT_VER_MAIN}"
 
 BINV = "${EAT_VER_GCC}"
-TARGET_SYS = "${EAT_TARGET_SYS}"
 
 SRC_URI = "file://SUPPORTED"
 
@@ -75,8 +74,8 @@ do_install() {
 	install -d ${D}${datadir}
 	install -d ${D}${includedir}
 	install -d ${D}/include
-	install -d ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-	install -d ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}
+	install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
 
 	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
@@ -105,6 +104,9 @@ do_install() {
 	fi
 
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
+	if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
+		mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
+	fi
 	ln -sf ../usr/include/c++ ${D}/include/c++
 
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${D}${bindir}
@@ -116,11 +118,11 @@ do_install() {
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
 
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
 
 	# fix up the copied symlinks (they are still pointing to the multiarch directory)
 	linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
index 5599743..392c57f 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
@@ -12,7 +12,7 @@
 do_install_prepend_class-target () {
 	if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
 		install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
-		install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
+		install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
 	fi
 }
 
-- 
2.7.4

