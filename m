Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.4593.1616586166982874859
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 04:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24DE031B
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C37AC3F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:45 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/corstone700: use trusted-firmware-a 2.4
Date: Wed, 24 Mar 2021 11:42:41 +0000
Message-Id: <20210324114242.600917-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move to the release of 2.4 instead of a snapshot between 2.3 and 2.4

Change-Id: Ie7bd5a8de310186de14bee9e8f10c1aaae6194e6
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone700.inc     |  3 +--
 .../trusted-firmware-a-corstone700.inc                | 11 -----------
 .../trusted-firmware-a_2.3.bbappend                   |  1 -
 .../trusted-firmware-a_2.4.bbappend                   |  1 +
 4 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm=
-bsp/conf/machine/include/corstone700.inc
index ab3e2a4..9e79e10 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -11,8 +11,7 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel_corstone700 =3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.6%"
=20
-PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
=20
 PREFERRED_PROVIDER_virtual/control-processor-firmware ?=3D "boot-firmwar=
e"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-=
firmware-a-corstone700.inc
index bdffec8..5755005 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone700.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone700.inc
@@ -7,17 +7,6 @@ TFA_UBOOT =3D "1"
 TFA_BUILD_TARGET =3D "all fip"
 TFA_INSTALL_TARGET =3D "fip.bin"
=20
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D1dd070c98a281d18d9eefd938=
729b031"
-
-# TF-A v2.3 is not used because the following commit is needed:
-# fdts: corstone700: add NXP isp1763 node to device tree
-SRCREV_tfa =3D "a6f65b11529b618ff04017f64054dc661c489068"
-
-# This is incorporated into the SRCREV above
-SRC_URI_remove =3D "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue=
.patch"
-
-PV =3D "2.3+git${SRCPV}"
-
 EXTRA_OEMAKE_append =3D " \
                         ARCH=3Daarch32 \
                         TARGET_PLATFORM=3D${TFA_TARGET_PLATFORM} \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
index 0535278..2337caf 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
@@ -3,6 +3,5 @@
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_corstone500 =3D "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
-MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
index 8087f39..222aac9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -1,6 +1,7 @@
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
+MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
--=20
2.25.1

