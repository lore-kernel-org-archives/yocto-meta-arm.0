Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A443C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 19:56:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.15277.1633377377086006319
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 12:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 453D3ED1
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC56C3F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/8] arm/hafnium: do out-of-tree builds
Date: Mon,  4 Oct 2021 20:56:07 +0100
Message-Id: <20211004195612.188487-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004195612.188487-1-ross.burton@arm.com>
References: <20211004195612.188487-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Oct 2021 19:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2243

Set OUT_DIR to do out-of-tree builds in a directory we control, so we
can wipe it on rebuilds.

Change-Id: I5b96427b6e9d510997de5f2b1947505ad31199dc
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb | 22 +++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index 595f53c9..8b4184b5 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/ha=
fnium.git;protocol=3Dhttps \
            file://pkg-config-native.patch"
 SRCREV =3D "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
 S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
@@ -21,10 +22,6 @@ HAFNIUM_PROJECT ?=3D "reference"
 # Platform must be set for each machine
 HAFNIUM_PLATFORM ?=3D "invalid"
=20
-# hafnium build directory
-# Append _clang as the build rule in hafnium adds this to the platform n=
ame.
-HAFNIUM_BUILD_DIR_PLAT =3D "out/${HAFNIUM_PROJECT}/${HAFNIUM_PLATFORM}_c=
lang"
-
 # do_deploy will install everything listed in this variable. It is set b=
y
 # default to hafnium
 HAFNIUM_INSTALL_TARGET ?=3D "hafnium"
@@ -34,20 +31,29 @@ DEPENDS =3D "bison-native bc-native openssl-native"
 # set project to build
 EXTRA_OEMAKE +=3D "PROJECT=3D${HAFNIUM_PROJECT}"
=20
+EXTRA_OEMAKE +=3D "OUT_DIR=3D${B}"
+
+do_configure[cleandirs] +=3D "${B}"
+
+do_compile() {
+    oe_runmake -C ${S}
+}
+
 do_install() {
+    cd ${B}/${HAFNIUM_PLATFORM}_clang
     install -d -m 755 ${D}/firmware
     for bldfile in ${HAFNIUM_INSTALL_TARGET}; do
         processed=3D"0"
-        if [ -f ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.bin ]; then
+        if [ -f $bldfile.bin ]; then
             echo "Install $bldfile.bin"
-            install -m 0755 ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.bin =
\
+            install -m 0755 $bldfile.bin \
                 ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.bin
             ln -sf $bldfile-${HAFNIUM_PLATFORM}.bin ${D}/firmware/$bldfi=
le.bin
             processed=3D"1"
         fi
-        if [ -f ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.elf ]; then
+        if [ -f $bldfile.elf ]; then
             echo "Install $bldfile.elf"
-            install -m 0755 ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.elf =
\
+            install -m 0755 $bldfile.elf \
                 ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.elf
             ln -sf $bldfile-${HAFNIUM_PLATFORM}.elf ${D}/firmware/$bldfi=
le.elf
             processed=3D"1"
--=20
2.25.1


