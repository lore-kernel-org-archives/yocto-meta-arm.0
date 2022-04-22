Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCD1C5AC75
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9801.1650640413359549829
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 08:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5220D15A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 08:13:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 343E23F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 08:13:32 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/edk2-firmware: add PROVIDES virtual/bootloader
Date: Fri, 22 Apr 2022 11:13:25 -0400
Message-Id: <20220422151326.23359-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422151326.23359-1-jon.mason@arm.com>
References: <20220422151326.23359-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3283

To prevent a collision with u-boot, add the same PROVIDES from it.  The
PROVIDES name need improvement, but this will work in the interim.

This causes a need for making TF-A more flexible.  Add the ability to
reference the UEFI binary for the BL33 portion of the TF-A build
command.  SGI575 is already doing this.  So, it is really just making it
more generic for others to use.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-sgi575.inc |  5 +----
 .../trusted-firmware-a/trusted-firmware-a.inc        | 12 ++++++++++--
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc          |  3 ++-
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb            |  1 +
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi575.inc
index 5786ce0..c0f5889 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi575.inc
@@ -7,11 +7,8 @@ TFA_INSTALL_TARGET = "bl1 fip"
 TFA_DEBUG          = "1"
 TFA_MBEDTLS        = "1"
 TFA_UBOOT          = "0"
+TFA_UEFI           = "1"
 
-# Sgi575 needs the UEFI as bl33
-DEPENDS += "edk2-firmware"
-
-EXTRA_OEMAKE += "BL33=${RECIPE_SYSROOT}/firmware/uefi.bin"
 EXTRA_OEMAKE += "TRUSTED_BOARD_BOOT=1 GENERATE_COT=1 ARM_ROTPK_LOCATION=devel_rsa \
                      ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
 EXTRA_OEMAKE += "CFLAGS=-mbranch-protection=none"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index b1a7522..9f588a7 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -58,7 +58,11 @@ SRCREV_FORMAT:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
 
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin file
-TFA_UBOOT ?= "0"
+TFA_UBOOT ??= "0"
+
+# UEFI support (set TFA_UEFI to 1 to activate)
+# When UEFI support is activated BL33 is activated with uefi.bin file
+TFA_UEFI ??= "0"
 
 # What to build
 # By default we only build bl1, do_deploy will copy
@@ -125,7 +129,11 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=${TFA_MBE
 # Uboot support
 DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
-EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
+EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '', d)}"
+
+# UEFI support
+DEPENDS += " ${@bb.utils.contains('TFA_UEFI', '1', 'edk2-firmware', '', d)}"
+EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UEFI', '1', 'BL33=${RECIPE_SYSROOT}/firmware/uefi.bin', '', d)}"
 
 # Hafnium support
 SEL2_SPMC = "${@'${TFA_SPMD_SPM_AT_SEL2}' if d.getVar('TFA_SPD', True) == 'spmd' else ''}"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index a653d29..540eb00 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -1,9 +1,10 @@
 SUMMARY = "UEFI EDK2 Firmware"
 DESCRIPTION = "UEFI EDK2 Firmware for Arm reference platforms"
 HOMEPAGE = "https://github.com/tianocore/edk2"
-
 LICENSE = "BSD-2-Clause-Patent"
 
+PROVIDES = "virtual/bootloader"
+
 # EDK2
 LIC_FILES_CHKSUM = "file://License.txt;md5=2b415520383f7964e96700ae12b4570a"
 # EDK2 Platforms
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
index 83852d0..5eb6767 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
@@ -1,4 +1,5 @@
 require recipes-bsp/uefi/edk2-firmware_202202.bb
+PROVIDES:remove = "virtual/bootloader"
 
 LICENSE += "& Apache-2.0"
 LIC_FILES_CHKSUM += "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
-- 
2.17.1


