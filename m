Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web08.2044.1608312871349305698
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC96B1063
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FC733F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:32 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] arm/trusted-firmware-m: set PACKAGE_ARCH
Date: Fri, 18 Dec 2020 17:34:26 +0000
Message-Id: <20201218173427.1225026-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173427.1225026-1-ross.burton@arm.com>
References: <20201218173427.1225026-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As this is machine-specific, set PACKAGE_ARCH to MACHINE.

Change-Id: I4569bce706de8dea4ba98770960c0d40348a3fa2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index 630379a..9a56f53 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -40,6 +40,8 @@ inherit python3native deploy
 # Baremetal and we bring a compiler below
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
 DEPENDS +=3D "cmake-native"
 DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native python3-=
cbor-native"
=20
--=20
2.25.1

