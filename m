Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8449D109B468
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:07:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19562.1774962425146625421
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 06:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TXwrWULk;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D833603
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:06:58 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 923813F7D8
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774962424; bh=tZOMAlT8It0i1bKZGe1To+mNgYrSJutx4KCsnq/x1R4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TXwrWULksXB+3+4MJDVwrpFx3FpDrnCGEjfdJOpp//w/5mMWWa2zTbKO9YP4CJFYZ
	 kYUbnBhbzFkpGnrfdAvvUA7jPlf03Sktrn35DtJS7SYFiqRsCzqMM6elIR9q7HO+0r
	 KXyQRVkVRvni657p3LQ7dWw+rfsPP04ztlYCUSnI=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm-bsp/rdv2: add support
Date: Tue, 31 Mar 2026 09:07:02 -0400
Message-ID: <20260331130702.56223-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331130702.56223-1-jon.mason@arm.com>
References: <20260331130702.56223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 13:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6994

Add support for Neoverse Reference Design version 2

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  6 ++
 ci/fvps.yml                                   |  2 +
 ci/rdv2.yml                                   | 14 +++++
 meta-arm-bsp/conf/machine/rdv2.conf           | 60 +++++++++++++++++++
 .../runtime/cases/parselogs-ignores-rdv2.txt  |  2 +
 .../scp-firmware/scp-firmware-rdv2.inc        | 14 +++++
 .../scp-firmware/scp-firmware_%.bbappend      |  1 +
 .../trusted-firmware-a-rdv2.inc               | 29 +++++++++
 .../trusted-firmware-a_%.bbappend             |  1 +
 .../recipes-bsp/uefi/edk2-firmware-rdv2.inc   | 17 ++++++
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  1 +
 .../linux/linux-arm-platforms.inc             |  8 +++
 meta-arm/recipes-devtools/fvp/fvp-rdv2.bb     | 20 +++++++
 13 files changed, 175 insertions(+)
 create mode 100644 ci/rdv2.yml
 create mode 100644 meta-arm-bsp/conf/machine/rdv2.conf
 create mode 100644 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores=
-rdv2.txt
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rd=
v2.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-rdv2.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-rdv2.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a07b82abb85d..09a5423f5141 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -321,6 +321,12 @@ rdv1:
   tags:
     - x86_64
=20
+rdv2:
+  extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
+
 sbsa-ref:
   extends: .build
   parallel:
diff --git a/ci/fvps.yml b/ci/fvps.yml
index 185a4f3de846..5370402c9f17 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -34,6 +34,8 @@ target:
   # Infrastructure FVPs
   - fvp-rdv3-r1
   - nativesdk-fvp-rdv3-r1
+  - fvp-rdv2
+  - nativesdk-fvp-rdv2
   - fvp-rdn2
   - nativesdk-fvp-rdn2
   # These are x86 only... :(
