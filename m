Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web11.10221.1603704737897070421
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEEAF30E
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B5143F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/8] arm/edk2-firmware: build for qemuarm64 by default
Date: Mon, 26 Oct 2020 09:32:11 +0000
Message-Id: <20201026093212.1532587-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

edk2 has a qemu/aarch64 platform, so build this in the base recipe so
the recipe can always be tested with the latest release.

Change-Id: I22988cd3fab9a4a37e0014a0d70beac81301f21b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index 07303d0..a594971 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -25,11 +25,11 @@ SRCREV_edk2           ?=3D "06dc822d045c2bb42e4974879=
35485302486e151"
 SRCREV_edk2-platforms ?=3D "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
=20
-EDK2_BUILD_RELEASE   ?=3D "0"
-EDK2_PLATFORM        ?=3D "invalid"
-EDK2_PLATFORM_DSC    ?=3D ""
-EDK2_BIN_NAME        ?=3D ""
-EDK2_ARCH            ?=3D ""
+EDK2_BUILD_RELEASE   ?=3D "1"
+EDK2_PLATFORM        ?=3D "ArmVirtQemu-AARCH64"
+EDK2_PLATFORM_DSC    ?=3D "ArmVirtPkg/ArmVirtQemu.dsc"
+EDK2_BIN_NAME        ?=3D "QEMU_EFI.fd"
+EDK2_ARCH            ?=3D "AARCH64"
=20
 EDK2_BUILD_MODE =3D "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RE=
LEASE', 'DEBUG', d)}"
=20
@@ -41,7 +41,7 @@ S =3D "${WORKDIR}/edk2"
 B =3D "${WORKDIR}/build"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE ?=3D "invalid"
+COMPATIBLE_MACHINE ?=3D "qemuarm64"
=20
 LDFLAGS[unexport] =3D "1"
=20
--=20
2.25.1

