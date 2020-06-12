Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.16953.1591957969736754206
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 03:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vfAE5MEO;
 spf=pass (domain: linaro.org, ip: 209.85.216.65, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f65.google.com with SMTP id i4so3696636pjd.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Otg5gN4UOlBPgi+SVSbIoiTzd8MwKVv9D/Me/dqZA6M=;
        b=vfAE5MEOWPdPVq2oUNnrBRXVE0jF7rSct+LvTyucv2ypsYQLWFitxFKUruSboYvfRc
         YSuOdCKdv7b0buQjfMERTXPMvPW8ymrNuQ1rQcKOHxreU3aNPWcdNQc1pbdjj1NHYgqx
         TZD+2zItyN6RlP0Ojw8nfdCEURQ4sSH1UO1kKQGVkI7RiWjJxwHI7i+jSxkgsYM3X5cM
         tnhQcGdu7SJbemGWYUc8vwyFXMusTyAne6yWU/vnPMzQEZs9yTy665WOK3gJ0Wa74s+l
         ru3pyUH3NB1ljlzMUjYl4zDz4ZN2siEzcJnIYmVwSqiWWNretd7Z+zqS7TqrYR4AdV3r
         svmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Otg5gN4UOlBPgi+SVSbIoiTzd8MwKVv9D/Me/dqZA6M=;
        b=VPQwIwjSVaPHKiiayD8prY4ytIFW90M2JIJAhn5ddPpsVZAy5UhyP9Mrtrp7SFC4iM
         DYFixJzIqAGpYYTsBNfq3cTjX/VwbDSeOHuhAYATGB0jSaBoxvl174LZs9Kyse9LAIbI
         g7D7qQvvlBuPgYOEV/FjRHQOJG8pM3VWavGS8bQwwJWy7zWkuKkAq8dbM6+d1Y9BFEDm
         5W0Gnt7dwSuDrXWMIaqrvOS2f9sxYgNv141jfb8yfqOf+8uGxFelBD6uLppNRUv3i2NH
         Gu6E4dZR70+Eec0oc+r9TY+EXHLF5Xq3Ki7YUho0zCTdk6+bjYE59+SOJhMU1dFNHKAR
         IftA==
X-Gm-Message-State: AOAM533/hVb9YT29YZrSErCsvIUkVqtcz9MXzo7DDMv7BCwK8jeCjNTL
	0Tjln2UcHYbx080WN4Sc3RcA0qRZoxU=
X-Google-Smtp-Source: ABdhPJw+JRsYgJDJQ1PQZ/hxp20tw5951Bc/okwdtfFrqDkOnKrDmIs50LKCCBjVnd4aNyOM5OLJJw==
X-Received: by 2002:a17:902:fe8b:: with SMTP id x11mr10806065plm.179.1591957968747;
        Fri, 12 Jun 2020 03:32:48 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id y81sm5871606pfb.33.2020.06.12.03.32.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 03:32:47 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v3 3/5] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
Date: Fri, 12 Jun 2020 16:02:06 +0530
Message-Id: <1591957928-5959-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>

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
index 73a2cf6..4face74 100644
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

