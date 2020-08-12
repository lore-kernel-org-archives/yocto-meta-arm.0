Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11744.1597227175867888174
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 03:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0DF0D6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:54 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756853F22E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/trusted-firmware-m: clean up configure/compile
Date: Wed, 12 Aug 2020 11:12:48 +0100
Message-Id: <20200812101251.3237307-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

Move B up a level so the build tree is entirely separate from the source
tree.

Use [cleandirs] to ensure that B is present and empty when rebuilding,
and remove now redundant code.

Finally add some comments to explain why trying to use cmake.bbclass is
pointless.

Change-Id: Ic8ddc08c46b9e945023e0b0a6e4ca1a6294b726b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m_1.0.bb                 | 30 +++++++++----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index 3be1b33..814529a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -30,6 +30,11 @@ SRCREV_mbed-crypto ?=3D "mbedcrypto-3.0.1"
 SRCREV_mbedtls ?=3D "mbedtls-2.7.14"
 SRCREV_cmsis ?=3D "5.5.0"
=20
+# Note to future readers of this recipe: until the CMakeLists don't abus=
e
+# installation (see do_install) there is no point in trying to inherit
+# cmake here. You can easily short-circuit the toolchain but the install
+# is so convoluted there's no gain.
+
 inherit python3native deploy
=20
 TFM_DEPENDS ?=3D ""
@@ -39,7 +44,7 @@ DEPENDS +=3D "python3-cryptography-native python3-pyasn=
1-native"
 DEPENDS +=3D "python3-jinja2-native python3-cbor-native python3-pyyaml-n=
ative"
=20
 S =3D "${WORKDIR}/git/tfm"
-B =3D "${S}/build"
+B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
@@ -89,28 +94,21 @@ do_check_config() {
     fi
 }
=20
+do_configure[cleandirs] =3D "${B}"
 do_configure() {
     cd ${S}
-    python3 "tools/tfm_parse_manifest_list.py"
-
-    if [ ! -d "${B}" ]
-    then
-        install -d ${B}
-    else
-        rm -f ${B}/CMakeCache.txt
-    fi
+    python3 tools/tfm_parse_manifest_list.py
+    cd -
=20
-    cd ${B}
     cmake -G"Unix Makefiles" --build ${S} ${EXTRA_OECMAKE}
 }
=20
+# Invoke install here as there's no point in splitting compile from inst=
all: the
+# first thing the build does is 'install' inside the build tree thus cau=
sing a
+# rebuild. It also overrides the install prefix to be in the build tree,=
 so you
+# can't use the usual install prefix variables.
 do_compile() {
-    if [ -d "${B}" ]
-    then
-        oe_runmake -C ${B} install
-    else
-        bbfatal "TF-M CMake not generated!"
-    fi
+    oe_runmake install
 }
=20
 do_install() {
--=20
2.26.2

