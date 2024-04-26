Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0567C04FFE
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 15:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.456.1714144826819299225
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 08:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6979E2F4;
	Fri, 26 Apr 2024 08:20:54 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.64.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 735FA3F73F;
	Fri, 26 Apr 2024 08:20:25 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 3/3] arm-bsp/linux-yocto: corstone1000: add external system control support
Date: Fri, 26 Apr 2024 16:20:14 +0100
Message-Id: <20240426152014.356666-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
References: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 15:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5617

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

add support for the remoteproc control feature for the external system

With this feature we can switch on/off the external system on demand:

echo stop > /sys/class/remoteproc/remoteproc0/state
echo start > /sys/class/remoteproc/remoteproc0/state

During Linux boot the remoteproc subsystem automatically start
the external system. The user can use the commands above to
stop then start the remote core.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...remoteproc-Add-Arm-remoteproc-driver.patch | 488 ++++++++++++++++++
 ...rstone1000-external-system-device-no.patch |  42 ++
 ...ndings-remoteproc-Add-Arm-remoteproc.patch | 105 ++++
 .../linux/files/corstone1000/extsys.cfg       |   2 +
 .../linux/linux-arm-platforms.inc             |   7 +
 5 files changed, 644 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-remoteproc-Add-Arm-remoteproc-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0002-arm64-dts-Add-corstone1000-external-system-device-no.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0003-dt-bindings-remoteproc-Add-Arm-remoteproc.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
