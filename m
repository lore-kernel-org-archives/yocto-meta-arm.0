Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.37490.1610385107381178951
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 09:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: usama.arif@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A49201396;
	Mon, 11 Jan 2021 09:11:36 -0800 (PST)
Received: from usaari01.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8203F70D;
	Mon, 11 Jan 2021 09:11:36 -0800 (PST)
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp/images: artifacts image for tc0
Date: Mon, 11 Jan 2021 17:11:27 +0000
Message-Id: <20210111171127.23510-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1

Trusted-firmware-a is the final component to be built with the rest of the
components dependent of it, therefore building tc0-artifacts-image
which depends on trusted-firmware-a will build all the required binaries.

Signed-off-by: Usama Arif <usama.arif@arm.com>
Change-Id: I57760a339da1601bd66e3dd752a7b2814e84bbb8
---
 meta-arm-bsp/documentation/tc0.md                    |  6 +++---
 .../recipes-bsp/images/tc0-artifacts-image.bb        | 12 ++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb

diff --git a/meta-arm-bsp/documentation/tc0.md b/meta-arm-bsp/documentation/tc0.md
index f11b781..9ea4f7c 100644
--- a/meta-arm-bsp/documentation/tc0.md
+++ b/meta-arm-bsp/documentation/tc0.md
@@ -16,11 +16,11 @@ In the local.conf file, MACHINE should be set as follows:
 MACHINE = "tc0"
 
 To build the required binaries for tc0, run the commmand:
-```bash$ bitbake trusted-firmware-a```
+```bash$ bitbake tc0-artifacts-image```
 
 Trusted-firmware-a is the final component to be built with the rest of the
-components dependent of it, therefore building trusted-firmware-a will
-build all the required binaries.
+components dependent of it, therefore building tc0-artifacts-image which depends
+on trusted-firmware-a will build all the required binaries.
 
 ## Running
 To run the produced binaries in a TC0 Fixed Virtual Platform please get
diff --git a/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb b/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
new file mode 100644
index 0000000..43c1eda
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: Apache-2.0
+#
+# Copyright (c) 2020 Arm Limited
+#
+SUMMARY = "Total Compute Images"
+DESCRIPTION = "Build all the images required for Total Compute platform"
+LICENSE = "Apache-2.0"
+
+inherit nopackages
+
+# The last image to be built is trusted-firmware-a
+DEPENDS += " trusted-firmware-a"
-- 
2.17.1

