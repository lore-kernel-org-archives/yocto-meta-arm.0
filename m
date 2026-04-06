Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121F0F46C51
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:15:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57282.1775488545000838407
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Apr 2026 08:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Duq3NATH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 976772972
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:15:38 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49D043F632
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775488544; bh=KOLCQfovZEQR/GcFvbn5VQVKXzpRpL1g5j0v22ALL6I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Duq3NATH0m2Uc97WU4x5V4sPzENFiDWjIC99BlWKwy1yKPKaQlxN1vbjcg2vqure+
	 ivEzeVlYLoaiALH9CxcZbe8ZWhC9o8T7bSpbDTBHF563Jsx9K8MBDp2Hgo6/y07Thk
	 mfGjNJnIeVM6m/AMcCtoFNP42QQa+ljbIUzJKaAg=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp: remove rdv1
Date: Mon,  6 Apr 2026 11:15:43 -0400
Message-ID: <20260406151543.99621-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260406151543.99621-1-jon.mason@arm.com>
References: <20260406151543.99621-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Apr 2026 15:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7002

rdv1 has been EOLed, and requires keeping around some recipes because
of its removal.  Also, the FVP is x86 only, thus limiting CI.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  9 ---
 ci/fvps.yml                                   |  2 -
 ci/rdv1.yml                                   | 14 ----
 meta-arm-bsp/conf/machine/rdv1.conf           | 67 -------------------
 .../scp-firmware/scp-firmware-rdv1.inc        |  7 --
 .../scp-firmware/scp-firmware_%.bbappend      |  1 -
 .../trusted-firmware-a-rdv1.inc               | 19 ------
 .../trusted-firmware-a_%.bbappend             |  1 -
 .../recipes-bsp/uefi/edk2-firmware-rdv1.inc   |  7 --
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  1 -
 .../linux/linux-arm-platforms.inc             |  8 ---
 11 files changed, 136 deletions(-)
 delete mode 100644 ci/rdv1.yml
 delete mode 100644 meta-arm-bsp/conf/machine/rdv1.conf
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rd=
v1.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-rdv1.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2aff8b9f919a..2950e873df75 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -312,15 +312,6 @@ rdn2:
     matrix:
       - TESTING: testimage
=20
-rdv1:
-  extends: .build
-  parallel:
-    matrix:
-      - TESTING: testimage
-  # FVP binary is x86-only
-  tags:
-    - x86_64
-
 rdv2:
   extends: .build
   parallel:
diff --git a/ci/fvps.yml b/ci/fvps.yml
index 39b18d851609..4859bd0c4638 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -38,8 +38,6 @@ target:
   - nativesdk-fvp-rdv2
   - fvp-rdn2
   - nativesdk-fvp-rdn2
-  # These are x86 only... :(
-  - nativesdk-fvp-rdv1
=20
   # IoT FVPs
   - fvp-corstone1000
