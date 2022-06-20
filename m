Return-Path: <rupinderjit.singh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C919C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 15:59:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.32195.1655740792752959044
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Jun 2022 08:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: rupinderjit.singh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE13139F;
	Mon, 20 Jun 2022 08:59:52 -0700 (PDT)
Received: from e123349.cambridge.arm.com (e123349.cambridge.arm.com
 [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CB673F7D7;
	Mon, 20 Jun 2022 08:59:51 -0700 (PDT)
From: Rupinderjit Singh <rupinderjit.singh@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Rupinderjit Singh <rupinderjit.singh@arm.com>
Subject: [PATCH] arm-bsp/scp-firmware: Migrate SCP firmware recipes from
 Makefile to Cmake
Date: Mon, 20 Jun 2022 16:59:31 +0100
Message-Id: <20220620155931.913715-1-rupinderjit.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Jun 2022 15:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3518

Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
---
 .../scp-firmware/scp-firmware-juno.inc        |  9 +++
 .../scp-firmware/scp-firmware_2.10.0.bb       | 64 +++++++++++++------
 2 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
index a72cbd93..ea2faceb 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
@@ -5,3 +5,12 @@ COMPATIBLE_MACHINE =3D "juno"
 SCP_PLATFORM =3D "juno"
 FW_TARGETS =3D "scp"
 FW_INSTALL:append =3D " romfw_bypass"
+
+do_install:append() {
+    for TYPE in ${FW_INSTALL}; do
+        if [ "$TYPE" =3D "romfw_bypass" ]; then
+            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass" "${D}/firmware/${FW}_${TYPE}.elf"
+        fi
+    done
+}
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index f976047a..4828fb55 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -16,9 +16,14 @@ SCP_BUILD_RELEASE   ?=3D "1"
 SCP_PLATFORM        ?=3D "invalid"
 SCP_COMPILER        ?=3D "arm-none-eabi"
 SCP_LOG_LEVEL       ?=3D "WARN"
+SCP_PLATFORM_FEATURE_SET ?=3D "0"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
-DEPENDS =3D "virtual/arm-none-eabi-gcc-native"
+DEPENDS =3D "virtual/arm-none-eabi-gcc-native \
+           cmake-native \
+           ninja-native \
+          "
+
 # For now we only build with GCC, so stop meta-clang trying to get invol=
ved
 TOOLCHAIN =3D "gcc"
=20
@@ -32,37 +37,56 @@ S =3D "${WORKDIR}/git"
 # Allow platform specific copying of only scp or both scp & mcp, default=
 to both
 FW_TARGETS ?=3D "scp mcp"
 FW_INSTALL ?=3D "ramfw romfw"
-
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 LDFLAGS[unexport] =3D "1"
+CFLAGS[unexport] =3D "1"
=20
-# No configure
-do_configure[noexec] =3D "1"
-
-EXTRA_OEMAKE =3D "V=3D1 \
-                BUILD_PATH=3D'${B}' \
-                PRODUCT=3D'${SCP_PLATFORM}' \
-                MODE=3D'${SCP_BUILD_STR}' \
-                LOG_LEVEL=3D'${SCP_LOG_LEVEL}' \
-                CC=3D'${SCP_COMPILER}-gcc' \
-                AR=3D'${SCP_COMPILER}-ar' \
-                SIZE=3D'${SCP_COMPILER}-size' \
-                OBJCOPY=3D'${SCP_COMPILER}-objcopy' \
+EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${SCP_BUILD_STR} \
+                 -D SCP_LOG_LEVEL=3D${SCP_LOG_LEVEL} \
+                 -D SCP_PLATFORM_FEATURE_SET=3D${SCP_PLATFORM_FEATURE_SE=
T} \
                 "
=20
+do_configure() {
+     for FW in ${FW_TARGETS}; do
+         for TYPE in ${FW_INSTALL}; do
+             cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${F=
W}" -D SCP_FIRMWARE_SOURCE_DIR=3D"${SCP_PLATFORM}/${FW}_${TYPE}"
+         done
+     done
+}
+
+do_configure[cleandirs] +=3D "${B}"
+
 do_compile() {
-    oe_runmake -C "${S}"
+     for FW in ${FW_TARGETS}; do
+         for TYPE in ${FW_INSTALL}; do
+             cmake --build ${B}/${TYPE}/${FW} --target all
+         done
+     done
 }
-do_compile[cleandirs] +=3D "${B}"
=20
 do_install() {
      install -d ${D}/firmware
-     for FW in ${FW_TARGETS}; do
-        for TYPE in ${FW_INSTALL}; do
-           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_=
BUILD_STR}/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
-           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_=
BUILD_STR}/bin/${FW}_${TYPE}.elf" "${D}/firmware/"
+     for TYPE in ${FW_INSTALL}; do
+         for FW in ${FW_TARGETS}; do
+            if [ "$TYPE" =3D "romfw" ]; then
+                if [ "$FW" =3D "scp" ]; then
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l1" "${D}/firmware/${FW}_${TYPE}.elf"
+                elif [ "$FW" =3D "mcp" ]; then
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl1" "${D}/firmware/${FW}_${TYPE}.elf"
+                fi
+            elif [ "$TYPE" =3D "ramfw" ]; then
+                if [ "$FW" =3D "scp" ]; then
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-b=
l2" "${D}/firmware/${FW}_${TYPE}.elf"
+                elif [ "$FW" =3D "mcp" ]; then
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
+                    install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-m=
cp-bl2" "${D}/firmware/${FW}_${TYPE}.elf"
+                fi
+            fi
         done
      done
 }
--=20
2.25.1


