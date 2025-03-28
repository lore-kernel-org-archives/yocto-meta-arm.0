Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19F0C36014
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:29:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11149.1743168544801260022
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58429169E
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 06:29:09 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 697223F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 06:29:04 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/sgi575: add FVP support
Date: Fri, 28 Mar 2025 09:29:03 -0400
Message-Id: <20250328132903.66472-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250328132903.66472-1-jon.mason@arm.com>
References: <20250328132903.66472-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:29:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6423

Add FVP support to sgi575 and run a boot test as part of CI.  Networking
is not currently working and seems to require an older version of edk2
to boot the kernel.  Also, the unique files for grub and wks do not seem
to be necessary.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                        |  6 ++++
 ci/sgi575.yml                         |  6 ++++
 meta-arm-bsp/conf/machine/sgi575.conf | 49 ++++++++++++++++++++++++---
 meta-arm-bsp/wic/sgi575-efidisk.wks   | 11 ------
 meta-arm-bsp/wic/sgi575-grub.cfg      |  9 -----
 5 files changed, 57 insertions(+), 24 deletions(-)
 delete mode 100644 meta-arm-bsp/wic/sgi575-efidisk.wks
 delete mode 100644 meta-arm-bsp/wic/sgi575-grub.cfg

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f4b3262ca437..e655d1e62189 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -339,6 +339,12 @@ selftest:
=20
 sgi575:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
+  # FVP binary is x86-only
+  tags:
+    - x86_64
=20
 toolchains:
   extends: .build
diff --git a/ci/sgi575.yml b/ci/sgi575.yml
index e43138207166..d6e33894e890 100644
--- a/ci/sgi575.yml
+++ b/ci/sgi575.yml
@@ -4,5 +4,11 @@ header:
   version: 14
   includes:
     - ci/base.yml
+    - ci/fvp.yml
+
+local_conf_header:
+  sshpregen: |
+    # Allow the use of the pregen keys as this is CI so safe
+    COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:sgi575 =3D "sgi575"
=20
 machine: sgi575
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 3c2c94b6dcbf..dea764e8cdb6 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -7,18 +7,59 @@
 require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
-
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
-#grub-efi
-EFI_PROVIDER ?=3D "grub-efi"
+#FIXME - for some reason newer EDK2 refuses to boot the kernel
+PREFERRED_VERSION_edk2-firmware ?=3D "202408%"
+
+EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
 MACHINE_FEATURES +=3D "efi"
=20
 IMAGE_FSTYPES +=3D "cpio.gz wic"
+IMAGE_NAME_SUFFIX =3D ""
+IMAGE_CLASSES +=3D "fvpboot"
=20
-WKS_FILE ?=3D "sgi575-efidisk.wks"
+WKS_FILE ?=3D "efi-disk.wks.in"
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
+
+# testimage config
+TEST_TARGET =3D "OEFVPTarget"
+#TEST_TARGET_IP =3D "127.0.0.1:222"
+TEST_SUITES =3D "fvp_boot"
+
+# FVP Config
+FVP_PROVIDER ?=3D "fvp-sgi575-native"
+FVP_EXE ?=3D "FVP_CSS_SGI-575"
+
+# Virtio-Net configuration
+FVP_CONFIG[board.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[board.virtio_net.hostbridge.userNetworking] ?=3D "1"
+FVP_CONFIG[board.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
+FVP_CONFIG[board.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
+
+#FVP_CONFIG[cache_state_modelled] ?=3D "0"
+FVP_CONFIG[css.cmn600.mesh_config_file] =3D "SGI-575_cmn600.yml"
+FVP_CONFIG[css.cmn600.force_rnsam_internal] ?=3D "false"
+FVP_CONFIG[css.gic_distributor.ITS-device-bits] ?=3D "20"
+
+FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp_ramfw.bin@0x0BD80000"
+FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "mcp_romfw.bin"
+FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp_romfw.bin"
+FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "bl1-sgi575.bin"
+FVP_CONFIG[board.flashloader0.fname] ?=3D "fip-sgi575.bin"
+
+FVP_CONSOLES[default] =3D "terminal_uart_ap"
+FVP_TERMINALS[css.scp.terminal_uart_aon] ?=3D "SCP Console"
+FVP_TERMINALS[css.mcp.terminal_uart0] ?=3D ""
+FVP_TERMINALS[css.mcp.terminal_uart1] ?=3D ""
+FVP_TERMINALS[css.terminal_uart_ap] ?=3D "Console"
+FVP_TERMINALS[css.terminal_uart1_ap] ?=3D ""
+FVP_TERMINALS[soc.terminal_s0] ?=3D ""
+FVP_TERMINALS[soc.terminal_s1] ?=3D ""
+FVP_TERMINALS[soc.terminal_mcp] ?=3D ""
+FVP_TERMINALS[board.terminal_0] ?=3D ""
+FVP_TERMINALS[board.terminal_1] ?=3D ""
diff --git a/meta-arm-bsp/wic/sgi575-efidisk.wks b/meta-arm-bsp/wic/sgi57=
5-efidisk.wks
deleted file mode 100644
index d4c79d337bcb..000000000000
--- a/meta-arm-bsp/wic/sgi575-efidisk.wks
+++ /dev/null
@@ -1,11 +0,0 @@
-# short-description: Create an EFI disk image
-# long-description: Creates a partitioned EFI disk image that the user
-# can directly dd to boot media. Uses a custom grub.cfg file to configur=
e the boot.
-
-part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --o=
ndisk sda --label msdos --active --align 1024
-
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align=
 1024 --uuid=3D9c53a91b-e182-4ff1-aeac-6ee2c432ae94
-
-part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
-
-bootloader --ptable gpt --configfile=3D"sgi575-grub.cfg" --timeout=3D5
diff --git a/meta-arm-bsp/wic/sgi575-grub.cfg b/meta-arm-bsp/wic/sgi575-g=
rub.cfg
deleted file mode 100644
index a176389746c1..000000000000
--- a/meta-arm-bsp/wic/sgi575-grub.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-set debug=3D"loader,mm"
-set term=3D"vt100"
-set default=3D"0"
-set timeout=3D"1"
-
-menuentry 'Arm reference image boot on sgi575' {
-        linux /Image acpi=3Dforce console=3DttyAMA0,115200 ip=3Ddhcp roo=
t=3DPARTUUID=3D9c53a91b-e182-4ff1-aeac-6ee2c432ae94 rootwait verbose debu=
g
-}
-
--=20
2.39.5 (Apple Git-154)


