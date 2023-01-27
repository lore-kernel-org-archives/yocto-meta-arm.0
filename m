Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA0DC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:45:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.102096.1674827129782376509
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 05:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E1FB2F
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 05:46:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 179CF3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 05:45:29 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: add u-boot v2022.10 support
Date: Fri, 27 Jan 2023 08:45:23 -0500
Message-Id: <20230127134523.11563-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 13:45:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4323

Upstream has updated u-boot to v2023.01, but the update is causing
problems with some machines.  Temporarily add a v2022.10 recipe until
the issues can be resolved.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf |  2 +-
 meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
index db02dc68..cb54fe94 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -23,4 +23,4 @@ IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 MACHINE_FEATURES += "optee-ftpm"
 
 PREFERRED_VERSION_optee-os ?= "3.18.%"
-
+PREFERRED_VERSION_u-boot ?= "2022.10"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb b/meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb
new file mode 100644
index 00000000..905ae552
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb
@@ -0,0 +1,26 @@
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
+SECTION = "bootloaders"
+DEPENDS += "flex-native bison-native"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
+PE = "1"
+
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
+          "
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+require recipes-bsp/u-boot/u-boot.inc
+
+DEPENDS += "bc-native dtc-native gnutls-native"
-- 
2.17.1


