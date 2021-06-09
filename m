Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8586.1623248725228972536
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 07:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8CD7106F
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Jun 2021 07:25:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80FFF3F73D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Jun 2021 07:25:23 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-a: disable branch protection on SGI575
Date: Wed,  9 Jun 2021 15:25:17 +0100
Message-Id: <20210609142517.747237-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609142517.747237-1-ross.burton@arm.com>
References: <20210609142517.747237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

oe-core master's gcc is built with branch protection on by default. Howev=
er,
this results in slightly larger binaries which mean the SGI575 build is n=
ow
too large.

Until this is investigated properly, we can just disable branch protectio=
n
for the SGI575 build.

Change-Id: I9a8b0a8e569b944c274199ce306a3864c94c8c5c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi575.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-sgi575.inc
index e63be96..84f679c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
@@ -14,3 +14,4 @@ DEPENDS +=3D "virtual/uefi-firmware"
 EXTRA_OEMAKE +=3D "BL33=3D${RECIPE_SYSROOT}/firmware/uefi.bin"
 EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
                      ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
+EXTRA_OEMAKE +=3D "CFLAGS=3D-mbranch-protection=3Dnone"
--=20
2.25.1

