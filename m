Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52759CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:39:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53140.1697805582708342364
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 05:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 402BE2F4
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:40:23 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.36.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6EE23F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:39:41 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm-bsp/fvp-base: Configure grub as the EFI provider
Date: Fri, 20 Oct 2023 13:38:27 +0100
Message-Id: <20231020123827.346193-4-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020123827.346193-1-Debbie.Martin@arm.com>
References: <20231020123827.346193-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 12:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5157

Configure grub as the EFI provider and remove the U-boot boot
args.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf                   | 8 +++++---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc       | 2 +-
 .../recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg       | 2 --
 meta-arm-bsp/wic/fvp-base.wks                             | 3 ---
 4 files changed, 6 insertions(+), 9 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/boota=
rgs.cfg
 delete mode 100644 meta-arm-bsp/wic/fvp-base.wks

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 940a4330..d202a79f 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -8,9 +8,11 @@ require conf/machine/include/arm/arch-armv8a.inc
=20
 TUNE_FEATURES =3D "aarch64"
=20
+MACHINE_FEATURES =3D "efi"
+
 IMAGE_NAME_SUFFIX =3D ""
 IMAGE_FSTYPES +=3D "wic"
-WKS_FILE ?=3D "fvp-base.wks"
+WKS_FILE ?=3D "efi-disk.wks.in"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
@@ -23,6 +25,8 @@ EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_fvp_defconfig"
=20
+EFI_PROVIDER ?=3D "grub-efi"
+
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
@@ -48,8 +52,6 @@ FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMA=
GE_NAME}.wic"
 FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
 FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
 FVP_CONSOLE ?=3D "terminal_0"
-FVP_DATA ?=3D "cluster0.cpu0=3D${KERNEL_IMAGETYPE}@0x80080000 \
-             cluster0.cpu0=3Dfvp-base-revc.dtb@0x8fc00000"
 FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
 FVP_TERMINALS[bp.terminal_2] ?=3D ""
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index e1fcb1f2..b766181b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -1,6 +1,6 @@
 # FVP base specific U-boot support
=20
-SRC_URI:append =3D " file://bootargs.cfg \
+SRC_URI:append =3D " \
     file://0001-virtio-rng-Workaround-for-FVP-returning-zero-size-bu.pat=
ch \
     file://0002-vexpress64-Set-the-DM_RNG-property.patch \
     file://0003-vexpress64-Select-PSCI-RESET-by-default.patch \
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg=
 b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
deleted file mode 100644
index 2cf42a53..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 root=3D=
/dev/vda1 rw rootwait"
-CONFIG_BOOTCOMMAND=3D"booti $kernel_addr_r - $fdt_addr_r"
diff --git a/meta-arm-bsp/wic/fvp-base.wks b/meta-arm-bsp/wic/fvp-base.wk=
s
deleted file mode 100644
index 8399d042..00000000
--- a/meta-arm-bsp/wic/fvp-base.wks
+++ /dev/null
@@ -1,3 +0,0 @@
-# For fvp-base* machines we just need to populate the rootfs partition
-
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align=
 1024 --extra-space 100
--=20
2.25.1


