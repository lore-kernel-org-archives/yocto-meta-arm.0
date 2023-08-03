Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641D6C04E69
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1927.1691087634594848963
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 11:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C560113E;
	Thu,  3 Aug 2023 11:34:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B37CC3F6C4;
	Thu,  3 Aug 2023 11:33:48 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/5] arm-toolchain/androidclang: remove
Date: Thu,  3 Aug 2023 19:33:43 +0100
Message-Id: <20230803183347.3414946-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Aug 2023 18:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4934

From: Ross Burton <ross.burton@arm.com>

This was added to build an Android Common Kernel with the Android
compiler, but we don't need to build that anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/toolchains.yml                             |  1 -
 .../androidclang_r416183b.bb                  | 52 -------------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/androidclang_r416183b.bb

diff --git a/ci/toolchains.yml b/ci/toolchains.yml
index 72ce5582..056269b2 100644
--- a/ci/toolchains.yml
+++ b/ci/toolchains.yml
@@ -16,4 +16,3 @@ target:
   - nativesdk-gcc-aarch64-none-elf
   - gcc-arm-none-eabi
   - nativesdk-gcc-arm-none-eabi
-  - nativesdk-androidclang
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
ndroidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/androidclang_r416183b.bb
deleted file mode 100644
index 963fd60e..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidc=
lang_r416183b.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-# SPDX-License-Identifier: MIT
-#
-# Copyright (c) 2021 Arm Limited
-#
-
-SUMMARY =3D "Android Clang compiler"
-DESCRIPTION =3D "Android Clang compiler, version r416183b. This is based=
 on Clang 12.0.5 \
-Intended usage is to build kernel images that match the output of the An=
droid (hermetic) \
-build system"
-
-LICENSE =3D "MIT"
-
-LIC_FILES_CHKSUM =3D "file://MODULE_LICENSE_MIT;md5=3Dd41d8cd98f00b204e9=
800998ecf8427e"
-
-ANDROID_CLANG_VERSION =3D "clang-r416183b"
-ANDROID_CLANG_HASH =3D "bd96dfe349c962681f0e5388af874c771ef96670"
-
-COMPATIBLE_HOST =3D "x86_64.*-linux"
-
-SRC_URI =3D "https://android.googlesource.com/platform/prebuilts/clang/h=
ost/linux-x86/+archive/${ANDROID_CLANG_HASH}/${ANDROID_CLANG_VERSION}.tar=
.gz;subdir=3D${ANDROID_CLANG_VERSION}"
-
-# We need to set the checksum to "ignore" because the tarball is dynamic=
ally generated and has a new checksum every time
-# (the contents are the same, but the time stamp differs)
-BB_STRICT_CHECKSUM =3D "ignore"
-
-S =3D "${WORKDIR}/${ANDROID_CLANG_VERSION}"
-
-FILES:${PN} =3D "${libexecdir} ${bindir}"
-
-do_install() {
-    install -d ${D}${libexecdir}/${ANDROID_CLANG_VERSION}/
-
-    cp --no-preserve=3Downership -r ${S}/. ${D}${libexecdir}/${ANDROID_C=
LANG_VERSION}/
-    # Strip bad RPATHs in the embedded python3
-    chrpath -d ${D}${libexecdir}/${ANDROID_CLANG_VERSION}/python3/lib/py=
thon*/lib-dynload/*.so
-
-    install -d ${D}${bindir}
-    # Symlink all executables into bindir
-    for f in ${D}${libexecdir}/${ANDROID_CLANG_VERSION}/bin/*; do
-        ln -rs $f ${D}${bindir}/$(basename $f)
-    done
-}
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-INSANE_SKIP:${PN} =3D "already-stripped libdir staticdev file-rdeps arch=
 dev-so"
-
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


