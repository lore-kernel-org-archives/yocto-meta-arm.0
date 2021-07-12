Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.3318.1626177421228581744
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jul 2021 04:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E671FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jul 2021 04:57:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 690503F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jul 2021 04:57:00 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base*: update to u-boot 2021.07
Date: Mon, 12 Jul 2021 17:06:55 -0400
Message-Id: <20210712210655.31660-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 1dd9394..72dae65 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
 
-PREFERRED_VERSION_u-boot ?= "2021.04"
+PREFERRED_VERSION_u-boot ?= "2021.07"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
-- 
2.17.1

