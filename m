Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9943.1603099639539539684
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 02:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34AFB30E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:18 -0700 (PDT)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 980F33F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:17 -0700 (PDT)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v3 1/6] qemuarm64-secureboot: changed format of memory to MB
Date: Mon, 19 Oct 2020 10:27:07 +0100
Message-Id: <20201019092712.13467-1-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1

When running runqemu the memory argument in the kernel
commandline arguments expects megabytes, so with the previous
format "-m 1GM" ended up being passed.

Change-Id: I5d3bc9d5ce93fa3da5885c99feb99ce80367c993
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index a5b7401..f2c15e6 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
 
 QB_MACHINE = "-machine virt,secure=on"
 QB_OPT_APPEND += "-no-acpi"
-QB_MEM = "-m 1G"
+QB_MEM = "-m 1024"
 QB_DEFAULT_FSTYPE = "wic.qcow2"
 QB_DEFAULT_BIOS = "flash.bin"
 QB_FSINFO = "wic:no-kernel-in-fs"
-- 
2.17.1

