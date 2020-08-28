Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40437.1598611780220195323
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 03:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D982931B
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:49:39 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D0AA3F68F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:49:39 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-firmware-a: reorder the build targets
Date: Fri, 28 Aug 2020 11:49:34 +0100
Message-Id: <20200828104934.1325606-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Build the DTBs before the FIP, as the latter depends on the former to exi=
st.

Change-Id: I6059805458b12cb87c2af77eb924778844dc88ec
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-juno.inc
index c685d7d..3aa8520 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno=
.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno=
.inc
@@ -5,7 +5,7 @@ TFA_PLATFORM =3D "juno"
 TFA_DEBUG =3D "1"
 TFA_MBEDTLS =3D "1"
 TFA_UBOOT =3D "1"
-TFA_BUILD_TARGET =3D "bl1 bl2 bl31 fip dtbs"
+TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
=20
 # Juno needs the System Control Processor Firmware
 DEPENDS +=3D "virtual/control-processor-firmware"
--=20
2.28.0

