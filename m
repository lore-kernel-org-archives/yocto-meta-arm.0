Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10076.1610463069410550975
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 06:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF8B011B3
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 06:50:58 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 795003F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 06:50:58 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/machine: add zephyr machine conf for microbit
Date: Tue, 12 Jan 2021 09:50:53 -0500
Message-Id: <20210112145053.28674-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Zephyr supports QEMU based machine for Cortex M0 (qemu-cortex-m0).  This
is actually using the BBC Microbit v1 machine in QEMU.  Use this more
accurate name for the machine conf.  This enables us to verify m0
tunings.

NOTE: qemu-cortex-m0's zephyr config has SRAM too small to run
zephyr-kernel-test-all, but can run zephyr-philosophers and
zephyr-kernel-test-sleep (and possibly others).

Change-Id: Ia997a162c10cf1a6b8fea244cb1960f4d4c66adc
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/microbit-v1.conf | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arm/conf/machine/microbit-v1.conf

diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
new file mode 100644
index 0000000..c4cc4d5
--- /dev/null
+++ b/meta-arm/conf/machine/microbit-v1.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: microbit_v1
+#@DESCRIPTION: Machine for BBC Microbit v1, Zephyr BOARD qemu_cortex_m0
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-cortex-m0.inc
+
+MACHINEOVERRIDES =. "nordic:"
+
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-arm"
+QB_MACHINE = "-machine microbit"
+QB_CPU = "-cpu cortex-m0"
+QB_OPT_APPEND = "-nographic -vga none"
+QB_RNG = ""
+
+# Zephyr RTOS settings
+ZEPHYR_BOARD = "qemu_cortex_m0"
+ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
+ARCH_qemu-cortex-m0 = "arm"
-- 
2.17.1

