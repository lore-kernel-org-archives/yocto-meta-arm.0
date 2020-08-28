Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40151.1598609753423205941
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 03:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46B19D6E
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:52 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF4CE3F68F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm-bsp/trusted-firmware-a: remove duplicated Mbed TLS tarball
Date: Fri, 28 Aug 2020 11:15:43 +0100
Message-Id: <20200828101545.1291491-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828101545.1291491-1-ross.burton@arm.com>
References: <20200828101545.1291491-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

Now that trusted-firmware-a is actually adding the Mbed TLS tarball, the
machine-specific includes can stop doing it themselves.

Change-Id: I45754b8a4eba99c8fbf7c99e61d01f2a27da1b4a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-sgi575.inc            | 2 --
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-sgi575.inc
index 6d04fa3..5020dea 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
@@ -1,7 +1,5 @@
 # SGI575 specific TFA support
=20
-SRC_URI_append =3D " ${SRC_URI_MBEDTLS}"
-
 COMPATIBLE_MACHINE =3D "sgi575"
 TFA_PLATFORM       =3D "sgi575"
 TFA_BUILD_TARGET   =3D "all fip"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc0.inc
index d22108a..6049947 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.=
inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.=
inc
@@ -3,8 +3,6 @@
 # Intermediate SHA with 2.3 baseline version
 SRCREV_tfa =3D "2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537"
=20
-SRC_URI_append =3D " ${SRC_URI_MBEDTLS}"
-
 DEPENDS +=3D "scp-firmware"
=20
 COMPATIBLE_MACHINE =3D "tc0"
--=20
2.28.0

