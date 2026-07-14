Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2014FC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:26:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9428.1784035598384542686
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 06:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dxhfD8/w;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 486BD2F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:26:33 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A8413F93E
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784035597; bh=rmDlDmo/436LxqBmYrXJRs12Hi8jxqzTCKrhPEydUQo=;
	h=From:To:Subject:Date:From;
	b=dxhfD8/wOxaM2cPtwJpmOdFErmq/8+7j5AiHep5yV/pmuwQXn8hwQiZyqL/wp+glw
	 eLOcVGnqq/fX8hhVImMqGr31rxEYmlk3Zb3k4l3Jt/5fDZngJ123R4d33GxN0/y10S
	 HxWnZPDzwsp86DGtAcKq7laZWJYAlDdWkQKajbxM=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: Update to new toolchain version
Date: Tue, 14 Jul 2026 09:26:36 -0400
Message-ID: <20260714132636.60732-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 13:26:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7116

Update the recipes to the newest release.  Also, Arm Binary Toolchains
have moved to https://gitlab.arm.com/tooling/gnu-toolchains-for-arm

The new location has a new layout, which means the upstream version
check needs to change.  Unfortunately, they are not using tags, but do
seem to use branch names like a tag.  So, using that for the version
check.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ..._15.2.rel1.bb =3D> gcc-aarch64-none-elf_15.3.rel1.bb} | 10 +++++-----
 ...abi_15.2.rel1.bb =3D> gcc-arm-none-eabi_15.3.rel1.bb} | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_15.2.rel1.bb =3D> gcc-aarch64-none-elf_15.3.rel1.bb} (51%=
)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
rm-none-eabi_15.2.rel1.bb =3D> gcc-arm-none-eabi_15.3.rel1.bb} (51%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_15.2.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_15.3.rel1.bb
similarity index 51%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_15.2.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_15.3.rel1.bb
index 470d030904b6..447db59cd4b5 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.2.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.3.rel1.bb
@@ -11,11 +11,11 @@ LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-onl=
y"
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "46195685b6aec1077e3f1b7706b43a6aa1fe=
f4d8d3bff3a411b7dad1c5b1196b"
-SRC_URI[gcc-x86_64.sha256sum] =3D "66f7ce7c1bf662f589a4caf440812375f3cd8=
000a033ccf0971127a0726d6921"
+SRC_URI =3D "https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolch=
ains-for-arm/packages/generic/gnu-toolchain/${PV}/arm-gnu-toolchain-${PV}=
-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc-${HOST_ARCH}"
+SRC_URI[gcc-aarch64.sha256sum] =3D "a1c6fdda8b479ea3e235d38dc0994790b840=
648b60e9fbaf88c82ca117a7a2df"
+SRC_URI[gcc-x86_64.sha256sum] =3D "1b07847728d455f18895f1ebd5d71a40f2ccb=
7cb3a84ca9a874d7f961a318ce4"
=20
 S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
-UPSTREAM_CHECK_URI =3D "https://developer.arm.com/downloads/-/arm-gnu-to=
olchain-downloads"
-UPSTREAM_CHECK_REGEX =3D "arm-gnu-toolchain-(?P<pver>\d+\.\d*\.[A-z]*\d*=
).*-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
+UPSTREAM_CHECK_URI =3D "https://gitlab.arm.com/tooling/gnu-toolchains-fo=
r-arm/-/branches"
+UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)\?"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_15.2.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_15.3.rel1.bb
similarity index 51%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-arm-none-eabi_15.2.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
arm-none-eabi_15.3.rel1.bb
index 0477607c370d..70a3a372893a 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.2.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.3.rel1.bb
@@ -11,11 +11,11 @@ LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-onl=
y"
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "d061559d814b205ed30c5b7c577c03317ec4=
47ca51cd5a159d26b12a5bbeb20c"
-SRC_URI[gcc-x86_64.sha256sum] =3D "597893282ac8c6ab1a4073977f23629901845=
99643b4c5ee34870a8215783a16"
+SRC_URI =3D "https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolch=
ains-for-arm/packages/generic/gnu-toolchain/${PV}/arm-gnu-toolchain-${PV}=
-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc-${HOST_ARCH}"
+SRC_URI[gcc-aarch64.sha256sum] =3D "06979e0c8171de58e5dc2a2b2019330a290f=
30930f27728af98a83e1a7369b3a"
+SRC_URI[gcc-x86_64.sha256sum] =3D "563bebb2b97d53382b956d6ee1fe61e2cae26=
699901417234a37df505ef9b5fa"
=20
 S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
-UPSTREAM_CHECK_URI =3D "https://developer.arm.com/downloads/-/arm-gnu-to=
olchain-downloads"
-UPSTREAM_CHECK_REGEX =3D "arm-gnu-toolchain-(?P<pver>\d+\.\d*\.[A-z]*\d*=
).*-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
+UPSTREAM_CHECK_URI =3D "https://gitlab.arm.com/tooling/gnu-toolchains-fo=
r-arm/-/branches"
+UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)\?"
--=20
2.50.1 (Apple Git-155)


