Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A3EC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 11:55:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15806.1738065316732930782
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 03:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2E13497
	for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 03:55:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF9563F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 03:55:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-toolchain/external-arm-toolchain: update for toolchain provider changes
Date: Tue, 28 Jan 2025 11:54:59 +0000
Message-ID: <20250128115500.3921264-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 11:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6351

The oe-core commit "classes/recipes: Switch virtual/XXX-gcc to
virtual/cross-cc (and c++/binutils)"[1] changes the virtual names that
the toolchain components use, so external-arm-toolchain needs updating
to use these new names.

[1] 4ccc3bc8266c327bcc18c9a3faf7536210dfb9f0

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../conf/distro/include/tcmode-external-arm.inc  | 16 ++++++++++------
 .../external-arm-toolchain.bb                    | 10 ++++------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 99fe56b8..0ac71264 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -37,12 +37,10 @@ SKIP_RECIPE[gcc-sanitizers] =3D "Using external toolc=
hain"
=20
 PREFERRED_PROVIDER_linux-libc-headers =3D "external-arm-toolchain"
 PREFERRED_PROVIDER_linux-libc-headers-dev =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "external-arm-toolcha=
in"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "external-arm=
-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "external-arm-toolcha=
in"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D "external-arm-to=
olchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "external-ar=
m-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs =3D "external-ar=
m-toolchain"
+PREFERRED_PROVIDER_virtual/cross-cc =3D "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/cross-c++ =3D "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/cross-binutils =3D "external-arm-toolchain"
+PREFERRED_PROVIDER_virtual/compilerlibs =3D "external-arm-toolchain"
 PREFERRED_PROVIDER_glibc =3D "external-arm-toolchain"
 PREFERRED_PROVIDER_libgcc =3D "external-arm-toolchain"
 PREFERRED_PROVIDER_virtual/libc =3D "external-arm-toolchain"
@@ -55,6 +53,12 @@ PREFERRED_PROVIDER_glibc-mtrace =3D "external-arm-tool=
chain"
 PREFERRED_PROVIDER_libc-mtrace =3D "external-arm-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers =3D "external-arm-toolchai=
n"
=20
+# Keep nativesdk toolchain using GCC
+PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D "binutils-cross=
sdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc =3D "gcc-crosssdk-${SDK_SY=
S}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ =3D "gcc-crosssdk-${SDK_S=
YS}"
+PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs =3D "nativesdk-gcc-run=
time"
+
 PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index fbb3cbf4..0463b867 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -11,12 +11,10 @@ LIC_FILES_CHKSUM =3D "\
=20
 PROVIDES +=3D "\
 	linux-libc-headers \
-	virtual/${TARGET_PREFIX}gcc \
-	virtual/${TARGET_PREFIX}g++ \
-	virtual/${TARGET_PREFIX}gcc-initial \
-	virtual/${TARGET_PREFIX}binutils \
-	virtual/${TARGET_PREFIX}libc-for-gcc \
-	virtual/${TARGET_PREFIX}compilerlibs \
+	virtual/cross-cc \
+	virtual/cross-c++ \
+	virtual/binutils \
+	virtual/compilerlibs \
 	virtual/libc \
 	virtual/libintl \
 	virtual/libiconv \
--=20
2.43.0


