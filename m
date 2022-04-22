Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B880C55191
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10014.1650640413360652174
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 08:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E00E1596
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 08:13:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F28FD3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 08:13:31 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/juno: use virtual/bootloader for u-boot/edk2
Date: Fri, 22 Apr 2022 11:13:24 -0400
Message-Id: <20220422151326.23359-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3281

To setup juno to use either u-boot or edk2 in CI, abstract out the
relevant parts and setup the parts to allow for it to be done
dynamically.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf                            | 3 ++-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 2da6ba6..fbff800 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -19,8 +19,9 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_u-boot ?= "2020.07"
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 
-EXTRA_IMAGEDEPENDS += "trusted-firmware-a edk2-firmware u-boot firmware-image-juno"
+EXTRA_IMAGEDEPENDS += "trusted-firmware-a virtual/bootloader firmware-image-juno"
 
 # Juno u-boot configuration
 UBOOT_MACHINE = "vexpress_aemv8a_juno_defconfig"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
index c7293c0..3ddd8cb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
@@ -4,7 +4,7 @@ COMPATIBLE_MACHINE = "juno"
 TFA_PLATFORM = "juno"
 TFA_DEBUG = "1"
 TFA_MBEDTLS = "1"
-TFA_UBOOT = "1"
+TFA_UBOOT ?= "1"
 TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fip"
 
 # Juno needs the System Control Processor Firmware
-- 
2.17.1


