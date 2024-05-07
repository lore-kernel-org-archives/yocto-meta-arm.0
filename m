Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBFCC25B77
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 17:33:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.312.1715103196586476916
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 May 2024 10:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F60C1063
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:42 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 530173F587
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:15 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm-bsp: remove support for n1sdp
Date: Tue,  7 May 2024 13:33:09 -0400
Message-Id: <20240507173313.50788-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240507173313.50788-1-jon.mason@arm.com>
References: <20240507173313.50788-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 17:33:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5699

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |    6 -
 README.md                                     |    2 +-
 ci/n1sdp-optee.yml                            |   14 -
 ci/n1sdp-ts.yml                               |   16 -
 ci/n1sdp.yml                                  |   12 -
 documentation/trusted-services.md             |    6 +-
 meta-arm-bsp/conf/machine/n1sdp.conf          |   51 -
 meta-arm-bsp/documentation/n1sdp.md           |   78 -
 meta-arm-bsp/documentation/template.md        |    2 +-
 .../images/n1sdp-board-firmware_2022.06.22.bb |   37 -
 .../images/sdcard-image-n1sdp_0.1.bb          |   85 -
 .../scp-firmware/scp-firmware-n1sdp.inc       |   35 -
 .../scp-firmware/scp-firmware_%.bbappend      |    1 -
 .../0001-Reserve-OP-TEE-memory-from-nwd.patch |   42 -
 .../n1sdp/0001-n1sdp-tftf-tests-to-skip.patch |   46 -
 .../0002-Modify-BL32-Location-to-DDR4.patch   |   30 -
 .../n1sdp/0003-Modify-SPMC-Base-to-DDR4.patch |   28 -
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |   10 -
 .../trusted-firmware-a-n1sdp.inc              |   41 -
 .../trusted-firmware-a_%.bbappend             |    1 -
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   30 -
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |    1 -
 ...dp-Add-support-to-parse-NT_FW_CONFIG.patch |  471 ---
 ...dp-Modify-the-IRQ-ID-of-Debug-UART-a.patch |   63 -
 ...erseN1Soc-Enable-SCP-QSPI-flash-regi.patch |   57 -
 ...RM-N1Sdp-NOR-flash-library-for-N1Sdp.patch |  119 -
 ...N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch | 2538 -----------------
 ...M-N1Sdp-Persistent-storage-for-N1Sdp.patch |   88 -
 ...dp-Enable-FaultTolerantWrite-Dxe-dri.patch |   50 -
 ...dp-manually-poll-QSPI-status-bit-aft.patch |  197 --
 ...1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch |   72 -
 .../bsp/arm-platforms/n1sdp-preempt-rt.scc    |    6 -
 .../bsp/arm-platforms/n1sdp-standard.scc      |    5 -
 .../bsp/arm-platforms/n1sdp/disable-kvm.cfg   |    1 -
 .../linux/linux-arm-platforms.inc             |   25 -
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch |   47 -
 ...irk-add-acs-override-for-PCI-devices.patch |  159 --
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch |  324 ---
 ...uirk-support-enabling-remote-chip-PC.patch |  136 -
 ...list-early-Arm-Neoverse-N1-revisions.patch |   33 -
 ...disable-config-options-that-does-not.patch |   57 -
 .../linux-yocto-6.6/n1sdp/enable-nvme.cfg     |    3 -
 .../n1sdp/enable-realtek-R8169.cfg            |    3 -
 .../n1sdp/enable-usb_conn_gpio.cfg            |    2 -
 .../n1sdp/usb_xhci_pci_renesas.cfg            |    2 -
 ...lat-n1sdp-add-N1SDP-platform-support.patch |  237 --
 .../n1sdp/0002-Handle-logging-syscall.patch   |   32 -
 ...lat-n1sdp-register-DRAM1-to-optee-os.patch |   52 -
 ...d-external-device-tree-base-and-size.patch |   44 -
 .../optee/optee-os-generic-n1sdp.inc          |    2 -
 .../recipes-security/optee/optee-os-n1sdp.inc |   29 -
 .../optee/optee-os-tadevkit_4.%.bbappend      |    1 -
 .../optee/optee-os_4.%.bbappend               |    1 -
 .../optee/optee-test_4.%.bbappend             |    1 -
 .../packagegroup-ts-tests.bbappend            |    1 -
 .../trusted-services/ts-arm-platforms.inc     |    3 -
 .../trusted-services/ts-newlib_%.bbappend     |    1 -
 meta-arm-bsp/wic/n1sdp-efidisk.wks            |    9 -
 meta-arm-bsp/wic/n1sdp-grub.cfg               |   18 -
 59 files changed, 4 insertions(+), 5459 deletions(-)
 delete mode 100644 ci/n1sdp-optee.yml
 delete mode 100644 ci/n1sdp-ts.yml
 delete mode 100644 ci/n1sdp.yml
 delete mode 100644 meta-arm-bsp/conf/machine/n1sdp.conf
 delete mode 100644 meta-arm-bsp/documentation/n1sdp.md
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_20=
22.06.22.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.=
bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sd=
p.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp=
/0001-Reserve-OP-TEE-memory-from-nwd.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp=
/0001-n1sdp-tftf-tests-to-skip.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp=
/0002-Modify-BL32-Location-to-DDR4.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp=
/0003-Modify-SPMC-Base-to-DDR4.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-n1sdp.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0001-Platform=
-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform=
-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0003-Silicon-=
ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0004-Platform=
-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0005-Platform=
-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0006-Platform=
-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0007-Platform=
-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0008-Platform=
-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform=
-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/n1sdp-preempt-rt.scc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/n1sdp-standard.scc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/n1sdp/disable-kvm.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/0006-arm64-defconfig-disable-config-options-that-does-not.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/enable-nvme.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/enable-realtek-R8169.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/enable-usb_conn_gpio.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp=
/usb_xhci_pci_renesas.cfg
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sd=
p/0001-plat-n1sdp-add-N1SDP-platform-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sd=
p/0002-Handle-logging-syscall.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sd=
p/0003-plat-n1sdp-register-DRAM1-to-optee-os.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sd=
p/0004-plat-n1sdp-add-external-device-tree-base-and-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-generic-n1=
sdp.inc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
 delete mode 100644 meta-arm-bsp/wic/n1sdp-efidisk.wks
 delete mode 100644 meta-arm-bsp/wic/n1sdp-grub.cfg

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3adea45ea780..506cb4871ea9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -247,12 +247,6 @@ musca-b1:
 musca-s1:
   extends: .build
=20
-n1sdp:
-  extends: .build
-  parallel:
-    matrix:
-      - TESTING: [none, n1sdp-ts, n1sdp-optee, tftf]
-
 pending-updates:
   extends: .setup
   artifacts:
diff --git a/README.md b/README.md
index e77e5acd9d10..8acdb029cca9 100644
--- a/README.md
+++ b/README.md
@@ -8,7 +8,7 @@ This repository contains the Arm layers for OpenEmbedded.
=20
 * meta-arm-bsp
=20
-  This layer contains machines for Arm reference platforms, for example FV=
P Base, N1SDP, and Juno.
+  This layer contains machines for Arm reference platforms, for example FV=
P Base, Corstone1000, and Juno.
=20
 * meta-arm-toolchain
=20
diff --git a/ci/n1sdp-optee.yml b/ci/n1sdp-optee.yml
deleted file mode 100644
index 6de4abae5c8c..000000000000
--- a/ci/n1sdp-optee.yml
+++ /dev/null
@@ -1,14 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siemen=
s/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-
-# Config specific for the optee-xtests
-local_conf_header:
-  optee-test: |
-    # Include ARM FFA
-    MACHINE_FEATURES:append =3D " arm-ffa"
-    # Include trusted services
-    TEST_SUITES:append =3D " trusted_services"
-    # Include Optee xtests
-    IMAGE_INSTALL:append =3D " optee-test"
diff --git a/ci/n1sdp-ts.yml b/ci/n1sdp-ts.yml
deleted file mode 100644
index b100e240659f..000000000000
--- a/ci/n1sdp-ts.yml
+++ /dev/null
@@ -1,16 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siemen=
s/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-  includes:
-    - ci/meta-openembedded.yml
-
-local_conf_header:
-  trusted_services: |
-    TEST_SUITES:append =3D " trusted_services"
-    # Include TS Crypto, TS Protected Storage, TS Internal and Trusted Sto=
rage SPs into optee-os image
-    MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
-    # Include TS demo/test tools into image
-    IMAGE_INSTALL:append =3D " packagegroup-ts-tests"
-    # Include TS PSA Arch tests into image
-    IMAGE_INSTALL:append =3D " packagegroup-ts-tests-psa"
diff --git a/ci/n1sdp.yml b/ci/n1sdp.yml
deleted file mode 100644
index 2a85d00b6f2b..000000000000
--- a/ci/n1sdp.yml
+++ /dev/null
@@ -1,12 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siemen=
s/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-  includes:
-    - ci/base.yml
-
-machine: n1sdp
-
-local_conf_header:
-  unsupported_trusted_services: |
-    MACHINE_FEATURES:remove =3D "ts-smm-gateway"
diff --git a/documentation/trusted-services.md b/documentation/trusted-serv=
ices.md
index c37b10bf3c3b..636ccbf3720c 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -37,13 +37,11 @@ Other steps depend on your machine/platform definition:
=20
 2. optee-os might require platform specific OP-TEE build parameters (for e=
xample what SEL the SPM Core is implemented at).
    You can find examples in `meta-arm/recipes-security/optee/optee-os_%.bb=
append` for qemuarm64-secureboot machine
-   and in `meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc` and `me=
ta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc`
-   for N1SDP and Corstone1000 platforms accordingly.
+   and in `meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-commo=
n.inc` for the Corstone1000 platform.
=20
 3. trusted-firmware-a might require platform specific TF-A build parameter=
s (SPD and SPMC details on the platform).
    See `meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbapp=
end` for qemuarm64-secureboot machine
-   and in `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
n1sdp.inc` and
-   `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corston=
e1000.inc` for N1SDP and Corstone1000 platforms.
+   and in `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
corstone1000.inc` for theCorstone1000 platform.
=20
 4. Trusted Services supports an SPMC agonistic binary format. To build SPs=
 to this format the `TS_ENV` variable is to be
    set to `sp`. The resulting SP binaries should be able to boot under any=
 FF-A v1.1 compliant SPMC implementation.
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machi=
ne/n1sdp.conf
deleted file mode 100644
index 662cf62c04d8..000000000000
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ /dev/null
@@ -1,51 +0,0 @@
-# Configuration for Arm N1SDP development board
-
-#@TYPE: Machine
-#@NAME: N1SDP machine
-#@DESCRIPTION: Machine configuration for N1SDP
-
-require conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
-
-KERNEL_IMAGETYPE =3D "Image"
-
-IMAGE_FSTYPES +=3D "wic wic.gz wic.bmap tar.bz2 ext4"
-
-SERIAL_CONSOLES =3D "115200;ttyAMA0"
-
-# Set default WKS
-WKS_FILE ?=3D "n1sdp-efidisk.wks"
-IMAGE_EFI_BOOT_FILES ?=3D "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
-WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
-
-# Use kernel provided by yocto
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.6%"
-
-# RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
-
-# TF-A
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
-TFA_PLATFORM =3D "n1sdp"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
-PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
-
-# SCP
-EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
-
-#UEFI EDK2 firmware
-EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
-PREFERRED_VERSION_edk2-firmware ?=3D "202311"
-
-#optee
-PREFERRED_VERSION_optee-os ?=3D "4.1.%"
-PREFERRED_VERSION_optee-os-tadevkit ?=3D "4.1.%"
-PREFERRED_VERSION_optee-test ?=3D "4.1.%"
-PREFERRED_VERSION_optee-client ?=3D "4.1.%"
-
-#grub-efi
-EFI_PROVIDER ?=3D "grub-efi"
-MACHINE_FEATURES +=3D "efi"
-
-# SD-Card firmware
-EXTRA_IMAGEDEPENDS +=3D "sdcard-image-n1sdp"
diff --git a/meta-arm-bsp/documentation/n1sdp.md b/meta-arm-bsp/documentati=
on/n1sdp.md
deleted file mode 100644
index d8661a5c3484..000000000000
--- a/meta-arm-bsp/documentation/n1sdp.md
+++ /dev/null
@@ -1,78 +0,0 @@
-# N1SDP Development Platform Support in meta-arm-bsp
-
-## Overview
-The N1SDP provides access to the Arm Neoverse N1 SoC. The N1SDP enables so=
ftware development for key enterprise technology
-and general Arm software development. The N1SDP consists of the N1 board c=
ontaining the N1 SoC.
-The N1 SoC contains two dual-core Arm Neoverse N1 processor clusters.
-
-The system demonstrates Arm technology in the context of Cache-Coherent In=
terconnect for Accelerators (CCIX) protocol by:
-
-- Running coherent traffic between the N1 SoC and an accelerator card.
-- Coherent communication between two N1 SoCs.
-- Enabling development of CCIX-enabled FPGA accelerators.
-
-Further information on N1SDP can be found at
-https://community.arm.com/developer/tools-software/oss-platforms/w/docs/45=
8/neoverse-n1-sdp
-
-## Configuration:
-In the local.conf file, MACHINE should be set as follow:
-MACHINE ?=3D "n1sdp"
-
-## Building
-```bash$ bitbake core-image-minimal```
-
-## Running
-
-# Update Firmware on SD card:
-
-(*) To use n1sdp board in single chip mode, flash:
-    n1sdp-board-firmware_primary.tar.gz firmware.
-
-(*) To use n1sdp board in multi chip mode, flash:
-    n1sdp-board-firmware_primary.tar.gz firmware to primary board,
-    n1sdp-board-firmware_secondary.tar.gz firmware to secondary board.
-
-The SD card content is generated during the build here:
-  tmp/deploy/images/n1sdp/n1sdp-board-firmware_primary.tar.gz
-  tmp/deploy/images/n1sdp/n1sdp-board-firmware_secondary.tar.gz
-
-
-Its content must be written on the N1SDP firmware SD card.
-To do this:
-- insert the sdcard of the N1SDP in an SD card reader and mount it:
-```bash$ sudo mount /dev/sdx1 /mnt```
-(replace sdx by the device of the SD card)
-
-- erase its content and put the new one:
-```bash$ sudo rm -rf /mnt/*```
-```bash$ sudo tar --no-same-owner -xzf tmp/deploy/images/n1sdp/n1sdp-board=
-firmware_primary.tar.gz -C /mnt/```
-```bash$ sudo umount /mnt```
-
-- reinsert the SD card in the N1SDP board
-
-Firmware tarball contains iofpga configuration files, scp and uefi binarie=
s.
-
-**NOTE**:
-If the N1SDP board was manufactured after November 2019 (Serial Number gre=
ater
-than 36253xxx), a different PMIC firmware image must be used to prevent
-potential damage to the board. More details can be found in [1].
-The `MB/HBI0316A/io_v123f.txt` file located in the microSD needs to be upd=
ated.
-To update it, set the PMIC image (300k_8c2.bin) to be used in the newer mo=
dels
-by running the following commands on your host PC:
-
-    $ sudo umount /dev/sdx1
-    $ sudo mount /dev/sdx1 /mnt
-    $ sudo sed -i '/^MBPMIC: pms_0V85.bin/s/^/;/g' /mnt/MB/HBI0316A/io_v12=
3f.txt
-    $ sudo sed -i '/^;MBPMIC: 300k_8c2.bin/s/^;//g' /mnt/MB/HBI0316A/io_v1=
23f.txt
-    $ sudo umount /mnt
-
-# Prepare an USB hard drive:
-
-Grub boot partition is placed on first partition of the *.wic image,
-Linux root file system is placed on the second partition of the *.wic imag=
e:
-  tmp/deploy/images/n1sdp/core-image-minimal-n1sdp.wic
-
-This *.wic image should be copied to USB stick with simple dd call.
-
-
-[1]: https://community.arm.com/developer/tools-software/oss-platforms/w/do=
cs/604/notice-potential-damage-to-n1sdp-boards-if-using-latest-firmware-rel=
ease
diff --git a/meta-arm-bsp/documentation/template.md b/meta-arm-bsp/document=
ation/template.md
index 7beeb5950cad..6f479084b93a 100644
--- a/meta-arm-bsp/documentation/template.md
+++ b/meta-arm-bsp/documentation/template.md
@@ -16,4 +16,4 @@
=20
 *A summary of how to deploy or execute the image*
