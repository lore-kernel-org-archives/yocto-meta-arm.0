Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4431.1616586167418119834
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 04:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAFCAD6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 560C63F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/corstone500: use trusted-firmware-a 2.4
Date: Wed, 24 Mar 2021 11:42:42 +0000
Message-Id: <20210324114242.600917-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324114242.600917-1-ross.burton@arm.com>
References: <20210324114242.600917-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ie3014bdb07dc4f9e6ba28750fda7b5408fb7508a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf                      | 2 +-
 .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend          | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend          | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index ec1d9e2..29291a0 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -17,7 +17,7 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.3%"
 KBUILD_DEFCONFIG =3D "multi_v7_defconfig"
 KCONFIG_MODE =3D "--alldefconfig"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
index 2337caf..f5f1632 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
@@ -1,7 +1,6 @@
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE_corstone500 =3D "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
index 222aac9..36a9e93 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -1,6 +1,7 @@
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
+MACHINE_TFA_REQUIRE_corstone500 =3D "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
--=20
2.25.1

