Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27719.1605016094445344260
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 05:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D191F1063
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 05:48:13 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FA1D3F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 05:48:13 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: create u-boot 2020.07 to resolve warning
Date: Mon,  9 Nov 2020 11:07:46 -0500
Message-Id: <20201109160746.21366-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Poky, etc master branches updated the u-boot recipes to use 2020.10,
causing bbappends for 2020.07 to no longer function.  Create a temporary
recipe for 2020.07 until all the BSPs can update to support the latest
version.

Change-Id: Ib5fc9b8a2ff2ccf01be3640a34429d2c1e57b627
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot_2020.07.bb      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
new file mode 100644
index 0000000..1a9721a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
@@ -0,0 +1,28 @@
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
+SECTION = "bootloaders"
+DEPENDS += "flex-native bison-native"
+
+COMPATIBLE_MACHINE = "(corstone700-*)"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
+PE = "1"
+
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
+
+SRC_URI = "git://git.denx.de/u-boot.git \
+          "
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+require recipes-bsp/u-boot/u-boot.inc
+
+DEPENDS += "bc-native dtc-native"
-- 
2.17.1

