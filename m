Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82837C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:34:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.62.1664559291391678327
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 10:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76BA9143D
	for <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 10:34:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7A0B3F792
	for <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 10:34:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: Remove uniquely zephyr machines
Date: Fri, 30 Sep 2022 13:34:46 -0400
Message-Id: <20220930173446.15025-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 17:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3883

Remove microbit-v1, qemu-cortex-a53, qemu-cortex-m3, and qemu-cortex-r5
from CI (and the tree in general).  These machines are part of the
meta-zephyr CI now and keeping them here is redundant.  However, keeping
zephyr builds for machines that also have TF-M.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                | 18 --------------
 ci/microbit-v1.yml                            |  7 ------
 ci/qemu-cortex-a53.yml                        |  9 -------
 ci/qemu-cortex-m3.yml                         | 20 ----------------
 ci/qemu-cortex-r5.yml                         | 11 ---------
 meta-arm-bsp/conf/machine/qemu-cortex-r5.conf | 22 -----------------
 meta-arm/conf/machine/microbit-v1.conf        | 24 -------------------
 meta-arm/conf/machine/qemu-cortex-a53.conf    | 19 ---------------
 8 files changed, 130 deletions(-)
 delete mode 100644 ci/microbit-v1.yml
 delete mode 100644 ci/qemu-cortex-a53.yml
 delete mode 100644 ci/qemu-cortex-m3.yml
 delete mode 100644 ci/qemu-cortex-r5.yml
 delete mode 100644 meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
 delete mode 100644 meta-arm/conf/machine/microbit-v1.conf
 delete mode 100644 meta-arm/conf/machine/qemu-cortex-a53.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1fb21f60..7474e247 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -126,12 +126,6 @@ juno:
       - TOOLCHAINS: [gcc, clang]
         FIRMWARE: [uboot, edk2]
 
-microbit-v1:
-  extends: .build
-  parallel:
-    matrix:
-      - TESTING: testimage-zephyr
-
 musca-b1:
   extends: .build
 
@@ -144,18 +138,6 @@ n1sdp:
     matrix:
       - TOOLCHAINS: [gcc, armgcc]
 
-qemu-cortex-a53:
-  extends: .build
-
-qemu-cortex-m3:
-  extends: .build
-  parallel:
-    matrix:
-      - TESTING: testimage-zephyr
-
-qemu-cortex-r5:
-  extends: .build
-
 qemu-generic-arm64:
   extends: .build
   parallel:
diff --git a/ci/microbit-v1.yml b/ci/microbit-v1.yml
deleted file mode 100644
index b8501486..00000000
--- a/ci/microbit-v1.yml
+++ /dev/null
@@ -1,7 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-    - ci/meta-zephyr.yml
-
-machine: microbit-v1
diff --git a/ci/qemu-cortex-a53.yml b/ci/qemu-cortex-a53.yml
deleted file mode 100644
index 3eec5801..00000000
--- a/ci/qemu-cortex-a53.yml
+++ /dev/null
@@ -1,9 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-    - ci/meta-zephyr.yml
-
-# FIXME - testimage fails all tests currently, but all the tests build
-
-machine: qemu-cortex-a53
diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
deleted file mode 100644
index f45cb9e1..00000000
--- a/ci/qemu-cortex-m3.yml
+++ /dev/null
@@ -1,20 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-    - ci/meta-zephyr.yml
-
-repos:
-  meta-zephyr:
-    layers:
-      meta-zephyr-bsp:
-
-local_conf_header:
-  tclibc: |
-    TCLIBC = "newlib"
-  nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "common context pending poll sleep"
-  qemu_opts: |
-    QB_OPT_APPEND = "-icount shift=3,align=off,sleep=on -rtc clock=vm"
-
-machine: qemu-cortex-m3
diff --git a/ci/qemu-cortex-r5.yml b/ci/qemu-cortex-r5.yml
deleted file mode 100644
index cfcb7b93..00000000
--- a/ci/qemu-cortex-r5.yml
+++ /dev/null
@@ -1,11 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-    - ci/meta-zephyr.yml
-
-local_conf_header:
-  nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "common poll sleep queue device"
-
-machine: qemu-cortex-r5
diff --git a/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf b/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
deleted file mode 100644
index 5a0ea69b..00000000
--- a/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
+++ /dev/null
@@ -1,22 +0,0 @@
-#@TYPE: Machine
-#@NAME: qemu_cortex_r5
-#@DESCRIPTION: Machine for Zephyr BOARD qemu_cortex_r5
-
-require conf/machine/include/qemu.inc
-require conf/machine/include/arm/armv7r/tune-cortexr5.inc
-
-# GLIBC will not work with Cortex-R.
-TCLIBC = "newlib"
-
-# For runqemu
-QB_SYSTEM_NAME = "qemu-system-aarch64"
-QB_MACHINE = "-machine xlnx-zcu102"
-QB_CPU = "-cpu cortex-r5"
-QB_MEM = "-m 64k"
-QB_GRAPHICS = "-nographic -vga none"
-QB_RNG = ""
-
-# Zephyr RTOS settings
-ZEPHYR_BOARD = "qemu_cortex_r5"
-ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH:qemu-cortex-r5 = "arm"
diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
deleted file mode 100644
index ef3872fe..00000000
--- a/meta-arm/conf/machine/microbit-v1.conf
+++ /dev/null
@@ -1,24 +0,0 @@
-#@TYPE: Machine
-#@NAME: microbit_v1
-#@DESCRIPTION: Machine for BBC Microbit v1, Zephyr BOARD qemu_cortex_m0
-
-require conf/machine/include/qemu.inc
-require conf/machine/include/arm/armv6m/tune-cortexm0.inc
-
-MACHINEOVERRIDES =. "nordic:"
-
-# GLIBC will not work with Cortex-M.
-TCLIBC = "newlib"
-
-# For runqemu
-QB_SYSTEM_NAME = "qemu-system-arm"
-QB_MACHINE = "-machine microbit"
-QB_CPU = "-cpu cortex-m0"
-QB_GRAPHICS = "-nographic -vga none"
-QB_RNG = ""
-QB_OPT_APPEND = "-icount shift=6,align=off,sleep=on -rtc clock=vm"
-
-# Zephyr RTOS settings
-ZEPHYR_BOARD = "qemu_cortex_m0"
-ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH:qemu-cortex-m0 = "arm"
diff --git a/meta-arm/conf/machine/qemu-cortex-a53.conf b/meta-arm/conf/machine/qemu-cortex-a53.conf
deleted file mode 100644
index 7147face..00000000
--- a/meta-arm/conf/machine/qemu-cortex-a53.conf
+++ /dev/null
@@ -1,19 +0,0 @@
-#@TYPE: Machine
-#@NAME: qemu-cortex-a53
-#@DESCRIPTION: Machine for Zephyr BOARD qemu_cortex_a53
-
-require conf/machine/include/qemu.inc
-require conf/machine/include/arm/armv8a/tune-cortexa53.inc
-
-TCLIBC = "newlib"
-
-# For runqemu
-QB_SYSTEM_NAME = "qemu-system-aarch64"
-QB_MACHINE = "-machine virt"
-QB_CPU = "-cpu cortex-a53"
-QB_GRAPHICS = "-nographic -vga none"
-
-# Zephyr RTOS settings
-ZEPHYR_BOARD = "qemu_cortex_a53"
-ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH:qemu-cortex-a53 = "aarch64"
-- 
2.17.1


