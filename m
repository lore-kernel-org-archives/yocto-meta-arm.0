Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5891.1620135804614272424
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 May 2021 06:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA120ED1
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 May 2021 06:43:23 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EBE43F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 May 2021 06:43:23 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/scp-firmware: Add SCP v2.8.0
Date: Tue,  4 May 2021 09:43:18 -0400
Message-Id: <20210504134318.15673-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Add new recipe for SCP version 2.8.0 and remove the old 2.7.0 recipe.
Change TC0 and N1SDP to use the latest tag, and not their previous
intermediate SHA (which are in the 2.8.0 release).

Change-Id: Id3f0af549790969ce6fd3b315f94177726f24d73
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf                         | 1 -
 meta-arm-bsp/conf/machine/n1sdp.conf                        | 2 --
 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc         | 6 ------
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc  | 4 ----
 ...cp-firmware_2.7%.bbappend => scp-firmware_2.8%.bbappend} | 0
 .../{scp-firmware_2.7.0.bb => scp-firmware_2.8.0.bb}        | 4 ++--
 6 files changed, 2 insertions(+), 15 deletions(-)
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware_2.7%.bbappend => scp-firmware_2.8%.bbappend} (100%)
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_2.7.0.bb => scp-firmware_2.8.0.bb} (93%)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index b5959b3..1d7be29 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,7 +20,6 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.4%"
-PREFERRED_VERSION_scp-firmware ?= "2.7%"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
 PREFERRED_VERSION_u-boot ?= "2020.07"
 
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 26c1a96..3de47c8 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -29,8 +29,6 @@ PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
-PREFERRED_VERSION_scp-firmware ?= "2.7%"
-
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
 PREFERRED_VERSION_edk2-firmware ?= "202102%"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 65034d2..0772364 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -3,18 +3,12 @@
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
-LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
-                    file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
 
 SRC_URI_append = " \
    file://enabling-coresight-debug-non-secure-access.patch \
    "
 
-SRCREV  = "6c15afb1b37d0728482c598b063cd69bfc733e93"
-PV = "2.7.0+git${SRCPV}"
-
 COMPATIBLE_MACHINE_n1sdp = "n1sdp"
 
 DEPENDS += "fiptool-native"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index 4501b94..cacdca8 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,9 +1,5 @@
 # TC0 specific SCP configuration
 
-# Intermediate SHA with 2.7 baseline version, required for Theodul DSU
-SRCREV = "bc35f4fd2d5e93c77effdeba43c98ddd5038de96"
-PV = "2.7.0+git${SRCPV}"
-
 COMPATIBLE_MACHINE = "tc0"
 
 SCP_PLATFORM = "tc0"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
similarity index 93%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
index 3a71b2e..bee3ab5 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
@@ -4,10 +4,10 @@ HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
 
 LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
-                    file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+                    file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
 SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
-SRCREV  = "2c4f3af270024b85e1b38fd963050c58f6e9b865"
+SRCREV  = "043de77f220a0b4b0ec3aa367bd515a9e9df2a29"
 
 PROVIDES += "virtual/control-processor-firmware"
 
-- 
2.17.1

