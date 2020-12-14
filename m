Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.2447.1607988296380327596
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 15:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B935B31B
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:55 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 697EE3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:55 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm-bsp: update SCP for TC0
Date: Mon, 14 Dec 2020 18:24:42 -0500
Message-Id: <20201214232442.4371-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201214232442.4371-1-jon.mason@arm.com>
References: <20201214232442.4371-1-jon.mason@arm.com>

Update TC0 SCP from using a local version (non-standard) to use the
generic 2.7 recipe.

Change-Id: I68aca8fe7f1f7a574a2324dff348f80cd4989581
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/tc0.conf                          | 2 --
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc  | 6 ------
 .../recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend     | 1 -
 .../recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend     | 1 +
 4 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index 8d70aad..efc9c02 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -17,8 +17,6 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
-PREFERRED_VERSION_scp-firmware ?= "2.6%"
-
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-arm64-ack"
 PREFERRED_VERSION_linux-arm64-ack ?= "5.4"
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index 013bbf9..cacdca8 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,12 +1,6 @@
 # TC0 specific SCP configuration
 
-# Intermediate SHA with 2.6 baseline version
-SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
-SRCREV = "6fad1d3e2f82b2ef51e55928ac3a678a75f64ef4"
-
 COMPATIBLE_MACHINE = "tc0"
 
 SCP_PLATFORM = "tc0"
 FW_TARGETS = "scp"
-
-PV = "2.6.0+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
index 627689f..1ddb497 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
@@ -2,7 +2,6 @@
 
 MACHINE_SCP_REQUIRE ?= ""
 
-MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
 MACHINE_SCP_REQUIRE_juno = "scp-firmware-juno.inc"
 
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
index 9cbdcb6..443c293 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
@@ -4,5 +4,6 @@ MACHINE_SCP_REQUIRE ?= ""
 
 MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_sgi575 = "scp-firmware-sgi575.inc"
+MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
 
 require ${MACHINE_SCP_REQUIRE}
-- 
2.17.1

