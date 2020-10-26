Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web11.10221.1603704737897070421
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286F71FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C90933F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:17 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/8] arm/edk2-firmware: don't assume that platforms are in edk2-platforms
Date: Mon, 26 Oct 2020 09:32:10 +0000
Message-Id: <20201026093212.1532587-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some platforms are inside edk2 itself, so don't assume that the platform
path is relative to edk2-platforms.

Remove the edk2-platforms path prefix from the tasks, and move the
prefix to EDK2_PLATFORM_DSC.

Change-Id: I53e3dcd499f4d9f1d72c4d68ac82faed4fec70f2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc  | 2 +-
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 94f9beb..3c57bd0 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -10,7 +10,7 @@ SRCREV_edk2-platforms =3D "d9d32e6c8b7456d21ce365486ac5=
63b6be36c20d"
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE =3D "0"
 EDK2_PLATFORM      =3D "n1sdp"
-EDK2_PLATFORM_DSC  =3D "N1SdpPkg/N1SdpPlatform.dsc"
+EDK2_PLATFORM_DSC  =3D "Platform/ARM/N1SdpPkg/N1SdpPlatform.dsc"
 EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
 EDK2_ARCH          =3D "AARCH64"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
index 0e30a71..9666a1e 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
@@ -4,7 +4,7 @@ SRCREV_edk2-platforms =3D "b972f17b329a85e6aa4d69f240d459=
839ba8b47c"
 # SGI575 specific EDK2 configurations
 EDK2_BUILD_RELEASE =3D "0"
 EDK2_PLATFORM      =3D "Sgi575"
-EDK2_PLATFORM_DSC  =3D "SgiPkg/Sgi575/Sgi575.dsc"
+EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc"
 EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
 EDK2_ARCH          =3D "AARCH64"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index 93c40e8..07303d0 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -77,7 +77,7 @@ do_compile() {
        -a "${EDK2_ARCH}" \
        -b ${EDK2_BUILD_MODE} \
        -t ${EDK_COMPILER} \
-       -p "${S}/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
+       -p ${EDK2_PLATFORM_DSC}
 }
=20
 do_install() {
--=20
2.25.1

