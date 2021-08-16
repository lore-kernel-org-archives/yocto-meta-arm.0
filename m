Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22183.1629109580010312867
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 03:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: usama.arif@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 478FB6D;
	Mon, 16 Aug 2021 03:26:18 -0700 (PDT)
Received: from usaari01.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 584C93F40C;
	Mon, 16 Aug 2021 03:26:17 -0700 (PDT)
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp/tc1: Add support for new TC1 platform
Date: Mon, 16 Aug 2021 11:26:14 +0100
Message-Id: <20210816102614.11636-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1

The same patches are used by tc0 and tc1. Hence rename the folders
that contain the Total Compute patches to be called "tc". The
artifacts image is used by both tc0 and tc1, hence renamed to
tc-artifacts-image.

Signed-off-by: Usama Arif <usama.arif@arm.com>
Change-Id: Ib0b4fbca9a009c432c1e6696c5437a7d24a25d1f
---
 .gitlab-ci.yml                                |  3 ++
 ci/tc1.yml                                    |  6 +++
 meta-arm-bsp/conf/machine/include/tc.inc      | 39 +++++++++++++++++++
 meta-arm-bsp/conf/machine/tc0.conf            | 38 +-----------------
 meta-arm-bsp/conf/machine/tc1.conf            |  7 ++++
 meta-arm-bsp/documentation/tc0.md             |  4 +-
 meta-arm-bsp/documentation/tc1.md             | 32 +++++++++++++++
 .../recipes-bsp/hafnium/hafnium-tc.inc        |  9 +++++
 .../recipes-bsp/hafnium/hafnium-tc0.inc       |  7 ----
 .../recipes-bsp/hafnium/hafnium_2.5.bbappend  |  2 +-
 ...tifacts-image.bb => tc-artifacts-image.bb} |  2 +-
 ...p-firmware-tc0.inc => scp-firmware-tc.inc} |  9 +++--
 .../scp-firmware/scp-firmware_2.8%.bbappend   |  2 +-
 ...re-a-tc0.inc => trusted-firmware-a-tc.inc} | 14 +++++--
 .../trusted-firmware-a_2.5.bbappend           |  2 +-
 ...ove-bootargs-from-Total-Compute-conf.patch |  0
 ...0002-cmd-part-Correct-error-handling.patch |  0
 .../u-boot-2021.07/{tc0 => tc}/bootargs.cfg   |  0
 .../u-boot/u-boot_2021.07.bbappend            | 10 ++++-
 .../linux/linux-arm-platforms.inc             | 17 ++++++--
 ...m-Add-component-aware-simple-encoder.patch |  0
 ...dd-RENDER-capability-to-the-device-n.patch |  0
 ...Adapt-ION-interface-to-match-Android.patch |  0
 ...dings-mailbox-arm-mhuv2-Add-bindings.patch |  0
 .../0005-mailbox-arm_mhuv2-Add-driver.patch   |  0
 ...ailbox-arm_mhuv2-Fix-sparse-warnings.patch |  0
 ...uv2-make-remove-callback-return-void.patch |  0
 ...2-Skip-calling-kfree-with-invalid-po.patch |  0
 ...support-for-SMCCCv1.2-extended-input.patch |  0
 ...-Add-initial-FFA-bus-support-for-dev.patch |  0
 ...a-Add-initial-Arm-FFA-driver-support.patch |  0
 ...-Add-support-for-SMCCC-as-transport-.patch |  0
 ...-Setup-in-kernel-users-of-FFA-partit.patch |  0
 ..._ffa-Add-support-for-MEM_-interfaces.patch |  0
 ...e-add-sec_world_id-to-struct-tee_shm.patch |  0
 .../0016-optee-simplify-optee_release.patch   |  0
 .../0017-optee-sync-OP-TEE-headers.patch      |  0
 ...actor-driver-with-internal-callbacks.patch |  0
 .../0019-optee-add-a-FF-A-memory-pool.patch   |  0
 .../0020-optee-add-FF-A-support.patch         |  0
 ...-optee-hack-for-UUID-endianess-issue.patch |  0
 ...022-arm_ffa-add-support-for-FFA-v1.1.patch | 37 ++++++++++++++++++
 .../{tc0 => tc}/defconfig                     |  0
 .../0001-WIP-Enable-managed-exit.patch        |  0
 ...e-Update-messaging-method-for-manage.patch | 27 +++++++++++++
 ...nction-ID-according-to-FFA-v1.1-spec.patch | 29 ++++++++++++++
 .../files/optee-os/{tc0 => tc}/sp_layout.json |  0
 ...tee-client-tc0.inc => optee-client-tc.inc} |  2 +-
 .../optee/optee-client_3.14.0.bbappend        |  2 +-
 .../{optee-os-tc0.inc => optee-os-tc.inc}     | 16 +++++---
 .../optee/optee-os_3.14.0.bbappend            |  2 +-
 .../{optee-test-tc0.inc => optee-test-tc.inc} |  2 +-
 .../optee/optee-test_3.14.0.bbappend          |  2 +-
 53 files changed, 251 insertions(+), 71 deletions(-)
 create mode 100644 ci/tc1.yml
 create mode 100644 meta-arm-bsp/conf/machine/include/tc.inc
 create mode 100644 meta-arm-bsp/conf/machine/tc1.conf
 create mode 100644 meta-arm-bsp/documentation/tc1.md
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
 rename meta-arm-bsp/recipes-bsp/images/{tc0-artifacts-image.bb => tc-artifacts-image.bb} (91%)
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware-tc0.inc => scp-firmware-tc.inc} (58%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a-tc0.inc => trusted-firmware-a-tc.inc} (67%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/{tc0 => tc}/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/{tc0 => tc}/0002-cmd-part-Correct-error-handling.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/{tc0 => tc}/bootargs.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0001-drm-Add-component-aware-simple-encoder.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0003-Adapt-ION-interface-to-match-Android.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0005-mailbox-arm_mhuv2-Add-driver.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0015-tee-add-sec_world_id-to-struct-tee_shm.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0016-optee-simplify-optee_release.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0017-optee-sync-OP-TEE-headers.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0018-optee-refactor-driver-with-internal-callbacks.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0019-optee-add-a-FF-A-memory-pool.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0020-optee-add-FF-A-support.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/0021-drivers-optee-hack-for-UUID-endianess-issue.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-arm_ffa-add-support-for-FFA-v1.1.patch
 rename meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/{tc0 => tc}/defconfig (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/{tc0 => tc}/0001-WIP-Enable-managed-exit.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/{tc0 => tc}/sp_layout.json (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-client-tc0.inc => optee-client-tc.inc} (71%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os-tc0.inc => optee-os-tc.inc} (63%)
 rename meta-arm-bsp/recipes-security/optee/{optee-test-tc0.inc => optee-test-tc.inc} (50%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bbd4c91..1e2fe13 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -181,6 +181,9 @@ sgi575:
 tc0:
   extends: .build
 
+tc1:
+  extends: .build
+
 
 #
 # Utility tasks, not executed automatically
diff --git a/ci/tc1.yml b/ci/tc1.yml
new file mode 100644
index 0000000..137041d
--- /dev/null
+++ b/ci/tc1.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: tc1
diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf/machine/include/tc.inc
new file mode 100644
index 0000000..fb2362d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -0,0 +1,39 @@
+TUNE_FEATURES = "aarch64"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+MACHINEOVERRIDES =. "tc:"
+
+# Das U-boot
+UBOOT_MACHINE ?= "total_compute_defconfig"
+PREFERRED_VERSION_u-boot ?= "2021.07"
+UBOOT_RD_LOADADDRESS = "0x88000000"
+UBOOT_RD_ENTRYPOINT = "0x88000000"
+UBOOT_LOADADDRESS = "0x80080000"
+UBOOT_ENTRYPOINT = "0x80080000"
+# Below options will generate a key to sign the kernel Image and INITRAMFS_IMAGE
+# according to the default parameters of kernel-fitimage.bbclass. If the user
+# would prefer to use their own keys, disable the key generation using the
+# FIT_GENERATE_KEYS parameter and specify the location of the keys using the
+# below paramters.
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME = "dev_key"
+UBOOT_SIGN_KEYDIR = "${DEPLOY_DIR_IMAGE}/keys"
+FIT_GENERATE_KEYS = "1"
+
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-arm64-ack"
+PREFERRED_VERSION_linux-arm64-ack ?= "5.10"
+
+# Cannot use the default zImage on arm64
+KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPES += "fitImage"
+KERNEL_CLASSES = " kernel-fitimage "
+
+IMAGE_FSTYPES += "cpio.gz"
+INITRAMFS_IMAGE ?= "core-image-minimal"
+
+SERIAL_CONSOLES = "115200;ttyAMA0"
\ No newline at end of file
diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index 565afda..b9c762d 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -4,40 +4,4 @@
 #@NAME: TC0
 #@DESCRIPTION: Machine configuration for TC0
 
-TUNE_FEATURES = "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Das U-boot
-UBOOT_MACHINE ?= "total_compute_defconfig"
-PREFERRED_VERSION_u-boot ?= "2021.07"
-UBOOT_RD_LOADADDRESS = "0x88000000"
-UBOOT_RD_ENTRYPOINT = "0x88000000"
-UBOOT_LOADADDRESS = "0x80080000"
-UBOOT_ENTRYPOINT = "0x80080000"
-# Below options will generate a key to sign the kernel Image and INITRAMFS_IMAGE
-# according to the default parameters of kernel-fitimage.bbclass. If the user
-# would prefer to use their own keys, disable the key generation using the
-# FIT_GENERATE_KEYS parameter and specify the location of the keys using the
-# below paramters.
-UBOOT_SIGN_ENABLE = "1"
-UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
-UBOOT_SIGN_KEYNAME = "dev_key"
-UBOOT_SIGN_KEYDIR = "${DEPLOY_DIR_IMAGE}/keys"
-FIT_GENERATE_KEYS = "1"
-
-PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-arm64-ack"
-PREFERRED_VERSION_linux-arm64-ack ?= "5.10"
-
-# Cannot use the default zImage on arm64
-KERNEL_IMAGETYPE = "Image"
-KERNEL_IMAGETYPES += "fitImage"
-KERNEL_CLASSES = " kernel-fitimage "
-
-IMAGE_FSTYPES += "cpio.gz"
-INITRAMFS_IMAGE ?= "core-image-minimal"
-
-SERIAL_CONSOLES = "115200;ttyAMA0"
+require conf/machine/include/tc.inc
diff --git a/meta-arm-bsp/conf/machine/tc1.conf b/meta-arm-bsp/conf/machine/tc1.conf
new file mode 100644
index 0000000..42c5d8d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/tc1.conf
@@ -0,0 +1,7 @@
+# Configuration for TC1
+
+#@TYPE: Machine
+#@NAME: TC1
+#@DESCRIPTION: Machine configuration for TC1
+
+require conf/machine/include/tc.inc
diff --git a/meta-arm-bsp/documentation/tc0.md b/meta-arm-bsp/documentation/tc0.md
index 9ea4f7c..2ae2592 100644
--- a/meta-arm-bsp/documentation/tc0.md
+++ b/meta-arm-bsp/documentation/tc0.md
@@ -16,10 +16,10 @@ In the local.conf file, MACHINE should be set as follows:
 MACHINE = "tc0"
 
 To build the required binaries for tc0, run the commmand:
-```bash$ bitbake tc0-artifacts-image```
+```bash$ bitbake tc-artifacts-image```
 
 Trusted-firmware-a is the final component to be built with the rest of the
-components dependent of it, therefore building tc0-artifacts-image which depends
+components dependent of it, therefore building tc-artifacts-image which depends
 on trusted-firmware-a will build all the required binaries.
 
 ## Running
diff --git a/meta-arm-bsp/documentation/tc1.md b/meta-arm-bsp/documentation/tc1.md
new file mode 100644
index 0000000..464f77e
--- /dev/null
+++ b/meta-arm-bsp/documentation/tc1.md
@@ -0,0 +1,32 @@
+# TC1 Platform Support in meta-arm-bsp
+
+## Overview
+The Total Compute platform provides an envelope for all of Arm's latest IP and
+software solutions, optimised to work together. Further information can be
+found on the Total Compute community page:
+https://community.arm.com/developer/tools-software/oss-platforms/w/docs/606/total-compute
+
+The user guide for TC1 platform with detailed instructions for
+syncing and building the source code and running on TC1 Fixed Virtual Platform
+for poky and android distributions is available at:
+https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/tree/docs/tc1/user-guide.rst
+
+## Building
+In the local.conf file, MACHINE should be set as follows:
+MACHINE = "tc1"
+
+To build the required binaries for tc1, run the commmand:
+```bash$ bitbake tc-artifacts-image```
+
+Trusted-firmware-a is the final component to be built with the rest of the
+components dependent of it, therefore building tc-artifacts-image which depends
+on trusted-firmware-a will build all the required binaries.
+
+## Running
+To run the produced binaries in a TC1 Fixed Virtual Platform please get
+the run scripts at:
+https://git.linaro.org/landing-teams/working/arm/model-scripts.git/
+
+and follow the instructions in the user-guide.rst available in:
+https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/tree/docs/tc1/user-guide.rst
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
new file mode 100644
index 0000000..c43cfb0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -0,0 +1,9 @@
+# TC0 specific configuration
+
+COMPATIBLE_MACHINE = "(tc?)"
+HAFNIUM_PROJECT = "reference"
+HAFNIUM_INSTALL_TARGET = "hafnium"
+HAFNIUM_PLATFORM:tc0 = "secure_tc0"
+HAFNIUM_PLATFORM:tc1 = "secure_tc"
+
+SRCREV:tc1 = "464fa5a287791e7d128e37721a7d1da257144e12"
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
deleted file mode 100644
index f387cb5..0000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-# TC0 specific configuration
-
-COMPATIBLE_MACHINE = "tc0"
-
-HAFNIUM_PROJECT = "reference"
-HAFNIUM_PLATFORM = "secure_tc0"
-HAFNIUM_INSTALL_TARGET = "hafnium"
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend b/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
index dc82a94..bfc2c46 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_HAFNIUM_REQUIRE ?= ""
-MACHINE_HAFNIUM_REQUIRE:tc0 = "hafnium-tc0.inc"
+MACHINE_HAFNIUM_REQUIRE:tc = "hafnium-tc.inc"
 
 require ${MACHINE_HAFNIUM_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb b/meta-arm-bsp/recipes-bsp/images/tc-artifacts-image.bb
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
rename to meta-arm-bsp/recipes-bsp/images/tc-artifacts-image.bb
index b2ad356..ded7404 100644
--- a/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/tc-artifacts-image.bb
@@ -6,7 +6,7 @@ SUMMARY = "Total Compute Images"
 DESCRIPTION = "Build all the images required for Total Compute platform"
 LICENSE = "Apache-2.0"
 
-COMPATIBLE_MACHINE = "tc0"
+COMPATIBLE_MACHINE = "(tc?)"
 
 inherit nopackages
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
similarity index 58%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 761a370..20bbcc7 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -1,7 +1,9 @@
 # TC0 specific SCP configuration
 
 # Intermediate SHA with 2.8 baseline version
-SRCREV = "67a3612716ad3b839da4209a173404692607c5a1"
+SRCREV:tc0 = "67a3612716ad3b839da4209a173404692607c5a1"
+SRCREV:tc1 = "26c858b46824a8d74a7593325a0124c163de65d6"
+
 PV = "2.8+git${SRCPV}"
 
 # This is incorporated into the SRCREV above
@@ -9,7 +11,8 @@ SRC_URI:remove = " \
     file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch \
     "
 
-COMPATIBLE_MACHINE = "tc0"
+COMPATIBLE_MACHINE = "(tc?)"
 
-SCP_PLATFORM = "tc0"
+SCP_PLATFORM:tc0 = "tc0"
+SCP_PLATFORM:tc1 = "tc1"
 FW_TARGETS = "scp"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
index 398b049..bb1a48c 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
@@ -5,6 +5,6 @@ MACHINE_SCP_REQUIRE ?= ""
 MACHINE_SCP_REQUIRE:juno = "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE:n1sdp = "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE:sgi575 = "scp-firmware-sgi575.inc"
-MACHINE_SCP_REQUIRE:tc0 = "scp-firmware-tc0.inc"
+MACHINE_SCP_REQUIRE:tc = "scp-firmware-tc.inc"
 
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
similarity index 67%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
index 93a9b4d..ff53de8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
@@ -1,15 +1,16 @@
 # TC0 specific TFA configuration
 
 # Intermediate SHA with 2.5 baseline version
-SRCREV_tfa = "a52c52477aa797e6a261215e9b3536533590b334"
+SRCREV_tfa:tc0 = "a52c52477aa797e6a261215e9b3536533590b334"
+SRCREV_tfa:tc1 = "ae5cfc5fe01e2629ff3663a42fb2c585b4d3e7cc"
 PV = "2.5+git${SRCPV}"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
 DEPENDS += "scp-firmware"
 
-COMPATIBLE_MACHINE = "tc0"
+COMPATIBLE_MACHINE = "(tc?)"
 
-TFA_PLATFORM = "tc0"
+TFA_PLATFORM = "tc"
 TFA_BUILD_TARGET = "all fip"
 TFA_UBOOT = "1"
 TFA_INSTALL_TARGET = "bl1 fip"
@@ -19,11 +20,16 @@ TFA_DEBUG = "1"
 TFA_SPD = "spmd"
 TFA_SPMD_SPM_AT_SEL2 = "1"
 
+TFA_TARGET_PLATFORM:tc0 = "0"
+TFA_TARGET_PLATFORM:tc1 = "1"
+
+EXTRA_OEMAKE += "TARGET_PLATFORM=${TFA_TARGET_PLATFORM}"
+
 # Set optee as SP. Set spmc manifest and sp layout file to optee
 DEPENDS += "optee-os"
 
 TFA_SP_LAYOUT_FILE = "${RECIPE_SYSROOT}/lib/firmware/sp_layout.json"
-TFA_ARM_SPMC_MANIFEST_DTS = "plat/arm/board/tc0/fdts/tc0_spmc_optee_sp_manifest.dts"
+TFA_ARM_SPMC_MANIFEST_DTS = "plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts"
 
 EXTRA_OEMAKE += "SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
 EXTRA_OEMAKE += "TRUSTED_BOARD_BOOT=1 GENERATE_COT=1 ARM_ROTPK_LOCATION=devel_rsa \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
index dcec1b1..ea39dbd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
@@ -8,6 +8,6 @@ MACHINE_TFA_REQUIRE:fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
 MACHINE_TFA_REQUIRE:juno = "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE:n1sdp = "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE:sgi575 = "trusted-firmware-a-sgi575.inc"
-MACHINE_TFA_REQUIRE:tc0 = "trusted-firmware-a-tc0.inc"
+MACHINE_TFA_REQUIRE:tc = "trusted-firmware-a-tc.inc"
 
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/0002-cmd-part-Correct-error-handling.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0002-cmd-part-Correct-error-handling.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/0002-cmd-part-Correct-error-handling.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0002-cmd-part-Correct-error-handling.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/bootargs.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/bootargs.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/bootargs.cfg
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/bootargs.cfg
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
index 409f4b4..ef881a1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
@@ -1,7 +1,7 @@
 # Machine specific u-boot
 
 THIS_DIR := "${THISDIR}"
-FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
+FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}/tc:"
 
 #
 # TC0 MACHINE
@@ -11,3 +11,11 @@ SRC_URI:append:tc0 = " \
     file://0002-cmd-part-Correct-error-handling.patch \
     file://bootargs.cfg \
     "
+#
+# TC1 MACHINE
+#
+SRC_URI:append:tc1 = " \
+    file://0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch \
+    file://0002-cmd-part-Correct-error-handling.patch \
+    file://bootargs.cfg \
+    "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 1136627..4db9629 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -76,13 +76,13 @@ KBUILD_DEFCONFIG:sgi575 = "defconfig"
 KCONFIG_MODE:sgi575 = "--alldefconfig"
 
 #
-# Total Compute KMACHINE
+# Total Compute TC0 KMACHINE
 #
 COMPATIBLE_MACHINE:tc0 = "tc0"
 KMACHINE:tc0 = "tc0"
 KCONFIG_MODE:tc0 = "--alldefconfig"
-FILESEXTRAPATHS:prepend:tc0 := "${ARMBSPFILESPATHS}"
-SRC_URI:append:tc0 = " \
+FILESEXTRAPATHS:prepend:tc0 := "${THISDIR}/linux-arm64-ack-5.10/tc:"
+SRC_URI:append:tc = " \
     file://defconfig \
     file://0001-drm-Add-component-aware-simple-encoder.patch \
     file://0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch \
@@ -107,6 +107,17 @@ SRC_URI:append:tc0 = " \
     file://0021-drivers-optee-hack-for-UUID-endianess-issue.patch \
     "
 
+#
+# Total Compute TC1 KMACHINE
+#
+COMPATIBLE_MACHINE:tc1 = "tc1"
+KMACHINE:tc1 = "tc1"
+KCONFIG_MODE:tc1 = "--alldefconfig"
+FILESEXTRAPATHS:prepend:tc1 := "${THISDIR}/linux-arm64-ack-5.10/tc:"
+SRC_URI:append:tc1 = " \
+    file://0022-arm_ffa-add-support-for-FFA-v1.1.patch \
+    "
+
 #
 # N1SDP KMACHINE
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0001-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0001-drm-Add-component-aware-simple-encoder.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0001-drm-Add-component-aware-simple-encoder.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0001-drm-Add-component-aware-simple-encoder.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0003-Adapt-ION-interface-to-match-Android.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-Adapt-ION-interface-to-match-Android.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0003-Adapt-ION-interface-to-match-Android.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-Adapt-ION-interface-to-match-Android.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0005-mailbox-arm_mhuv2-Add-driver.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Add-driver.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0005-mailbox-arm_mhuv2-Add-driver.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Add-driver.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-firmware-arm_ffa-Add-initial-FFA-bus-support-for-dev.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partit.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0015-tee-add-sec_world_id-to-struct-tee_shm.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-tee-add-sec_world_id-to-struct-tee_shm.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0015-tee-add-sec_world_id-to-struct-tee_shm.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-tee-add-sec_world_id-to-struct-tee_shm.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0016-optee-simplify-optee_release.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-simplify-optee_release.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0016-optee-simplify-optee_release.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-optee-simplify-optee_release.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0017-optee-sync-OP-TEE-headers.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-sync-OP-TEE-headers.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0017-optee-sync-OP-TEE-headers.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-optee-sync-OP-TEE-headers.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0018-optee-refactor-driver-with-internal-callbacks.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-refactor-driver-with-internal-callbacks.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0018-optee-refactor-driver-with-internal-callbacks.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-optee-refactor-driver-with-internal-callbacks.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0019-optee-add-a-FF-A-memory-pool.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-a-FF-A-memory-pool.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0019-optee-add-a-FF-A-memory-pool.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-optee-add-a-FF-A-memory-pool.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0020-optee-add-FF-A-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-optee-add-FF-A-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0020-optee-add-FF-A-support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-optee-add-FF-A-support.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0021-drivers-optee-hack-for-UUID-endianess-issue.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-drivers-optee-hack-for-UUID-endianess-issue.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0021-drivers-optee-hack-for-UUID-endianess-issue.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-drivers-optee-hack-for-UUID-endianess-issue.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-arm_ffa-add-support-for-FFA-v1.1.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-arm_ffa-add-support-for-FFA-v1.1.patch
new file mode 100644
index 0000000..62a3eb3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-arm_ffa-add-support-for-FFA-v1.1.patch
@@ -0,0 +1,37 @@
+From 90c09f49c4df35fa0e25dda5e9f15a2d30debce8 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Wed, 11 Aug 2021 09:45:35 +0100
+Subject: [PATCH] arm_ffa: add support for FFA v1.1
+
+Change-Id: I3d5a72981c6a66a0a034fd76d5e38eeb33318d20
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/firmware/arm_ffa/driver.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
+index 82c84fe10be2..84d5a513fb94 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -35,7 +35,7 @@
+ 
+ #include "common.h"
+ 
+-#define FFA_DRIVER_VERSION	FFA_VERSION_1_0
++#define FFA_DRIVER_VERSION	FFA_VERSION_1_1
+ 
+ #define FFA_SMC(calling_convention, func_num)				\
+ 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
+@@ -111,6 +111,7 @@
+ 	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
+ 	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
+ #define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
++#define FFA_VERSION_1_1		PACK_VERSION_INFO(1, 1)
+ #define FFA_MIN_VERSION		FFA_VERSION_1_0
+ 
+ #define SENDER_ID_MASK		GENMASK(31, 16)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/defconfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/defconfig
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-WIP-Enable-managed-exit.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enable-managed-exit.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-WIP-Enable-managed-exit.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enable-managed-exit.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch
new file mode 100644
index 0000000..7439927
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch
@@ -0,0 +1,27 @@
+From 31b4fb3fd52408d53ba5fd934f1506b01cda2e7a Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Wed, 11 Aug 2021 11:51:38 +0100
+Subject: [PATCH] plat-totalcompute: Update messaging-method for managed exit
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+---
+ core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+index 04847c4d..2fb07862 100644
+--- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
++++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+@@ -23,7 +23,7 @@
+ 	entrypoint-offset = <0x1000>;
+ 	xlat-granule = <0>; /* 4KiB */
+ 	boot-order = <0>;
+-	messaging-method = <3>; /* Direct messaging and managed exit supported */
++	messaging-method = <11>; /* Direct messaging and managed exit supported */
+ 
+ 	device-regions {
+ 		compatible = "arm,ffa-manifest-device-regions";
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch
new file mode 100644
index 0000000..44138cb
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch
@@ -0,0 +1,29 @@
+From 3a240f6b6c58d70471fd0752b8854c43c7c4df72 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Wed, 11 Aug 2021 11:00:52 +0100
+Subject: [PATCH 2/2] ffa: Update function ID according to FFA v1.1 spec
+
+This updates function ID FFA_SECONDARY_EP_REGISTER_64.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+---
+ core/arch/arm/include/ffa.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/include/ffa.h b/core/arch/arm/include/ffa.h
+index 20a009ca..b0d68173 100644
+--- a/core/arch/arm/include/ffa.h
++++ b/core/arch/arm/include/ffa.h
+@@ -69,7 +69,7 @@
+ #define FFA_MEM_RECLAIM			U(0x84000077)
+ #define FFA_MEM_FRAG_RX			U(0x8400007A)
+ #define FFA_MEM_FRAG_TX			U(0x8400007B)
+-#define FFA_SECONDARY_EP_REGISTER_64	U(0xC4000084)
++#define FFA_SECONDARY_EP_REGISTER_64	U(0xC4000087)
+ 
+ /* Special value for traffic targeted to the Hypervisor or SPM */
+ #define FFA_TARGET_INFO_MBZ		U(0x0)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/sp_layout.json b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/sp_layout.json
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/sp_layout.json
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/tc/sp_layout.json
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc b/meta-arm-bsp/recipes-security/optee/optee-client-tc.inc
similarity index 71%
rename from meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
rename to meta-arm-bsp/recipes-security/optee/optee-client-tc.inc
index d460b50..f3fb7cd 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-client-tc.inc
@@ -1,3 +1,3 @@
-# TC0 specific configuration
+# TC specific configuration
 
 # Change in SHA, extra patches specific to TC0 are added in this file.
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
index e03a83d..d2b023b 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_CLIENT_REQUIRE ?= ""
-MACHINE_OPTEE_CLIENT_REQUIRE:tc0 = "optee-client-tc0.inc"
+MACHINE_OPTEE_CLIENT_REQUIRE:tc = "optee-client-tc.inc"
 
 require ${MACHINE_OPTEE_CLIENT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
similarity index 63%
rename from meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
rename to meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
index 4d2889c..4b2f8af 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
@@ -2,18 +2,24 @@
 
 # Intermediate SHA with 3.14 baseline version
 # This has TC0 platform support
-SRCREV = "49dbb9ef65643c4322cf3f848910fa880d1c02f6"
+SRCREV:tc0 = "49dbb9ef65643c4322cf3f848910fa880d1c02f6"
+SRCREV:tc1 = "e4f34e786135079160697d88212591105a65fbce"
 PV = "3.14.0+git${SRCPV}"
 
-FILESEXTRAPATHS:prepend:tc0 := "${THISDIR}/files/optee-os/tc0:"
-SRC_URI:append = " \
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/tc:"
+SRC_URI:append:tc = " \
     file://sp_layout.json \
     file://0001-WIP-Enable-managed-exit.patch \
     "
+SRC_URI:append:tc1 = " \
+    file://0002-plat-totalcompute-Update-messaging-method-for-manage.patch \
+    file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
+    "
 
-COMPATIBLE_MACHINE = "tc0"
+COMPATIBLE_MACHINE = "(tc?)"
 
-OPTEEMACHINE = "totalcompute-tc0"
+OPTEEMACHINE:tc0 = "totalcompute-tc0"
+OPTEEMACHINE:tc1 = "totalcompute-tc1"
 
 # Enable optee memory layout and boot logs
 EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=3"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
index f3cbc29..e276fb8 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_OS_REQUIRE ?= ""
-MACHINE_OPTEE_OS_REQUIRE:tc0 = "optee-os-tc0.inc"
+MACHINE_OPTEE_OS_REQUIRE:tc = "optee-os-tc.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
similarity index 50%
rename from meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
rename to meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
index 832fea1..62fa0a0 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
@@ -1,3 +1,3 @@
 # TC0 specific configuration
 
-COMPATIBLE_MACHINE = "tc0"
+COMPATIBLE_MACHINE = "(tc?)"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
index 19768cb..490b350 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_TEST_REQUIRE ?= ""
-MACHINE_OPTEE_TEST_REQUIRE:tc0 = "optee-test-tc0.inc"
+MACHINE_OPTEE_TEST_REQUIRE:tc = "optee-test-tc.inc"
 
 require ${MACHINE_OPTEE_TEST_REQUIRE}
-- 
2.17.1

