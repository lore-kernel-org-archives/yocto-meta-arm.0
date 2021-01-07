Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8952.1610029549550732713
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 06:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA28D6E
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Jan 2021 06:25:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88F103F70D
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Jan 2021 06:25:48 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain/external-arm-toolchains: add upstream checking information
Date: Thu,  7 Jan 2021 14:25:43 +0000
Message-Id: <20210107142543.3871962-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I08168f5369eafb590d7cdbc972320c852d4252b3
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb | 3 +++
 .../gcc-arm-none-eabi_9-2019-q4-major.bb                       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/=
external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 221c07a..5df3727 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
@@ -19,3 +19,6 @@ SRC_URI[gnu-a-x86_64.sha256sum] =3D "36d2cbe7c2984f2c20=
f562ac2f3ba524c59151adfa8ee
 SRC_URI[gnu-a-aarch64.sha256sum] =3D "041ca53bdd434b1a48f32161e957da1b84=
543c373d1881e2fd84a1579f87f243"
=20
 S =3D "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
+
+UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
+UPSTREAM_CHECK_REGEX =3D "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.=
tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index ede9ae9..a9f8079 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
@@ -15,3 +15,6 @@ PROVIDES =3D "virtual/arm-none-eabi-gcc"
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-=
2019q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=3Dgnu-rm-${HOST_ARCH}=
"
 SRC_URI[gnu-rm-x86_64.sha256sum] =3D "bcd840f839d5bf49279638e9f67890b2ef=
3a7c9c7a9b25271e83ec4ff41d177a"
 SRC_URI[gnu-rm-aarch64.sha256sum] =3D "1f5b9309006737950b2218250e6bb392e=
2d68d4f1a764fe66be96e2a78888d83"
+
+UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
+UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\=
w+"
--=20
2.25.1

