Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.34478.1606137061443570507
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 05:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3EDC31B
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2020 05:10:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44A7C3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2020 05:10:59 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/fvp-base: move to trusted-firmware-a 2.4
Date: Mon, 23 Nov 2020 13:10:52 +0000
Message-Id: <20201123131053.2926514-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I2bf668c798983847197bfef80ef14ab3c87ecad5
Tested-by: Anders Dellien <anders.dellien@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf                     | 2 ++
 .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend      | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend      | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.4.bbappend

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 4bccdb6..8ab2134 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -9,6 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
=20
 TUNE_FEATURES =3D "aarch64"
=20
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
+
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
index 0e6fb1e..f27e9a3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
@@ -4,7 +4,6 @@ MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
 MACHINE_TFA_REQUIRE_a5ds =3D "trusted-firmware-a-a5ds.inc"
 MACHINE_TFA_REQUIRE_foundation-armv8 =3D "trusted-firmware-a-fvp.inc"
-MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
new file mode 100644
index 0000000..68472a5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -0,0 +1,6 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?=3D ""
+MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
+
+require ${MACHINE_TFA_REQUIRE}
--=20
2.25.1

