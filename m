Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.20875.1605846545848002822
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 20:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: thomas.abraham@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45C1E1396;
	Thu, 19 Nov 2020 20:29:05 -0800 (PST)
Received: from usa.arm.com (a077432.blr.arm.com [10.162.4.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4116E3F719;
	Thu, 19 Nov 2020 20:29:04 -0800 (PST)
From: "Thomas Abraham" <thomas.abraham@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Vivek Gautam <vivek.gautam@arm.com>
Subject: [PATCH 5/6] arm-bsp/grub: Add grub-efi support for rdn1edge
Date: Fri, 20 Nov 2020 09:58:43 +0530
Message-Id: <20201120042844.21915-5-thomas.abraham@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120042844.21915-1-thomas.abraham@arm.com>
References: <20201120042844.21915-1-thomas.abraham@arm.com>

From: Vivek Gautam <vivek.gautam@arm.com>

Add grub-efi as dependency to use it as OS loader after the UEFI stage.

Change-Id: I026bac25b2fdeb366add487c85636ddafb80189b
Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 meta-arm-bsp/conf/machine/rdn1edge.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/rdn1edge.conf b/meta-arm-bsp/conf/machine/rdn1edge.conf
index d86c9f7..0c78654 100644
--- a/meta-arm-bsp/conf/machine/rdn1edge.conf
+++ b/meta-arm-bsp/conf/machine/rdn1edge.conf
@@ -20,3 +20,7 @@ KERNEL_IMAGETYPE ?= "Image"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
 PREFERRED_VERSION_linux-stable ?= "5.7%"
 SERIAL_CONSOLES = "115200;ttyAMA0"
+
+#grub-efi
+EFI_PROVIDER ?= "grub-efi"
+MACHINE_FEATURES += "efi"
-- 
2.17.1

