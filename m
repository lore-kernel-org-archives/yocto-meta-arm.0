Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.76020.1629406798183572597
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Aug 2021 13:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5911474
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4E3D3F70D
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Aug 2021 13:59:56 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/qemuarm64-secureboot: use 5.10 kernel
Date: Thu, 19 Aug 2021 16:59:51 -0400
Message-Id: <20210819205951.24259-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819205951.24259-1-jon.mason@arm.com>
References: <20210819205951.24259-1-jon.mason@arm.com>

qemuarm64-secureboot is failing to boot with the 5.13 kernel.  Use the
5.10 kernel until this can be addressed.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/xen.yml                                      | 2 +-
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/ci/xen.yml b/ci/xen.yml
index d0c1765..ae65062 100644
--- a/ci/xen.yml
+++ b/ci/xen.yml
@@ -4,7 +4,7 @@ header:
     - meta-virtualization.yml
 
 local_conf_header:
-  meta-virt:
+  meta-virt: |
     DISTRO_FEATURES:append = " virtualization xen"
 
 target:
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index fe19ed2..c45924a 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -19,3 +19,5 @@ IMAGE_FSTYPES += "wic wic.qcow2"
 WKS_FILE ?= "qemuarm64.wks"
 WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
+
+PREFERRED_VERSION_linux-yocto ?= "5.10%"
-- 
2.17.1

