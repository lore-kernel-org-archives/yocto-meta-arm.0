Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC8CFEFB56
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 14:14:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96585.1772201676308961051
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 06:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4235E14BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 06:14:29 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 634893F62B
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 06:14:35 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-toolchains: Update to 15.2
Date: Fri, 27 Feb 2026 09:14:26 -0500
Message-ID: <20260227141434.69360-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 14:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6923

Update the pre-build Arm GNU toolchain to 15.2 (from 13.3)

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...elf_13.3.rel1.bb =3D> gcc-aarch64-none-elf_15.2.rel1.bb} | 8 ++++----
 ...e-eabi_13.3.rel1.bb =3D> gcc-arm-none-eabi_15.2.rel1.bb} | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_13.3.rel1.bb =3D> gcc-aarch64-none-elf_15.2.rel1.bb} (76%=
)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
rm-none-eabi_13.3.rel1.bb =3D> gcc-arm-none-eabi_15.2.rel1.bb} (76%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_13.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_15.2.rel1.bb
similarity index 76%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_13.3.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_15.2.rel1.bb
index dde7ddeb7adc..470d030904b6 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.2.rel1.bb
@@ -8,12 +8,12 @@ COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
 SUMMARY =3D "Arm GNU Toolchain - AArch64 bare-metal target (aarch64-none=
-elf)"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
=20
-LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D40=
2090210d41f07263e91f760d0d1ea3"
-LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D2a6=
2a4d37ddad55da732679acd9edf03"
+LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
+LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "fad7d567be5c095943d42f7078ea6f9a8452=
062dfe151152c2ec825814d254e0"
-SRC_URI[gcc-x86_64.sha256sum] =3D "7fedf894040580b1db747d06ac5d4263c46e5=
91ffe7695656d1da5accb00a159"
+SRC_URI[gcc-aarch64.sha256sum] =3D "46195685b6aec1077e3f1b7706b43a6aa1fe=
f4d8d3bff3a411b7dad1c5b1196b"
+SRC_URI[gcc-x86_64.sha256sum] =3D "66f7ce7c1bf662f589a4caf440812375f3cd8=
000a033ccf0971127a0726d6921"
=20
 S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_13.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_15.2.rel1.bb
similarity index 76%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-arm-none-eabi_13.3.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
arm-none-eabi_15.2.rel1.bb
index 7660509b2fde..0477607c370d 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.2.rel1.bb
@@ -8,12 +8,12 @@ COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
 SUMMARY =3D "Arm GNU Toolchain - AArch32 bare-metal target (arm-none-eab=
i)"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
=20
-LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D40=
2090210d41f07263e91f760d0d1ea3"
-LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D2a6=
2a4d37ddad55da732679acd9edf03"
+LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
+LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "c8824bffd057afce2259f7618254e840715f=
33523a3d4e4294f471208f976764"
-SRC_URI[gcc-x86_64.sha256sum] =3D "95c011cee430e64dd6087c75c800f04b9c498=
32cc1000127a92a97f9c8d83af4"
+SRC_URI[gcc-aarch64.sha256sum] =3D "d061559d814b205ed30c5b7c577c03317ec4=
47ca51cd5a159d26b12a5bbeb20c"
+SRC_URI[gcc-x86_64.sha256sum] =3D "597893282ac8c6ab1a4073977f23629901845=
99643b4c5ee34870a8215783a16"
=20
 S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.50.1 (Apple Git-155)


