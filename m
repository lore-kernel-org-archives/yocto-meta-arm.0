Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.249.1604332311021374205
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D7C030E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:51:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 265C83F719
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:51:50 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/opencsd: build on 32-bit Arm/x86
Date: Mon,  2 Nov 2020 15:51:47 +0000
Message-Id: <20201102155147.2845341-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

OpenCSD supports 32-bit Arm and x86 too, so extend COMPATIBLE_HOST.

Change-Id: Icf64b4645c4062e3b660b2bd2f3404bfe6c061b7
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb b/meta-a=
rm/recipes-devtools/opencsd/opencsd_0.14.3.bb
index 2121241..bec3dc7 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
@@ -8,7 +8,7 @@ SRCREV =3D "957d18219d162f52ebe2426f32a4263ec10f357d"
=20
 S =3D "${WORKDIR}/git"
=20
-COMPATIBLE_HOST =3D "(x86_64.*|aarch64.*)-linux"
+COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
 EXTRA_OEMAKE =3D "ARCH=3D'${TARGET_ARCH}' \
                 CROSS_COMPILE=3D'${TARGET_SYS}-' \
--=20
2.25.1

