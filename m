Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7878.1612974007956933303
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Feb 2021 08:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A00C8113E
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 08:20:06 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D8913F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 08:20:06 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: create u-boot 2020.10 to resolve warning
Date: Wed, 10 Feb 2021 11:19:56 -0500
Message-Id: <20210210161956.26664-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Poky, etc master branches updated the u-boot recipes to use 2021.1,
causing bbappends for 2020.07 to no longer function.  Create a temporary
recipe for 2020.10 until all the BSPs can update to support the latest
version.

Change-Id: I6046b420a8d0b3cc2125004444683ecd51f3499b
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot_2020.10.bb      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
new file mode 100644
index 0000000..6fffdbd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
@@ -0,0 +1,26 @@
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
+SECTION = "bootloaders"
+DEPENDS += "flex-native bison-native"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
+PE = "1"
+
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
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

