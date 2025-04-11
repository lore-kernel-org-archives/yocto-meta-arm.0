Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFAFC3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 03:25:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16861.1744341937872008902
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Apr 2025 20:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D454106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Apr 2025 20:25:37 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEC323F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Apr 2025 20:25:36 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/edk2-firmware: remove qemuarm64-secureboot
Date: Thu, 10 Apr 2025 23:25:32 -0400
Message-Id: <20250411032532.10270-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250411032532.10270-1-jon.mason@arm.com>
References: <20250411032532.10270-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 03:25:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6458

edk2 isn't booting on qemuarm64-secureboot, and hasn't for some time.
Also, it's not being tested as part of CI.  Remove until it is working
again.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 25b52511e4a0..56e785aeb13d 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -1,8 +1,3 @@
-COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64-secureboot"
-EDK2_PLATFORM:qemuarm64-secureboot      =3D "ArmVirtQemu-AARCH64"
-EDK2_PLATFORM_DSC:qemuarm64-secureboot  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
-EDK2_BIN_NAME:qemuarm64-secureboot      =3D "QEMU_EFI.fd"
-
 COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
 EDK2_PLATFORM:qemuarm64      =3D "ArmVirtQemu-AARCH64"
 EDK2_PLATFORM_DSC:qemuarm64  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
--=20
2.39.5 (Apple Git-154)


