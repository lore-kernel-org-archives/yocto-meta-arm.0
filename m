Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.17691.1601478320189848797
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Sep 2020 08:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16651D6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Sep 2020 08:05:19 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACC813F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Sep 2020 08:05:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/documentation: add BSP documentation template
Date: Wed, 30 Sep 2020 16:05:14 +0100
Message-Id: <20200930150514.634610-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a template for future BSP documentation.

Change-Id: I614d43f477f1a5dfb898b808d4c5b78a5bb163b8
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/documentation/template.md | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arm-bsp/documentation/template.md

diff --git a/meta-arm-bsp/documentation/template.md b/meta-arm-bsp/docume=
ntation/template.md
new file mode 100644
index 0000000..7beeb59
--- /dev/null
+++ b/meta-arm-bsp/documentation/template.md
@@ -0,0 +1,19 @@
+# *Hardware Name*
+
+## Overview
+
+*Brief summary of the hardware*
+
+*Link to reference documentation*
+
+## Building
+
+*Any special steps required to build successfully beyond setting MACHINE=
*
+
+*For example: corstone700 needs DISTRO=3Dpoky-tiny, musca only supports =
TF-M*
+
+## Running
+
+*A summary of how to deploy or execute the image*
+
+*For example, an overview of the N1SDP SD structure, or FVP arguments*
--=20
2.28.0

