Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40153.1598609753975530153
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 03:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C1FA11B3
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:53 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20D333F68F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm-bsp/trusted-firmware-a: remove redundant MBEDTLS_DIR assignment
Date: Fri, 28 Aug 2020 11:15:45 +0100
Message-Id: <20200828101545.1291491-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828101545.1291491-1-ross.burton@arm.com>
References: <20200828101545.1291491-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

The base recipe already does this, so there's no need to do it again.

Change-Id: I04f679ab267db3bcdbb812dce6be2efc8a25b633
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-sgi575.inc            | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-sgi575.inc
index 5020dea..e63be96 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
@@ -12,5 +12,5 @@ TFA_UBOOT          =3D "0"
 DEPENDS +=3D "virtual/uefi-firmware"
=20
 EXTRA_OEMAKE +=3D "BL33=3D${RECIPE_SYSROOT}/firmware/uefi.bin"
-EXTRA_OEMAKE +=3D "MBEDTLS_DIR=3Dmbedtls TRUSTED_BOARD_BOOT=3D1 GENERATE=
_COT=3D1 ARM_ROTPK_LOCATION=3Ddevel_rsa \
+EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
                      ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc0.inc
index 6049947..e2f41f1 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.=
inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.=
inc
@@ -15,5 +15,5 @@ TFA_MBEDTLS =3D "1"
 TFA_DEBUG =3D "1"
=20
 EXTRA_OEMAKE +=3D "SCP_BL2=3D${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
-EXTRA_OEMAKE +=3D "MBEDTLS_DIR=3Dmbedtls TRUSTED_BOARD_BOOT=3D1 GENERATE=
_COT=3D1 ARM_ROTPK_LOCATION=3Ddevel_rsa \
+EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
                      ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
--=20
2.28.0

