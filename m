Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25441.1605879922852262296
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 05:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B510B153B
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60C3F3F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/trusted-firmware-a: consolidate SRC_URI and S
Date: Fri, 20 Nov 2020 13:45:05 +0000
Message-Id: <20201120134506.1494232-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120134506.1494232-1-ross.burton@arm.com>
References: <20201120134506.1494232-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

All the recipes use the same value for SRC_URI and S, so consolidate them
into the include file.

Change-Id: Ieda6b0104e163ce46190e9fc5756a264f7198f25
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 3 +++
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb  | 4 ----
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb  | 4 ----
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb  | 4 ----
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb  | 4 ----
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb  | 4 ----
 6 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index f7439c1..1e483a7 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -7,6 +7,8 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy
=20
+SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
+
 COMPATIBLE_MACHINE ?=3D "invalid"
 COMPATIBLE_MACHINE_qemuarm64 ?=3D "qemuarm64"
=20
@@ -27,6 +29,7 @@ TFA_SPD_aarch64_qemuall ?=3D "opteed"
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?=3D "0"
=20
+S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1=
.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
index 2e41e90..56d3507 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
@@ -4,16 +4,12 @@
=20
 require trusted-firmware-a.inc
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
-
 # Use TF-A for version
 SRCREV_FORMAT =3D "tfa"
=20
 # TF-A v1.5
 SRCREV_tfa =3D "ed8112606c54d85781fc8429160883d6310ece32"
=20
-S =3D "${WORKDIR}/git"
-
 LIC_FILES_CHKSUM +=3D "file://license.rst;md5=3De927e02bca647e14efd87e9e=
914b2443"
=20
 #
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
index 96df5c6..44d6d6f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
@@ -4,16 +4,12 @@
=20
 require trusted-firmware-a.inc
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
-
 # Use TF-A for version
 SRCREV_FORMAT =3D "tfa"
=20
 # TF-A v2.1
 SRCREV_tfa =3D "e1286bdb968ee74fc52f96cf303a4218e1ae2950"
=20
-S =3D "${WORKDIR}/git"
-
 LIC_FILES_CHKSUM +=3D "file://license.rst;md5=3Dc709b197e22b81ede21109db=
ffd5f363"
=20
 #
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
index 58e6c8e..4e8882c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
@@ -4,16 +4,12 @@
=20
 require trusted-firmware-a.inc
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
-
 # Use TF-A for version
 SRCREV_FORMAT =3D "tfa"
=20
 # TF-A v2.2
 SRCREV_tfa =3D "7192b956bde11652a835eee0724dca0e403fee90"
=20
-S =3D "${WORKDIR}/git"
-
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
=20
 #
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
index d333854..6c8308a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -4,16 +4,12 @@
=20
 require trusted-firmware-a.inc
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
-
 # Use TF-A for version
 SRCREV_FORMAT =3D "tfa"
=20
 # TF-A v2.3
 SRCREV_tfa =3D "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
=20
-S =3D "${WORKDIR}/git"
-
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
=20
 #
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 6adc00b..8dab35f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -8,13 +8,9 @@ DEFAULT_PREFERENCE =3D "-1"
=20
 require trusted-firmware-a.inc
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
-
 # Use TF-A for version
 SRCREV_FORMAT =3D "tfa"
=20
-S =3D "${WORKDIR}/git"
-
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
=20
 #
--=20
2.25.1

