Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA8B109C055
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 18:06:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29460.1774462000785207272
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 11:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pSJv655R;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32C3D16F2
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 11:06:34 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 032323F836
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774462000; bh=T6tKa8Y0oKESv4k1/e968vKQvNJKaNWwZRDsW6w6P6E=;
	h=From:To:Subject:Date:From;
	b=pSJv655RCkPTX8Xda7eo6yakX1+Xfo60YwdbJgQfNZomZHHqcgrZmqxnfViWot8mC
	 1CDkXZmbt4sKY+AbGUA1pB7wXhAtJn+xLnXuYycmxcdsdhwgHX1GELnFlJ/RU27sBJ
	 WN6JkqS+logXUXAF8dW03Lh03EkuejDQtIXIl9OU=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/scp-firmware: add git recipe
Date: Wed, 25 Mar 2026 14:06:38 -0400
Message-ID: <20260325180639.88517-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 18:06:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6972

Split off the main portion of the SCP firmware recipe into an include
file and create a git versioned recipe.  This allows for building and
testing the latest sources.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/latest-revisions.yml                       |   1 +
 .../recipes-bsp/scp-firmware/scp-firmware.inc |  98 +++++++++++++++++
 .../scp-firmware/scp-firmware_2.16.0.bb       | 101 +-----------------
 .../scp-firmware/scp-firmware_git.bb          |  11 ++
 4 files changed, 112 insertions(+), 99 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb

diff --git a/ci/latest-revisions.yml b/ci/latest-revisions.yml
index 94d6bc2eadc0..10c2279c8cdb 100644
--- a/ci/latest-revisions.yml
+++ b/ci/latest-revisions.yml
@@ -5,6 +5,7 @@ header:
=20
 local_conf_header:
   latest_revisions: |
+    PREFERRED_VERSION_scp-firmware ?=3D "git"
     PREFERRED_VERSION_trusted-firmware-a ?=3D "git"
     PREFERRED_VERSION_trusted-firmware-m ?=3D "git"
     PREFERRED_VERSION_optee-client ?=3D "git"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-ar=
m/recipes-bsp/scp-firmware/scp-firmware.inc
new file mode 100644
index 000000000000..4623afe81ff2
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
@@ -0,0 +1,98 @@
+SUMMARY =3D "SCP and MCP Firmware"
+DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
+HOMEPAGE =3D "https://gitlab.arm.com/firmware/SCP-firmware"
+
+LICENSE =3D "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
+                    file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
+
+SRC_URI_SCP_FIRMWARE ?=3D "gitsm://git.gitlab.arm.com/firmware/SCP-firmw=
are.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH}"
+SRCBRANCH =3D "main"
+
+PROVIDES +=3D "virtual/control-processor-firmware"
+
+SCP_DEBUG           ?=3D "${FIRMWARE_DEBUG_BUILD}"
+CMAKE_BUILD_TYPE    ?=3D "${@oe.utils.vartrue('SCP_DEBUG', 'Debug', 'Rel=
WithDebInfo', d)}"
+SCP_PLATFORM        ?=3D "${FIRMWARE_PLATFORM}"
+SCP_PRODUCT_GROUP   ?=3D "."
+SCP_LOG_LEVEL       ?=3D "WARN"
+SCP_PLATFORM_FEATURE_SET ?=3D "0"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D "gcc-arm-none-eabi-native \
+           cmake-native \
+           ninja-native \
+          "
+
+inherit firmware
+
+B =3D "${WORKDIR}/build"
+
+# Allow platform specific copying of only scp or both scp & mcp, default=
 to both
+FW_TARGETS ?=3D "scp mcp"
+FW_INSTALL ?=3D "ramfw romfw"
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+export CFLAGS =3D "${DEBUG_PREFIX_MAP}"
+export ASMFLAGS =3D "${DEBUG_PREFIX_MAP}"
+
+LDFLAGS[unexport] =3D "1"
+
+EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${CMAKE_BUILD_TYPE} \
+                 -D SCP_LOG_LEVEL=3D${SCP_LOG_LEVEL} \
+                 -D SCP_PLATFORM_FEATURE_SET=3D${SCP_PLATFORM_FEATURE_SE=
T} \
+                 -D DISABLE_CPPCHECK=3D1 \
+                 -D SCP_TOOLCHAIN=3DGNU \
+                "
+
+do_configure() {
+    for FW in ${FW_TARGETS}; do
+        for TYPE in ${FW_INSTALL}; do
+            bbnote Configuring ${SCP_PLATFORM}/${FW}_${TYPE}...
+            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR:PATH=3D"${SCP_PRODUCT_GROUP}/${SCP_PLATFORM=
}/${FW}_${TYPE}"
+        done
+    done
+}
+
+do_configure[cleandirs] +=3D "${B}"
+
+do_compile() {
+    for FW in ${FW_TARGETS}; do
+        for TYPE in ${FW_INSTALL}; do
+            bbnote Building ${SCP_PLATFORM}/${FW}_${TYPE}...
+            VERBOSE=3D1 cmake --build ${B}/${TYPE}/${FW} --target all
+        done
+    done
+}
+
+do_install() {
+    install -d ${D}${FIRMWARE_DIR}
+    for TYPE in ${FW_INSTALL}; do
+        for FW in ${FW_TARGETS}; do
+           if [ "$TYPE" =3D "romfw" ]; then
+               if [ "$FW" =3D "scp" ]; then
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
+               else
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
+               fi
+           elif [ "$TYPE" =3D "ramfw" ]; then
+               if [ "$FW" =3D "scp" ]; then
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
+               else
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
+               fi
+           fi
+       done
+    done
+}
+
+# These binaries are specifically for 32-bit arm
+INSANE_SKIP:${PN}-dbg +=3D "arch"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
index 6a32a734c93c..fdd7a4e72470 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
@@ -1,105 +1,8 @@
-SUMMARY =3D "SCP and MCP Firmware"
-DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
-HOMEPAGE =3D "https://gitlab.arm.com/firmware/SCP-firmware"
-
-LICENSE =3D "BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
-                    file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
-
-SRC_URI_SCP_FIRMWARE ?=3D "gitsm://git.gitlab.arm.com/firmware/SCP-firmw=
are.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH} \
-           file://0001-OPTEE-Private-Includes.patch \
-          "
+require recipes-bsp/scp-firmware/scp-firmware.inc
=20
 SRCBRANCH =3D "main"
 SRCREV  =3D "190e938c2da3631b4834a90448516423099c79f7"
