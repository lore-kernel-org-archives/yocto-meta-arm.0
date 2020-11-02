Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web08.869.1604331230551949686
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F3B230E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD7B83F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:50 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] arm/optee-examples: cleanup recipe
Date: Mon,  2 Nov 2020 15:33:39 +0000
Message-Id: <20201102153341.2844482-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102153341.2844482-1-ross.burton@arm.com>
References: <20201102153341.2844482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Clarify the license and clean up oe_runmake calls.

Change-Id: I6d0eb9aee895e3ed9de73ea14f11084c214ca5af
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-examples.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-ar=
m/recipes-security/optee/optee-examples.inc
index 7d12858..73193f5 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -2,8 +2,8 @@ SUMMARY =3D "OP-TEE examples"
 DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sample Ap=
plications"
 HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples"
=20
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc4=
53d70c30"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70=
c30"
=20
 DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
=20
@@ -36,8 +36,7 @@ TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
=20
 do_compile() {
-    cd ${S}
-    oe_runmake
+    oe_runmake -C ${S}
 }
 do_compile[cleandirs] =3D "${B}"
=20
@@ -52,4 +51,3 @@ FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
=20
 # Imports machine specific configs from staging to build
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
--=20
2.25.1

