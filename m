Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1296.1620670592777889679
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 11:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C05C1688
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:31 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEBAF3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:30 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-m: upgrade to 1.3.0
Date: Thu,  6 May 2021 17:59:56 -0400
Message-Id: <20210506215956.25103-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Update TF-M to version 1.3.0, mbed TLS to 2.26, TF-M tests to 1.3.0
(previously untagged), and MCU Boot now has a new git repo location and
updated to 1.7.2.

Change-Id: I7ff2756cacff02abd31bb54048f8846b6a58cd01
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf       |  2 +-
 ...m_1.2.0.bb => trusted-firmware-m_1.3.0.bb} | 20 +++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.2.0.bb => trusted-firmware-m_1.3.0.bb} (89%)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index 3e7b5f5..ecef03a 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -25,4 +25,4 @@ ZEPHYR_BOARD = "v2m_musca_b1"
 ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
 ARCH_musca-b1 = "arm"
 
-TFM_PLATFORM = "musca_b1"
+TFM_PLATFORM = "musca_b1/sse_200"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.2.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
similarity index 89%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.2.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
index 3509a58..c954e02 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.2.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
@@ -17,19 +17,19 @@ LIC_FILES_CHKSUM = "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa \
 
 SRC_URI  = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=https;branch=master;name=tfm;destsuffix=${S} \
             git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=https;branch=master;name=tfm-tests;destsuffix=${S}/../tf-m-tests \
-            git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development;name=mbedtls;destsuffix=${S}/../mbedtls \
-            git://github.com/JuulLabs-OSS/mcuboot.git;protocol=https;name=mcuboot;destsuffix=${S}/../mcuboot \
+            git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master;name=mbedtls;destsuffix=${S}/../mbedtls \
+            git://github.com/mcu-tools/mcuboot.git;protocol=https;branch=v1.7-branch;name=mcuboot;destsuffix=${S}/../mcuboot \
             "
 
 # The required dependencies are documented in tf-m/config/config_default.cmake
-# TF-Mv1.2.0
-SRCREV_tfm = "c78be620c0fee08888956646b8f02fd03ab88567"
-# mbedtls 2.24
-SRCREV_mbedtls = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
-# master as of 20210212
-SRCREV_tfm-tests = "ccda809801e529250b47c9ac470cf94daef1bb1b"
-# 1.7.0
-SRCREV_mcuboot = "a8e12dae381080e898cea0c6f7408009b0163f9f"
+# TF-Mv1.3.0
+SRCREV_tfm = "aa7d90a23b045e50c26ef66b11250842b665f54b"
+# mbedtls 2.26
+SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
+# tf-m-tests v1.3.0
+SRCREV_tfm-tests = "e7430d13b388a106c9f4cfb534e7340ce1482575"
+# 1.7.2
+SRCREV_mcuboot = "4aa516e7281fc6f9a2dce0b0efda9acc580fa254"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.17.1

