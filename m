Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web12.15606.1607095758634194618
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C15C152D
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48B4D3F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:17 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 12/17] arm-toolchain/gcc-aarch64-none-elf: support aarch64 hosts
Date: Fri,  4 Dec 2020 15:29:00 +0000
Message-Id: <20201204152905.1160276-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This binary toolchain is also available for aarch64, so support fetching
that too.

Change-Id: I788fcd95c30b97f095593059e85de9a99710be05
Signed-off-by: Ross Burton <ross.burton@arm.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../gcc-aarch64-none-elf_9.2-2019.12.bb             | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/=
external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 5de0f96..221c07a 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
@@ -3,16 +3,19 @@
=20
 require arm-binary-toolchain.inc
=20
-COMPATIBLE_HOST =3D "x86_64.*-linux"
+COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
=20
 SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
=20
-LIC_FILES_CHKSUM =3D "file://share/doc/gcc/Copying.html;md5=3Dc1df856e21=
b17e58b0adbe29cacf4bd4"
+LIC_FILES_CHKSUM =3D "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH=
}"))}"
+LIC_FILES_CHKSUM_aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D1b=
548d9c341b3b5c82bc88551964aa60"
+LIC_FILES_CHKSUM_x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3Dc1d=
f856e21b17e58b0adbe29cacf4bd4"
=20
 PROVIDES =3D "virtual/aarch64-none-elf-gcc"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-a/${P=
V}/binrel/gcc-arm-${PV}-x86_64-${BINNAME}.tar.xz"
-SRC_URI[sha256sum] =3D "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f=
1326c88de337b6d1"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-a/${P=
V}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgnu-a-${HOS=
T_ARCH}"
+SRC_URI[gnu-a-x86_64.sha256sum] =3D "36d2cbe7c2984f2c20f562ac2f3ba524c59=
151adfa8ee10f1326c88de337b6d1"
+SRC_URI[gnu-a-aarch64.sha256sum] =3D "041ca53bdd434b1a48f32161e957da1b84=
543c373d1881e2fd84a1579f87f243"
=20
-S =3D "${WORKDIR}/gcc-arm-${PV}-x86_64-${BINNAME}"
+S =3D "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
--=20
2.25.1

