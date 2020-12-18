Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2244.1608313254807505658
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B830101E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:40:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADDC03F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:40:53 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/edk2-firmware: no need to depend on the C library
Date: Fri, 18 Dec 2020 17:40:30 +0000
Message-Id: <20201218174032.1225473-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Firmware is baremetal so doesn't need the C library to build.

Change-Id: Ie376783cb45fb6d455bc5d9c687e77703ff2cd72
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 464b23e..1160c3a 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -31,6 +31,8 @@ EDK2_ARCH            ?=3D "AARCH64"
=20
 EDK2_BUILD_MODE =3D "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RE=
LEASE', 'DEBUG', d)}"
=20
+# Baremetal, no need for a C library
+DEPENDS_remove =3D "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 DEPENDS +=3D "util-linux-native iasl-native"
=20
 inherit deploy
--=20
2.25.1