=20
-*For example, an overview of the N1SDP SD structure, or FVP arguments*
+*For example, an overview of FVP arguments*
diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.2=
2.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
deleted file mode 100644
index 1b502e529734..000000000000
--- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY =3D "Board Firmware binaries for N1SDP"
-SECTION =3D "firmware"
-
-LICENSE =3D "STM-SLA0044-Rev5"
-LIC_FILES_CHKSUM =3D "file://LICENSES/MB/STM.TXT;md5=3D1b74d8c842307d03c11=
6f2d71cbf868a"
-
-inherit deploy
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "n1sdp"
-
-SRC_URI =3D "git://git.gitlab.arm.com/arm-reference-solutions/board-firmwa=
re.git;protocol=3Dhttps;branch=3Dn1sdp"
-
-SRCREV =3D "70ba494265eee76747faff38264860c19e214540"
-PV .=3D "+git"
-
-S =3D "${WORKDIR}/git"
-
-INSTALL_DIR =3D "/n1sdp-board-firmware_source"
-
-do_install() {
-    rm -rf ${S}/SOFTWARE
-    install -d ${D}${INSTALL_DIR}
-    cp -Rp --no-preserve=3Downership ${S}/* ${D}${INSTALL_DIR}
-}
-
-FILES:${PN}-staticdev +=3D " ${INSTALL_DIR}/LIB/sensor.a"
-FILES:${PN} =3D "${INSTALL_DIR}"
-SYSROOT_DIRS +=3D "${INSTALL_DIR}"
-
-do_deploy() {
-    install -d ${DEPLOYDIR}${INSTALL_DIR}
-    cp -Rp --no-preserve=3Downership ${S}/* ${DEPLOYDIR}${INSTALL_DIR}
-}
-addtask deploy after do_install before do_build
diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/me=
ta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
deleted file mode 100644
index 3ed71c57d247..000000000000
--- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY =3D "Firmware image recipe for generating SD-Card artifacts."
-
-inherit deploy nopackages
-
-DEPENDS =3D "trusted-firmware-a \
-           virtual/control-processor-firmware \
-           n1sdp-board-firmware"
-
-LICENSE =3D "MIT"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "n1sdp"
-RM_WORK_EXCLUDE +=3D "${PN}"
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-do_install[noexec] =3D "1"
-
-FIRMWARE_DIR =3D "n1sdp-board-firmware_source"
-PRIMARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_primary"
-SECONDARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_secondary"
-
-SOC_BINARIES =3D "mcp_fw.bin scp_fw.bin mcp_rom.bin scp_rom.bin"
-
-prepare_package() {
-    cd ${WORKDIR}
-
-    # Master/Primary
-    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${PRIMARY_DIR}
-    mkdir -p ${PRIMARY_DIR}/SOFTWARE/
-
-    # Copy FIP binary
-    cp -v ${RECIPE_SYSROOT}/firmware/fip.bin ${PRIMARY_DIR}/SOFTWARE/
-
-    # Copy SOC binaries
-    for f in ${SOC_BINARIES}; do
-        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${PRIMARY_DIR}/SOFTWARE/
-    done
-
-    sed -i -e 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRU=
E/FALSE|' \
-        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
-    sed -i -e 's|^C2C_SIDE.*|C2C_SIDE: MASTER            ;C2C side SLAVE/M=
ASTER|' \
-        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
-    sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x000001=
00   ;SoC SCC PLATFORM_CTRL|' \
-        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
-
-    # Update load address for trusted boot
-    sed -i -e '/^IMAGE4ADDRESS:/ s|0x60200000|0x64200000|' ${PRIMARY_DIR}/=
MB/HBI0316A/images.txt
-    sed -i -e '/^IMAGE4UPDATE:/ s|FORCE   |SCP_AUTO|' ${PRIMARY_DIR}/MB/HB=
I0316A/images.txt
-    sed -i -e '/^IMAGE4FILE: \\SOFTWARE\\/s|uefi.bin|fip.bin |' ${PRIMARY_=
DIR}/MB/HBI0316A/images.txt
-
-    # Slave/Secondary
-    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${SECONDARY_DIR}
-    mkdir -p ${SECONDARY_DIR}/SOFTWARE/
-
-    # Copy SOC binaries
-    for f in ${SOC_BINARIES}; do
-        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE/
-    done
-
-    sed -i -e 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRU=
E/FALSE|' \
-        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
-    sed -i -e 's|^C2C_SIDE.*|C2C_SIDE: SLAVE             ;C2C side SLAVE/M=
ASTER|' \
-        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
-    sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x000001=
01   ;SoC SCC PLATFORM_CTRL|' \
-        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
-    sed -i -e '/^TOTALIMAGES:/ s|5|4|' ${SECONDARY_DIR}/MB/HBI0316A/images=
.txt
-    sed -i -e 's|^IMAGE4|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
-}
-
-do_deploy() {
-    # prepare Master & Slave packages
-    prepare_package
-
-    for dir in ${PRIMARY_DIR} ${SECONDARY_DIR}; do
-        dir_name=3D$(basename ${dir})
-        mkdir -p ${D}/${dir_name}
-        cp -av ${dir} ${D}
-
-        # Compress the files
-        tar -C ${D}/${dir_name} -zcvf ${DEPLOYDIR}/${dir_name}.tar.gz ./
-    done
-}
-do_deploy[dirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"
-do_deploy[cleandirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"
-do_deploy[umask] =3D "022"
-addtask deploy after do_prepare_recipe_sysroot
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b=
/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
deleted file mode 100644
index c89b132ce46d..000000000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ /dev/null
@@ -1,35 +0,0 @@
-# N1SDP specific SCP configurations and build instructions
-
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
-
-SCP_LOG_LEVEL =3D "INFO"
-
-DEPENDS +=3D "fiptool-native"
-DEPENDS +=3D "trusted-firmware-a"
-DEPENDS +=3D "n1sdp-board-firmware"
-
-# The n1sdp sensor library is needed for building SCP N1SDP Platform
-# https://github.com/ARM-software/SCP-firmware/tree/master/product/n1sdp
-EXTRA_OECMAKE:append =3D " \
-    -DSCP_N1SDP_SENSOR_LIB_PATH=3D${RECIPE_SYSROOT}/n1sdp-board-firmware_s=
ource/LIB/sensor.a \
-"
-
-do_install:append() {
-   fiptool \
-       create \
-       --scp-fw "${D}/firmware/scp_ramfw.bin" \
-       --blob uuid=3Dcfacc2c4-15e8-4668-82be-430a38fad705,file=3D"${RECIPE=
_SYSROOT}/firmware/bl1.bin" \
-       "scp_fw.bin"
-
-   # This UUID is FIP_UUID_MCP_BL2 in SCP-Firmware.
-   fiptool \
-       create \
-       --blob uuid=3D54464222-a4cf-4bf8-b1b6-cee7dade539e,file=3D"${D}/fir=
mware/mcp_ramfw.bin" \
-       "mcp_fw.bin"
-
-   install "scp_fw.bin" "${D}/firmware/scp_fw.bin"
-   install "mcp_fw.bin" "${D}/firmware/mcp_fw.bin"
-
-   ln -sf "scp_romfw.bin" "${D}/firmware/scp_rom.bin"
-   ln -sf "mcp_romfw.bin" "${D}/firmware/mcp_rom.bin"
-}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index bb1a48c76a06..4421e79c8d51 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -3,7 +3,6 @@
 MACHINE_SCP_REQUIRE ?=3D ""
=20
 MACHINE_SCP_REQUIRE:juno =3D "scp-firmware-juno.inc"
-MACHINE_SCP_REQUIRE:n1sdp =3D "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE:sgi575 =3D "scp-firmware-sgi575.inc"
 MACHINE_SCP_REQUIRE:tc =3D "scp-firmware-tc.inc"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-R=
eserve-OP-TEE-memory-from-nwd.patch b/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/files/n1sdp/0001-Reserve-OP-TEE-memory-from-nwd.patch
deleted file mode 100644
index ce2d059589fd..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-Reserve-=
OP-TEE-memory-from-nwd.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 2d305094f8f500362079e9e7637d46129bf980e4 Mon Sep 17 00:00:00 2001
-From: Adam Johnston <adam.johnston@arm.com>
-Date: Tue, 25 Jul 2023 16:05:51 +0000
-Subject: [PATCH] n1sdp: Reserve OP-TEE memory from NWd
-
-The physical memory which is used to run OP-TEE on the N1SDP is known
-to the secure world via TOS_FW_CONFIG, but it may not be known to the
-normal world.
-
-As a precaution, explicitly reserve this memory via NT_FW_CONFIG to
-prevent the normal world from using it. This is not required on most
-platforms as the Trusted OS is run from secure RAM.
-
-Upstream-Status: Pending (not yet submitted to upstream)
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
-Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
----
- plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts b/plat/arm/b=
oard/n1sdp/fdts/n1sdp_nt_fw_config.dts
-index da5e04ddb6..b7e2d4e86f 100644
---- a/plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts
-+++ b/plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts
-@@ -20,4 +20,16 @@
- 		local-ddr-size =3D <0x0>;
- 		remote-ddr-size =3D <0x0>;
- 	};
-+
-+	reserved-memory {
-+		#address-cells =3D <2>;
-+		#size-cells =3D <2>;
-+		ranges;
-+
-+		optee@0xDE000000 {
-+			compatible =3D "removed-dma-pool";
-+			reg =3D <0x0 0xDE000000 0x0 0x02000000>;
-+			no-map;
-+		};
-+	};
- };
-\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n=
1sdp-tftf-tests-to-skip.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a=
/files/n1sdp/0001-n1sdp-tftf-tests-to-skip.patch
deleted file mode 100644
index b31567c4c7d3..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-tf=
tf-tests-to-skip.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From cc0153b56d634aa80b740be5afed15bedb94a2c9 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Tue, 23 Jan 2024 14:19:39 +0000
-Subject: [PATCH] n1sdp patch tests to skip
-
-Upstream-Status: Pending
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- plat/arm/n1sdp/tests_to_skip.txt | 15 ++++++++++-----
- 1 file changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/plat/arm/n1sdp/tests_to_skip.txt b/plat/arm/n1sdp/tests_to_sk=
ip.txt
-index b6e87bf..1848408 100644
---- a/plat/arm/n1sdp/tests_to_skip.txt
-+++ b/plat/arm/n1sdp/tests_to_skip.txt
-@@ -11,7 +11,7 @@ SMMUv3 tests
- PSCI CPU Suspend in OSI mode
-=20
- # PSCI is enabled but not tested
--PSCI STAT/Stats test cases after system suspend
-+PSCI STAT
- PSCI System Suspend Validation
-=20
- # Disable FF-A Interrupt tests as TWDOG is not supported by TC platform
-@@ -25,9 +25,14 @@ FF-A Interrupt
- # files in TFTF, since the port was done purely to test the spectre worka=
round
- # performance impact. Once that was done no further work was done on the =
port.
-=20
--Timer framework Validation/Target timer to a power down cpu
--Timer framework Validation/Test scenario where multiple CPUs call same ti=
meout
--Timer framework Validation/Stress test the timer framework
-+Timer framework Validation
- PSCI Affinity Info/Affinity info level0 powerdown
- PSCI CPU Suspend
--PSCI STAT/for valid composite state CPU suspend
-+Framework Validation/NVM serialisation
-+Framework Validation/Events API
-+Boot requirement tests
-+CPU Hotplug
-+ARM_ARCH_SVC/SMCCC_ARCH_WORKAROUND_1 test
-+ARM_ARCH_SVC/SMCCC_ARCH_WORKAROUND_2 test
-+ARM_ARCH_SVC/SMCCC_ARCH_WORKAROUND_3 test
-+FF-A Power management
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0002-M=
odify-BL32-Location-to-DDR4.patch b/meta-arm-bsp/recipes-bsp/trusted-firmwa=
re-a/files/n1sdp/0002-Modify-BL32-Location-to-DDR4.patch
deleted file mode 100644
index 8b2be194d96a..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0002-Modify-B=
L32-Location-to-DDR4.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 15dab90c3cb8e7677c4f953c2269e8ee1afa01b0 Mon Oct 2 13:45:43 2023
-From: Mariam Elshakfy <mariam.elshakfy@arm.com>
-Date: Mon, 2 Oct 2023 13:45:43 +0000
-Subject: [PATCH] Modify BL32 Location to DDR4
-
-Since OP-TEE start address is changed to run
-from DDR4, this patch changes BL32 entrypoint
-to the correct one.
-
-Upstream-Status: Pending (not yet submitted to upstream)
-Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
----
- plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts b/pla=
t/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts
-index ed870803c..797dfe3a4 100644
---- a/plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts
-+++ b/plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts
-@@ -22,8 +22,8 @@
- 		maj_ver =3D <0x1>;
- 		min_ver =3D <0x0>;
- 		exec_state =3D <0x0>;
--		load_address =3D <0x0 0x08000000>;
--		entrypoint =3D <0x0 0x08000000>;
-+		load_address =3D <0x0 0xDE000000>;
-+		entrypoint =3D <0x0 0xDE000000>;
- 		binary_size =3D <0x2000000>;
- 	};
-=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0003-M=
odify-SPMC-Base-to-DDR4.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a=
/files/n1sdp/0003-Modify-SPMC-Base-to-DDR4.patch
deleted file mode 100644
index 9e3271708a8a..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0003-Modify-S=
PMC-Base-to-DDR4.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9a1d11b9fbadf740c73aee6dca4fd0370b38e4a8 Tue Oct 3 13:49:13 2023
-From: Mariam Elshakfy <mariam.elshakfy@arm.com>
-Date: Tue, 3 Oct 2023 13:49:13 +0000
-Subject: [PATCH] Modify SPMC Base to DDR4
-
-Since OP-TEE start address is changed to run
-from DDR4, this patch changes SPMC base to=20
-the correct one.
-
-Upstream-Status: Pending (not yet submitted to upstream)
-Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
----
- plat/arm/board/n1sdp/include/platform_def.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plat/arm/board/n1sdp/include/platform_def.h b/plat/arm/board/=
n1sdp/include/platform_def.h
-index b3799a7b2..b12c61b61 100644
---- a/plat/arm/board/n1sdp/include/platform_def.h
-+++ b/plat/arm/board/n1sdp/include/platform_def.h
-@@ -118,7 +118,7 @@
-=20
- #define PLAT_ARM_MAX_BL31_SIZE		UL(0x40000)
-=20
--#define PLAT_ARM_SPMC_BASE		U(0x08000000)
-+#define PLAT_ARM_SPMC_BASE		U(0xDE000000)
- #define PLAT_ARM_SPMC_SIZE		UL(0x02000000)  /* 32 MB */
-=20
-=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbapp=
end b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index ec1158c918f1..8cb5a4c5ab5f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -1,16 +1,6 @@
 # Machine specific TFAs
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 EXTRA_OEMAKE:append:corstone1000 =3D " DEBUG=3D0"
 EXTRA_OEMAKE:append:corstone1000 =3D " LOG_LEVEL=3D30"
 TFTF_MODE:corstone1000 =3D "release"
-
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
-EXTRA_OEMAKE:append:n1sdp =3D " DEBUG=3D1"
-EXTRA_OEMAKE:append:n1sdp =3D " LOG_LEVEL=3D50"
-TFTF_MODE:n1sdp =3D "debug"
-SRC_URI:append:n1sdp =3D " \
-			file://0001-n1sdp-tftf-tests-to-skip.patch \
-			"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-n1sdp.inc
deleted file mode 100644
index 79dc9b2bb88d..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.=
inc
+++ /dev/null
@@ -1,41 +0,0 @@
-# N1SDP specific TFA support
-
-# Align with N1SDP-2023.06.22 Manifest
-SRCREV_tfa  =3D "31f60a968347497562b0129134928d7ac4767710"
-PV .=3D "+git"
-
-COMPATIBLE_MACHINE =3D "n1sdp"
-TFA_BUILD_TARGET   =3D "all fip"
-TFA_INSTALL_TARGET =3D "bl1 bl2 bl31 n1sdp-multi-chip n1sdp-single-chip n1=
sdp_fw_config n1sdp_tb_fw_config fip"
-TFA_DEBUG          =3D "1"
-TFA_MBEDTLS        =3D "1"
-TFA_UBOOT          =3D "0"
-TFA_UEFI          ?=3D "1"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/n1sdp:"
-
-SRC_URI:append =3D " \
-    file://0001-Reserve-OP-TEE-memory-from-nwd.patch \
-    file://0002-Modify-BL32-Location-to-DDR4.patch \
-    file://0003-Modify-SPMC-Base-to-DDR4.patch \
-    "
-
-TFA_ROT_KEY=3D "plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
-
-# Enabling Secure-EL1 Payload Dispatcher (SPD)
-TFA_SPD =3D "spmd"
-# Cortex-A35 supports Armv8.0-A (no S-EL2 execution state).
-# So, the SPD SPMC component should run at the S-EL1 execution state
-TFA_SPMD_SPM_AT_SEL2 =3D "0"
-
-# BL2 loads BL32 (optee). So, optee needs to be built first:
-DEPENDS +=3D "optee-os"
-
-EXTRA_OEMAKE:append =3D "\
-                    TRUSTED_BOARD_BOOT=3D1 \
-		    GENERATE_COT=3D1 \
-		    CREATE_KEYS=3D1 \
-		    ARM_ROTPK_LOCATION=3D"devel_rsa" \
-		    ROT_KEY=3D"${TFA_ROT_KEY}" \
-		    BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/tee-pager_v=
2.bin \
-		    "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend
index 214996a97045..444d66cdc91c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbap=
pend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbap=
pend
@@ -6,7 +6,6 @@ MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.inc"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp-base.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
-MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE:sbsa-ref =3D "trusted-firmware-a-sbsa-ref.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
 MACHINE_TFA_REQUIRE:tc =3D "trusted-firmware-a-tc.inc"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
deleted file mode 100644
index f03e4e5fa5da..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-# N1SDP specific EDK2 configurations
-EDK2_BUILD_RELEASE =3D "0"
-EDK2_PLATFORM      =3D "n1sdp"
-EDK2_PLATFORM_DSC  =3D "Platform/ARM/N1Sdp/N1SdpPlatform.dsc"
-EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
-
-COMPATIBLE_MACHINE =3D "n1sdp"
-
-# UEFI EDK2 on N1SDP is unable to detect FS2 during boot resulting in laun=
ching of
-# EDK2 shell instead of launching grub. The startup.nsh will force launchi=
ng of grub
-EFIDIR             =3D "/EFI/BOOT"
-EFI_BOOT_IMAGE     =3D "bootaa64.efi"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/n1sdp:"
-SRC_URI:append =3D "\
-    file://0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch=
;patchdir=3Dedk2-platforms \
-    file://0002-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch=
;patchdir=3Dedk2-platforms \
-    file://0003-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch=
;patchdir=3Dedk2-platforms \
-    file://0004-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch;patch=
dir=3Dedk2-platforms \
-    file://0005-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch;pa=
tchdir=3Dedk2-platforms \
-    file://0006-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch;patc=
hdir=3Dedk2-platforms \
-    file://0007-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch=
;patchdir=3Dedk2-platforms \
-    file://0008-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch=
;patchdir=3Dedk2-platforms \
-    file://0009-Platform-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch;p=
atchdir=3Dedk2-platforms \
-"
-
-do_deploy:append() {
-    EFIPATH=3D$(echo "${EFIDIR}" | sed 's/\//\\/g')
-    printf 'FS2:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" > ${DEPLOYDIR}/sta=
rtup.nsh
-}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
index cba484607258..76ffa55521b3 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -6,6 +6,5 @@ MACHINE_EDK2_REQUIRE:fvp-base =3D "edk2-firmware-fvp-base.i=
nc"
 MACHINE_EDK2_REQUIRE:juno =3D "edk2-firmware-juno.inc"
 MACHINE_EDK2_REQUIRE:sbsa-ref =3D "edk2-firmware-sbsa-ref.inc"
 MACHINE_EDK2_REQUIRE:sgi575 =3D "edk2-firmware-sgi575.inc"
-MACHINE_EDK2_REQUIRE:n1sdp =3D "edk2-firmware-n1sdp.inc"
=20
 require ${MACHINE_EDK2_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0001-Platform-ARM-N1=
sdp-Add-support-to-parse-NT_FW_CONFIG.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
deleted file mode 100644
index c7f163b40b10..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0001-Platform-ARM-N1sdp-Add=
-support-to-parse-NT_FW_CONFIG.patch
+++ /dev/null
@@ -1,471 +0,0 @@
-From 928cb457b9ab2abefbacad655eefdde943b4ee9a Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Thu, 17 Mar 2022 16:28:05 +0530
-Subject: [PATCH] Platform/ARM/N1sdp: Add support to parse NT_FW_CONFIG
-
-NT_FW_CONFIG DTB contains platform information passed by
-Tf-A boot stage.
-This information is used for Virtual memory map generation
-during PEI phase and passed on to DXE phase as a HOB, where
-it is used in ConfigurationManagerDxe.
-
-Upstream-Status: Pending
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: I54a86277719607eb00d4a472fae8f13c180eafca
----
- .../ConfigurationManager.c                    |  24 ++--
- .../ConfigurationManagerDxe.inf               |   3 +-
- .../ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h |  16 +--
- .../Library/PlatformLib/AArch64/Helper.S      |   4 +-
- .../Library/PlatformLib/PlatformLib.c         |  12 +-
- .../Library/PlatformLib/PlatformLib.inf       |   8 +-
- .../Library/PlatformLib/PlatformLibMem.c      | 103 +++++++++++++++++-
- Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   |   7 +-
- 8 files changed, 152 insertions(+), 25 deletions(-)
-
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
-index a6b4cb0e..c15020f5 100644
---- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
-@@ -1,7 +1,7 @@
- /** @file=0D
-   Configuration Manager Dxe=0D
- =0D
--  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+  Copyright (c) 2021 - 2023, ARM Limited. All rights reserved.<BR>=0D
- =0D
-   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- =0D
-@@ -16,6 +16,7 @@
- #include <IndustryStandard/SerialPortConsoleRedirectionTable.h>=0D
- #include <Library/ArmLib.h>=0D
- #include <Library/DebugLib.h>=0D
-+#include <Library/HobLib.h>=0D
- #include <Library/IoLib.h>=0D
- #include <Library/PcdLib.h>=0D
- #include <Library/UefiBootServicesTableLib.h>=0D
-@@ -28,6 +29,7 @@
- #include "Platform.h"=0D
- =0D
- extern struct EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat;=0D
-+static NEOVERSEN1SOC_PLAT_INFO *PlatInfo;=0D
- =0D
- /** The platform configuration repository information.=0D
- */=0D
-@@ -1242,13 +1244,11 @@ InitializePlatformRepository (
-   IN  EDKII_PLATFORM_REPOSITORY_INFO  * CONST PlatRepoInfo=0D
-   )=0D
- {=0D
--  NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;=0D
-   UINT64                        Dram2Size;=0D
-   UINT64                        RemoteDdrSize;=0D
- =0D
-   RemoteDdrSize =3D 0;=0D
- =0D
--  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-   Dram2Size =3D ((PlatInfo->LocalDdrSize - 2) * SIZE_1GB);=0D
- =0D
-   PlatRepoInfo->MemAffInfo[LOCAL_DDR_REGION2].Length =3D Dram2Size;=0D
-@@ -1512,7 +1512,6 @@ GetGicCInfo (
-   )=0D
- {=0D
-   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
--  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;=0D
-   UINT32                            TotalObjCount;=0D
-   UINT32                            ObjIndex;=0D
- =0D
-@@ -1523,7 +1522,6 @@ GetGicCInfo (
-   }=0D
- =0D
-   PlatformRepo =3D This->PlatRepoInfo;=0D
--  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
- =0D
-   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
-     TotalObjCount =3D PLAT_CPU_COUNT * 2;=0D
-@@ -1623,7 +1621,6 @@ GetStandardNameSpaceObject (
- {=0D
-   EFI_STATUS                        Status;=0D
-   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
--  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;=0D
-   UINT32                            AcpiTableCount;=0D
- =0D
-   if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-@@ -1634,7 +1631,7 @@ GetStandardNameSpaceObject (
- =0D
-   Status =3D EFI_NOT_FOUND;=0D
-   PlatformRepo =3D This->PlatRepoInfo;=0D
--  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-+=0D
-   AcpiTableCount =3D ARRAY_SIZE (PlatformRepo->CmAcpiTableList);=0D
-   if (PlatInfo->MultichipMode =3D=3D 0)=0D
-         AcpiTableCount -=3D 1;=0D
-@@ -1697,7 +1694,6 @@ GetArmNameSpaceObject (
- {=0D
-   EFI_STATUS                        Status;=0D
-   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
--  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;=0D
-   UINT32                            GicRedistCount;=0D
-   UINT32                            GicCpuCount;=0D
-   UINT32                            ProcHierarchyInfoCount;=0D
-@@ -1718,8 +1714,6 @@ GetArmNameSpaceObject (
-   Status =3D EFI_NOT_FOUND;=0D
-   PlatformRepo =3D This->PlatRepoInfo;=0D
- =0D
--  // Probe for multi chip information=0D
--  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
-     GicRedistCount =3D 2;=0D
-     GicCpuCount =3D PLAT_CPU_COUNT * 2;=0D
-@@ -2162,8 +2156,18 @@ ConfigurationManagerDxeInitialize (
-   IN EFI_SYSTEM_TABLE  * SystemTable=0D
-   )=0D
- {=0D
-+  VOID *PlatInfoHob;=0D
-   EFI_STATUS  Status;=0D
- =0D
-+  PlatInfoHob =3D GetFirstGuidHob (&gArmNeoverseN1SocPlatformInfoDescript=
orGuid);=0D
-+=0D
-+  if (PlatInfoHob =3D=3D NULL) {=0D
-+    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));=0D
-+    return EFI_NOT_FOUND;=0D
-+  }=0D
-+=0D
-+  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)GET_GUID_HOB_DATA (PlatInfoHob)=
;=0D
-+=0D
-   // Initialize the Platform Configuration Repository before installing t=
he=0D
-   // Configuration Manager Protocol=0D
-   Status =3D InitializePlatformRepository (=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManagerDxe.inf b/Platform/ARM/N1Sdp/ConfigurationManager/Co=
nfigurationManagerDxe/ConfigurationManagerDxe.inf
-index 4f8e7f13..a4e8b783 100644
---- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManagerDxe.inf
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManagerDxe.inf
-@@ -1,7 +1,7 @@
- ## @file=0D
- #  Configuration Manager Dxe=0D
- #=0D
--#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+#  Copyright (c) 2021 - 2023, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -42,6 +42,7 @@
- =0D
- [LibraryClasses]=0D
-   ArmPlatformLib=0D
-+  HobLib=0D
-   PrintLib=0D
-   UefiBootServicesTableLib=0D
-   UefiDriverEntryPoint=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h b/Silicon/A=
RM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-index 097160c7..4966011e 100644
---- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-+++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-@@ -1,6 +1,6 @@
- /** @file=0D
- *=0D
--* Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.=0D
-+* Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.=0D
- *=0D
- * SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- *=0D
-@@ -41,11 +41,6 @@
- #define NEOVERSEN1SOC_EXP_PERIPH_BASE0               0x1C000000=0D
- #define NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ            0x1300000=0D
- =0D
--// Base address to a structure of type NEOVERSEN1SOC_PLAT_INFO which is=0D
--// pre-populated by a earlier boot stage=0D
--#define NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE          (NEOVERSEN1SOC_NON_S=
ECURE_SRAM_BASE + \=0D
--                                                      0x00008000)=0D
--=0D
- /*=0D
-  * Platform information structure stored in Non-secure SRAM. Platform=0D
-  * information are passed from the trusted firmware with the below struct=
ure=0D
-@@ -55,12 +50,17 @@
- typedef struct {=0D
-   /*! 0 - Single Chip, 1 - Chip to Chip (C2C) */=0D
-   UINT8   MultichipMode;=0D
--  /*! Slave count in C2C mode */=0D
--  UINT8   SlaveCount;=0D
-+  /*! Secondary chip count in C2C mode */=0D
-+  UINT8   SecondaryChipCount;=0D
-   /*! Local DDR memory size in GigaBytes */=0D
-   UINT8   LocalDdrSize;=0D
-   /*! Remote DDR memory size in GigaBytes */=0D
-   UINT8   RemoteDdrSize;=0D
- } NEOVERSEN1SOC_PLAT_INFO;=0D
- =0D
-+// NT_FW_CONFIG DT structure=0D
-+typedef struct {=0D
-+  UINT64                  NtFwConfigDtAddr;=0D
-+} NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI;=0D
-+=0D
- #endif=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.=
S b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
-index 8d2069de..a0b89a7b 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
-@@ -1,6 +1,6 @@
- /** @file=0D
- *=0D
--*  Copyright (c) 2019 - 2020, ARM Limited. All rights reserved.=0D
-+*  Copyright (c) 2019 - 2023, ARM Limited. All rights reserved.=0D
- *=0D
- *  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- *=0D
-@@ -25,6 +25,8 @@ GCC_ASM_EXPORT(ArmPlatformIsPrimaryCore)
- // the UEFI firmware through the CPU registers.=0D
- //=0D
- ASM_PFX(ArmPlatformPeiBootAction):=0D
-+  adr  x10, NtFwConfigDtBlob=0D
-+  str  x0, [x10]=0D
-   ret=0D
- =0D
- //=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c b=
/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
-index c0effd37..2f753be7 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
-@@ -1,6 +1,6 @@
- /** @file=0D
- =0D
--  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>=0D
-+  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>=0D
- =0D
-   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- =0D
-@@ -8,8 +8,12 @@
- =0D
- #include <Library/ArmPlatformLib.h>=0D
- #include <Library/BaseLib.h>=0D
-+#include <NeoverseN1Soc.h>=0D
- #include <Ppi/ArmMpCoreInfo.h>=0D
- =0D
-+UINT64 NtFwConfigDtBlob;=0D
-+STATIC NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI mNtFwConfigDtInfoPpi;=0D
-+=0D
- STATIC ARM_CORE_INFO mCoreInfoTable[] =3D {=0D
-   { 0x0, 0x0 }, // Cluster 0, Core 0=0D
-   { 0x0, 0x1 }, // Cluster 0, Core 1=0D
-@@ -46,6 +50,7 @@ ArmPlatformInitialize (
-   IN     UINTN                  MpId=0D
-   )=0D
- {=0D
-+  mNtFwConfigDtInfoPpi.NtFwConfigDtAddr =3D NtFwConfigDtBlob;=0D
-   return RETURN_SUCCESS;=0D
- }=0D
- =0D
-@@ -80,6 +85,11 @@ EFI_PEI_PPI_DESCRIPTOR gPlatformPpiTable[] =3D {
-     EFI_PEI_PPI_DESCRIPTOR_PPI,=0D
-     &gArmMpCoreInfoPpiGuid,=0D
-     &mMpCoreInfoPpi=0D
-+  },=0D
-+  {=0D
-+    EFI_PEI_PPI_DESCRIPTOR_PPI,=0D
-+    &gNtFwConfigDtInfoPpiGuid,=0D
-+    &mNtFwConfigDtInfoPpi=0D
-   }=0D
- };=0D
- =0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-index 96e590cd..78f309c3 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-@@ -1,7 +1,7 @@
- ## @file=0D
- #  Platform Library for N1Sdp.=0D
- #=0D
--#  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>=0D
-+#  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -18,10 +18,14 @@
- [Packages]=0D
-   ArmPkg/ArmPkg.dec=0D
-   ArmPlatformPkg/ArmPlatformPkg.dec=0D
-+  EmbeddedPkg/EmbeddedPkg.dec=0D
-   MdeModulePkg/MdeModulePkg.dec=0D
-   MdePkg/MdePkg.dec=0D
-   Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec=0D
- =0D
-+[LibraryClasses]=0D
-+  FdtLib=0D
-+=0D
- [Sources.common]=0D
-   PlatformLibMem.c=0D
-   PlatformLib.c=0D
-@@ -59,7 +63,9 @@
-   gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress=0D
- =0D
- [Guids]=0D
-+  gArmNeoverseN1SocPlatformInfoDescriptorGuid=0D
-   gEfiHobListGuid          ## CONSUMES  ## SystemTable=0D
- =0D
- [Ppis]=0D
-   gArmMpCoreInfoPpiGuid=0D
-+  gNtFwConfigDtInfoPpiGuid=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index 339fa07b..1d53ec75 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-@@ -1,6 +1,6 @@
- /** @file=0D
- =0D
--  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
-+  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>=0D
- =0D
-   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- =0D
-@@ -10,11 +10,95 @@
- #include <Library/DebugLib.h>=0D
- #include <Library/HobLib.h>=0D
- #include <Library/MemoryAllocationLib.h>=0D
-+#include <Library/PeiServicesLib.h>=0D
-+#include <libfdt.h>=0D
- #include <NeoverseN1Soc.h>=0D
- =0D
- // The total number of descriptors, including the final "end-of-table" de=
scriptor.=0D
- #define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19=0D
- =0D
-+/** A helper function to locate the NtFwConfig PPI and get the base addre=
ss of=0D
-+  NT_FW_CONFIG DT from which values are obtained using FDT helper functio=
ns.=0D
-+=0D
-+  @param [out]  plat_info  Pointer to the NeoverseN1Soc PLATFORM_INFO HOB=
=0D
-+=0D
-+  @retval EFI_SUCCESS            Success.=0D
-+  returns EFI_INVALID_PARAMETER  A parameter is invalid.=0D
-+**/=0D
-+EFI_STATUS=0D
-+GetNeoverseN1SocPlatInfo (=0D
-+  OUT NEOVERSEN1SOC_PLAT_INFO *plat_info=0D
-+  )=0D
-+{=0D
-+  CONST UINT32                   *Property;=0D
-+  INT32                          Offset;=0D
-+  CONST VOID                     *NtFwCfgDtBlob;=0D
-+  NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI  *NtFwConfigInfoPpi;=0D
-+  EFI_STATUS                     Status;=0D
-+=0D
-+  Status =3D PeiServicesLocatePpi (=0D
-+             &gNtFwConfigDtInfoPpiGuid,=0D
-+             0,=0D
-+             NULL,=0D
-+             (VOID **)&NtFwConfigInfoPpi=0D
-+             );=0D
-+=0D
-+  if (EFI_ERROR (Status)) {=0D
-+    DEBUG ((=0D
-+      DEBUG_ERROR,=0D
-+      "PeiServicesLocatePpi failed with error %r\n",=0D
-+      Status=0D
-+      ));=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  NtFwCfgDtBlob =3D (VOID *)(UINTN)NtFwConfigInfoPpi->NtFwConfigDtAddr;=0D
-+  if (fdt_check_header (NtFwCfgDtBlob) !=3D 0) {=0D
-+    DEBUG ((DEBUG_ERROR, "Invalid DTB file %p passed\n", NtFwCfgDtBlob));=
=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  Offset =3D fdt_subnode_offset (NtFwCfgDtBlob, 0, "platform-info");=0D
-+  if (Offset =3D=3D -FDT_ERR_NOTFOUND) {=0D
-+    DEBUG ((DEBUG_ERROR, "Invalid DTB : platform-info node not found\n"))=
;=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "local-ddr-size", NULL=
);=0D
-+  if (Property =3D=3D NULL) {=0D
-+    DEBUG ((DEBUG_ERROR, "local-ddr-size property not found\n"));=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  plat_info->LocalDdrSize =3D fdt32_to_cpu (*Property);=0D
-+=0D
-+  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "remote-ddr-size", NUL=
L);=0D
-+  if (Property =3D=3D NULL) {=0D
-+    DEBUG ((DEBUG_ERROR, "remote-ddr-size property not found\n"));=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  plat_info->RemoteDdrSize =3D fdt32_to_cpu (*Property);=0D
-+=0D
-+  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "secondary-chip-count"=
, NULL);=0D
-+  if (Property =3D=3D NULL) {=0D
-+    DEBUG ((DEBUG_ERROR, "secondary-chip-count property not found\n"));=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  plat_info->SecondaryChipCount =3D fdt32_to_cpu (*Property);=0D
-+=0D
-+  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "multichip-mode", NULL=
);=0D
-+  if (Property =3D=3D NULL) {=0D
-+    DEBUG ((DEBUG_ERROR, "multichip-mode property not found\n"));=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  plat_info->MultichipMode =3D fdt32_to_cpu (*Property);=0D
-+=0D
-+  return EFI_SUCCESS;=0D
-+}=0D
-+=0D
- /**=0D
-   Returns the Virtual Memory Map of the platform.=0D
- =0D
-@@ -36,9 +120,24 @@ ArmPlatformGetVirtualMemoryMap (
-   NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;=0D
-   UINT64                        DramBlock2Size;=0D
-   UINT64                        RemoteDdrSize;=0D
-+  EFI_STATUS                    Status;=0D
- =0D
-   Index =3D 0;=0D
--  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-+=0D
-+  // Create platform info HOB=0D
-+  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)BuildGuidHob (=0D
-+                                        &gArmNeoverseN1SocPlatformInfoDes=
criptorGuid,=0D
-+                                        sizeof (NEOVERSEN1SOC_PLAT_INFO)=
=0D
-+                                        );=0D
-+=0D
-+  if (PlatInfo =3D=3D NULL) {=0D
-+    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));=0D
-+    ASSERT (FALSE);=0D
-+    return;=0D
-+  }=0D
-+=0D
-+  Status =3D GetNeoverseN1SocPlatInfo (PlatInfo);=0D
-+  ASSERT (Status =3D=3D 0);=0D
-   DramBlock2Size =3D ((UINT64)(PlatInfo->LocalDdrSize -=0D
-                              NEOVERSEN1SOC_DRAM_BLOCK1_SIZE / SIZE_1GB) *=
=0D
-                             (UINT64)SIZE_1GB);=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
-index d59f25a5..9e257ebd 100644
---- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-+++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-@@ -1,7 +1,7 @@
- ## @file=0D
- #  Describes the entire platform configuration.=0D
- #=0D
--#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
-+#  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -22,6 +22,8 @@
-   Include                        # Root include for the package=0D
- =0D
- [Guids.common]=0D
-+  # ARM NeoverseN1Soc Platform Info descriptor=0D
-+  gArmNeoverseN1SocPlatformInfoDescriptorGuid =3D { 0x095cb024, 0x1e00, 0=
x4d6f, { 0xaa, 0x34, 0x4a, 0xf8, 0xaf, 0x0e, 0xad, 0x99 } }=0D
-   gArmNeoverseN1SocTokenSpaceGuid =3D { 0xab93eb78, 0x60d7, 0x4099, { 0xa=
c, 0xeb, 0x6d, 0xb5, 0x02, 0x58, 0x7c, 0x24 } }=0D
- =0D
- [PcdsFixedAtBuild]=0D
-@@ -83,3 +85,6 @@
-   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x400000=
00000|UINT64|0x0000004F=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x400000=
00000|UINT64|0x00000050=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieSegmentNumber|2|UINT32|0x0=
0000051=0D
-+=0D
-+[Ppis]=0D
-+  gNtFwConfigDtInfoPpiGuid =3D  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 0xd=
0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform-ARM-N1=
Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0002-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
deleted file mode 100644
index cafc29909608..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform-ARM-N1Sdp-Mod=
ify-the-IRQ-ID-of-Debug-UART-a.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2ccb463274d0c04f1e3253194ea6eee80c31cb49 Mon Sep 17 00:00:00 2001
-From: Himanshu Sharma <Himanshu.Sharma@arm.com>
-Date: Mon, 30 May 2022 10:53:30 +0000
-Subject: [PATCH] Platform/ARM/N1Sdp: Modify the IRQ ID of Debug UART and
- routing it to IOFPGA UART1
-
-In DBG2 table, IRQ ID was set as 0 for the UART. This overwrote the
-IPI0 trigger method to "level", which prevented SGI0 to be enabled
-again after a CPU offline/online cycle.
-
-This patch fixes the above issue by assigning a reserved IRQ ID
-for the Debug UART, other than 0 and also routing it to use IOFPGA
-UART1 by unsharing it from currently using serial terminal.
-
-Upstream-Status: Pending
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: Himanshu Sharma <Himanshu.Sharma@arm.com>
-Change-Id: Ib35fecc57f1d8c496135c18dbebd0be0a4b76041
----
- .../ConfigurationManagerDxe/ConfigurationManager.c        | 2 +-
- Platform/ARM/N1Sdp/N1SdpPlatform.dsc                      | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
-index b11c0425..44046a00 100644
---- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
-@@ -320,7 +320,7 @@ EDKII_PLATFORM_REPOSITORY_INFO N1sdpRepositoryInfo =3D=
 {
-   // Debug Serial Port=0D
-   {=0D
-     FixedPcdGet64 (PcdSerialDbgRegisterBase),               // BaseAddres=
s=0D
--    0,                                                      // Interrupt =
-unused=0D
-+    250,                                                    // Interrupt =
(reserved)=0D
-     FixedPcdGet64 (PcdSerialDbgUartBaudRate),               // BaudRate=0D
-     FixedPcdGet32 (PcdSerialDbgUartClkInHz),                // Clock=0D
-     EFI_ACPI_DBG2_PORT_SUBTYPE_SERIAL_ARM_PL011_UART        // Port subty=
pe=0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dsc
-index d04b22d3..676ab677 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-@@ -4,7 +4,7 @@
- # This provides platform specific component descriptions and libraries th=
at=0D
- # conform to EFI/Framework standards.=0D
- #=0D
--# Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
-+# Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- # SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -136,9 +136,9 @@
-   gArmPlatformTokenSpaceGuid.PL011UartInterrupt|95=0D
- =0D
-   # PL011 Serial Debug UART (DBG2)=0D
--  gArmPlatformTokenSpaceGuid.PcdSerialDbgRegisterBase|gEfiMdeModulePkgTok=
enSpaceGuid.PcdSerialRegisterBase=0D
--  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartBaudRate|gEfiMdePkgTokenSpac=
eGuid.PcdUartDefaultBaudRate=0D
--  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartClkInHz|50000000=0D
-+  gArmPlatformTokenSpaceGuid.PcdSerialDbgRegisterBase|0x1C0A0000=0D
-+  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartBaudRate|115200=0D
-+  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartClkInHz|24000000=0D
- =0D
-   # SBSA Watchdog=0D
-   gArmTokenSpaceGuid.PcdGenericWatchdogEl2IntrNum|93=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0003-Silicon-ARM-Neo=
verseN1Soc-Enable-SCP-QSPI-flash-regi.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0003-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
deleted file mode 100644
index 264d262b2236..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0003-Silicon-ARM-NeoverseN1=
Soc-Enable-SCP-QSPI-flash-regi.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From e4b0fced6f3fd3c8ce5ab4d3aae97b880e7e07b0 Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Mon, 2 May 2022 17:43:17 +0530
-Subject: [PATCH] Silicon/ARM/NeoverseN1Soc: Enable SCP QSPI flash region
-
-Enable SCP QSPI flash region access by adding it in the PlatformLibMem
-
-Upstream-Status: Pending
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: I3ff832746ca94974ed72309eebe00e0024c47005
----
- Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h         | 4 ++++
- .../NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c    | 8 +++++++-
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h b/Silicon/A=
RM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-index 4966011e..c7219136 100644
---- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-+++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-@@ -41,6 +41,10 @@
- #define NEOVERSEN1SOC_EXP_PERIPH_BASE0               0x1C000000=0D
- #define NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ            0x1300000=0D
- =0D
-+// SCP QSPI flash device=0D
-+#define NEOVERSEN1SOC_SCP_QSPI_AHB_BASE              0x18000000=0D
-+#define NEOVERSEN1SOC_SCP_QSPI_AHB_SZ                0x2000000=0D
-+=0D
- /*=0D
-  * Platform information structure stored in Non-secure SRAM. Platform=0D
-  * information are passed from the trusted firmware with the below struct=
ure=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index 5cacd437..8bb94074 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-@@ -15,7 +15,7 @@
- #include <NeoverseN1Soc.h>=0D
- =0D
- // The total number of descriptors, including the final "end-of-table" de=
scriptor.=0D
--#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19=0D
-+#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 20=0D
- =0D
- /** A helper function to locate the NtFwConfig PPI and get the base addre=
ss of=0D
-   NT_FW_CONFIG DT from which values are obtained using FDT helper functio=
ns.=0D
-@@ -283,6 +283,12 @@ ArmPlatformGetVirtualMemoryMap (
-   VirtualMemoryTable[Index].Length          =3D NEOVERSEN1SOC_EXP_PERIPH_=
BASE0_SZ;=0D
-   VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
- =0D
-+  // SCP QSPI flash device=0D
-+  VirtualMemoryTable[++Index].PhysicalBase  =3D NEOVERSEN1SOC_SCP_QSPI_AH=
B_BASE;=0D
-+  VirtualMemoryTable[Index].VirtualBase     =3D NEOVERSEN1SOC_SCP_QSPI_AH=
B_BASE;=0D
-+  VirtualMemoryTable[Index].Length          =3D NEOVERSEN1SOC_SCP_QSPI_AH=
B_SZ;=0D
-+  VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
-+=0D
-   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
-     //Remote DDR (2GB)=0D
-     VirtualMemoryTable[++Index].PhysicalBase  =3D PcdGet64 (PcdExtMemoryS=
pace) +=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0004-Platform-ARM-N1=
Sdp-NOR-flash-library-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/files=
/n1sdp/0004-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
deleted file mode 100644
index eabbaf9976cc..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0004-Platform-ARM-N1Sdp-NOR=
-flash-library-for-N1Sdp.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 70e79ba5300f01a13422452c29e26c69042a0c8c Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Mon, 2 May 2022 18:50:08 +0530
-Subject: [PATCH] Platform/ARM/N1Sdp: NOR flash library for N1Sdp
-
-Add NOR flash library, this library provides APIs for getting the list
-of NOR flash devices on the platform.
-
-Upstream-Status: Pending
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: I39ad4143b7fad7e33b3b151a019a74f23e0ed441
----
- .../Library/NorFlashLib/NorFlashLib.c         | 52 +++++++++++++++++++
- .../Library/NorFlashLib/NorFlashLib.inf       | 36 +++++++++++++
- 2 files changed, 88 insertions(+)
- create mode 100644 Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlash=
Lib.c
- create mode 100644 Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlash=
Lib.inf
-
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.c b=
/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.c
-new file mode 100644
-index 00000000..eee3d1c6
---- /dev/null
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.c
-@@ -0,0 +1,52 @@
-+/** @file
-+  NOR flash lib for N1Sdp
-+
-+  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
-+
-+  SPDX-License-Identifier: BSD-2-Clause-Patent
-+
-+**/
-+
-+#include <Library/DebugLib.h>
-+#include <Library/IoLib.h>
-+#include <Library/NorFlashPlatformLib.h>
-+#include <NeoverseN1Soc.h>
-+#include <PiDxe.h>
-+
-+#define FW_ENV_REGION_BASE            FixedPcdGet32 (PcdFlashNvStorageVar=
iableBase)
-+#define FW_ENV_REGION_SIZE            (FixedPcdGet32 (PcdFlashNvStorageVa=
riableSize) + \
-+                                      FixedPcdGet32 (PcdFlashNvStorageFtw=
WorkingSize) + \
-+                                      FixedPcdGet32 (PcdFlashNvStorageFtw=
SpareSize))
-+
-+STATIC NOR_FLASH_DESCRIPTION mNorFlashDevices[] =3D {
-+  {
-+    /// Environment variable region
-+    NEOVERSEN1SOC_SCP_QSPI_AHB_BASE,                    ///< device base
-+    FW_ENV_REGION_BASE,                                 ///< region base
-+    FW_ENV_REGION_SIZE,                                 ///< region size
-+    SIZE_4KB,                                           ///< block size
-+  },
-+};
-+
-+/**
-+  Get NOR flash region info
-+
-+  @param[out]    NorFlashDevices    NOR flash regions info.
-+  @param[out]    Count              number of flash instance.
-+
-+  @retval        EFI_SUCCESS        Success.
-+**/
-+EFI_STATUS
-+NorFlashPlatformGetDevices (
-+  OUT NOR_FLASH_DESCRIPTION   **NorFlashDevices,
-+  OUT UINT32                  *Count
-+  )
-+{
-+  if ((NorFlashDevices =3D=3D NULL) || (Count =3D=3D NULL)) {
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  *NorFlashDevices =3D mNorFlashDevices;
-+  *Count =3D ARRAY_SIZE (mNorFlashDevices);
-+  return EFI_SUCCESS;
-+}
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf
-new file mode 100644
-index 00000000..784856c8
---- /dev/null
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf
-@@ -0,0 +1,36 @@
-+## @file
-+#  NOR flash lib for N1Sdp
-+#
-+#  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
-+#
-+#  SPDX-License-Identifier: BSD-2-Clause-Patent
-+#
-+##
-+
-+[Defines]
-+  INF_VERSION                    =3D 0x0001001B
-+  BASE_NAME                      =3D NorFlashN1SdpLib
-+  FILE_GUID                      =3D 7006fcf1-a585-4272-92e3-b286b1dff5bb
-+  MODULE_TYPE                    =3D DXE_DRIVER
-+  VERSION_STRING                 =3D 1.0
-+  LIBRARY_CLASS                  =3D NorFlashPlatformLib
-+
-+[Sources.common]
-+  NorFlashLib.c
-+
-+[Packages]
-+  MdeModulePkg/MdeModulePkg.dec
-+  MdePkg/MdePkg.dec
-+  Platform/ARM/ARM.dec
-+  Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-+
-+[LibraryClasses]
-+  BaseLib
-+  DebugLib
-+  IoLib
-+
-+[FixedPcd]
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0005-Platform-ARM-N1=
Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/fi=
les/n1sdp/0005-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
deleted file mode 100644
index 1db94e4948a8..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0005-Platform-ARM-N1Sdp-NOR=
-flash-Dxe-Driver-for-N1Sdp.patch
+++ /dev/null
@@ -1,2538 +0,0 @@
-From 726f4505970c82db1822b127059519044dc496c8 Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Mon, 2 May 2022 19:00:40 +0530
-Subject: [PATCH] Platform/ARM/N1Sdp: NOR flash Dxe Driver for N1Sdp
-
-Add NOR flash DXE driver, this brings up NV storage on
-QSPI's flash device using FVB protocol.
-
-Upstream-Status: Pending
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: Ica383c2be6d1805daa19afd98d28b943816218dd
----
- .../Drivers/CadenceQspiDxe/CadenceQspiDxe.c   | 366 +++++++
- .../Drivers/CadenceQspiDxe/CadenceQspiDxe.inf |  70 ++
- .../Drivers/CadenceQspiDxe/CadenceQspiReg.h   |  31 +
- .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c   | 930 ++++++++++++++++++
- .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h   | 484 +++++++++
- .../Drivers/CadenceQspiDxe/NorFlashFvb.c      | 573 +++++++++++
- Platform/ARM/N1Sdp/N1SdpPlatform.dec          |   5 +-
- 7 files changed, 2458 insertions(+), 1 deletion(-)
- create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiD=
xe.c
- create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiD=
xe.inf
- create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiR=
eg.h
- create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
- create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
- create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c
-
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.c b/=
Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.c
-new file mode 100644
-index 00000000..fb1dff3e
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.c
-@@ -0,0 +1,366 @@
-+/** @file
-+  NOR flash DXE
-+
-+  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
-+
-+  SPDX-License-Identifier: BSD-2-Clause-Patent
-+
-+**/
-+
-+#include <Library/BaseMemoryLib.h>
-+#include <Library/DxeServicesTableLib.h>
-+#include <Library/HobLib.h>
-+#include <Library/MemoryAllocationLib.h>
-+#include <Library/NorFlashInfoLib.h>
-+#include <Library/PcdLib.h>
-+#include <Library/UefiBootServicesTableLib.h>
-+#include <Library/UefiLib.h>
-+#include <Library/UefiRuntimeLib.h>
-+#include <Library/UefiRuntimeServicesTableLib.h>
-+
-+#include "NorFlash.h"
-+
-+STATIC NOR_FLASH_INSTANCE   **mNorFlashInstances;
-+STATIC UINT32               mNorFlashDeviceCount;
-+
-+STATIC EFI_EVENT mNorFlashVirtualAddrChangeEvent;
-+
-+/**
-+  Install Fv block onto variable store region
-+
-+  @param[in]   Instance         Instance of Nor flash variable region.
-+
-+  @retval      EFI_SUCCESS      The entry point is executed successfully.
-+**/
-+EFI_STATUS
-+EFIAPI
-+NorFlashFvbInitialize (
-+  IN NOR_FLASH_INSTANCE* Instance
-+  )
-+{
-+  EFI_STATUS      Status;
-+  UINT32          FvbNumLba;
-+  EFI_BOOT_MODE   BootMode;
-+  UINTN           RuntimeMmioRegionSize;
-+  UINTN           RuntimeMmioDeviceSize;
-+  UINTN           BlockSize;
-+
-+  DEBUG ((DEBUG_INFO,"NorFlashFvbInitialize\n"));
-+
-+  BlockSize =3D Instance->BlockSize;
-+
-+  // FirmwareVolumeHeader->FvLength is declared to have the Variable area
-+  // AND the FTW working area AND the FTW Spare contiguous.
-+  ASSERT (PcdGet32 (PcdFlashNvStorageVariableBase) +
-+         PcdGet32 (PcdFlashNvStorageVariableSize) =3D=3D
-+         PcdGet32 (PcdFlashNvStorageFtwWorkingBase));
-+  ASSERT (PcdGet32 (PcdFlashNvStorageFtwWorkingBase) +
-+         PcdGet32 (PcdFlashNvStorageFtwWorkingSize) =3D=3D
-+         PcdGet32 (PcdFlashNvStorageFtwSpareBase));
-+
-+  // Check if the size of the area is at least one block size.
-+  ASSERT ((PcdGet32 (PcdFlashNvStorageVariableSize) > 0) &&
-+         (PcdGet32 (PcdFlashNvStorageVariableSize) / BlockSize > 0));
-+  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwWorkingSize) > 0) &&
-+         (PcdGet32 (PcdFlashNvStorageFtwWorkingSize) / BlockSize > 0));
-+  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwSpareSize) > 0) &&
-+         (PcdGet32 (PcdFlashNvStorageFtwSpareSize) / BlockSize > 0));
-+
-+  // Ensure the Variable areas are aligned on block size boundaries.
-+  ASSERT ((PcdGet32 (PcdFlashNvStorageVariableBase) % BlockSize) =3D=3D 0=
);
-+  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwWorkingBase) % BlockSize) =3D=3D=
 0);
-+  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwSpareBase) % BlockSize) =3D=3D 0=
);
-+
-+  Instance->Initialized =3D TRUE;
-+  mFlashNvStorageVariableBase =3D FixedPcdGet32 (PcdFlashNvStorageVariabl=
eBase);
-+
-+  // Set the index of the first LBA for the FVB.
-+  Instance->StartLba =3D (PcdGet32 (PcdFlashNvStorageVariableBase) -
-+                        Instance->RegionBaseAddress) / BlockSize;
-+
-+  BootMode =3D GetBootModeHob ();
-+  if (BootMode =3D=3D BOOT_WITH_DEFAULT_SETTINGS) {
-+    Status =3D EFI_INVALID_PARAMETER;
-+  } else {
-+    // Determine if there is a valid header at the beginning of the NorFl=
ash.
-+    Status =3D ValidateFvHeader (Instance);
-+  }
-+
-+  // Install the Default FVB header if required.
-+  if (EFI_ERROR(Status)) {
-+    // There is no valid header, so time to install one.
-+    DEBUG ((DEBUG_INFO, "%a: The FVB Header is not valid.\n", __FUNCTION_=
_));
-+    DEBUG ((DEBUG_INFO, "%a: Installing a correct one for this volume.\n",
-+      __FUNCTION__));
-+
-+    // Erase all the NorFlash that is reserved for variable storage.
-+    FvbNumLba =3D (PcdGet32 (PcdFlashNvStorageVariableSize) +
-+                 PcdGet32 (PcdFlashNvStorageFtwWorkingSize) +
-+                 PcdGet32 (PcdFlashNvStorageFtwSpareSize)) /
-+                 Instance->BlockSize;
-+
-+    Status =3D FvbEraseBlocks (
-+               &Instance->FvbProtocol,
-+               (EFI_LBA)0,
-+               FvbNumLba,
-+               EFI_LBA_LIST_TERMINATOR
-+               );
-+    if (EFI_ERROR(Status)) {
-+      return Status;
-+    }
-+
-+    // Install all appropriate headers.
-+    Status =3D InitializeFvAndVariableStoreHeaders (Instance);
-+    if (EFI_ERROR(Status)) {
-+      return Status;
-+    }
-+
-+    // validate FV header again if FV was created successfully.
-+    Status =3D ValidateFvHeader (Instance);
-+    if (EFI_ERROR(Status)) {
-+      DEBUG ((DEBUG_ERROR, "ValidateFvHeader is failed \n"));
-+      return Status;
-+    }
-+  }
-+
-+  // The driver implementing the variable read service can now be dispatc=
hed;
-+  // the varstore headers are in place.
-+  Status =3D gBS->InstallProtocolInterface (
-+                  &gImageHandle,
-+                  &gEdkiiNvVarStoreFormattedGuid,
-+                  EFI_NATIVE_INTERFACE,
-+                  NULL
-+                  );
-+  if (EFI_ERROR (Status)) {
-+    DEBUG ((DEBUG_ERROR,
-+      "%a: Failed to install gEdkiiNvVarStoreFormattedGuid\n",
-+      __FUNCTION__));
-+    return Status;
-+  }
-+
-+  // Declare the Non-Volatile storage as EFI_MEMORY_RUNTIME.
-+  RuntimeMmioRegionSize =3D Instance->Size;
-+  RuntimeMmioDeviceSize =3D Instance->RegionBaseAddress - Instance->Devic=
eBaseAddress;
-+
-+  Status =3D gDS->AddMemorySpace (
-+                  EfiGcdMemoryTypeMemoryMappedIo,
-+                  Instance->RegionBaseAddress,
-+                  RuntimeMmioRegionSize,
-+                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
-+                  );
-+  ASSERT_EFI_ERROR (Status);
-+
-+  Status =3D gDS->AddMemorySpace (
-+                  EfiGcdMemoryTypeMemoryMappedIo,
-+                  Instance->DeviceBaseAddress,
-+                  RuntimeMmioDeviceSize,
-+                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
-+                  );
-+  ASSERT_EFI_ERROR (Status);
-+
-+  Status =3D gDS->SetMemorySpaceAttributes (
-+                  Instance->RegionBaseAddress,
-+                  RuntimeMmioRegionSize,
-+                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
-+                  );
-+  ASSERT_EFI_ERROR (Status);
-+
-+  Status =3D gDS->SetMemorySpaceAttributes (
-+                  Instance->DeviceBaseAddress,
-+                  RuntimeMmioDeviceSize,
-+                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
-+                  );
-+  ASSERT_EFI_ERROR (Status);
-+
-+  return Status;
-+}
-+
-+/**
-+  Fixup internal data so that EFI can be called in virtual mode.
-+  convert any pointers in lib to virtual mode.
-+
-+  @param[in]    Event   The Event that is being processed
-+  @param[in]    Context Event Context
-+**/
-+STATIC
-+VOID
-+EFIAPI
-+NorFlashVirtualNotifyEvent (
-+  IN EFI_EVENT        Event,
-+  IN VOID             *Context
-+  )
-+{
-+  UINTN Index;
-+
-+  EfiConvertPointer (0x0, (VOID**)&mFlashNvStorageVariableBase);
-+
-+  for (Index =3D 0; Index < mNorFlashDeviceCount; Index++) {
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->HostRegisterBaseAddress);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->DeviceBaseAddress);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->RegionBaseAddress);
-+
-+    // Convert Fvb.
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.EraseBlocks);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.GetAttributes);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.GetBlockSize);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.GetPhysicalAddress);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.Read);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.SetAttributes);
-+    EfiConvertPointer (0x0,
-+      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.Write);
-+
-+    if (mNorFlashInstances[Index]->ShadowBuffer !=3D NULL) {
-+      EfiConvertPointer (0x0, (VOID**)&mNorFlashInstances[Index]->ShadowB=
uffer);
-+    }
-+  }
-+}
-+
-+/**
-+  Entrypoint of Platform Nor flash DXE driver
-+
-+  @param[in]  ImageHandle       The firmware allocated handle for the EFI=
 image.
-+  @param[in]  SystemTable       A pointer to the EFI System Table.
-+
-+  @retval     EFI_SUCCESS       The entry point is executed successfully.
-+**/
-+EFI_STATUS
-+EFIAPI
-+NorFlashInitialise (
-+  IN EFI_HANDLE           ImageHandle,
-+  IN EFI_SYSTEM_TABLE     *SystemTable
-+  )
-+{
-+  EFI_STATUS              Status;
-+  EFI_PHYSICAL_ADDRESS    HostRegisterBaseAddress;
-+  UINT32                  Index;
-+  NOR_FLASH_DESCRIPTION*  NorFlashDevices;
-+  BOOLEAN                 ContainVariableStorage;
-+
-+  HostRegisterBaseAddress =3D PcdGet32 (PcdCadenceQspiDxeRegBaseAddress);
-+
-+  Status =3D gDS->AddMemorySpace (
-+                  EfiGcdMemoryTypeMemoryMappedIo,
-+                  HostRegisterBaseAddress,
-+                  SIZE_64KB,
-+                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
-+                  );
-+  ASSERT_EFI_ERROR (Status);
-+
-+  Status =3D gDS->SetMemorySpaceAttributes (
-+                  HostRegisterBaseAddress,
-+                  SIZE_64KB,
-+                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
-+                  );
-+  ASSERT_EFI_ERROR (Status);
-+
-+  // Initialize NOR flash instances.
-+  Status =3D NorFlashPlatformGetDevices (&NorFlashDevices, &mNorFlashDevi=
ceCount);
-+  if (EFI_ERROR (Status)) {
-+    DEBUG ((DEBUG_ERROR,"NorFlashInitialise: Fail to get Nor Flash device=
s\n"));
-+    return Status;
-+  }
-+
-+  mNorFlashInstances =3D AllocateRuntimePool (sizeof (NOR_FLASH_INSTANCE*=
) *
-+                                            mNorFlashDeviceCount);
-+
-+  if(mNorFlashInstances =3D=3D NULL) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NorFlashInitialise: Failed to allocate mem for NorFlashInstance\n"=
));
-+    return EFI_OUT_OF_RESOURCES;
-+  }
-+
-+  for (Index =3D 0; Index < mNorFlashDeviceCount; Index++) {
-+    // Check if this NOR Flash device contain the variable storage region.
-+    ContainVariableStorage =3D
-+        (NorFlashDevices[Index].RegionBaseAddress <=3D
-+         PcdGet32 (PcdFlashNvStorageVariableBase)) &&
-+        (PcdGet32 (PcdFlashNvStorageVariableBase) +
-+         PcdGet32 (PcdFlashNvStorageVariableSize) <=3D
-+        NorFlashDevices[Index].RegionBaseAddress + NorFlashDevices[Index]=
.Size);
-+
-+    Status =3D NorFlashCreateInstance (
-+               HostRegisterBaseAddress,
-+               NorFlashDevices[Index].DeviceBaseAddress,
-+               NorFlashDevices[Index].RegionBaseAddress,
-+               NorFlashDevices[Index].Size,
-+               Index,
-+               NorFlashDevices[Index].BlockSize,
-+               ContainVariableStorage,
-+               &mNorFlashInstances[Index]
-+               );
-+    if (EFI_ERROR (Status)) {
-+      DEBUG ((DEBUG_ERROR,
-+        "NorFlashInitialise: Fail to create instance for NorFlash[%d]\n",
-+        Index));
-+      continue;
-+    }
-+    Status =3D gBS->InstallMultipleProtocolInterfaces (
-+                    &mNorFlashInstances[Index]->Handle,
-+                    &gEfiDevicePathProtocolGuid,
-+                    &mNorFlashInstances[Index]->DevicePath,
-+                    &gEfiFirmwareVolumeBlockProtocolGuid,
-+                    &mNorFlashInstances[Index]->FvbProtocol,
-+                    NULL
-+                    );
-+    ASSERT_EFI_ERROR (Status);
-+  }
-+  // Register for the virtual address change event.
-+  Status =3D gBS->CreateEventEx (
-+                  EVT_NOTIFY_SIGNAL,
-+                  TPL_NOTIFY,
-+                  NorFlashVirtualNotifyEvent,
-+                  NULL,
-+                  &gEfiEventVirtualAddressChangeGuid,
-+                  &mNorFlashVirtualAddrChangeEvent
-+                  );
-+  ASSERT_EFI_ERROR (Status);
-+
-+  return Status;
-+}
-+
-+/**
-+  Lock all pending read/write to Nor flash device
-+
-+  @param[in]     Context     Nor flash device context structure.
-+**/
-+VOID
-+EFIAPI
-+NorFlashLock (
-+  IN NOR_FLASH_LOCK_CONTEXT    *Context
-+  )
-+{
-+  if (!EfiAtRuntime ()) {
-+    // Raise TPL to TPL_HIGH to stop anyone from interrupting us.
-+    Context->OriginalTPL =3D gBS->RaiseTPL (TPL_HIGH_LEVEL);
-+  } else {
-+    Context->InterruptsEnabled =3D SaveAndDisableInterrupts ();
-+  }
-+}
-+
-+/**
-+  Unlock all pending read/write to Nor flash device
-+
-+  @param[in]     Context     Nor flash device context structure.
-+**/
-+VOID
-+EFIAPI
-+NorFlashUnlock (
-+  IN NOR_FLASH_LOCK_CONTEXT    *Context
-+  )
-+{
-+  if (!EfiAtRuntime ()) {
-+    // Interruptions can resume.
-+    gBS->RestoreTPL (Context->OriginalTPL);
-+  } else if (Context->InterruptsEnabled) {
-+    SetInterruptState (TRUE);
-+  }
-+}
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf =
b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
-new file mode 100644
-index 00000000..4f20c3ba
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
-@@ -0,0 +1,70 @@
-+## @file
-+#  NOR flash DXE
-+#
-+#  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
-+#
-+#  SPDX-License-Identifier: BSD-2-Clause-Patent
-+#
-+##
-+
-+[Defines]
-+  INF_VERSION                    =3D 0x0001001B
-+  BASE_NAME                      =3D CadenceQspiDxe
-+  FILE_GUID                      =3D CC8A9713-4442-4A6C-B389-8B46490A0641
-+  MODULE_TYPE                    =3D DXE_RUNTIME_DRIVER
-+  VERSION_STRING                 =3D 0.1
-+  ENTRY_POINT                    =3D NorFlashInitialise
-+
-+[Sources]
-+  CadenceQspiDxe.c
-+  NorFlash.c
-+  NorFlash.h
-+  NorFlashFvb.c
-+
-+[Packages]
-+  EmbeddedPkg/EmbeddedPkg.dec
-+  MdeModulePkg/MdeModulePkg.dec
-+  MdePkg/MdePkg.dec
-+  Platform/ARM/ARM.dec
-+  Platform/ARM/N1Sdp/N1SdpPlatform.dec
-+
-+[LibraryClasses]
-+  BaseLib
-+  BaseMemoryLib
-+  DebugLib
-+  DevicePathLib
-+  DxeServicesTableLib
-+  HobLib
-+  IoLib
-+  MemoryAllocationLib
-+  NorFlashInfoLib
-+  NorFlashPlatformLib
-+  UefiBootServicesTableLib
-+  UefiDriverEntryPoint
-+  UefiLib
-+  UefiRuntimeLib
-+  UefiRuntimeServicesTableLib
-+
-+[Guids]
-+  gEdkiiNvVarStoreFormattedGuid
-+  gEfiAuthenticatedVariableGuid
-+  gEfiEventVirtualAddressChangeGuid
-+  gEfiSystemNvDataFvGuid
-+  gEfiVariableGuid
-+  gEfiGlobalVariableGuid
-+
-+[Protocols]
-+  gEfiDevicePathProtocolGuid
-+  gEfiFirmwareVolumeBlockProtocolGuid
-+
-+[FixedPcd]
-+  gArmN1SdpTokenSpaceGuid.PcdCadenceQspiDxeRegBaseAddress
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize
-+
-+[Depex]
-+  gEfiCpuArchProtocolGuid
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h b/=
Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
-new file mode 100644
-index 00000000..fe3b327c
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
-@@ -0,0 +1,31 @@
-+/** @file
-+
-+  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
-+
-+  SPDX-License-Identifier: BSD-2-Clause-Patent
-+
-+**/
-+
-+#ifndef CADENCE_QSPI_REG_H_
-+#define CADENCE_QSPI_REG_H_
-+
-+// QSPI Controller defines
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_OFFSET               0x90
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_EXECUTE              0x01
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_ENABLE          0x01
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BIT_POS         19
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS    16
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_STATUS_BIT           0x02
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_4B         0x03
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B         0x02
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS       24
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE          0x01
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_BYTE_3B         0x02
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READEN_BIT_POS       23
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS     20
-+
-+#define CDNS_QSPI_FLASH_CMD_READ_DATA_REG_OFFSET          0xA0
-+
-+#define CDNS_QSPI_FLASH_CMD_ADDR_REG_OFFSET               0x94
-+
-+#endif /* CADENCE_QSPI_REG_H_ */
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c b/Platfo=
rm/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
-new file mode 100644
-index 00000000..188c75e2
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
-@@ -0,0 +1,930 @@
-+/** @file
-+
-+  Copyright (c) 2023 ARM Limited. All rights reserved.<BR>
-+
-+  SPDX-License-Identifier: BSD-2-Clause-Patent
-+
-+**/
-+
-+#include <Library/BaseMemoryLib.h>
-+#include <Library/MemoryAllocationLib.h>
-+#include <Library/NorFlashInfoLib.h>
-+#include <Library/PcdLib.h>
-+#include <Library/UefiBootServicesTableLib.h>
-+#include <Library/UefiLib.h>
-+
-+#include "NorFlash.h"
-+
-+STATIC CONST NOR_FLASH_INSTANCE mNorFlashInstanceTemplate =3D {
-+  NOR_FLASH_SIGNATURE, // Signature
-+  NULL, // Handle
-+
-+  FALSE, // Initialized
-+  NULL, // Initialize
-+
-+  0, // HostRegisterBaseAddress
-+  0, // DeviceBaseAddress
-+  0, // RegionBaseAddress
-+  0, // Size
-+  0, // BlockSize
-+  0, // LastBlock
-+  0, // StartLba
-+  0, // OffsetLba
-+
-+  {
-+    FvbGetAttributes, // GetAttributes
-+    FvbSetAttributes, // SetAttributes
-+    FvbGetPhysicalAddress,  // GetPhysicalAddress
-+    FvbGetBlockSize,  // GetBlockSize
-+    FvbRead,  // Read
-+    FvbWrite, // Write
-+    FvbEraseBlocks, // EraseBlocks
-+    NULL, //ParentHandle
-+  }, //  FvbProtoccol;
-+  NULL, // ShadowBuffer
-+
-+  {
-+    {
-+      {
-+        HARDWARE_DEVICE_PATH,
-+        HW_VENDOR_DP,
-+        {
-+          (UINT8)(OFFSET_OF (NOR_FLASH_DEVICE_PATH, End)),
-+          (UINT8)(OFFSET_OF (NOR_FLASH_DEVICE_PATH, End) >> 8)
-+        }
-+      },
-+    { 0x0, 0x0, 0x0, { 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 } },
-+  },
-+  0,  // Index
-+
-+  {
-+    END_DEVICE_PATH_TYPE,
-+    END_ENTIRE_DEVICE_PATH_SUBTYPE,
-+    { sizeof (EFI_DEVICE_PATH_PROTOCOL), 0 }
-+  }
-+
-+  }, // DevicePath
-+  0 // Flags
-+};
-+
-+/**
-+  Execute Flash cmd ctrl and Read Status.
-+
-+  @param[in]      Instance         NOR flash Instance.
-+  @param[in]      Val              Value to be written to Flash cmd ctrl =
Register.
-+
-+  @retval         EFI_SUCCESS      Request is executed successfully.
-+
-+**/
-+STATIC
-+EFI_STATUS
-+CdnsQspiExecuteCommand (
-+  IN  NOR_FLASH_INSTANCE    *Instance,
-+  IN  UINT32                Val
-+  )
-+{
-+  // Set the command
-+  MmioWrite32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_CT=
RL_REG_OFFSET,
-+                Val);
-+  // Execute the command
-+  MmioWrite32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_CT=
RL_REG_OFFSET,
-+                Val | CDNS_QSPI_FLASH_CMD_CTRL_REG_EXECUTE);
-+
-+  // Wait until command has been executed
-+  while ((MmioRead32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH=
_CMD_CTRL_REG_OFFSET)
-+          & CDNS_QSPI_FLASH_CMD_CTRL_REG_STATUS_BIT) =3D=3D CDNS_QSPI_FLA=
SH_CMD_CTRL_REG_STATUS_BIT)
-+    continue;
-+
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  Create Nor flash Instance for given region.
-+
-+  @param[in]    HostRegisterBase      Base address of Nor flash controlle=
r.
-+  @param[in]    NorFlashDeviceBase    Base address of flash device.
-+  @param[in]    NorFlashRegionBase    Base address of flash region on dev=
ice.
-+  @param[in]    NorFlashSize          Size of flash region.
-+  @param[in]    Index                 Index of given flash region.
-+  @param[in]    BlockSize             Block size of NOR flash device.
-+  @param[in]    HasVarStore           Boolean set for VarStore on given r=
egion.
-+  @param[out]   NorFlashInstance      Instance of given flash region.
-+
-+  @retval       EFI_SUCCESS           On successful creation of NOR flash=
 instance.
