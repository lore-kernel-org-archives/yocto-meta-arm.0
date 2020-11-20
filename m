Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25439.1605879922282317432
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 05:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 987E91396
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 443F83F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:11 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm-bsp/fvp-base-arm32: explicitly select trusted-firmware-a 2.2
Date: Fri, 20 Nov 2020 13:45:03 +0000
Message-Id: <20201120134506.1494232-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120134506.1494232-1-ross.burton@arm.com>
References: <20201120134506.1494232-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Previously TF-A 2.3 failed to build for fvp-base-arm32, so explicitly sel=
ect 2.2 for now.

Change-Id: I21f74861c5d5955ed7890d4e6fafc72dd85fe27f
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp=
/conf/machine/fvp-base-arm32.conf
index 3c3e5ac..36beca1 100644
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv7a.inc
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
+PREFERRED_VERSION_trusted-firmware-a =3D "2.2%"
=20
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_aarch32_defconfig"
--=20
2.25.1

