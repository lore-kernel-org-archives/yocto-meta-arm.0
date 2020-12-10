Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.14129.1607610423439647995
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 06:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C781FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:27:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6777F3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:27:02 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][gatesgarth] arm/qemuarm64-secureboot: don't use -dev kernel
Date: Thu, 10 Dec 2020 14:26:58 +0000
Message-Id: <20201210142658.1499868-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross@burtonini.com>

According to the comment linux-yocto-dev was being used to get a 5.5
kernel as 5.4 was panicking on boot.  Now linux-yocto defaults to 5.8
so just use the standard kernel instead.

Change-Id: Id382c69f16f2ff4b2cbc63be94a645e56616549d
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
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

