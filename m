Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA031062883
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:12:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19531.1773231166333896481
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A03282247
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:39 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFDDF3F836
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:45 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/qemuarm64: fix edk2 and test it
Date: Wed, 11 Mar 2026 08:12:42 -0400
Message-ID: <20260311121244.72838-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260311121244.72838-1-jon.mason@arm.com>
References: <20260311121244.72838-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6948

edk2 has been broken on qemuarm64 for an unknown amount of time.  Add it
to CI to prevent this from happening (until edk2 works on
qemuarm64-secureboot).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                     | 1 +
 meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f1a4fdc38240..048366bd46a3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -271,6 +271,7 @@ qemuarm64:
   parallel:
     matrix:
       - DISTRO: poky-tiny
+        FIRMWARE: [u-boot, edk2]
         TESTING: testimage
       - VIRT: xen
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_%.bbappend
index b806bf8768e8..063136242bef 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -1,5 +1,5 @@
 COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
-EDK2_PLATFORM:qemuarm64      =3D "ArmVirtQemu-AARCH64"
+EDK2_PLATFORM:qemuarm64      =3D "ArmVirtQemu-AArch64"
 EDK2_PLATFORM_DSC:qemuarm64  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm64      =3D "QEMU_EFI.fd"
 # No need for PXE booting in qemu, disable to reduce unnecessary noise
--=20
2.50.1 (Apple Git-155)


