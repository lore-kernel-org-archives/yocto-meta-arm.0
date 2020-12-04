Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15669.1607095759062965683
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8395F152B
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 301F23F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:16 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 10/17] arm-toolchain/recipes-devtools: move compatible host assignments
Date: Fri,  4 Dec 2020 15:28:58 +0000
Message-Id: <20201204152905.1160276-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some of the toolchains are available in more than just x86-64, so move
the COMPATIBLE_HOST assignment out of the include and into the recipes.

Change-Id: I10977593935bc7dc50196132d43541aed585cc18
Signed-off-by: Ross Burton <ross.burton@arm.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 --
 .../recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb | 2 ++
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 ++
 .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/arm-binary-toolchain.inc
index d262e39..d099481 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
@@ -1,5 +1,3 @@
-COMPATIBLE_HOST =3D "x86_64.*-linux"
-
 FILES_${PN} =3D "${datadir} ${bindir}"
=20
 BINNAME =3D "${@d.getVar("BPN").strip("gcc-")}"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.13.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.13.bb
index 7a7673b..8fbb8d0 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.13.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.13.bb
@@ -26,6 +26,8 @@ PROVIDES =3D "virtual/armcompiler"
=20
 ARMCLANG_VERSION =3D "DS500-BN-00026-r5p0-15rel0"
=20
+COMPATIBLE_HOST =3D "x86_64.*-linux"
+
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/compiler/=
${ARMCLANG_VERSION}.tgz;subdir=3D${ARMCLANG_VERSION}"
=20
 SRC_URI[md5sum] =3D "fbed6edf5eb211c45df7b8548a10535a"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/=
external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index f156143..5de0f96 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
@@ -3,6 +3,8 @@
=20
 require arm-binary-toolchain.inc
=20
+COMPATIBLE_HOST =3D "x86_64.*-linux"
+
 SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
=20
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index 77e44ce..dcc76a9 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
@@ -3,6 +3,8 @@
=20
 require arm-binary-toolchain.inc
=20
+COMPATIBLE_HOST =3D "x86_64.*-linux"
+
 SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
=20
--=20
2.25.1

