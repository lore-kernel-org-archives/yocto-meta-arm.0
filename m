Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6063.1606307503331267140
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2D8931B
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E07F3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:42 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm-bsp/external-system: remove coreutils-native DEPENDS
Date: Wed, 25 Nov 2020 12:31:22 +0000
Message-Id: <20201125123127.3226384-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe doesn't appear to actually need coreutils-native at all, and
using it exposes a bug in pseudo where cp crashes.

Change-Id: I2fbf9ee75165194866e4a14758ed06148340dc2b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/external-system/external-system_0.1.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 84da7ce..a8052c6 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "External system Cortex-M3 Firmware"
 DESCRIPTION =3D "Firmware to be loaded and run in External System Harnes=
s in\
                support to the main application CPU."
 HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/external-=
system.git"
-DEPENDS =3D "coreutils-native gcc-arm-none-eabi-native"
+DEPENDS =3D "gcc-arm-none-eabi-native"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0"
=20
--=20
2.25.1

