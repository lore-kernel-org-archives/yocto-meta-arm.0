Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2086.1608312872725825441
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26D0530E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE1D53F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:31 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] arm/trusted-firmware-m: improve CMake calls
Date: Fri, 18 Dec 2020 17:34:25 +0000
Message-Id: <20201218173427.1225026-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173427.1225026-1-ross.burton@arm.com>
References: <20201218173427.1225026-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use cmake more idiomatically, and enable verbose builds.

Change-Id: I908af71f4662fab1dde9de86fc7a56ca3701e0c5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.0.bb           | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index d35099d..630379a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -80,6 +80,9 @@ EXTRA_OECMAKE +=3D "-DCOMPILER=3D${TFM_COMPILER}"
 EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUIL=
D_TYPE=3DDebug', '', d)}"
 EXTRA_OECMAKE +=3D "-DPROJ_CONFIG=3D${S}/configs/${TFM_CONFIG}"
=20
+# Verbose builds
+EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
+
 # Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a s=
tandalone application
 CFLAGS[unexport] =3D "1"
 LDFLAGS[unexport] =3D "1"
@@ -99,7 +102,7 @@ do_check_config() {
=20
 do_configure[cleandirs] =3D "${B}"
 do_configure() {
-    cmake -G"Unix Makefiles" --build ${S} ${EXTRA_OECMAKE}
+    cmake -G"Unix Makefiles" ${S} ${EXTRA_OECMAKE}
 }
=20
 # Invoke install here as there's no point in splitting compile from inst=
all: the
@@ -107,7 +110,7 @@ do_configure() {
 # rebuild. It also overrides the install prefix to be in the build tree,=
 so you
 # can't use the usual install prefix variables.
 do_compile() {
-    oe_runmake install
+    cmake --build ./ -- install
 }
=20
 do_install() {
--=20
2.25.1

