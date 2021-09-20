Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12973.1632149947510680874
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069FC106F
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 07:59:07 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAB3A3F59C
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 07:59:06 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] README: Add root directories
Date: Mon, 20 Sep 2021 10:59:00 -0400
Message-Id: <20210920145900.31363-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Add ci, kas, and scripts to the README to document their intended uses.
Also, alphabetize the layer entries.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 README.md | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 3bb59e1..221633e 100644
--- a/README.md
+++ b/README.md
@@ -6,6 +6,10 @@ This repository contains the Arm layers for OpenEmbedded.
 
   This layer contains general recipes for the Arm architecture, such as firmware, FVPs, and Arm-specific integration.
 
+* meta-arm-autonomy
+
+  This layer is the distribution for a reference stack for autonomous systems.
+
 * meta-arm-bsp
 
   This layer contains machines for Arm reference platforms, for example FVP Base, N1SDP, and Juno.
@@ -14,17 +18,29 @@ This repository contains the Arm layers for OpenEmbedded.
 
   This layer contains recipes for Arm's binary toolchains (GCC and Clang for -A and -M), and a recipe to build Arm's GCC.
 
-* meta-arm-autonomy
+* meta-atp
 
-  This layer is the distribution for a reference stack for autonomous systems.
+  This layer contains recipes for the Adaptive Traffic Generation integration into meta-gem5.
 
 * meta-gem5
 
   This layer contains recipes and machines for gem5, a system-level and processor simulator.
 
-* meta-atp
 
-  This layer contains recipes for the Adaptive Traffic Generation integration into meta-gem5.
+Other Directories
+-----------------
+
+* ci
+
+  This directory contains gitlab continuous integration configuration files (KAS yaml files) as well as scripts needed for this
+
+* kas
+
+  This directory contains KAS yaml files to describe builds for systems not used in CI
+
+* scripts
+
+  This directory contains scripts used in running the CI tests
 
 Contributing
 ------------
-- 
2.17.1