extsys.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-re=
moteproc-Add-Arm-remoteproc-driver.patch b/meta-arm-bsp/recipes-kernel/li=
nux/files/corstone1000/0001-remoteproc-Add-Arm-remoteproc-driver.patch
new file mode 100644
index 00000000..50a6fb2b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-remotepro=
c-Add-Arm-remoteproc-driver.patch
@@ -0,0 +1,488 @@
+From f9881d01669cd98e6f897214f407dce8a245bdfe Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 19 Feb 2024 16:01:28 +0000
+Subject: [PATCH 1/6] remoteproc: Add Arm remoteproc driver
+
+introduce remoteproc support for Arm remote processors
+
+The supported remote processors are those that come with a reset
+control register and a reset status register. The driver allows to
+switch on or off the remote processor.
+
+The current use case is Corstone-1000 External System (Cortex-M3).
+
+The driver can be extended to support other remote processors
+controlled with a reset control and a reset status registers.
+
+The driver also supports control of multiple remote processors at the
+same time.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
240301164227.339208-1-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS                    |   6 +
+ drivers/remoteproc/Kconfig     |  18 ++
+ drivers/remoteproc/Makefile    |   1 +
+ drivers/remoteproc/arm_rproc.c | 395 +++++++++++++++++++++++++++++++++
+ 4 files changed, 420 insertions(+)
+ create mode 100644 drivers/remoteproc/arm_rproc.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 8d1052fa6a69..54d6a40feea5 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1764,6 +1764,12 @@ S:	Maintained
+ F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml
+ F:	drivers/irqchip/irq-vic.c
+=20
++ARM REMOTEPROC DRIVER
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++L:	linux-remoteproc@vger.kernel.org
++S:	Maintained
++F:	drivers/remoteproc/arm_rproc.c
++
+ ARM SMC WATCHDOG DRIVER
+ M:	Julius Werner <jwerner@chromium.org>
+ R:	Evan Benn <evanbenn@chromium.org>
+diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
+index 48845dc8fa85..57fbac454a5d 100644
+--- a/drivers/remoteproc/Kconfig
++++ b/drivers/remoteproc/Kconfig
+@@ -365,6 +365,24 @@ config XLNX_R5_REMOTEPROC
+=20
+ 	  It's safe to say N if not interested in using RPU r5f cores.
+=20
++config ARM_REMOTEPROC
++	tristate "Arm remoteproc support"
++	depends on HAS_IOMEM && ARM64
++	default n
++	help
++	  Say y here to support Arm remote processors via the remote
++	  processor framework.
++
++	  The supported processors are those that come with a reset control re=
gister
++	  and a reset status register. The design can be extended to support d=
ifferent
++	  processors meeting these requirements.
++	  The driver also supports control of multiple remote cores at the sam=
e time.
++
++	  Supported remote cores:
++	      Corstone-1000 External System (Cortex-M3)
++
++	  It's safe to say N here.
++
+ endif # REMOTEPROC
+=20
+ endmenu
+diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
+index 91314a9b43ce..73126310835b 100644
+--- a/drivers/remoteproc/Makefile
++++ b/drivers/remoteproc/Makefile
+@@ -39,3 +39,4 @@ obj-$(CONFIG_STM32_RPROC)		+=3D stm32_rproc.o
+ obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+=3D ti_k3_dsp_remoteproc.o
+ obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+=3D ti_k3_r5_remoteproc.o
+ obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+=3D xlnx_r5_remoteproc.o
++obj-$(CONFIG_ARM_REMOTEPROC)		+=3D arm_rproc.o
+diff --git a/drivers/remoteproc/arm_rproc.c b/drivers/remoteproc/arm_rpr=
oc.c
+new file mode 100644
+index 000000000000..6afa78ae7ad3
+--- /dev/null
++++ b/drivers/remoteproc/arm_rproc.c
+@@ -0,0 +1,395 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Copyright 2024 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <linux/delay.h>
++#include <linux/err.h>
++#include <linux/firmware.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/of.h>
++#include <linux/platform_device.h>
++#include <linux/remoteproc.h>
++
++#include "remoteproc_internal.h"
++
++/**
++ * struct arm_rproc_reset_cfg - remote processor reset configuration
++ * @ctrl_reg: address of the control register
++ * @state_reg: address of the reset status register
++ */
++struct arm_rproc_reset_cfg {
++	void __iomem *ctrl_reg;
++	void __iomem *state_reg;
++};
++
++struct arm_rproc;
++
++/**
++ * struct arm_rproc_dcfg - Arm remote processor configuration
++ * @stop: stop callback function
++ * @start: start callback function
++ */
++struct arm_rproc_dcfg {
++	int (*stop)(struct rproc *rproc);
++	int (*start)(struct rproc *rproc);
++};
++
++/**
++ * struct arm_rproc - Arm remote processor instance
++ * @rproc: rproc handler
++ * @core_dcfg: device configuration pointer
++ * @reset_cfg: reset configuration registers
++ */
++struct arm_rproc {
++	struct rproc				*rproc;
++	const struct arm_rproc_dcfg		*core_dcfg;
++	struct arm_rproc_reset_cfg		reset_cfg;
++};
++
++/* Definitions for Arm Corstone-1000 External System */
++
++#define EXTSYS_RST_CTRL_CPUWAIT			BIT(0)
++#define EXTSYS_RST_CTRL_RST_REQ			BIT(1)
++
++#define EXTSYS_RST_ACK_MASK				GENMASK(2, 1)
++#define EXTSYS_RST_ST_RST_ACK(x)			\
++				((u8)(FIELD_GET(EXTSYS_RST_ACK_MASK, (x))))
++
++#define EXTSYS_RST_ACK_NO_RESET_REQ			(0x0)
++#define EXTSYS_RST_ACK_NOT_COMPLETE			(0x1)
++#define EXTSYS_RST_ACK_COMPLETE			(0x2)
++#define EXTSYS_RST_ACK_RESERVED			(0x3)
++
++#define EXTSYS_RST_ACK_POLL_TRIES			(3)
++#define EXTSYS_RST_ACK_POLL_TIMEOUT			(1000)
++
++/**
++ * arm_rproc_start_cs1000_extsys() - custom start function
++ * @rproc: pointer to the remote processor object
++ *
++ * Start function for Corstone-1000 External System.
++ * Allow the External System core start execute instructions.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int arm_rproc_start_cs1000_extsys(struct rproc *rproc)
++{
++	struct arm_rproc *priv =3D rproc->priv;
++	u32 ctrl_reg;
++
++	/* CPUWAIT signal of the External System is de-asserted */
++	ctrl_reg =3D readl(priv->reset_cfg.ctrl_reg);
++	ctrl_reg &=3D ~EXTSYS_RST_CTRL_CPUWAIT;
++	writel(ctrl_reg, priv->reset_cfg.ctrl_reg);
++
++	return 0;
++}
++
++/**
++ * arm_rproc_cs1000_extsys_poll_rst_ack() - poll RST_ACK bits
++ * @rproc: pointer to the remote processor object
++ * @exp_ack: expected bits value
++ * @rst_ack: bits value read
++ *
++ * Tries to read RST_ACK bits until the timeout expires.
++ * EXTSYS_RST_ACK_POLL_TRIES tries are made,
++ * every EXTSYS_RST_ACK_POLL_TIMEOUT milliseconds.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int arm_rproc_cs1000_extsys_poll_rst_ack(struct rproc *rproc,
++						u8 exp_ack, u8 *rst_ack)
++{
++	struct arm_rproc *priv =3D rproc->priv;
++	struct device *dev =3D rproc->dev.parent;
++	u32 state_reg;
++	int tries =3D EXTSYS_RST_ACK_POLL_TRIES;
++	unsigned long timeout;
++
++	do {
++		state_reg =3D readl(priv->reset_cfg.state_reg);
++		*rst_ack =3D EXTSYS_RST_ST_RST_ACK(state_reg);
++
++		if (*rst_ack =3D=3D EXTSYS_RST_ACK_RESERVED) {
++			dev_err(dev, "unexpected RST_ACK value: 0x%x\n",
++				*rst_ack);
++			return -EINVAL;
++		}
++
++		/* expected ACK value read */
++		if ((*rst_ack & exp_ack) || (*rst_ack =3D=3D exp_ack))
++			return 0;
++
++		timeout =3D msleep_interruptible(EXTSYS_RST_ACK_POLL_TIMEOUT);
++
++		if (timeout) {
++			dev_err(dev, "polling RST_ACK  aborted\n");
++			return -ECONNABORTED;
++		}
++	} while (--tries);
++
++	dev_err(dev, "polling RST_ACK timed out\n");
++
++	return -ETIMEDOUT;
++}
++
++/**
++ * arm_rproc_stop_cs1000_extsys() - custom stop function
++ * @rproc: pointer to the remote processor object
++ *
++ * Reset all logic within the External System, the core will be in a ha=
lt state.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int arm_rproc_stop_cs1000_extsys(struct rproc *rproc)
++{
++	struct arm_rproc *priv =3D rproc->priv;
++	struct device *dev =3D rproc->dev.parent;
++	u32 ctrl_reg;
++	u8 rst_ack, req_status;
++	int ret;
++
++	ctrl_reg =3D readl(priv->reset_cfg.ctrl_reg);
++	ctrl_reg |=3D EXTSYS_RST_CTRL_RST_REQ;
++	writel(ctrl_reg, priv->reset_cfg.ctrl_reg);
++
++	ret =3D arm_rproc_cs1000_extsys_poll_rst_ack(rproc,
++						   EXTSYS_RST_ACK_COMPLETE |
++						   EXTSYS_RST_ACK_NOT_COMPLETE,
++						   &rst_ack);
++	if (ret)
++		return ret;
++
++	req_status =3D rst_ack;
++
++	ctrl_reg =3D readl(priv->reset_cfg.ctrl_reg);
++	ctrl_reg &=3D ~EXTSYS_RST_CTRL_RST_REQ;
++	writel(ctrl_reg, priv->reset_cfg.ctrl_reg);
++
++	ret =3D arm_rproc_cs1000_extsys_poll_rst_ack(rproc, 0, &rst_ack);
++	if (ret)
++		return ret;
++
++	if (req_status =3D=3D EXTSYS_RST_ACK_COMPLETE) {
++		dev_dbg(dev, "the requested reset has been accepted\n");
++		return 0;
++	}
++
++	dev_err(dev, "the requested reset has been denied\n");
++	return -EACCES;
++}
++
++static const struct arm_rproc_dcfg arm_rproc_cfg_corstone1000_extsys =3D=
 {
++	.stop          =3D arm_rproc_stop_cs1000_extsys,
++	.start         =3D arm_rproc_start_cs1000_extsys,
++};
++
++/**
++ * arm_rproc_stop() - Stop function for rproc_ops
++ * @rproc: pointer to the remote processor object
++ *
++ * Calls the stop() callback of the remote core
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int arm_rproc_stop(struct rproc *rproc)
++{
++	struct arm_rproc *priv =3D rproc->priv;
++
++	return priv->core_dcfg->stop(rproc);
++}
++
++/**
++ * arm_rproc_start() - Start function for rproc_ops
++ * @rproc: pointer to the remote processor object
++ *
++ * Calls the start() callback of the remote core
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int arm_rproc_start(struct rproc *rproc)
++{
++	struct arm_rproc *priv =3D rproc->priv;
++
++	return priv->core_dcfg->start(rproc);
++}
++
++/**
++ * arm_rproc_parse_fw() - Parse firmware function for rproc_ops
++ * @rproc: pointer to the remote processor object
++ * @fw: pointer to the firmware
++ *
++ * Does nothing currently.
++ *
++ * Return:
++ *
++ * 0 for success.
++ */
++static int arm_rproc_parse_fw(struct rproc *rproc, const struct firmwar=
e *fw)
++{
++	return 0;
++}
++
++/**
++ * arm_rproc_load() - Load firmware to memory function for rproc_ops
++ * @rproc: pointer to the remote processor object
++ * @fw: pointer to the firmware
++ *
++ * Does nothing currently.
++ *
++ * Return:
++ *
++ * 0 for success.
++ */
++static int arm_rproc_load(struct rproc *rproc, const struct firmware *f=
w)
++{
++	return 0;
++}
++
++static const struct rproc_ops arm_rproc_ops =3D {
++	.start		=3D arm_rproc_start,
++	.stop		=3D arm_rproc_stop,
++	.load		=3D arm_rproc_load,
++	.parse_fw	=3D arm_rproc_parse_fw,
++};
++
++/**
++ * arm_rproc_probe() - the platform device probe
++ * @pdev: the platform device
++ *
++ * Read from the device tree the properties needed to setup
++ * the reset and comms for the remote processor.
++ * Also, allocate a rproc device and register it with the remoteproc su=
bsystem.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int arm_rproc_probe(struct platform_device *pdev)
++{
++	const struct arm_rproc_dcfg *core_dcfg;
++	struct device *dev =3D &pdev->dev;
++	struct device_node *np =3D dev->of_node;
++	struct arm_rproc *priv;
++	struct rproc *rproc;
++	const char *fw_name;
++	int ret;
++	struct resource *res;
++
++	core_dcfg =3D of_device_get_match_data(dev);
++	if (!core_dcfg)
++		return -ENODEV;
++
++	ret =3D rproc_of_parse_firmware(dev, 0, &fw_name);
++	if (ret) {
++		dev_err(dev,
++			"can't parse firmware-name from device tree (%pe)\n",
++			ERR_PTR(ret));
++		return ret;
++	}
++
++	dev_dbg(dev, "firmware-name: %s\n", fw_name);
++
++	rproc =3D rproc_alloc(dev, np->name, &arm_rproc_ops, fw_name,
++			    sizeof(*priv));
++	if (!rproc)
++		return -ENOMEM;
++
++	priv =3D rproc->priv;
++	priv->rproc =3D rproc;
++	priv->core_dcfg =3D core_dcfg;
++
++	res =3D platform_get_resource_byname(pdev,
++					   IORESOURCE_MEM, "reset-control");
++	priv->reset_cfg.ctrl_reg =3D devm_ioremap_resource(&pdev->dev, res);
++	if (IS_ERR(priv->reset_cfg.ctrl_reg)) {
++		ret =3D PTR_ERR(priv->reset_cfg.ctrl_reg);
++		dev_err(dev,
++			"can't map the reset-control register (%pe)\n",
++			ERR_PTR((unsigned long)priv->reset_cfg.ctrl_reg));
++		goto err_free_rproc;
++	} else {
++		dev_dbg(dev, "reset-control: %p\n", priv->reset_cfg.ctrl_reg);
++	}
++
++	res =3D platform_get_resource_byname(pdev,
++					   IORESOURCE_MEM, "reset-status");
++	priv->reset_cfg.state_reg =3D devm_ioremap_resource(&pdev->dev, res);
++	if (IS_ERR(priv->reset_cfg.state_reg)) {
++		ret =3D PTR_ERR(priv->reset_cfg.state_reg);
++		dev_err(dev,
++			"can't map the reset-status register (%pe)\n",
++			ERR_PTR((unsigned long)priv->reset_cfg.state_reg));
++		goto err_free_rproc;
++	} else {
++		dev_dbg(dev, "reset-status: %p\n",
++			priv->reset_cfg.state_reg);
++	}
++
++	platform_set_drvdata(pdev, rproc);
++
++	ret =3D rproc_add(rproc);
++	if (ret) {
++		dev_err(dev, "can't add remote processor (%pe)\n",
++			ERR_PTR(ret));
++		goto err_free_rproc;
++	} else {
++		dev_dbg(dev, "remote processor added\n");
++	}
++
++	return 0;
++
++err_free_rproc:
++	rproc_free(rproc);
++
++	return ret;
++}
++
++/**
++ * arm_rproc_remove() - the platform device remove
++ * @pdev: the platform device
++ *
++ * Delete and free the resources used.
++ */
++static void arm_rproc_remove(struct platform_device *pdev)
++{
++	struct rproc *rproc =3D platform_get_drvdata(pdev);
++
++	rproc_del(rproc);
++	rproc_free(rproc);
++}
++
++static const struct of_device_id arm_rproc_of_match[] =3D {
++	{ .compatible =3D "arm,corstone1000-extsys", .data =3D &arm_rproc_cfg_=
corstone1000_extsys },
++	{},
++};
++MODULE_DEVICE_TABLE(of, arm_rproc_of_match);
++
++static struct platform_driver arm_rproc_driver =3D {
++	.probe =3D arm_rproc_probe,
++	.remove_new =3D arm_rproc_remove,
++	.driver =3D {
++		.name =3D "arm-rproc",
++		.of_match_table =3D arm_rproc_of_match,
++	},
++};
++module_platform_driver(arm_rproc_driver);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("Arm Remote Processor Control Driver");
++MODULE_AUTHOR("Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>");
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-ar=
m64-dts-Add-corstone1000-external-system-device-no.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/files/corstone1000/0002-arm64-dts-Add-corstone1000-ex=
ternal-system-device-no.patch
new file mode 100644
index 00000000..5c1f3de4
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-arm64-dts=
-Add-corstone1000-external-system-device-no.patch
@@ -0,0 +1,42 @@
+From 0122f194e4a6fb50750dadd08f2354e78d4dd79c Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 19 Feb 2024 16:18:37 +0000
+Subject: [PATCH 2/6] arm64: dts: Add corstone1000 external system device=
 node
