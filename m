Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2241.1608313256131732911
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4BFE101E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:40:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C5733F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:40:55 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/edk2-firmware: upgrade SGI575 to 202011
Date: Fri, 18 Dec 2020 17:40:32 +0000
Message-Id: <20201218174032.1225473-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218174032.1225473-1-ross.burton@arm.com>
References: <20201218174032.1225473-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Id002f1f460d9a0d66c913d3f3c7bb460ae7d5904
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf                      | 2 +-
 .../recipes-bsp/uefi/edk2-firmware_202008.bbappend         | 7 -------
 .../recipes-bsp/uefi/edk2-firmware_202011.bbappend         | 1 +
 3 files changed, 2 insertions(+), 8 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bb=
append

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 1b1001f..860b6d7 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -21,7 +21,7 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.7%"
 KCONFIG_MODE =3D "--alldefconfig"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
-PREFERRED_VERSION_edk2-firmware ?=3D "202008%"
+PREFERRED_VERSION_edk2-firmware ?=3D "202011%"
=20
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend =
b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
deleted file mode 100644
index fb4abed..0000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-# Include machine specific configurations for UEFI EDK2
-
-MACHINE_EDK2_REQUIRE ?=3D ""
-
-MACHINE_EDK2_REQUIRE_sgi575 =3D "edk2-firmware-sgi575.inc"
-
-require ${MACHINE_EDK2_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend =
b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
index 8a656d7..d34cd27 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
@@ -3,5 +3,6 @@
 MACHINE_EDK2_REQUIRE ?=3D ""
=20
 MACHINE_EDK2_REQUIRE_fvp-base =3D "edk2-firmware-fvp-base.inc"
+MACHINE_EDK2_REQUIRE_sgi575 =3D "edk2-firmware-sgi575.inc"
=20
 require ${MACHINE_EDK2_REQUIRE}
--=20
2.25.1

