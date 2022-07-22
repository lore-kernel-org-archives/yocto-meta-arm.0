Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931A0C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:02:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2361.1658804530384105927
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 20:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20B65D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Jul 2022 20:02:10 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6737D3F70D
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Jul 2022 20:02:09 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: add u-boot v2022.04 support
Date: Fri, 22 Jul 2022 14:22:16 -0400
Message-Id: <20220722182216.3030-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 03:02:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3587

Upstream has updated u-boot to v2022.07, but the update is causing
problems with some machines.  Temporarily add a v2022.04 recipe until
the issues can be resolved.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot_2022.04.bb      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb
new file mode 100644
index 00000000..bc2d6d42
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb
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
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
+PE = "1"
+
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
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


