Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2FCC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 06:22:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.7115.1651213324970925383
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iOXeBifB;
 spf=pass (domain: linaro.org, ip: 209.85.214.175,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f175.google.com with SMTP id j8so6293638pll.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z3r5WBC+IjgJqpT7Q9byhZ5gS/LLGKvZ18N0sTWDU3c=;
        b=iOXeBifBeka2qHoTHf9nS2TimM5tf46rabEZ/BR2fC5YQO6WzZDBW5uw796K9MqEj7
         DUuNTsa4Q0Z2jEsAAw+KkmyN6mAAPOgtn0PFJlKQnyW8rd34PzeesooFMEFHTGRAkK6H
         OlOT43mlzylsDl10GuGQ+ETCGHGwCatpI9LSPj4nqoSJbYX4Ak78VU4YttLqGqbAB91e
         +YG+W9UGmp19Jri2weX3uWRuP8TE6EeOuJLJOku1EXK9thXJRSFzwK2DVKYJyhl3gB8D
         Z9MTIg/WbKSGwG+bZ0Tmk1lWgxDk6QDnQXg2fkkayYpbcuNJepKyTum5zfKqsUKVF9I9
         ADmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z3r5WBC+IjgJqpT7Q9byhZ5gS/LLGKvZ18N0sTWDU3c=;
        b=yIL5za1crgI7LJZkZAphzR7WC4qQ1vAiOWZSxv79XUWjwqF4ybWNRzWNmD97xbL3RF
         h3jVZOHdOgr1GHO1rwFHGbdNumC+09017AxkuZ/hlgab40obvY5E6x7fQFkMv6OgeOoN
         qYD6TISpaXAqeXpKmkJb+aDmLdA+TMRZl11kVOoPdVS4AGNntx4qtw5I3HO5qIylzLpc
         VcD7tm/WB1VKok3Hy3c+HCzQNMeDydE4OozS5EO24uz1fB314grW3VFvzcpUKSsJSto0
         OHB3DggJzyDk3uoz9h+Xq7ex4NUsYRr32dyK1aKIulUxWTViEWsm24WaaolV2Ql9zbEA
         mXIg==
X-Gm-Message-State: AOAM532HFg0EfSd8Oe/vxNIMUzxwzQFxVxYlYz8f6Gwf5ubxO+XB0r33
	sE4TWym6akdIcxTwrmBnZv5o0Dm4WXANog==
X-Google-Smtp-Source: 
 ABdhPJwYXPBU5dR4WfF4aR51gBiSRA9K349xkbgIm+pqCY+//i6iGSGNpQzfrR/83Kn5B4IcLq70oA==
X-Received: by 2002:a17:90b:4b89:b0:1dc:1055:ee36 with SMTP id
 lr9-20020a17090b4b8900b001dc1055ee36mr250525pjb.110.1651213324021;
        Thu, 28 Apr 2022 23:22:04 -0700 (PDT)
Received: from localhost.localdomain ([223.177.214.13])
        by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a150200b001cd4989ff3fsm8901739pja.6.2022.04.28.23.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 23:22:03 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denis@denix.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 2/2] external-arm-toolchain: Add support for Arm GCC 11.2
 binary release
Date: Fri, 29 Apr 2022 11:51:42 +0530
Message-Id: <20220429062142.11206-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429062142.11206-1-sumit.garg@linaro.org>
References: <20220429062142.11206-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Apr 2022 06:22:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3330

Arm GCC 11.2 binary release has completely changed the way how libc was
packaged in earlier binary releases. So adjust do_install() accordingly
to support Arm GCC 11.2 as well as earlier binary releases.

Along with this update CI as well to point at Arm GCC 11.2 binary
releases.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- None

 ci/get-binary-toolchains                      | 10 ++--
 .../external-arm-toolchain.bb                 | 47 ++++++++-----------
 2 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 838342a..bfdd8c5 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u
 
 HOST_ARCH=$(uname -m)
-VER="10.3-2021.07"
+VER="11.2-2022.02"
 
 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
@@ -15,18 +15,18 @@ if [ $HOST_ARCH = "aarch64" ]; then
 	#AArch64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-none-linux-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
 elif [ $HOST_ARCH = "x86_64" ]; then
 	#x86_64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-linux-none-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
 else
 	echo "ERROR - Unknown build arch of $HOST_ARCH"
 	exit 1
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index a58eeb4..dcc8ebf 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -79,29 +79,10 @@ do_install() {
 
 	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/${EAT_TARGET_SYS} ]; then
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${base_libdir}
-	else
-		if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
-			cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
-		else
-			cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/*.so*  ${D}${base_libdir}
-		fi
-	fi
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/${EAT_TARGET_SYS} ]; then
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${libdir}
-	else
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/*  ${D}${libdir}
-		if [ ! -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
-			rm -rf ${D}${libdir}/*.so*
-		fi
-	fi
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/*  ${D}${libdir}
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/share/*  ${D}${datadir}
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/*  ${D}${includedir}
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/${EAT_TARGET_SYS} ]; then
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/${EAT_TARGET_SYS}/*  ${D}${includedir}
-		rm -r ${D}${includedir}/${EAT_TARGET_SYS}
-	fi
 
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
 	if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
@@ -128,7 +109,11 @@ do_install() {
 
 	# fix up the copied symlinks (they are still pointing to the multiarch directory)
 	linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
-	ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
+	if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
+		ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
+	else
+		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/lib/${linker_name} ${D}${base_libdir}/
+	fi
 	ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
 	ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
 	ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
@@ -144,6 +129,7 @@ do_install() {
 	ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
 	ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
 	ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
+	ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
 
 	# remove potential .so duplicates from base_libdir
 	# for all symlinks created above in libdir
@@ -164,7 +150,7 @@ do_install() {
 	rm -f ${D}${base_libdir}/libm.so
 
 	# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
-	for lib in asan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
+	for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
 		if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
 			mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
 		fi
@@ -180,6 +166,10 @@ do_install() {
 	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
 	# Only remove them if both are regular files and are identical
 	for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
+		if [ ! -e $i ] ; then
+			continue
+		fi
+
 		f=$(echo $i | sed 's/-${EAT_VER_LIBC}//')
 		l=$(ls $f.*)
 		if [ $(readlink -f $i ) = $l ]; then
@@ -217,9 +207,9 @@ do_install() {
 	fi
 
 	if [ -f ${D}${base_libdir}/libc.so ];then
-		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
+		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
 		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
-			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
+			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
 		fi
 	fi
 
@@ -460,13 +450,16 @@ FILES:libgfortran-staticdev = "${libdir}/libgfortran.a"
 
 # From gcc-sanitizers.inc:
 
-FILES:libasan += "${libdir}/libasan.so.*"
+FILES:libasan += "${libdir}/libasan.so.* ${libdir}/libhwasan.so.*"
 FILES:libasan-dev += "\
     ${libdir}/libasan_preinit.o \
     ${libdir}/libasan.so \
+    ${libdir}/libhwasan.so \
     ${libdir}/libasan.la \
 "
-FILES:libasan-staticdev += "${libdir}/libasan.a"
+FILES:libasan-staticdev += "${libdir}/libasan.a \
+    ${libdir}/libhwasan.a \
+"
 
 FILES:libubsan += "${libdir}/libubsan.so.*"
 FILES:libubsan-dev += "\
-- 
2.25.1