-
-PROVIDES +=3D "virtual/control-processor-firmware"
-
-SCP_DEBUG           ?=3D "${FIRMWARE_DEBUG_BUILD}"
-CMAKE_BUILD_TYPE    ?=3D "${@oe.utils.vartrue('SCP_DEBUG', 'Debug', 'Rel=
WithDebInfo', d)}"
-SCP_PLATFORM        ?=3D "${FIRMWARE_PLATFORM}"
-SCP_PRODUCT_GROUP   ?=3D "."
-SCP_LOG_LEVEL       ?=3D "WARN"
-SCP_PLATFORM_FEATURE_SET ?=3D "0"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-DEPENDS =3D "gcc-arm-none-eabi-native \
-           cmake-native \
-           ninja-native \
-          "
+SRC_URI +=3D "file://0001-OPTEE-Private-Includes.patch"
=20
 # For now we only build with GCC, so stop meta-clang trying to get invol=
ved
 TOOLCHAIN =3D "gcc"
-
-inherit firmware
-
-B =3D "${WORKDIR}/build"
-
-# Allow platform specific copying of only scp or both scp & mcp, default=
 to both
-FW_TARGETS ?=3D "scp mcp"
-FW_INSTALL ?=3D "ramfw romfw"
-
-COMPATIBLE_MACHINE ?=3D "invalid"
-
-export CFLAGS =3D "${DEBUG_PREFIX_MAP}"
-export ASMFLAGS =3D "${DEBUG_PREFIX_MAP}"
-
-LDFLAGS[unexport] =3D "1"
-
-EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${CMAKE_BUILD_TYPE} \
-                 -D SCP_LOG_LEVEL=3D${SCP_LOG_LEVEL} \
-                 -D SCP_PLATFORM_FEATURE_SET=3D${SCP_PLATFORM_FEATURE_SE=
T} \
-                 -D DISABLE_CPPCHECK=3D1 \
-                 -D SCP_TOOLCHAIN=3DGNU \
-                "
-
-do_configure() {
-    for FW in ${FW_TARGETS}; do
-        for TYPE in ${FW_INSTALL}; do
-            bbnote Configuring ${SCP_PLATFORM}/${FW}_${TYPE}...
-            cmake -GNinja ${EXTRA_OECMAKE} -S ${S} -B "${B}/${TYPE}/${FW=
}" -D SCP_FIRMWARE_SOURCE_DIR:PATH=3D"${SCP_PRODUCT_GROUP}/${SCP_PLATFORM=
}/${FW}_${TYPE}"
-        done
-    done
-}
-
-do_configure[cleandirs] +=3D "${B}"
-
-do_compile() {
-    for FW in ${FW_TARGETS}; do
-        for TYPE in ${FW_INSTALL}; do
-            bbnote Building ${SCP_PLATFORM}/${FW}_${TYPE}...
-            VERBOSE=3D1 cmake --build ${B}/${TYPE}/${FW} --target all
-        done
-    done
-}
-
-do_install() {
-    install -d ${D}${FIRMWARE_DIR}
-    for TYPE in ${FW_INSTALL}; do
-        for FW in ${FW_TARGETS}; do
-           if [ "$TYPE" =3D "romfw" ]; then
-               if [ "$FW" =3D "scp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
-               else
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
-               fi
-           elif [ "$TYPE" =3D "ramfw" ]; then
-               if [ "$FW" =3D "scp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
-               else
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
-               fi
-           fi
-       done
-    done
-}
-
-# These binaries are specifically for 32-bit arm
-INSANE_SKIP:${PN}-dbg +=3D "arch"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta=
-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
new file mode 100644
index 000000000000..ab2daf45e4e5
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -0,0 +1,11 @@
+require recipes-bsp/scp-firmware/scp-firmware.inc
+
+SRCBRANCH =3D "main"
+SRCREV  =3D "57bb4a303d848f11cef182b24ef16060d371858c"
+
+# For now we only build with GCC, so stop meta-clang trying to get invol=
ved
+TOOLCHAIN =3D "gcc"
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
+UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.50.1 (Apple Git-155)