diff --git a/ci/rdv2.yml b/ci/rdv2.yml
new file mode 100644
index 000000000000..7fa62b8309eb
--- /dev/null
+++ b/ci/rdv2.yml
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
+    COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:rdv2 =3D "rdv2"
+
+machine: rdv2
diff --git a/meta-arm-bsp/conf/machine/rdv2.conf b/meta-arm-bsp/conf/mach=
ine/rdv2.conf
new file mode 100644
index 000000000000..2c306f26316c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/rdv2.conf
@@ -0,0 +1,60 @@
+# Configuration for Arm Neoverse V2 Reference Design development board
+
+#@TYPE: Machine
+#@NAME: RD V2
+#@DESCRIPTION: Machine configuration for RD V2
+
+#FIXME - doesn't boot with armv9 tunes
+#require conf/machine/include/arm/arch-armv9a.inc
+require conf/machine/include/arm/arch-armv8a.inc
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
+
+KERNEL_IMAGETYPE ?=3D "Image"
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
+SERIAL_CONSOLES =3D "115200;ttyAMA2"
+EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
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
+FVP_PROVIDER ?=3D "fvp-rdv2-native"
+FVP_EXE ?=3D "FVP_RD_V2"
+
+FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp-firmware/scp_ramfw.bin@0x0BD8=
0000 \
+             css.mcp.armcortexm7ct=3Dscp-firmware/mcp_ramfw.bin@0x0BF800=
00"
+
+FVP_CONFIG[css.gic_distributor.ITS-device-bits] ?=3D "20"
+FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "scp-firmware/mcp_romfw.bin"
+FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp-firmware/scp_romfw.bin"
+FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "trusted-firmware-a/bl1.=
bin"
+FVP_CONFIG[board.flashloader0.fname] ?=3D "trusted-firmware-a/fip.bin"
+
+FVP_CONFIG[board.dram_size] ?=3D "0x200000000"
+
+# Virtio configuration
+FVP_CONFIG[board.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[board.virtio_net.hostbridge.userNetworking] ?=3D "1"
+FVP_CONFIG[board.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
+FVP_CONFIG[board.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
+
+FVP_CONSOLES[default] =3D "terminal_ns_uart_ap"
+FVP_TERMINALS[css.scp.terminal_uart_scp] ?=3D "SCP Console"
+FVP_TERMINALS[css.mcp.terminal_uart_mcp] ?=3D "MCP Console"
+FVP_TERMINALS[css.terminal_ns_uart_ap] ?=3D "NS Console"
+FVP_TERMINALS[css.terminal_s_uart_ap] ?=3D "S Console"
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.t=
xt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.txt
new file mode 100644
index 000000000000..7b55e8ea61f0
--- /dev/null
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.txt
@@ -0,0 +1,2 @@
+arch_timer: Failed to initialize memory-mapped timer.
+PCI: OF: of_root node is NULL, cannot create PCI host bridge node
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv2.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv2.inc
new file mode 100644
index 000000000000..e36c7b60f407
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdv2.inc
@@ -0,0 +1,14 @@
+# RD V2 specific SCP configurations and build instructions
+
+COMPATIBLE_MACHINE:rdv2 =3D "rdv2"
+SCP_PRODUCT_GROUP =3D "neoverse-rd"
+SCP_PLATFORM =3D "rdn2"
+
+EXTRA_OECMAKE +=3D "-D SCP_PLATFORM_VARIANT=3D0"
+
+SCP_LOG_LEVEL =3D "DEBUG"
+
+SRC_URI_SCP_FIRMWARE =3D "gitsm://gitlab.arm.com/infra-solutions/referen=
ce-design/platsw/scp-firmware.git;protocol=3Dhttps"
+SRCBRANCH =3D "refinfra-bmc"
+# Use the RD-INFRA-2024.12.20 tag
+SRCREV  =3D "62bc3f079d1ae5780df1459d4c66de2dbee54359"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 222bee5e52e1..011090e72351 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -5,6 +5,7 @@ MACHINE_SCP_REQUIRE ?=3D ""
 MACHINE_SCP_REQUIRE:juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE:rdn2 =3D "scp-firmware-rdn2.inc"
 MACHINE_SCP_REQUIRE:rdv1 =3D "scp-firmware-rdv1.inc"
+MACHINE_SCP_REQUIRE:rdv2 =3D "scp-firmware-rdv2.inc"
 MACHINE_SCP_REQUIRE:sgi575 =3D "scp-firmware-sgi575.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-rdv2.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-rdv2.inc
new file mode 100644
index 000000000000..796011576e1d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
@@ -0,0 +1,29 @@
+# RD V2 specific TFA support
+
+COMPATIBLE_MACHINE =3D "rdv2"
+TFA_PLATFORM       =3D "rdn2"
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
+
+SRC_URI_TRUSTED_FIRMWARE_A =3D "git://gitlab.arm.com/infra-solutions/ref=
erence-design/platsw/trusted-firmware-a.git;protocol=3Dhttps"
+SRCBRANCH =3D "refinfra"
+# SHA not in any branches.  so use RD-INFRA-2025.07.03
+SRCREV_tfa =3D "a4b376b128bb5b91771002f7808566f53c8d9f3a"
+
+# FIXME - hacking around using the 2.14 based recipe
+SRC_URI:remove =3D "file://0001-feat-build-add-HOSTLDFLAGS-to-pass-flags=
-to-host-lin.patch"
+LIC_FILES_CHKSUM:remove =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc=
63021c6eba7b524039e"
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118e32884721c0be33=
267bd7ae11130"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index 9a5d4aa54fd1..6f7a6e857cfd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -6,6 +6,7 @@ MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp-=
base.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE:rdn2 =3D "trusted-firmware-a-rdn2.inc"
 MACHINE_TFA_REQUIRE:rdv1 =3D "trusted-firmware-a-rdv1.inc"
+MACHINE_TFA_REQUIRE:rdv2 =3D "trusted-firmware-a-rdv2.inc"
 MACHINE_TFA_REQUIRE:sbsa-ref =3D "trusted-firmware-a-sbsa-ref.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
new file mode 100644
index 000000000000..c2fd6fecfd32
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
@@ -0,0 +1,17 @@
+# RD V2 specific EDK2 configurations
+EDK2_BUILD_RELEASE =3D "0"
+EDK2_PLATFORM      =3D "RdN2"
+EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/RdN2/RdN2.dsc"
+EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
+
+COMPATIBLE_MACHINE =3D "rdv2"
+
+SRC_URI_EDK2 =3D "gitsm://gitlab.arm.com/infra-solutions/reference-desig=
n/platsw/edk2.git;protocol=3Dhttps"
+SRC_URI_EDK2_PLATFORMS =3D "git://gitlab.arm.com/infra-solutions/referen=
ce-design/platsw/edk2-platforms.git;protocol=3Dhttps"
+
+SRCBRANCH_edk2 =3D "refinfra"
+SRCBRANCH_edk2_platforms =3D "refinfra"
+
+# Use the RD-INFRA-2024.12.20 tag
+SRCREV_edk2           =3D "dd25905d63ec72d6e06804155fda1098d10da19e"
+SRCREV_edk2-platforms =3D "f6ed3b0f92eeaf380638f77d8b5ace805facb301"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 3bb1319d1545..7dd87303c5ec 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -6,6 +6,7 @@ MACHINE_EDK2_REQUIRE:fvp-base =3D "edk2-firmware-fvp-base=
.inc"
 MACHINE_EDK2_REQUIRE:juno =3D "edk2-firmware-juno.inc"
 MACHINE_EDK2_REQUIRE:rdn2 =3D "edk2-firmware-rdn2.inc"
 MACHINE_EDK2_REQUIRE:rdv1 =3D "edk2-firmware-rdv1.inc"
+MACHINE_EDK2_REQUIRE:rdv2 =3D "edk2-firmware-rdv2.inc"
 MACHINE_EDK2_REQUIRE:sbsa-ref =3D "edk2-firmware-sbsa-ref.inc"
 MACHINE_EDK2_REQUIRE:sgi575 =3D "edk2-firmware-sgi575.inc"
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index c537c352f78b..bc1ea28cb70c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -126,6 +126,14 @@ KBUILD_DEFCONFIG:rdv1 =3D "defconfig"
 KCONFIG_MODE:rdv1 =3D "--alldefconfig"
 KCONF_BSP_AUDIT_LEVEL:rdv1 =3D "0"
=20
+#
+# RDV2 KMACHINE
+#
+COMPATIBLE_MACHINE:rdv2 =3D "rdv2"
+KBUILD_DEFCONFIG:rdv2 =3D "defconfig"
+KCONFIG_MODE:rdv2 =3D "--alldefconfig"
+KCONF_BSP_AUDIT_LEVEL:rdv2 =3D "0"
+
 #
 # SGI575 KMACHINE
 #
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rdv2.bb b/meta-arm/recipes=
-devtools/fvp/fvp-rdv2.bb
new file mode 100644
index 000000000000..3da7075abcd0
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-rdv2.bb
@@ -0,0 +1,20 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "RD-V2"
+MODEL_CODE =3D "FVP_RD_V2"
+PV =3D "11.24.12"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ne=
overse-Infrastructure/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;su=
bdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI[fvp-aarch64.sha256sum] =3D "fa43cc506e3799afb73c646f93c2ea509dc1=
081c0e993c4a7bf83b082b896e5f"
+SRC_URI[fvp-x86_64.sha256sum] =3D "74199d4766e96ed86b071bf343a0a60d876ac=
cef83be41be3dbb9557b4455635"
+
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Db9005e55057311e41efe02ccfea8ea72"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
+
+require remove-execstack.inc
+REMOVE_EXECSTACKS:x86-64 =3D "${FVPDIR}/models/${FVP_ARCH_DIR}*/libarmct=
model.so"
--=20
2.50.1 (Apple Git-155)


