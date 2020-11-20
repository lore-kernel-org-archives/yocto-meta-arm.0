Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20861.1605846543045234285
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 20:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: thomas.abraham@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 550881396;
	Thu, 19 Nov 2020 20:29:02 -0800 (PST)
Received: from usa.arm.com (a077432.blr.arm.com [10.162.4.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B14C3F719;
	Thu, 19 Nov 2020 20:29:01 -0800 (PST)
From: "Thomas Abraham" <thomas.abraham@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Vivek Gautam <vivek.gautam@arm.com>
Subject: [PATCH 3/6] arm-bsp/fip-image: Build TFA/UEFI for rdn1edge
Date: Fri, 20 Nov 2020 09:58:41 +0530
Message-Id: <20201120042844.21915-3-thomas.abraham@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120042844.21915-1-thomas.abraham@arm.com>
References: <20201120042844.21915-1-thomas.abraham@arm.com>

From: Vivek Gautam <vivek.gautam@arm.com>

Add bbappend recipe to build TF-A and UEFI firmware for rdn1edge
platform. In addition to this, add machine conf to add image
dependency for TF-A components.

Change-Id: I494b9a580cf15f9f789750ea4c73802ff93a5b94
Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 meta-arm-bsp/conf/machine/rdn1edge.conf          |  6 ++++++
 .../trusted-firmware-a-rdn1edge.inc              | 16 ++++++++++++++++
 .../trusted-firmware-a_2.3.bbappend              |  1 +
 .../recipes-bsp/uefi/edk2-firmware-rdn1edge.inc  | 10 ++++++++++
 .../recipes-bsp/uefi/edk2-firmware_git.bbappend  |  1 +
 5 files changed, 34 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn1edge.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn1edge.inc

diff --git a/meta-arm-bsp/conf/machine/rdn1edge.conf b/meta-arm-bsp/conf/machine/rdn1edge.conf
index 47d1d05..cdc879c 100644
--- a/meta-arm-bsp/conf/machine/rdn1edge.conf
+++ b/meta-arm-bsp/conf/machine/rdn1edge.conf
@@ -8,3 +8,9 @@ require conf/machine/include/tune-neoversen1.inc
 
 #include SCP/MCP firmware
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
+
+#Trusted firmware v2.3 version
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
+
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn1edge.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn1edge.inc
new file mode 100644
index 0000000..af3e198
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn1edge.inc
@@ -0,0 +1,16 @@
+# RD-N1-Edge specific TFA support
+
+COMPATIBLE_MACHINE = "rdn1edge"
+TFA_PLATFORM       = "rdn1edge"
+TFA_BUILD_TARGET   = "all fip"
+TFA_INSTALL_TARGET = "bl1 fip"
+TFA_DEBUG          = "1"
+TFA_MBEDTLS        = "1"
+TFA_UBOOT          = "0"
+
+# RD-N1-Edge needs the UEFI as bl33
+DEPENDS += "virtual/uefi-firmware"
+
+EXTRA_OEMAKE += "BL33=${RECIPE_SYSROOT}/firmware/uefi.bin"
+EXTRA_OEMAKE += "TRUSTED_BOARD_BOOT=1 GENERATE_COT=1 ARM_ROTPK_LOCATION=devel_rsa \
+                     ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index 0e6fb1e..adb1570 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -8,5 +8,6 @@ MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE_corstone700 = "trusted-firmware-a-corstone700.inc"
+MACHINE_TFA_REQUIRE_rdn1edge = "trusted-firmware-a-rdn1edge.inc"
 
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn1edge.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn1edge.inc
new file mode 100644
index 0000000..f4fe72d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn1edge.inc
@@ -0,0 +1,10 @@
+# RD-N1-Edge edk2 support
+
+# RD-N1-Edge specific EDK2 configurations
+EDK2_BUILD_RELEASE = "0"
+EDK2_PLATFORM      = "RdN1Edge"
+EDK2_PLATFORM_DSC  = "Platform/ARM/SgiPkg/RdN1Edge/RdN1Edge.dsc"
+EDK2_BIN_NAME      = "BL33_AP_UEFI.fd"
+EDK2_ARCH          = "AARCH64"
+
+COMPATIBLE_MACHINE = "rdn1edge"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
index 8cfd6c5..bd1f391 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
@@ -6,6 +6,7 @@ MACHINE_EDK2_REQUIRE ?= ""
 
 MACHINE_EDK2_REQUIRE_n1sdp = "edk2-firmware-n1sdp.inc"
 MACHINE_EDK2_REQUIRE_sgi575 = "edk2-firmware-sgi575.inc"
+MACHINE_EDK2_REQUIRE_rdn1edge = "edk2-firmware-rdn1edge.inc"
 MACHINE_EDK2_REQUIRE_fvp-base = "edk2-firmware-fvp-base.inc"
 
 require ${MACHINE_EDK2_REQUIRE}
-- 
2.17.1

