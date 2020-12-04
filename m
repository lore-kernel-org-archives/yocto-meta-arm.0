Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15667.1607095758624299140
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F15AB1529
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DEE13F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:15 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 09/17] arm-toolchain/gcc-aarch-none-elf: don't use GFLD as license checksum
Date: Fri,  4 Dec 2020 15:28:57 +0000
Message-Id: <20201204152905.1160276-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The GFDL license statement isn't a good choice for the GCC license
checksum, instead use Copying.html from the documentation.

Change-Id: I265bb0add795f3de40f49f8c31127ac9215d2566
Signed-off-by: Ross Burton <ross.burton@arm.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/=
external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 020bbf8..f156143 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
@@ -6,12 +6,11 @@ require arm-binary-toolchain.inc
 SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
=20
-LIC_FILES_CHKSUM =3D "file://share/doc/gcc/GNU-Free-Documentation-Licens=
e.html;md5=3Dcc1e9a49a59ce7e6ae5ef37cd16eca0c"
+LIC_FILES_CHKSUM =3D "file://share/doc/gcc/Copying.html;md5=3Dc1df856e21=
b17e58b0adbe29cacf4bd4"
=20
 PROVIDES =3D "virtual/aarch64-none-elf-gcc"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-a/${P=
V}/binrel/gcc-arm-${PV}-x86_64-${BINNAME}.tar.xz"
-
 SRC_URI[sha256sum] =3D "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f=
1326c88de337b6d1"
=20
 S =3D "${WORKDIR}/gcc-arm-${PV}-x86_64-${BINNAME}"
--=20
2.25.1

