Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43629.1629227317968704791
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 12:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F3271063
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Aug 2021 12:08:27 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71DE13F40C
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Aug 2021 12:08:27 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] qemu-cortex-r5: add support
Date: Mon, 16 Aug 2021 17:39:13 -0400
Message-Id: <20210816213913.8016-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210816213913.8016-1-jon.mason@arm.com>
References: <20210816213913.8016-1-jon.mason@arm.com>

Mostly for testing out cortex-r tunes...mostly

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  3 +++
 ci/qemu-cortex-r5.yml                         | 10 +++++++++
 meta-arm-bsp/conf/machine/qemu-cortex-r5.conf | 22 +++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 ci/qemu-cortex-r5.yml
 create mode 100644 meta-arm-bsp/conf/machine/qemu-cortex-r5.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c2a56b5..697603b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -153,6 +153,9 @@ n1sdp/armgcc:
 qemu-cortex-a53:
   extends: .build
 
+qemu-cortex-r5:
+  extends: .build
+
 qemuarm64-sbsa:
   extends: .build
 
diff --git a/ci/qemu-cortex-r5.yml b/ci/qemu-cortex-r5.yml
new file mode 100644
index 0000000..1c4e013
--- /dev/null
+++ b/ci/qemu-cortex-r5.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-zephyr.yml
+
+machine: qemu-cortex-r5
+
+target:
+  - zephyr-philosophers
diff --git a/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf b/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
new file mode 100644
index 0000000..29b37d7
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: qemu_cortex_r5
+#@DESCRIPTION: Machine for Zephyr BOARD qemu_cortex_r5
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/arm/armv7r/tune-cortexr5.inc
+
+# GLIBC will not work with Cortex-R.
+TCLIBC = "newlib"
+
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-aarch64"
+QB_MACHINE = "-machine xlnx-zcu102"
+QB_CPU = "-cpu cortex-r5"
+QB_MEM = "-m 64k"
+QB_OPT_APPEND = "-nographic -vga none"
+QB_RNG = ""
+
+# Zephyr RTOS settings
+ZEPHYR_BOARD = "qemu_cortex_r5"
+ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
+ARCH:qemu-cortex-r5 = "arm"
-- 
2.17.1

