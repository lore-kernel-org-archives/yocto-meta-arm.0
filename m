Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20862.1605846544054034066
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 20:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: thomas.abraham@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1C811396;
	Thu, 19 Nov 2020 20:29:03 -0800 (PST)
Received: from usa.arm.com (a077432.blr.arm.com [10.162.4.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7F773F719;
	Thu, 19 Nov 2020 20:29:02 -0800 (PST)
From: "Thomas Abraham" <thomas.abraham@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Vivek Gautam <vivek.gautam@arm.com>
Subject: [PATCH 4/6] arm-bsp/linux: Build Linux stable 5.7 for rdn1edge
Date: Fri, 20 Nov 2020 09:58:42 +0530
Message-Id: <20201120042844.21915-4-thomas.abraham@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120042844.21915-1-thomas.abraham@arm.com>
References: <20201120042844.21915-1-thomas.abraham@arm.com>

From: Vivek Gautam <vivek.gautam@arm.com>

Update linux-arm inc to add build support for rdn1edge. In addition
to this, add machine conf to add image dependency for Linux
components.

Change-Id: If98fae10b69193ba635bc65b386b136f171d6826
Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 meta-arm-bsp/conf/machine/rdn1edge.conf                   | 6 ++++++
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/rdn1edge.conf b/meta-arm-bsp/conf/machine/rdn1edge.conf
index cdc879c..d86c9f7 100644
--- a/meta-arm-bsp/conf/machine/rdn1edge.conf
+++ b/meta-arm-bsp/conf/machine/rdn1edge.conf
@@ -14,3 +14,9 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+
+#Linux Stable Kernel
+KERNEL_IMAGETYPE ?= "Image"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
+PREFERRED_VERSION_linux-stable ?= "5.7%"
+SERIAL_CONSOLES = "115200;ttyAMA0"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 62b1dec..42d5604 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -14,6 +14,7 @@ SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
 SRC_URI_append_juno = " ${SRC_URI_KMETA}"
 SRC_URI_append_sgi575 = " ${SRC_URI_KMETA}"
+SRC_URI_append_rdn1edge = " ${SRC_URI_KMETA}"
 SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
@@ -70,6 +71,13 @@ KMACHINE_sgi575 = "sgi575"
 KBUILD_DEFCONFIG_sgi575 = "defconfig"
 KCONFIG_MODE_sgi575 = "--alldefconfig"
 
+#
+# RD-N1-Edge KMACHINE
+#
+COMPATIBLE_MACHINE_rdn1edge = "rdn1edge"
+KBUILD_DEFCONFIG_rdn1edge = "defconfig"
+KCONFIG_MODE_rdn1edge = "--alldefconfig"
+
 #
 # Total Compute KMACHINE
 #
-- 
2.17.1

