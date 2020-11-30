Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.62313.1606753795282879998
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Nov 2020 08:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0684D1042
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Nov 2020 08:29:45 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8DE33F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Nov 2020 08:29:44 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: update Android common kernel
Date: Mon, 30 Nov 2020 11:29:35 -0500
Message-Id: <20201130162935.8869-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Update ACK to ASB-2020-07-05_5.4-stable and remove the 4.19 recipe

Change-Id: Iecc56effff11ecd9619553381815445b64aa645e
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-arm64-ack_4.19.bb     | 12 ------------
 meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb |  4 ++--
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb

diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
deleted file mode 100644
index 989b055..0000000
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: Apache-2.0
-#
-# Copyright (c) 2020 Arm Limited
-#
-require linux-arm64-ack.inc
-
-SRC_URI = " \
-    git://android.googlesource.com/kernel/common.git;protocol=https;branch=android-4.19-q-release \
-    "
-
-# ASB-2020-06-05_4.19-q-release tag commit
-SRCREV = "ebd43352dd92e56f14a4985a3c99de767fc8f9cf"
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
index 3221fd8..aab2fd1 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
@@ -12,5 +12,5 @@ SRC_URI = " \
     file://0004-libtraceevent-Fix-build-with-binutils-2.35.patch \
     "
 
-# ASB-2020-06-05_5.4-stable tag commit
-SRCREV = "2068976fd7b172b64020006efde1ee57af6bbf99"
+# ASB-2020-07-05_5.4-stable tag commit
+SRCREV = "056684c0d252f75c13be4abb7408f692eedab653"
-- 
2.17.1

