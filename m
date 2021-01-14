Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.15.1610622984022779118
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 03:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BCD11042
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 03:16:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 281A13F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 03:16:23 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] gem5: centralise v20 sources
Date: Thu, 14 Jan 2021 11:16:19 +0000
Message-Id: <20210114111619.2170401-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114111619.2170401-1-ross.burton@arm.com>
References: <20210114111619.2170401-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

Both simulator and bootloader now fetch from a single include file
defining the sources. This is in preparation for m5term recipe.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: Ia4f6b6d99401ddb0c726d913ceff4ced90f41f6b
---
 .../gem5/gem5-aarch64-bootloader_20.bb        | 11 +---------
 .../gem5/gem5-aarch64-native_20.bb            | 20 +++++--------------
 .../recipes-devtools/gem5/gem5-source_20.inc  | 12 +++++++++++
 3 files changed, 18 insertions(+), 25 deletions(-)
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-source_20.inc

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.b=
b b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
index d960e6c..67570f6 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
@@ -1,15 +1,6 @@
 # gem5 custom bootloader
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
-                    file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
-
-SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1"
-RELEASE_TAG =3D "v20.0.0.1"
-SRCREV =3D "332a9de33db603e0aefedae1e05134db4257ea3e"
-
-PV =3D "${RELEASE_TAG}"
-
-S =3D "${WORKDIR}/git"
+require gem5-source_20.inc
=20
 BPN =3D "gem5-aarch64-bootloader"
=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/=
meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index ce36514..a222765 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -1,19 +1,9 @@
-# gem5 simulator source and checksum information
+require gem5-source_20.inc
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
-                    file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
-
-SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1 \
-           file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-o=
bject.patch \
-           file://0002-arch-arm-Introduce-HavePACExt-helper.patch \
-           file://0003-arch-arm-Check-if-PAC-is-implemented-before-execu=
ting-insts.patch \
-          "
-RELEASE_TAG =3D "v20.0.0.3"
-SRCREV =3D "fa70478413e4650d0058cbfe81fd5ce362101994"
-
-PV =3D "${RELEASE_TAG}"
-
-S =3D "${WORKDIR}/git"
+SRC_URI +=3D "file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marsha=
l-object.patch \
+            file://0002-arch-arm-Introduce-HavePACExt-helper.patch \
+            file://0003-arch-arm-Check-if-PAC-is-implemented-before-exec=
uting-insts.patch \
+           "
=20
 BPN =3D "gem5-aarch64-native"
=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc b/meta-ge=
m5/recipes-devtools/gem5/gem5-source_20.inc
new file mode 100644
index 0000000..c448466
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
@@ -0,0 +1,12 @@
+#=C2=A0gem5 sources v20.0.0.3
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
+                    file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
+
+SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1"
+RELEASE_TAG =3D "v20.0.0.3"
+SRCREV =3D "fa70478413e4650d0058cbfe81fd5ce362101994"
+
+PV =3D "${RELEASE_TAG}"
+
+S =3D "${WORKDIR}/git"
--=20
2.25.1

