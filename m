Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web11.10221.1603704737897070421
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4155C1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1CAA3F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 8/8] arm-bsp/edk2-firmware: add platform for fvp-base.
Date: Mon, 26 Oct 2020 09:32:12 +0000
Message-Id: <20201026093212.1532587-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I2b908006a0dca93241b6cdfdcc10dad31c723d14
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc | 7 +++++++
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.=
inc

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc b/m=
eta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc
new file mode 100644
index 0000000..badec19
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc
@@ -0,0 +1,7 @@
+EDK2_BUILD_RELEASE =3D "0"
+EDK2_PLATFORM      =3D "ArmVExpress-FVP-AArch64"
+EDK2_PLATFORM_DSC  =3D "Platform/ARM/VExpressPkg/ArmVExpress-FVP-AArch64=
.dsc"
+EDK2_BIN_NAME      =3D "FVP_AARCH64_EFI.fd"
+EDK2_ARCH          =3D "AARCH64"
+
+COMPATIBLE_MACHINE =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend b/m=
eta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
index 7bd7aae..8cfd6c5 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
@@ -6,5 +6,6 @@ MACHINE_EDK2_REQUIRE ?=3D ""
=20
 MACHINE_EDK2_REQUIRE_n1sdp =3D "edk2-firmware-n1sdp.inc"
 MACHINE_EDK2_REQUIRE_sgi575 =3D "edk2-firmware-sgi575.inc"
+MACHINE_EDK2_REQUIRE_fvp-base =3D "edk2-firmware-fvp-base.inc"
=20
 require ${MACHINE_EDK2_REQUIRE}
--=20
2.25.1

