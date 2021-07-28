Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.408.1627488796205294046
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 09:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A2BA6D
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 09:13:14 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E8A13F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 09:13:14 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: add ssh tests
Date: Wed, 28 Jul 2021 12:13:09 -0400
Message-Id: <20210728161309.27698-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/qemuarm64-secureboot.yml | 5 +++++
 ci/qemuarmv5.yml            | 5 +++++
 ci/testimage.yml            | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 8236f87..b7f3cb4 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -5,6 +5,11 @@ header:
 
 machine: qemuarm64-secureboot
 
+local_conf_header:
+  bugs: |
+    # Only ping until errors can be resolved
+    TEST_SUITES = "ping"
+
 target:
   - core-image-base
   - perf
diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml
index b1ff446..aaf7f4f 100644
--- a/ci/qemuarmv5.yml
+++ b/ci/qemuarmv5.yml
@@ -4,3 +4,8 @@ header:
     - base.yml
 
 machine: qemuarmv5
+
+local_conf_header:
+  bugs: |
+    # Remove parselogs until errors can be resolved
+    TEST_SUITES_remove = "parselogs"
diff --git a/ci/testimage.yml b/ci/testimage.yml
index adc7765..8941ad3 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -9,6 +9,8 @@ local_conf_header:
     TEST_RUNQEMUPARAMS = "slirp"
     TEST_SERVER_IP = "127.0.0.1"
     QEMU_USE_SLIRP = "1"
+  packages: |
+    IMAGE_FEATURES_append = " ssh-server-dropbear"
 
 # Multiple targets are available, put it down to just one
 target:
-- 
2.17.1

