Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.61760.1629325183206816813
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Aug 2021 15:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: usama.arif@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FD771FB;
	Wed, 18 Aug 2021 15:19:41 -0700 (PDT)
Received: from usaari01.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEC373F70D;
	Wed, 18 Aug 2021 15:19:40 -0700 (PDT)
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp: Update TC0 components
Date: Wed, 18 Aug 2021 23:19:37 +0100
Message-Id: <20210818221937.9862-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1

This makes them common with TC1 and also adds support for FFA v1.1.

Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc              | 5 ++---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc    | 3 +--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc | 3 +--
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc    | 5 ++---
 meta-arm-bsp/recipes-security/optee/optee-os-tc.inc          | 5 +----
 5 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
index c43cfb0..284443c 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -3,7 +3,6 @@
 COMPATIBLE_MACHINE = "(tc?)"
 HAFNIUM_PROJECT = "reference"
 HAFNIUM_INSTALL_TARGET = "hafnium"
-HAFNIUM_PLATFORM:tc0 = "secure_tc0"
-HAFNIUM_PLATFORM:tc1 = "secure_tc"
+HAFNIUM_PLATFORM = "secure_tc"
 
-SRCREV:tc1 = "464fa5a287791e7d128e37721a7d1da257144e12"
+SRCREV = "464fa5a287791e7d128e37721a7d1da257144e12"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 20bbcc7..f1b9f6d 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -1,8 +1,7 @@
 # TC0 specific SCP configuration
 
 # Intermediate SHA with 2.8 baseline version
-SRCREV:tc0 = "67a3612716ad3b839da4209a173404692607c5a1"
-SRCREV:tc1 = "26c858b46824a8d74a7593325a0124c163de65d6"
+SRCREV = "26c858b46824a8d74a7593325a0124c163de65d6"
 
 PV = "2.8+git${SRCPV}"
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
index ff53de8..298eef3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
@@ -1,8 +1,7 @@
 # TC0 specific TFA configuration
 
 # Intermediate SHA with 2.5 baseline version
-SRCREV_tfa:tc0 = "a52c52477aa797e6a261215e9b3536533590b334"
-SRCREV_tfa:tc1 = "ae5cfc5fe01e2629ff3663a42fb2c585b4d3e7cc"
+SRCREV_tfa = "ae5cfc5fe01e2629ff3663a42fb2c585b4d3e7cc"
 PV = "2.5+git${SRCPV}"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4db9629..ed523c3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -105,6 +105,7 @@ SRC_URI:append:tc = " \
     file://0019-optee-add-a-FF-A-memory-pool.patch \
     file://0020-optee-add-FF-A-support.patch \
     file://0021-drivers-optee-hack-for-UUID-endianess-issue.patch \
+    file://0022-arm_ffa-add-support-for-FFA-v1.1.patch \
     "
 
 #
@@ -114,9 +115,7 @@ COMPATIBLE_MACHINE:tc1 = "tc1"
 KMACHINE:tc1 = "tc1"
 KCONFIG_MODE:tc1 = "--alldefconfig"
 FILESEXTRAPATHS:prepend:tc1 := "${THISDIR}/linux-arm64-ack-5.10/tc:"
-SRC_URI:append:tc1 = " \
-    file://0022-arm_ffa-add-support-for-FFA-v1.1.patch \
-    "
+
 
 #
 # N1SDP KMACHINE
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc b/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
index 4b2f8af..bd6c638 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
@@ -2,16 +2,13 @@
 
 # Intermediate SHA with 3.14 baseline version
 # This has TC0 platform support
-SRCREV:tc0 = "49dbb9ef65643c4322cf3f848910fa880d1c02f6"
-SRCREV:tc1 = "e4f34e786135079160697d88212591105a65fbce"
+SRCREV = "e4f34e786135079160697d88212591105a65fbce"
 PV = "3.14.0+git${SRCPV}"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/tc:"
 SRC_URI:append:tc = " \
     file://sp_layout.json \
     file://0001-WIP-Enable-managed-exit.patch \
-    "
-SRC_URI:append:tc1 = " \
     file://0002-plat-totalcompute-Update-messaging-method-for-manage.patch \
     file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
     "
-- 
2.17.1