-+**/
-+EFI_STATUS
-+NorFlashCreateInstance (
-+  IN UINTN                  HostRegisterBase,
-+  IN UINTN                  NorFlashDeviceBase,
-+  IN UINTN                  NorFlashRegionBase,
-+  IN UINTN                  NorFlashSize,
-+  IN UINT32                 Index,
-+  IN UINT32                 BlockSize,
-+  IN BOOLEAN                HasVarStore,
-+  OUT NOR_FLASH_INSTANCE**  NorFlashInstance
-+  )
-+{
-+  EFI_STATUS Status;
-+  NOR_FLASH_INSTANCE* Instance;
-+  NOR_FLASH_INFO *FlashInfo;
-+  UINT8 JedecId[3];
-+
-+  ASSERT(NorFlashInstance !=3D NULL);
-+  Instance =3D AllocateRuntimeCopyPool (sizeof (mNorFlashInstanceTemplate=
),
-+                                      &mNorFlashInstanceTemplate);
-+  if (Instance =3D=3D NULL) {
-+    return EFI_OUT_OF_RESOURCES;
-+  }
-+
-+  Instance->HostRegisterBaseAddress =3D HostRegisterBase;
-+  Instance->DeviceBaseAddress       =3D NorFlashDeviceBase;
-+  Instance->RegionBaseAddress       =3D NorFlashRegionBase;
-+  Instance->Size                    =3D NorFlashSize;
-+  Instance->BlockSize               =3D BlockSize;
-+  Instance->LastBlock               =3D (NorFlashSize / BlockSize) - 1;
-+
-+  Instance->OffsetLba =3D (NorFlashRegionBase - NorFlashDeviceBase) / Blo=
ckSize;
-+
-+  CopyGuid (&Instance->DevicePath.Vendor.Guid, &gEfiCallerIdGuid);
-+  Instance->DevicePath.Index =3D (UINT8)Index;
-+
-+  Status =3D NorFlashReadID (Instance, JedecId);
-+  if (EFI_ERROR (Status)) {
-+    goto FreeInstance;
-+  }
-+
-+  Status =3D NorFlashGetInfo (JedecId, &FlashInfo, TRUE);
-+  if (EFI_ERROR (Status)) {
-+    goto FreeInstance;
-+  }
-+
-+  NorFlashPrintInfo (FlashInfo);
-+
-+  Instance->Flags =3D 0;
-+  if (FlashInfo->Flags & NOR_FLASH_WRITE_FSR) {
-+    Instance->Flags =3D NOR_FLASH_POLL_FSR;
-+  }
-+
-+  Instance->ShadowBuffer =3D AllocateRuntimePool (BlockSize);
-+  if (Instance->ShadowBuffer =3D=3D NULL) {
-+    Status =3D EFI_OUT_OF_RESOURCES;
-+    goto FreeInstance;
-+  }
-+
-+  if (HasVarStore) {
-+    Instance->Initialize =3D NorFlashFvbInitialize;
-+  }
-+
-+  *NorFlashInstance =3D Instance;
-+  FreePool (FlashInfo);
-+  return EFI_SUCCESS;
-+
-+FreeInstance:
-+  FreePool (Instance);
-+  return Status;
-+}
-+
-+/**
-+  Check whether NOR flash opertions are Locked.
-+
-+  @param[in]     Instance         NOR flash Instance.
-+  @param[in]     BlockAddress     BlockAddress in NOR flash device.
-+
-+  @retval        FALSE            If NOR flash is not locked.
-+**/
-+STATIC
-+BOOLEAN
-+NorFlashBlockIsLocked (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN UINTN                  BlockAddress
-+  )
-+{
-+  return FALSE;
-+}
-+
-+/**
-+  Unlock NOR flash operations on given block.
-+
-+  @param[in]      Instance         NOR flash instance.
-+  @param[in]      BlockAddress     BlockAddress in NOR flash device.
-+
-+  @retval         EFI_SUCCESS      NOR flash operations is unlocked.
-+**/
-+STATIC
-+EFI_STATUS
-+NorFlashUnlockSingleBlock (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN UINTN                  BlockAddress
-+  )
-+{
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  Unlock NOR flash operations if it is necessary.
-+
-+  @param[in]      Instance         NOR flash instance.
-+  @param[in]      BlockAddress     BlockAddress in NOR flash device.
-+
-+  @retval         EFI_SUCCESS      Request is executed successfully.
-+**/
-+STATIC
-+EFI_STATUS
-+NorFlashUnlockSingleBlockIfNecessary (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN UINTN                  BlockAddress
-+  )
-+{
-+  EFI_STATUS Status;
-+
-+  Status =3D EFI_SUCCESS;
-+
-+  if (!NorFlashBlockIsLocked (Instance, BlockAddress)) {
-+    Status =3D NorFlashUnlockSingleBlock (Instance, BlockAddress);
-+  }
-+
-+  return Status;
-+}
-+
-+/**
-+  Enable write to NOR flash device.
-+
-+  @param[in]      Instance         NOR flash instance.
-+
-+  @retval         EFI_SUCCESS      Request is executed successfully.
-+**/
-+STATIC
-+EFI_STATUS
-+NorFlashEnableWrite (
-+  IN  NOR_FLASH_INSTANCE    *Instance
-+  )
-+{
-+
-+  UINT32          val;
-+
-+  DEBUG ((DEBUG_INFO, "NorFlashEnableWrite()\n"));
-+  val =3D (SPINOR_OP_WREN << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS);
-+  if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
-+    return EFI_DEVICE_ERROR;
-+  }
-+
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  The following function presumes that the block has already been unlocke=
d.
-+
-+  @param[in]      Instance         NOR flash instance.
-+  @param[in]      BlockAddress     Block address within the variable regi=
on.
-+
-+  @retval         EFI_SUCCESS      Request is executed successfully.
-+ **/
-+EFI_STATUS
-+NorFlashEraseSingleBlock (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN UINTN                  BlockAddress
-+  )
-+{
-+
-+  UINT32 DevConfigVal;
-+  UINT32 EraseOffset;
-+
-+  EraseOffset =3D 0x0;
-+
-+  DEBUG ((DEBUG_INFO, "NorFlashEraseSingleBlock(BlockAddress=3D0x%08x)\n",
-+    BlockAddress));
-+
-+  if (EFI_ERROR (NorFlashEnableWrite (Instance))) {
-+    return EFI_DEVICE_ERROR;
-+  }
-+
-+  EraseOffset =3D BlockAddress - Instance->DeviceBaseAddress;
-+
-+  MmioWrite32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_AD=
DR_REG_OFFSET,
-+                EraseOffset);
-+
-+  DevConfigVal =3D SPINOR_OP_BE_4K << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE=
_BIT_POS |
-+                 CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_ENABLE << CDNS_QSPI_FL=
ASH_CMD_CTRL_REG_ADDR_BIT_POS |
-+                 CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_F=
LASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS;
-+
-+  if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, DevConfigVal))) {
-+    return EFI_DEVICE_ERROR;
-+  }
-+
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  This function unlock and erase an entire NOR Flash block.
-+
-+  @param[in]     Instance       NOR flash Instance of variable store regi=
on.
-+  @param[in]     BlockAddress   Block address within the variable store r=
egion.
-+
-+  @retval        EFI_SUCCESS    The erase and unlock successfully complet=
ed.
-+**/
-+EFI_STATUS
-+NorFlashUnlockAndEraseSingleBlock (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN UINTN                  BlockAddress
-+  )
-+{
-+  EFI_STATUS              Status;
-+  UINTN                   Index;
-+  NOR_FLASH_LOCK_CONTEXT  Lock;
-+  NorFlashLock (&Lock);
-+
-+  Index =3D 0;
-+  do {
-+    // Unlock the block if we have to
-+    Status =3D NorFlashUnlockSingleBlockIfNecessary (Instance, BlockAddre=
ss);
-+    if (EFI_ERROR (Status)) {
-+      break;
-+    }
-+    Status =3D NorFlashEraseSingleBlock (Instance, BlockAddress);
-+    if (EFI_ERROR (Status)) {
-+      break;
-+    }
-+    Index++;
-+  } while ((Index < NOR_FLASH_ERASE_RETRY) && (Status =3D=3D EFI_WRITE_PR=
OTECTED));
-+
-+  if (Index =3D=3D NOR_FLASH_ERASE_RETRY) {
-+    DEBUG ((DEBUG_ERROR,
-+      "EraseSingleBlock(BlockAddress=3D0x%08x: Block Locked Error (try to=
 erase %d times)\n",
-+      BlockAddress,Index));
-+  }
-+
-+  NorFlashUnlock (&Lock);
-+
-+  return Status;
-+}
-+
-+/**
-+  Write a single word to given location.
-+
-+  @param[in]    Instance     NOR flash Instance of variable store region.
-+  @param[in]    WordAddress  The address in NOR flash to write given word.
-+  @param[in]    WriteData    The data to write into NOR flash location.
-+
-+  @retval       EFI_SUCCESS  The write is completed.
-+**/
-+STATIC
-+EFI_STATUS
-+NorFlashWriteSingleWord (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN UINTN                  WordAddress,
-+  IN UINT32                 WriteData
-+  )
-+{
-+  DEBUG ((DEBUG_INFO,
-+    "NorFlashWriteSingleWord(WordAddress=3D0x%08x, WriteData=3D0x%08x)\n",
-+    WordAddress, WriteData));
-+
-+  if (EFI_ERROR (NorFlashEnableWrite (Instance))) {
-+    return EFI_DEVICE_ERROR;
-+  }
-+  MmioWrite32 (WordAddress, WriteData);
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  Write a full block to given location.
-+
-+  @param[in]    Instance           NOR flash Instance of variable store r=
egion.
-+  @param[in]    Lba                The logical block address in NOR flash.
-+  @param[in]    DataBuffer         The data to write into NOR flash locat=
ion.
-+  @param[in]    BlockSizeInWords   The number of bytes to write.
-+
-+  @retval       EFI_SUCCESS        The write is completed.
-+**/
-+STATIC
-+EFI_STATUS
-+NorFlashWriteFullBlock (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN EFI_LBA                Lba,
-+  IN UINT32                 *DataBuffer,
-+  IN UINT32                 BlockSizeInWords
-+  )
-+{
-+  EFI_STATUS              Status;
-+  UINTN                   WordAddress;
-+  UINT32                  WordIndex;
-+  UINTN                   BlockAddress;
-+  NOR_FLASH_LOCK_CONTEXT  Lock;
-+
-+  Status =3D EFI_SUCCESS;
-+
-+  // Get the physical address of the block
-+  BlockAddress =3D GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lb=
a,
-+                   BlockSizeInWords * 4);
-+
-+  // Start writing from the first address at the start of the block
-+  WordAddress =3D BlockAddress;
-+
-+  NorFlashLock (&Lock);
-+
-+  Status =3D NorFlashUnlockAndEraseSingleBlock (Instance, BlockAddress);
-+  if (EFI_ERROR (Status)) {
-+    DEBUG ((DEBUG_ERROR,
-+      "WriteSingleBlock: ERROR - Failed to Unlock and Erase the single bl=
ock at 0x%X\n",
-+      BlockAddress));
-+    goto EXIT;
-+  }
-+
-+  for (WordIndex=3D0;
-+       WordIndex < BlockSizeInWords;
-+       WordIndex++, DataBuffer++, WordAddress +=3D 4) {
-+    Status =3D NorFlashWriteSingleWord (Instance, WordAddress, *DataBuffe=
r);
-+    if (EFI_ERROR (Status)) {
-+      goto EXIT;
-+    }
-+  }
-+
-+EXIT:
-+  NorFlashUnlock (&Lock);
-+
-+  if (EFI_ERROR (Status)) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NOR FLASH Programming [WriteSingleBlock] failed at address 0x%08x.=
 Exit Status =3D %r.\n",
-+      WordAddress, Status));
-+  }
-+  return Status;
-+}
-+
-+/**
-+  Write a full  block.
-+
-+  @param[in]    Instance           NOR flash Instance of variable store r=
egion.
-+  @param[in]    Lba                The starting logical block index.
-+  @param[in]    BufferSizeInBytes  The number of bytes to read.
-+  @param[in]    Buffer             The pointer to a caller-allocated buff=
er that
-+                                   contains the source for the write.
-+
-+  @retval       EFI_SUCCESS        The write is completed.
-+**/
-+EFI_STATUS
-+NorFlashWriteBlocks (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN EFI_LBA                Lba,
-+  IN UINTN                  BufferSizeInBytes,
-+  IN VOID                   *Buffer
-+  )
-+{
-+  UINT32          *pWriteBuffer;
-+  EFI_STATUS      Status;
-+  EFI_LBA         CurrentBlock;
-+  UINT32          BlockSizeInWords;
-+  UINT32          NumBlocks;
-+  UINT32          BlockCount;
-+
-+  Status =3D EFI_SUCCESS;
-+  // The buffer must be valid
-+  if (Buffer =3D=3D NULL) {
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  // We must have some bytes to read
-+  DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: BufferSizeInBytes=3D0x%x\n",
-+    BufferSizeInBytes));
-+  if (BufferSizeInBytes =3D=3D 0) {
-+    return EFI_BAD_BUFFER_SIZE;
-+  }
-+
-+  // The size of the buffer must be a multiple of the block size
-+  DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: BlockSize in bytes =3D0x%x\n",
-+    Instance->BlockSize));
-+  if ((BufferSizeInBytes % Instance->BlockSize) !=3D 0) {
-+    return EFI_BAD_BUFFER_SIZE;
-+  }
-+
-+  // All blocks must be within the device
-+  NumBlocks =3D ((UINT32)BufferSizeInBytes) / Instance->BlockSize;
-+
-+  DEBUG ((DEBUG_INFO,
-+    "NorFlashWriteBlocks: NumBlocks=3D%d, LastBlock=3D%ld, Lba=3D%ld.\n",=
 NumBlocks,
-+    Instance->LastBlock, Lba));
-+
-+  if ((Lba + NumBlocks) > (Instance->LastBlock + 1)) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NorFlashWriteBlocks: ERROR - Write will exceed last block.\n"));
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  ASSERT (((UINTN)Buffer % sizeof (UINT32)) =3D=3D 0);
-+
-+  BlockSizeInWords =3D Instance->BlockSize / 4;
-+
-+  // Because the target *Buffer is a pointer to VOID, we must put
-+  // all the data into a pointer to a proper data type, so use *ReadBuffer
-+  pWriteBuffer =3D (UINT32 *)Buffer;
-+
-+  CurrentBlock =3D Lba;
-+  for (BlockCount =3D 0;
-+       BlockCount < NumBlocks;
-+       BlockCount++, CurrentBlock++, pWriteBuffer +=3D BlockSizeInWords) {
-+
-+    DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: Writing block #%d\n",
-+      (UINTN)CurrentBlock));
-+
-+    Status =3D NorFlashWriteFullBlock (
-+               Instance,
-+               CurrentBlock,
-+               pWriteBuffer,
-+               BlockSizeInWords
-+               );
-+
-+    if (EFI_ERROR (Status)) {
-+      break;
-+    }
-+  }
-+
-+  DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: Exit Status =3D %r.\n", Statu=
s));
-+  return Status;
-+}
-+
-+/**
-+  Read a full  block.
-+
-+  @param[in]     Instance           NOR flash Instance of variable store =
region.
-+  @param[in]     Lba                The starting logical block index to r=
ead from.
-+  @param[in]     BufferSizeInBytes  The number of bytes to read.
-+  @param[out]    Buffer             The pointer to a caller-allocated buf=
fer that
-+                                    should be copied with read data.
-+
-+  @retval        EFI_SUCCESS        The read is completed.
-+**/
-+EFI_STATUS
-+NorFlashReadBlocks (
-+  IN NOR_FLASH_INSTANCE   *Instance,
-+  IN EFI_LBA              Lba,
-+  IN UINTN                BufferSizeInBytes,
-+  OUT VOID                *Buffer
-+  )
-+{
-+  UINT32              NumBlocks;
-+  UINTN               StartAddress;
-+  DEBUG ((DEBUG_INFO,
-+    "NorFlashReadBlocks: BufferSize=3D0x%xB BlockSize=3D0x%xB LastBlock=
=3D%ld, Lba=3D%ld.\n",
-+    BufferSizeInBytes, Instance->BlockSize, Instance->LastBlock,
-+    Lba));
-+
-+  // The buffer must be valid
-+  if (Buffer =3D=3D NULL) {
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  // Return if we do not have any byte to read
-+  if (BufferSizeInBytes =3D=3D 0) {
-+    return EFI_SUCCESS;
-+  }
-+
-+  // The size of the buffer must be a multiple of the block size
-+  if ((BufferSizeInBytes % Instance->BlockSize) !=3D 0) {
-+    return EFI_BAD_BUFFER_SIZE;
-+  }
-+
-+  NumBlocks =3D ((UINT32)BufferSizeInBytes) / Instance->BlockSize;
-+
-+  if ((Lba + NumBlocks) > (Instance->LastBlock + 1)) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NorFlashReadBlocks: ERROR - Read will exceed last block\n"));
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  // Get the address to start reading from
-+  StartAddress =3D GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lb=
a,
-+                                        Instance->BlockSize);
-+
-+  // Readout the data
-+  CopyMem(Buffer, (UINTN *)StartAddress, BufferSizeInBytes);
-+
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  Read from nor flash.
-+
-+  @param[in]     Instance           NOR flash Instance of variable store =
region.
-+  @param[in]     Lba                The starting logical block index to r=
ead from.
-+  @param[in]     Offset             Offset into the block at which to beg=
in reading.
-+  @param[in]     BufferSizeInBytes  The number of bytes to read.
-+  @param[out]    Buffer             The pointer to a caller-allocated buf=
fer that
-+                                    should copied with read data.
-+
-+  @retval        EFI_SUCCESS        The read is completed.
-+**/
-+EFI_STATUS
-+NorFlashRead (
-+  IN NOR_FLASH_INSTANCE   *Instance,
-+  IN EFI_LBA              Lba,
-+  IN UINTN                Offset,
-+  IN UINTN                BufferSizeInBytes,
-+  OUT VOID                *Buffer
-+  )
-+{
-+  UINTN  StartAddress;
-+  // The buffer must be valid
-+  if (Buffer =3D=3D NULL) {
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  // Return if we do not have any byte to read
-+  if (BufferSizeInBytes =3D=3D 0) {
-+    return EFI_SUCCESS;
-+  }
-+
-+  if (((Lba * Instance->BlockSize) + Offset + BufferSizeInBytes) >
-+      Instance->Size) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NorFlashRead: ERROR - Read will exceed device size.\n"));
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  // Get the address to start reading from
-+  StartAddress =3D GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lb=
a,
-+                                        Instance->BlockSize);
-+
-+  // Readout the data
-+  CopyMem (Buffer, (UINTN *)(StartAddress + Offset), BufferSizeInBytes);
-+
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  Write a full or portion of a block.
-+
-+  @param[in]         Instance     NOR flash Instance of variable store re=
gion.
-+  @param[in]         Lba          The starting logical block index to wri=
te to.
-+  @param[in]         Offset       Offset into the block at which to begin=
 writing.
-+  @param[in, out]    NumBytes     The total size of the buffer.
-+  @param[in]         Buffer       The pointer to a caller-allocated buffe=
r that
-+                                  contains the source for the write.
-+
-+  @retval            EFI_SUCCESS  The write is completed.
-+**/
-+EFI_STATUS
-+NorFlashWriteSingleBlock (
-+  IN        NOR_FLASH_INSTANCE   *Instance,
-+  IN        EFI_LBA               Lba,
-+  IN        UINTN                 Offset,
-+  IN OUT    UINTN                *NumBytes,
-+  IN        UINT8                *Buffer
-+  )
-+{
-+  EFI_STATUS  Status;
-+  UINT32      Tmp;
-+  UINT32      TmpBuf;
-+  UINT32      WordToWrite;
-+  UINT32      Mask;
-+  BOOLEAN     DoErase;
-+  UINTN       BytesToWrite;
-+  UINTN       CurOffset;
-+  UINTN       WordAddr;
-+  UINTN       BlockSize;
-+  UINTN       BlockAddress;
-+  UINTN       PrevBlockAddress;
-+
-+  if (Buffer =3D=3D NULL) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NorFlashWriteSingleBlock: ERROR - Buffer is invalid\n" ));
-+    return EFI_OUT_OF_RESOURCES;
-+  }
-+
-+  PrevBlockAddress =3D 0;
-+  if (!Instance->Initialized && Instance->Initialize) {
-+    Instance->Initialize(Instance);
-+  }
-+
-+  DEBUG ((DEBUG_INFO,
-+    "NorFlashWriteSingleBlock(Parameters: Lba=3D%ld, Offset=3D0x%x, *NumB=
ytes=3D0x%x, Buffer @ 0x%08x)\n",
-+    Lba, Offset, *NumBytes, Buffer));
-+
-+  // Localise the block size to avoid de-referencing pointers all the time
-+  BlockSize =3D Instance->BlockSize;
-+
-+  // The write must not span block boundaries.
-+  // We need to check each variable individually because adding two large
-+  // values together overflows.
-+  if (Offset               >=3D BlockSize ||
-+      *NumBytes            >  BlockSize ||
-+      (Offset + *NumBytes) >  BlockSize) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NorFlashWriteSingleBlock: ERROR - EFI_BAD_BUFFER_SIZE: (Offset=3D0=
x%x + NumBytes=3D0x%x) > BlockSize=3D0x%x\n",
-+      Offset, *NumBytes, BlockSize ));
-+    return EFI_BAD_BUFFER_SIZE;
-+  }
-+
-+  // We must have some bytes to write
-+  if (*NumBytes =3D=3D 0) {
-+    DEBUG ((DEBUG_ERROR,
-+      "NorFlashWriteSingleBlock: ERROR - EFI_BAD_BUFFER_SIZE: (Offset=3D0=
x%x + NumBytes=3D0x%x) > BlockSize=3D0x%x\n",
-+      Offset, *NumBytes, BlockSize ));
-+    return EFI_BAD_BUFFER_SIZE;
-+  }
-+
-+  // Pick 128bytes as a good start for word operations as opposed to eras=
ing the
-+  // block and writing the data regardless if an erase is really needed.
-+  // It looks like most individual NV variable writes are smaller than 12=
8bytes.
-+  if (*NumBytes <=3D 128) {
-+    // Check to see if we need to erase before programming the data into =
NOR.
-+    // If the destination bits are only changing from 1s to 0s we can jus=
t write.
-+    // After a block is erased all bits in the block is set to 1.
-+    // If any byte requires us to erase we just give up and rewrite all o=
f it.
-+    DoErase      =3D FALSE;
-+    BytesToWrite =3D *NumBytes;
-+    CurOffset    =3D Offset;
-+
-+    while (BytesToWrite > 0) {
-+      // Read full word from NOR, splice as required. A word is the small=
est
-+      // unit we can write.
-+      Status =3D NorFlashRead (
-+                 Instance,
-+                 Lba,
-+                 CurOffset & ~(0x3),
-+                 sizeof(Tmp),
-+                 &Tmp
-+                 );
-+      if (EFI_ERROR (Status)) {
-+        return EFI_DEVICE_ERROR;
-+      }
-+
-+      // Physical address of word in NOR to write.
-+      WordAddr =3D (CurOffset & ~(0x3)) +
-+                 GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lba,
-+                   BlockSize);
-+
-+      // The word of data that is to be written.
-+      TmpBuf =3D ReadUnaligned32 ((UINT32 *)(Buffer + (*NumBytes - BytesT=
oWrite)));
-+
-+      // First do word aligned chunks.
-+      if ((CurOffset & 0x3) =3D=3D 0) {
-+        if (BytesToWrite >=3D 4) {
-+          // Is the destination still in 'erased' state?
-+          if (~Tmp !=3D 0) {
-+            // Check to see if we are only changing bits to zero.
-+            if ((Tmp ^ TmpBuf) & TmpBuf) {
-+              DoErase =3D TRUE;
-+              break;
-+            }
-+          }
-+          // Write this word to NOR
-+          WordToWrite =3D TmpBuf;
-+          CurOffset +=3D sizeof(TmpBuf);
-+          BytesToWrite -=3D sizeof(TmpBuf);
-+        } else {
-+          // BytesToWrite < 4. Do small writes and left-overs
-+          Mask =3D ~((~0) << (BytesToWrite * 8));
-+          // Mask out the bytes we want.
-+          TmpBuf &=3D Mask;
-+          // Is the destination still in 'erased' state?
-+          if ((Tmp & Mask) !=3D Mask) {
-+            // Check to see if we are only changing bits to zero.
-+            if ((Tmp ^ TmpBuf) & TmpBuf) {
-+              DoErase =3D TRUE;
-+              break;
-+            }
-+          }
-+          // Merge old and new data. Write merged word to NOR
-+          WordToWrite =3D (Tmp & ~Mask) | TmpBuf;
-+          CurOffset +=3D BytesToWrite;
-+          BytesToWrite =3D 0;
-+        }
-+      } else {
-+        // Do multiple words, but starting unaligned.
-+        if (BytesToWrite > (4 - (CurOffset & 0x3))) {
-+          Mask =3D ((~0) << ((CurOffset & 0x3) * 8));
-+          // Mask out the bytes we want.
-+          TmpBuf &=3D Mask;
-+          // Is the destination still in 'erased' state?
-+          if ((Tmp & Mask) !=3D Mask) {
-+            // Check to see if we are only changing bits to zero.
-+            if ((Tmp ^ TmpBuf) & TmpBuf) {
-+              DoErase =3D TRUE;
-+              break;
-+            }
-+          }
-+          // Merge old and new data. Write merged word to NOR
-+          WordToWrite =3D (Tmp & ~Mask) | TmpBuf;
-+          BytesToWrite -=3D (4 - (CurOffset & 0x3));
-+          CurOffset +=3D (4 - (CurOffset & 0x3));
-+        } else {
-+          // Unaligned and fits in one word.
-+          Mask =3D (~((~0) << (BytesToWrite * 8))) << ((CurOffset & 0x3) =
* 8);
-+          // Mask out the bytes we want.
-+          TmpBuf =3D (TmpBuf << ((CurOffset & 0x3) * 8)) & Mask;
-+          // Is the destination still in 'erased' state?
-+          if ((Tmp & Mask) !=3D Mask) {
-+            // Check to see if we are only changing bits to zero.
-+            if ((Tmp ^ TmpBuf) & TmpBuf) {
-+              DoErase =3D TRUE;
-+              break;
-+            }
-+          }
-+          // Merge old and new data. Write merged word to NOR
-+          WordToWrite =3D (Tmp & ~Mask) | TmpBuf;
-+          CurOffset +=3D BytesToWrite;
-+          BytesToWrite =3D 0;
-+        }
-+      }
-+
-+      BlockAddress =3D GET_NOR_BLOCK_ADDRESS (
-+                       Instance->RegionBaseAddress,
-+                       Lba,
-+                       BlockSize
-+                       );
-+      if (BlockAddress !=3D PrevBlockAddress) {
-+        Status =3D NorFlashUnlockSingleBlockIfNecessary (Instance, BlockA=
ddress);
-+        if (EFI_ERROR (Status)) {
-+          return EFI_DEVICE_ERROR;
-+        }
-+        PrevBlockAddress =3D BlockAddress;
-+      }
-+      Status =3D NorFlashWriteSingleWord (Instance, WordAddr, WordToWrite=
);
-+      if (EFI_ERROR (Status)) {
-+        return EFI_DEVICE_ERROR;
-+      }
-+    }
-+    // Exit if we got here and could write all the data. Otherwise do the
-+    // Erase-Write cycle.
-+    if (!DoErase) {
-+      return EFI_SUCCESS;
-+    }
-+  }
-+
-+  // Check we did get some memory. Buffer is BlockSize.
-+  if (Instance->ShadowBuffer =3D=3D NULL) {
-+    DEBUG ((DEBUG_ERROR, "FvbWrite: ERROR - Buffer not ready\n"));
-+    return EFI_DEVICE_ERROR;
-+  }
-+
-+  // Read NOR Flash data into shadow buffer
-+  Status =3D NorFlashReadBlocks (
-+             Instance,
-+             Lba,
-+             BlockSize,
-+             Instance->ShadowBuffer
-+             );
-+  if (EFI_ERROR (Status)) {
-+    // Return one of the pre-approved error statuses
-+    return EFI_DEVICE_ERROR;
-+  }
-+
-+  // Put the data at the appropriate location inside the buffer area
-+  CopyMem ((VOID*)((UINTN)Instance->ShadowBuffer + Offset), Buffer, *NumB=
ytes);
-+
-+  // Write the modified buffer back to the NorFlash
-+  Status =3D NorFlashWriteBlocks (
-+             Instance,
-+             Lba,
-+             BlockSize,
-+             Instance->ShadowBuffer
-+             );
-+  if (EFI_ERROR (Status)) {
-+    // Return one of the pre-approved error statuses
-+    return EFI_DEVICE_ERROR;
-+  }
-+
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+  Read JEDEC ID of NOR flash device.
-+
-+  @param[in]     Instance     NOR flash Instance of variable store region.
-+  @param[out]    JedecId      JEDEC ID of NOR flash device.
-+
-+  @retval        EFI_SUCCESS  The write is completed.
-+**/
-+EFI_STATUS
-+NorFlashReadID (
-+  IN  NOR_FLASH_INSTANCE  *Instance,
-+  OUT UINT8               JedecId[3]
-+  )
-+{
-+  UINT32 val;
-+  if (Instance =3D=3D NULL || JedecId =3D=3D NULL) {
-+    return EFI_INVALID_PARAMETER;
-+  }
-+
-+  val =3D SPINOR_OP_RDID << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
-+        CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE << CDNS_QSPI_FLASH_CMD_C=
TRL_REG_READEN_BIT_POS |
-+        CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_FLASH_CMD_=
CTRL_REG_READBYTE_BIT_POS;
-+
-+  if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
-+    return EFI_DEVICE_ERROR;
-+  }
-+
-+  val =3D MmioRead32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH=
_CMD_READ_DATA_REG_OFFSET);
-+
-+  // Manu.ID field
-+  JedecId[0] =3D (UINT8) val;
-+  // Type field
-+  JedecId[1] =3D (UINT8) (val >> 8);
-+  // Capacity field
-+  JedecId[2] =3D (UINT8) (val >> 16);
-+
-+  DEBUG ((DEBUG_INFO,
-+    "Nor flash detected, Jedec ID, Manu.Id=3D%x Type=3D%x Capacity=3D%x \=
n",
-+    JedecId[0],JedecId[1],JedecId[2]));
-+
-+  return EFI_SUCCESS;
-+}
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h b/Platfo=
rm/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
-new file mode 100644
-index 00000000..e720937e
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
-@@ -0,0 +1,484 @@
-+/** @file
-+
-+  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
-+
-+  SPDX-License-Identifier: BSD-2-Clause-Patent
-+
-+**/
-+
-+#ifndef NOR_FLASH_DXE_H_
-+#define NOR_FLASH_DXE_H_
-+
-+#include <Guid/EventGroup.h>
-+#include <Library/DebugLib.h>
-+#include <Library/IoLib.h>
-+#include <Library/NorFlashPlatformLib.h>
-+#include <PiDxe.h>
-+#include <Protocol/BlockIo.h>
-+#include <Protocol/DiskIo.h>
-+#include <Protocol/FirmwareVolumeBlock.h>
-+
-+#include "CadenceQspiReg.h"
-+
-+#define NOR_FLASH_ERASE_RETRY                     10
-+
-+#define GET_NOR_BLOCK_ADDRESS(BaseAddr, Lba, LbaSize) \
-+                                      ((BaseAddr) + (UINTN)((Lba) * (LbaS=
ize)))
-+
-+#define NOR_FLASH_SIGNATURE          SIGNATURE_32('S', 'n', 'o', 'r')
-+#define INSTANCE_FROM_FVB_THIS(a)    CR(a, NOR_FLASH_INSTANCE, FvbProtoco=
l, \
-+                                        NOR_FLASH_SIGNATURE)
-+
-+#define NOR_FLASH_POLL_FSR      BIT0
-+
-+typedef struct _NOR_FLASH_INSTANCE                NOR_FLASH_INSTANCE;
-+
-+typedef EFI_STATUS (*NOR_FLASH_INITIALIZE)        (NOR_FLASH_INSTANCE* In=
stance);
-+
-+#pragma pack(1)
-+typedef struct {
-+  VENDOR_DEVICE_PATH                  Vendor;
-+  UINT8                               Index;
-+  EFI_DEVICE_PATH_PROTOCOL            End;
-+} NOR_FLASH_DEVICE_PATH;
-+#pragma pack()
-+
-+struct _NOR_FLASH_INSTANCE {
-+  UINT32                              Signature;
-+  EFI_HANDLE                          Handle;
-+
-+  BOOLEAN                             Initialized;
-+  NOR_FLASH_INITIALIZE                Initialize;
-+
-+  UINTN                               HostRegisterBaseAddress;
-+  UINTN                               DeviceBaseAddress;
-+  UINTN                               RegionBaseAddress;
-+  UINTN                               Size;
-+  UINTN                               BlockSize;
-+  UINTN                               LastBlock;
-+  EFI_LBA                             StartLba;
-+  EFI_LBA                             OffsetLba;
-+
-+  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL FvbProtocol;
-+  VOID*                               ShadowBuffer;
-+
-+  NOR_FLASH_DEVICE_PATH               DevicePath;
-+
-+  UINT32                              Flags;
-+};
-+
-+typedef struct {
-+  EFI_TPL         OriginalTPL;
-+  BOOLEAN         InterruptsEnabled;
-+} NOR_FLASH_LOCK_CONTEXT;
-+
-+/**
-+  Lock all pending read/write to Nor flash device
-+
-+  @param[in]     Context     Nor flash device context structure.
-+**/
-+VOID
-+EFIAPI
-+NorFlashLock (
-+  IN NOR_FLASH_LOCK_CONTEXT    *Context
-+  );
-+
-+/**
-+  Unlock all pending read/write to Nor flash device
-+
-+  @param[in]     Context     Nor flash device context structure.
-+**/
-+VOID
-+EFIAPI
-+NorFlashUnlock (
-+  IN NOR_FLASH_LOCK_CONTEXT    *Context
-+  );
-+
-+extern UINTN     mFlashNvStorageVariableBase;
-+
-+/**
-+  Create Nor flash Instance for given region.
-+
-+  @param[in]    HostRegisterBase      Base address of Nor flash controlle=
r.
-+  @param[in]    NorFlashDeviceBase    Base address of flash device.
-+  @param[in]    NorFlashRegionBase    Base address of flash region on dev=
ice.
-+  @param[in]    NorFlashSize          Size of flash region.
-+  @param[in]    Index                 Index of given flash region.
-+  @param[in]    BlockSize             Block size of NOR flash device.
-+  @param[in]    HasVarStore           Boolean set for VarStore on given r=
egion.
-+  @param[out]   NorFlashInstance      Instance of given flash region.
-+
-+  @retval       EFI_SUCCESS           On successful creation of NOR flash=
 instance.
-+**/
-+EFI_STATUS
-+NorFlashCreateInstance (
-+  IN UINTN                  HostRegisterBase,
-+  IN UINTN                  NorFlashDeviceBase,
-+  IN UINTN                  NorFlashRegionBase,
-+  IN UINTN                  NorFlashSize,
-+  IN UINT32                 Index,
-+  IN UINT32                 BlockSize,
-+  IN BOOLEAN                HasVarStore,
-+  OUT NOR_FLASH_INSTANCE**  NorFlashInstance
-+  );
-+
-+/**
-+  Install Fv block on to variable store region
-+
-+  @param[in]   Instance         Instance of Nor flash variable region.
-+
-+  @retval      EFI_SUCCESS      The entry point is executed successfully.
-+**/
-+EFI_STATUS
-+EFIAPI
-+NorFlashFvbInitialize (
-+  IN NOR_FLASH_INSTANCE* Instance
-+  );
-+
-+/**
-+  Check the integrity of firmware volume header.
-+
-+  @param[in]  Instance        Instance of Nor flash variable region.
-+
-+  @retval     EFI_SUCCESS     The firmware volume is consistent.
-+  @retval     EFI_NOT_FOUND   The firmware volume has been corrupted.
-+
-+**/
-+EFI_STATUS
-+ValidateFvHeader (
-+  IN  NOR_FLASH_INSTANCE *Instance
-+  );
-+
-+/**
-+  Initialize the FV Header and Variable Store Header
-+  to support variable operations.
-+
-+  @param[in]  Instance      Location to Initialize the headers
-+
-+  @retval     EFI_SUCCESS   Fv init is done
-+
-+**/
-+EFI_STATUS
-+InitializeFvAndVariableStoreHeaders (
-+  IN NOR_FLASH_INSTANCE *Instance
-+  );
-+
-+/**
-+ Retrieves the attributes and current settings of the block.
-+
-+ @param[in]   This         Indicates the EFI_FIRMWARE_VOLUME_BLOCK2_PROTO=
COL instance.
-+
-+ @param[out]  Attributes   Pointer to EFI_FVB_ATTRIBUTES_2 in which the a=
ttributes and
-+                           current settings are returned.
-+                           Type EFI_FVB_ATTRIBUTES_2 is defined in
-+                           EFI_FIRMWARE_VOLUME_HEADER.
-+
-+ @retval      EFI_SUCCESS  The firmware volume attributes were returned.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbGetAttributes(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
-+  OUT       EFI_FVB_ATTRIBUTES_2                    *Attributes
-+  );
-+
-+/**
-+ Sets configurable firmware volume attributes and returns the
-+ new settings of the firmware volume.
-+
-+
-+ @param[in]         This                     EFI_FIRMWARE_VOLUME_BLOCK2_P=
ROTOCOL instance.
-+
-+ @param[in, out]    Attributes               On input, Attributes is a po=
inter to
-+                                             EFI_FVB_ATTRIBUTES_2 that co=
ntains the desired
-+                                             firmware volume settings.
-+                                             On successful return, it con=
tains the new
-+                                             settings of the firmware vol=
ume.
-+
-+ @retval            EFI_UNSUPPORTED          The firmware volume attribut=
es are not supported.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbSetAttributes(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
-+  IN OUT    EFI_FVB_ATTRIBUTES_2                    *Attributes
-+  );
-+
-+/**
-+ Retrieves the base address of a memory-mapped firmware volume.
-+ This function should be called only for memory-mapped firmware volumes.
-+
-+ @param[in]     This               EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL in=
stance.
-+
-+ @param[out]    Address            Pointer to a caller-allocated
-+                                   EFI_PHYSICAL_ADDRESS that, on successf=
ul
-+                                   return from GetPhysicalAddress(), cont=
ains the
-+                                   base address of the firmware volume.
-+
-+ @retval        EFI_SUCCESS        The firmware volume base address was r=
eturned.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbGetPhysicalAddress(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
-+  OUT       EFI_PHYSICAL_ADDRESS                    *Address
-+  );
-+
-+/**
-+ Retrieves the size of the requested block.
-+ It also returns the number of additional blocks with the identical size.
-+ The GetBlockSize() function is used to retrieve the block map
-+ (see EFI_FIRMWARE_VOLUME_HEADER).
-+
-+
-+ @param[in]     This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTO=
COL instance.
-+
-+ @param[in]     Lba                      Indicates the block whose size t=
o return
-+
-+ @param[out]    BlockSize                Pointer to a caller-allocated UI=
NTN in which
-+                                         the size of the block is returne=
d.
-+
-+ @param[out]    NumberOfBlocks           Pointer to a caller-allocated UI=
NTN in
-+                                         which the number of consecutive =
blocks,
-+                                         starting with Lba, is returned. =
All
-+                                         blocks in this range have a size=
 of
-+                                         BlockSize.
-+
-+ @retval        EFI_SUCCESS              The firmware volume base address=
 was returned.
-+
-+ @retval        EFI_INVALID_PARAMETER    The requested LBA is out of rang=
e.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbGetBlockSize(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
-+  IN        EFI_LBA                                 Lba,
-+  OUT       UINTN                                   *BlockSize,
-+  OUT       UINTN                                   *NumberOfBlocks
-+  );
-+
-+/**
-+ Reads the specified number of bytes into a buffer from the specified blo=
ck.
-+
-+ The Read() function reads the requested number of bytes from the
-+ requested block and stores them in the provided buffer.
-+
-+ @param[in]       This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCO=
L instance.
-+
-+ @param[in]       Lba                  The starting logical block index f=
rom which to read
-+
-+ @param[in]       Offset               Offset into the block at which to =
begin reading.
-+
-+ @param[in, out]  NumBytes             Pointer to a UINTN.
-+                                       At entry, *NumBytes contains the t=
otal size of the
-+                                       buffer. *NumBytes should have a no=
n zero value.
-+                                       At exit, *NumBytes contains the to=
tal number of
-+                                       bytes read.
-+
-+ @param[in out]   Buffer               Pointer to a caller-allocated buff=
er that will be
-+                                       used to hold the data that is read.
-+
-+ @retval          EFI_SUCCESS          The firmware volume was read succe=
ssfully, and
-+                                       contents are in Buffer.
-+
-+ @retval          EFI_BAD_BUFFER_SIZE  Read attempted across an LBA bound=
ary.
-+
-+ @retval          EFI_DEVICE_ERROR     The block device is not functionin=
g correctly and
-+                                       could not be read.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbRead(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
-+  IN        EFI_LBA                                 Lba,
-+  IN        UINTN                                   Offset,
-+  IN OUT    UINTN                                   *NumBytes,
-+  IN OUT    UINT8                                   *Buffer
-+  );
-+
-+/**
-+ Writes the specified number of bytes from the input buffer to the block.
-+
-+ @param[in]        This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOC=
OL instance.
-+
-+ @param[in]        Lba                  The starting logical block index =
to write to.
-+
-+ @param[in]        Offset               Offset into the block at which to=
 begin writing.
-+
-+ @param[in, out]   NumBytes             The pointer to a UINTN.
-+                                        At entry, *NumBytes contains the =
total size of the
-+                                        buffer.
-+                                        At exit, *NumBytes contains the t=
otal number of
-+                                        bytes actually written.
-+
-+ @param[in]        Buffer               The pointer to a caller-allocated=
 buffer that
-+                                        contains the source for the write.
-+
-+ @retval           EFI_SUCCESS          The firmware volume was written s=
uccessfully.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbWrite(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
-+  IN        EFI_LBA                                 Lba,
-+  IN        UINTN                                   Offset,
-+  IN OUT    UINTN                                   *NumBytes,
-+  IN        UINT8                                   *Buffer
-+  );
-+
-+/**
-+ Erases and initialises a firmware volume block.
-+
-+ @param[in]   This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL
-+
-+ @param[in]   ...                      The variable argument list is a li=
st of tuples.
-+                                       Each tuple describes a range of LB=
As to erase
-+                                       and consists of the following:
-+                                       - An EFI_LBA that indicates the st=
arting LBA
-+                                       - A UINTN that indicates the numbe=
r of blocks
-+                                       to erase.
-+
-+                                       The list is terminated with an
-+                                       EFI_LBA_LIST_TERMINATOR.
-+
-+ @retval      EFI_SUCCESS              The erase request successfully com=
pleted.
-+
-+ @retval      EFI_ACCESS_DENIED        The firmware volume is in the Writ=
eDisabled
-+                                       state.
-+
-+ @retval      EFI_DEVICE_ERROR         The block device is not functionin=
g correctly
-+                                       and could not be written.
-+                                       The firmware device may have been =
partially
-+                                       erased.
-+
-+ @retval      EFI_INVALID_PARAMETER    One or more of the LBAs listed in =
the variable
-+                                       argument list do not exist in the =
firmware
-+                                       volume.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbEraseBlocks(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
-+  ...
-+  );
-+
-+/**
-+  This function unlock and erase an entire NOR Flash block.
-+
-+  @param[in]     Instance       NOR flash Instance of variable store regi=
on.
-+  @param[in]     BlockAddress   Block address within the variable store r=
egion.
-+
-+  @retval        EFI_SUCCESS    The erase and unlock successfully complet=
ed.
-+**/
-+EFI_STATUS
-+NorFlashUnlockAndEraseSingleBlock (
-+  IN NOR_FLASH_INSTANCE     *Instance,
-+  IN UINTN                  BlockAddress
-+  );
-+
-+/**
-+  Write a full or portion of a block.
-+
-+  @param[in]        Instance     NOR flash Instance of variable store reg=
ion.
-+  @param[in]        Lba          The starting logical block index to writ=
e to.
-+  @param[in]        Offset       Offset into the block at which to begin =
writing.
-+  @param[in,out]    NumBytes     The total size of the buffer.
-+  @param[in]        Buffer       The pointer to a caller-allocated buffer=
 that
-+                                 contains the source for the write.
-+
-+  @retval           EFI_SUCCESS  The write is completed.
-+**/
-+EFI_STATUS
-+NorFlashWriteSingleBlock (
-+  IN        NOR_FLASH_INSTANCE   *Instance,
-+  IN        EFI_LBA               Lba,
-+  IN        UINTN                 Offset,
-+  IN OUT    UINTN                *NumBytes,
-+  IN        UINT8                *Buffer
-+  );
-+
-+/**
-+  Write a full  block.
-+
-+  @param[in]    Instance             NOR flash Instance of variable store=
 region.
-+  @param[in]    Lba                  The starting logical block index to =
write to.
-+  @param[in]    BufferSizeInBytes    The number of bytes to write.
-+  @param[in]    Buffer               The pointer to a caller-allocated bu=
ffer that
-+                                     contains the source for the write.
-+
-+  @retval       EFI_SUCCESS          The write is completed.
-+**/
-+EFI_STATUS
-+NorFlashWriteBlocks (
-+  IN  NOR_FLASH_INSTANCE *Instance,
-+  IN  EFI_LBA            Lba,
-+  IN  UINTN              BufferSizeInBytes,
-+  IN  VOID               *Buffer
-+  );
-+
-+/**
-+  Read a full  block.
-+
-+  @param[in]     Instance           NOR flash Instance of variable store =
region.
-+  @param[in]     Lba                The starting logical block index to r=
ead from.
-+  @param[in]     BufferSizeInBytes  The number of bytes to read.
-+  @param[out]    Buffer             The pointer to a caller-allocated buf=
fer that
-+                                    should be copied with read data.
-+
-+  @retval        EFI_SUCCESS        The read is completed.
-+**/
-+EFI_STATUS
-+NorFlashReadBlocks (
-+  IN NOR_FLASH_INSTANCE   *Instance,
-+  IN EFI_LBA              Lba,
-+  IN UINTN                BufferSizeInBytes,
-+  OUT VOID                *Buffer
-+  );
-+
-+/**
-+  Read from nor flash.
-+
-+  @param[in]     Instance           NOR flash Instance of variable store =
region.
-+  @param[in]     Lba                The starting logical block index to r=
ead from.
-+  @param[in]     Offset             Offset into the block at which to beg=
in reading.
-+  @param[in]     BufferSizeInBytes  The number of bytes to read.
-+  @param[out]    Buffer             The pointer to a caller-allocated buf=
fer that
-+                                    should copied with read data.
-+
-+  @retval        EFI_SUCCESS        The read is completed.
-+**/
-+EFI_STATUS
-+NorFlashRead (
-+  IN NOR_FLASH_INSTANCE   *Instance,
-+  IN EFI_LBA              Lba,
-+  IN UINTN                Offset,
-+  IN UINTN                BufferSizeInBytes,
-+  OUT VOID                *Buffer
-+  );
-+
-+/**
-+  Read JEDEC ID of NOR flash device.
-+
-+  @param[in]     Instance     NOR flash Instance of variable store region.
-+  @param[out]    JedecId      JEDEC ID of NOR flash device.
-+
-+  @retval        EFI_SUCCESS  The write is completed.
-+**/
-+EFI_STATUS
-+NorFlashReadID (
-+  IN  NOR_FLASH_INSTANCE  *Instance,
-+  OUT UINT8               JedecId[3]
-+  );
-+
-+#define SPINOR_OP_WREN                0x06  // Write enable
-+#define SPINOR_OP_BE_4K               0x20  // Erase 4KiB block
-+#define SPINOR_OP_RDID                0x9f  // Read JEDEC ID
-+
-+#endif /* NOR_FLASH_DXE_H_ */
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c b/Pla=
tform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c
-new file mode 100644
-index 00000000..edd84c07
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c
-@@ -0,0 +1,573 @@
-+/** @file
-+
-+  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
-+
-+  SPDX-License-Identifier: BSD-2-Clause-Patent
-+
-+**/
-+
-+#include <Guid/VariableFormat.h>
-+#include <Guid/SystemNvDataGuid.h>
-+
-+#include <Library/BaseLib.h>
-+#include <Library/BaseMemoryLib.h>
-+#include <Library/MemoryAllocationLib.h>
-+#include <Library/PcdLib.h>
-+#include <Library/UefiBootServicesTableLib.h>
-+#include <Library/UefiLib.h>
-+
-+#include <PiDxe.h>
-+
-+#include "NorFlash.h"
-+
-+UINTN     mFlashNvStorageVariableBase;
-+
-+/**
-+  Initialize the FV Header and Variable Store Header
-+  to support variable operations.
-+
-+  @param[in]  Instance      Location to initialise the headers.
-+
-+  @retval     EFI_SUCCESS   Fv init is done.
-+
-+**/
-+EFI_STATUS
-+InitializeFvAndVariableStoreHeaders (
-+  IN NOR_FLASH_INSTANCE *Instance
-+  )
-+{
-+  EFI_STATUS                          Status;
-+  VOID*                               Headers;
-+  UINTN                               HeadersLength;
-+  EFI_FIRMWARE_VOLUME_HEADER          *FirmwareVolumeHeader;
-+  VARIABLE_STORE_HEADER               *VariableStoreHeader;
-+
-+  if (!Instance->Initialized && Instance->Initialize) {
-+    Instance->Initialize (Instance);
-+  }
-+
-+  HeadersLength =3D sizeof (EFI_FIRMWARE_VOLUME_HEADER) +
-+                  sizeof (EFI_FV_BLOCK_MAP_ENTRY) +
-+                  sizeof (VARIABLE_STORE_HEADER);
-+  Headers =3D AllocateZeroPool (HeadersLength);
-+
-+  FirmwareVolumeHeader =3D (EFI_FIRMWARE_VOLUME_HEADER*)Headers;
-+  CopyGuid (&FirmwareVolumeHeader->FileSystemGuid, &gEfiSystemNvDataFvGui=
d);
-+  FirmwareVolumeHeader->FvLength =3D
-+      PcdGet32 (PcdFlashNvStorageVariableSize) +
-+      PcdGet32 (PcdFlashNvStorageFtwWorkingSize) +
-+      PcdGet32 (PcdFlashNvStorageFtwSpareSize);
-+  FirmwareVolumeHeader->Signature =3D EFI_FVH_SIGNATURE;
-+  FirmwareVolumeHeader->Attributes =3D EFI_FVB2_READ_ENABLED_CAP |
-+                                     EFI_FVB2_READ_STATUS |
-+                                     EFI_FVB2_STICKY_WRITE |
-+                                     EFI_FVB2_MEMORY_MAPPED |
-+                                     EFI_FVB2_ERASE_POLARITY |
-+                                     EFI_FVB2_WRITE_STATUS |
-+                                     EFI_FVB2_WRITE_ENABLED_CAP;
-+
-+  FirmwareVolumeHeader->HeaderLength =3D sizeof (EFI_FIRMWARE_VOLUME_HEAD=
ER) +
-+                                       sizeof (EFI_FV_BLOCK_MAP_ENTRY);
-+  FirmwareVolumeHeader->Revision =3D EFI_FVH_REVISION;
-+  FirmwareVolumeHeader->BlockMap[0].NumBlocks =3D Instance->LastBlock + 1;
-+  FirmwareVolumeHeader->BlockMap[0].Length    =3D Instance->BlockSize;
-+  FirmwareVolumeHeader->BlockMap[1].NumBlocks =3D 0;
-+  FirmwareVolumeHeader->BlockMap[1].Length    =3D 0;
-+  FirmwareVolumeHeader->Checksum =3D CalculateCheckSum16 (
-+                                     (UINT16*)FirmwareVolumeHeader,
-+                                     FirmwareVolumeHeader->HeaderLength);
-+
-+  VariableStoreHeader =3D (VOID *)((UINTN)Headers +
-+                                 FirmwareVolumeHeader->HeaderLength);
-+  CopyGuid (&VariableStoreHeader->Signature, &gEfiAuthenticatedVariableGu=
id);
-+  VariableStoreHeader->Size =3D PcdGet32 (PcdFlashNvStorageVariableSize) -
-+                              FirmwareVolumeHeader->HeaderLength;
-+  VariableStoreHeader->Format =3D VARIABLE_STORE_FORMATTED;
-+  VariableStoreHeader->State =3D VARIABLE_STORE_HEALTHY;
-+
-+  // Install the combined super-header in the NorFlash
-+  Status =3D FvbWrite (&Instance->FvbProtocol, 0, 0, &HeadersLength, Head=
ers);
-+
-+  FreePool (Headers);
-+  return Status;
-+}
-+
-+/**
-+  Check the integrity of firmware volume header.
-+
-+  @param[in]  Instance        Instance of Nor flash variable region.
-+
-+  @retval     EFI_SUCCESS     The firmware volume is consistent.
-+  @retval     EFI_NOT_FOUND   The firmware volume has been corrupted.
-+
-+**/
-+EFI_STATUS
-+ValidateFvHeader (
-+  IN  NOR_FLASH_INSTANCE *Instance
-+  )
-+{
-+  EFI_FIRMWARE_VOLUME_HEADER  *FwVolHeader;
-+  VARIABLE_STORE_HEADER       *VariableStoreHeader;
-+  UINTN                       VariableStoreLength;
-+  UINTN                       FvLength;
-+
-+  FwVolHeader =3D (EFI_FIRMWARE_VOLUME_HEADER*)Instance->RegionBaseAddres=
s;
-+
-+  FvLength =3D PcdGet32 (PcdFlashNvStorageVariableSize) +
-+             PcdGet32 (PcdFlashNvStorageFtwWorkingSize) +
-+             PcdGet32 (PcdFlashNvStorageFtwSpareSize);
-+
-+  if ((FwVolHeader->Revision  !=3D EFI_FVH_REVISION)
-+      || (FwVolHeader->Signature !=3D EFI_FVH_SIGNATURE)
-+      || (FwVolHeader->FvLength  !=3D FvLength)
-+      )
-+  {
-+    DEBUG ((DEBUG_ERROR, "%a: No Firmware Volume header present\n",
-+      __FUNCTION__));
-+    return EFI_NOT_FOUND;
-+  }
-+
-+  // Check the Firmware Volume Guid
-+  if (!CompareGuid (&FwVolHeader->FileSystemGuid, &gEfiSystemNvDataFvGuid=
)) {
-+    DEBUG ((DEBUG_ERROR, "%a: Firmware Volume Guid non-compatible\n",
-+      __FUNCTION__));
-+    return EFI_NOT_FOUND;
-+  }
-+
-+  VariableStoreHeader =3D (VOID *)((UINTN)FwVolHeader +
-+                                 FwVolHeader->HeaderLength);
-+
-+  // Check the Variable Store Guid
-+  if (!CompareGuid (&VariableStoreHeader->Signature, &gEfiVariableGuid) &&
-+      !CompareGuid (&VariableStoreHeader->Signature,
-+        &gEfiAuthenticatedVariableGuid)) {
-+    DEBUG ((DEBUG_ERROR, "%a: Variable Store Guid non-compatible\n",
-+      __FUNCTION__));
-+    return EFI_NOT_FOUND;
-+  }
-+
-+  VariableStoreLength =3D PcdGet32 (PcdFlashNvStorageVariableSize) -
-+                        FwVolHeader->HeaderLength;
-+  if (VariableStoreHeader->Size !=3D VariableStoreLength) {
-+    DEBUG ((DEBUG_ERROR, "%a: Variable Store Length does not match\n",
-+      __FUNCTION__));
-+    return EFI_NOT_FOUND;
-+  }
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+ Retrieves the attributes and current settings of the block.
-+
-+ @param[in]   This         Indicates the EFI_FIRMWARE_VOLUME_BLOCK2_PROTO=
COL instance.
-+
-+ @param[out]  Attributes   Pointer to EFI_FVB_ATTRIBUTES_2 in which the a=
ttributes and
-+                           current settings are returned.
-+                           Type EFI_FVB_ATTRIBUTES_2 is defined in
-+                           EFI_FIRMWARE_VOLUME_HEADER.
-+
-+ @retval      EFI_SUCCESS  The firmware volume attributes were returned.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbGetAttributes(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL    *This,
-+  OUT       EFI_FVB_ATTRIBUTES_2                   *Attributes
-+  )
-+{
-+  EFI_FVB_ATTRIBUTES_2  FlashFvbAttributes;
-+
-+  FlashFvbAttributes =3D EFI_FVB2_READ_ENABLED_CAP | EFI_FVB2_READ_STATUS=
 |
-+                       EFI_FVB2_WRITE_ENABLED_CAP | EFI_FVB2_WRITE_STATUS=
 |
-+                       EFI_FVB2_STICKY_WRITE | EFI_FVB2_MEMORY_MAPPED |
-+                       EFI_FVB2_ERASE_POLARITY;
-+
-+  *Attributes =3D FlashFvbAttributes;
-+
-+  DEBUG ((DEBUG_INFO, "FvbGetAttributes(0x%X)\n", *Attributes));
-+
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+ Sets configurable firmware volume attributes and returns the
-+ new settings of the firmware volume.
-+
-+
-+ @param[in]         This                     EFI_FIRMWARE_VOLUME_BLOCK2_P=
ROTOCOL instance.
-+
-+ @param[in, out]    Attributes               On input, Attributes is a po=
inter to
-+                                             EFI_FVB_ATTRIBUTES_2 that co=
ntains the desired
-+                                             firmware volume settings.
-+                                             On successful return, it con=
tains the new
-+                                             settings of the firmware vol=
ume.
-+
-+ @retval            EFI_UNSUPPORTED          The firmware volume attribut=
es are not supported.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbSetAttributes(
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL  *This,
-+  IN OUT    EFI_FVB_ATTRIBUTES_2                 *Attributes
-+  )
-+{
-+  DEBUG ((DEBUG_INFO, "FvbSetAttributes(0x%X) is not supported\n",
-+    *Attributes));
-+  return EFI_UNSUPPORTED;
-+}
-+
-+/**
-+ Retrieves the base address of a memory-mapped firmware volume.
-+ This function should be called only for memory-mapped firmware volumes.
-+
-+ @param[in]     This               EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL in=
stance.
-+
-+ @param[out]    Address            Pointer to a caller-allocated
-+                                   EFI_PHYSICAL_ADDRESS that, on successf=
ul
-+                                   return from GetPhysicalAddress(), cont=
ains the
-+                                   base address of the firmware volume.
-+
-+ @retval        EFI_SUCCESS        The firmware volume base address was r=
eturned.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbGetPhysicalAddress (
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL  *This,
-+  OUT       EFI_PHYSICAL_ADDRESS                 *Address
-+  )
-+{
-+  NOR_FLASH_INSTANCE *Instance;
-+
-+  Instance =3D INSTANCE_FROM_FVB_THIS (This);
-+
-+  DEBUG ((DEBUG_INFO, "FvbGetPhysicalAddress(BaseAddress=3D0x%08x)\n",
-+    Instance->RegionBaseAddress));
-+
-+  ASSERT(Address !=3D NULL);
-+
-+  *Address =3D Instance->RegionBaseAddress;
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+ Retrieves the size of the requested block.
-+ It also returns the number of additional blocks with the identical size.
-+ The GetBlockSize() function is used to retrieve the block map
-+ (see EFI_FIRMWARE_VOLUME_HEADER).
-+
-+
-+ @param[in]     This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTO=
COL instance.
-+
-+ @param[in]     Lba                      Indicates the block whose size t=
o return
-+
-+ @param[out]    BlockSize                Pointer to a caller-allocated UI=
NTN in which
-+                                         the size of the block is returne=
d.
-+
-+ @param[out]    NumberOfBlocks           Pointer to a caller-allocated UI=
NTN in
-+                                         which the number of consecutive =
blocks,
-+                                         starting with Lba, is returned. =
All
-+                                         blocks in this range have a size=
 of
-+                                         BlockSize.
-+
-+ @retval        EFI_SUCCESS              The firmware volume base address=
 was returned.
-+
-+ @retval        EFI_INVALID_PARAMETER    The requested LBA is out of rang=
e.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbGetBlockSize (
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL  *This,
-+  IN        EFI_LBA                              Lba,
-+  OUT       UINTN                                *BlockSize,
-+  OUT       UINTN                                *NumberOfBlocks
-+  )
-+{
-+  EFI_STATUS Status;
-+  NOR_FLASH_INSTANCE *Instance;
-+
-+  Instance =3D INSTANCE_FROM_FVB_THIS (This);
-+
-+  DEBUG ((DEBUG_INFO,
-+    "FvbGetBlockSize(Lba=3D%ld, BlockSize=3D0x%x, LastBlock=3D%ld)\n", Lb=
a,
-+    Instance->BlockSize, Instance->LastBlock));
-+
-+  if (Lba > Instance->LastBlock) {
-+    DEBUG ((DEBUG_ERROR,
-+      "FvbGetBlockSize: ERROR - Parameter LBA %ld is beyond the last Lba =
(%ld).\n",
-+      Lba, Instance->LastBlock));
-+    Status =3D EFI_INVALID_PARAMETER;
-+  } else {
-+    // This is easy because in this platform each NorFlash device has equ=
al sized blocks.
-+    *BlockSize =3D (UINTN) Instance->BlockSize;
-+    *NumberOfBlocks =3D (UINTN) (Instance->LastBlock - Lba + 1);
-+
-+    DEBUG ((DEBUG_INFO,
-+      "FvbGetBlockSize: *BlockSize=3D0x%x, *NumberOfBlocks=3D0x%x.\n", *B=
lockSize,
-+      *NumberOfBlocks));
-+
-+    Status =3D EFI_SUCCESS;
-+  }
-+
-+  return Status;
-+}
-+
-+/**
-+ Reads the specified number of bytes into a buffer from the specified blo=
ck.
-+
-+ The Read() function reads the requested number of bytes from the
-+ requested block and stores them in the provided buffer.
-+
-+ @param[in]       This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCO=
L instance.
-+
-+ @param[in]       Lba                  The starting logical block index f=
rom which to read
-+
-+ @param[in]       Offset               Offset into the block at which to =
begin reading.
-+
-+ @param[in, out]  NumBytes             Pointer to a UINTN.
-+                                       At entry, *NumBytes contains the t=
otal size of the
-+                                       buffer. *NumBytes should have a no=
n zero value.
-+                                       At exit, *NumBytes contains the to=
tal number of
-+                                       bytes read.
-+
-+ @param[in, out]  Buffer               Pointer to a caller-allocated buff=
er that will be
-+                                       used to hold the data that is read.
-+
-+ @retval          EFI_SUCCESS          The firmware volume was read succe=
ssfully, and
-+                                       contents are in Buffer.
-+
-+ @retval          EFI_BAD_BUFFER_SIZE  Read attempted across an LBA bound=
ary.
-+
-+ @retval          EFI_DEVICE_ERROR     The block device is not functionin=
g correctly and
-+                                       could not be read.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbRead (
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL   *This,
-+  IN        EFI_LBA                               Lba,
-+  IN        UINTN                                 Offset,
-+  IN OUT    UINTN                                 *NumBytes,
-+  IN OUT    UINT8                                 *Buffer
-+  )
-+{
-+  EFI_STATUS    Status;
-+  UINTN         BlockSize;
-+  NOR_FLASH_INSTANCE *Instance;
-+
-+  Instance =3D INSTANCE_FROM_FVB_THIS (This);
-+
-+  DEBUG ((DEBUG_INFO,
-+    "FvbRead(Parameters: Lba=3D%ld, Offset=3D0x%x, *NumBytes=3D0x%x, Buff=
er @ 0x%08x)\n",
-+    Instance->StartLba + Lba, Offset, *NumBytes, Buffer));
-+
-+  if (!Instance->Initialized && Instance->Initialize) {
-+    Instance->Initialize(Instance);
-+  }
-+
-+  BlockSize =3D Instance->BlockSize;
-+
-+  DEBUG ((DEBUG_INFO,
-+    "FvbRead: Check if (Offset=3D0x%x + NumBytes=3D0x%x) <=3D BlockSize=
=3D0x%x\n",
-+    Offset, *NumBytes, BlockSize ));
-+
-+  // The read must not span block boundaries.
-+  // We need to check each variable individually because adding two large
-+  // values together overflows.
-+  if (Offset               >=3D BlockSize ||
-+      *NumBytes            >  BlockSize ||
-+      (Offset + *NumBytes) >  BlockSize) {
-+    DEBUG ((DEBUG_ERROR,
-+      "FvbRead: ERROR - EFI_BAD_BUFFER_SIZE: (Offset=3D0x%x + NumBytes=3D=
0x%x) > BlockSize=3D0x%x\n",
-+      Offset, *NumBytes, BlockSize ));
-+    return EFI_BAD_BUFFER_SIZE;
-+  }
-+
-+  // We must have some bytes to read
-+  if (*NumBytes =3D=3D 0) {
-+    return EFI_BAD_BUFFER_SIZE;
-+  }
-+
-+  // Decide if we are doing full block reads or not.
-+  if (*NumBytes % BlockSize !=3D 0) {
-+    Status =3D NorFlashRead (Instance, Instance->StartLba + Lba, Offset,
-+                   *NumBytes, Buffer);
-+  } else {
-+    // Read NOR Flash data into shadow buffer
-+    Status =3D NorFlashReadBlocks (Instance, Instance->StartLba + Lba,
-+                   BlockSize, Buffer);
-+  }
-+  if (EFI_ERROR (Status)) {
-+    // Return one of the pre-approved error statuses
-+    return EFI_DEVICE_ERROR;
-+  }
-+  return EFI_SUCCESS;
-+}
-+
-+/**
-+ Writes the specified number of bytes from the input buffer to the block.
-+
-+ @param[in]        This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOC=
OL instance.
-+
-+ @param[in]        Lba                  The starting logical block index =
to write to.
-+
-+ @param[in]        Offset               Offset into the block at which to=
 begin writing.
-+
-+ @param[in, out]   NumBytes             The pointer to a UINTN.
-+                                        At entry, *NumBytes contains the =
total size of the
-+                                        buffer.
-+                                        At exit, *NumBytes contains the t=
otal number of
-+                                        bytes actually written.
-+
-+ @param[in]        Buffer               The pointer to a caller-allocated=
 buffer that
-+                                        contains the source for the write.
-+
-+ @retval           EFI_SUCCESS          The firmware volume was written s=
uccessfully.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbWrite (
-+  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL   *This,
-+  IN        EFI_LBA                               Lba,
-+  IN        UINTN                                 Offset,
-+  IN OUT    UINTN                                 *NumBytes,
-+  IN        UINT8                                 *Buffer
-+  )
-+{
-+  NOR_FLASH_INSTANCE *Instance;
-+
-+  Instance =3D INSTANCE_FROM_FVB_THIS (This);
-+
-+  return NorFlashWriteSingleBlock (Instance, Instance->StartLba + Lba, Of=
fset,
-+           NumBytes, Buffer);
-+}
-+
-+/**
-+ Erases and initialises a firmware volume block.
-+
-+ @param[in]   This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL
-+
-+ @param[in]   ...                      The variable argument list is a li=
st of tuples.
-+                                       Each tuple describes a range of LB=
As to erase
-+                                       and consists of the following:
-+                                       - An EFI_LBA that indicates the st=
arting LBA
-+                                       - A UINTN that indicates the numbe=
r of blocks
-+                                       to erase.
-+
-+                                       The list is terminated with an
-+                                       EFI_LBA_LIST_TERMINATOR.
-+
-+ @retval      EFI_SUCCESS              The erase request successfully com=
pleted.
-+
-+ @retval      EFI_ACCESS_DENIED        The firmware volume is in the Writ=
eDisabled
-+                                       state.
-+
-+ @retval      EFI_DEVICE_ERROR         The block device is not functionin=
g correctly
-+                                       and could not be written.
-+                                       The firmware device may have been =
partially
-+                                       erased.
-+
-+ @retval      EFI_INVALID_PARAMETER   One or more of the LBAs listed in t=
he variable
-+                                      argument list do not exist in the f=
irmware
-+                                      volume.
-+
-+**/
-+EFI_STATUS
-+EFIAPI
-+FvbEraseBlocks (
-+  IN CONST EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL *This,
-+  ...
-+  )
-+{
-+  EFI_STATUS  Status;
-+  VA_LIST     Args;
-+  UINTN       BlockAddress; // Physical address of Lba to erase
-+  EFI_LBA     StartingLba;  // Lba from which we start erasing
-+  UINTN       NumOfLba;     // Number of Lba blocks to erase
-+  NOR_FLASH_INSTANCE *Instance;
-+
-+  Instance =3D INSTANCE_FROM_FVB_THIS (This);
-+
-+  DEBUG ((DEBUG_INFO, "FvbEraseBlocks()\n"));
-+
-+  Status =3D EFI_SUCCESS;
-+
-+  // Before erasing, check the entire list of parameters to ensure
-+  // all specified blocks are valid
-+
-+  VA_START (Args, This);
-+  do {
-+    // Get the Lba from which we start erasing
-+    StartingLba =3D VA_ARG (Args, EFI_LBA);
-+
-+    // Have we reached the end of the list?
-+    if (StartingLba =3D=3D EFI_LBA_LIST_TERMINATOR) {
-+      break;
-+    }
-+
-+    // How many Lba blocks are we requested to erase?
-+    NumOfLba =3D VA_ARG (Args, UINT32);
-+
-+    // All blocks must be within range
-+    DEBUG ((DEBUG_INFO,
-+      "FvbEraseBlocks: Check if: ( StartingLba=3D%ld + NumOfLba=3D%d - 1 =
) > LastBlock=3D%ld.\n",
-+      Instance->StartLba + StartingLba, NumOfLba, Instance->LastBlock));
-+    if (NumOfLba =3D=3D 0 ||
-+        (Instance->StartLba + StartingLba + NumOfLba - 1) >
-+        Instance->LastBlock) {
-+      VA_END (Args);
-+      DEBUG ((DEBUG_ERROR,
-+        "FvbEraseBlocks: ERROR - Lba range goes past the last Lba.\n"));
-+      return EFI_INVALID_PARAMETER;
-+    }
-+  } while (TRUE);
-+  VA_END (Args);
-+
-+  VA_START (Args, This);
-+  do {
-+    // Get the Lba from which we start erasing
-+    StartingLba =3D VA_ARG (Args, EFI_LBA);
-+
-+    // Have we reached the end of the list?
-+    if (StartingLba =3D=3D EFI_LBA_LIST_TERMINATOR) {
-+      // Exit the while loop
-+      break;
-+    }
-+
-+    // How many Lba blocks are we requested to erase?
-+    NumOfLba =3D VA_ARG (Args, UINT32);
-+
-+    // Go through each one and erase it
-+    while (NumOfLba > 0) {
-+
-+      // Get the physical address of Lba to erase
-+      BlockAddress =3D GET_NOR_BLOCK_ADDRESS (
-+                       Instance->RegionBaseAddress,
-+                       Instance->StartLba + StartingLba,
-+                       Instance->BlockSize
-+                       );
-+
-+      // Erase it
-+      DEBUG ((DEBUG_INFO, "FvbEraseBlocks: Erasing Lba=3D%ld @ 0x%08x.\n",
-+        Instance->StartLba + StartingLba, BlockAddress));
-+      Status =3D NorFlashUnlockAndEraseSingleBlock (Instance, BlockAddres=
s);
-+      if (EFI_ERROR(Status)) {
-+        VA_END (Args);
-+        return EFI_DEVICE_ERROR;
-+      }
-+
-+      // Move to the next Lba
-+      StartingLba++;
-+      NumOfLba--;
-+    }
-+  } while (TRUE);
-+  VA_END (Args);
-+
-+  return Status;
-+
-+}
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dec b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dec
-index 16937197..986a078f 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.dec
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
-@@ -1,7 +1,7 @@
- ## @file=0D
- #  Describes the N1Sdp configuration.=0D
- #=0D
--#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+#  Copyright (c) 2021-2022, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- ##=0D
-@@ -89,3 +89,6 @@
-   # unmapped reserved region results in a DECERR response.=0D
-   #=0D
-   gArmN1SdpTokenSpaceGuid.PcdCsComponentSize|0x1000|UINT32|0x00000049=0D
-+=0D
-+  # Base address of Cadence QSPI controller configuration registers=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCadenceQspiDxeRegBaseAddress|0x1C0C0000|UINT=
32|0x0000004A=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0006-Platform-ARM-N1=
Sdp-Persistent-storage-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/file=
s/n1sdp/0006-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
deleted file mode 100644
index 197a6eca487b..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0006-Platform-ARM-N1Sdp-Per=
sistent-storage-for-N1Sdp.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From e79fd5cfa3190eb27a9637facc9891cab55b5e09 Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Mon, 2 May 2022 19:24:47 +0530
-Subject: [PATCH] Platform/ARM/N1Sdp: Persistent storage for N1Sdp
-
-Enable persistent storage on QSPI flash device.
-
-Upstream-Status: Pending
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: I403113bb885d1d411d433a7f266715d007509a5e
----
- Platform/ARM/N1Sdp/N1SdpPlatform.dsc | 18 +++++++++++++-----
- Platform/ARM/N1Sdp/N1SdpPlatform.fdf |  4 +++-
- 2 files changed, 16 insertions(+), 6 deletions(-)
-
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dsc
-index 676ab677..80bc875a 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-@@ -44,6 +44,9 @@
-   # file explorer library support=0D
-   FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.in=
f=0D
- =0D
-+  # NOR flash support=0D
-+  NorFlashInfoLib|EmbeddedPkg/Library/NorFlashInfoLib/NorFlashInfoLib.inf=
=0D
-+=0D
- [LibraryClasses.common.SEC]=0D
-   HobLib|MdePkg/Library/PeiHobLib/PeiHobLib.inf=0D
-   MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllo=
cationLib.inf=0D
-@@ -161,11 +164,9 @@
-   # ACPI Table Version=0D
-   gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20=0D
- =0D
--  # Runtime Variable storage=0D
--  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvStoreReserved|0=0D
--  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE=0D
--  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxVariableSize|0x2000=0D
--  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxAuthVariableSize|0x2800=0D
-+  # NOR flash support=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0x18F00000=
=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x00020000=
=0D
- =0D
- #########################################################################=
#######=0D
- #=0D
-@@ -197,6 +198,12 @@
-       gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x8000000F=0D
-   }=0D
- =0D
-+  # NOR flash support=0D
-+  Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf {=0D
-+      <LibraryClasses>=0D
-+      NorFlashPlatformLib|Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/N=
orFlashLib.inf=0D
-+  }=0D
-+=0D
-   # Architectural Protocols=0D
-   ArmPkg/Drivers/CpuDxe/CpuDxe.inf=0D
-   ArmPkg/Drivers/ArmGic/ArmGicDxe.inf=0D
-@@ -217,6 +224,7 @@
-   MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf {=0D
-     <LibraryClasses>=0D
-       NULL|MdeModulePkg/Library/VarCheckUefiLib/VarCheckUefiLib.inf=0D
-+      NULL|EmbeddedPkg/Library/NvVarStoreFormattedLib/NvVarStoreFormatted=
Lib.inf=0D
-       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf=0D
-   }=0D
- =0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1S=
dpPlatform.fdf
-index e5e24ea5..4329f892 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-@@ -1,7 +1,7 @@
- ## @file=0D
- #  FDF file of N1Sdp=0D
- #=0D
--#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
-+#  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- ##=0D
-@@ -140,6 +140,8 @@ READ_LOCK_STATUS   =3D TRUE
-   INF ArmPkg/Drivers/GenericWatchdogDxe/GenericWatchdogDxe.inf=0D
-   INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf=0D
- =0D
-+  INF Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf=0D
-+=0D
-   INF Platform/ARM/Drivers/BootMonFs/BootMonFs.inf=0D
-   INF MdeModulePkg/Universal/PCD/Dxe/Pcd.inf=0D
- =0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0007-Platform-ARM-N1=
Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0007-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
deleted file mode 100644
index 3951b48be444..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0007-Platform-ARM-N1Sdp-Ena=
ble-FaultTolerantWrite-Dxe-dri.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 5e8fbb3ba0f634f7fc873c6577269845f9e243db Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Mon, 2 May 2022 19:28:19 +0530
-Subject: [PATCH] Platform/ARM/N1Sdp: Enable FaultTolerantWrite Dxe driver =
for
- N1Sdp
-
-Upstream-Status: Pending
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: If448ad95b2e72cef31ce1e1e5ab2504d607f0545
----
- Platform/ARM/N1Sdp/N1SdpPlatform.dsc | 5 +++++
- Platform/ARM/N1Sdp/N1SdpPlatform.fdf | 1 +
- 2 files changed, 6 insertions(+)
-
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dsc
-index 80bc875a..90a0d5b6 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-@@ -165,6 +165,10 @@
-   gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20=0D
- =0D
-   # NOR flash support=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase|0x18F40000=
=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize|0x00020000=
=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase|0x18F200=
00=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize|0x000200=
00=0D
-   gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0x18F00000=
=0D
-   gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x00020000=
=0D
- =0D
-@@ -227,6 +231,7 @@
-       NULL|EmbeddedPkg/Library/NvVarStoreFormattedLib/NvVarStoreFormatted=
Lib.inf=0D
-       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf=0D
-   }=0D
-+  MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.inf=
=0D
- =0D
-   # ACPI Support=0D
-   MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf=0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1S=
dpPlatform.fdf
-index 4329f892..17d370a3 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-@@ -90,6 +90,7 @@ READ_LOCK_STATUS   =3D TRUE
-   INF MdeModulePkg/Universal/Metronome/Metronome.inf=0D
-   INF MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.=
inf=0D
-   INF MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf=0D
-+  INF MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.=
inf=0D
-   INF MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/MonotonicCounterR=
untimeDxe.inf=0D
-   INF MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf=0D
-   INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0008-Platform-ARM-N1=
Sdp-manually-poll-QSPI-status-bit-aft.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0008-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
deleted file mode 100644
index 8e14699585f0..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0008-Platform-ARM-N1Sdp-man=
ually-poll-QSPI-status-bit-aft.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From 6d274379f584a638c1f2b4b8a19014d4baef1d9f Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Thu, 11 Aug 2022 11:26:29 +0530
-Subject: [PATCH] Platform/ARM/N1Sdp: manually poll QSPI status bit after
- erase/write
-
-This patch adds a function to poll Nor flash memory's status register
-bit (WIP bit) to wait for an erase/write operation to complete.
-The polling timeout is set to 1 second.
-
-Upstream-Status: Pending
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: Ie678b7586671964ae0f8506a0542d73cbddddfe4
----
- .../Drivers/CadenceQspiDxe/CadenceQspiDxe.inf |  1 +
- .../Drivers/CadenceQspiDxe/CadenceQspiReg.h   |  6 +-
- .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c   | 80 ++++++++++++++++++-
- .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h   |  5 ++
- 4 files changed, 88 insertions(+), 4 deletions(-)
-
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf =
b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
-index 4f20c3ba..7a39eb2d 100644
---- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
-@@ -39,6 +39,7 @@
-   MemoryAllocationLib
-   NorFlashInfoLib
-   NorFlashPlatformLib
-+  TimerLib
-   UefiBootServicesTableLib
-   UefiDriverEntryPoint
-   UefiLib
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h b/=
Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
-index fe3b327c..1971631d 100644
---- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
-@@ -16,13 +16,15 @@
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BIT_POS         19
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS    16
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_STATUS_BIT           0x02
--#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_4B         0x03
--#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B         0x02
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS       24
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE          0x01
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_BYTE_3B         0x02
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READEN_BIT_POS       23
- #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS     20
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_DUMMY_8C             0x8
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_DUMMY_BIT_POS        7
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_DATA_BYTES(x) ((x - 1) << CDNS_Q=
SPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS)
-+#define CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_ADDR_BYTES(x) ((x - 1) << CDNS_Q=
SPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS)
-=20
- #define CDNS_QSPI_FLASH_CMD_READ_DATA_REG_OFFSET          0xA0
-=20
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c b/Platfo=
rm/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
-index 188c75e2..6832351a 100644
---- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
-@@ -10,6 +10,7 @@
- #include <Library/MemoryAllocationLib.h>
- #include <Library/NorFlashInfoLib.h>
- #include <Library/PcdLib.h>
-+#include <Library/TimerLib.h>
- #include <Library/UefiBootServicesTableLib.h>
- #include <Library/UefiLib.h>
-=20
-@@ -184,6 +185,74 @@ FreeInstance:
-   return Status;
- }
-=20
-+/**
-+  Converts milliseconds into number of ticks of the performance counter.
-+
-+  @param[in] Milliseconds  Milliseconds to convert into ticks.
-+
-+  @retval Milliseconds expressed as number of ticks.
-+
-+**/
-+STATIC
-+UINT64
-+MilliSecondsToTicks (
-+  IN UINTN Milliseconds
-+  )
-+{
-+  CONST UINT64  NanoSecondsPerTick =3D GetTimeInNanoSecond (1);
-+
-+  return (Milliseconds * 1000000) / NanoSecondsPerTick;
-+}
-+
-+/**
-+  Poll Status register for NOR flash erase/write completion.
-+
-+  @param[in]      Instance           NOR flash Instance.
-+
-+  @retval         EFI_SUCCESS        Request is executed successfully.
-+  @retval         EFI_TIMEOUT        Operation timed out.
-+  @retval         EFI_DEVICE_ERROR   Controller operartion failed.
-+
-+**/
-+STATIC
-+EFI_STATUS
-+NorFlashPollStatusRegister (
-+  IN NOR_FLASH_INSTANCE     *Instance
-+  )
-+{
-+  BOOLEAN     SRegDone;
-+  UINT32      val;
-+
-+  val =3D SPINOR_OP_RDSR << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
-+      CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE << CDNS_QSPI_FLASH_CMD_CTR=
L_REG_READEN_BIT_POS |
-+      CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_DATA_BYTES(1) |
-+      CDNS_QSPI_FLASH_CMD_CTRL_REG_DUMMY_8C << CDNS_QSPI_FLASH_CMD_CTRL_R=
EG_DUMMY_BIT_POS;
-+
-+  CONST UINT64  TickOut =3D
-+    GetPerformanceCounter () + MilliSecondsToTicks (SPINOR_SR_WIP_POLL_TI=
MEOUT_MS);
-+
-+  do {
-+    if (GetPerformanceCounter () > TickOut) {
-+      DEBUG ((
-+        DEBUG_ERROR,
-+        "NorFlashPollStatusRegister: Timeout waiting for erase/write.\n"
-+        ));
-+      return EFI_TIMEOUT;
-+    }
-+
-+    if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
-+      return EFI_DEVICE_ERROR;
-+    }
-+
-+    SRegDone =3D
-+      (MmioRead8 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD=
_READ_DATA_REG_OFFSET)
-+      & SPINOR_SR_WIP) =3D=3D 0;
-+
-+  } while (!SRegDone);
-+
-+  return EFI_SUCCESS;
-+}
-+
- /**
-   Check whether NOR flash opertions are Locked.
-=20
-@@ -305,12 +374,16 @@ NorFlashEraseSingleBlock (
-=20
-   DevConfigVal =3D SPINOR_OP_BE_4K << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE=
_BIT_POS |
-                  CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_ENABLE << CDNS_QSPI_FL=
ASH_CMD_CTRL_REG_ADDR_BIT_POS |
--                 CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_F=
LASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS;
-+                 CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_ADDR_BYTES(3);
-=20
-   if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, DevConfigVal))) {
-     return EFI_DEVICE_ERROR;
-   }
-=20
-+  if (EFI_ERROR (NorFlashPollStatusRegister (Instance))) {
-+      return EFI_DEVICE_ERROR;
-+  }
-+
-   return EFI_SUCCESS;
- }
-=20
-@@ -383,6 +456,9 @@ NorFlashWriteSingleWord (
-     return EFI_DEVICE_ERROR;
-   }
-   MmioWrite32 (WordAddress, WriteData);
-+  if (EFI_ERROR (NorFlashPollStatusRegister (Instance))) {
-+    return EFI_DEVICE_ERROR;
-+  }
-   return EFI_SUCCESS;
- }
-=20
-@@ -907,7 +983,7 @@ NorFlashReadID (
-=20
-   val =3D SPINOR_OP_RDID << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
-         CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE << CDNS_QSPI_FLASH_CMD_C=
TRL_REG_READEN_BIT_POS |
--        CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_FLASH_CMD_=
CTRL_REG_READBYTE_BIT_POS;
-+        CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_DATA_BYTES(3);
-=20
-   if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
-     return EFI_DEVICE_ERROR;
-diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h b/Platfo=
rm/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
-index e720937e..eb0afc60 100644
---- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
-+++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
-@@ -477,8 +477,13 @@ NorFlashReadID (
-   OUT UINT8               JedecId[3]
-   );
-=20
-+#define SPINOR_SR_WIP                 BIT0  // Write in progress
-+
- #define SPINOR_OP_WREN                0x06  // Write enable
- #define SPINOR_OP_BE_4K               0x20  // Erase 4KiB block
- #define SPINOR_OP_RDID                0x9f  // Read JEDEC ID
-+#define SPINOR_OP_RDSR                0x05  // Read status register
-+
-+#define SPINOR_SR_WIP_POLL_TIMEOUT_MS  1000u // Status Register read time=
out
-=20
- #endif /* NOR_FLASH_DXE_H_ */
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1=
Sdp-Reserve-OP-TEE-Region-from-UEFI.patch b/meta-arm-bsp/recipes-bsp/uefi/f=
iles/n1sdp/0009-Platform-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch
deleted file mode 100644
index 6105e9a63ac6..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp-Res=
erve-OP-TEE-Region-from-UEFI.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 60dfd5bb8f25fa5f0b6c07c3098836bec1668c19 Mon Sep 17 00:00:00 2001
-From: Mariam Elshakfy <mariam.elshakfy@arm.com>
-Date: Thu, 14 Mar 2024 14:47:27 +0000
-Subject: [PATCH] Platform/ARM/N1Sdp: Reserve OP-TEE Region from UEFI
-
-To enable cache on N1SDP, OP-TEE has to be moved
-to run from DDR4 memory. Since this memory is
-known to application side, it must be reserved
-
-Upstream-Status: Inappropriate [will not be submitted as it's a workaround=
 to address hardware issue]
-Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
----
- .../Library/PlatformLib/PlatformLib.inf             |  3 +++
- .../Library/PlatformLib/PlatformLibMem.c            | 13 +++++++++++++
- Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec         |  4 ++++
- 3 files changed, 20 insertions(+)
-
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-index 78f309c3aa..dc82d5bd87 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-@@ -62,6 +62,9 @@
- =0D
-   gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress=0D
- =0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemoryBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemorySize=0D
-+=0D
- [Guids]=0D
-   gArmNeoverseN1SocPlatformInfoDescriptorGuid=0D
-   gEfiHobListGuid          ## CONSUMES  ## SystemTable=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index 8bb9407490..d8ad0f975c 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-@@ -150,6 +150,19 @@ ArmPlatformGetVirtualMemoryMap (
-     EFI_RESOURCE_ATTRIBUTE_WRITE_BACK_CACHEABLE |=0D
-     EFI_RESOURCE_ATTRIBUTE_TESTED;=0D
- =0D
-+  // Reserved OP-TEE region=0D
-+  BuildResourceDescriptorHob (=0D
-+      EFI_RESOURCE_SYSTEM_MEMORY,=0D
-+      ResourceAttributes,=0D
-+      PcdGet64 (PcdOpteeMemoryBase),=0D
-+      PcdGet64 (PcdOpteeMemorySize)=0D
-+    );=0D
-+  BuildMemoryAllocationHob (=0D
-+    PcdGet64 (PcdOpteeMemoryBase),=0D
-+    PcdGet64 (PcdOpteeMemorySize),=0D
-+    EfiReservedMemoryType=0D
-+  );=0D
-+=0D
-   BuildResourceDescriptorHob (=0D
-     EFI_RESOURCE_SYSTEM_MEMORY,=0D
-     ResourceAttributes,=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
-index 9e257ebde0..587319262a 100644
---- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-+++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-@@ -86,5 +86,9 @@
-   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x400000=
00000|UINT64|0x00000050=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieSegmentNumber|2|UINT32|0x0=
0000051=0D
- =0D
-+  # Base Address of OP-TEE=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemoryBase|0xDE000000|UINT64|0x=
00000052=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemorySize|0x02000000|UINT64|0x=
00000053=0D
-+=0D
- [Ppis]=0D
-   gNtFwConfigDtInfoPpiGuid =3D  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 0xd=
0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }=0D
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/n1sdp-preempt-rt.scc b/meta-arm-bsp/recipes-kernel/linux/arm-plat=
forms-kmeta/bsp/arm-platforms/n1sdp-preempt-rt.scc
deleted file mode 100644
index dc844458bbc6..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/n1sdp-preempt-rt.scc
+++ /dev/null
@@ -1,6 +0,0 @@
-define KMACHINE n1sdp
-define KTYPE preempt-rt
-define KARCH arm64
-
-include ktypes/preempt-rt/preempt-rt.scc
-include n1sdp/disable-kvm.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/n1sdp-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platfo=
rms-kmeta/bsp/arm-platforms/n1sdp-standard.scc
deleted file mode 100644
index 8536c818c90c..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/n1sdp-standard.scc
+++ /dev/null
@@ -1,5 +0,0 @@
-define KMACHINE n1sdp
-define KTYPE standard
-define KARCH arm64
-
-include ktypes/standard/standard.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/n1sdp/disable-kvm.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/n1sdp/disable-kvm.cfg
deleted file mode 100644
index 617d3e51b1ae..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/n1sdp/disable-kvm.cfg
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_KVM is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 011586ef8196..ae22531f1634 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -15,7 +15,6 @@ ARMBSPFILESPATHS :=3D "${THISDIR}:${THISDIR}/files:"
 SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkmeta;name=3Darm-plat=
