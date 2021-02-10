Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11544.1612987632523874177
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Feb 2021 12:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DA6E113E
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 12:07:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BFFDA3F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 12:07:10 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/microbit-v1: Fix build break
Date: Wed, 10 Feb 2021 15:07:04 -0500
Message-Id: <20210210200705.27717-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

KAS is seeing build breaks on microbit-v1.  This can be fixed by either
setting the distro to zephyr or using newlib.  Opting for the latter to
match musca machines.

Change-Id: I25f1cca3f7054f6c44974877350f8612643d55e6
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/microbit-v1.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
index c4cc4d5..b247d6e 100644
--- a/meta-arm/conf/machine/microbit-v1.conf
+++ b/meta-arm/conf/machine/microbit-v1.conf
@@ -7,6 +7,9 @@ require conf/machine/include/tune-cortex-m0.inc
 
 MACHINEOVERRIDES =. "nordic:"
 
+# GLIBC will not work with Cortex-M.
+TCLIBC = "newlib"
+
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine microbit"
-- 
2.17.1

