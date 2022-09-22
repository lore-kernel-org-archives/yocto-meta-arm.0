Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C39EC54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 15:00:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.50.1663858808247825203
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 08:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34A3316F8;
	Thu, 22 Sep 2022 08:00:14 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6D553F73D;
	Thu, 22 Sep 2022 08:00:06 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000
Date: Thu, 22 Sep 2022 15:59:56 +0100
Message-Id: <20220922145956.56063-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220922145956.56063-1-emekcan.aras@arm.com>
References: <20220922145956.56063-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 15:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3813

From: Emekcan <emekcan.aras@arm.com>

Adds out-of-tree rpmsg_arm_mailbox driver patches into linux
kernel to communicate with external system using MHUs in
corstone1000 platform. The host can communicate with external
system using the driver under /dev/rpmsg0_ctrl0.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...03-Add-rpsmg-driver-for-corstone1000.patch | 222 ++++++++++++++++++
 .../linux/files/corstone1000/defconfig        |   7 +-
 .../linux/linux-arm-platforms.inc             |   1 +
 3 files changed, 229 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch
new file mode 100644
index 00000000..d88acfc0
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch
@@ -0,0 +1,222 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+From e683c37ee51717e625c8a598056cf4bb1bdadcbc Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Wed, 17 Aug 2022 14:21:42 +0100
+Subject: [PATCH] Add rpsmg driver for corstone1000
+
+Adds rpsmg driver to communicate with external
+system in corstone1000 platform.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ drivers/rpmsg/Kconfig             |  10 ++
+ drivers/rpmsg/Makefile            |   1 +
+ drivers/rpmsg/rpmsg_arm_mailbox.c | 164 ++++++++++++++++++++++
+ 3 files changed, 175 insertions(+)
+ create mode 100644 drivers/rpmsg/rpmsg_arm_mailbox.c
+
+diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
+index 0b4407abdf13..c276bd17bffe 100644
+--- a/drivers/rpmsg/Kconfig
++++ b/drivers/rpmsg/Kconfig
+@@ -73,4 +73,14 @@ config RPMSG_VIRTIO
+ 	select RPMSG_NS
+ 	select VIRTIO
+ 
++config RPMSG_ARM
++	tristate "ARM RPMSG driver"
++	select     RPMSG
++	depends on HAS_IOMEM
++	depends on MAILBOX
++	help
++	  Say y here to enable support for rpmsg lient driver which is built
++	  around mailbox client using Arm MHUv2.1 as physical medium.This
++	  driver enables communication which remote processor using MHU.
++
+ endmenu
+diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
+index 8d452656f0ee..34e9c146cd64 100644
+--- a/drivers/rpmsg/Makefile
++++ b/drivers/rpmsg/Makefile
+@@ -1,5 +1,6 @@
+ # SPDX-License-Identifier: GPL-2.0
+ obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
++obj-$(CONFIG_RPMSG_ARM)		+= rpmsg_arm_mailbox.o
+ obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
+ obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
+ obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
+diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm_mailbox.c
+new file mode 100644
+index 000000000000..4a80102669f6
+--- /dev/null
++++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
+@@ -0,0 +1,164 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * rpmsg client driver using mailbox client interface
++ *
++ * Copyright (C) 2019 ARM Ltd.
++ *
++ */
++
++#include <linux/bitmap.h>
++#include <linux/export.h>
++#include <linux/io.h>
++#include <linux/kernel.h>
++#include <linux/ktime.h>
++#include <linux/mailbox_client.h>
++#include <linux/module.h>
++#include <linux/of_address.h>
++#include <linux/of_device.h>
++#include <linux/processor.h>
++#include <linux/semaphore.h>
++#include <linux/slab.h>
++#include <linux/rpmsg.h>
++#include "rpmsg_internal.h"
++#include <linux/mailbox/arm_mhuv2_message.h>
++
++#define RPMSG_NAME	"arm_rpmsg"
++#define RPMSG_ADDR_ANY	0xFFFFFFFF
++
++struct arm_channel {
++	struct rpmsg_endpoint ept;
++	struct mbox_client cl;
++	struct mbox_chan *mbox;
++};
++
++#define arm_channel_from_rpmsg(_ept) container_of(_ept, struct arm_channel, ept)
++#define arm_channel_from_mbox(_ept) container_of(_ept, struct arm_channel, cl)
++
++
++static void arm_msg_rx_handler(struct mbox_client *cl, void *mssg)
++{
++	struct arm_mhuv2_mbox_msg *msg = mssg;
++	struct arm_channel* channel = arm_channel_from_mbox(cl);
++	int err = channel->ept.cb(channel->ept.rpdev, msg->data, 4, channel->ept.priv, RPMSG_ADDR_ANY);
++	if(err) {
++		printk("ARM Mailbox: Endpoint callback failed with error: %d", err);
++	}
++}
++
++
++static void arm_destroy_ept(struct rpmsg_endpoint *ept)
++{
++	struct arm_channel *channel = arm_channel_from_rpmsg(ept);
++	mbox_free_channel(channel->mbox);
++	kfree(channel);
++}
++
++static int arm_send(struct rpmsg_endpoint *ept, void *data, int len)
++{
++	struct arm_channel *channel = arm_channel_from_rpmsg(ept);
++
++	mbox_send_message(channel->mbox, data);
++	return 0;
++}
++
++static int arm_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dest)
++{
++	struct arm_mhuv2_mbox_msg msg;
++	struct arm_channel *channel = arm_channel_from_rpmsg(ept);
++	msg.data = data;
++	msg.len = len;
++	mbox_send_message(channel->mbox, &msg);
++	return 0;
++}
++
++
++static const struct rpmsg_endpoint_ops arm_endpoint_ops = {
++	.destroy_ept = arm_destroy_ept,
++	.send = arm_send,
++	.sendto = arm_sendto,
++};
++
++
++static struct rpmsg_endpoint *arm_create_ept(struct rpmsg_device *rpdev,
++		rpmsg_rx_cb_t cb, void *priv, struct rpmsg_channel_info chinfo)
++{
++	struct arm_channel *channel;
++
++	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
++
++	// Initialize rpmsg endpoint
++	kref_init(&channel->ept.refcount);
++	channel->ept.rpdev = rpdev;
++	channel->ept.cb = cb;
++	channel->ept.priv = priv;
++	channel->ept.ops = &arm_endpoint_ops;
++
++	// Initialize mailbox client
++	channel->cl.dev = rpdev->dev.parent;
++	channel->cl.rx_callback = arm_msg_rx_handler;
++	channel->cl.tx_done = NULL; /* operate in blocking mode */
++	channel->cl.tx_block = true;
++	channel->cl.tx_tout = 500; /* by half a second */
++	channel->cl.knows_txdone = false; /* depending upon protocol */
++
++	channel->mbox = mbox_request_channel_byname(&channel->cl, chinfo.name);
++	if (IS_ERR_OR_NULL(channel->mbox)) {
++		printk("RPMsg ARM: Cannot get channel by name: '%s'\n", chinfo.name);
++		return -1;
++	}
++
++	return &channel->ept;
++}
++
++static const struct rpmsg_device_ops arm_device_ops = {
++	.create_ept = arm_create_ept,
++};
++
++
++static void arm_release_device(struct device *dev)
++{
++	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
++
++	kfree(rpdev);
++}
++
++
++static int client_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct rpmsg_device *rpdev;
++
++	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
++	if (!rpdev)
++		return -ENOMEM;
++
++	/* Assign callbacks for rpmsg_device */
++	rpdev->ops = &arm_device_ops;
++
++	/* Assign public information to the rpmsg_device */
++	memcpy(rpdev->id.name, RPMSG_NAME, strlen(RPMSG_NAME));
++
++	rpdev->dev.parent = dev;
++	rpdev->dev.release = arm_release_device;
++
++	return rpmsg_chrdev_register_device(rpdev);
++}
++
++static const struct of_device_id client_of_match[] = {
++	{ .compatible = "arm,client", .data = NULL },
++	{ /* Sentinel */ },
++};
++
++static struct platform_driver client_driver = {
++	.driver = {
++		.name = "arm-mhu-client",
++		.of_match_table = client_of_match,
++	},
++	.probe = client_probe,
++};
++
++module_platform_driver(client_driver);
++
++MODULE_LICENSE("GPL v2");
++MODULE_DESCRIPTION("ARM RPMSG Driver");
++MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index 095cc257..0cdd3fa4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -92,4 +92,9 @@ CONFIG_LIBCRC32C=y
 CONFIG_DEBUG_FS=y
 CONFIG_PANIC_TIMEOUT=5
 CONFIG_STACKTRACE=y
-CONFIG_EXTSYS_CTRL=y
\ No newline at end of file
+CONFIG_EXTSYS_CTRL=y
+CONFIG_MAILBOX=y
+CONFIG_ARM_MHU_V2=y
+CONFIG_RPMSG=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_ARM=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index c44d5883..4a6cc438 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -42,6 +42,7 @@ SRC_URI:append:corstone1000 = " \
            file://defconfig  \
            file://0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch  \
            file://0002-Add-external-system-driver.patch \
+           file://0003-Add-rpsmg-driver-for-corstone1000.patch \
         "
 
 SRC_URI:append:corstone1000 = " ${@bb.utils.contains('MACHINE_FEATURES', \
-- 
2.17.1