forms-kmeta;destsuffix=3Darm-platforms-kmeta"
 SRC_URI:append:fvp-base =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:juno =3D " ${SRC_URI_KMETA}"
-SRC_URI:append:n1sdp =3D " ${SRC_URI_KMETA}"
=20
 #
 # Corstone1000 KMACHINE
@@ -76,30 +75,6 @@ FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATHS}"
 COMPATIBLE_MACHINE:musca-b1 =3D "(^$)"
 COMPATIBLE_MACHINE:musca-s1 =3D "(^$)"
=20
-#
-# N1SDP KMACHINE
-#
-FILESEXTRAPATHS:prepend:n1sdp :=3D "${THISDIR}/linux-yocto-6.6/n1sdp:"
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
-KBUILD_DEFCONFIG:n1sdp =3D "defconfig"
-KCONFIG_MODE:n1sdp =3D "--alldefconfig"
-FILESEXTRAPATHS:prepend:n1sdp :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:n1sdp =3D " \
-    file://0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch=
 \
-    file://0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch \
-    file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
-    file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch=
 \
-    file://0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch=
 \
-    file://0006-arm64-defconfig-disable-config-options-that-does-not.patch=
 \
-    file://enable-nvme.cfg \
-    file://enable-realtek-R8169.cfg \
-    file://enable-usb_conn_gpio.cfg \
-    file://usb_xhci_pci_renesas.cfg \
-    "
-# Since we use the intree defconfig and the preempt-rt turns off some conf=
igs
-# do_kernel_configcheck will display warnings. So, lets disable it.
-KCONF_AUDIT_LEVEL:n1sdp:pn-linux-yocto-rt =3D "0"
-
 #
 # SGI575 KMACHINE
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0001-i=
ommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.6/n1sdp/0001-iommu-arm-smmu-v3-workaround-=
for-ATC_INV_SIZE_ALL-in.patch
deleted file mode 100644
index d7a47c654dd3..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0001-iommu-ar=
m-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 32ae4539865e64bcfb0c6955bdac8db5904e493d Mon Sep 17 00:00:00 2001
-From: Manoj Kumar <manoj.kumar3@arm.com>
-Date: Mon, 1 Feb 2021 21:36:43 +0530
-Subject: [PATCH] iommu/arm-smmu-v3: workaround for ATC_INV_SIZE_ALL in N1S=
DP
-
-ATC_INV_SIZE_ALL request should automatically translate to ATS
-address which is not happening in SMMUv3 version gone into
-N1SDP platform. This workaround manually sets the ATS address
-field to proper value for ATC_INV_SIZE_ALL command.
-
-Change-Id: If89465be94720a62be85e1e6612f17e93fa9b8a5
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-Upstream-Status: Inappropriate [Workaround]
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
----
- drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
- drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/a=
rm/arm-smmu-v3/arm-smmu-v3.c
-index d4d8bfee9feb..0524bf2ec021 100644
---- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
-@@ -1738,6 +1738,7 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova=
, size_t size,
- 	};
-=20
- 	if (!size) {
-+		cmd->atc.addr =3D ATC_INV_ADDR_ALL;
- 		cmd->atc.size =3D ATC_INV_SIZE_ALL;
- 		return;
- 	}
-diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/a=
rm/arm-smmu-v3/arm-smmu-v3.h
-index cd48590ada30..20892b2bfe1d 100644
---- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
-+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
-@@ -472,6 +472,7 @@ struct arm_smmu_cmdq_ent {
-=20
- 		#define CMDQ_OP_ATC_INV		0x40
- 		#define ATC_INV_SIZE_ALL	52
-+		#define ATC_INV_ADDR_ALL        0x7FFFFFFFFFFFF000UL
- 		struct {
- 			u32			sid;
- 			u32			ssid;
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0002-n=
1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-yocto-6.6/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-=
for-PCI-devices.patch
deleted file mode 100644
index cb72ed0a07d4..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0002-n1sdp-pc=
i_quirk-add-acs-override-for-PCI-devices.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From fc8605e74b51d9e0ab8efd0489eca2e11d807f07 Mon Sep 17 00:00:00 2001
-From: Manoj Kumar <manoj.kumar3@arm.com>
-Date: Tue, 31 Aug 2021 16:15:38 +0000
-Subject: [PATCH] n1sdp: pci_quirk: add acs override for PCI devices
-
-Patch taken from:
-https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/5.=
4/acso.patch
-
-Change-Id: Ib926bf50524ce9990fbaa2f2f8670fe84bd571f9
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
-
-Upstream-Status: Inappropriate [will not be submitted as its a workaround =
to address hardware issue]
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
----
- .../admin-guide/kernel-parameters.txt         |   8 ++
- drivers/pci/quirks.c                          | 102 ++++++++++++++++++
- 2 files changed, 110 insertions(+)
-
-diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentati=
on/admin-guide/kernel-parameters.txt
-index 963cdaecabcb..8e94af513b9f 100644
---- a/Documentation/admin-guide/kernel-parameters.txt
-+++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -4162,6 +4162,14 @@
- 		nomsi		[MSI] If the PCI_MSI kernel config parameter is
- 				enabled, this kernel boot option can be used to
- 				disable the use of MSI interrupts system-wide.
-+		pcie_acs_override [PCIE] Override missing PCIe ACS support for
-+				downstream
-+				All downstream ports - full ACS capabilities
-+				multfunction
-+				All multifunction devices - multifunction ACS subset
-+				id:nnnn:nnnn
-+				Specfic device - full ACS capabilities
-+				Specified as vid:did (vendor/device ID) in hex
- 		noioapicquirk	[APIC] Disable all boot interrupt quirks.
- 				Safety option to keep boot IRQs enabled. This
- 				should never be necessary.
-diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index 285acc4aaccc..d6ebef1f30db 100644
---- a/drivers/pci/quirks.c
-+++ b/drivers/pci/quirks.c
-@@ -3612,6 +3612,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
- 	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
- }
-=20
-+static bool acs_on_downstream;
-+static bool acs_on_multifunction;
-+
-+#define NUM_ACS_IDS 16
-+struct acs_on_id {
-+	unsigned short vendor;
-+	unsigned short device;
-+};
-+static struct acs_on_id acs_on_ids[NUM_ACS_IDS];
-+static u8 max_acs_id;
-+
-+static __init int pcie_acs_override_setup(char *p)
-+{
-+	if (!p)
-+		return -EINVAL;
-+
-+	while (*p) {
-+		if (!strncmp(p, "downstream", 10))
-+			acs_on_downstream =3D true;
-+		if (!strncmp(p, "multifunction", 13))
-+			acs_on_multifunction =3D true;
-+		if (!strncmp(p, "id:", 3)) {
-+			char opt[5];
-+			int ret;
-+			long val;
-+
-+			if (max_acs_id >=3D NUM_ACS_IDS - 1) {
-+				pr_warn("Out of PCIe ACS override slots (%d)\n",
-+						NUM_ACS_IDS);
-+				goto next;
-+			}
-+
-+			p +=3D 3;
-+			snprintf(opt, 5, "%s", p);
-+			ret =3D kstrtol(opt, 16, &val);
-+			if (ret) {
-+				pr_warn("PCIe ACS ID parse error %d\n", ret);
-+				goto next;
-+			}
-+			acs_on_ids[max_acs_id].vendor =3D val;
-+
-+			p +=3D strcspn(p, ":");
-+			if (*p !=3D ':') {
-+				pr_warn("PCIe ACS invalid ID\n");
-+				goto next;
-+			}
-+
-+			p++;
-+			snprintf(opt, 5, "%s", p);
-+			ret =3D kstrtol(opt, 16, &val);
-+			if (ret) {
-+				pr_warn("PCIe ACS ID parse error %d\n", ret);
-+				goto next;
-+			}
-+			acs_on_ids[max_acs_id].device =3D val;
-+			max_acs_id++;
-+		}
-+next:
-+		p +=3D strcspn(p, ",");
-+		if (*p =3D=3D ',')
-+			p++;
-+	}
-+
-+	if (acs_on_downstream || acs_on_multifunction || max_acs_id)
-+		pr_warn("Warning: PCIe ACS overrides enabled; This may allow non-IOMMU =
protected peer-to-peer DMA\n");
-+
-+	return 0;
-+}
-+early_param("pcie_acs_override", pcie_acs_override_setup);
-+
-+static int pcie_acs_overrides(struct pci_dev *dev, u16 acs_flags)
-+{
-+	int i;
-+
-+	/* Never override ACS for legacy devices or devices with ACS caps */
-+	if (!pci_is_pcie(dev) ||
-+		pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS))
-+			return -ENOTTY;
-+
-+	for (i =3D 0; i < max_acs_id; i++)
-+		if (acs_on_ids[i].vendor =3D=3D dev->vendor &&
-+			acs_on_ids[i].device =3D=3D dev->device)
-+				return 1;
-+
-+	switch (pci_pcie_type(dev)) {
-+	case PCI_EXP_TYPE_DOWNSTREAM:
-+	case PCI_EXP_TYPE_ROOT_PORT:
-+		if (acs_on_downstream)
-+			return 1;
-+		break;
-+	case PCI_EXP_TYPE_ENDPOINT:
-+	case PCI_EXP_TYPE_UPSTREAM:
-+	case PCI_EXP_TYPE_LEG_END:
-+	case PCI_EXP_TYPE_RC_END:
-+		if (acs_on_multifunction && dev->multifunction)
-+			return 1;
-+	}
-+
-+	return -ENOTTY;
-+}
-+
- /*
-  * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
-  * prevented for those affected devices.
-@@ -4980,6 +5081,7 @@ static const struct pci_dev_acs_enabled {
- 	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs },
- 	/* Wangxun nics */
- 	{ PCI_VENDOR_ID_WANGXUN, PCI_ANY_ID, pci_quirk_wangxun_nic_acs },
-+	{ PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
- 	{ 0 }
- };
-=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0003-p=
cie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/reci=
pes-kernel/linux/linux-yocto-6.6/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neov=
erse-N1SDP-platform.patch
deleted file mode 100644
index 9b439e472da1..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0003-pcie-Add=
-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
+++ /dev/null
@@ -1,324 +0,0 @@
-From 5aa5769af625c79589fd84b8afc06149c2362218 Mon Sep 17 00:00:00 2001
-From: Deepak Pandey <Deepak.Pandey@arm.com>
-Date: Fri, 31 May 2019 16:42:43 +0100
-Subject: [PATCH] pcie: Add quirk for the Arm Neoverse N1SDP platform
-
-The Arm N1SDP SoC suffers from some PCIe integration issues, most
-prominently config space accesses to not existing BDFs being answered
-with a bus abort, resulting in an SError.
-To mitigate this, the firmware scans the bus before boot (catching the
-SErrors) and creates a table with valid BDFs, which acts as a filter for
-Linux' config space accesses.
-
-Add code consulting the table as an ACPI PCIe quirk, also register the
-corresponding device tree based description of the host controller.
-Also fix the other two minor issues on the way, namely not being fully
-ECAM compliant and config space accesses being restricted to 32-bit
-accesses only.
-
-This allows the Arm Neoverse N1SDP board to boot Linux without crashing
-and to access *any* devices (there are no platform devices except UART).
-
-Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
-[Sudipto: extend to cover the CCIX root port as well]
-Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
-[Andre: fix coding style issues, rewrite some parts, add DT support]
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-
-Change-Id: I1d3a4b9bf6b3b883d262e3c4ff1f88a0eb81c1fe
-Upstream-Status: Inappropriate [will not be submitted as its a workaround =
to address hardware issue]
-Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
----
- arch/arm64/configs/defconfig        |   1 +
- drivers/acpi/pci_mcfg.c             |   7 +
- drivers/pci/controller/Kconfig      |  11 ++
- drivers/pci/controller/Makefile     |   2 +-
- drivers/pci/controller/pcie-n1sdp.c | 198 ++++++++++++++++++++++++++++
- include/linux/pci-ecam.h            |   2 +
- 6 files changed, 220 insertions(+), 1 deletion(-)
- create mode 100644 drivers/pci/controller/pcie-n1sdp.c
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index bbbc31391a65..973aa3b4d407 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -214,6 +214,7 @@ CONFIG_NFC_S3FWRN5_I2C=3Dm
- CONFIG_PCI=3Dy
- CONFIG_PCIEPORTBUS=3Dy
- CONFIG_PCIEAER=3Dy
-+CONFIG_PCI_QUIRKS=3Dy
- CONFIG_PCI_IOV=3Dy
- CONFIG_PCI_PASID=3Dy
- CONFIG_HOTPLUG_PCI=3Dy
-diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 860014b89b8e..2d4c1c699ffe 100644
---- a/drivers/acpi/pci_mcfg.c
-+++ b/drivers/acpi/pci_mcfg.c
-@@ -171,6 +171,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
- 	ALTRA_ECAM_QUIRK(1, 13),
- 	ALTRA_ECAM_QUIRK(1, 14),
- 	ALTRA_ECAM_QUIRK(1, 15),
-+
-+#define N1SDP_ECAM_MCFG(rev, seg, ops) \
-+	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
-+
-+	/* N1SDP SoC with v1 PCIe controller */
-+	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
-+	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
- #endif /* ARM64 */
-=20
- #ifdef CONFIG_LOONGARCH
-diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconf=
ig
-index bfd9bac37e24..7a65799dded7 100644
---- a/drivers/pci/controller/Kconfig
-+++ b/drivers/pci/controller/Kconfig
-@@ -50,6 +50,17 @@ config PCI_IXP4XX
- 	  Say Y here if you want support for the PCI host controller found
- 	  in the Intel IXP4xx XScale-based network processor SoC.
-=20
-+config PCIE_HOST_N1SDP_ECAM
-+	bool "ARM N1SDP PCIe Controller"
-+	depends on ARM64
-+	depends on OF || (ACPI && PCI_QUIRKS)
-+	select PCI_HOST_COMMON
-+	default y if ARCH_VEXPRESS
-+	help
-+	  Say Y here if you want PCIe support for the Arm N1SDP platform.
-+	  The controller is ECAM compliant, but needs a quirk to workaround
-+	  an integration issue.
-+
- config PCI_TEGRA
- 	bool "NVIDIA Tegra PCIe controller"
- 	depends on ARCH_TEGRA || COMPILE_TEST
-diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Make=
file
-index 37c8663de7fe..08e5afcf6e86 100644
---- a/drivers/pci/controller/Makefile
-+++ b/drivers/pci/controller/Makefile
-@@ -39,7 +39,7 @@ obj-$(CONFIG_PCI_LOONGSON) +=3D pci-loongson.o
- obj-$(CONFIG_PCIE_HISI_ERR) +=3D pcie-hisi-error.o
- obj-$(CONFIG_PCIE_APPLE) +=3D pcie-apple.o
- obj-$(CONFIG_PCIE_MT7621) +=3D pcie-mt7621.o
--
-+obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) +=3D pcie-n1sdp.o
- # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
- obj-y				+=3D dwc/
- obj-y				+=3D mobiveil/
-diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/=
pcie-n1sdp.c
-new file mode 100644
-index 000000000000..408699b9dcb1
---- /dev/null
-+++ b/drivers/pci/controller/pcie-n1sdp.c
-@@ -0,0 +1,198 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Copyright (C) 2018/2019 ARM Ltd.
-+ *
-+ * This quirk is to mask the following issues:
-+ * - PCIE SLVERR: config space accesses to invalid PCIe BDFs cause a bus
-+ *		  error (signalled as an asynchronous SError)
-+ * - MCFG BDF mapping: the root complex is mapped separately from the dev=
ice
-+ *		       config space
-+ * - Non 32-bit accesses to config space are not supported.
-+ *
-+ * At boot time the SCP board firmware creates a discovery table with
-+ * the root complex' base address and the valid BDF values, discovered wh=
ile
-+ * scanning the config space and catching the SErrors.
-+ * Linux responds only to the EPs listed in this table, returning NULL
-+ * for the rest.
-+ */
-+
-+#include <linux/kernel.h>
-+#include <linux/init.h>
-+#include <linux/ioport.h>
-+#include <linux/sizes.h>
-+#include <linux/of_pci.h>
-+#include <linux/of.h>
-+#include <linux/pci-ecam.h>
-+#include <linux/platform_device.h>
-+#include <linux/module.h>
-+
-+#include "../pci.h"
-+
-+/* Platform specific values as hardcoded in the firmware. */
-+#define AP_NS_SHARED_MEM_BASE	0x06000000
-+#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
-+#define BDF_TABLE_SIZE		SZ_16K
-+
-+/*
-+ * Shared memory layout as written by the SCP upon boot time:
-+ *  ----
-+ *  Discover data header --> RC base address
-+ *                       \-> BDF Count
-+ *  Discover data        --> BDF 0...n
-+ *  ----
-+ */
-+struct pcie_discovery_data {
-+	u32 rc_base_addr;
-+	u32 nr_bdfs;
-+	u32 valid_bdfs[0];
-+} *pcie_discovery_data[MAX_SEGMENTS];
-+
-+void __iomem *rc_remapped_addr[MAX_SEGMENTS];
-+
-+/*
-+ * map_bus() is called before we do a config space access for a certain
-+ * device. We use this to check whether this device is valid, avoiding
-+ * config space accesses which would result in an SError otherwise.
-+ */
-+static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int =
devfn,
-+				       int where)
-+{
-+	struct pci_config_window *cfg =3D bus->sysdata;
-+	unsigned int devfn_shift =3D cfg->ops->bus_shift - 8;
-+	unsigned int busn =3D bus->number;
-+	unsigned int segment =3D bus->domain_nr;
-+	unsigned int bdf_addr;
-+	unsigned int table_count, i;
-+	struct pci_dev *dev;
-+
-+	if (segment >=3D MAX_SEGMENTS ||
-+	    busn < cfg->busr.start || busn > cfg->busr.end)
-+		return NULL;
-+
-+	/* The PCIe root complex has a separate config space mapping. */
-+	if (busn =3D=3D 0 && devfn =3D=3D 0)
-+		return rc_remapped_addr[segment] + where;
-+
-+	dev =3D pci_get_domain_bus_and_slot(segment, busn, devfn);
-+	if (dev && dev->is_virtfn)
-+		return pci_ecam_map_bus(bus, devfn, where);
-+
-+	/* Accesses beyond the vendor ID always go to existing devices. */
-+	if (where > 0)
-+		return pci_ecam_map_bus(bus, devfn, where);
-+
-+	busn -=3D cfg->busr.start;
-+	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
-+	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
-+	for (i =3D 0; i < table_count; i++) {
-+		if (bdf_addr =3D=3D pcie_discovery_data[segment]->valid_bdfs[i])
-+			return pci_ecam_map_bus(bus, devfn, where);
-+	}
-+
-+	return NULL;
-+}
-+
-+static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int seg=
ment)
-+{
-+	phys_addr_t table_base;
-+	struct device *dev =3D cfg->parent;
-+	struct pcie_discovery_data *shared_data;
-+	size_t bdfs_size;
-+
-+	if (segment >=3D MAX_SEGMENTS)
-+		return -ENODEV;
-+
-+	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
-+
-+	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
-+				"PCIe valid BDFs")) {
-+		dev_err(dev, "PCIe BDF shared region request failed\n");
-+		return -ENOMEM;
-+	}
-+
-+	shared_data =3D devm_ioremap(dev,
-+				   table_base, BDF_TABLE_SIZE);
-+	if (!shared_data)
-+		return -ENOMEM;
-+
-+	/* Copy the valid BDFs structure to allocated normal memory. */
-+	bdfs_size =3D sizeof(struct pcie_discovery_data) +
-+		    sizeof(u32) * shared_data->nr_bdfs;
-+	pcie_discovery_data[segment] =3D devm_kmalloc(dev, bdfs_size, GFP_KERNEL=
);
-+	if (!pcie_discovery_data[segment])
-+		return -ENOMEM;
-+
-+	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
-+
-+	rc_remapped_addr[segment] =3D devm_ioremap(dev,
-+						 shared_data->rc_base_addr,
-+						 PCI_CFG_SPACE_EXP_SIZE);
-+	if (!rc_remapped_addr[segment]) {
-+		dev_err(dev, "Cannot remap root port base\n");
-+		return -ENOMEM;
-+	}
-+
-+	devm_iounmap(dev, shared_data);
-+
-+	return 0;
-+}
-+
-+/* Called for ACPI segment 0, and for all segments when using DT. */
-+static int pci_n1sdp_pcie_init(struct pci_config_window *cfg)
-+{
-+	struct platform_device *pdev =3D to_platform_device(cfg->parent);
-+	int segment =3D 0;
-+
-+	if (pdev->dev.of_node)
-+		segment =3D of_get_pci_domain_nr(pdev->dev.of_node);
-+	if (segment < 0 || segment > MAX_SEGMENTS) {
-+		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain pro=
perty\n");
-+		dev_err(&pdev->dev, "Or invalid segment number, must be smaller than %d=
\n",
-+			MAX_SEGMENTS);
-+		return -EINVAL;
-+	}
-+
-+	return pci_n1sdp_init(cfg, segment);
-+}
-+
-+/* Called for ACPI segment 1. */
-+static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
-+{
-+	return pci_n1sdp_init(cfg, 1);
-+}
-+
-+const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
-+	.bus_shift	=3D 20,
-+	.init		=3D pci_n1sdp_pcie_init,
-+	.pci_ops	=3D {
-+		.map_bus        =3D pci_n1sdp_map_bus,
-+		.read           =3D pci_generic_config_read32,
-+		.write          =3D pci_generic_config_write32,
-+	}
-+};
-+
-+const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D {
-+	.bus_shift	=3D 20,
-+	.init		=3D pci_n1sdp_ccix_init,
-+	.pci_ops	=3D {
-+		.map_bus        =3D pci_n1sdp_map_bus,
-+		.read           =3D pci_generic_config_read32,
-+		.write          =3D pci_generic_config_write32,
-+	}
-+};
-+
-+static const struct of_device_id n1sdp_pcie_of_match[] =3D {
-+	{ .compatible =3D "arm,n1sdp-pcie", .data =3D &pci_n1sdp_pcie_ecam_ops },
-+	{ },
-+};
-+MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
-+
-+static struct platform_driver n1sdp_pcie_driver =3D {
-+	.driver =3D {
-+		.name =3D KBUILD_MODNAME,
-+		.of_match_table =3D n1sdp_pcie_of_match,
-+		.suppress_bind_attrs =3D true,
-+	},
-+	.probe =3D pci_host_common_probe,
-+};
-+builtin_platform_driver(n1sdp_pcie_driver);
-diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index 6b1301e2498e..b3cf3adeab28 100644
---- a/include/linux/pci-ecam.h
-+++ b/include/linux/pci-ecam.h
-@@ -88,6 +88,8 @@ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops;=
 /* APM X-Gene PCIe v2.x
- extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PC=
Ie */
- extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
- extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe =
*/
-+extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PC=
Ie */
-+extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PC=
Ie */
- #endif
-=20
- #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0004-n=
1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.6/n1sdp/0004-n1sdp-pcie-add-quirk-support-=
enabling-remote-chip-PC.patch
deleted file mode 100644
index b804658b0015..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0004-n1sdp-pc=
ie-add-quirk-support-enabling-remote-chip-PC.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From b59e0d6c6035db80fc9044df0333f96ede53ad7a Mon Sep 17 00:00:00 2001
-From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
-Date: Wed, 9 Feb 2022 20:37:43 +0530
-Subject: [PATCH] n1sdp: pcie: add quirk support enabling remote chip PCIe
-
-Base address mapping for remote chip Root PCIe ECAM space.
-
-When two N1SDP boards are coupled via the CCIX connection, the PCI host
-complex of the remote board appears as PCIe segment 2 on the primary board.
-The resources of the secondary board, including the host complex, are
-mapped at offset 0x40000000000 into the address space of the primary
-board, so take that into account when accessing the remote PCIe segment.
-
-Change-Id: I0e8d1eb119aef6444b9df854a39b24441c12195a
-Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-
-Upstream-Status: Inappropriate [will not be submitted as its an hack requi=
red to fix the hardware issue]
-Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
----
- drivers/acpi/pci_mcfg.c             |  1 +
- drivers/pci/controller/pcie-n1sdp.c | 32 +++++++++++++++++++++++++----
- include/linux/pci-ecam.h            |  1 +
- 3 files changed, 30 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 2d4c1c699ffe..27f1e9a45c17 100644
---- a/drivers/acpi/pci_mcfg.c
-+++ b/drivers/acpi/pci_mcfg.c
-@@ -178,6 +178,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
- 	/* N1SDP SoC with v1 PCIe controller */
- 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
- 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
-+	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
- #endif /* ARM64 */
-=20
- #ifdef CONFIG_LOONGARCH
-diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/=
pcie-n1sdp.c
-index 408699b9dcb1..b3b02417fd7d 100644
---- a/drivers/pci/controller/pcie-n1sdp.c
-+++ b/drivers/pci/controller/pcie-n1sdp.c
-@@ -30,8 +30,10 @@
-=20
- /* Platform specific values as hardcoded in the firmware. */
- #define AP_NS_SHARED_MEM_BASE	0x06000000
--#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
-+/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip */
-+#define MAX_SEGMENTS		3
- #define BDF_TABLE_SIZE		SZ_16K
-+#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
-=20
- /*
-  * Shared memory layout as written by the SCP upon boot time:
-@@ -97,12 +99,17 @@ static int pci_n1sdp_init(struct pci_config_window *cf=
g, unsigned int segment)
- 	phys_addr_t table_base;
- 	struct device *dev =3D cfg->parent;
- 	struct pcie_discovery_data *shared_data;
--	size_t bdfs_size;
-+	size_t bdfs_size, rc_base_addr =3D 0;
-=20
- 	if (segment >=3D MAX_SEGMENTS)
- 		return -ENODEV;
-=20
--	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
-+	if (segment > 1) {
-+		rc_base_addr =3D REMOTE_CHIP_ADDR_OFFSET;
-+		table_base =3D AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
-+	} else {
-+		table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
-+	}
-=20
- 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
- 				"PCIe valid BDFs")) {
-@@ -114,6 +121,7 @@ static int pci_n1sdp_init(struct pci_config_window *cf=
g, unsigned int segment)
- 				   table_base, BDF_TABLE_SIZE);
- 	if (!shared_data)
- 		return -ENOMEM;
-+	rc_base_addr +=3D shared_data->rc_base_addr;
-=20
- 	/* Copy the valid BDFs structure to allocated normal memory. */
- 	bdfs_size =3D sizeof(struct pcie_discovery_data) +
-@@ -125,7 +133,7 @@ static int pci_n1sdp_init(struct pci_config_window *cf=
g, unsigned int segment)
- 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
-=20
- 	rc_remapped_addr[segment] =3D devm_ioremap(dev,
--						 shared_data->rc_base_addr,
-+						 rc_base_addr,
- 						 PCI_CFG_SPACE_EXP_SIZE);
- 	if (!rc_remapped_addr[segment]) {
- 		dev_err(dev, "Cannot remap root port base\n");
-@@ -161,6 +169,12 @@ static int pci_n1sdp_ccix_init(struct pci_config_wind=
ow *cfg)
- 	return pci_n1sdp_init(cfg, 1);
- }
-=20
-+/* Called for ACPI segment 2. */
-+static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
-+{
-+	return pci_n1sdp_init(cfg, 2);
-+}
-+
- const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
- 	.bus_shift	=3D 20,
- 	.init		=3D pci_n1sdp_pcie_init,
-@@ -181,6 +195,16 @@ const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D=
 {
- 	}
- };
-=20
-+const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops =3D {
-+	.bus_shift	=3D 20,
-+	.init		=3D pci_n1sdp_remote_pcie_init,
-+	.pci_ops	=3D {
-+		.map_bus        =3D pci_n1sdp_map_bus,
-+		.read           =3D pci_generic_config_read32,
-+		.write          =3D pci_generic_config_write32,
-+	}
-+};
-+
- static const struct of_device_id n1sdp_pcie_of_match[] =3D {
- 	{ .compatible =3D "arm,n1sdp-pcie", .data =3D &pci_n1sdp_pcie_ecam_ops },
- 	{ },
-diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index b3cf3adeab28..d4316795c00d 100644
---- a/include/linux/pci-ecam.h
-+++ b/include/linux/pci-ecam.h
-@@ -90,6 +90,7 @@ extern const struct pci_ecam_ops tegra194_pcie_ops; /* T=
egra194 PCIe */
- extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe =
*/
- extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PC=
Ie */
- extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PC=
Ie */
-+extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N=
1SDP PCIe */
- #endif
-=20
- #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0005-a=
rm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.6/n1sdp/0005-arm64-kpti-Whitelist-early-Ar=
m-Neoverse-N1-revisions.patch
deleted file mode 100644
index cc9d87170fa7..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0005-arm64-kp=
ti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ff02f77788f8c01e9d675912c063e89415804b7d Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Fri, 17 May 2019 17:39:27 +0100
-Subject: [PATCH] arm64: kpti: Whitelist early Arm Neoverse N1 revisions
-
-Early revisions (r1p0) of the Neoverse N1 core did not feature the
-CSV3 field in ID_AA64PFR0_EL1 to advertise they are not affected by
-the Spectre variant 3 (aka Meltdown) vulnerability.
-
-Add this particular revision to the whitelist to avoid enabling KPTI.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Change-Id: I78df055a3e674aefd195d41cc6dc4ee08b0af099
-Upstream-Status: Inappropriate
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
----
- arch/arm64/kernel/cpufeature.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature=
.c
-index b3f37e2209ad..b74210f38cd8 100644
---- a/arch/arm64/kernel/cpufeature.c
-+++ b/arch/arm64/kernel/cpufeature.c
-@@ -1646,6 +1646,7 @@ static bool unmap_kernel_at_el0(const struct arm64_c=
pu_capabilities *entry,
- 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
- 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
- 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
-+		MIDR_REV(MIDR_NEOVERSE_N1, 1, 0),	/* missing CSV3 */
- 		{ /* sentinel */ }
- 	};
- 	char const *str =3D "kpti command line option";
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0006-a=
rm64-defconfig-disable-config-options-that-does-not.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.6/n1sdp/0006-arm64-defconfig-disable-confi=
g-options-that-does-not.patch
deleted file mode 100644
index 6660ea5142e5..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/0006-arm64-de=
fconfig-disable-config-options-that-does-not.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From afdd5ae3eeb44381f906b6227422373d4af2811d Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 21 Sep 2022 15:54:14 +0100
-Subject: [PATCH] arm64: defconfig: disable config options that does not ap=
ply=20
- anymore
-
-Following config options should be not set to be more accurate and
-works with build system like yocto
-CONFIG_BT_HCIBTUSB
-CONFIG_BT_HCIBTUSB_MTK
-CONFIG_BT_HCIUART_MRVL
-CONFIG_BT_MRVL
-CONFIG_BT_MRVL_SDIO
-CONFIG_BT_QCOMSMD
-CONFIG_BT_NXPUART
-
-Upstream-Status: Pending [not submitted upstream yet]
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
----
- arch/arm64/configs/defconfig | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index d2b5208eb55d..b3028113de25 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -186,17 +186,17 @@ CONFIG_BT_HIDP=3Dm
- # CONFIG_BT_LE is not set
- CONFIG_BT_LEDS=3Dy
- # CONFIG_BT_DEBUGFS is not set
--CONFIG_BT_HCIBTUSB=3Dm
--CONFIG_BT_HCIBTUSB_MTK=3Dy
-+# CONFIG_BT_HCIBTUSB is not set
-+# CONFIG_BT_HCIBTUSB_MTK is not set
- CONFIG_BT_HCIUART=3Dm
- CONFIG_BT_HCIUART_LL=3Dy
- CONFIG_BT_HCIUART_BCM=3Dy
- CONFIG_BT_HCIUART_QCA=3Dy
--CONFIG_BT_HCIUART_MRVL=3Dy
--CONFIG_BT_MRVL=3Dm
--CONFIG_BT_MRVL_SDIO=3Dm
--CONFIG_BT_QCOMSMD=3Dm
--CONFIG_BT_NXPUART=3Dm
-+# CONFIG_BT_HCIUART_MRVL is not set
-+# CONFIG_BT_MRVL is not set
-+# CONFIG_BT_MRVL_SDIO is not set
-+# CONFIG_BT_QCOMSMD is not set
-+# CONFIG_BT_NXPUART is not set
- CONFIG_CFG80211=3Dm
- CONFIG_MAC80211=3Dm
- CONFIG_MAC80211_LEDS=3Dy
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable=
-nvme.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable-=
nvme.cfg
deleted file mode 100644
index 268103555ed7..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable-nvme.c=
fg
+++ /dev/null
@@ -1,3 +0,0 @@
-# Enable NVMe flash storage support
-CONFIG_NVME_CORE=3Dy
-CONFIG_BLK_DEV_NVME=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable=
-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sd=
p/enable-realtek-R8169.cfg
deleted file mode 100644
index 7a5747407cb4..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable-realte=
k-R8169.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-# Enable Realtek Gigabit Ethernet adapter
-CONFIG_REALTEK_PHY=3Dy
-CONFIG_R8169=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable=
-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sd=
p/enable-usb_conn_gpio.cfg
deleted file mode 100644
index 128c902710d8..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/enable-usb_co=
nn_gpio.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-# PHY_TEGRA_XUSB sets this to y, but its set as m in defconfig
-CONFIG_USB_CONN_GPIO=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/usb_xh=
ci_pci_renesas.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sd=
p/usb_xhci_pci_renesas.cfg
deleted file mode 100644
index c06507c0606b..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.6/n1sdp/usb_xhci_pci_=
renesas.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-# CONFIG_USB_XHCI_PCI is not set
-# CONFIG_USB_XHCI_PCI_RENESAS is not set
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-=
plat-n1sdp-add-N1SDP-platform-support.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-os/n1sdp/0001-plat-n1sdp-add-N1SDP-platform-support.patch
deleted file mode 100644
index 3bb460a3c911..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-plat-n1=
sdp-add-N1SDP-platform-support.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From 56f2afcd10e8404a3c4efed6277a005fc4099e48 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Thu, 30 Jun 2022 18:36:26 +0100
-Subject: [PATCH] plat-n1sdp: add N1SDP platform support
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-These changes are to add N1SDP platform to optee-os
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- core/arch/arm/plat-n1sdp/conf.mk           | 41 +++++++++++++++++
- core/arch/arm/plat-n1sdp/main.c            | 53 ++++++++++++++++++++++
- core/arch/arm/plat-n1sdp/n1sdp_core_pos.S  | 32 +++++++++++++
- core/arch/arm/plat-n1sdp/platform_config.h | 49 ++++++++++++++++++++
- core/arch/arm/plat-n1sdp/sub.mk            |  3 ++
- 5 files changed, 178 insertions(+)
- create mode 100644 core/arch/arm/plat-n1sdp/conf.mk
- create mode 100644 core/arch/arm/plat-n1sdp/main.c
- create mode 100644 core/arch/arm/plat-n1sdp/n1sdp_core_pos.S
- create mode 100644 core/arch/arm/plat-n1sdp/platform_config.h
- create mode 100644 core/arch/arm/plat-n1sdp/sub.mk
-
-diff --git a/core/arch/arm/plat-n1sdp/conf.mk b/core/arch/arm/plat-n1sdp/c=
onf.mk
-new file mode 100644
-index 000000000..3dc79fe20
---- /dev/null
-+++ b/core/arch/arm/plat-n1sdp/conf.mk
-@@ -0,0 +1,41 @@
-+include core/arch/arm/cpu/cortex-armv8-0.mk
-+
-+CFG_DEBUG_INFO =3D y
-+CFG_TEE_CORE_LOG_LEVEL =3D 4
-+
-+# Workaround 808870: Unconditional VLDM instructions might cause an
-+# alignment fault even though the address is aligned
-+# Either hard float must be disabled for AArch32 or strict alignment chec=
ks
-+# must be disabled
-+ifeq ($(CFG_SCTLR_ALIGNMENT_CHECK),y)
-+$(call force,CFG_TA_ARM32_NO_HARD_FLOAT_SUPPORT,y)
-+else
-+$(call force,CFG_SCTLR_ALIGNMENT_CHECK,n)
-+endif
-+
-+CFG_ARM64_core ?=3D y
-+
-+CFG_ARM_GICV3 =3D y
-+
-+# ARM debugger needs this
-+platform-cflags-debug-info =3D -gdwarf-4
-+platform-aflags-debug-info =3D -gdwarf-4
-+
-+CFG_CORE_SEL1_SPMC	=3D y
-+CFG_WITH_ARM_TRUSTED_FW	=3D y
-+
-+$(call force,CFG_GIC,y)
-+$(call force,CFG_PL011,y)
-+$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
-+
-+CFG_CORE_HEAP_SIZE =3D 0x32000 # 200kb
-+
-+CFG_TEE_CORE_NB_CORE =3D 4
-+CFG_TZDRAM_START ?=3D 0xDE000000
-+CFG_TZDRAM_SIZE  ?=3D 0x02000000
-+
-+CFG_SHMEM_START  ?=3D 0x83000000
-+CFG_SHMEM_SIZE   ?=3D 0x00210000
-+# DRAM1 is defined above 4G
-+$(call force,CFG_CORE_LARGE_PHYS_ADDR,y)
-+$(call force,CFG_CORE_ARM64_PA_BITS,36)
-diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/ma=
in.c
-new file mode 100644
-index 000000000..38212d84c
---- /dev/null
-+++ b/core/arch/arm/plat-n1sdp/main.c
-@@ -0,0 +1,53 @@
-+// SPDX-License-Identifier: BSD-2-Clause
-+/*
-+ * Copyright (c) 2022, Arm Limited.
-+ */
-+
-+#include <arm.h>
-+#include <console.h>
-+#include <drivers/gic.h>
-+#include <drivers/pl011.h>
-+#include <drivers/tzc400.h>
-+#include <initcall.h>
-+#include <keep.h>
-+#include <kernel/boot.h>
-+#include <kernel/interrupt.h>
-+#include <kernel/misc.h>
-+#include <kernel/notif.h>
-+#include <kernel/panic.h>
-+#include <kernel/spinlock.h>
-+#include <kernel/tee_time.h>
-+#include <mm/core_memprot.h>
-+#include <mm/core_mmu.h>
-+#include <platform_config.h>
-+#include <sm/psci.h>
-+#include <stdint.h>
-+#include <string.h>
-+#include <trace.h>
-+
-+static struct pl011_data console_data __nex_bss;
-+
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZ=
E);
-+
-+register_ddr(DRAM0_BASE, DRAM0_SIZE);
-+
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_DIST_REG_SIZE);
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICR_BASE, GIC_DIST_REG_SIZE);
-+
-+void main_init_gic(void)
-+{
-+	gic_init(GICC_BASE, GICD_BASE);
-+}
-+
-+void main_secondary_init_gic(void)
-+{
-+	gic_init_per_cpu();
-+}
-+
-+void console_init(void)
-+{
-+	pl011_init(&console_data, CONSOLE_UART_BASE, CONSOLE_UART_CLK_IN_HZ,
-+		   CONSOLE_BAUDRATE);
-+	register_serial_console(&console_data.chip);
-+}
-diff --git a/core/arch/arm/plat-n1sdp/n1sdp_core_pos.S b/core/arch/arm/pla=
t-n1sdp/n1sdp_core_pos.S
-new file mode 100644
-index 000000000..439d4e675
---- /dev/null
-+++ b/core/arch/arm/plat-n1sdp/n1sdp_core_pos.S
-@@ -0,0 +1,32 @@
-+/* SPDX-License-Identifier: BSD-2-Clause */
-+/*
-+ * Copyright (c) 2022, Arm Limited
-+ */
-+
-+#include <asm.S>
-+#include <arm.h>
-+#include "platform_config.h"
-+
-+FUNC get_core_pos_mpidr , :
-+        mov     x4, x0
-+
-+        /*
-+         * The MT bit in MPIDR is always set for n1sdp and the
-+         * affinity level 0 corresponds to thread affinity level.
-+         */
-+
-+        /* Extract individual affinity fields from MPIDR */
-+        ubfx    x0, x4, #MPIDR_AFF0_SHIFT, #MPIDR_AFFINITY_BITS
-+        ubfx    x1, x4, #MPIDR_AFF1_SHIFT, #MPIDR_AFFINITY_BITS
-+        ubfx    x2, x4, #MPIDR_AFF2_SHIFT, #MPIDR_AFFINITY_BITS
-+        ubfx    x3, x4, #MPIDR_AFF3_SHIFT, #MPIDR_AFFINITY_BITS
-+
-+        /* Compute linear position */
-+        mov     x4, #N1SDP_MAX_CLUSTERS_PER_CHIP
-+        madd    x2, x3, x4, x2
-+        mov     x4, #N1SDP_MAX_CPUS_PER_CLUSTER
-+        madd    x1, x2, x4, x1
-+        mov     x4, #N1SDP_MAX_PE_PER_CPU
-+        madd    x0, x1, x4, x0
-+        ret
-+END_FUNC get_core_pos_mpidr
-diff --git a/core/arch/arm/plat-n1sdp/platform_config.h b/core/arch/arm/pl=
at-n1sdp/platform_config.h
-new file mode 100644
-index 000000000..81b994091
---- /dev/null
-+++ b/core/arch/arm/plat-n1sdp/platform_config.h
-@@ -0,0 +1,49 @@
-+/* SPDX-License-Identifier: BSD-2-Clause */
-+/*
-+ * Copyright (c) 2022, Arm Limited
-+ */
-+
-+#ifndef PLATFORM_CONFIG_H
-+#define PLATFORM_CONFIG_H
-+
-+#include <mm/generic_ram_layout.h>
-+#include <stdint.h>
-+
-+/* Make stacks aligned to data cache line length */
-+#define STACK_ALIGNMENT		64
-+
-+ /* N1SDP topology related constants */
-+#define N1SDP_MAX_CPUS_PER_CLUSTER              U(2)
-+#define PLAT_ARM_CLUSTER_COUNT                  U(2)
-+#define PLAT_N1SDP_CHIP_COUNT                   U(2)
-+#define N1SDP_MAX_CLUSTERS_PER_CHIP             U(2)
-+#define N1SDP_MAX_PE_PER_CPU                    U(1)
-+
-+#define PLATFORM_CORE_COUNT                     (PLAT_N1SDP_CHIP_COUNT * =
       \
