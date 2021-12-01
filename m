Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3781AC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:57:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.92717.1638370655288715413
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1355147A
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C64A3F766
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] arm/edk2-firmware: organise bbappend
Date: Wed,  1 Dec 2021 14:57:27 +0000
Message-Id: <20211201145729.4138705-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201145729.4138705-1-ross.burton@arm.com>
References: <20211201145729.4138705-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:57:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2505

Group the qemuarm64-secureboot and qemu-generic-arm64 overrides so that
they are easier to read.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 93f1f735..17f3662b 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -1,18 +1,17 @@
-COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64"
-COMPATIBLE_MACHINE:qemu-generic-arm64 =3D "qemu-generic-arm64"
-
-DEPENDS:append:qemu-generic-arm64 =3D " virtual/trusted-firmware-a coreu=
tils-native"
-
-EDK2_BUILD_RELEASE:aarch64:qemuall =3D "1"
-
-EDK2_PLATFORM:qemu-generic-arm64      =3D "SbsaQemu"
-EDK2_PLATFORM_DSC:qemu-generic-arm64  =3D "Platform/Qemu/SbsaQemu/SbsaQe=
mu.dsc"
-EDK2_BIN_NAME:qemu-generic-arm64      =3D "SBSA_FLASH0.fd"
-
+COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64-secureboot"
+EDK2_BUILD_RELEASE:qemuarm64-secureboot =3D "1"
 EDK2_PLATFORM:qemuarm64-secureboot      =3D "ArmVirtQemu-AARCH64"
 EDK2_PLATFORM_DSC:qemuarm64-secureboot  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm64-secureboot      =3D "QEMU_EFI.fd"
=20
+
+COMPATIBLE_MACHINE:qemu-generic-arm64   =3D "qemu-generic-arm64"
+DEPENDS:append:qemu-generic-arm64       =3D " virtual/trusted-firmware-a=
 coreutils-native"
+EDK2_BUILD_RELEASE:qemu-generic-arm64 =3D "1"
+EDK2_PLATFORM:qemu-generic-arm64        =3D "SbsaQemu"
+EDK2_PLATFORM_DSC:qemu-generic-arm64    =3D "Platform/Qemu/SbsaQemu/Sbsa=
Qemu.dsc"
+EDK2_BIN_NAME:qemu-generic-arm64        =3D "SBSA_FLASH0.fd"
+
 do_compile:prepend:qemu-generic-arm64() {
     mkdir -p ${B}/Platform/Qemu/Sbsa/
     cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
--=20
2.25.1


