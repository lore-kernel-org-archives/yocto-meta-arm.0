Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.624.1604424056882404635
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 09:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EA6E1435
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Nov 2020 09:20:56 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D34783F718
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Nov 2020 09:20:55 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: convert general u-boot bbappend to version specific
Date: Tue,  3 Nov 2020 12:20:47 -0500
Message-Id: <20201103172047.18147-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103172047.18147-1-jon.mason@arm.com>
References: <20201103172047.18147-1-jon.mason@arm.com>

The generic u-boot bbappend is causing issues upstream when trying to
use new or older versions of u-boot, by trying to apply patches from
folders that do not exist.

Change-Id: I399e3234fba852382fc73ab68f14a7e826bb5a42
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0001-arm-Add-corstone700-platform.patch            |  0
 ...02-boot-add-bootx-command-to-start-XiP-images.patch |  0
 ...t-starting-the-XIP-kernel-using-bootx-command.patch |  0
 .../0004-arm-enabling-the-arch_timer-driver.patch      |  0
 .../recipes-bsp/u-boot/u-boot_2020.04.bbappend         |  8 ++++++++
 .../{u-boot_%.bbappend => u-boot_2020.07.bbappend}     | 10 ----------
 6 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.04}/corstone700/0001-arm-Add-corstone700-platform.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.04}/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.04}/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.04}/corstone700/0004-arm-enabling-the-arch_timer-driver.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot_%.bbappend => u-boot_2020.07.bbappend} (66%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0001-arm-Add-corstone700-platform.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0001-arm-Add-corstone700-platform.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
new file mode 100644
index 0000000..00b40e5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
@@ -0,0 +1,8 @@
+#
+# Corstone700 KMACHINE
+#
+FILESEXTRAPATHS_prepend_corstone700 := "${THISDIR}/${BP}/corstone700:"
+SRC_URI_append_corstone700 = " file://0001-arm-Add-corstone700-platform.patch \
+                               file://0002-boot-add-bootx-command-to-start-XiP-images.patch \
+                               file://0003-boot-starting-the-XIP-kernel-using-bootx-command.patch \
+                               file://0004-arm-enabling-the-arch_timer-driver.patch"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
similarity index 66%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index 303f18e..c1f8b01 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -35,13 +35,3 @@ SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
 # Total Compute KMACHINE
 #
 SRC_URI_append_tc0 = " file://0001-Add-support-for-Total-Compute.patch"
-
-#
-# Corstone700 KMACHINE
-#
-FILESEXTRAPATHS_prepend_corstone700 := "${THISDIR}/files/corstone700:"
- 
-SRC_URI_append_corstone700 = " file://0001-arm-Add-corstone700-platform.patch \
-                               file://0002-boot-add-bootx-command-to-start-XiP-images.patch \
-                               file://0003-boot-starting-the-XIP-kernel-using-bootx-command.patch \
-                               file://0004-arm-enabling-the-arch_timer-driver.patch"
-- 
2.17.1

