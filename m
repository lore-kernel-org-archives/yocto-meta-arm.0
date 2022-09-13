Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C541EC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:57:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4236.1663073844988352344
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 05:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06A451063;
	Tue, 13 Sep 2022 05:57:31 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED46E3F73D;
	Tue, 13 Sep 2022 05:57:23 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/kernel: Add external device driver
Date: Tue, 13 Sep 2022 13:57:11 +0100
Message-Id: <20220913125711.26811-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913125711.26811-1-emekcan.aras@arm.com>
References: <20220913125711.26811-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Sep 2022 12:57:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3774

From: Emekcan <emekcan.aras@arm.com>

Adds external system device driver into linux.
User applications can control the external system
using the driver under /dev/extsys_ctrl in
corstone1000 platform.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../0002-Add-external-system-driver.patch     | 223 ++++++++++++++++++
 .../linux/files/corstone1000/defconfig        |   1 +
 .../linux/linux-arm-platforms.inc             |   1 +
 3 files changed, 225 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-external-system-driver.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-external-system-driver.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-external-system-driver.patch
new file mode 100644
index 00000000..ae69090a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-external-system-driver.patch
@@ -0,0 +1,223 @@
+Upstream-Status: Pending[Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+From 97509e82b51c57935fc8e918b33c09c4f6648ed7 Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Fri, 19 Aug 2022 14:51:08 +0100
+Subject: [PATCH] Add external system driver
+
+Adds external system driver to control it
+from user-space. It provides run and reset
+functionality at the moment.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ drivers/misc/Kconfig           |   2 +
+ drivers/misc/Makefile          |   1 +
+ drivers/misc/arm/Kconfig       |   5 ++
+ drivers/misc/arm/Makefile      |   1 +
+ drivers/misc/arm/extsys_ctrl.c | 151 +++++++++++++++++++++++++++++++++
+ 5 files changed, 160 insertions(+)
+ create mode 100644 drivers/misc/arm/Kconfig
+ create mode 100644 drivers/misc/arm/Makefile
+ create mode 100644 drivers/misc/arm/extsys_ctrl.c
+
+diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
+index 0f5a49fc7c9e..5ca195110b3f 100644
+--- a/drivers/misc/Kconfig
++++ b/drivers/misc/Kconfig
+@@ -487,4 +487,6 @@ source "drivers/misc/cardreader/Kconfig"
+ source "drivers/misc/habanalabs/Kconfig"
+ source "drivers/misc/uacce/Kconfig"
+ source "drivers/misc/pvpanic/Kconfig"
++source "drivers/misc/arm/Kconfig"
++
+ endmenu
+diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
+index a086197af544..f5c1bd5747f7 100644
+--- a/drivers/misc/Makefile
++++ b/drivers/misc/Makefile
+@@ -59,3 +59,4 @@ obj-$(CONFIG_UACCE)		+= uacce/
+ obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
+ obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
+ obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
++obj-y				+= arm/
+diff --git a/drivers/misc/arm/Kconfig b/drivers/misc/arm/Kconfig
+new file mode 100644
+index 000000000000..3c4b3f08e6b4
+--- /dev/null
++++ b/drivers/misc/arm/Kconfig
+@@ -0,0 +1,5 @@
++config EXTSYS_CTRL
++	tristate "Arm External System control driver"
++	help
++	  Say y here to enable support for external system control
++	  driver for the Arm Corstone-700 and Corstone1000 platform
+\ No newline at end of file
+diff --git a/drivers/misc/arm/Makefile b/drivers/misc/arm/Makefile
+new file mode 100644
+index 000000000000..1ca3084cf8a0
+--- /dev/null
++++ b/drivers/misc/arm/Makefile
+@@ -0,0 +1 @@
++obj-$(CONFIG_EXTSYS_CTRL)	+= extsys_ctrl.o
+diff --git a/drivers/misc/arm/extsys_ctrl.c b/drivers/misc/arm/extsys_ctrl.c
+new file mode 100644
+index 000000000000..1c6ef14a32ae
+--- /dev/null
++++ b/drivers/misc/arm/extsys_ctrl.c
+@@ -0,0 +1,151 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Arm Corstone700 and Corstone1000 external system reset control driver
++ *
++ * Copyright (C) 2019 Arm Ltd.
++ *
++ */
++
++#include <linux/fs.h>
++#include <linux/clk.h>
++#include <linux/err.h>
++#include <linux/interrupt.h>
++#include <linux/io.h>
++#include <linux/kernel.h>
++#include <linux/mod_devicetable.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/miscdevice.h>
++#include <linux/init.h>
++
++#define EXTSYS_DRV_NAME		"extsys_ctrl"
++#define EXTSYS_MAX_DEVS		 4
++
++#define EXTSYS_RST_SIZE		U(0x8)
++#define EXTSYS_RST_CTRL_OFF	U(0x0)
++#define EXTSYS_RST_ST_OFF	U(0x4)
++
++/* External system reset control indexes */
++#define EXTSYS_CPU_WAIT		(0x0)
++#define EXTSYS_RST_REQ		(0x1)
++
++/* External system reset status masks */
++#define EXTSYS_RST_ST_ACK_OFF	U(0x1)
++
++/* No Reset Requested */
++#define EXTSYS_RST_ST_ACK_NRR	(0x0 << EXTSYS_RST_ST_ACK_OFF)
++
++/* Reset Request Complete */
++#define EXTSYS_RST_ST_ACK_RRC	(0x2 << EXTSYS_RST_ST_ACK_OFF)
++
++/* Reset Request Unable to Complete */
++#define EXTSYS_RST_ST_ACK_RRUC	(0x3 << EXTSYS_RST_ST_ACK_OFF)
++
++/* IOCTL commands */
++#define EXTSYS_CPU_WAIT_DISABLE	0x0
++#define EXTSYS_RESET_REQ_ENABLE	0x1
++
++struct extsys_ctrl {
++	struct miscdevice miscdev;
++	void __iomem *reset_reg;
++	void __iomem *set_reg;
++};
++
++#define CLEAR_BIT(addr, index) writel(readl(addr) & ~(1UL << index), addr)
++#define SET_BIT(addr, index) writel(readl(addr) | (1UL << index), addr)
++
++static long extsys_ctrl_ioctl(struct file *f, unsigned int cmd,
++			      unsigned long arg)
++{
++	struct extsys_ctrl *extsys;
++
++	extsys = container_of(f->private_data, struct extsys_ctrl, miscdev);
++
++	switch (cmd) {
++	case EXTSYS_CPU_WAIT_DISABLE:
++		CLEAR_BIT(extsys->reset_reg, EXTSYS_CPU_WAIT);
++		break;
++	case EXTSYS_RESET_REQ_ENABLE:
++		SET_BIT(extsys->reset_reg, EXTSYS_RST_REQ);
++		break;
++	default:
++		break;
++	}
++
++	return 0;
++}
++
++static const struct file_operations extsys_ctrl_fops = {
++	.owner = THIS_MODULE,
++	.unlocked_ioctl = extsys_ctrl_ioctl,
++};
++
++static int extsys_ctrl_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct extsys_ctrl *extsys;
++	struct resource *res;
++	void __iomem *reset_reg;
++	void __iomem *set_reg;
++	int ret;
++
++	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rstreg");
++	reset_reg = devm_ioremap_resource(dev, res);
++	if (IS_ERR(reset_reg))
++		return PTR_ERR(reset_reg);
++
++	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "streg");
++	set_reg = devm_ioremap_resource(dev, res);
++	if (IS_ERR(set_reg))
++		return PTR_ERR(set_reg);
++
++	extsys = devm_kzalloc(dev, sizeof(*extsys), GFP_KERNEL);
++	if (!extsys)
++		return -ENOMEM;
++
++	extsys->reset_reg = reset_reg;
++	extsys->set_reg = set_reg;
++
++	extsys->miscdev.minor = MISC_DYNAMIC_MINOR;
++	extsys->miscdev.name = EXTSYS_DRV_NAME;
++	extsys->miscdev.fops = &extsys_ctrl_fops;
++	extsys->miscdev.parent = dev;
++
++	ret = misc_register(&extsys->miscdev);
++	if (ret)
++		return ret;
++
++	dev_info(dev, "external system controller ready\n");
++
++	return 0;
++}
++
++static int extsys_ctrl_remove(struct platform_device *pdev)
++{
++	struct extsys_ctrl *extsys = dev_get_drvdata(&pdev->dev);
++
++	misc_deregister(&extsys->miscdev);
++
++	return 0;
++}
++
++static const struct of_device_id extsys_ctrl_match[] = {
++	{ .compatible = "arm,extsys_ctrl" },
++	{ },
++};
++MODULE_DEVICE_TABLE(of, extsys_ctrl_match);
++
++static struct platform_driver extsys_ctrl_driver = {
++	.driver = {
++		.name = EXTSYS_DRV_NAME,
++		.of_match_table = extsys_ctrl_match,
++	},
++	.probe = extsys_ctrl_probe,
++	.remove = extsys_ctrl_remove,
++};
++module_platform_driver(extsys_ctrl_driver);
++
++MODULE_LICENSE("GPL v2");
++MODULE_DESCRIPTION("Arm External System Control Driver");
++MODULE_AUTHOR("Morten Borup Petersen");
++MODULE_AUTHOR("Rui Miguel Silva <rui.silva@arm.com>");
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index 5f0a7e91..095cc257 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -92,3 +92,4 @@ CONFIG_LIBCRC32C=y
 CONFIG_DEBUG_FS=y
 CONFIG_PANIC_TIMEOUT=5
 CONFIG_STACKTRACE=y
+CONFIG_EXTSYS_CTRL=y
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 7bb4a925..c44d5883 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -41,6 +41,7 @@ KERNEL_EXTRA_ARGS:corstone1000 += "CONFIG_INITRAMFS_COMPRESSION_NONE=y"
 SRC_URI:append:corstone1000 = " \
            file://defconfig  \
            file://0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch  \
+           file://0002-Add-external-system-driver.patch \
         "
 
 SRC_URI:append:corstone1000 = " ${@bb.utils.contains('MACHINE_FEATURES', \
-- 
2.17.1


