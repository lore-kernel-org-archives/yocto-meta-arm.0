Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5167.1617113749077750870
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 07:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D69E31B
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 07:15:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3E53F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 07:15:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: upgrade to 202102
Date: Tue, 30 Mar 2021 15:15:45 +0100
Message-Id: <20210330141545.2542755-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The edk2 SRCREV is the tag, has edk2-platforms doesn't tag releases the
SRCREV is approximately the same date.

Also remove the PREFERRED_VERSION from SGI575 so it doesn't need to be
updated in the future.

Change-Id: I5ac544e70b404081bf0638a54514a412d87fb3d3
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf                         | 2 --
 ...firmware_202011.bbappend =3D> edk2-firmware_202102.bbappend} | 0
 meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb             | 4 ----
 meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb             | 4 ++++
 4 files changed, 4 insertions(+), 6 deletions(-)
 rename meta-arm-bsp/recipes-bsp/uefi/{edk2-firmware_202011.bbappend =3D>=
 edk2-firmware_202102.bbappend} (100%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index f5baa0f..2004369 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -19,8 +19,6 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.7%"
 KCONFIG_MODE =3D "--alldefconfig"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
-PREFERRED_VERSION_edk2-firmware ?=3D "202011%"
-
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
 MACHINE_FEATURES +=3D "efi"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend =
b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202011.bb
deleted file mode 100644
index 94310e3..0000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?=3D "872f953262d68a11da7bc2fb3ded16df234b8700"
-SRCREV_edk2-platforms ?=3D "3f71a8fb114ae9ce87281eb30ab0e678f6806b05"
-
-require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202102.bb
new file mode 100644
index 0000000..1352922
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?=3D "ef91b07388e1c0a50c604e5350eeda98428ccea6"
+SRCREV_edk2-platforms ?=3D "2620e05c6fade20ef5e1ba69280d09f9e2b3eff6"
+
+require edk2-firmware.inc
--=20
2.25.1

