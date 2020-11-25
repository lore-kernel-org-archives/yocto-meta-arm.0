Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5561.1606304413851065737
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 03:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C218A106F
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 03:40:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9583F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 03:40:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base*: move to trusted-firmware-a 2.4
Date: Wed, 25 Nov 2020 11:40:10 +0000
Message-Id: <20201125114010.3220865-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move both FVP platforms to TF-A 2.4.

Change-Id: I2bf668c798983847197bfef80ef14ab3c87ecad5
Tested-by: Anders Dellien <anders.dellien@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf              | 2 --
 meta-arm-bsp/conf/machine/fvp-common.inc                   | 2 +-
 .../trusted-firmware-a/trusted-firmware-a_2.2.bbappend     | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend     | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend     | 7 +++++++
 5 files changed, 8 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.4.bbappend

diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp=
/conf/machine/fvp-base-arm32.conf
index 36beca1..9e821b7 100644
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -9,8 +9,6 @@ require conf/machine/include/arm/arch-armv7a.inc
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
-PREFERRED_VERSION_trusted-firmware-a =3D "2.2%"
-
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_aarch32_defconfig"
=20
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index 841760e..9697de5 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -32,7 +32,7 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
=20
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.2.bbappend
index c6bd111..73e15d0 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.=
bbappend
@@ -1,7 +1,6 @@
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
 MACHINE_TFA_REQUIRE_sgi575 =3D "trusted-firmware-a-sgi575.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
index 357d4a3..4a953ac 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
@@ -3,7 +3,6 @@
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
 MACHINE_TFA_REQUIRE_a5ds =3D "trusted-firmware-a-a5ds.inc"
-MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
new file mode 100644
index 0000000..4a89fd5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -0,0 +1,7 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?=3D ""
+MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
+MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
+
+require ${MACHINE_TFA_REQUIRE}
--=20
2.25.1

