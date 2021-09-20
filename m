Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13084.1632150306093175378
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 08:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 405C5106F
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 08:05:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03063F59C
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 08:05:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-toolchain/gcc-aarch64-none-elf: upgrade to 10.3-2021.07
Date: Mon, 20 Sep 2021 16:04:59 +0100
Message-Id: <20210920150500.939582-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ie58f448511ef4f1d23cfd4a9d1dc275f7a216a50
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...10.2-2020.11.bb =3D> gcc-aarch64-none-elf_10.3-2021.07.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_10.2-2020.11.bb =3D> gcc-aarch64-none-elf_10.3-2021.07.bb=
} (80%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
similarity index 80%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_10.2-2020.11.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_10.3-2021.07.bb
index fabe1b16..c1758a33 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_10.2-2020.11.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_10.3-2021.07.bb
@@ -9,14 +9,14 @@ SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
=20
 LIC_FILES_CHKSUM =3D "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH=
}"))}"
-LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dfd=
f39a58ab6e893f3d83594cef77fa05"
+LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dd0=
6ace534ed0851debcb7140c5b5116e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3De4b=
cb5bee0c4a50c06704b0b73fcbe0c"
=20
 PROVIDES =3D "virtual/aarch64-none-elf-gcc"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-a/${P=
V}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgnu-a-${HOS=
T_ARCH}"
-SRC_URI[gnu-a-x86_64.sha256sum] =3D "32abfbc7b24c56542f2a6e6969d6b8787e4=
7f7223e8f2097d84151ebd9f86743"
-SRC_URI[gnu-a-aarch64.sha256sum] =3D "4f9f060e2ca993ec9564054e17b6fdeacb=
47260e983f766f84f157d00345bf29"
+SRC_URI[gnu-a-aarch64.sha256sum] =3D "768a5db41d93f48838f1c4bfeae26930df=
2320c09f0dfa798321082fb937955f"
+SRC_URI[gnu-a-x86_64.sha256sum] =3D "6f74b1ee370caeb716688d2e467e5b44727=
fdc0ed56023fe5c72c0620019ecef"
=20
 S =3D "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.25.1

