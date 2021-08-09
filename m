Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7383.1628600075528934860
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 05:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE8E7106F
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C45ED3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:29 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] sgi575: remove redundant entry
Date: Mon,  9 Aug 2021 19:05:10 -0400
Message-Id: <20210809230513.14521-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809230513.14521-1-jon.mason@arm.com>
References: <20210809230513.14521-1-jon.mason@arm.com>

sgi575 already has the defconfig entry in the include file.  Remove the
redundant entry from the machine config file.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index 82009f3..4f91710 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -12,11 +12,9 @@ PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
-# Use kernel provided by linaro
 KERNEL_IMAGETYPE ?= "Image"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.7%"
-KCONFIG_MODE = "--alldefconfig"
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 #grub-efi
-- 
2.17.1

