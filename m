Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.75070.1629406798347364848
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Aug 2021 13:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D00351435
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B391B3F70D
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm-bsp/linux-yocto: Add 5.4 kernel
Date: Thu, 19 Aug 2021 16:59:50 -0400
Message-Id: <20210819205951.24259-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819205951.24259-1-jon.mason@arm.com>
References: <20210819205951.24259-1-jon.mason@arm.com>

Temporary hack to allow for things to continue to work, while waiting
for the platforms to migrate to a newer kernel.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_5.4.bb   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
new file mode 100644
index 0000000..0a67f87
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -0,0 +1,22 @@
+KBRANCH ?= "v5.4/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LINUX_VERSION ?= "5.4.139"
+
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+# Functionality flags
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-- 
2.17.1

