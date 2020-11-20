Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.25196.1605879922574541892
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 05:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D1021534
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCCB23F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:11 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm-bsp/a5ds: explicitly select trusted-firmware-a 2.3
Date: Fri, 20 Nov 2020 13:45:04 +0000
Message-Id: <20201120134506.1494232-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120134506.1494232-1-ross.burton@arm.com>
References: <20201120134506.1494232-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This BSP doesn't select a version of trusted-firmware-a, for clarity and
allow smooth upgrades explictly select 2.3.

Change-Id: I4e7ca6ff8322e22406040ba2f220d36e1bde4cae
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/a5ds.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/mach=
ine/a5ds.conf
index a0fe029..8a4b36d 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -11,6 +11,8 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.3%"
 KBUILD_DEFCONFIG =3D "multi_v7_defconfig"
 KCONFIG_MODE =3D "--alldefconfig"
=20
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
--=20
2.25.1

