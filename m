Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4856.1607511438763503894
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 02:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B46E31B
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Dec 2020 02:57:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6F053F718
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Dec 2020 02:57:17 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/qemuarm64-secureboot: don't use -dev kernel
Date: Wed,  9 Dec 2020 10:57:14 +0000
Message-Id: <20201209105714.4193993-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

According to the comment linux-yocto-dev was being used to get a 5.5
kernel as 5.4 was panicking on boot.  Now linux-yocto defaults to 5.8
so just use the standard kernel instead.

Change-Id: Id382c69f16f2ff4b2cbc63be94a645e56616549d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index f2c15e6..fe19ed2 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -6,10 +6,6 @@ KMACHINE =3D "qemuarm64"
=20
 UBOOT_MACHINE =3D "qemu_arm64_defconfig"
=20
-# The 5.4 kernel panics when booting, so use the development kernel unti=
l the
-# default kernel is upgraded (5.5. supposedly works)
-PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-dev"
-
 QB_MACHINE =3D "-machine virt,secure=3Don"
 QB_OPT_APPEND +=3D "-no-acpi"
 QB_MEM =3D "-m 1024"
@@ -23,4 +19,3 @@ IMAGE_FSTYPES +=3D "wic wic.qcow2"
 WKS_FILE ?=3D "qemuarm64.wks"
 WKS_FILE_DEPENDS =3D "trusted-firmware-a"
 IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
-
--=20
2.25.1

