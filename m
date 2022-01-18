Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C187C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 17:06:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15643.1642525566677810191
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 09:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EED4D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 09:06:05 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F8293F774
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 09:06:05 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: create u-boot 2020.10 to resolve warning
Date: Tue, 18 Jan 2022 12:05:59 -0500
Message-Id: <20220118170559.24303-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 17:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2861

Poky, etc master branches updated the u-boot recipes to use 2022.01,
causing bbappends for 2021.10 to no longer function.  Create a temporary
recipe for 2021.10 until all the BSPs can update to support the latest
version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot_2021.10.bb      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
new file mode 100644
index 0000000..2d3e95a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
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
+SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
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
+DEPENDS += "bc-native dtc-native"
-- 
2.17.1