-+		                                PLAT_ARM_CLUSTER_COUNT *        \
-+						N1SDP_MAX_CPUS_PER_CLUSTER *    \
-+						N1SDP_MAX_PE_PER_CPU)
-+
-+#define GIC_BASE		0x2c010000
-+
-+#define UART1_BASE		0x1C0A0000
-+#define UART1_CLK_IN_HZ		24000000  /*24MHz*/
-+
-+#define CONSOLE_UART_BASE	UART1_BASE
-+#define CONSOLE_UART_CLK_IN_HZ	UART1_CLK_IN_HZ
-+
-+#define DRAM0_BASE		0x80000000
-+#define DRAM0_SIZE		0x80000000
-+
-+#define GICD_BASE		0x30000000
-+#define GICC_BASE		0x2C000000
-+#define GICR_BASE		0x300C0000
-+
-+#ifndef UART_BAUDRATE
-+#define UART_BAUDRATE		115200
-+#endif
-+#ifndef CONSOLE_BAUDRATE
-+#define CONSOLE_BAUDRATE	UART_BAUDRATE
-+#endif
-+
-+#endif /*PLATFORM_CONFIG_H*/
-diff --git a/core/arch/arm/plat-n1sdp/sub.mk b/core/arch/arm/plat-n1sdp/su=
b.mk
-new file mode 100644
-index 000000000..a0b49da14
---- /dev/null
-+++ b/core/arch/arm/plat-n1sdp/sub.mk
-@@ -0,0 +1,3 @@
-+global-incdirs-y +=3D .
-+srcs-y +=3D main.c
-+srcs-y	+=3D n1sdp_core_pos.S
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-=
Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/files/op=
tee-os/n1sdp/0002-Handle-logging-syscall.patch
deleted file mode 100644
index 0955d99f373a..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-Handle-=
logging-syscall.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending [upstreamed differently in 280b6a3]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17 00:00:00 2001
-From: Balint Dobszay <balint.dobszay@arm.com>
-Date: Fri, 15 Jul 2022 13:45:54 +0200
-Subject: [PATCH] Handle logging syscall
-
-Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
-Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4
-
-
-diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kernel=
/spmc_sp_handler.c
-index e0fa0aa6..c7a45387 100644
---- a/core/arch/arm/kernel/spmc_sp_handler.c
-+++ b/core/arch/arm/kernel/spmc_sp_handler.c
-@@ -1277,6 +1277,13 @@ void spmc_sp_msg_handler(struct thread_smc_args *ar=
gs,
- 			sp_enter(args, caller_sp);
- 			break;
-=20
-+		case 0xdeadbeef:
-+			ts_push_current_session(&caller_sp->ts_sess);
-+			IMSG("%s", (char *)args->a1);
-+			ts_pop_current_session();
-+			sp_enter(args, caller_sp);
-+			break;
-+
- 		default:
- 			EMSG("Unhandled FFA function ID %#"PRIx32,
- 			     (uint32_t)args->a0);
---=20
-2.17.1
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-=
plat-n1sdp-register-DRAM1-to-optee-os.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-os/n1sdp/0003-plat-n1sdp-register-DRAM1-to-optee-os.patch
deleted file mode 100644
index d9e20f8c76fc..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-plat-n1=
sdp-register-DRAM1-to-optee-os.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 2eb1da30564428551ca687d456d848129105abac Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Tue, 25 Oct 2022 19:08:49 +0100
-Subject: [PATCH] plat-n1sdp: register DRAM1 to optee-os
-
-N1SDP supports two DRAM's. This change is to add 2nd DRAM
-starting at 0x8080000000 address.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-diff --git a/core/arch/arm/plat-n1sdp/conf.mk b/core/arch/arm/plat-n1sdp/c=
onf.mk
-index 06b4975a..5374e406 100644
---- a/core/arch/arm/plat-n1sdp/conf.mk
-+++ b/core/arch/arm/plat-n1sdp/conf.mk
-@@ -38,4 +38,4 @@ CFG_SHMEM_START  ?=3D 0x83000000
- CFG_SHMEM_SIZE   ?=3D 0x00210000
- # DRAM1 is defined above 4G
- $(call force,CFG_CORE_LARGE_PHYS_ADDR,y)
--$(call force,CFG_CORE_ARM64_PA_BITS,36)
-+$(call force,CFG_CORE_ARM64_PA_BITS,42)
-diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/ma=
in.c
-index cfb7f19b..bb951ce6 100644
---- a/core/arch/arm/plat-n1sdp/main.c
-+++ b/core/arch/arm/plat-n1sdp/main.c
-@@ -33,6 +33,7 @@ static struct pl011_data console_data __nex_bss;
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZ=
E);
-=20
- register_ddr(DRAM0_BASE, DRAM0_SIZE);
-+register_ddr(DRAM1_BASE, DRAM1_SIZE);
-=20
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_DIST_REG_SIZE);
-diff --git a/core/arch/arm/plat-n1sdp/platform_config.h b/core/arch/arm/pl=
at-n1sdp/platform_config.h
-index 81b99409..bf0a3c83 100644
---- a/core/arch/arm/plat-n1sdp/platform_config.h
-+++ b/core/arch/arm/plat-n1sdp/platform_config.h
-@@ -35,6 +35,9 @@
- #define DRAM0_BASE		0x80000000
- #define DRAM0_SIZE		0x80000000
-=20
-+#define DRAM1_BASE		0x8080000000ULL
-+#define DRAM1_SIZE		0x80000000ULL
-+
- #define GICD_BASE		0x30000000
- #define GICC_BASE		0x2C000000
- #define GICR_BASE		0x300C0000
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-=
plat-n1sdp-add-external-device-tree-base-and-size.patch b/meta-arm-bsp/reci=
pes-security/optee/files/optee-os/n1sdp/0004-plat-n1sdp-add-external-device=
-tree-base-and-size.patch
deleted file mode 100644
index 74c94e0afefb..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-plat-n1=
sdp-add-external-device-tree-base-and-size.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
-From 1a9aeedda58228893add545e49d2d6cd4c316b4f Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Tue, 13 Dec 2022 13:45:06 +0000
-Subject: [PATCH] plat-n1sdp: add external device tree base and size
-
-Adds external device tree address and size. It also
-register this physical memory so optee can read the device tree.
----
- core/arch/arm/plat-n1sdp/main.c            | 1 +
- core/arch/arm/plat-n1sdp/platform_config.h | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/ma=
in.c
-index bb951ce6b..ab76f60c6 100644
---- a/core/arch/arm/plat-n1sdp/main.c
-+++ b/core/arch/arm/plat-n1sdp/main.c
-@@ -31,6 +31,7 @@ static struct gic_data gic_data __nex_bss;
- static struct pl011_data console_data __nex_bss;
-=20
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZ=
E);
-+register_phys_mem_pgdir(MEM_AREA_EXT_DT, EXT_DT_BASE, EXT_DT_SIZE);
-=20
- register_ddr(DRAM0_BASE, DRAM0_SIZE);
- register_ddr(DRAM1_BASE, DRAM1_SIZE);
-diff --git a/core/arch/arm/plat-n1sdp/platform_config.h b/core/arch/arm/pl=
at-n1sdp/platform_config.h
-index bf0a3c834..8741a2503 100644
---- a/core/arch/arm/plat-n1sdp/platform_config.h
-+++ b/core/arch/arm/plat-n1sdp/platform_config.h
-@@ -42,6 +42,9 @@
- #define GICC_BASE		0x2C000000
- #define GICR_BASE		0x300C0000
-=20
-+#define EXT_DT_BASE		0x04001600
-+#define EXT_DT_SIZE		0x200
-+
- #ifndef UART_BAUDRATE
- #define UART_BAUDRATE		115200
- #endif
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc=
 b/meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc
