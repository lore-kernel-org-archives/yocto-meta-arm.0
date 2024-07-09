Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24048C3DA42
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 18:28:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3155.1720549692509181358
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 11:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 425DB12FC
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jul 2024 11:28:37 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77BFB3F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jul 2024 11:28:11 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: update to 13.3
Date: Tue,  9 Jul 2024 14:28:10 -0400
Message-Id: <20240709182810.33299-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 18:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5875

Update the Arm Binary toolchain to version 13.3-rel1.  The upper to
lowercase 'r' in rel was intentional, as the exact match is needed for
devtool to properly determine the correct version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/get-binary-toolchains                                      | 2 +-
 ...one-elf_13.2.Rel1.bb =3D> gcc-aarch64-none-elf_13.3.rel1.bb} | 4 ++--
 ...-none-eabi_13.2.Rel1.bb =3D> gcc-arm-none-eabi_13.3.rel1.bb} | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_13.2.Rel1.bb =3D> gcc-aarch64-none-elf_13.3.rel1.bb} (82%=
)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
rm-none-eabi_13.2.Rel1.bb =3D> gcc-arm-none-eabi_13.3.rel1.bb} (82%)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 429cd1c5c0ed..793c689040d1 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u -e
=20
 BASENAME=3Darm-gnu-toolchain
-VER=3D${VER:-13.2.Rel1}
+VER=3D${VER:-13.3.rel1}
 HOST_ARCH=3D${HOST_ARCH:-$(uname -m)}
=20
 # Use the standard kas container locations if nothing is passed into the=
 script
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_13.2.Rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_13.3.rel1.bb
similarity index 82%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_13.2.Rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_13.3.rel1.bb
index 6262e76caed9..edb4ff6fcfac 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.2.Rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.3.rel1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copy=
ing.html;md5=3D402090210d41f0
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D2a6=
2a4d37ddad55da732679acd9edf03"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "f3871c0d91a7375834eb43eb758f4df6d8da=
df20ad9deca2eb569d5599d98e89"
-SRC_URI[gcc-x86_64.sha256sum] =3D "7fe7b8548258f079d6ce9be9144d2a10bd2bf=
93b551dafbf20fe7f2e44e014b8"
+SRC_URI[gcc-aarch64.sha256sum] =3D "fad7d567be5c095943d42f7078ea6f9a8452=
062dfe151152c2ec825814d254e0"
+SRC_URI[gcc-x86_64.sha256sum] =3D "7fedf894040580b1db747d06ac5d4263c46e5=
91ffe7695656d1da5accb00a159"
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_13.2.Rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_13.3.rel1.bb
similarity index 82%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-arm-none-eabi_13.2.Rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
arm-none-eabi_13.3.rel1.bb
index 6569911df312..185ecfed4a29 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.2.Rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.3.rel1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copy=
ing.html;md5=3D402090210d41f0
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D2a6=
2a4d37ddad55da732679acd9edf03"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "8fd8b4a0a8d44ab2e195ccfbeef42223dfb3=
ede29d80f14dcf2183c34b8d199a"
-SRC_URI[gcc-x86_64.sha256sum] =3D "6cd1bbc1d9ae57312bcd169ae283153a9572b=
d6a8e4eeae2fedfbc33b115fdbb"
+SRC_URI[gcc-aarch64.sha256sum] =3D "c8824bffd057afce2259f7618254e840715f=
33523a3d4e4294f471208f976764"
+SRC_URI[gcc-x86_64.sha256sum] =3D "95c011cee430e64dd6087c75c800f04b9c498=
32cc1000127a92a97f9c8d83af4"
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.39.3 (Apple Git-146)


