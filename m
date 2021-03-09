Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.14804.1615319360350702860
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 11:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B144931B
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Mar 2021 11:49:18 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5EF063F73C
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Mar 2021 11:49:18 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/qemuarm64-secureboot: removed unused -dev kernel
Date: Tue,  9 Mar 2021 14:49:11 -0500
Message-Id: <20210309194911.14477-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

The change of the qemuarm64-secureboot kernel to the generic one didn't
remove the no longer necessary kernel.

Change-Id: Id6d49084e2bee0956b986958a5d990f9ec41ea5a
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend | 4 ----
 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg  | 4 ----
 2 files changed, 8 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
deleted file mode 100644
index c7742f8..0000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI_append_qemuarm64-secureboot = " file://tee.cfg"
-
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
deleted file mode 100644
index 7415e18..0000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_HW_RANDOM_OPTEE=m
-CONFIG_TEE=m
-CONFIG_OPTEE=m
-CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=10
-- 
2.17.1

