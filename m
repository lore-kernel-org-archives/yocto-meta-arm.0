Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55E8109B46E
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:07:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19560.1774962424604834450
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 06:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=HKlekYvH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BB813603
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:06:58 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2507B3F7D8
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774962424; bh=bDAfL72iw66KubYkkXWSN8Pyy0vL9CVjpZ1k+ui7fME=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HKlekYvHjt2kyDOFuCutdiX+RIRuGgV2x/u3DNa4dsQFSM9TKgBwi5jOxIYmBFuaN
	 3GRWCQSOBfKtdcJCnjo90mxVAr5Xy1GUUKBaGFkmpg6plQL5fu8P2sjWbHmYD4qEMQ
	 4kXmUxooND7PfrrhLfxTVWsFta+rLm3r4QFKo+gs=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm-bsp/rdv1: add support
Date: Tue, 31 Mar 2026 09:07:00 -0400
Message-ID: <20260331130702.56223-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331130702.56223-1-jon.mason@arm.com>
References: <20260331130702.56223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 13:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6992

Add support for Neoverse Reference Design version 1

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  9 +++
 ci/fvps.yml                                   |  1 +
 ci/rdv1.yml                                   | 14 ++++
 meta-arm-bsp/conf/machine/rdv1.conf           | 67 +++++++++++++++++++
 .../runtime/cases/parselogs-ignores-rdv1.txt  |  3 +
 .../scp-firmware/scp-firmware-rdv1.inc        |  7 ++
 .../scp-firmware/scp-firmware_%.bbappend      |  1 +
 .../trusted-firmware-a-rdv1.inc               | 19 ++++++
 .../trusted-firmware-a_%.bbappend             |  1 +
 .../recipes-bsp/uefi/edk2-firmware-rdv1.inc   |  7 ++
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  1 +
 .../linux/linux-arm-platforms.inc             |  8 +++
 meta-arm/recipes-devtools/fvp/fvp-rdv1.bb     | 14 ++++
 13 files changed, 152 insertions(+)
 create mode 100644 ci/rdv1.yml
 create mode 100644 meta-arm-bsp/conf/machine/rdv1.conf
 create mode 100644 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores=
-rdv1.txt
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rd=
v1.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-rdv1.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-rdv1.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a1e40e365d7c..20b3998e787b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -306,6 +306,15 @@ qemuarmv5:
       - DISTRO: poky-tiny
         TESTING: testimage
=20
+rdv1:
+  extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
+  # FVP binary is x86-only
+  tags:
+    - x86_64
+
 sbsa-ref:
   extends: .build
   parallel:
diff --git a/ci/fvps.yml b/ci/fvps.yml
index 8ec22a30f6af..db49b3e979a9 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -35,6 +35,7 @@ target:
   - fvp-rdv3-r1
   - nativesdk-fvp-rdv3-r1
   # These are x86 only... :(
+  - nativesdk-fvp-rdv1
   - nativesdk-fvp-sgi575
=20
   # IoT FVPs
