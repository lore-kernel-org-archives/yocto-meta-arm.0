Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.16571.1610486438906648041
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 13:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 363B81042
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 13:20:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7B3C3F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 13:20:37 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/opencsd: upgrade to 1.0.0
Date: Tue, 12 Jan 2021 21:20:33 +0000
Message-Id: <20210112212033.595087-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I7c88e60bbeb6d9149d6d6178067bcd149405c111
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../opencsd/{opencsd_0.14.4.bb =3D> opencsd_1.0.0.bb} | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_0.14.4.bb =3D> opencsd=
_1.0.0.bb} (64%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb b/meta-a=
rm/recipes-devtools/opencsd/opencsd_1.0.0.bb
similarity index 64%
rename from meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb
index 2d71a56..cb75ce1 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps"
-SRCREV =3D "f4344d1b7d5eb191b6af3d64aa253407a2608e15"
+SRCREV =3D "01d44a34f8fc057f4b041c01f8d9502d77fe612f"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -19,9 +19,10 @@ EXTRA_OEMAKE =3D "ARCH=3D'${TARGET_ARCH}' \
                 LINUX64=3D1 \
                 DEBUG=3D1 \
                 PREFIX=3D${D}/usr \
-                INSTALL_BIN_DIR=3D${D}/${bindir} \
-                INSTALL_INCLUDE_DIR=3D${D}/${includedir} \
-                INSTALL_LIB_DIR=3D${D}/${libdir} \
+                INSTALL_BIN_DIR=3D${D}${bindir} \
+                INSTALL_INCLUDE_DIR=3D${D}${includedir} \
+                INSTALL_LIB_DIR=3D${D}${libdir} \
+                INSTALL_MAN_DIR=3D${D}${mandir}/man1 \
                 "
=20
 do_compile() {
@@ -29,7 +30,9 @@ do_compile() {
 }
=20
 do_install() {
-    oe_runmake -C ${S}/decoder/build/linux install
+    # Remove mkdir when upgrading (https://github.com/Linaro/OpenCSD/pul=
l/36)
+    mkdir --parents ${D}${mandir}/man1
+    oe_runmake -C ${S}/decoder/build/linux install install_man
 }
=20
 BBCLASSEXTEND =3D "native"
--=20
2.25.1

