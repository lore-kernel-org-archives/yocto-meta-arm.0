Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6735.1603881414606925206
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 03:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD3F016F8
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Oct 2020 03:36:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 587323F719
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Oct 2020 03:36:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/opencsd: upgrade to 1.43.3
Date: Wed, 28 Oct 2020 10:36:49 +0000
Message-Id: <20201028103649.748730-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I7487c116be0f267dfb53f45ff0a5974c8467dbb6
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../opencsd/{opencsd_0.14.2.bb =3D> opencsd_0.14.3.bb}  | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_0.14.2.bb =3D> opencsd=
_0.14.3.bb} (66%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb b/meta-a=
rm/recipes-devtools/opencsd/opencsd_0.14.3.bb
similarity index 66%
rename from meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
index f321c7d..2121241 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE =3D "https://github.com/Linaro/OpenCSD"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
-SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttp;branch=3Dma=
ster"
-SRCREV =3D "afdea70b2cafa20837703c387d33cd6776c6d16a"
+SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
+SRCREV =3D "957d18219d162f52ebe2426f32a4263ec10f357d"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -25,7 +25,12 @@ do_compile() {
 }
=20
 do_install() {
-    oe_runmake -C ${S}/decoder/build/linux PREFIX=3D${D}/usr install
+    oe_runmake \
+        PREFIX=3D${D}/usr \
+        INSTALL_BIN_DIR=3D${D}/${bindir} \
+        INSTALL_INCLUDE_DIR=3D${D}/${includedir} \
+        INSTALL_LIB_DIR=3D${D}/${libdir} \
+        -C ${S}/decoder/build/linux install
 }
=20
 BBCLASSEXTEND =3D "native"
--=20
2.25.1

