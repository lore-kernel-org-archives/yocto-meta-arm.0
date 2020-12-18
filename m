Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1864.1608319936028150428
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 11:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 056011FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 11:32:15 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6F3E3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 11:32:14 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [dunfell PATCH] arm-bsp/u-boot: fix a5ds compile warning
Date: Fri, 18 Dec 2020 14:32:08 -0500
Message-Id: <20201218193208.14491-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

a5ds has the following warning:

WARNING: Fuzz detected:

checking file arch/arm/Kconfig
Hunk #1 succeeded at 628 with fuzz 2.
checking file board/armltd/designstart/Kconfig
checking file board/armltd/designstart/Makefile
checking file board/armltd/designstart/designstart.c
checking file configs/designstart_ca5_defconfig
checking file include/configs/designstart_ca5.h

patching file arch/arm/Kconfig
Hunk #1 succeeded at 628 with fuzz 2.
patching file board/armltd/designstart/Kconfig
patching file board/armltd/designstart/Makefile
patching file board/armltd/designstart/designstart.c
patching file configs/designstart_ca5_defconfig
patching file include/configs/designstart_ca5.h

The context lines in the patches can be updated with devtool:

    devtool modify u-boot
    devtool finish --force-patch-refresh u-boot <layer_path>

Don't forget to review changes done by devtool!

WARNING: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Followed above instructions to refresh the patches.  Warning goes away.
Everyone is happy.

Change-Id: I47da5f987f9a7ebfe5ca570ad1053e55cc1a509a
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../a5ds/0001-armv7-add-mmio-timer.patch      | 14 ++++------
 ...-arm-add-designstart-cortex-a5-board.patch | 28 +++++++++----------
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
index fbf8a14..976c9cd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
@@ -1,12 +1,13 @@
-From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 2001
+From 42fd533d68fd70e23a1150715da3dea7ce87b51f Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH 1/2] armv7: add mmio timer
+Subject: [PATCH] armv7: add mmio timer
 
 This timer can be used by u-boot when arch-timer is not available in
 core, for example, Cortex-A5.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  arch/arm/cpu/armv7/Makefile     |  1 +
  arch/arm/cpu/armv7/mmio_timer.c | 56 +++++++++++++++++++++++++++++++++
@@ -18,17 +19,17 @@ diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
 index 8c955d0d5284..82af9c031277 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
-@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
+@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
  obj-$(CONFIG_IPROC) += iproc-common/
  obj-$(CONFIG_KONA) += kona-common/
  obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
 +obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
-
+ 
  ifneq (,$(filter s5pc1xx exynos,$(SOC)))
  obj-y += s5p-common/
 diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
 new file mode 100644
-index 000000000000..1b905db8bb19
+index 000000000000..5d6f66172398
 --- /dev/null
 +++ b/arch/arm/cpu/armv7/mmio_timer.c
 @@ -0,0 +1,56 @@
@@ -100,6 +101,3 @@ index cf1808e051c8..8624714ae7a6 100644
  CONFIG_SYS_MONITOR_
  CONFIG_SYS_MONITOR_BASE
  CONFIG_SYS_MONITOR_BASE_EARLY
---
-2.25.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
index 3c527ae..985712b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
@@ -1,12 +1,13 @@
-From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 2001
+From 9bd7c18ca08257826557ce177457bb5a89780e64 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
-Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
+Subject: [PATCH] board: arm: add designstart cortex-a5 board
 
 Arm added a new board, designstart, with a cortex-a5 chip, add the
 default configuration, initialization and makefile for this system.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  arch/arm/Kconfig                       |   7 ++
  board/armltd/designstart/Kconfig       |  12 +++
@@ -22,13 +23,13 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/designstart_ca5.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index f9dab073ea14..2cc9413114de 100644
+index 36c9c2fecd01..4fe0796fd1f1 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
 @@ -628,6 +628,12 @@ config ARCH_BCM6858
-       select OF_CONTROL
-       imply CMD_DM
-
+ 	select OF_CONTROL
+ 	imply CMD_DM
+ 
 +config TARGET_DESIGNSTART_CA5
 +      bool "Support Designstart Cortex-A5"
 +      select CPU_V7A
@@ -36,8 +37,8 @@ index f9dab073ea14..2cc9413114de 100644
 +      select PL01X_SERIAL
 +
  config TARGET_VEXPRESS_CA15_TC2
-       bool "Support vexpress_ca15_tc2"
-       select CPU_V7A
+ 	bool "Support vexpress_ca15_tc2"
+ 	select CPU_V7A
 @@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
  source "board/armadeus/apf27/Kconfig"
  source "board/armltd/vexpress/Kconfig"
@@ -48,7 +49,7 @@ index f9dab073ea14..2cc9413114de 100644
  source "board/broadcom/bcm963158/Kconfig"
 diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
 new file mode 100644
-index 000000000000..6446fe3f4492
+index 000000000000..a9564e8655e2
 --- /dev/null
 +++ b/board/armltd/designstart/Kconfig
 @@ -0,0 +1,12 @@
@@ -66,7 +67,7 @@ index 000000000000..6446fe3f4492
 +endif
 diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/Makefile
 new file mode 100644
-index 000000000000..b64c905c7021
+index 000000000000..d2dc2b74ed85
 --- /dev/null
 +++ b/board/armltd/designstart/Makefile
 @@ -0,0 +1,8 @@
@@ -80,7 +81,7 @@ index 000000000000..b64c905c7021
 +obj-y := designstart.o
 diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designstart/designstart.c
 new file mode 100644
-index 000000000000..b0400f110ce2
+index 000000000000..658057a00330
 --- /dev/null
 +++ b/board/armltd/designstart/designstart.c
 @@ -0,0 +1,49 @@
@@ -178,7 +179,7 @@ index 000000000000..a2a756740295
 +
 diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
 new file mode 100644
-index 000000000000..79c4b36060d2
+index 000000000000..6db5b1cf4ac2
 --- /dev/null
 +++ b/include/configs/designstart_ca5.h
 @@ -0,0 +1,122 @@
@@ -304,6 +305,3 @@ index 000000000000..79c4b36060d2
 +#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
 +#define CONFIG_ENV_IS_IN_FLASH                1
 +#endif
---
-2.25.0
-
-- 
2.17.1