deleted file mode 100644
index c090834c391e..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-generic-n1sdp.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
-OPTEEMACHINE:n1sdp =3D "n1sdp"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/meta-=
arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
deleted file mode 100644
index c261ce1651d3..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-# N1 SDP specific configuration for optee-os
-
-require optee-os-generic-n1sdp.inc
-
-TS_INSTALL_PREFIX_PATH =3D "${RECIPE_SYSROOT}/firmware/sp/opteesp"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/n1sdp:"
-SRC_URI:append =3D " \
-    file://0001-plat-n1sdp-add-N1SDP-platform-support.patch \
-    file://0002-Handle-logging-syscall.patch \
-    file://0003-plat-n1sdp-register-DRAM1-to-optee-os.patch \
-    file://0004-plat-n1sdp-add-external-device-tree-base-and-size.patch \
-    "
-
-EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D4"
-
-EXTRA_OEMAKE +=3D " CFG_TEE_BENCHMARK=3Dn"
-
-EXTRA_OEMAKE +=3D " CFG_CORE_SEL1_SPMC=3Dy CFG_CORE_FFA=3Dy"
-
-EXTRA_OEMAKE +=3D " CFG_WITH_SP=3Dy"
-
-EXTRA_OEMAKE +=3D " CFG_DT=3Dy"
-
-EXTRA_OEMAKE +=3D " CFG_SECURE_PARTITION=3Dy"
-
-EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3Dy"
-
-EXTRA_OEMAKE +=3D " CFG_ENABLE_EMBEDDED_TESTS=3Dy"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbap=
pend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbappend
index c9b48be22da5..13c260da3d1c 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbappend
@@ -1,7 +1,6 @@
 # Machine specific configurations
