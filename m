Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC727CC6B19
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 16:57:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2646.1791910675057448824
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=W+PzECri;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CB0E169E
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 09:57:50 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC8253FA32
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791910673; bh=mZjb40loA16p+50v0xO2ENKmnO42ptfjU/5kHeUK3uw=;
	h=From:To:Subject:Date:From;
	b=W+PzECriFTyBo1dNa5fgSYgC94b1mIlyIMGQPWBQKC8w+yve/wLcHfe7uv5SUBS1O
	 pPt8k9agbDWr1Sr0PFFED+SOTMj48po0Vr0jTmCt4zS2BT8Qtx7dlVjwocwyb/u/Ce
	 jcdMwhe8vzNjHEpCDmFmkiyBJFf43MIy/EdEoVy4=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: update to 15.3.rel2 release
Date: Tue, 13 Oct 2026 12:57:53 -0400
Message-ID: <20261013165753.32584-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 16:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7190

Update the Arm GNU Toolchain recipes to the 15.3.rel2 release
for both AArch64 bare-metal and Arm bare-metal toolchains.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...one-elf_15.3.rel1.bb =3D> gcc-aarch64-none-elf_15.3.rel2.bb} | 4 ++--
 ...-none-eabi_15.3.rel1.bb =3D> gcc-arm-none-eabi_15.3.rel2.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_15.3.rel1.bb =3D> gcc-aarch64-none-elf_15.3.rel2.bb} (82%=
)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
rm-none-eabi_15.3.rel1.bb =3D> gcc-arm-none-eabi_15.3.rel2.bb} (82%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_15.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_15.3.rel2.bb
similarity index 82%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_15.3.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_15.3.rel2.bb
index 7bca316daab6..4c0be099cc97 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.3.rel2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copy=
ing.html;md5=3D90014a59d1783b
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
=20
 SRC_URI =3D "https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolch=
ains-for-arm/packages/generic/gnu-toolchain/${PV}/arm-gnu-toolchain-${PV}=
-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "a1c6fdda8b479ea3e235d38dc0994790b840=
648b60e9fbaf88c82ca117a7a2df"
-SRC_URI[gcc-x86_64.sha256sum] =3D "1b07847728d455f18895f1ebd5d71a40f2ccb=
7cb3a84ca9a874d7f961a318ce4"
+SRC_URI[gcc-x86_64.sha256sum] =3D "1e4dc409cf4d33ef0a2e92c345f9e340302d3=
55858de9bc3353758b6463895b0"
+SRC_URI[gcc-aarch64.sha256sum] =3D "63942f3f86e69d7beefa2b946bdb23437628=
529e7b29f97d32229f65d0905e40"
=20
 S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_15.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_15.3.rel2.bb
similarity index 82%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-arm-none-eabi_15.3.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
arm-none-eabi_15.3.rel2.bb
index 53c29f5f5634..8552b16be188 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.3.rel2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copy=
ing.html;md5=3D90014a59d1783b
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
=20
 SRC_URI =3D "https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolch=
ains-for-arm/packages/generic/gnu-toolchain/${PV}/arm-gnu-toolchain-${PV}=
-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "06979e0c8171de58e5dc2a2b2019330a290f=
30930f27728af98a83e1a7369b3a"
-SRC_URI[gcc-x86_64.sha256sum] =3D "563bebb2b97d53382b956d6ee1fe61e2cae26=
699901417234a37df505ef9b5fa"
+SRC_URI[gcc-aarch64.sha256sum] =3D "a0dc18893171d39dec82fd8d57eeab3da836=
fd3df4b61978db3eccbf4a6bb948"
+SRC_URI[gcc-x86_64.sha256sum] =3D "463df9665c246fa13bab2102115bbf8344066=
1b6eb70b44f3dfd4712ca30037a"
=20
 S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.54.0 (Apple Git-157)