diff --git a/ci/rdv1.yml b/ci/rdv1.yml
deleted file mode 100644
index 52cc4b32ad2b..000000000000
--- a/ci/rdv1.yml
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
-    COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:rdv1 =3D "rdv1"
-
-machine: rdv1
diff --git a/meta-arm-bsp/conf/machine/rdv1.conf b/meta-arm-bsp/conf/mach=
ine/rdv1.conf
deleted file mode 100644
index e3b6ce736ece..000000000000
--- a/meta-arm-bsp/conf/machine/rdv1.conf
+++ /dev/null
@@ -1,67 +0,0 @@
-# Configuration for Arm Neoverse v1 Reference Design development board
-
-#@TYPE: Machine
-#@NAME: RD V1
-#@DESCRIPTION: Machine configuration for RD V1
-
-require conf/machine/include/arm/arch-armv8-4a.inc
-
-EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
-
-# 2.13.0 removes support for rdv1
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
-
-KERNEL_IMAGETYPE ?=3D "Image"
-PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-SERIAL_CONSOLES =3D "115200;ttyAMA0 115200;ttyAMA1"
-
-EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
-MACHINE_FEATURES +=3D "efi"
-
-IMAGE_FSTYPES:forcevariable =3D "cpio.gz wic"
-IMAGE_NAME_SUFFIX =3D ""
-IMAGE_CLASSES +=3D "fvpboot"
-
-WKS_FILE ?=3D "efi-disk.wks.in"
-WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
-
-# testimage config
-TEST_TARGET =3D "OEFVPTarget"
-TEST_TARGET_IP =3D "127.0.0.1:2222"
-DEFAULT_TEST_SUITES:append =3D " fvp_boot fvp_devices"
-TEST_FVP_DEVICES ?=3D "watchdog networking"
-
-# FVP Config
-FVP_PROVIDER ?=3D "fvp-rdv1-native"
-FVP_EXE ?=3D "FVP_RD_V1"
-
-FVP_CONFIG[css.cmn_650.force_rnsam_internal] ?=3D "true"
-FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp-firmware/scp_ramfw.bin@0x0BD8=
0000 \
-             css.mcp.armcortexm7ct=3Dscp-firmware/mcp_ramfw.bin@0x0BF800=
00"
-
-FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "scp-firmware/mcp_romfw.bin"
-FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp-firmware/scp_romfw.bin"
-
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
-
-FVP_CONFIG[css.gic_distributor.ITS-device-bits] ?=3D "20"
-
-# Virtio configuration
-FVP_CONFIG[board.virtio_net.enabled] ?=3D "1"
-FVP_CONFIG[board.virtio_net.hostbridge.userNetworking] ?=3D "1"
-FVP_CONFIG[board.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
-FVP_CONFIG[board.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv1.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv1.inc
deleted file mode 100644
index ccd77f6bff2a..000000000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv1.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-# RD V1 specific SCP configurations and build instructions
-
-COMPATIBLE_MACHINE:rdv1 =3D "rdv1"
-SCP_PRODUCT_GROUP =3D "neoverse-rd"
-SCP_PLATFORM =3D "rdv1"
-
-SCP_LOG_LEVEL =3D "INFO"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index d3801e0c9c0a..e6849857b26e 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -4,7 +4,6 @@ MACHINE_SCP_REQUIRE ?=3D ""
=20
 MACHINE_SCP_REQUIRE:juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE:rdn2 =3D "scp-firmware-rdn2.inc"
-MACHINE_SCP_REQUIRE:rdv1 =3D "scp-firmware-rdv1.inc"
 MACHINE_SCP_REQUIRE:rdv2 =3D "scp-firmware-rdv2.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-rdv1.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-rdv1.inc
deleted file mode 100644
index ccd4362d7751..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv1=
.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-# RD V1 specific TFA support
-
-COMPATIBLE_MACHINE =3D "rdv1"
-TFA_PLATFORM       =3D "rdv1"
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
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index ab0f82a35036..6683688244b7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -5,7 +5,6 @@ MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-=
corstone1000.inc"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp-base.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE:rdn2 =3D "trusted-firmware-a-rdn2.inc"
-MACHINE_TFA_REQUIRE:rdv1 =3D "trusted-firmware-a-rdv1.inc"
 MACHINE_TFA_REQUIRE:rdv2 =3D "trusted-firmware-a-rdv2.inc"
 MACHINE_TFA_REQUIRE:sbsa-ref =3D "trusted-firmware-a-sbsa-ref.inc"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc
deleted file mode 100644
index 7301a101975a..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-# RD V1 specific EDK2 configurations
-EDK2_BUILD_RELEASE =3D "0"
-EDK2_PLATFORM      =3D "RdV1"
-EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/RdV1/RdV1.dsc"
-EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
-
-COMPATIBLE_MACHINE =3D "rdv1"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 830d41169f3d..75beda263a81 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -5,7 +5,6 @@ MACHINE_EDK2_REQUIRE ?=3D ""
 MACHINE_EDK2_REQUIRE:fvp-base =3D "edk2-firmware-fvp-base.inc"
 MACHINE_EDK2_REQUIRE:juno =3D "edk2-firmware-juno.inc"
 MACHINE_EDK2_REQUIRE:rdn2 =3D "edk2-firmware-rdn2.inc"
-MACHINE_EDK2_REQUIRE:rdv1 =3D "edk2-firmware-rdv1.inc"
 MACHINE_EDK2_REQUIRE:rdv2 =3D "edk2-firmware-rdv2.inc"
 MACHINE_EDK2_REQUIRE:sbsa-ref =3D "edk2-firmware-sbsa-ref.inc"
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 6ee25cd11794..537259589688 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -119,14 +119,6 @@ KBUILD_DEFCONFIG:rdn2 =3D "defconfig"
 KCONFIG_MODE:rdn2 =3D "--alldefconfig"
 KCONF_BSP_AUDIT_LEVEL:rdn2 =3D "0"
=20
-#
-# RDV1 KMACHINE
-#
-COMPATIBLE_MACHINE:rdv1 =3D "rdv1"
-KBUILD_DEFCONFIG:rdv1 =3D "defconfig"
-KCONFIG_MODE:rdv1 =3D "--alldefconfig"
-KCONF_BSP_AUDIT_LEVEL:rdv1 =3D "0"
-
 #
 # RDV2 KMACHINE
 #
--=20
2.50.1 (Apple Git-155)


