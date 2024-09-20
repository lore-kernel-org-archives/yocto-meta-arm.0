Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CA4C78838
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 12:57:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17582.1726837038698958698
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 05:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E70E1007
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 05:57:47 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F285E3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 05:57:17 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/fvp-base: support poky-altcfg
Date: Fri, 20 Sep 2024 08:57:14 -0400
Message-Id: <20240920125716.13293-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 12:57:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6092

Add the bits to enable poky-altcfg to boot to prompt on fvp-base.
Unfortunately, ssh takes a very long time to come up, which causes the
ssh test to timeout.  So, don't enable this by default in CI.
Also, switch to building full-cmdline instead of sato, since we're never
actually testing the graphics on this platform.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvp-base.yml                         | 2 +-
 meta-arm-bsp/conf/machine/fvp-base.conf | 6 ++++--
 meta-arm/wic/efi-disk.wks.in            | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index bbc6c44db3be..5719ea8066aa 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -9,5 +9,5 @@ header:
 machine: fvp-base
=20
 target:
-  - core-image-sato
+  - core-image-full-cmdline
   - boot-wrapper-aarch64
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 353024e26b72..cbfd79d25828 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -11,13 +11,15 @@ ARM_SYSTEMREADY_ACS_CONSOLE =3D "default"
 EXTRA_IMAGEDEPENDS =3D "${ARM_SYSTEMREADY_FIRMWARE}"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
=20
-MACHINE_FEATURES =3D "efi"
+MACHINE_FEATURES =3D "efi vfat"
=20
 IMAGE_NAME_SUFFIX =3D ""
 IMAGE_FSTYPES +=3D "wic"
 WKS_FILE ?=3D "efi-disk.wks.in"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
+# FIXME -  This is being upstreamed.  Remove once that has occurred.
+KERNEL_CONSOLE ?=3D "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[=
0].split(';')[::-1]) or 'ttyS0'}"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 KERNEL_DTB_NAME =3D "fvp-base-revc.dtb"
@@ -29,7 +31,7 @@ EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_fvp_defconfig"
=20
-EFI_PROVIDER ?=3D "grub-efi"
+EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.
diff --git a/meta-arm/wic/efi-disk.wks.in b/meta-arm/wic/efi-disk.wks.in
index 198ae2a6d0b8..e1120da056cd 100644
--- a/meta-arm/wic/efi-disk.wks.in
+++ b/meta-arm/wic/efi-disk.wks.in
@@ -8,4 +8,4 @@ part / --source rootfs --fstype=3Dext4 --label root --ali=
gn 1024 --use-uuid
=20
 part swap --size 44 --label swap --fstype=3Dswap --use-uuid
=20
-bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4"
+bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4 console=3D${KERNEL_CONSOLE}"
--=20
2.39.3 (Apple Git-146)


