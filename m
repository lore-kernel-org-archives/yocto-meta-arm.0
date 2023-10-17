Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EF4C41513
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 07:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.202549.1697529510151740249
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 00:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A179B1007;
	Tue, 17 Oct 2023 00:59:09 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.37.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F4FD3F762;
	Tue, 17 Oct 2023 00:58:27 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 3/4] arm-bsp/linux: corstone1000: Remove External system patches
Date: Tue, 17 Oct 2023 08:57:47 +0100
Message-Id: <20231017075748.40743-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
References: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5127

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

remove the External system patches as they are not upstreamable.
---
 .../0002-Add-external-system-driver.patch     | 220 ------------------
 ...ds-workaround-for-cs1k-specific-bug.patch} |   0
 ...03-Add-rpmsg-driver-for-corstone1000.patch | 218 -----------------
 .../0004-rpmsg-arm-fix-return-value.patch     |  30 ---
 ...pdate-chrdev-to-ctrldev-registration.patch |  28 ---
 .../linux/linux-arm-platforms.inc             |   6 +-
 6 files changed, 1 insertion(+), 501 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0002-Add-external-system-driver.patch
 rename meta-arm-bsp/recipes-kernel/linux/files/corstone1000/{0006-Adds-w=
orkaround-for-cs1k-specific-bug.patch =3D> 0002-Adds-workaround-for-cs1k-=
specific-bug.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0003-Add-rpmsg-driver-for-corstone1000.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0004-rpmsg-arm-fix-return-value.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Ad=
d-external-system-driver.patch b/meta-arm-bsp/recipes-kernel/linux/files/=
corstone1000/0002-Add-external-system-driver.patch
deleted file mode 100644
index d8d9488b..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-exter=
nal-system-driver.patch
+++ /dev/null
@@ -1,220 +0,0 @@
-From 9eac502eacd36a4975ec34a3f076594fa4364032 Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Fri, 19 Aug 2022 14:51:08 +0100
-Subject: [PATCH] Add external system driver
-
-Adds external system driver to control it
-from user-space. It provides run and reset
-functionality at the moment.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/misc/Kconfig           |   1 +
- drivers/misc/Makefile          |   1 +
- drivers/misc/arm/Kconfig       |   5 ++
- drivers/misc/arm/Makefile      |   1 +
- drivers/misc/arm/extsys_ctrl.c | 151 +++++++++++++++++++++++++++++++++
- 5 files changed, 159 insertions(+)
- create mode 100644 drivers/misc/arm/Kconfig
- create mode 100644 drivers/misc/arm/Makefile
- create mode 100644 drivers/misc/arm/extsys_ctrl.c
-
-diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
-index 433aa4197785..912986abc46c 100644
---- a/drivers/misc/Kconfig
-+++ b/drivers/misc/Kconfig
-@@ -555,4 +555,5 @@ source "drivers/misc/cardreader/Kconfig"
- source "drivers/misc/uacce/Kconfig"
- source "drivers/misc/pvpanic/Kconfig"
- source "drivers/misc/mchp_pci1xxxx/Kconfig"
-+source "drivers/misc/arm/Kconfig"
- endmenu
-diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
-index 56de43943cd5..22e6561b8192 100644
---- a/drivers/misc/Makefile
-+++ b/drivers/misc/Makefile
-@@ -63,5 +63,6 @@ obj-$(CONFIG_HI6421V600_IRQ)	+=3D hi6421v600-irq.o
- obj-$(CONFIG_OPEN_DICE)		+=3D open-dice.o
- obj-$(CONFIG_GP_PCI1XXXX)	+=3D mchp_pci1xxxx/
- obj-$(CONFIG_VCPU_STALL_DETECTOR)	+=3D vcpu_stall_detector.o
-+obj-y				+=3D arm/
- obj-$(CONFIG_TMR_MANAGER)      +=3D xilinx_tmr_manager.o
- obj-$(CONFIG_TMR_INJECT)	+=3D xilinx_tmr_inject.o
-diff --git a/drivers/misc/arm/Kconfig b/drivers/misc/arm/Kconfig
-new file mode 100644
-index 000000000000..9f1eb284e530
---- /dev/null
-+++ b/drivers/misc/arm/Kconfig
-@@ -0,0 +1,5 @@
-+config EXTSYS_CTRL
-+	tristate "Arm External System control driver"
-+	help
-+	  Say y here to enable support for external system control
-+	  driver for the Arm Corstone-700 and Corstone1000 platform
-\ No newline at end of file
-diff --git a/drivers/misc/arm/Makefile b/drivers/misc/arm/Makefile
-new file mode 100644
-index 000000000000..1ca3084cf8a0
---- /dev/null
-+++ b/drivers/misc/arm/Makefile
-@@ -0,0 +1 @@
-+obj-$(CONFIG_EXTSYS_CTRL)	+=3D extsys_ctrl.o
-diff --git a/drivers/misc/arm/extsys_ctrl.c b/drivers/misc/arm/extsys_ct=
rl.c
-new file mode 100644
-index 000000000000..7929070ff43d
---- /dev/null
-+++ b/drivers/misc/arm/extsys_ctrl.c
-@@ -0,0 +1,151 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Arm Corstone700 and Corstone1000 external system reset control drive=
r
-+ *
-+ * Copyright (C) 2019 Arm Ltd.
-+ *
-+ */
-+
-+#include <linux/fs.h>
-+#include <linux/clk.h>
-+#include <linux/err.h>
-+#include <linux/interrupt.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <linux/mod_devicetable.h>
-+#include <linux/module.h>
-+#include <linux/platform_device.h>
-+#include <linux/miscdevice.h>
-+#include <linux/init.h>
-+
-+#define EXTSYS_DRV_NAME		"extsys_ctrl"
-+#define EXTSYS_MAX_DEVS		 4
-+
-+#define EXTSYS_RST_SIZE		U(0x8)
-+#define EXTSYS_RST_CTRL_OFF	U(0x0)
-+#define EXTSYS_RST_ST_OFF	U(0x4)
-+
-+/* External system reset control indexes */
-+#define EXTSYS_CPU_WAIT		(0x0)
-+#define EXTSYS_RST_REQ		(0x1)
-+
-+/* External system reset status masks */
-+#define EXTSYS_RST_ST_ACK_OFF	U(0x1)
-+
-+/* No Reset Requested */
-+#define EXTSYS_RST_ST_ACK_NRR	(0x0 << EXTSYS_RST_ST_ACK_OFF)
-+
-+/* Reset Request Complete */
-+#define EXTSYS_RST_ST_ACK_RRC	(0x2 << EXTSYS_RST_ST_ACK_OFF)
-+
-+/* Reset Request Unable to Complete */
-+#define EXTSYS_RST_ST_ACK_RRUC	(0x3 << EXTSYS_RST_ST_ACK_OFF)
-+
-+/* IOCTL commands */
-+#define EXTSYS_CPU_WAIT_DISABLE	0x0
-+#define EXTSYS_RESET_REQ_ENABLE	0x1
-+
-+struct extsys_ctrl {
-+	struct miscdevice miscdev;
-+	void __iomem *reset_reg;
-+	void __iomem *set_reg;
-+};
-+
-+#define CLEAR_BIT(addr, index) writel(readl(addr) & ~(1UL << index), ad=
dr)
-+#define SET_BIT(addr, index) writel(readl(addr) | (1UL << index), addr)
-+
-+static long extsys_ctrl_ioctl(struct file *f, unsigned int cmd,
-+			      unsigned long arg)
-+{
-+	struct extsys_ctrl *extsys;
-+
-+	extsys =3D container_of(f->private_data, struct extsys_ctrl, miscdev);
-+
-+	switch (cmd) {
-+	case EXTSYS_CPU_WAIT_DISABLE:
-+		CLEAR_BIT(extsys->reset_reg, EXTSYS_CPU_WAIT);
-+		break;
-+	case EXTSYS_RESET_REQ_ENABLE:
-+		SET_BIT(extsys->reset_reg, EXTSYS_RST_REQ);
-+		break;
-+	default:
-+		break;
-+	}
-+
-+	return 0;
-+}
-+
-+static const struct file_operations extsys_ctrl_fops =3D {
-+	.owner =3D THIS_MODULE,
-+	.unlocked_ioctl =3D extsys_ctrl_ioctl,
-+};
-+
-+static int extsys_ctrl_probe(struct platform_device *pdev)
-+{
-+	struct device *dev =3D &pdev->dev;
-+	struct extsys_ctrl *extsys;
-+	struct resource *res;
-+	void __iomem *reset_reg;
-+	void __iomem *set_reg;
-+	int ret;
-+
-+	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "rstreg");
-+	reset_reg =3D devm_ioremap_resource(dev, res);
-+	if (IS_ERR(reset_reg))
-+		return PTR_ERR(reset_reg);
-+
-+	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "streg");
-+	set_reg =3D devm_ioremap_resource(dev, res);
-+	if (IS_ERR(set_reg))
-+		return PTR_ERR(set_reg);
-+
-+	extsys =3D devm_kzalloc(dev, sizeof(*extsys), GFP_KERNEL);
-+	if (!extsys)
-+		return -ENOMEM;
-+
-+	extsys->reset_reg =3D reset_reg;
-+	extsys->set_reg =3D set_reg;
-+
-+	extsys->miscdev.minor =3D MISC_DYNAMIC_MINOR;
-+	extsys->miscdev.name =3D EXTSYS_DRV_NAME;
-+	extsys->miscdev.fops =3D &extsys_ctrl_fops;
-+	extsys->miscdev.parent =3D dev;
-+
-+	ret =3D misc_register(&extsys->miscdev);
-+	if (ret)
-+		return ret;
-+
-+	dev_info(dev, "external system controller ready\n");
-+
-+	return 0;
-+}
-+
-+static int extsys_ctrl_remove(struct platform_device *pdev)
-+{
-+	struct extsys_ctrl *extsys =3D dev_get_drvdata(&pdev->dev);
-+
-+	misc_deregister(&extsys->miscdev);
-+
-+	return 0;
-+}
-+
-+static const struct of_device_id extsys_ctrl_match[] =3D {
-+	{ .compatible =3D "arm,extsys_ctrl" },
-+	{ },
-+};
-+MODULE_DEVICE_TABLE(of, extsys_ctrl_match);
-+
-+static struct platform_driver extsys_ctrl_driver =3D {
-+	.driver =3D {
-+		.name =3D EXTSYS_DRV_NAME,
-+		.of_match_table =3D extsys_ctrl_match,
-+	},
-+	.probe =3D extsys_ctrl_probe,
-+	.remove =3D extsys_ctrl_remove,
-+};
-+module_platform_driver(extsys_ctrl_driver);
-+
-+MODULE_LICENSE("GPL v2");
-+MODULE_DESCRIPTION("Arm External System Control Driver");
-+MODULE_AUTHOR("Morten Borup Petersen");
-+MODULE_AUTHOR("Rui Miguel Silva <rui.silva@arm.com>");
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Ad=
ds-workaround-for-cs1k-specific-bug.patch b/meta-arm-bsp/recipes-kernel/l=
inux/files/corstone1000/0002-Adds-workaround-for-cs1k-specific-bug.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Add=
s-workaround-for-cs1k-specific-bug.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Adds-=
workaround-for-cs1k-specific-bug.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Ad=
d-rpmsg-driver-for-corstone1000.patch b/meta-arm-bsp/recipes-kernel/linux=
/files/corstone1000/0003-Add-rpmsg-driver-for-corstone1000.patch
deleted file mode 100644
index cd9cec27..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg=
-driver-for-corstone1000.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-From a834f4e143ff647e7677dc60ab57ee5883f3ac8f Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Wed, 17 Aug 2022 14:21:42 +0100
-Subject: [PATCH] Add rpmsg driver for corstone1000
-
-Adds rpmsg driver to communicate with external
-system in corstone1000 platform.
-
-Upstream-Status: Pending
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/rpmsg/Kconfig             |  10 ++
- drivers/rpmsg/Makefile            |   1 +
- drivers/rpmsg/rpmsg_arm_mailbox.c | 164 ++++++++++++++++++++++++++++++
- 3 files changed, 175 insertions(+)
- create mode 100644 drivers/rpmsg/rpmsg_arm_mailbox.c
-
-diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
-index d3795860f5c0..fc6916d7b523 100644
---- a/drivers/rpmsg/Kconfig
-+++ b/drivers/rpmsg/Kconfig
-@@ -81,4 +81,14 @@ config RPMSG_VIRTIO
- 	select RPMSG_NS
- 	select VIRTIO
-=20
-+config RPMSG_ARM
-+	tristate "ARM RPMSG driver"
-+	select     RPMSG
-+	depends on HAS_IOMEM
-+	depends on MAILBOX
-+	help
-+	  Say y here to enable support for rpmsg lient driver which is built
-+	  around mailbox client using Arm MHUv2.1 as physical medium.This
-+	  driver enables communication which remote processor using MHU.
-+
- endmenu
-diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
-index 58e3b382e316..6bdcc69688b2 100644
---- a/drivers/rpmsg/Makefile
-+++ b/drivers/rpmsg/Makefile
-@@ -1,5 +1,6 @@
- # SPDX-License-Identifier: GPL-2.0
- obj-$(CONFIG_RPMSG)		+=3D rpmsg_core.o
-+obj-$(CONFIG_RPMSG_ARM)		+=3D rpmsg_arm_mailbox.o
- obj-$(CONFIG_RPMSG_CHAR)	+=3D rpmsg_char.o
- obj-$(CONFIG_RPMSG_CTRL)	+=3D rpmsg_ctrl.o
- obj-$(CONFIG_RPMSG_NS)		+=3D rpmsg_ns.o
-diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
-new file mode 100644
-index 000000000000..4a80102669f6
---- /dev/null
-+++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
-@@ -0,0 +1,164 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * rpmsg client driver using mailbox client interface
-+ *
-+ * Copyright (C) 2019 ARM Ltd.
-+ *
-+ */
-+
-+#include <linux/bitmap.h>
-+#include <linux/export.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <linux/ktime.h>
-+#include <linux/mailbox_client.h>
-+#include <linux/module.h>
-+#include <linux/of_address.h>
-+#include <linux/of_device.h>
-+#include <linux/processor.h>
-+#include <linux/semaphore.h>
-+#include <linux/slab.h>
-+#include <linux/rpmsg.h>
-+#include "rpmsg_internal.h"
-+#include <linux/mailbox/arm_mhuv2_message.h>
-+
-+#define RPMSG_NAME	"arm_rpmsg"
-+#define RPMSG_ADDR_ANY	0xFFFFFFFF
-+
-+struct arm_channel {
-+	struct rpmsg_endpoint ept;
-+	struct mbox_client cl;
-+	struct mbox_chan *mbox;
-+};
-+
-+#define arm_channel_from_rpmsg(_ept) container_of(_ept, struct arm_chan=
nel, ept)
-+#define arm_channel_from_mbox(_ept) container_of(_ept, struct arm_chann=
el, cl)
-+
-+
-+static void arm_msg_rx_handler(struct mbox_client *cl, void *mssg)
-+{
-+	struct arm_mhuv2_mbox_msg *msg =3D mssg;
-+	struct arm_channel* channel =3D arm_channel_from_mbox(cl);
-+	int err =3D channel->ept.cb(channel->ept.rpdev, msg->data, 4, channel-=
>ept.priv, RPMSG_ADDR_ANY);
-+	if(err) {
-+		printk("ARM Mailbox: Endpoint callback failed with error: %d", err);
-+	}
-+}
-+
-+
-+static void arm_destroy_ept(struct rpmsg_endpoint *ept)
-+{
-+	struct arm_channel *channel =3D arm_channel_from_rpmsg(ept);
-+	mbox_free_channel(channel->mbox);
-+	kfree(channel);
-+}
-+
-+static int arm_send(struct rpmsg_endpoint *ept, void *data, int len)
-+{
-+	struct arm_channel *channel =3D arm_channel_from_rpmsg(ept);
-+
-+	mbox_send_message(channel->mbox, data);
-+	return 0;
-+}
-+
-+static int arm_sendto(struct rpmsg_endpoint *ept, void *data, int len, =
u32 dest)
-+{
-+	struct arm_mhuv2_mbox_msg msg;
-+	struct arm_channel *channel =3D arm_channel_from_rpmsg(ept);
-+	msg.data =3D data;
-+	msg.len =3D len;
-+	mbox_send_message(channel->mbox, &msg);
-+	return 0;
-+}
-+
-+
-+static const struct rpmsg_endpoint_ops arm_endpoint_ops =3D {
-+	.destroy_ept =3D arm_destroy_ept,
-+	.send =3D arm_send,
-+	.sendto =3D arm_sendto,
-+};
-+
-+
-+static struct rpmsg_endpoint *arm_create_ept(struct rpmsg_device *rpdev=
,
-+		rpmsg_rx_cb_t cb, void *priv, struct rpmsg_channel_info chinfo)
-+{
-+	struct arm_channel *channel;
-+
-+	channel =3D kzalloc(sizeof(*channel), GFP_KERNEL);
-+
-+	// Initialize rpmsg endpoint
-+	kref_init(&channel->ept.refcount);
-+	channel->ept.rpdev =3D rpdev;
-+	channel->ept.cb =3D cb;
-+	channel->ept.priv =3D priv;
-+	channel->ept.ops =3D &arm_endpoint_ops;
-+
-+	// Initialize mailbox client
-+	channel->cl.dev =3D rpdev->dev.parent;
-+	channel->cl.rx_callback =3D arm_msg_rx_handler;
-+	channel->cl.tx_done =3D NULL; /* operate in blocking mode */
-+	channel->cl.tx_block =3D true;
-+	channel->cl.tx_tout =3D 500; /* by half a second */
-+	channel->cl.knows_txdone =3D false; /* depending upon protocol */
-+
-+	channel->mbox =3D mbox_request_channel_byname(&channel->cl, chinfo.nam=
e);
-+	if (IS_ERR_OR_NULL(channel->mbox)) {
-+		printk("RPMsg ARM: Cannot get channel by name: '%s'\n", chinfo.name);
-+		return -1;
-+	}
-+
-+	return &channel->ept;
-+}
-+
-+static const struct rpmsg_device_ops arm_device_ops =3D {
-+	.create_ept =3D arm_create_ept,
-+};
-+
-+
-+static void arm_release_device(struct device *dev)
-+{
-+	struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
-+
-+	kfree(rpdev);
-+}
-+
-+
-+static int client_probe(struct platform_device *pdev)
-+{
-+	struct device *dev =3D &pdev->dev;
-+	struct rpmsg_device *rpdev;
-+
-+	rpdev =3D kzalloc(sizeof(*rpdev), GFP_KERNEL);
-+	if (!rpdev)
-+		return -ENOMEM;
-+
-+	/* Assign callbacks for rpmsg_device */
-+	rpdev->ops =3D &arm_device_ops;
-+
-+	/* Assign public information to the rpmsg_device */
-+	memcpy(rpdev->id.name, RPMSG_NAME, strlen(RPMSG_NAME));
-+
-+	rpdev->dev.parent =3D dev;
-+	rpdev->dev.release =3D arm_release_device;
-+
-+	return rpmsg_chrdev_register_device(rpdev);
-+}
-+
-+static const struct of_device_id client_of_match[] =3D {
-+	{ .compatible =3D "arm,client", .data =3D NULL },
-+	{ /* Sentinel */ },
-+};
-+
-+static struct platform_driver client_driver =3D {
-+	.driver =3D {
-+		.name =3D "arm-mhu-client",
-+		.of_match_table =3D client_of_match,
-+	},
-+	.probe =3D client_probe,
-+};
-+
-+module_platform_driver(client_driver);
-+
-+MODULE_LICENSE("GPL v2");
-+MODULE_DESCRIPTION("ARM RPMSG Driver");
-+MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rp=
msg-arm-fix-return-value.patch b/meta-arm-bsp/recipes-kernel/linux/files/=
corstone1000/0004-rpmsg-arm-fix-return-value.patch
deleted file mode 100644
index 516dbd70..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm=
-fix-return-value.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c1ffd793062a13afdcc07d4bc1a8007188bfca5f Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 27 Sep 2022 10:05:27 +0100
-Subject: [PATCH] rpmsg: arm: fix return value
-
-The creation of and endpoint returns a pointer, fix the return
-value to the right type.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/rpmsg/rpmsg_arm_mailbox.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
-index 4a80102669f6..5c0dcc8e353d 100644
---- a/drivers/rpmsg/rpmsg_arm_mailbox.c
-+++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
-@@ -103,8 +103,9 @@ static struct rpmsg_endpoint *arm_create_ept(struct =
rpmsg_device *rpdev,
-=20
- 	channel->mbox =3D mbox_request_channel_byname(&channel->cl, chinfo.nam=
e);
- 	if (IS_ERR_OR_NULL(channel->mbox)) {
--		printk("RPMsg ARM: Cannot get channel by name: '%s'\n", chinfo.name);
--		return -1;
-+		printk("RPMsg ARM: Cannot get channel by name: %s\n",
-+		       chinfo.name);
-+		return ERR_PTR(-ENOENT);
- 	}
-=20
- 	return &channel->ept;
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rp=
msg-arm-update-chrdev-to-ctrldev-registration.patch b/meta-arm-bsp/recipe=
s-kernel/linux/files/corstone1000/0005-rpmsg-arm-update-chrdev-to-ctrldev=
-registration.patch
deleted file mode 100644
index ef2eb7c1..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm=
-update-chrdev-to-ctrldev-registration.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a8c295e1ff1d2b1032cc7495f212c56ba9f3e874 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 27 Sep 2022 10:07:21 +0100
-Subject: [PATCH] rpmsg: arm: update chrdev to ctrldev registration
-
-Since "rpmsg: Update rpmsg_chrdev_register_device function",
-there was a replacement of the chrdev driver to ctrldev
-driver. Fix the registration.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/rpmsg/rpmsg_arm_mailbox.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
-index 5c0dcc8e353d..90bc8df90885 100644
---- a/drivers/rpmsg/rpmsg_arm_mailbox.c
-+++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
-@@ -142,7 +142,7 @@ static int client_probe(struct platform_device *pdev=
)
- 	rpdev->dev.parent =3D dev;
- 	rpdev->dev.release =3D arm_release_device;
-=20
--	return rpmsg_chrdev_register_device(rpdev);
-+	return rpmsg_ctrldev_register_device(rpdev);
- }
-=20
- static const struct of_device_id client_of_match[] =3D {
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4028cf31..4badfa8c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -30,11 +30,7 @@ LINUX_KERNEL_TYPE:corstone1000 =3D "standard"
 KERNEL_EXTRA_ARGS:corstone1000 +=3D "CONFIG_INITRAMFS_COMPRESSION_NONE=3D=
y"
 SRC_URI:append:corstone1000 =3D " \
            file://defconfig  \
-           file://0002-Add-external-system-driver.patch \
-           file://0003-Add-rpmsg-driver-for-corstone1000.patch \
-           file://0004-rpmsg-arm-fix-return-value.patch \
-           file://0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.p=
atch \
-           file://0006-Adds-workaround-for-cs1k-specific-bug.patch \
+           file://0002-Adds-workaround-for-cs1k-specific-bug.patch \
         "
=20
 SRC_URI:append:corstone1000 =3D " ${@bb.utils.contains('MACHINE_FEATURES=
', \
--=20
2.25.1


