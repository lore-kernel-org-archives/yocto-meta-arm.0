Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11545.1612987632875117184
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Feb 2021 12:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A7CC12FC
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 12:07:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AB0A3F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 12:07:11 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] kas: microbit-v1 testing
Date: Wed, 10 Feb 2021 15:07:05 -0500
Message-Id: <20210210200705.27717-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210200705.27717-1-jon.mason@arm.com>
References: <20210210200705.27717-1-jon.mason@arm.com>

Change-Id: I8043c7be32a1e4029e73c3c9f603ae77c78ddf3c
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml      |  3 +++
 kas/microbit-v1.yml | 10 ++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 kas/microbit-v1.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ae888d8..d7a51fd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -79,6 +79,9 @@ juno:
 juno/clang:
   extends: .build
 
+microbit-v1:
+  extends: .build
+
 musca-b1:
   extends: .build
 
diff --git a/kas/microbit-v1.yml b/kas/microbit-v1.yml
new file mode 100644
index 0000000..d5e7453
--- /dev/null
+++ b/kas/microbit-v1.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-zephyr.yml
+
+machine: microbit-v1
+
+target:
+  - zephyr-philosophers
-- 
2.17.1

