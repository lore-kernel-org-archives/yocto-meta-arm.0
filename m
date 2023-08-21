Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B773EE49AB
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:12:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1070.1692634322337749763
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 09:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB5B5143D;
	Mon, 21 Aug 2023 09:12:42 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0FDF73F64C;
	Mon, 21 Aug 2023 09:12:00 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: corstone1000: Update TF-A v2.9
Date: Mon, 21 Aug 2023 17:11:45 +0100
Message-Id: <20230821161145.10003-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821161145.10003-1-emekcan.aras@arm.com>
References: <20230821161145.10003-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 16:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4984

From: Emekcan Aras <emekcan.aras@arm.com>

Updates trusted-firmware-a and aligns with changes in v2.9 for Corstone-1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...rstone1000-add-cpuhelper-to-makefile.patch | 28 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  7 ++---
 3 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 697d81fe..30b017a3 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -5,7 +5,7 @@ MACHINEOVERRIDES =. "corstone1000:"
 # TF-A
 TFA_PLATFORM = "corstone1000"
 EXTRA_IMAGEDEPENDS += "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?= "2.8.%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.9.%"
 PREFERRED_VERSION_tf-a-tests ?= "2.8.%"
 
 TFA_BL2_BINARY = "bl2-corstone1000.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch
new file mode 100644
index 00000000..6ddde10e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch
@@ -0,0 +1,28 @@
+From 33078d8ef143e8c79f06399de46dd26e1d53a220 Mon Sep 17 00:00:00 2001
+From: Gauri Sahnan <Gauri.Sahnan@arm.com>
+Date: Tue, 8 Aug 2023 17:16:51 +0100
+Subject: fix(corstone1000): add cpuhelpers to makefile
+
+Adds cpu_helpers.S to the Makefile to align with the changes in new
+trusted-firmware-a version.
+
+Signed-off-by: Gauri Sahnan <Gauri.Sahnan@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ plat/arm/board/corstone1000/platform.mk | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/corstone1000/platform.mk
+index 3edffe087..079e9d6c1 100644
+--- a/plat/arm/board/corstone1000/platform.mk
++++ b/plat/arm/board/corstone1000/platform.mk
+@@ -43,6 +43,7 @@ BL2_SOURCES		+=	plat/arm/board/corstone1000/common/corstone1000_security.c		\
+ 				plat/arm/board/corstone1000/common/corstone1000_err.c		\
+ 				plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c	\
+ 				lib/utils/mem_region.c					\
++				lib/cpus/aarch64/cpu_helpers.S \
+ 				plat/arm/board/corstone1000/common/corstone1000_helpers.S		\
+ 				plat/arm/board/corstone1000/common/corstone1000_plat.c		\
+ 				plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c \
+-- 
+2.25.1
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 145b5d3a..3f66bed5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -7,12 +7,9 @@ SRC_URI:append = " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
 	file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch \
 	file://0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch \
+	file://0004-fix-corstone1000-add-cpuhelper-to-makefile.patch \
        "
 
-#Sets TF-A version to 2.8.0
-SRCREV_tfa = "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48"
-PV = "2.8.0"
-
 TFA_DEBUG = "1"
 TFA_UBOOT ?= "1"
 TFA_MBEDTLS = "1"
@@ -32,7 +29,7 @@ EXTRA_OEMAKE:append = " \
                         TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
                         ENABLE_STACK_PROTECTOR=strong \
                         ENABLE_PIE=1 \
-                        BL2_AT_EL3=1 \
+                        RESET_TO_BL2=1 \
                         CREATE_KEYS=1 \
                         GENERATE_COT=1 \
                         TRUSTED_BOARD_BOOT=1 \
-- 
2.17.1


