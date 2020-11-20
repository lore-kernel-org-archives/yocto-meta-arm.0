Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.20785.1605846541404957596
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 20:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: thomas.abraham@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 729B21396;
	Thu, 19 Nov 2020 20:28:59 -0800 (PST)
Received: from usa.arm.com (a077432.blr.arm.com [10.162.4.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BAB93F719;
	Thu, 19 Nov 2020 20:28:58 -0800 (PST)
From: "Thomas Abraham" <thomas.abraham@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Vivek Gautam <vivek.gautam@arm.com>
Subject: [PATCH 1/6] arm-bsp: Introduce support for rdn1edge platform
Date: Fri, 20 Nov 2020 09:58:39 +0530
Message-Id: <20201120042844.21915-1-thomas.abraham@arm.com>
X-Mailer: git-send-email 2.17.1

From: Vivek Gautam <vivek.gautam@arm.com>

RD-N1-Edge is a Arm infrastructure reference platform. Add the
machine configuration in meta-arm-bsp layer for this platform.

Change-Id: I5846a0b9cd85531e61812d34aa7af85dd5dbfa89
Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 meta-arm-bsp/conf/machine/rdn1edge.conf | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/rdn1edge.conf

diff --git a/meta-arm-bsp/conf/machine/rdn1edge.conf b/meta-arm-bsp/conf/machine/rdn1edge.conf
new file mode 100644
index 0000000..088e09d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/rdn1edge.conf
@@ -0,0 +1,7 @@
+# Configuration for Arm RD-N1-Edge reference platform
+
+#@TYPE: Machine
+#@NAME: RD-N1-Edge
+#@DESCRIPTION: Machine configuration for RD-N1-Edge
+
+require conf/machine/include/tune-neoversen1.inc
-- 
2.17.1