diff --git a/ci/rdv1.yml b/ci/rdv1.yml
new file mode 100644
index 000000000000..52cc4b32ad2b
--- /dev/null
+++ b/ci/rdv1.yml
@@ -0,0 +1,14 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+  includes:
+    - ci/base.yml
+    - ci/fvp.yml
+
+local_conf_header:
+  sshpregen: |
+    # Allow the use of the pregen keys as this is CI so safe
+    COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:rdv1 =3D "rdv1"
+
+machine: rdv1
diff --git a/meta-arm-bsp/conf/machine/rdv1.conf b/meta-arm-bsp/conf/mach=
ine/rdv1.conf
new file mode 100644
index 000000000000..e3b6ce736ece
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/rdv1.conf
@@ -0,0 +1,67 @@
+# Configuration for Arm Neoverse v1 Reference Design development board
+
+#@TYPE: Machine
+#@NAME: RD V1
+#@DESCRIPTION: Machine configuration for RD V1
+
+require conf/machine/include/arm/arch-armv8-4a.inc
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
+
+# 2.13.0 removes support for rdv1
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
+
+KERNEL_IMAGETYPE ?=3D "Image"
+PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
+SERIAL_CONSOLES =3D "115200;ttyAMA0 115200;ttyAMA1"
+
+EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
+MACHINE_FEATURES +=3D "efi"
+
+IMAGE_FSTYPES:forcevariable =3D "cpio.gz wic"
+IMAGE_NAME_SUFFIX =3D ""
+IMAGE_CLASSES +=3D "fvpboot"
+
+WKS_FILE ?=3D "efi-disk.wks.in"
+WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
+
+# testimage config
+TEST_TARGET =3D "OEFVPTarget"
+TEST_TARGET_IP =3D "127.0.0.1:2222"
+DEFAULT_TEST_SUITES:append =3D " fvp_boot fvp_devices"
+TEST_FVP_DEVICES ?=3D "watchdog networking"
+
+# FVP Config
+FVP_PROVIDER ?=3D "fvp-rdv1-native"
+FVP_EXE ?=3D "FVP_RD_V1"
+
+FVP_CONFIG[css.cmn_650.force_rnsam_internal] ?=3D "true"
+FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp-firmware/scp_ramfw.bin@0x0BD8=
0000 \
+             css.mcp.armcortexm7ct=3Dscp-firmware/mcp_ramfw.bin@0x0BF800=
00"
+
+FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "scp-firmware/mcp_romfw.bin"
+FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp-firmware/scp_romfw.bin"
+
+FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "trusted-firmware-a/bl1.=
bin"
+FVP_CONFIG[board.flashloader0.fname] ?=3D "trusted-firmware-a/fip.bin"
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
+
+FVP_CONFIG[css.gic_distributor.ITS-device-bits] ?=3D "20"
+
+# Virtio configuration
+FVP_CONFIG[board.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[board.virtio_net.hostbridge.userNetworking] ?=3D "1"
+FVP_CONFIG[board.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
+FVP_CONFIG[board.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv1.t=
xt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv1.txt
new file mode 100644
index 000000000000..ff8db8d52e7c
--- /dev/null
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv1.txt
@@ -0,0 +1,3 @@
+can't derive routing for PCI INT A
+jitterentropy: Initialization failed with host not compliant with requir=
ements: 2
+PCI: OF: of_root node is NULL, cannot create PCI host bridge node
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv1.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv1.inc
new file mode 100644
index 000000000000..ccd77f6bff2a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv1.inc
@@ -0,0 +1,7 @@
+# RD V1 specific SCP configurations and build instructions
+
+COMPATIBLE_MACHINE:rdv1 =3D "rdv1"
+SCP_PRODUCT_GROUP =3D "neoverse-rd"
+SCP_PLATFORM =3D "rdv1"
+
+SCP_LOG_LEVEL =3D "INFO"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index bf0af54a671b..4b1bd09e0417 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -3,6 +3,7 @@
 MACHINE_SCP_REQUIRE ?=3D ""
=20
 MACHINE_SCP_REQUIRE:juno =3D "scp-firmware-juno.inc"
+MACHINE_SCP_REQUIRE:rdv1 =3D "scp-firmware-rdv1.inc"
 MACHINE_SCP_REQUIRE:sgi575 =3D "scp-firmware-sgi575.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-rdv1.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-rdv1.inc
new file mode 100644
index 000000000000..ccd4362d7751
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv1=
.inc
@@ -0,0 +1,19 @@
+# RD V1 specific TFA support
+
+COMPATIBLE_MACHINE =3D "rdv1"
+TFA_PLATFORM       =3D "rdv1"
+TFA_BUILD_TARGET   =3D "all fip"
+TFA_INSTALL_TARGET =3D "bl1 fip"
+TFA_DEBUG          =3D "1"
+TFA_MBEDTLS        =3D "1"
+TFA_UBOOT          =3D "0"
+TFA_UEFI           =3D "1"
+
+EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
+                     ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
+
+# If GENERATE_COT is set, then tf-a will try to use local poetry install
+# to run the python cot-dt2c command.  Disable the local poetry and use
+# the provided cot-dt2c.
+EXTRA_OEMAKE +=3D "POETRY=3D''"
+DEPENDS +=3D "cot-dt2c-native"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index 5b4043e87bea..7e39487c49cf 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -4,6 +4,7 @@ MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.in=
c"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp-base.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
+MACHINE_TFA_REQUIRE:rdv1 =3D "trusted-firmware-a-rdv1.inc"
 MACHINE_TFA_REQUIRE:sbsa-ref =3D "trusted-firmware-a-sbsa-ref.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc
new file mode 100644
index 000000000000..7301a101975a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv1.inc
@@ -0,0 +1,7 @@
+# RD V1 specific EDK2 configurations
+EDK2_BUILD_RELEASE =3D "0"
+EDK2_PLATFORM      =3D "RdV1"
+EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/RdV1/RdV1.dsc"
+EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
+
+COMPATIBLE_MACHINE =3D "rdv1"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 76ffa55521b3..17a2d23c9cda 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -4,6 +4,7 @@ MACHINE_EDK2_REQUIRE ?=3D ""
=20
 MACHINE_EDK2_REQUIRE:fvp-base =3D "edk2-firmware-fvp-base.inc"
 MACHINE_EDK2_REQUIRE:juno =3D "edk2-firmware-juno.inc"
+MACHINE_EDK2_REQUIRE:rdv1 =3D "edk2-firmware-rdv1.inc"
 MACHINE_EDK2_REQUIRE:sbsa-ref =3D "edk2-firmware-sbsa-ref.inc"
 MACHINE_EDK2_REQUIRE:sgi575 =3D "edk2-firmware-sgi575.inc"
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index a0c4128fca7d..a70de61d78e9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -110,6 +110,14 @@ FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATH=
S}"
 COMPATIBLE_MACHINE:musca-b1 =3D "(^$)"
 COMPATIBLE_MACHINE:musca-s1 =3D "(^$)"
=20
+#
+# RDV1 KMACHINE
+#
+COMPATIBLE_MACHINE:rdv1 =3D "rdv1"
+KBUILD_DEFCONFIG:rdv1 =3D "defconfig"
+KCONFIG_MODE:rdv1 =3D "--alldefconfig"
+KCONF_BSP_AUDIT_LEVEL:rdv1 =3D "0"
+
 #
 # SGI575 KMACHINE
 #
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rdv1.bb b/meta-arm/recipes=
-devtools/fvp/fvp-rdv1.bb
new file mode 100644
index 000000000000..23804bf3fef4
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-rdv1.bb
@@ -0,0 +1,14 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "RD-V1"
+MODEL_CODE =3D "FVP_RD_V1"
+PV =3D "11.17.29"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ne=
overse-Infrastructure/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;su=
bdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-x86_64.sha256sum] =3D "715c0e0264fc3df961a0b9ff4c4399d55e4cc=
f4efb0944a412141d97873027a3"
+
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
--=20
2.50.1 (Apple Git-155)


