Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13735.1607016065283527824
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 09:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3BA11D4
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 396563F575
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:03 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/trusted-firmware-m: clean up DEPENDS
Date: Thu,  3 Dec 2020 17:20:56 +0000
Message-Id: <20201203172059.1347328-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TFM_DEPENDS isn't used anywhere so remove it.

Change-Id: I7707ada458a001a081aac1f417dc78d6ca37a307
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index 80df2f1..f24f579 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -35,11 +35,8 @@ SRCREV_cmsis =3D "5.5.0"
=20
 inherit python3native deploy
=20
-TFM_DEPENDS ?=3D ""
-DEPENDS +=3D "${TFM_DEPENDS}"
 DEPENDS +=3D "cmake-native"
-DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native"
-DEPENDS +=3D "python3-cbor-native"
+DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native python3-=
cbor-native"
=20
 S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
--=20
2.25.1

