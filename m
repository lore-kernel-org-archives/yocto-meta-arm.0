Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39144C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:25:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.28270.1647275148665824036
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Mar 2022 09:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA2AED6E;
	Mon, 14 Mar 2022 09:25:47 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B28C3F774;
	Mon, 14 Mar 2022 09:25:47 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH honister 1/2] arm-bsp/linux-yocto: backport remove redundant
 kernel hacking
Date: Mon, 14 Mar 2022 16:25:01 +0000
Message-Id: <20220314162502.25350-2-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220314162502.25350-1-harry.moulton@arm.com>
References: <20220314162502.25350-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Mar 2022 16:25:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3171

From: Harry Moulton <harry.moulton@arm.com>

Backport of 7fc51c7c from master which removes some redundant code to
reduce the size of the resulting corstone1000 binary.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
---
 .../linux/linux-arm-platforms.inc              | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 49f92ce..73c52f7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -143,24 +143,6 @@ SRC_URI:append:corstone1000 = " ${@bb.utils.contains('MACHINE_FEATURES', \
 # corstone1000 has limited flash memory constraints
 KERNEL_EXTRA_FEATURES:corstone1000 = ""
 KERNEL_FEATURES:corstone1000 = ""
-# No need to include the kernel image in the rootfs
-# So, let's delete the package doing that and uninstalling the initial
-# kernel binary.
-# The kernel binary needed is the initramfs bundle
-
-FILES:kernel-image-image:corstone1000=""
-
-# Uninstalling the initial kernel binary
-
-do_install:append:corstone1000() {
-    if [ -e "${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}" ]; then
-        rm ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
-    fi
-
-    if [ -e "${D}/${KERNEL_IMAGEDEST}/$imageType" ]; then
-        rm ${D}/${KERNEL_IMAGEDEST}/$imageType
-    fi
-}
 
 #
 # FVP BASE KMACHINE
-- 
2.17.1


