Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11935.1616762676785047732
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 05:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA655143D
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 05:44:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 841603F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 05:44:34 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/juno: move tf-a version from 2.3 to 2.4
Date: Fri, 26 Mar 2021 12:44:30 +0000
Message-Id: <20210326124431.3085123-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Damodar Santhapuri <damodar.santhapuri@arm.com>

Move trusted-firmware-a version to 2.4 for juno

Change-Id: Ib6e6e5537a7ecb2246d3f96b4beb8893cea605dc
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf                             | 2 +-
 .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend          | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend          | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 8cff6c4..0e84dd3 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
 PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot firmware-imag=
e-juno"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
index f5f1632..3c7460f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
@@ -1,6 +1,5 @@
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
index 36a9e93..bdcdb53 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -5,6 +5,7 @@ MACHINE_TFA_REQUIRE_corstone500 =3D "trusted-firmware-a-c=
orstone500.inc"
 MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
+MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
=20
--=20
2.25.1

