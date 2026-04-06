Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B10F46C50
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:15:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57281.1775488544801017705
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Apr 2026 08:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZyAos7MC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4AD1BA8
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:15:38 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 002003F632
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775488544; bh=coLlifs0JCXTNcrOxS07hfZfZaa/Ce4/G/bnY/0axHk=;
	h=From:To:Subject:Date:From;
	b=ZyAos7MChIP10ur3twppgFXFCPnhimbjaOwf8ZvQ4FVxYIMrvlMLGSQV+KOPIo7ue
	 WIyxDxc91GS0bDnrX/lc+xR5RZF6LcWaZc3U8ProopUIAoYRtVfI7m+knyVf0jLqOj
	 /JulGEyPbLeSXE0M+t8sS8tgBWPsmLAL4P9ck5S8=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp: remove sgi575
Date: Mon,  6 Apr 2026 11:15:42 -0400
Message-ID: <20260406151543.99621-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Apr 2026 15:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7001

sgi575 has been EOLed, and requires keeping around some recipes because
of its removal.  Also, the FVP is x86 only, thus limiting CI.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  9 ---
 ci/fvps.yml                                   |  1 -
 ci/sgi575.yml                                 | 14 ----
 meta-arm-bsp/conf/machine/sgi575.conf         | 65 -------------------
 .../scp-firmware/scp-firmware-sgi575.inc      |  6 --
 .../scp-firmware/scp-firmware_%.bbappend      |  1 -
 .../trusted-firmware-a-sgi575.inc             | 26 --------
 .../trusted-firmware-a_%.bbappend             |  1 -
 .../recipes-bsp/uefi/edk2-firmware-sgi575.inc |  7 --
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  1 -
 .../linux/linux-arm-platforms.inc             |  9 ---
 11 files changed, 140 deletions(-)
 delete mode 100644 ci/sgi575.yml
 delete mode 100644 meta-arm-bsp/conf/machine/sgi575.conf
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sg=
i575.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-sgi575.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.in=
c

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 09a5423f5141..2aff8b9f919a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -344,14 +344,5 @@ selftest:
     - KASFILES=3D./ci/qemuarm64.yml:./ci/selftest.yml:lockfile.yml
     - kas shell --update --force-checkout $KASFILES -c 'oe-selftest --nu=
m-processes 2 --select-tag meta-arm --run-all-tests'
=20
-sgi575:
-  extends: .build
-  parallel:
-    matrix:
-      - TESTING: testimage
-  # FVP binary is x86-only
-  tags:
-    - x86_64
-
 toolchains:
   extends: .build
diff --git a/ci/fvps.yml b/ci/fvps.yml
index 5370402c9f17..39b18d851609 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -40,7 +40,6 @@ target:
   - nativesdk-fvp-rdn2
   # These are x86 only... :(
   - nativesdk-fvp-rdv1
-  - nativesdk-fvp-sgi575
=20
   # IoT FVPs
   - fvp-corstone1000
