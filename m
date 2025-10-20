Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB35CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 15:09:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21445.1760972967403815086
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F3B416A3
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1D4B3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:26 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm/trusted-firmware-a: remove forcing of gcc for qemuarm-secureboot
Date: Mon, 20 Oct 2025 16:09:21 +0100
Message-ID: <20251020150924.84223-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020150924.84223-1-jon.mason@arm.com>
References: <20251020150924.84223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 15:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6740

clang is now working for qemuarm-secureboot.  Remove the forcing of gcc
and clean-up a white space issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend        | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index d996d83beb1f..e80279d63bae 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -1,10 +1,6 @@
 COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64-secureboot"
 COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm-secureboot"
=20
-#FIXME - clang fails to build tfa for qemuarm-secureboot, and possibly o=
ther
-# arm/aarch32.  This is a known testing hole in TF-A.
-TOOLCHAIN:qemuarm-secureboot =3D "gcc"
-
 # Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot :=3D "${THISDIR}/files:"
 SRC_URI:append:qemuarm64-secureboot =3D " \
@@ -53,7 +49,7 @@ EXTRA_OEMAKE:append:arm:qemuall =3D " \
 # When using OP-TEE SPMC specify the SPMC manifest file.
 EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@bb.utils.contains('MACH=
INE_FEATURES', 'arm-ffa', \
     'QEMU_TOS_FW_CONFIG_DTS=3D${S}/plat/qemu/fdts/optee_spmc_manifest.dt=
s', '', d)}"
-    =20
+
 do_compile:append:qemuarm64-secureboot() {
     # Create a secure flash image for booting AArch64 Qemu. See:
     # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/d=
ocs/plat/qemu.rst
--=20
2.50.1 (Apple Git-155)


