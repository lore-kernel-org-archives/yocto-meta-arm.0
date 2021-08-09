Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7482.1628600071162743100
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 05:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17838113E
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:30 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFF3B3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:29 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] n1sdp: use upstream tunes file
Date: Mon,  9 Aug 2021 19:05:11 -0400
Message-Id: <20210809230513.14521-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809230513.14521-1-jon.mason@arm.com>
References: <20210809230513.14521-1-jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/tune-neoversen1.inc       | 14 --------------
 meta-arm-bsp/conf/machine/n1sdp.conf               |  2 +-
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc

diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
deleted file mode 100644
index 6999805..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULTTUNE ?= "neoversen1"
-
-TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
-# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES += "neoversen1"
-ARMPKGARCH:tune-neoversen1             = "neoversen1"
-TUNE_FEATURES:tune-neoversen1          = "aarch64 neoversen1 crc crypto"
-PACKAGE_EXTRA_ARCHS:tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} neoversen1"
-BASE_LIB:tune-neoversen1               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index e80580d..b0d97f8 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -4,7 +4,7 @@
 #@NAME: N1SDP machine
 #@DESCRIPTION: Machine configuration for N1SDP
 
-require conf/machine/include/tune-neoversen1.inc
+require conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
 
 KERNEL_IMAGETYPE = "Image"
 
-- 
2.17.1

