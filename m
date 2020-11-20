Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.20886.1605846547092860447
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 20:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: thomas.abraham@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBE501595;
	Thu, 19 Nov 2020 20:29:06 -0800 (PST)
Received: from usa.arm.com (a077432.blr.arm.com [10.162.4.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B90223F719;
	Thu, 19 Nov 2020 20:29:05 -0800 (PST)
From: "Thomas Abraham" <thomas.abraham@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Vivek Gautam <vivek.gautam@arm.com>
Subject: [PATCH 6/6] arm-bsp/wic: Add WIC support for rdn1edge
Date: Fri, 20 Nov 2020 09:58:44 +0530
Message-Id: <20201120042844.21915-6-thomas.abraham@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120042844.21915-1-thomas.abraham@arm.com>
References: <20201120042844.21915-1-thomas.abraham@arm.com>

From: Vivek Gautam <vivek.gautam@arm.com>

Use the default "mkefidisk.wks" OE kickstart file to build the disk
image for rdn1edge platform.

Change-Id: I3b887c35a322265bae09456b9aade53e4d02b8f8
Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 meta-arm-bsp/conf/machine/rdn1edge.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/rdn1edge.conf b/meta-arm-bsp/conf/machine/rdn1edge.conf
index 0c78654..5c7f45f 100644
--- a/meta-arm-bsp/conf/machine/rdn1edge.conf
+++ b/meta-arm-bsp/conf/machine/rdn1edge.conf
@@ -24,3 +24,8 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
 MACHINE_FEATURES += "efi"
+
+#Disk Image
+IMAGE_FSTYPES += "wic"
+WKS_FILE ?= "mkefidisk.wks"
+WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
-- 
2.17.1

