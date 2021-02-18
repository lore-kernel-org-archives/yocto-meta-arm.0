Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6184.1613652300520142308
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 04:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DACE31FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84A773F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:59 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm-bsp/musca*: update TFM_PLATFORM
Date: Thu, 18 Feb 2021 12:44:50 +0000
Message-Id: <20210218124450.3042061-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218124450.3042061-1-ross.burton@arm.com>
References: <20210218124450.3042061-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

trusted-firmware-m 1.2.0 uses different naming for the platforms, so
update the BSPs as appropriate.

Change-Id: I3b67b629d821a6b65f39bc89db768e791f173d93
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 2 +-
 meta-arm-bsp/conf/machine/musca-s1.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index 7ad2039..3e7b5f5 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -25,4 +25,4 @@ ZEPHYR_BOARD =3D "v2m_musca_b1"
 ZEPHYR_INHERIT_CLASSES +=3D "zephyr-qemuboot"
 ARCH_musca-b1 =3D "arm"
=20
-TFM_PLATFORM =3D "MUSCA_B1"
+TFM_PLATFORM =3D "musca_b1"
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/=
machine/musca-s1.conf
index c4131a8..4b06c74 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -9,4 +9,4 @@ require conf/machine/include/tune-cortexm33.inc
 # GLIBC will not work with Cortex-M.
 TCLIBC =3D "newlib"
=20
-TFM_PLATFORM =3D "MUSCA_S1"
+TFM_PLATFORM =3D "musca_s1"
--=20
2.25.1

