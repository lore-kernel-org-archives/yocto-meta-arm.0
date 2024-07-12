Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55CEC3DA4D
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:55:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9827.1720796095574258173
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 07:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD6F1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:55:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C87903F762
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:54:54 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/fvp-base: add edk2 testimage support
Date: Fri, 12 Jul 2024 10:54:53 -0400
Message-Id: <20240712145453.13569-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240712145453.13569-1-jon.mason@arm.com>
References: <20240712145453.13569-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 14:55:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5887

Add the changes necessary to get edk2 booting and testimage passing on
fvp-base.  All that is really necessary is adding the dtb to the too
partition.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                          | 3 ++-
 meta-arm-bsp/conf/machine/fvp-base.conf | 3 ++-
 meta-arm/wic/efi-disk.wks.in            | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5eaf455ed930..7354bf35049c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -190,7 +190,8 @@ fvp-base:
     matrix:
       - TS: [none, fvp-base-ts]
         TESTING: testimage
-      - FIRMWARE: edk2
+      - FIRMWARE: [u-boot, edk2]
+        TESTING: testimage
       - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
 arm-systemready-ir-acs:
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 24d03e7124af..353024e26b72 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -20,7 +20,8 @@ WKS_FILE ?=3D "efi-disk.wks.in"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
+KERNEL_DTB_NAME =3D "fvp-base-revc.dtb"
+KERNEL_DEVICETREE =3D "arm/${KERNEL_DTB_NAME}"
 KERNEL_IMAGETYPE =3D "Image"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
diff --git a/meta-arm/wic/efi-disk.wks.in b/meta-arm/wic/efi-disk.wks.in
index 1f06830a5fcd..198ae2a6d0b8 100644
--- a/meta-arm/wic/efi-disk.wks.in
+++ b/meta-arm/wic/efi-disk.wks.in
@@ -2,7 +2,7 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media.
=20
-part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R},dtb=3D${KERNEL_DTB_NAME}" --label boot --active --align 1024 --use-uui=
d
=20
 part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
=20
--=20
2.39.3 (Apple Git-146)


