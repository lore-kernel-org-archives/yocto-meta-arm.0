Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D7CC2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 13:19:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15683.1660655983982641158
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Aug 2022 06:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79F4114BF;
	Tue, 16 Aug 2022 06:19:44 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 045213F66F;
	Tue, 16 Aug 2022 06:19:42 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-a: Bump TF-A version for N1SDP
Date: Tue, 16 Aug 2022 14:19:32 +0100
Message-Id: <20220816131933.33160-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220816131933.33160-1-vishnu.banavath@arm.com>
References: <20220816131933.33160-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 13:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3696

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to bump the TF-A hash which has changes required
for optee-os to boot. Also, drop patch related to bl size as the
changes are already merged to upstream TF-A.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../files/n1sdp/bl_size.patch                 | 40 -------------------
 .../trusted-firmware-a-n1sdp.inc              |  5 ++-
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_size.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_size.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_size.patch
deleted file mode 100644
index a5b30195..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_size.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 80b1efa92486a87f9e82dbf665ef612291148de8 Mon Sep 17 00:00:00 2001
-From: Adam Johnston <adam.johnston@arm.com>
-Date: Tue, 14 Jun 2022 11:19:30 +0000
-Subject: [PATCH] arm-bsp/trusted-firmware-a: N1SDP trusted boot
-
-Increase max size of BL2 on N1SDP by 4KB to enable trusted boot
-Decrease max size of BL1 on N1SDP by 8KB so BL1/BL2 fits above BL31 progbits
-
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
-Upstream-Status: Pending [Flagged to upstream]
-
----
- plat/arm/board/n1sdp/include/platform_def.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/plat/arm/board/n1sdp/include/platform_def.h b/plat/arm/board/n1sdp/include/platform_def.h
-index c9b81bafa..7468a31ed 100644
---- a/plat/arm/board/n1sdp/include/platform_def.h
-+++ b/plat/arm/board/n1sdp/include/platform_def.h
-@@ -91,7 +91,7 @@
-  * PLAT_ARM_MAX_BL1_RW_SIZE is calculated using the current BL1 RW debug size
-  * plus a little space for growth.
-  */
--#define PLAT_ARM_MAX_BL1_RW_SIZE	0xE000
-+#define PLAT_ARM_MAX_BL1_RW_SIZE	0xC000
- 
- /*
-  * PLAT_ARM_MAX_ROMLIB_RW_SIZE is define to use a full page
-@@ -110,7 +110,7 @@
-  * little space for growth.
-  */
- #if TRUSTED_BOARD_BOOT
--# define PLAT_ARM_MAX_BL2_SIZE		0x20000
-+# define PLAT_ARM_MAX_BL2_SIZE		0x21000
- #else
- # define PLAT_ARM_MAX_BL2_SIZE		0x14000
- #endif
--- 
-2.35.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index f8a0b8d5..9e106055 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -1,5 +1,8 @@
 # N1SDP specific TFA support
 
+SRCREV_tfa  = "1d867c14cb41c1171d16fa7e395a4eaed3d572b2"
+PV .= "+git${SRCPV}"
+
 COMPATIBLE_MACHINE = "n1sdp"
 TFA_PLATFORM       = "n1sdp"
 TFA_BUILD_TARGET   = "all fip"
@@ -9,8 +12,6 @@ TFA_MBEDTLS        = "1"
 TFA_UBOOT          = "0"
 TFA_UEFI           = "1"
 
-SRC_URI:append = " file://bl_size.patch"
-
 TFA_ROT_KEY= "plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
 
 EXTRA_OEMAKE:append = "\
-- 
2.17.1


