Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9630.1624030977257628426
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 08:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F076313A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Jun 2021 08:42:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A45A3F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Jun 2021 08:42:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/opencsd: upgrade to 1.1.0
Date: Fri, 18 Jun 2021 16:42:52 +0100
Message-Id: <20210618154252.601262-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I0f8004b3f75eb45fa45ac3d1355fbb12b297808b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../opencsd/{opencsd_1.0.0.bb =3D> opencsd_1.1.0.bb}            | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.0.0.bb =3D> opencsd_=
1.1.0.bb} (86%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.1.0.bb
similarity index 86%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
index cb75ce1..e77433d 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps"
-SRCREV =3D "01d44a34f8fc057f4b041c01f8d9502d77fe612f"
+SRCREV =3D "54c3f67811fbcea853b7d223383d4a755819bb7e"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -30,8 +30,6 @@ do_compile() {
 }
=20
 do_install() {
-    # Remove mkdir when upgrading (https://github.com/Linaro/OpenCSD/pul=
l/36)
-    mkdir --parents ${D}${mandir}/man1
     oe_runmake -C ${S}/decoder/build/linux install install_man
 }
=20
--=20
2.25.1