+
+add device tree node for the external system core in Corstone-1000
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
240301164227.339208-1-abdellatif.elkhlifi@arm.com/]
+---
+ arch/arm64/boot/dts/arm/corstone1000.dtsi | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot=
/dts/arm/corstone1000.dtsi
+index 6ad7829f9e28..67df642363e9 100644
+--- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
++++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0 OR MIT
+ /*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
++ * Copyright 2022, 2024, Arm Limited and/or its affiliates <open-source=
-office@arm.com>
+  * Copyright (c) 2022, Linaro Limited. All rights reserved.
+  *
+  */
+@@ -157,5 +157,13 @@ mhu_seh1: mailbox@1b830000 {
+ 			secure-status =3D "okay";     /* secure-world-only */
+ 			status =3D "disabled";
+ 		};
++
++		extsys0: remoteproc@1a010310 {
++			compatible =3D "arm,corstone1000-extsys";
++			reg =3D <0x1a010310 0x4>,
++				<0x1a010314 0X4>;
++			reg-names =3D "reset-control", "reset-status";
++			firmware-name =3D "es_flashfw.elf";
++		};
+ 	};
+ };
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-dt=
-bindings-remoteproc-Add-Arm-remoteproc.patch b/meta-arm-bsp/recipes-kern=
el/linux/files/corstone1000/0003-dt-bindings-remoteproc-Add-Arm-remotepro=
c.patch
new file mode 100644
index 00000000..3c7bb0dd
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-dt-bindin=
gs-remoteproc-Add-Arm-remoteproc.patch
@@ -0,0 +1,105 @@
+From af50eca3e3b408f2f1f378c1d0c48fb6c3107c8c Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 19 Feb 2024 20:47:26 +0000
+Subject: [PATCH 3/6] dt-bindings: remoteproc: Add Arm remoteproc
+
+introduce the bindings for Arm remoteproc support.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
240301164227.339208-1-abdellatif.elkhlifi@arm.com/]
+---
+ .../bindings/remoteproc/arm,rproc.yaml        | 69 +++++++++++++++++++
+ MAINTAINERS                                   |  1 +
+ 2 files changed, 70 insertions(+)
+ create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,rpr=
oc.yaml
+
+diff --git a/Documentation/devicetree/bindings/remoteproc/arm,rproc.yaml=
 b/Documentation/devicetree/bindings/remoteproc/arm,rproc.yaml
