Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934ACC3F2D4
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:15:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8845.1655226920942084217
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC84176A
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:20 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB9703F66F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:19 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm-bsp: Remove old, unused u-boot recipes
Date: Tue, 14 Jun 2022 13:15:14 -0400
Message-Id: <20220614171514.32495-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220614171514.32495-1-jon.mason@arm.com>
References: <20220614171514.32495-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3496

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot_2021.10.bb      | 26 -------------------
 .../recipes-bsp/u-boot/u-boot_2022.01.bb      | 26 -------------------
 2 files changed, 52 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
deleted file mode 100644
index d117a880..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
-DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
-ARM, MIPS and several other processors, which can be installed in a boot \
-ROM and used to initialize and test the hardware or to download and run \
-application code."
-SECTION = "bootloaders"
-DEPENDS += "flex-native bison-native"
-
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
-PE = "1"
-
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-          "
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-do_configure[cleandirs] = "${B}"
-
-require recipes-bsp/u-boot/u-boot.inc
-
-DEPENDS += "bc-native dtc-native"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb
deleted file mode 100644
index 4c5237c7..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
-DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
-ARM, MIPS and several other processors, which can be installed in a boot \
-ROM and used to initialize and test the hardware or to download and run \
-application code."
-SECTION = "bootloaders"
-DEPENDS += "flex-native bison-native"
-
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
-PE = "1"
-
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-          "
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-do_configure[cleandirs] = "${B}"
-
-require recipes-bsp/u-boot/u-boot.inc
-
-DEPENDS += "bc-native dtc-native"
-- 
2.17.1


