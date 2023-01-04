Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F70C54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:39:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9919.1672832340543242347
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 03:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABD7E1655;
	Wed,  4 Jan 2023 03:39:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85C953F587;
	Wed,  4 Jan 2023 03:38:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/5] ci/get-binary-toolchains: rewrite, slightly
Date: Wed,  4 Jan 2023 11:38:48 +0000
Message-Id: <20230104113849.3011256-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104113849.3011256-1-ross.burton@arm.com>
References: <20230104113849.3011256-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jan 2023 11:39:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4231

Add set -e so errors are fatal.

Allow HOST_ARCH and VER to be overridden by the environment, for testing.

Pull the tarball basename into a variable to reduce duplication.

Turn the wget call into a function to reduce duplication.

Drop the big-endian binaries as we never use those.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/get-binary-toolchains | 42 ++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index ed334bf3..bf8bf3e7 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -1,8 +1,9 @@
 #!/bin/bash
-set -u
+set -u -e
=20
-HOST_ARCH=3D$(uname -m)
-VER=3D"11.3.rel1"
+BASENAME=3Darm-gnu-toolchain
+VER=3D${VER:-11.3.rel1}
+HOST_ARCH=3D${HOST_ARCH:-$(uname -m)}
=20
 DOWNLOAD_DIR=3D$1
 TOOLCHAIN_DIR=3D$2
@@ -11,36 +12,39 @@ TOOLCHAIN_LINK_DIR=3D$3
 # These should be already created by .gitlab-ci.yml, but do here if run =
outside of that env
 mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
=20
+download() {
+	TRIPLE=3D$1
+	URL=3Dhttps://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel=
/$BASENAME-$VER-$HOST_ARCH-$TRIPLE.tar.xz
+	wget -P $DOWNLOAD_DIR -nc $URL
+}
+
 if [ $HOST_ARCH =3D "aarch64" ]; then
-	#AArch64 Linux hosted cross compilers
+	# AArch64 Linux hosted cross compilers
=20
-	#AArch32 target with hard float (arm-none-linux-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downl=
oads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-arm-none-linux-gnu=
eabihf.tar.xz
+	# AArch32 target with hard float
+	download arm-none-linux-gnueabihf
 elif [ $HOST_ARCH =3D "x86_64" ]; then
-	#x86_64 Linux hosted cross compilers
-
-	#AArch32 target with hard float (arm-linux-none-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downl=
oads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-arm-none-linux-gnu=
eabihf.tar.xz
+	# x86_64 Linux hosted cross compilers
=20
-	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downl=
oads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-aarch64-none-linux=
-gnu.tar.xz
+	# AArch32 target with hard float
+	download arm-none-linux-gnueabihf
=20
-	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downl=
oads/gnu/$VER/binrel/arm-gnu-toolchain-$VER-$HOST_ARCH-aarch64_be-none-li=
nux-gnu.tar.xz
+	# AArch64 GNU/Linux target
+	download aarch64-none-linux-gnu
 else
 	echo "ERROR - Unknown build arch of $HOST_ARCH"
 	exit 1
 fi
=20
-for i in arm aarch64 aarch64_be; do
-	if [ ! -d $TOOLCHAIN_DIR/arm-gnu-toolchain-$VER-$HOST_ARCH-$i-none-linu=
x-gnu*/ ]; then
-		if [ ! -f $DOWNLOAD_DIR/arm-gnu-toolchain-$VER-$HOST_ARCH-$i-none-linu=
x-gnu*.tar.xz ]; then
+for i in arm aarch64; do
+	if [ ! -d $TOOLCHAIN_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu*/ =
]; then
+		if [ ! -f $DOWNLOAD_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu*.t=
ar.xz ]; then
 			continue
 		fi
=20
-		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/arm-gnu-toolchain-$VER-$HOST=
_ARCH-$i-none-linux-gnu*.tar.xz
+		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/$BASENAME-$VER-$HOST_ARCH-$i=
-none-linux-gnu*.tar.xz
 	fi
=20
 	# Setup a link for the toolchain to use local to the building machine (=
e.g., not in a shared location)
-	ln -s $TOOLCHAIN_DIR/arm-gnu-toolchain-$VER-$HOST_ARCH-$i-none-linux-gn=
u* $TOOLCHAIN_LINK_DIR/$i
+	ln -s $TOOLCHAIN_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu* $TOOL=
CHAIN_LINK_DIR/$i
 done
--=20
2.34.1


