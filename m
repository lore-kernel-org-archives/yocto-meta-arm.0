Received: from C02VH2K5HV2R.localdomain (C02VH2K5HV2R.localdomain [81.96.232.39])
 by mx.groups.io with SMTP id smtpd.web09.489.1611867058524465384
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 12:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: c02vh2k5hv2r.localdomain, ip: 81.96.232.39, mailfrom: adrher02@c02vh2k5hv2r.localdomain)
Received: by C02VH2K5HV2R.localdomain (Postfix, from userid 501)
	id E39009B26418; Wed,  6 Jan 2021 16:59:18 +0000 (GMT)
From: "Adrian Herrera" <adrian.herrera@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Adrian Herrera <adrian.herrera@arm.com>
Subject: [meta-gem5][PATCH] gem5: centralise v20 sources
Date: Wed,  6 Jan 2021 16:59:06 +0000
Message-Id: <20210106165906.26897-1-adrian.herrera@arm.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Both simulator and bootloader now fetch from a single include file
defining the sources. This is in preparation for m5term recipe.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
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
2.30.0

