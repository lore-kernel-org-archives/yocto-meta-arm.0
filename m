Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2164.1621369589570892828
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 May 2021 13:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6AAED1
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 May 2021 13:26:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B02B83F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 May 2021 13:26:27 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: free float the u-boot bbappend
Date: Tue, 18 May 2021 12:02:17 -0400
Message-Id: <20210518160217.18524-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Since the u-boot recipe will be updated in the near future, decouple the
bbappend from the current version to allow for it to work on both
versions (and keep backward compatible with hardknott).

Change-Id: Ia2447a80868f2e5011bf53fafb939b6a4566b662
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0001-Add-vexpress_aemv8a_aarch32-variant.patch              | 0
 ...1-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch | 0
 .../fvp-base/u-boot_vexpress_fvp.patch                          | 0
 .../u-boot/{u-boot_2021.01.bbappend => u-boot_%.bbappend}       | 2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2021.01 => u-boot}/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2021.01 => u-boot}/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2021.01 => u-boot}/fvp-base/u-boot_vexpress_fvp.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot_2021.01.bbappend => u-boot_%.bbappend} (88%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/u-boot_vexpress_fvp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/u-boot_vexpress_fvp.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
similarity index 88%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index fb4f192..df9fdfb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,6 +1,6 @@
 # Machine specific u-boot
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 #
 # FVP BASE
-- 
2.17.1

