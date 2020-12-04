Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web10.15667.1607095758624299140
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E50A1534
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEFE93F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:17 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 13/17] arm-toolchain/gcc-arm-none-eabi: support aarch64 hosts
Date: Fri,  4 Dec 2020 15:29:01 +0000
Message-Id: <20201204152905.1160276-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This binary toolchain is also available for aarch64, so support fetching
that too.

Change-Id: I6206d8a9b4221d8461070d0cb7fff40c712c3df0
Signed-off-by: Ross Burton <ross.burton@arm.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../gcc-arm-none-eabi_9-2019-q4-major.bb                 | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index dcc76a9..ede9ae9 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
@@ -3,7 +3,7 @@
=20
 require arm-binary-toolchain.inc
=20
-COMPATIBLE_HOST =3D "x86_64.*-linux"
+COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
=20
 SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eab=
i/license.txt;md5=3Dc18349634
=20
 PROVIDES =3D "virtual/arm-none-eabi-gcc"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-=
2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
-
-SRC_URI[md5sum] =3D "fe0029de4f4ec43cf7008944e34ff8cc"
-SRC_URI[sha256sum] =3D "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b2527=
1e83ec4ff41d177a"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-=
2019q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=3Dgnu-rm-${HOST_ARCH}=
"
+SRC_URI[gnu-rm-x86_64.sha256sum] =3D "bcd840f839d5bf49279638e9f67890b2ef=
3a7c9c7a9b25271e83ec4ff41d177a"
+SRC_URI[gnu-rm-aarch64.sha256sum] =3D "1f5b9309006737950b2218250e6bb392e=
2d68d4f1a764fe66be96e2a78888d83"
--=20
2.25.1

