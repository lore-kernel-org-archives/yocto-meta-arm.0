Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web08.2044.1608312871349305698
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 852FC101E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 284A03F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:31 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm/trusted-firmware-m: remove more unneeded build dependencies
Date: Fri, 18 Dec 2020 17:34:24 +0000
Message-Id: <20201218173427.1225026-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173427.1225026-1-ross.burton@arm.com>
References: <20201218173427.1225026-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TF-M uses the binary Arm toolchains currently, so we can inhibit
all of the default dependencies.

Change-Id: I38a7bda9570d9d63d3d81f0886c437f29929a0f5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index 906f2f0..d35099d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -37,8 +37,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d=
+)+)$"
=20
 inherit python3native deploy
=20
-# Baremetal, just need a compiler
-DEPENDS_remove =3D "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+# Baremetal and we bring a compiler below
+INHIBIT_DEFAULT_DEPS =3D "1"
=20
 DEPENDS +=3D "cmake-native"
 DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native python3-=
cbor-native"
--=20
2.25.1

