Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10419.1603704737453461341
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F8CB12FC
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFFC53F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:16 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/8] arm-bsp/edk2-firmware: fix N1SDP build with clang
Date: Mon, 26 Oct 2020 09:32:08 +0000
Message-Id: <20201026093212.1532587-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Clang finds more bad code paths than GCC, and edk2 uses -Werror.

Pending status because the upstreamed support appears to have been
entirely rewritten.

Change-Id: I43d4e7f28f0a6acc4ecdd1514402c1b831871b5b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  2 ++
 .../uefi/edk2-firmware_git.bbappend           |  2 ++
 .../recipes-bsp/uefi/files/initialise.patch   | 32 +++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/initialise.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 518f504..94f9beb 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,6 +1,8 @@
 EDK2_SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/edk2.git"
 EDK2_PLATFORMS_SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm=
/edk2-platforms.git"
=20
+SRC_URI +=3D "file://initialise.patch"
+
 # TAGS and commit ID as per N1SDP-2020.03.26 release
 SRCREV_edk2           =3D "3ff8a6bffabad761279817252014d59b6069d68a"
 SRCREV_edk2-platforms =3D "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
index bef54b0..7bd7aae 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+
 # Include machine specific configurations for UEFI EDK2
=20
 MACHINE_EDK2_REQUIRE ?=3D ""
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/initialise.patch b/meta-ar=
m-bsp/recipes-bsp/uefi/files/initialise.patch
new file mode 100644
index 0000000..86fcd15
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/initialise.patch
@@ -0,0 +1,32 @@
+These variables can be returned without being set, so assign reasonable
+fallback values for the error paths.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ef296251231a9a646051efbed0d81131f0876e25 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 21 Oct 2020 17:29:17 +0100
+Subject: [PATCH] Add missing Status assignments
+
+---
+ Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c          | 2 +-
+ Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c b/Platform/ARM=
/Drivers/CcixDxe/CcixEnumeration.c
+index b605d9adbd..6b11a8545d 100644
+--- a/edk2-platforms/Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c
++++ b/edk2-platforms/Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c
+@@ -684 +684 @@ CcixAgentInit(
+-  EFI_STATUS Status;
++  EFI_STATUS Status =3D EFI_ABORTED;
+diff --git a/Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c b/Pla=
tform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c
+index c828165d07..e1f7f5e8ea 100644
+--- a/edk2-platforms/Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe=
.c
++++ b/edk2-platforms/Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe=
.c
+@@ -26 +26 @@ ArmN1SdpPkgEntryPoint (
+-  EFI_STATUS                 Status;=0D
++  EFI_STATUS                 Status =3D EFI_UNSUPPORTED;=0D
+--=20
+2.25.1
--=20
2.25.1

