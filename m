Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E01EC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 16:10:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40845.1699891843989127168
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 08:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80AEFEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 08:11:28 -0800 (PST)
Received: from debian.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55F753F7B4
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 08:10:43 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/toolchains: update to 13.2.Rel1
Date: Mon, 13 Nov 2023 10:10:38 -0600
Message-Id: <20231113161038.7660-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 16:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5237

Upgrade the Arm binary toolchains to the latest version.  Of note, the
untarred directory has camelcased the "R" in Rel (which was "rel" in the
previous versions).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/get-binary-toolchains                                  | 2 +-
 ...elf_12.3.rel1.bb =3D> gcc-aarch64-none-elf_13.2.Rel1.bb} | 8 ++++----
 ...e-eabi_12.3.rel1.bb =3D> gcc-arm-none-eabi_13.2.Rel1.bb} | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_12.3.rel1.bb =3D> gcc-aarch64-none-elf_13.2.Rel1.bb} (76%=
)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
rm-none-eabi_12.3.rel1.bb =3D> gcc-arm-none-eabi_13.2.Rel1.bb} (76%)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 69a4d38e..429cd1c5 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u -e
=20
 BASENAME=3Darm-gnu-toolchain
-VER=3D${VER:-12.2.rel1}
+VER=3D${VER:-13.2.Rel1}
 HOST_ARCH=3D${HOST_ARCH:-$(uname -m)}
=20
 # Use the standard kas container locations if nothing is passed into the=
 script
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_12.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_13.2.Rel1.bb
similarity index 76%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_12.3.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_13.2.Rel1.bb
index 7d06f291..890efa7d 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_12.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.2.Rel1.bb
@@ -8,12 +8,12 @@ COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
 SUMMARY =3D "Arm GNU Toolchain - AArch64 bare-metal target (aarch64-none=
-elf)"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
=20
-LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D0a=
ef214b835259b64f026f4ad00c703e"
-LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D7ba=
3bc8ef145b48e2756a844db2029a3"
+LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D40=
2090210d41f07263e91f760d0d1ea3"
+LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D2a6=
2a4d37ddad55da732679acd9edf03"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "76ba68db4390b50f0a16386c6a011ec611a3=
5a517ae40b7be008ca7920cfa59f"
-SRC_URI[gcc-x86_64.sha256sum] =3D "382c8c786285e415bc0ff4df463e101f76d6f=
69a894b03f132368147c37f0ba7"
+SRC_URI[gcc-aarch64.sha256sum] =3D "f3871c0d91a7375834eb43eb758f4df6d8da=
df20ad9deca2eb569d5599d98e89"
+SRC_URI[gcc-x86_64.sha256sum] =3D "7fe7b8548258f079d6ce9be9144d2a10bd2bf=
93b551dafbf20fe7f2e44e014b8"
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_12.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_13.2.Rel1.bb
similarity index 76%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-arm-none-eabi_12.3.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
arm-none-eabi_13.2.Rel1.bb
index 6c33ec65..00390b58 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_12.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.2.Rel1.bb
@@ -8,12 +8,12 @@ COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
 SUMMARY =3D "Arm GNU Toolchain - AArch32 bare-metal target (arm-none-eab=
i)"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
=20
-LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D0a=
ef214b835259b64f026f4ad00c703e"
-LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D7ba=
3bc8ef145b48e2756a844db2029a3"
+LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D40=
2090210d41f07263e91f760d0d1ea3"
+LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D2a6=
2a4d37ddad55da732679acd9edf03"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "14c0487d5753f6071d24e568881f7c7e67f8=
0dd83165dec5164b3731394af431"
-SRC_URI[gcc-x86_64.sha256sum] =3D "12a2815644318ebcceaf84beabb665d0924b6=
e79e21048452c5331a56332b309"
+SRC_URI[gcc-aarch64.sha256sum] =3D "8fd8b4a0a8d44ab2e195ccfbeef42223dfb3=
ede29d80f14dcf2183c34b8d199a"
+SRC_URI[gcc-x86_64.sha256sum] =3D "6cd1bbc1d9ae57312bcd169ae283153a9572b=
d6a8e4eeae2fedfbc33b115fdbb"
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.30.2


