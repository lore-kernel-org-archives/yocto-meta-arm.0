Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.745.1608562003713761039
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 06:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0985D1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Dec 2020 06:46:33 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE6983F6CF
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Dec 2020 06:46:32 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux: remove unused kmeta variables
Date: Mon, 21 Dec 2020 09:46:26 -0500
Message-Id: <20201221144626.22373-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

gem5 is no longer in meta-arm-bsp, and kmeta entry should be removed.

sgi575 has no usage of the meta-arm-bsp kmeta and would be better suited
to use the generic one.

corstone700 is defining kmeta, but that variable is only used in the
generic kmeta src_uri, and not the meta-arm-bsp that it is using.

Change-Id: I01e80c433a9a02bad1f6337b0df27cbf6a96231f
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc     | 2 --
 meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 01c4794..1c9fdc1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -12,8 +12,6 @@ SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;
 SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
 SRC_URI_append_juno = " ${SRC_URI_KMETA}"
-SRC_URI_append_sgi575 = " ${SRC_URI_KMETA}"
-SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
index 58b849d..f2a9a54 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
@@ -31,7 +31,6 @@ KERNEL_IMAGETYPE = "xipImage"
 
 KCONFIG_MODE = "--alldefconfig"
 
-KMETA = "arm-platforms-kmeta"
 SRC_URI_append = " ${SRC_URI_KMETA}"
 
 KERNEL_EXTRA_FEATURES = "bsp/arm-platforms/corstone700-bsp.scc"
-- 
2.17.1

