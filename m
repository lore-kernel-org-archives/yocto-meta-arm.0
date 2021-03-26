Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14188.1616771710666645421
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 08:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 174D51474
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 08:15:09 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B97A53F792
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 08:15:08 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/machine: add zephyr machine confs for a53
Date: Thu, 25 Mar 2021 22:54:12 -0400
Message-Id: <20210326025412.10445-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Zephyr supports QEMU based machine for Cortex a53.  Add machine confs
for this.  This enables us to verify a53 tunings.

Change-Id: I398bc5b3e8bd77b7269bba056a0f75229f04c7a7
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                             |  3 +++
 kas/qemu-cortex-a53.yml                    | 10 ++++++++++
 meta-arm/conf/machine/qemu-cortex-a53.conf | 19 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 kas/qemu-cortex-a53.yml
 create mode 100644 meta-arm/conf/machine/qemu-cortex-a53.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 665566a..5dea6ac 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -100,6 +100,9 @@ n1sdp:
 n1sdp/armgcc:
   extends: .build
 
+qemu-cortex-a53:
+  extends: .build
+
 qemuarm:
   extends: .build
 
diff --git a/kas/qemu-cortex-a53.yml b/kas/qemu-cortex-a53.yml
new file mode 100644
index 0000000..296d8d5
--- /dev/null
+++ b/kas/qemu-cortex-a53.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-zephyr.yml
+
+machine: qemu-cortex-a53
+
+target:
+  - zephyr-philosophers
diff --git a/meta-arm/conf/machine/qemu-cortex-a53.conf b/meta-arm/conf/machine/qemu-cortex-a53.conf
new file mode 100644
index 0000000..228002c
--- /dev/null
+++ b/meta-arm/conf/machine/qemu-cortex-a53.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@NAME: qemu-cortex-a53
+#@DESCRIPTION: Machine for Zephyr BOARD qemu_cortex_a53
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-cortexa53.inc
+
+TCLIBC = "newlib"
+
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-aarch64"
+QB_MACHINE = "-machine virt"
+QB_CPU = "-cpu cortex-a53"
+QB_OPT_APPEND = "-nographic -vga none"
+
+# Zephyr RTOS settings
+ZEPHYR_BOARD = "qemu_cortex_a53"
+ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
+ARCH_qemu-cortex-a53 = "aarch64"
-- 
2.17.1

