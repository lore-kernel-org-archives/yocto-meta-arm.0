Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12407.1616764555114874169
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 06:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D803143D
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:15:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06AD33F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:15:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm-bsp/trusted-firmware-a: upgrade SGI575 to trusted-firmware-a 2.4
Date: Fri, 26 Mar 2021 13:15:44 +0000
Message-Id: <20210326131547.3093762-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I7a3e50a0f5558a135b318d70d6d75eefc570ea2f
Tested-by: Thomas Abraham <thomas.abraham@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf                         | 4 +---
 .../trusted-firmware-a/trusted-firmware-a_2.2.bbappend        | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend        | 1 +
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 860b6d7..f5baa0f 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -8,9 +8,7 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.=
inc
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
-# Trusted firmware v2.2 version
-PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.2.bbappend
index 73e15d0..3c7460f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.=
bbappend
@@ -1,6 +1,5 @@
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE_sgi575 =3D "trusted-firmware-a-sgi575.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
index bdcdb53..827c0b9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -7,6 +7,7 @@ MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.=
inc"
 MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE_sgi575 =3D "trusted-firmware-a-sgi575.inc"
 MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
--=20
2.25.1

