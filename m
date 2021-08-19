Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.76021.1629406798191744010
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Aug 2021 13:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A07C1142F
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 85B013F70D
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/machine: update to new tunes locations
Date: Thu, 19 Aug 2021 16:59:49 -0400
Message-Id: <20210819205951.24259-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819205951.24259-1-jon.mason@arm.com>
References: <20210819205951.24259-1-jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf        | 2 +-
 meta-arm-bsp/conf/machine/include/corstone700.inc | 2 +-
 meta-arm/conf/machine/microbit-v1.conf            | 2 +-
 meta-arm/conf/machine/qemu-cortex-a53.conf        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 401c746..e87d81d 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -2,7 +2,7 @@
 #@NAME: Corstone-500 machine
 #@DESCRIPTION: Machine configuration for the Corstone-500 platform
 
-require conf/machine/include/tune-cortexa5.inc
+require conf/machine/include/arm/armv7a/tune-cortexa5.inc
 
 # Corstone-500 is built against poky-tiny distro.
 # poky-tiny sets PREFERRED_PROVIDER_virtual/kernel to linux-yocto-tiny.
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 229a226..0ec385a 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -1,6 +1,6 @@
 # Common configuration for all Corstone700 machines
 
-require conf/machine/include/tune-cortexa32.inc
+require conf/machine/include/arm/armv8a/tune-cortexa32.inc
 
 MACHINEOVERRIDES =. "corstone700:"
 
diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
index 84663d4..1fa2532 100644
--- a/meta-arm/conf/machine/microbit-v1.conf
+++ b/meta-arm/conf/machine/microbit-v1.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine for BBC Microbit v1, Zephyr BOARD qemu_cortex_m0
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-cortex-m0.inc
+require conf/machine/include/arm/armv6m/tune-cortexm0.inc
 
 MACHINEOVERRIDES =. "nordic:"
 
diff --git a/meta-arm/conf/machine/qemu-cortex-a53.conf b/meta-arm/conf/machine/qemu-cortex-a53.conf
index 294c65f..b97cde7 100644
--- a/meta-arm/conf/machine/qemu-cortex-a53.conf
+++ b/meta-arm/conf/machine/qemu-cortex-a53.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine for Zephyr BOARD qemu_cortex_a53
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-cortexa53.inc
+require conf/machine/include/arm/armv8a/tune-cortexa53.inc
 
 TCLIBC = "newlib"
 
-- 
2.17.1

