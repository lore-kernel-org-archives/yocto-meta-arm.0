Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57628.1795451706940654104
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 08:35:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=j7aizMny;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9C9143D
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:35:03 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 269F13F632
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795451706; bh=e3dHCGxmp/HSF7K6g8QcRfbmb52rBIKgWCxdWq5Lpls=;
	h=From:To:Subject:Date:From;
	b=j7aizMnyaf2KzXFKdniltqLM1d3EkRrFIwO4pi544mGOaHUPAcQhgXrWbHwR6pB2A
	 exwOS5gbyGUEmO/dgzq8LPTg7yrQADBm+uNyY3uoerPAJ1WP3BwXQH+uF6P3eftP6g
	 IYEtEuh0g7Z3EeCHfjj6WvW9TgMWoWUvwxVMkdfI=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/wic: consolidate EFI disk WKS files
Date: Mon, 23 Nov 2026 10:35:04 -0600
Message-ID: <20261123163505.14583-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 16:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7222
Content-Type: text/plain; charset="utf-8"

Remove the duplicate QEMU EFI disk template and use
efi-disk.wks.in for SBSA. Include a DTB only when
KERNEL_DTB_NAME is set, so the template works with and
without a device tree.

Keep the kernel console in the boot arguments. Add
EFI_DISK_BOOT_ARGS so sbsa-ref can pass ip=3Ddhcp for testimage.
Set that argument in its CI configuration; future users of
this WKS file can add other kernel parameters the same way.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/sbsa-ref.yml                         |  6 ++++++
 meta-arm-bsp/conf/machine/sbsa-ref.conf |  8 +-------
 meta-arm/files/wic/efi-disk.wks.in      |  4 ++--
 meta-arm/files/wic/qemu-efi-disk.wks.in | 11 -----------
 4 files changed, 9 insertions(+), 20 deletions(-)
 delete mode 100644 meta-arm/files/wic/qemu-efi-disk.wks.in

diff --git a/ci/sbsa-ref.yml b/ci/sbsa-ref.yml
index 99e4ed716d01..704a53c6088e 100644
--- a/ci/sbsa-ref.yml
+++ b/ci/sbsa-ref.yml
@@ -10,3 +10,9 @@ machine: sbsa-ref
 target:
   - core-image-sato
   - sbsa-acs
+
+local_conf_header:
+  testimage_network: |
+    # QEMU boots firmware instead of a kernel, so put the network argume=
nt
+    # in the EFI disk for testimage.
+    EFI_DISK_BOOT_ARGS:append =3D " ip=3Ddhcp"
diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/=
machine/sbsa-ref.conf
index 82d55c9b3d7a..96341f435b7b 100644
--- a/meta-arm-bsp/conf/machine/sbsa-ref.conf
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -13,13 +13,7 @@ MACHINE_FEATURES =3D " alsa bluetooth efi qemu-usermod=
e rtc screen usbhost vfat wi
=20
 IMAGE_FSTYPES +=3D "wic.qcow2"
=20
-# This unique WIC file is necessary because kernel boot args cannot be p=
assed
-# because there is no default kernel (see below).  There is no default k=
ernel
-# because QEMU will only allow firmware or kernel to be passed in as a
-# parameter, and we need the firmware.  So, to allow for "ip=3Ddhcp" as =
a kernel
-# boot arg (which we need for testimage), we have to have a WIC file uni=
que to
-# this platform.
-WKS_FILE =3D "qemu-efi-disk.wks.in"
+WKS_FILE =3D "efi-disk.wks.in"
=20
 EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
=20
diff --git a/meta-arm/files/wic/efi-disk.wks.in b/meta-arm/files/wic/efi-=
disk.wks.in
index e1120da056cd..a21e5b7fa433 100644
--- a/meta-arm/files/wic/efi-disk.wks.in
+++ b/meta-arm/files/wic/efi-disk.wks.in
@@ -2,10 +2,10 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media.
=20
-part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R},dtb=3D${KERNEL_DTB_NAME}" --label boot --active --align 1024 --use-uui=
d
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}${@',dtb=3D' + d.getVar('KERNEL_DTB_NAME') if d.getVar('KERNEL_DTB_NAME=
') else ''}" --label boot --active --align 1024 --use-uuid
=20
 part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
=20
 part swap --size 44 --label swap --fstype=3Dswap --use-uuid
=20
-bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4 console=3D${KERNEL_CONSOLE}"
+bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4 console=3D${KERNEL_CONSOLE} ${@d.getVar('EFI_DISK_BOOT_ARGS') or ''}=
"
diff --git a/meta-arm/files/wic/qemu-efi-disk.wks.in b/meta-arm/files/wic=
/qemu-efi-disk.wks.in
deleted file mode 100644
index 100d0edbd6a4..000000000000
--- a/meta-arm/files/wic/qemu-efi-disk.wks.in
+++ /dev/null
@@ -1,11 +0,0 @@
-# short-description: Create an EFI disk image
-# long-description: Creates a partitioned EFI disk image that the user
-# can directly dd to boot media.
-
-part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid
-
-part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
-
-part swap --size 44 --label swap --fstype=3Dswap --use-uuid
-
-bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4 ip=3Ddhcp"
--=20
2.54.0 (Apple Git-157)

