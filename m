Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38058C38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:56:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.76398.1674226613006280207
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 06:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 109081515
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 06:57:34 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5DEFC3F67D
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 06:56:52 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-m: disable fatal warnings
Date: Fri, 20 Jan 2023 09:56:45 -0500
Message-Id: <20230120145647.11758-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230120145647.11758-1-jon.mason@arm.com>
References: <20230120145647.11758-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 14:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4305

Disable fatal warnings for tfm.  This removes issues with RWX and others
when using the new binary toolchain versions.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m/files/rwx.patch        | 24 +++++++++++++++++++
 .../trusted-firmware-m_1.7.0.bb               |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch b/meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch
new file mode 100644
index 00000000..b279cfea
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch
@@ -0,0 +1,24 @@
+From 1d548c77d07fc9a83e3e9aa28a23aa19a0177e3b Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Wed, 18 Jan 2023 15:13:37 -0500
+Subject: [PATCH] arm/trusted-firmware-m: disable fatal warnings
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Inappropriate
+
+---
+ toolchain_GNUARM.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
+index 7978eaca68..88395f922a 100644
+--- a/toolchain_GNUARM.cmake
++++ b/toolchain_GNUARM.cmake
+@@ -66,7 +66,6 @@ macro(tfm_toolchain_reset_linker_flags)
+         --entry=Reset_Handler
+         --specs=nano.specs
+         LINKER:-check-sections
+-        LINKER:-fatal-warnings
+         LINKER:--gc-sections
+         LINKER:--no-wchar-size-warning
+         ${MEMORY_USAGE_FLAG}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
index 3b4469d0..fb88596b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -20,6 +20,7 @@ SRC_URI  = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=h
             git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=${SRCBRANCH_mbedtls};name=mbedtls;destsuffix=git/mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=https;branch=${SRCBRANCH_mcuboot};name=mcuboot;destsuffix=git/mcuboot \
             git://github.com/laurencelundblade/QCBOR.git;protocol=https;branch=${SRCBRANCH_qcbor};name=qcbor;destsuffix=git/qcbor \
+            file://rwx.patch \
             "
 
 # The required dependencies are documented in tf-m/config/config_default.cmake
-- 
2.17.1


