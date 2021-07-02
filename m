Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11309.1625240035585007466
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 08:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906FBD6E;
	Fri,  2 Jul 2021 08:33:53 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.90.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E75023F5A1;
	Fri,  2 Jul 2021 08:33:52 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/arch-armv8r64: Introduce armv8r64 compiler flags
Date: Fri,  2 Jul 2021 16:33:40 +0100
Message-Id: <20210702153340.729501-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Introduce the proper compiler flags for armv8r64, and also
disable -march=3Darmv8-r for boot-wrapper-aarch64

Issue-Id: SCM-2342
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I3d2fac232139b057a5d1a3a8c6f5b825f95d709a
---
 .../include/arm/armv8r/arch-armv8r64.inc      | 28 +++++++++++++++++--
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |  2 ++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.i=
nc b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
index 4ae8a51..92bfa31 100644
--- a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
@@ -1,4 +1,26 @@
-# We are temporarily using armv8-4a until GCC 11 is released and support=
ed by
-# oe-core which will include the armv8-r support for aarch64.
+DEFAULTTUNE ?=3D "armv8r"
=20
-require conf/machine/include/arm/arch-armv8-4a.inc
+TUNEVALID[armv8r] =3D "Enable instructions for ARMv8-r"
+TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', ' -mar=
ch=3Darmv8-r', '', d)}"
+TUNEVALID[crc] =3D "Enable instructions for ARMv8-r Cyclic Redundancy Ch=
eck (CRC)"
+TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '=
', d)}"
+TUNEVALID[crypto] =3D "Enable instructions for ARMv8-r cryptographic"
+TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+cryp=
to', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', '=
armv8-r:', '', d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+
+# Little Endian base configs
+AVAILTUNES +=3D "armv8r armv8r-crc armv8r-crypto"
+ARMPKGARCH_tune-armv8r                    ?=3D "armv8r"
+ARMPKGARCH_tune-armv8r-crc                ?=3D "armv8r"
+ARMPKGARCH_tune-armv8r-crypto             ?=3D "armv8r"
+TUNE_FEATURES_tune-armv8r                  =3D "aarch64 armv8r"
+TUNE_FEATURES_tune-armv8r-crc              =3D "${TUNE_FEATURES_tune-arm=
v8r} crc"
+TUNE_FEATURES_tune-armv8r-crypto           =3D "${TUNE_FEATURES_tune-arm=
v8r} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8r            =3D "aarch64 armv8r"
+PACKAGE_EXTRA_ARCHS_tune-armv8r-crc        =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv8r} armv8r-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8r-crypto     =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv8r} armv8r-crypto"
+BASE_LIB_tune-armv8r                       =3D "lib64"
+BASE_LIB_tune-armv8r-crc                   =3D "lib64"
+BASE_LIB_tune-armv8r-crypto                =3D "lib64"
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-a=
arch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aar=
ch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
index b57bf11..7fbba3e 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
@@ -10,3 +10,5 @@ BOOT_WRAPPER_AARCH64_CMDLINE =3D "\
 earlycon console=3DttyAMA0 loglevel=3D8 rootfstype=3Dext4 root=3D/dev/vd=
a1 rw"
=20
 EXTRA_OECONF_remove =3D "--enable-psci"
+
+TUNE_CCARGS =3D ""
--=20
2.25.1

