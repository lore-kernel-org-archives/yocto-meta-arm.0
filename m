Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14042.1607016065659335865
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 09:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F5E711FB
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFF4A3F575
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:03 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-m: no need to DEPENDS on a C runtime
Date: Thu,  3 Dec 2020 17:20:57 +0000
Message-Id: <20201203172059.1347328-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203172059.1347328-1-ross.burton@arm.com>
References: <20201203172059.1347328-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe is for baremetal firmware, so remove libc from DEPENDS.

Change-Id: Id37f82a4dad6207237117b65d242617467b83ed2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index f24f579..1ec24d5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -35,6 +35,9 @@ SRCREV_cmsis =3D "5.5.0"
=20
 inherit python3native deploy
=20
+# Baremetal, just need a compiler
+DEPENDS_remove =3D "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+
 DEPENDS +=3D "cmake-native"
 DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native python3-=
cbor-native"
=20
--=20
2.25.1