+new file mode 100644
+index 000000000000..322197158059
+--- /dev/null
++++ b/Documentation/devicetree/bindings/remoteproc/arm,rproc.yaml
+@@ -0,0 +1,69 @@
++# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
++%YAML 1.2
++---
++$id: http://devicetree.org/schemas/remoteproc/arm,rproc.yaml#
++$schema: http://devicetree.org/meta-schemas/core.yaml#
++
++title: Arm Remoteproc Devices
++
++maintainers:
++  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++
++description: |
++  Some Arm heterogeneous System-On-Chips feature remote processors that=
 can
++  be controlled with a reset control register and a reset status regist=
er to
++  start or stop the processor.
++
++  This document defines the bindings for these remote processors.
++
++properties:
++  compatible:
++    enum:
++      - arm,corstone1000-extsys
++
++  reg:
++    minItems: 2
++    maxItems: 2
++    description: |
++      Address and size in bytes of the reset control register
++      and the reset status register.
++      Expects the registers to be in the order as above.
++      Should contain an entry for each value in 'reg-names'.
++
++  reg-names:
++    description: |
++      Required names for each of the reset registers defined in
++      the 'reg' property. Expects the names from the following
++      list, in the specified order, each representing the corresponding
++      reset register.
++    items:
++      - const: reset-control
++      - const: reset-status
++
++  firmware-name:
++    description: |
++      Default name of the firmware to load to the remote processor.
++
++required:
++  - compatible
++  - reg
++  - reg-names
++  - firmware-name
++
++additionalProperties: false
++
++examples:
++  - |
++    extsys0: remoteproc@1a010310 {
++            compatible =3D "arm,corstone1000-extsys";
++            reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
++            reg-names =3D "reset-control", "reset-status";
++            firmware-name =3D "es0_flashfw.elf";
++    };
++
++    extsys1: remoteproc@1a010318 {
++            compatible =3D "arm,corstone1000-extsys";
++            reg =3D <0x1a010318 0x4>, <0x1a01031c 0x4>;
++            reg-names =3D "reset-control", "reset-status";
++            firmware-name =3D "es1_flashfw.elf";
++    };
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 54d6a40feea5..eddaa3841a65 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1768,6 +1768,7 @@ ARM REMOTEPROC DRIVER
+ M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+ L:	linux-remoteproc@vger.kernel.org
+ S:	Maintained
++F:	Documentation/devicetree/bindings/remoteproc/arm,rproc.yaml
+ F:	drivers/remoteproc/arm_rproc.c
+=20
+ ARM SMC WATCHDOG DRIVER
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/extsys.=
cfg b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/extsys.cfg
new file mode 100644
index 00000000..902fd43e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/extsys.cfg
@@ -0,0 +1,2 @@
+CONFIG_REMOTEPROC=3Dy
+CONFIG_ARM_REMOTEPROC=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index e6817426..011586ef 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -37,6 +37,13 @@ SRC_URI:append:corstone1000 =3D " ${@bb.utils.contains=
('MACHINE_FEATURES', \
                                                             '', \
                                                              d)}"
=20
+SRC_URI:append:corstone1000 =3D " \
+    file://extsys.cfg \
+    file://0001-remoteproc-Add-Arm-remoteproc-driver.patch \
+    file://0002-arm64-dts-Add-corstone1000-external-system-device-no.pat=
ch \
+    file://0003-dt-bindings-remoteproc-Add-Arm-remoteproc.patch \
+    "
+
 # Default kernel features not needed for corstone1000
 # otherwise the extra kernel modules will increase the rootfs size
 # corstone1000 has limited flash memory constraints
--=20
2.25.1


