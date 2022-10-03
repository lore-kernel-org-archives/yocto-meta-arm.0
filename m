Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C2BC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.67.1664802088239954531
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3D8A16F8;
	Mon,  3 Oct 2022 06:01:34 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EBE83F73B;
	Mon,  3 Oct 2022 06:01:26 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 12/12] arm/ffa-debugfs: drop use of the kernel module
Date: Mon,  3 Oct 2022 14:00:51 +0100
Message-Id: <20221003130051.28934-13-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3906

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

ffa-debugfs kernel module is replaced with arm-ffa-user module

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../ffa-debugfs/ffa-debugfs-mod_2.1.0.bb      | 41 ----------
 .../files/0001-build-add-Yocto-support.patch  | 79 -------------------
 ...-loading-the-driver-in-a-generic-way.patch | 46 -----------
 3 files changed, 166 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
 delete mode 100644 meta-arm/recipes-kernel/ffa-debugfs/files/0001-build-add-Yocto-support.patch
 delete mode 100644 meta-arm/recipes-kernel/ffa-debugfs/files/0002-script-loading-the-driver-in-a-generic-way.patch

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
deleted file mode 100644
index 2b5dd643..00000000
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "FF-A Debugfs Linux kernel module"
-DESCRIPTION = "This out-of-tree kernel module exposes FF-A operations to user space \
-used for development purposes"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://arm_ffa_user.c;beginline=1;endline=1;md5=fcab174c20ea2e2bc0be64b493708266"
-
-SRC_URI = "git://git.gitlab.arm.com/linux-arm/linux-trusted-services.git;branch=main;protocol=https"
-
-# ffa-debugfs v2.1.0
-SRCREV = "45eb7c1484ae9bea2bbd0583b86beb55b627073b"
-
-S = "${WORKDIR}/git"
-
-inherit module
-
-SRC_URI:append = " \
-    file://0001-build-add-Yocto-support.patch   \
-    file://0002-script-loading-the-driver-in-a-generic-way.patch \
-  "
-
-FILES:${PN} += "${bindir}/load_ffa_debugfs.sh"
-FILES:${PN}-dev += "${includedir}/arm_ffa_user.h"
-
-do_install:append() {
-  install -D -p -m 0755 ${B}/load_ffa_debugfs.sh ${D}/${bindir}/load_ffa_debugfs.sh
-  install -m 0644 ${S}/arm_ffa_user.h ${D}/${includedir}/arm_ffa_user.h
-}
-
-COMPATIBLE_HOST = "(arm|aarch64).*-linux"
-
-# Kernel modules currently RDEPEND on the kernel, which is troublesome when you want to put a
-# kernel module into a initramfs without pulling the kernel into the initramfs, which would be
-# silly.  Until this is a recommends the easiest way to handle this is to remove the dependency
-# in this recipe.
-PACKAGESPLITFUNCS:append = " remove_kernel_dependency"
-python remove_kernel_dependency() {
-  key = "RDEPENDS:kernel-module-arm-ffa-user-" + d.getVar("KERNEL_VERSION")
-  d.delVar(key)
-}
-# Conflicts installing arm_ffa_user.h with arm-ffa-user recipe, lets build only one during world builds
-EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-arm/recipes-kernel/ffa-debugfs/files/0001-build-add-Yocto-support.patch b/meta-arm/recipes-kernel/ffa-debugfs/files/0001-build-add-Yocto-support.patch
deleted file mode 100644
index 5d7e9770..00000000
--- a/meta-arm/recipes-kernel/ffa-debugfs/files/0001-build-add-Yocto-support.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 8a7bea4e7d08395036ffc2fde57c4fb44315e181 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 25 Oct 2021 13:12:11 +0100
-Subject: [PATCH 1/2] build: add Yocto support
-
-This commit allows to build the driver under Yocto
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- Kbuild   |  4 ----
- Makefile | 40 +++++++++++-----------------------------
- 2 files changed, 11 insertions(+), 33 deletions(-)
- delete mode 100644 Kbuild
-
-diff --git a/Kbuild b/Kbuild
-deleted file mode 100644
-index 330b019..0000000
---- a/Kbuild
-+++ /dev/null
-@@ -1,4 +0,0 @@
--# SPDX-License-Identifier: GPL-2.0-only
--
--arm-ffa-user-objs := arm_ffa_user.o
--obj-m := arm-ffa-user.o
-diff --git a/Makefile b/Makefile
-index 62dbfb1..90dfaef 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,33 +1,15 @@
--# SPDX-License-Identifier: GPL-2.0-only
-+arm-ffa-user-objs := arm_ffa_user.o
-+obj-m := arm-ffa-user.o
- 
--ARCH			:= arm64
--CROSS_COMPILE		?= aarch64-linux-gnu-
-+SRC := $(shell pwd)
- 
--ROOT			?= $(CURDIR)/..
--KDIR			?= $(ROOT)/linux
--TARGET_DIR		?= $(ROOT)/shared
--BUILD_DIR		?= $(CURDIR)/build
--BUILD_DIR_MAKEFILE 	?= $(BUILD_DIR)/Makefile
-+all:
-+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
- 
--all: module
-+modules_install:
-+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
- 
--clean: module-clean
--
--install: all
--	cp $(BUILD_DIR)/arm-ffa-user.ko $(TARGET_DIR)/
--	cp load_module.sh $(TARGET_DIR)/
--
--module: $(BUILD_DIR_MAKEFILE)
--	$(MAKE) -C $(KDIR) M=$(BUILD_DIR) src=$(CURDIR) modules \
--		ARCH=$(ARCH) CROSS_COMPILE="$(CROSS_COMPILE)"
--
--module-clean:
--	$(MAKE) -C $(KDIR) M=$(BUILD_DIR) src=$(CURDIR) clean \
--		ARCH=$(ARCH) CROSS_COMPILE="$(CROSS_COMPILE)"
--	rm $(BUILD_DIR_MAKEFILE)
--
--$(BUILD_DIR):
--	mkdir -p "$@"
--
--$(BUILD_DIR_MAKEFILE): $(BUILD_DIR)
--	touch "$@"
-+clean:
-+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
-+	rm -f Module.markers Module.symvers modules.order
-+	rm -rf .tmp_versions Modules.symvers
--- 
-2.17.1
-
diff --git a/meta-arm/recipes-kernel/ffa-debugfs/files/0002-script-loading-the-driver-in-a-generic-way.patch b/meta-arm/recipes-kernel/ffa-debugfs/files/0002-script-loading-the-driver-in-a-generic-way.patch
deleted file mode 100644
index e2469d90..00000000
--- a/meta-arm/recipes-kernel/ffa-debugfs/files/0002-script-loading-the-driver-in-a-generic-way.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From e5d9dfa703a5a57e535b5dab4eda47a9707972d3 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 25 Oct 2021 12:51:37 +0100
-Subject: [PATCH 2/2] script: loading the driver in a generic way
-
-Use the kernel module from the modules path.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- load_module.sh => load_ffa_debugfs.sh | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
- rename load_module.sh => load_ffa_debugfs.sh (50%)
- mode change 100755 => 100644
-
-diff --git a/load_module.sh b/load_ffa_debugfs.sh
-old mode 100755
-new mode 100644
-similarity index 50%
-rename from load_module.sh
-rename to load_ffa_debugfs.sh
-index 2137245..4f31ff3
---- a/load_module.sh
-+++ b/load_ffa_debugfs.sh
-@@ -1,10 +1,14 @@
- #!/bin/sh
-+#
-+# Use:
-+# load_ffa_debugfs.sh <folder containing sp_uuid_list.txt>
-+#
- 
--[ ! -f $(dirname "$0")/sp_uuid_list.txt ] && \
-+[ ! -f "$1"/sp_uuid_list.txt ] && \
- 	{ echo "Error: missing SP UUID list"; exit 1; }
- 
- if ! grep -qs 'arm-ffa-user' /proc/modules; then
--	insmod $(dirname "$0")/arm-ffa-user.ko uuid_str_list=$(cat $(dirname "$0")/sp_uuid_list.txt)
-+	insmod /lib/modules/$(uname -r)/extra/arm-ffa-user.ko uuid_str_list=$(cat "$1"/sp_uuid_list.txt)
- fi
- 
- if ! grep -qs 'debugfs' /proc/mounts; then
--- 
-2.17.1
-
-- 
2.17.1