diff --git a/ci/sgi575.yml b/ci/sgi575.yml
deleted file mode 100644
index d6e33894e890..000000000000
--- a/ci/sgi575.yml
+++ /dev/null
@@ -1,14 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-  includes:
-    - ci/base.yml
-    - ci/fvp.yml
-
-local_conf_header:
-  sshpregen: |
-    # Allow the use of the pregen keys as this is CI so safe
-    COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:sgi575 =3D "sgi575"
-
-machine: sgi575
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
deleted file mode 100644
index 6217ecc22fbb..000000000000
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ /dev/null
@@ -1,65 +0,0 @@
-# Configuration for Arm SGI575 development board
-
-#@TYPE: Machine
-#@NAME: SGI575
-#@DESCRIPTION: Machine configuration for SGI575
-
-require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
-
-EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
-
-# 2.13.0 removes support for sgi575
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
-
-KERNEL_IMAGETYPE ?=3D "Image"
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-SERIAL_CONSOLES =3D "115200;ttyAMA0"
-
-EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
-MACHINE_FEATURES +=3D "efi"
-
-IMAGE_FSTYPES +=3D "cpio.gz wic"
-IMAGE_NAME_SUFFIX =3D ""
-IMAGE_CLASSES +=3D "fvpboot"
-
-WKS_FILE ?=3D "efi-disk.wks.in"
-WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
-
-# testimage config
-TEST_TARGET =3D "OEFVPTarget"
-#TEST_TARGET_IP =3D "127.0.0.1:222"
-TEST_SUITES =3D "fvp_boot"
-
-# FVP Config
-FVP_PROVIDER ?=3D "fvp-sgi575-native"
-FVP_EXE ?=3D "FVP_CSS_SGI-575"
-
-# Virtio-Net configuration
-FVP_CONFIG[board.virtio_net.enabled] ?=3D "1"
-FVP_CONFIG[board.virtio_net.hostbridge.userNetworking] ?=3D "1"
-FVP_CONFIG[board.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
-FVP_CONFIG[board.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
-
-#FVP_CONFIG[cache_state_modelled] ?=3D "0"
-FVP_CONFIG[css.cmn600.mesh_config_file] =3D "SGI-575_cmn600.yml"
-FVP_CONFIG[css.cmn600.force_rnsam_internal] ?=3D "false"
-FVP_CONFIG[css.gic_distributor.ITS-device-bits] ?=3D "20"
-
-FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp-firmware/scp_ramfw.bin@0x0BD8=
0000"
-FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "scp-firmware/mcp_romfw.bin"
-FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp-firmware/scp_romfw.bin"
-FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "trusted-firmware-a/bl1.=
bin"
-FVP_CONFIG[board.flashloader0.fname] ?=3D "trusted-firmware-a/fip.bin"
-
-FVP_CONSOLES[default] =3D "terminal_uart_ap"
-FVP_TERMINALS[css.scp.terminal_uart_aon] ?=3D "SCP Console"
-FVP_TERMINALS[css.mcp.terminal_uart0] ?=3D ""
-FVP_TERMINALS[css.mcp.terminal_uart1] ?=3D ""
-FVP_TERMINALS[css.terminal_uart_ap] ?=3D "Console"
-FVP_TERMINALS[css.terminal_uart1_ap] ?=3D ""
-FVP_TERMINALS[soc.terminal_s0] ?=3D ""
-FVP_TERMINALS[soc.terminal_s1] ?=3D ""
-FVP_TERMINALS[soc.terminal_mcp] ?=3D ""
-FVP_TERMINALS[board.terminal_0] ?=3D ""
-FVP_TERMINALS[board.terminal_1] ?=3D ""
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.in=
c b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
deleted file mode 100644
index 79a41a06f66d..000000000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-# SGI575 specific SCP configurations and build instructions
-
-COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
-SCP_PRODUCT_GROUP =3D "neoverse-rd"
-
-SCP_LOG_LEVEL =3D "INFO"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 011090e72351..d3801e0c9c0a 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -6,6 +6,5 @@ MACHINE_SCP_REQUIRE:juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE:rdn2 =3D "scp-firmware-rdn2.inc"
 MACHINE_SCP_REQUIRE:rdv1 =3D "scp-firmware-rdv1.inc"
 MACHINE_SCP_REQUIRE:rdv2 =3D "scp-firmware-rdv2.inc"
-MACHINE_SCP_REQUIRE:sgi575 =3D "scp-firmware-sgi575.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-sgi575.inc
deleted file mode 100644
index c1f16d5499e8..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-# SGI575 specific TFA support
-
-COMPATIBLE_MACHINE =3D "sgi575"
-TFA_PLATFORM       =3D "sgi575"
-TFA_BUILD_TARGET   =3D "all fip"
-TFA_INSTALL_TARGET =3D "bl1 fip"
-TFA_DEBUG          =3D "1"
-TFA_MBEDTLS        =3D "1"
-TFA_UBOOT          =3D "0"
-TFA_UEFI           =3D "1"
-
-EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
-                     ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
-
-# If GENERATE_COT is set, then tf-a will try to use local poetry install
-# to run the python cot-dt2c command.  Disable the local poetry and use
-# the provided cot-dt2c.
-EXTRA_OEMAKE +=3D "POETRY=3D''"
-DEPENDS +=3D "cot-dt2c-native"
-
-# When compiling tf-a with clang, multiple errors are being seen in the
-# ASM files:
-#   error: instruction requires: fp-armv8
-# Given that this is platform is EOLed, forcing it to use GCC and not
-# reporting upstream
-TOOLCHAIN =3D "gcc"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index 6f7a6e857cfd..ab0f82a35036 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -8,6 +8,5 @@ MACHINE_TFA_REQUIRE:rdn2 =3D "trusted-firmware-a-rdn2.inc=
"
 MACHINE_TFA_REQUIRE:rdv1 =3D "trusted-firmware-a-rdv1.inc"
 MACHINE_TFA_REQUIRE:rdv2 =3D "trusted-firmware-a-rdv2.inc"
 MACHINE_TFA_REQUIRE:sbsa-ref =3D "trusted-firmware-a-sbsa-ref.inc"
-MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
deleted file mode 100644
index e26225f87a07..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-# SGI575 specific EDK2 configurations
-EDK2_BUILD_RELEASE =3D "0"
-EDK2_PLATFORM      =3D "Sgi575"
-EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc"
-EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
-
-COMPATIBLE_MACHINE =3D "sgi575"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 7dd87303c5ec..830d41169f3d 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -8,6 +8,5 @@ MACHINE_EDK2_REQUIRE:rdn2 =3D "edk2-firmware-rdn2.inc"
 MACHINE_EDK2_REQUIRE:rdv1 =3D "edk2-firmware-rdv1.inc"
 MACHINE_EDK2_REQUIRE:rdv2 =3D "edk2-firmware-rdv2.inc"
 MACHINE_EDK2_REQUIRE:sbsa-ref =3D "edk2-firmware-sbsa-ref.inc"
-MACHINE_EDK2_REQUIRE:sgi575 =3D "edk2-firmware-sgi575.inc"
=20
 require ${MACHINE_EDK2_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 2f5653127438..6ee25cd11794 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -135,15 +135,6 @@ KBUILD_DEFCONFIG:rdv2 =3D "defconfig"
 KCONFIG_MODE:rdv2 =3D "--alldefconfig"
 KCONF_BSP_AUDIT_LEVEL:rdv2 =3D "0"
=20
-#
-# SGI575 KMACHINE
-#
-COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
-KBUILD_DEFCONFIG:sgi575 =3D "defconfig"
-KCONFIG_MODE:sgi575 =3D "--alldefconfig"
-# Upstream defconfig often causes warnings but we don't maintain it
-KCONF_BSP_AUDIT_LEVEL:sgi575 =3D "0"
-
 #
 # sbsa-ref KMACHINE
 #
--=20
2.50.1 (Apple Git-155)


