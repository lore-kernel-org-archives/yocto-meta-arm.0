Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BC9C43219
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:57:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.93232.1638370655704376787
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69753143B
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14DA73F766
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm/edk2-firmware: set EDK2_ARCH centrally
Date: Wed,  1 Dec 2021 14:57:26 +0000
Message-Id: <20211201145729.4138705-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201145729.4138705-1-ross.burton@arm.com>
References: <20211201145729.4138705-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:57:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2504

There is only a limited number of EDK2 architectures, so we can set
the architecture using overrides in the base recipe instead of every
machine customisation needing to set it explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc | 1 -
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc    | 1 -
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc   | 1 -
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc              | 8 +++++++-
 meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend       | 1 -
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb                | 1 -
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc b/m=
eta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc
index badec193..7069c4d7 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-fvp-base.inc
@@ -2,6 +2,5 @@ EDK2_BUILD_RELEASE =3D "0"
 EDK2_PLATFORM      =3D "ArmVExpress-FVP-AArch64"
 EDK2_PLATFORM_DSC  =3D "Platform/ARM/VExpressPkg/ArmVExpress-FVP-AArch64=
.dsc"
 EDK2_BIN_NAME      =3D "FVP_AARCH64_EFI.fd"
-EDK2_ARCH          =3D "AARCH64"
=20
 COMPATIBLE_MACHINE =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index c8400132..8930c040 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -3,7 +3,6 @@ EDK2_BUILD_RELEASE =3D "0"
 EDK2_PLATFORM      =3D "n1sdp"
 EDK2_PLATFORM_DSC  =3D "Platform/ARM/N1Sdp/N1SdpPlatform.dsc"
 EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
-EDK2_ARCH          =3D "AARCH64"
=20
 COMPATIBLE_MACHINE =3D "n1sdp"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
index 708cd4c4..e26225f8 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
@@ -3,6 +3,5 @@ EDK2_BUILD_RELEASE =3D "0"
 EDK2_PLATFORM      =3D "Sgi575"
 EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc"
 EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
-EDK2_ARCH          =3D "AARCH64"
=20
 COMPATIBLE_MACHINE =3D "sgi575"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index f38ee9ca..264ffa94 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -28,7 +28,13 @@ EDK2_PLATFORM      =3D "unset"
 EDK2_PLATFORM_DSC  =3D "unset"
 EDK2_BIN_NAME      =3D ""
 # build --arch
-EDK2_ARCH          =3D ""
+EDK2_ARCH         ?=3D "unset"
+EDK2_ARCH:arm      =3D "ARM"
+EDK2_ARCH:aarch64  =3D "AARCH64"
+EDK2_ARCH:x86      =3D "IA32"
+EDK2_ARCH:x86-64   =3D "X64"
+EDK2_ARCH:riscv64  =3D "RISCV64"
+
 # Extra arguments passed to build
 EDK2_EXTRA_BUILD   =3D ""
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_%.bbappend
index c0fc2629..93f1f735 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -4,7 +4,6 @@ COMPATIBLE_MACHINE:qemu-generic-arm64 =3D "qemu-generic-a=
rm64"
 DEPENDS:append:qemu-generic-arm64 =3D " virtual/trusted-firmware-a coreu=
tils-native"
=20
 EDK2_BUILD_RELEASE:aarch64:qemuall =3D "1"
-EDK2_ARCH:aarch64:qemuall          =3D "AARCH64"
=20
 EDK2_PLATFORM:qemu-generic-arm64      =3D "SbsaQemu"
 EDK2_PLATFORM_DSC:qemu-generic-arm64  =3D "Platform/Qemu/SbsaQemu/SbsaQe=
mu.dsc"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.0.bb
index 2c269487..c4e07527 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -14,7 +14,6 @@ SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc80=
3"
 SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
=20
 COMPATIBLE_HOST =3D "aarch64.*-linux"
-EDK2_ARCH =3D "AARCH64"
 EDK2_PLATFORM =3D "Shell"
 EDK2_PLATFORM_DSC =3D "ShellPkg/ShellPkg.dsc"
 EDK2_EXTRA_BUILD =3D "--module ShellPkg/Application/sbsa-acs/uefi_app/Sb=
saAvs.inf"
--=20
2.25.1


