Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13680.1607016100077234578
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 09:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6F7311D4
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7364B3F575
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:39 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/opencsd: upgrade to 1.14.4
Date: Thu,  3 Dec 2020 17:21:37 +0000
Message-Id: <20201203172137.1347737-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Notable changes include resolving a build race.

Clean up the recipe so that arguments are not passed twice in do_compile(=
),
and always pass the install path arguments to clean up the tasks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Change-Id: I7e32a40092403fd0c0c53d157ae4581f7903356c
---
 .../{opencsd_0.14.3.bb =3D> opencsd_0.14.4.bb}    | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_0.14.3.bb =3D> opencsd=
_0.14.4.bb} (61%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb b/meta-a=
rm/recipes-devtools/opencsd/opencsd_0.14.4.bb
similarity index 61%
rename from meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
index bec3dc7..2d71a56 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE =3D "https://github.com/Linaro/OpenCSD"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
-SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "957d18219d162f52ebe2426f32a4263ec10f357d"
+SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps"
+SRCREV =3D "f4344d1b7d5eb191b6af3d64aa253407a2608e15"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -18,19 +18,18 @@ EXTRA_OEMAKE =3D "ARCH=3D'${TARGET_ARCH}' \
                 LINKER=3D'${CXX}' \
                 LINUX64=3D1 \
                 DEBUG=3D1 \
+                PREFIX=3D${D}/usr \
+                INSTALL_BIN_DIR=3D${D}/${bindir} \
+                INSTALL_INCLUDE_DIR=3D${D}/${includedir} \
+                INSTALL_LIB_DIR=3D${D}/${libdir} \
                 "
=20
 do_compile() {
-    oe_runmake -C ${S}/decoder/build/linux ${EXTRA_OEMAKE}
+    oe_runmake -C ${S}/decoder/build/linux
 }
=20
 do_install() {
-    oe_runmake \
-        PREFIX=3D${D}/usr \
-        INSTALL_BIN_DIR=3D${D}/${bindir} \
-        INSTALL_INCLUDE_DIR=3D${D}/${includedir} \
-        INSTALL_LIB_DIR=3D${D}/${libdir} \
-        -C ${S}/decoder/build/linux install
+    oe_runmake -C ${S}/decoder/build/linux install
 }
=20
 BBCLASSEXTEND =3D "native"
--=20
2.25.1

