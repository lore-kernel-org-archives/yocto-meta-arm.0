Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18820.1625649743004684224
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 02:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CBF0ED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  7 Jul 2021 02:22:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA8AC3F694
	for <meta-arm@lists.yoctoproject.org>; Wed,  7 Jul 2021 02:22:21 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 1/3] arm-toolchain/gcc-aarch64-none-elf: Fix license checksums
Date: Wed,  7 Jul 2021 10:22:16 +0100
Message-Id: <20210707092218.2900000-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ben Horgan <ben.horgan@arm.com>

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 .../gcc-aarch64-none-elf_10.2-2020.11.bb                      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
index 5cbab9e..91caee1 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_10.2-2020.11.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_10.2-2020.11.bb
@@ -9,8 +9,8 @@ SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
=20
 LIC_FILES_CHKSUM =3D "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH=
}"))}"
-LIC_FILES_CHKSUM_aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D1b=
548d9c341b3b5c82bc88551964aa60"
-LIC_FILES_CHKSUM_x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3Dc1d=
f856e21b17e58b0adbe29cacf4bd4"
+LIC_FILES_CHKSUM_aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dfd=
f39a58ab6e893f3d83594cef77fa05"
+LIC_FILES_CHKSUM_x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3De4b=
cb5bee0c4a50c06704b0b73fcbe0c"
=20
 PROVIDES =3D "virtual/aarch64-none-elf-gcc"
=20
--=20
2.25.1

