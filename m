Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8679.1608024043459402812
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56295106F
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECFA63F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:37 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm/trusted-firmware-m: add upstream tag regex
Date: Tue, 15 Dec 2020 09:20:27 +0000
Message-Id: <20201215092030.2723188-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215092030.2723188-1-ross.burton@arm.com>
References: <20201215092030.2723188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So that the automatic latest upstream release detection works correctly,
specify what release tags look like.

Change-Id: I8e028b9457719a462f2028daca028714b80fad63
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index 1ec24d5..9b204b8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -28,6 +28,8 @@ SRCREV_tfm =3D "0768982ea41b5e7d207445f19ee23e5d67d9c89=
b"
 SRCREV_mbed-crypto =3D "1146b4e06011b69a6437e6b728f2af043a06ec19"
 SRCREV_cmsis =3D "5.5.0"
=20
+UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
+
 # Note to future readers of this recipe: until the CMakeLists don't abus=
e
 # installation (see do_install) there is no point in trying to inherit
 # cmake here. You can easily short-circuit the toolchain but the install
--=20
2.25.1