=20
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:fvp-base =3D "optee-os-fvp-base.inc"
=20
 require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend b/me=
ta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
index 04f7dc913a3c..a69920354a0c 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
@@ -3,7 +3,6 @@
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.in=
c"
 MACHINE_OPTEE_OS_REQUIRE:fvp-base =3D "optee-os-fvp-base.inc"
-MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
 MACHINE_OPTEE_OS_REQUIRE:sbsa-ref =3D "optee-os-sbsa-ref.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend b/=
meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
index 249d67f08b9f..25654f17201b 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
@@ -1,7 +1,6 @@
 # Machine specific configurations
=20
 MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
-MACHINE_OPTEE_TEST_REQUIRE:n1sdp =3D "optee-os-generic-n1sdp.inc"
 MACHINE_OPTEE_TEST_REQUIRE:fvp-base =3D "optee-test-fvp-base.inc"
=20
 require ${MACHINE_OPTEE_TEST_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-te=
sts.bbappend b/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-=
tests.bbappend
index 35137220adee..a956106cc283 100644
--- a/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bba=
ppend
+++ b/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bba=
ppend
@@ -1,3 +1,2 @@
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platform=
s.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
index 64d6571417d2..a0071aa8ff46 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -13,8 +13,5 @@ SRC_URI:append:corstone1000  =3D " \
     file://0009-Remove-Werror-flag.patch \
     "
=20
-
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
-
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
 TS_PLATFORM:fvp-base =3D "arm/fvp/fvp_base_revc-2xaemv8a"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bba=
ppend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
index 77fb7ae26634..708f59862f3d 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
@@ -5,5 +5,4 @@ SRC_URI:append:corstone1000 =3D " \
   file://0001-newlib-memcpy-remove-optimized-version.patch;patchdir=3D../n=
ewlib \
 "
=20
-COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm-bsp/wic/n1sdp-efidisk.wks b/meta-arm-bsp/wic/n1sdp-ef=
idisk.wks
deleted file mode 100644
index b131dd842fb0..000000000000
--- a/meta-arm-bsp/wic/n1sdp-efidisk.wks
+++ /dev/null
@@ -1,9 +0,0 @@
-# short-description: Create an EFI disk image
-# long-description: Creates a partitioned EFI disk image that the user
-# can directly dd to boot media. Uses a custom grub.cfg file to configure =
the boot.
-
-part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --ond=
isk sda --label msdos --active --align 1024
-
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align 1=
024 --uuid=3D6a60524d-061d-454a-bfd1-38989910eccd
-
-bootloader --ptable gpt --configfile=3D"n1sdp-grub.cfg" --timeout=3D5
diff --git a/meta-arm-bsp/wic/n1sdp-grub.cfg b/meta-arm-bsp/wic/n1sdp-grub.=
cfg
deleted file mode 100644
index 7323ec746833..000000000000
--- a/meta-arm-bsp/wic/n1sdp-grub.cfg
+++ /dev/null
@@ -1,18 +0,0 @@
-set debug=3D"loader,mm"
-set term=3D"vt100"
-set default=3D"0"
-set timeout=3D"5"
-
-menuentry 'Arm reference image boot on N1SDP (ACPI)' {
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4 acpi=3Dforce
-}
-
-menuentry 'Arm reference image boot on Single-Chip N1SDP (Device Tree)' {
-        devicetree /n1sdp-single-chip.dtb
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4
-}
-
-menuentry 'Arm reference image boot on Multi-Chip N1SDP (Device Tree)' {
-        devicetree /n1sdp-multi-chip.dtb
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4
-}
--=20
2.39.3 (Apple Git-146)


