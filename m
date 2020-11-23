Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.35138.1606137061441341048
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 05:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42253D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2020 05:11:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE1653F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2020 05:10:59 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/fvp-base-arm32: move to trusted-firmware-a 2.4
Date: Mon, 23 Nov 2020 13:10:53 +0000
Message-Id: <20201123131053.2926514-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123131053.2926514-1-ross.burton@arm.com>
References: <20201123131053.2926514-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I7f981d1c9456d7f821a0f57c77af763b1b523edd
Tested-by: Anders Dellien <anders.dellien@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf                   | 2 +-
 .../trusted-firmware-a/trusted-firmware-a_2.2.bbappend          | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend          | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp=
/conf/machine/fvp-base-arm32.conf
index 36beca1..13bb78d 100644
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv7a.inc
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
-PREFERRED_VERSION_trusted-firmware-a =3D "2.2%"
+PREFERRED_VERSION_trusted-firmware-a =3D "2.4%"
=20
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_aarch32_defconfig"
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
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
index 68472a5..4a89fd5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -2,5 +2,6 @@
=20
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
+MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
=20
 require ${MACHINE_TFA_REQUIRE}
--=20
2.25.1

