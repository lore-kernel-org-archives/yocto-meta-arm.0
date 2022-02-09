Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D06C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29864.1644428790508379839
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F104ED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67E3A3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm-bsp/juno: move to linux-yocto 5.15
Date: Wed,  9 Feb 2022 17:46:22 +0000
Message-Id: <20220209174624.3824874-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209174624.3824874-1-ross.burton@arm.com>
References: <20220209174624.3824874-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2971

The default kernel is now 5.15, so remove the preferred version
assignment.

The mailbox patches went upstream in a different form, so we can drop
the patches and drop in a customised Devicetree file required to use the
new drivers.

In the future we can possibly drop the devicetree patch if it is provided
by firmware, but for now this is known to work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |   2 -
 ...ort-for-doorbell-signal-mode-control.patch |  93 -----
 ...box-add-bindings-to-support-ARM-MHU-.patch |  98 -----
 ..._mhu-migrate-to-threaded-irq-handler.patch | 106 ------
 ...re-factor-data-structure-to-add-door.patch | 338 ------------------
 ...u-add-full-support-for-the-doorbells.patch | 224 ------------
 ...add-support-to-read-and-record-mbox-.patch |  67 ----
 ...fconfig-add-all-SCMI-related-configs.patch |  79 ----
 ...-dev.patch =3D> juno-dts-mhu-doorbell.patch} | 174 +++++----
 .../linux/linux-arm-platforms.inc             |  15 +-
 10 files changed, 100 insertions(+), 1096 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mai=
lbox-add-support-for-doorbell-signal-mode-control.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-=
bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mai=
lbox-arm_mhu-migrate-to-threaded-irq-handler.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mai=
lbox-arm_mhu-re-factor-data-structure-to-add-door.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mai=
lbox-arm_mhu-add-full-support-for-the-doorbells.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mai=
lbox-arm_mhu-add-support-to-read-and-record-mbox-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm=
64-defconfig-add-all-SCMI-related-configs.patch
 rename meta-arm-bsp/recipes-kernel/linux/files/juno/{0008-arm64-dts-juno=
-add-mhu-doorbell-support-and-scmi-dev.patch =3D> juno-dts-mhu-doorbell.p=
atch} (78%)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 18d52b30..2da6ba66 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -17,9 +17,7 @@ IMAGE_FSTYPES +=3D "tar.bz2 ext4"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
-# Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a edk2-firmware u-boot firmwar=
e-image-juno"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-ad=
d-support-for-doorbell-signal-mode-control.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-=
control.patch
deleted file mode 100644
index 8ebaf8fd..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-suppo=
rt-for-doorbell-signal-mode-control.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From e9ba9ad0a4f7084bd775f3246f553e18fbb18c4d Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Wed, 1 Nov 2017 16:15:27 +0000
-Subject: [PATCH 1/8] mailbox: add support for doorbell/signal mode contr=
ollers
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970337]
-
-Some mailbox controllers are lack FIFOs or memory to transmit data.
-They typically contains single doorbell registers to just signal the
-remote. The actually data is transmitted/shared using some shared memory
-which is not part of the mailbox.
-
-Such controllers don't need to transmit any data, they just transmit
-the signal. In such controllers the data pointer passed to
-mbox_send_message is passed to client via it's tx_prepare callback.
-Controller doesn't need any data to be passed from the client.
-
-This patch introduce the new API send_signal to support such doorbell/
-signal mode in mailbox controllers. This is useful to avoid another
-layer of abstraction as typically multiple channels can be multiplexied
-into single register.
-
-Cc: Jassi Brar <jassisinghbrar@gmail.com>
-Cc: Arnd Bergmann <arnd@arndb.de>
-Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
----
- drivers/mailbox/mailbox.c          | 11 ++++++++++-
- include/linux/mailbox_controller.h | 11 +++++++++++
- 2 files changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
-index 0b821a5b2db8..a1f916a6e044 100644
---- a/drivers/mailbox/mailbox.c
-+++ b/drivers/mailbox/mailbox.c
-@@ -74,7 +74,10 @@ static void msg_submit(struct mbox_chan *chan)
- 	if (chan->cl->tx_prepare)
- 		chan->cl->tx_prepare(chan->cl, data);
- 	/* Try to submit a message to the MBOX controller */
--	err =3D chan->mbox->ops->send_data(chan, data);
-+	if (chan->mbox->ops->send_data)
-+		err =3D chan->mbox->ops->send_data(chan, data);
-+	else
-+		err =3D chan->mbox->ops->send_signal(chan);
- 	if (!err) {
- 		chan->active_req =3D data;
- 		chan->msg_count--;
-@@ -480,6 +483,12 @@ int mbox_controller_register(struct mbox_controller=
 *mbox)
- 	/* Sanity check */
- 	if (!mbox || !mbox->dev || !mbox->ops || !mbox->num_chans)
- 		return -EINVAL;
-+	/*
-+	 * A controller can support either doorbell mode or normal message
-+	 * transmission mode but not both
-+	 */
-+	if (mbox->ops->send_data && mbox->ops->send_signal)
-+		return -EINVAL;
-=20
- 	if (mbox->txdone_irq)
- 		txdone =3D TXDONE_BY_IRQ;
-diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_=
controller.h
-index 36d6ce673503..476bb9d2ee88 100644
---- a/include/linux/mailbox_controller.h
-+++ b/include/linux/mailbox_controller.h
-@@ -20,6 +20,16 @@ struct mbox_chan;
-  *		transmission of data is reported by the controller via
-  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
-  *		sleep.
-+ * @send_signal: The API asks the MBOX controller driver, in atomic
-+ *		 context try to transmit a signal on the bus. Returns 0 if
-+ *		 data is accepted for transmission, -EBUSY while rejecting
-+ *		 if the remote hasn't yet absorbed the last signal sent. Actual
-+ *		 transmission of data must be handled by the client and  is
-+ *		 reported by the controller via mbox_chan_txdone (if it has
-+ *		 some TX ACK irq). It must not sleep. Unlike send_data,
-+ *		 send_signal doesn't handle any messages/data. It just sends
-+ *		 notification signal(doorbell) and client needs to prepare all
-+ *		 the data.
-  * @flush:	Called when a client requests transmissions to be blocking b=
ut
-  *		the context doesn't allow sleeping. Typically the controller
-  *		will implement a busy loop waiting for the data to flush out.
-@@ -45,6 +55,7 @@ struct mbox_chan;
-  */
- struct mbox_chan_ops {
- 	int (*send_data)(struct mbox_chan *chan, void *data);
-+	int (*send_signal)(struct mbox_chan *chan);
- 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
- 	int (*startup)(struct mbox_chan *chan);
- 	void (*shutdown)(struct mbox_chan *chan);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-binding=
s-mailbox-add-bindings-to-support-ARM-MHU-.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-A=
RM-MHU-.patch
deleted file mode 100644
index e8300932..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailb=
ox-add-bindings-to-support-ARM-MHU-.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 890fedb91e4b81bdb2384c7bb36580d25859191f Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 28 Apr 2017 11:28:24 +0100
-Subject: [PATCH 2/8] dt-bindings: mailbox: add bindings to support ARM M=
HU
- doorbells
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970343]
-
-The ARM MHU has mechanism to assert interrupt signals to facilitate
-inter-processor message based communication. It drives the signal using
-a 32-bit register, with all 32-bits logically ORed together. It also
-enables software to set, clear and check the status of each of the bits
-of this register independently. Each bit of the register can be
-associated with a type of event that can contribute to raising the
-interrupt thereby allowing it to be used as independent doorbells.
-
-Since the first version of this binding can't support doorbells,
-this patch extends the existing binding to support them by allowing
-"#mbox-cells" to be 2.
-
-Cc: Jassi Brar <jaswinder.singh@linaro.org>
-Cc: Rob Herring <robh+dt@kernel.org>
-Cc: devicetree@vger.kernel.org
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
----
- .../devicetree/bindings/mailbox/arm-mhu.txt   | 39 ++++++++++++++++++-
- 1 file changed, 37 insertions(+), 2 deletions(-)
-
-diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Doc=
umentation/devicetree/bindings/mailbox/arm-mhu.txt
-index 4971f03f0b33..ba659bcc7109 100644
---- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
-+++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
-@@ -10,6 +10,15 @@ STAT register and the remote clears it after having r=
ead the data.
- The last channel is specified to be a 'Secure' resource, hence can't be
- used by Linux running NS.
-=20
-+The MHU drives the interrupt signal using a 32-bit register, with all
-+32-bits logically ORed together. It provides a set of registers to
-+enable software to set, clear and check the status of each of the bits
-+of this register independently. The use of 32 bits per interrupt line
-+enables software to provide more information about the source of the
-+interrupt. For example, each bit of the register can be associated with
-+a type of event that can contribute to raising the interrupt. Each of
-+the 32-bits can be used as "doorbell" to alert the remote processor.
-+
- Mailbox Device Node:
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
-@@ -18,13 +27,21 @@ Required properties:
- - compatible:		Shall be "arm,mhu" & "arm,primecell"
- - reg:			Contains the mailbox register address range (base
- 			address and length)
--- #mbox-cells		Shall be 1 - the index of the channel needed.
-+- #mbox-cells		Shall be 1 - the index of the channel needed when
-+			not used as set of doorbell bits.
-+			Shall be 2 - the index of the channel needed, and
-+			the index of the doorbell bit within the channel
-+			when used in doorbell mode.
- - interrupts:		Contains the interrupt information corresponding to
--			each of the 3 links of MHU.
-+			each of the 3 physical channels of MHU namely low
-+			priority non-secure, high priority non-secure and
-+			secure channels.
-=20
- Example:
- --------
-=20
-+1. Controller which doesn't support doorbells
-+
- 	mhu: mailbox@2b1f0000 {
- 		#mbox-cells =3D <1>;
- 		compatible =3D "arm,mhu", "arm,primecell";
-@@ -41,3 +58,21 @@ Example:
- 		reg =3D <0 0x2e000000 0x4000>;
- 		mboxes =3D <&mhu 1>; /* HP-NonSecure */
- 	};
-+
-+2. Controller which supports doorbells
-+
-+	mhu: mailbox@2b1f0000 {
-+		#mbox-cells =3D <2>;
-+		compatible =3D "arm,mhu", "arm,primecell";
-+		reg =3D <0 0x2b1f0000 0x1000>;
-+		interrupts =3D <0 36 4>, /* LP-NonSecure */
-+			     <0 35 4>; /* HP-NonSecure */
-+		clocks =3D <&clock 0 2 1>;
-+		clock-names =3D "apb_pclk";
-+	};
-+
-+	mhu_client: scb@2e000000 {
-+		compatible =3D "arm,scpi";
-+		reg =3D <0 0x2e000000 0x200>;
-+		mboxes =3D <&mhu 1 4>; /* HP-NonSecure 5th doorbell bit */
-+	};
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-ar=
m_mhu-migrate-to-threaded-irq-handler.patch b/meta-arm-bsp/recipes-kernel=
/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.pa=
tch
deleted file mode 100644
index 1579a63b..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-m=
igrate-to-threaded-irq-handler.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 620e29a3323608c23fe370744b79e2fd19fc4ee0 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Tue, 2 May 2017 11:12:43 +0100
-Subject: [PATCH 3/8] mailbox: arm_mhu: migrate to threaded irq handler
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970345]
-
-In preparation to introduce support for doorbells which require the
-interrupt handlers to be threaded, this patch moves the existing
-interrupt handler to threaded handler.
-
-Also it moves out the registering and freeing of the handlers from
-the mailbox startup and shutdown methods. This also is required to
-support doorbells.
-
-Cc: Jassi Brar <jaswinder.singh@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
----
- drivers/mailbox/arm_mhu.c | 46 +++++++++++++++++++--------------------
- 1 file changed, 22 insertions(+), 24 deletions(-)
-
-diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
-index 9da236552bd7..d7a0b25df372 100644
---- a/drivers/mailbox/arm_mhu.c
-+++ b/drivers/mailbox/arm_mhu.c
-@@ -76,33 +76,16 @@ static int mhu_startup(struct mbox_chan *chan)
- {
- 	struct mhu_link *mlink =3D chan->con_priv;
- 	u32 val;
--	int ret;
-=20
- 	val =3D readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
- 	writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
-=20
--	ret =3D request_irq(mlink->irq, mhu_rx_interrupt,
--			  IRQF_SHARED, "mhu_link", chan);
--	if (ret) {
--		dev_err(chan->mbox->dev,
--			"Unable to acquire IRQ %d\n", mlink->irq);
--		return ret;
--	}
--
- 	return 0;
- }
-=20
--static void mhu_shutdown(struct mbox_chan *chan)
--{
--	struct mhu_link *mlink =3D chan->con_priv;
--
--	free_irq(mlink->irq, chan);
--}
--
- static const struct mbox_chan_ops mhu_ops =3D {
- 	.send_data =3D mhu_send_data,
- 	.startup =3D mhu_startup,
--	.shutdown =3D mhu_shutdown,
- 	.last_tx_done =3D mhu_last_tx_done,
- };
-=20
-@@ -124,13 +107,6 @@ static int mhu_probe(struct amba_device *adev, cons=
t struct amba_id *id)
- 		return PTR_ERR(mhu->base);
- 	}
-=20
--	for (i =3D 0; i < MHU_CHANS; i++) {
--		mhu->chan[i].con_priv =3D &mhu->mlink[i];
--		mhu->mlink[i].irq =3D adev->irq[i];
--		mhu->mlink[i].rx_reg =3D mhu->base + mhu_reg[i];
--		mhu->mlink[i].tx_reg =3D mhu->mlink[i].rx_reg + TX_REG_OFFSET;
--	}
--
- 	mhu->mbox.dev =3D dev;
- 	mhu->mbox.chans =3D &mhu->chan[0];
- 	mhu->mbox.num_chans =3D MHU_CHANS;
-@@ -147,6 +123,28 @@ static int mhu_probe(struct amba_device *adev, cons=
t struct amba_id *id)
- 		return err;
- 	}
-=20
-+	for (i =3D 0; i < MHU_CHANS; i++) {
-+		int irq =3D mhu->mlink[i].irq =3D adev->irq[i];
-+
-+		if (irq <=3D 0) {
-+			dev_dbg(dev, "No IRQ found for Channel %d\n", i);
-+			continue;
-+		}
-+
-+		mhu->chan[i].con_priv =3D &mhu->mlink[i];
-+		mhu->mlink[i].rx_reg =3D mhu->base + mhu_reg[i];
-+		mhu->mlink[i].tx_reg =3D mhu->mlink[i].rx_reg + TX_REG_OFFSET;
-+
-+		err =3D devm_request_threaded_irq(dev, irq, NULL,
-+						mhu_rx_interrupt, IRQF_ONESHOT,
-+						"mhu_link", &mhu->chan[i]);
-+		if (err) {
-+			dev_err(dev, "Can't claim IRQ %d\n", irq);
-+			mbox_controller_unregister(&mhu->mbox);
-+			return err;
-+		}
-+	}
-+
- 	dev_info(dev, "ARM MHU Mailbox registered\n");
- 	return 0;
- }
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-ar=
m_mhu-re-factor-data-structure-to-add-door.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-a=
dd-door.patch
deleted file mode 100644
index 137493de..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-r=
e-factor-data-structure-to-add-door.patch
+++ /dev/null
@@ -1,338 +0,0 @@
-From a75e42a4aa52ff0c8d24594a2510e9e7edcc810d Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Tue, 2 May 2017 11:50:59 +0100
-Subject: [PATCH 4/8] mailbox: arm_mhu: re-factor data structure to add
- doorbell support
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970347]
-
-In order to support doorbells, we need a bit of reword around data
-structures that are per-channel. Since the number of doorbells are
-not fixed though restricted to maximum of 20, the channel assignment
-and initialization is move to xlate function.
-
-This patch also adds the platform data for the existing support of one
-channel per physical channel.
-
-Cc: Jassi Brar <jaswinder.singh@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
----
- drivers/mailbox/arm_mhu.c | 209 ++++++++++++++++++++++++++++++++++----
- 1 file changed, 187 insertions(+), 22 deletions(-)
-
-diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
-index d7a0b25df372..24999bb9dc57 100644
---- a/drivers/mailbox/arm_mhu.c
-+++ b/drivers/mailbox/arm_mhu.c
-@@ -12,6 +12,8 @@
- #include <linux/io.h>
- #include <linux/mailbox_controller.h>
- #include <linux/module.h>
-+#include <linux/of.h>
-+#include <linux/of_device.h>
-=20
- #define INTR_STAT_OFS	0x0
- #define INTR_SET_OFS	0x8
-@@ -22,7 +24,8 @@
- #define MHU_SEC_OFFSET	0x200
- #define TX_REG_OFFSET	0x100
-=20
--#define MHU_CHANS	3
-+#define MHU_NUM_PCHANS	3	/* Secure, Non-Secure High and Low Priority */
-+#define MHU_CHAN_MAX	20	/* Max channels to save on unused RAM */
-=20
- struct mhu_link {
- 	unsigned irq;
-@@ -32,53 +35,175 @@ struct mhu_link {
-=20
- struct arm_mhu {
- 	void __iomem *base;
--	struct mhu_link mlink[MHU_CHANS];
--	struct mbox_chan chan[MHU_CHANS];
-+	struct mhu_link mlink[MHU_NUM_PCHANS];
- 	struct mbox_controller mbox;
-+	struct device *dev;
- };
-=20
-+/**
-+ * ARM MHU Mailbox platform specific configuration
-+ *
-+ * @num_pchans: Maximum number of physical channels
-+ * @num_doorbells: Maximum number of doorbells per physical channel
-+ */
-+struct mhu_mbox_pdata {
-+	unsigned int num_pchans;
-+	unsigned int num_doorbells;
-+	bool support_doorbells;
-+};
-+
-+/**
-+ * ARM MHU Mailbox allocated channel information
-+ *
-+ * @mhu: Pointer to parent mailbox device
-+ * @pchan: Physical channel within which this doorbell resides in
-+ * @doorbell: doorbell number pertaining to this channel
-+ */
-+struct mhu_channel {
-+	struct arm_mhu *mhu;
-+	unsigned int pchan;
-+	unsigned int doorbell;
-+};
-+
-+static inline struct mbox_chan *
-+mhu_mbox_to_channel(struct mbox_controller *mbox,
-+		    unsigned int pchan, unsigned int doorbell)
-+{
-+	int i;
-+	struct mhu_channel *chan_info;
-+
-+	for (i =3D 0; i < mbox->num_chans; i++) {
-+		chan_info =3D mbox->chans[i].con_priv;
-+		if (chan_info && chan_info->pchan =3D=3D pchan &&
-+		    chan_info->doorbell =3D=3D doorbell)
-+			return &mbox->chans[i];
-+	}
-+
-+	dev_err(mbox->dev,
-+		"Channel not registered: physical channel: %d doorbell: %d\n",
-+		pchan, doorbell);
-+
-+	return NULL;
-+}
-+
-+static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int =
irq)
-+{
-+	unsigned int pchan;
-+	struct mhu_mbox_pdata *pdata =3D dev_get_platdata(mhu->dev);
-+
-+	for (pchan =3D 0; pchan < pdata->num_pchans; pchan++)
-+		if (mhu->mlink[pchan].irq =3D=3D irq)
-+			break;
-+	return pchan;
-+}
-+
-+static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
-+					const struct of_phandle_args *spec)
-+{
-+	struct arm_mhu *mhu =3D dev_get_drvdata(mbox->dev);
-+	struct mhu_mbox_pdata *pdata =3D dev_get_platdata(mhu->dev);
-+	struct mhu_channel *chan_info;
-+	struct mbox_chan *chan =3D NULL;
-+	unsigned int pchan =3D spec->args[0];
-+	unsigned int doorbell =3D pdata->support_doorbells ? spec->args[1] : 0=
;
-+	int i;
-+
-+	/* Bounds checking */
-+	if (pchan >=3D pdata->num_pchans || doorbell >=3D pdata->num_doorbells=
) {
-+		dev_err(mbox->dev,
-+			"Invalid channel requested pchan: %d doorbell: %d\n",
-+			pchan, doorbell);
-+		return ERR_PTR(-EINVAL);
-+	}
-+
-+	for (i =3D 0; i < mbox->num_chans; i++) {
-+		chan_info =3D mbox->chans[i].con_priv;
-+
-+		/* Is requested channel free? */
-+		if (chan_info &&
-+		    mbox->dev =3D=3D chan_info->mhu->dev &&
-+		    pchan =3D=3D chan_info->pchan &&
-+		    doorbell =3D=3D chan_info->doorbell) {
-+			dev_err(mbox->dev, "Channel in use\n");
-+			return ERR_PTR(-EBUSY);
-+		}
-+
-+		/*
-+		 * Find the first free slot, then continue checking
-+		 * to see if requested channel is in use
-+		 */
-+		if (!chan && !chan_info)
-+			chan =3D &mbox->chans[i];
-+	}
-+
-+	if (!chan) {
-+		dev_err(mbox->dev, "No free channels left\n");
-+		return ERR_PTR(-EBUSY);
-+	}
-+
-+	chan_info =3D devm_kzalloc(mbox->dev, sizeof(*chan_info), GFP_KERNEL);
-+	if (!chan_info)
-+		return ERR_PTR(-ENOMEM);
-+
-+	chan_info->mhu =3D mhu;
-+	chan_info->pchan =3D pchan;
-+	chan_info->doorbell =3D doorbell;
-+
-+	chan->con_priv =3D chan_info;
-+
-+	dev_dbg(mbox->dev, "mbox: created channel phys: %d doorbell: %d\n",
-+		pchan, doorbell);
-+
-+	return chan;
-+}
-+
- static irqreturn_t mhu_rx_interrupt(int irq, void *p)
- {
--	struct mbox_chan *chan =3D p;
--	struct mhu_link *mlink =3D chan->con_priv;
-+	struct arm_mhu *mhu =3D p;
-+	unsigned int pchan =3D mhu_mbox_irq_to_pchan_num(mhu, irq);
-+	struct mbox_chan *chan =3D mhu_mbox_to_channel(&mhu->mbox, pchan, 0);
-+	void __iomem *base =3D mhu->mlink[pchan].rx_reg;
- 	u32 val;
-=20
--	val =3D readl_relaxed(mlink->rx_reg + INTR_STAT_OFS);
-+	val =3D readl_relaxed(base + INTR_STAT_OFS);
- 	if (!val)
- 		return IRQ_NONE;
-=20
- 	mbox_chan_received_data(chan, (void *)&val);
-=20
--	writel_relaxed(val, mlink->rx_reg + INTR_CLR_OFS);
-+	writel_relaxed(val, base + INTR_CLR_OFS);
-=20
- 	return IRQ_HANDLED;
- }
-=20
- static bool mhu_last_tx_done(struct mbox_chan *chan)
- {
--	struct mhu_link *mlink =3D chan->con_priv;
--	u32 val =3D readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
-+	struct mhu_channel *chan_info =3D chan->con_priv;
-+	void __iomem *base =3D chan_info->mhu->mlink[chan_info->pchan].tx_reg;
-+	u32 val =3D readl_relaxed(base + INTR_STAT_OFS);
-=20
- 	return (val =3D=3D 0);
- }
-=20
- static int mhu_send_data(struct mbox_chan *chan, void *data)
- {
--	struct mhu_link *mlink =3D chan->con_priv;
-+	struct mhu_channel *chan_info =3D chan->con_priv;
-+	void __iomem *base =3D chan_info->mhu->mlink[chan_info->pchan].tx_reg;
- 	u32 *arg =3D data;
-=20
--	writel_relaxed(*arg, mlink->tx_reg + INTR_SET_OFS);
-+	writel_relaxed(*arg, base + INTR_SET_OFS);
-=20
- 	return 0;
- }
-=20
- static int mhu_startup(struct mbox_chan *chan)
- {
--	struct mhu_link *mlink =3D chan->con_priv;
-+	struct mhu_channel *chan_info =3D chan->con_priv;
-+	void __iomem *base =3D chan_info->mhu->mlink[chan_info->pchan].tx_reg;
- 	u32 val;
-=20
--	val =3D readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
--	writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
-+	val =3D readl_relaxed(base + INTR_STAT_OFS);
-+	writel_relaxed(val, base + INTR_CLR_OFS);
-=20
- 	return 0;
- }
-@@ -89,14 +214,47 @@ static const struct mbox_chan_ops mhu_ops =3D {
- 	.last_tx_done =3D mhu_last_tx_done,
- };
-=20
-+static const struct mhu_mbox_pdata arm_mhu_pdata =3D {
-+	.num_pchans =3D 3,
-+	.num_doorbells =3D 1,
-+	.support_doorbells =3D false,
-+};
-+
- static int mhu_probe(struct amba_device *adev, const struct amba_id *id=
)
- {
--	int i, err;
-+	u32 cell_count;
-+	int i, err, max_chans;
- 	struct arm_mhu *mhu;
-+	struct mbox_chan *chans;
-+	struct mhu_mbox_pdata *pdata;
- 	struct device *dev =3D &adev->dev;
--	int mhu_reg[MHU_CHANS] =3D {MHU_LP_OFFSET, MHU_HP_OFFSET, MHU_SEC_OFFS=
ET};
-+	struct device_node *np =3D dev->of_node;
-+	int mhu_reg[MHU_NUM_PCHANS] =3D {
-+		MHU_LP_OFFSET, MHU_HP_OFFSET, MHU_SEC_OFFSET,
-+	};
-+
-+	err =3D of_property_read_u32(np, "#mbox-cells", &cell_count);
-+	if (err) {
-+		dev_err(dev, "failed to read #mbox-cells in %s\n",
-+			np->full_name);
-+		return err;
-+	}
-+
-+	if (cell_count =3D=3D 1) {
-+		max_chans =3D MHU_NUM_PCHANS;
-+		pdata =3D (struct mhu_mbox_pdata *)&arm_mhu_pdata;
-+	} else {
-+		dev_err(dev, "incorrect value of #mbox-cells in %s\n",
-+			np->full_name);
-+		return -EINVAL;
-+	}
-+
-+	if (pdata->num_pchans > MHU_NUM_PCHANS) {
-+		dev_err(dev, "Number of physical channel can't exceed %d\n",
-+			MHU_NUM_PCHANS);
-+		return -EINVAL;
-+	}
-=20
--	/* Allocate memory for device */
- 	mhu =3D devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
- 	if (!mhu)
- 		return -ENOMEM;
-@@ -107,14 +265,22 @@ static int mhu_probe(struct amba_device *adev, con=
st struct amba_id *id)
- 		return PTR_ERR(mhu->base);
- 	}
-=20
-+	chans =3D devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
-+	if (!chans)
-+		return -ENOMEM;
-+
-+	dev->platform_data =3D pdata;
-+
-+	mhu->dev =3D dev;
- 	mhu->mbox.dev =3D dev;
--	mhu->mbox.chans =3D &mhu->chan[0];
--	mhu->mbox.num_chans =3D MHU_CHANS;
-+	mhu->mbox.chans =3D chans;
-+	mhu->mbox.num_chans =3D max_chans;
- 	mhu->mbox.ops =3D &mhu_ops;
- 	mhu->mbox.txdone_irq =3D false;
- 	mhu->mbox.txdone_poll =3D true;
- 	mhu->mbox.txpoll_period =3D 1;
-=20
-+	mhu->mbox.of_xlate =3D mhu_mbox_xlate;
- 	amba_set_drvdata(adev, mhu);
-=20
- 	err =3D devm_mbox_controller_register(dev, &mhu->mbox);
-@@ -123,7 +289,7 @@ static int mhu_probe(struct amba_device *adev, const=
 struct amba_id *id)
- 		return err;
- 	}
-=20
--	for (i =3D 0; i < MHU_CHANS; i++) {
-+	for (i =3D 0; i < pdata->num_pchans; i++) {
- 		int irq =3D mhu->mlink[i].irq =3D adev->irq[i];
-=20
- 		if (irq <=3D 0) {
-@@ -131,13 +297,12 @@ static int mhu_probe(struct amba_device *adev, con=
st struct amba_id *id)
- 			continue;
- 		}
-=20
--		mhu->chan[i].con_priv =3D &mhu->mlink[i];
- 		mhu->mlink[i].rx_reg =3D mhu->base + mhu_reg[i];
- 		mhu->mlink[i].tx_reg =3D mhu->mlink[i].rx_reg + TX_REG_OFFSET;
-=20
- 		err =3D devm_request_threaded_irq(dev, irq, NULL,
- 						mhu_rx_interrupt, IRQF_ONESHOT,
--						"mhu_link", &mhu->chan[i]);
-+						"mhu_link", mhu);
- 		if (err) {
- 			dev_err(dev, "Can't claim IRQ %d\n", irq);
- 			mbox_controller_unregister(&mhu->mbox);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-ar=
m_mhu-add-full-support-for-the-doorbells.patch b/meta-arm-bsp/recipes-ker=
nel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbe=
lls.patch
deleted file mode 100644
index 8afed214..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-a=
dd-full-support-for-the-doorbells.patch
+++ /dev/null
@@ -1,224 +0,0 @@
-From eed2fcf3a44c672805daf1bb2940744f4eff9145 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Tue, 2 May 2017 12:07:28 +0100
-Subject: [PATCH 5/8] mailbox: arm_mhu: add full support for the doorbell=
s
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970349]
-
-We now have the basic infrastructure and binding to support doorbells
-on ARM MHU controller.
-
-This patch adds all the necessary mailbox operations to add support for
-the doorbells. Maximum of 32 doorbells are supported on each physical
-channel, however the total number of doorbells is restricted to 20
-in order to save memory. It can increased if required in future.
-
-Cc: Jassi Brar <jaswinder.singh@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
----
- drivers/mailbox/arm_mhu.c | 129 ++++++++++++++++++++++++++++++++++++--
- 1 file changed, 125 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
-index 24999bb9dc57..5bdc494dc4ef 100644
---- a/drivers/mailbox/arm_mhu.c
-+++ b/drivers/mailbox/arm_mhu.c
-@@ -10,6 +10,7 @@
- #include <linux/err.h>
- #include <linux/interrupt.h>
- #include <linux/io.h>
-+#include <linux/kernel.h>
- #include <linux/mailbox_controller.h>
- #include <linux/module.h>
- #include <linux/of.h>
-@@ -86,6 +87,14 @@ mhu_mbox_to_channel(struct mbox_controller *mbox,
- 	return NULL;
- }
-=20
-+static void mhu_mbox_clear_irq(struct mbox_chan *chan)
-+{
-+	struct mhu_channel *chan_info =3D chan->con_priv;
-+	void __iomem *base =3D chan_info->mhu->mlink[chan_info->pchan].rx_reg;
-+
-+	writel_relaxed(BIT(chan_info->doorbell), base + INTR_CLR_OFS);
-+}
-+
- static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int =
irq)
- {
- 	unsigned int pchan;
-@@ -97,6 +106,95 @@ static unsigned int mhu_mbox_irq_to_pchan_num(struct=
 arm_mhu *mhu, int irq)
- 	return pchan;
- }
-=20
-+static struct mbox_chan *mhu_mbox_irq_to_channel(struct arm_mhu *mhu,
-+						 unsigned int pchan)
-+{
-+	unsigned long bits;
-+	unsigned int doorbell;
-+	struct mbox_chan *chan =3D NULL;
-+	struct mbox_controller *mbox =3D &mhu->mbox;
-+	void __iomem *base =3D mhu->mlink[pchan].rx_reg;
-+
-+	bits =3D readl_relaxed(base + INTR_STAT_OFS);
-+	if (!bits)
-+		/* No IRQs fired in specified physical channel */
-+		return NULL;
-+
-+	/* An IRQ has fired, find the associated channel */
-+	for (doorbell =3D 0; bits; doorbell++) {
-+		if (!test_and_clear_bit(doorbell, &bits))
-+			continue;
-+
-+		chan =3D mhu_mbox_to_channel(mbox, pchan, doorbell);
-+		if (chan)
-+			break;
-+	}
-+
-+	return chan;
-+}
-+
-+static irqreturn_t mhu_mbox_thread_handler(int irq, void *data)
-+{
-+	struct mbox_chan *chan;
-+	struct arm_mhu *mhu =3D data;
-+	unsigned int pchan =3D mhu_mbox_irq_to_pchan_num(mhu, irq);
-+
-+	while (NULL !=3D (chan =3D mhu_mbox_irq_to_channel(mhu, pchan))) {
-+		mbox_chan_received_data(chan, NULL);
-+		mhu_mbox_clear_irq(chan);
-+	}
-+
-+	return IRQ_HANDLED;
-+}
-+
-+static bool mhu_doorbell_last_tx_done(struct mbox_chan *chan)
-+{
-+	struct mhu_channel *chan_info =3D chan->con_priv;
-+	void __iomem *base =3D chan_info->mhu->mlink[chan_info->pchan].tx_reg;
-+
-+	if (readl_relaxed(base + INTR_STAT_OFS) & BIT(chan_info->doorbell))
-+		return false;
-+
-+	return true;
-+}
-+
-+static int mhu_doorbell_send_signal(struct mbox_chan *chan)
-+{
-+	struct mhu_channel *chan_info =3D chan->con_priv;
-+	void __iomem *base =3D chan_info->mhu->mlink[chan_info->pchan].tx_reg;
-+
-+	/* Send event to co-processor */
-+	writel_relaxed(BIT(chan_info->doorbell), base + INTR_SET_OFS);
-+
-+	return 0;
-+}
-+
-+static int mhu_doorbell_startup(struct mbox_chan *chan)
-+{
-+	mhu_mbox_clear_irq(chan);
-+	return 0;
-+}
-+
-+static void mhu_doorbell_shutdown(struct mbox_chan *chan)
-+{
-+	struct mhu_channel *chan_info =3D chan->con_priv;
-+	struct mbox_controller *mbox =3D &chan_info->mhu->mbox;
-+	int i;
-+
-+	for (i =3D 0; i < mbox->num_chans; i++)
-+		if (chan =3D=3D &mbox->chans[i])
-+			break;
-+
-+	if (mbox->num_chans =3D=3D i) {
-+		dev_warn(mbox->dev, "Request to free non-existent channel\n");
-+		return;
-+	}
-+
-+	/* Reset channel */
-+	mhu_mbox_clear_irq(chan);
-+	chan->con_priv =3D NULL;
-+}
-+
- static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
- 					const struct of_phandle_args *spec)
- {
-@@ -214,16 +312,30 @@ static const struct mbox_chan_ops mhu_ops =3D {
- 	.last_tx_done =3D mhu_last_tx_done,
- };
-=20
-+static const struct mbox_chan_ops mhu_doorbell_ops =3D {
-+	.send_signal =3D mhu_doorbell_send_signal,
-+	.startup =3D mhu_doorbell_startup,
-+	.shutdown =3D mhu_doorbell_shutdown,
-+	.last_tx_done =3D mhu_doorbell_last_tx_done,
-+};
-+
- static const struct mhu_mbox_pdata arm_mhu_pdata =3D {
- 	.num_pchans =3D 3,
- 	.num_doorbells =3D 1,
- 	.support_doorbells =3D false,
- };
-=20
-+static const struct mhu_mbox_pdata arm_mhu_doorbell_pdata =3D {
-+	.num_pchans =3D 2,	/* Secure can't be used */
-+	.num_doorbells =3D 32,
-+	.support_doorbells =3D true,
-+};
-+
- static int mhu_probe(struct amba_device *adev, const struct amba_id *id=
)
- {
- 	u32 cell_count;
- 	int i, err, max_chans;
-+	irq_handler_t handler;
- 	struct arm_mhu *mhu;
- 	struct mbox_chan *chans;
- 	struct mhu_mbox_pdata *pdata;
-@@ -243,6 +355,9 @@ static int mhu_probe(struct amba_device *adev, const=
 struct amba_id *id)
- 	if (cell_count =3D=3D 1) {
- 		max_chans =3D MHU_NUM_PCHANS;
- 		pdata =3D (struct mhu_mbox_pdata *)&arm_mhu_pdata;
-+	} else if (cell_count =3D=3D 2) {
-+		max_chans =3D MHU_CHAN_MAX;
-+		pdata =3D (struct mhu_mbox_pdata *)&arm_mhu_doorbell_pdata;
- 	} else {
- 		dev_err(dev, "incorrect value of #mbox-cells in %s\n",
- 			np->full_name);
-@@ -275,7 +390,6 @@ static int mhu_probe(struct amba_device *adev, const=
 struct amba_id *id)
- 	mhu->mbox.dev =3D dev;
- 	mhu->mbox.chans =3D chans;
- 	mhu->mbox.num_chans =3D max_chans;
--	mhu->mbox.ops =3D &mhu_ops;
- 	mhu->mbox.txdone_irq =3D false;
- 	mhu->mbox.txdone_poll =3D true;
- 	mhu->mbox.txpoll_period =3D 1;
-@@ -283,6 +397,14 @@ static int mhu_probe(struct amba_device *adev, cons=
t struct amba_id *id)
- 	mhu->mbox.of_xlate =3D mhu_mbox_xlate;
- 	amba_set_drvdata(adev, mhu);
-=20
-+	if (pdata->support_doorbells) {
-+		mhu->mbox.ops =3D &mhu_doorbell_ops;
-+		handler =3D mhu_mbox_thread_handler;
-+	} else {
-+		mhu->mbox.ops =3D &mhu_ops;
-+		handler =3D mhu_rx_interrupt;
-+	}
-+
- 	err =3D devm_mbox_controller_register(dev, &mhu->mbox);
- 	if (err) {
- 		dev_err(dev, "Failed to register mailboxes %d\n", err);
-@@ -300,9 +422,8 @@ static int mhu_probe(struct amba_device *adev, const=
 struct amba_id *id)
- 		mhu->mlink[i].rx_reg =3D mhu->base + mhu_reg[i];
- 		mhu->mlink[i].tx_reg =3D mhu->mlink[i].rx_reg + TX_REG_OFFSET;
-=20
--		err =3D devm_request_threaded_irq(dev, irq, NULL,
--						mhu_rx_interrupt, IRQF_ONESHOT,
--						"mhu_link", mhu);
-+		err =3D devm_request_threaded_irq(dev, irq, NULL, handler,
-+						IRQF_ONESHOT, "mhu_link", mhu);
- 		if (err) {
- 			dev_err(dev, "Can't claim IRQ %d\n", irq);
- 			mbox_controller_unregister(&mhu->mbox);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-ar=
m_mhu-add-support-to-read-and-record-mbox-.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-recor=
d-mbox-.patch
deleted file mode 100644
index 37494999..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-a=
dd-support-to-read-and-record-mbox-.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From af51d09655236217ffa349ac776a4e16890e1bef Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Tue, 2 May 2017 12:08:36 +0100
-Subject: [PATCH 6/8] mailbox: arm_mhu: add support to read and record
- mbox-name
-
-Upstream-Status: Submitted [https://lore.kernel.org/patchwork/patch/7916=
92]
-
-It's sometimes useful to identify the mailbox controller with the name
-as specified in the devicetree via mbox-name property especially in a
-system with multiple controllers.
-
-This patch adds support to read and record the mailbox controller name.
-
-Cc: Jassi Brar <jaswinder.singh@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
----
- drivers/mailbox/arm_mhu.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
-index 5bdc494dc4ef..21259b252004 100644
---- a/drivers/mailbox/arm_mhu.c
-+++ b/drivers/mailbox/arm_mhu.c
-@@ -39,6 +39,7 @@ struct arm_mhu {
- 	struct mhu_link mlink[MHU_NUM_PCHANS];
- 	struct mbox_controller mbox;
- 	struct device *dev;
-+	const char *name;
- };
-=20
- /**
-@@ -249,8 +250,8 @@ static struct mbox_chan *mhu_mbox_xlate(struct mbox_=
controller *mbox,
-=20
- 	chan->con_priv =3D chan_info;
-=20
--	dev_dbg(mbox->dev, "mbox: created channel phys: %d doorbell: %d\n",
--		pchan, doorbell);
-+	dev_dbg(mbox->dev, "mbox: %s, created channel phys: %d doorbell: %d\n"=
,
-+		mhu->name, pchan, doorbell);
-=20
- 	return chan;
- }
-@@ -380,6 +381,10 @@ static int mhu_probe(struct amba_device *adev, cons=
t struct amba_id *id)
- 		return PTR_ERR(mhu->base);
- 	}
-=20
-+	err =3D of_property_read_string(np, "mbox-name", &mhu->name);
-+	if (err)
-+		mhu->name =3D np->full_name;
-+
- 	chans =3D devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
- 	if (!chans)
- 		return -ENOMEM;
-@@ -431,7 +436,7 @@ static int mhu_probe(struct amba_device *adev, const=
 struct amba_id *id)
- 		}
- 	}
-=20
--	dev_info(dev, "ARM MHU Mailbox registered\n");
-+	dev_info(dev, "%s mailbox registered\n", mhu->name);
- 	return 0;
- }
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defc=
onfig-add-all-SCMI-related-configs.patch b/meta-arm-bsp/recipes-kernel/li=
nux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch
deleted file mode 100644
index 2a60e681..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-a=
dd-all-SCMI-related-configs.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 40cecdd2a60706782bc84b6cecf44f3701dbec33 Mon Sep 17 00:00:00 2001
-From: Damodar Santhapuri <damodar.santhapuri@arm.com>
-Date: Tue, 21 Jul 2020 16:17:11 +0530
-Subject: [PATCH 7/8] arm64: defconfig: add all SCMI related configs
-
-Upstream-Status: Pending [yet to submit]
-
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- arch/arm64/configs/defconfig | 17 ++++++++++++++---
- 1 file changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index c9a867ac32d4..8322b217d1a1 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -75,18 +75,20 @@ CONFIG_ARM_CPUIDLE=3Dy
- CONFIG_ARM_PSCI_CPUIDLE=3Dy
- CONFIG_CPU_FREQ=3Dy
- CONFIG_CPU_FREQ_STAT=3Dy
--CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
-+CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
- CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
- CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
--CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
-+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
- CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
- CONFIG_CPUFREQ_DT=3Dy
- CONFIG_ACPI_CPPC_CPUFREQ=3Dm
- CONFIG_ARM_ARMADA_37XX_CPUFREQ=3Dy
- CONFIG_ARM_SCPI_CPUFREQ=3Dy
- CONFIG_ARM_IMX_CPUFREQ_DT=3Dm
-+CONFIG_ARM_SCMI_CPUFREQ=3Dy
- CONFIG_ARM_RASPBERRYPI_CPUFREQ=3Dm
- CONFIG_ARM_TEGRA186_CPUFREQ=3Dy
-+CONFIG_ARM_SCMI_PROTOCOL=3Dy
- CONFIG_ARM_SCPI_PROTOCOL=3Dy
- CONFIG_RASPBERRYPI_FIRMWARE=3Dy
- CONFIG_INTEL_STRATIX10_SERVICE=3Dy
-@@ -430,6 +432,7 @@ CONFIG_POWER_RESET_SYSCON=3Dy
- CONFIG_SYSCON_REBOOT_MODE=3Dy
- CONFIG_BATTERY_SBS=3Dm
- CONFIG_BATTERY_BQ27XXX=3Dy
-+CONFIG_SENSORS_ARM_SCMI=3Dy
- CONFIG_SENSORS_ARM_SCPI=3Dy
- CONFIG_SENSORS_LM90=3Dm
- CONFIG_SENSORS_PWM_FAN=3Dm
-@@ -686,6 +689,7 @@ CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
- CONFIG_CROS_EC_I2C=3Dy
- CONFIG_CROS_EC_SPI=3Dy
- CONFIG_COMMON_CLK_RK808=3Dy
-+CONFIG_COMMON_CLK_SCMI=3Dy
- CONFIG_COMMON_CLK_SCPI=3Dy
- CONFIG_COMMON_CLK_CS2000_CP=3Dy
- CONFIG_COMMON_CLK_S2MPS11=3Dy
-@@ -851,11 +855,18 @@ CONFIG_CRYPTO_ANSI_CPRNG=3Dy
- CONFIG_DMA_CMA=3Dy
- CONFIG_CMA_SIZE_MBYTES=3D32
- CONFIG_PRINTK_TIME=3Dy
-+CONFIG_DYNAMIC_DEBUG=3Dy
- CONFIG_DEBUG_INFO=3Dy
- CONFIG_DEBUG_FS=3Dy
- CONFIG_MAGIC_SYSRQ=3Dy
- CONFIG_DEBUG_KERNEL=3Dy
-+CONFIG_SOFTLOCKUP_DETECTOR=3Dy
-+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
-+CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
-+CONFIG_WQ_WATCHDOG=3Dy
-+CONFIG_PANIC_ON_OOPS=3Dy
- # CONFIG_SCHED_DEBUG is not set
- # CONFIG_DEBUG_PREEMPT is not set
--# CONFIG_FTRACE is not set
-+CONFIG_FUNCTION_TRACER=3Dy
-+CONFIG_FUNCTION_PROFILER=3Dy
- CONFIG_MEMTEST=3Dy
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-=
juno-add-mhu-doorbell-support-and-scmi-dev.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/juno-dts-mhu-doorbell.patch
similarity index 78%
rename from meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-j=
uno-add-mhu-doorbell-support-and-scmi-dev.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorb=
ell.patch
index 146ecb1a..81f641c4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-ad=
d-mhu-doorbell-support-and-scmi-dev.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorbell.=
patch
@@ -1,26 +1,30 @@
-From 037f26919a5f3e1050395396de729dc42cab98ba Mon Sep 17 00:00:00 2001
+Add MHU doorbell support and SCMI device nodes to the Juno DeviceTree.
+
+Patch taken from https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.=
holla/linux.git/log/?h=3Dscmi_dt_defconfig
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 821ffd8e5dc4d2fb2716d5fb912b343b932e1e77 Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Thu, 20 Apr 2017 11:58:01 +0100
-Subject: [PATCH 8/8] arm64: dts: juno: add mhu doorbell support and scmi
- device nodes
-
-Upstream-Status: Pending [yet to submit]
+Subject: [PATCH] arm64: dts: juno: add mhu doorbell support and scmi dev=
ice
+ nodes
=20
 Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
 ---
- arch/arm64/boot/dts/arm/juno-base.dtsi    | 129 ++++++++++++----------
+ arch/arm64/boot/dts/arm/juno-base.dtsi    | 139 ++++++++++++----------
  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |   6 +-
  arch/arm64/boot/dts/arm/juno-r1.dts       |  12 +-
  arch/arm64/boot/dts/arm/juno-r2.dts       |  12 +-
  arch/arm64/boot/dts/arm/juno.dts          |  12 +-
- 5 files changed, 91 insertions(+), 80 deletions(-)
+ 5 files changed, 96 insertions(+), 85 deletions(-)
=20
 diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dt=
s/arm/juno-base.dtsi
-index c47f76b01c4b..6a5be4a72746 100644
+index 6288e104a089..36844f7d861e 100644
 --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
 +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
-@@ -23,13 +23,14 @@
+@@ -23,11 +23,12 @@ frame@2a830000 {
  	};
 =20
  	mailbox: mhu@2b1f0000 {
@@ -29,15 +33,22 @@ index c47f76b01c4b..6a5be4a72746 100644
  		reg =3D <0x0 0x2b1f0000 0x0 0x1000>;
  		interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
  			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
- 		interrupt-names =3D "mhu_lpri_rx",
- 				  "mhu_hpri_rx";
 -		#mbox-cells =3D <1>;
 +		#mbox-cells =3D <2>;
 +		mbox-name =3D "ARM-MHU";
  		clocks =3D <&soc_refclk100mhz>;
  		clock-names =3D "apb_pclk";
  	};
-@@ -53,7 +54,7 @@
+@@ -39,7 +40,7 @@ smmu_gpu: iommu@2b400000 {
+ 			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+ 		#iommu-cells =3D <1>;
+ 		#global-interrupts =3D <1>;
+-		power-domains =3D <&scpi_devpd 1>;
++		power-domains =3D <&scmi_devpd 9>;
+ 		dma-coherent;
+ 		status =3D "disabled";
+ 	};
+@@ -63,7 +64,7 @@ smmu_etr: iommu@2b600000 {
  		#iommu-cells =3D <1>;
  		#global-interrupts =3D <1>;
  		dma-coherent;
@@ -46,7 +57,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  	};
 =20
  	gic: interrupt-controller@2c010000 {
-@@ -113,7 +114,7 @@
+@@ -123,7 +124,7 @@ etf@20010000 { /* etf0 */
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -55,7 +66,7 @@ index c47f76b01c4b..6a5be4a72746 100644
 =20
  		in-ports {
  			port {
-@@ -137,7 +138,7 @@
+@@ -147,7 +148,7 @@ tpiu@20030000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -64,7 +75,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		in-ports {
  			port {
  				tpiu_in_port: endpoint {
-@@ -154,7 +155,7 @@
+@@ -164,7 +165,7 @@ main_funnel: funnel@20040000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -73,7 +84,7 @@ index c47f76b01c4b..6a5be4a72746 100644
 =20
  		out-ports {
  			port {
-@@ -191,7 +192,7 @@
+@@ -201,7 +202,7 @@ etr@20070000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -82,7 +93,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		arm,scatter-gather;
  		in-ports {
  			port {
-@@ -210,7 +211,7 @@
+@@ -220,7 +221,7 @@ stm@20100000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -91,7 +102,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				stm_out_port: endpoint {
-@@ -225,7 +226,7 @@
+@@ -235,7 +236,7 @@ replicator@20120000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -100,7 +111,7 @@ index c47f76b01c4b..6a5be4a72746 100644
 =20
  		out-ports {
  			#address-cells =3D <1>;
-@@ -260,7 +261,7 @@
+@@ -270,7 +271,7 @@ cpu_debug0: cpu-debug@22010000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -109,7 +120,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  	};
 =20
  	etm0: etm@22040000 {
-@@ -269,7 +270,7 @@
+@@ -279,7 +280,7 @@ etm0: etm@22040000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -118,7 +129,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster0_etm0_out_port: endpoint {
-@@ -285,7 +286,7 @@
+@@ -295,7 +296,7 @@ funnel@220c0000 { /* cluster0 funnel */
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -127,7 +138,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster0_funnel_out_port: endpoint {
-@@ -320,7 +321,7 @@
+@@ -330,7 +331,7 @@ cpu_debug1: cpu-debug@22110000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -136,7 +147,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  	};
 =20
  	etm1: etm@22140000 {
-@@ -329,7 +330,7 @@
+@@ -339,7 +340,7 @@ etm1: etm@22140000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -145,7 +156,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster0_etm1_out_port: endpoint {
-@@ -345,7 +346,7 @@
+@@ -355,7 +356,7 @@ cpu_debug2: cpu-debug@23010000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -154,7 +165,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  	};
 =20
  	etm2: etm@23040000 {
-@@ -354,7 +355,7 @@
+@@ -364,7 +365,7 @@ etm2: etm@23040000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -163,7 +174,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster1_etm0_out_port: endpoint {
-@@ -370,7 +371,7 @@
+@@ -380,7 +381,7 @@ funnel@230c0000 { /* cluster1 funnel */
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -172,7 +183,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster1_funnel_out_port: endpoint {
-@@ -417,7 +418,7 @@
+@@ -427,7 +428,7 @@ cpu_debug3: cpu-debug@23110000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -181,7 +192,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  	};
 =20
  	etm3: etm@23140000 {
-@@ -426,7 +427,7 @@
+@@ -436,7 +437,7 @@ etm3: etm@23140000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -190,7 +201,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster1_etm1_out_port: endpoint {
-@@ -442,7 +443,7 @@
+@@ -452,7 +453,7 @@ cpu_debug4: cpu-debug@23210000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -199,7 +210,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  	};
 =20
  	etm4: etm@23240000 {
-@@ -451,7 +452,7 @@
+@@ -461,7 +462,7 @@ etm4: etm@23240000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -208,7 +219,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster1_etm2_out_port: endpoint {
-@@ -467,7 +468,7 @@
+@@ -477,7 +478,7 @@ cpu_debug5: cpu-debug@23310000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -217,7 +228,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  	};
 =20
  	etm5: etm@23340000 {
-@@ -476,7 +477,7 @@
+@@ -486,7 +487,7 @@ etm5: etm@23340000 {
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -226,36 +237,49 @@ index c47f76b01c4b..6a5be4a72746 100644
  		out-ports {
  			port {
  				cluster1_etm3_out_port: endpoint {
-@@ -494,14 +495,24 @@
+@@ -503,8 +504,8 @@ gpu: gpu@2d000000 {
+ 			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+ 			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+ 		interrupt-names =3D "job", "mmu", "gpu";
+-		clocks =3D <&scpi_dvfs 2>;
+-		power-domains =3D <&scpi_devpd 1>;
++		clocks =3D <&scmi_dvfs 2>;
++		power-domains =3D <&scmi_devpd 9>;
+ 		dma-coherent;
+ 		/* The SMMU is only really of interest to bare-metal hypervisors */
+ 		/* iommus =3D <&smmu_gpu 0>; */
+@@ -519,14 +520,24 @@ sram: sram@2e000000 {
  		#size-cells =3D <1>;
  		ranges =3D <0 0x0 0x2e000000 0x8000>;
 =20
--		cpu_scp_lpri: scp-shmem@0 {
-+		cpu_scp_lpri0: scp-shmem@0 {
- 			compatible =3D "arm,juno-scp-shmem";
+-		cpu_scp_lpri: scp-sram@0 {
+-			compatible =3D "arm,juno-scp-shmem";
 -			reg =3D <0x0 0x200>;
++		cpu_scp_lpri0: scp-sram@0 {
++			compatible =3D "arm,scmi-shmem";
 +			reg =3D <0x0 0x80>;
  		};
 =20
--		cpu_scp_hpri: scp-shmem@200 {
-+		cpu_scp_lpri1: scp-shmem@80 {
- 			compatible =3D "arm,juno-scp-shmem";
+-		cpu_scp_hpri: scp-sram@200 {
+-			compatible =3D "arm,juno-scp-shmem";
 -			reg =3D <0x200 0x200>;
++		cpu_scp_lpri1: scp-sram@80 {
++			compatible =3D "arm,scmi-shmem";
 +			reg =3D <0x80 0x80>;
 +		};
 +
-+		cpu_scp_hpri0: scp-shmem@100 {
-+			compatible =3D "arm,juno-scp-shmem";
++		cpu_scp_hpri0: scp-sram@100 {
++			compatible =3D "arm,scmi-shmem";
 +			reg =3D <0x100 0x80>;
 +		};
 +
-+		cpu_scp_hpri1: scp-shmem@180 {
-+			compatible =3D "arm,juno-scp-shmem";
++		cpu_scp_hpri1: scp-sram@180 {
++			compatible =3D "arm,scmi-shmem";
 +			reg =3D <0x180 0x80>;
  		};
  	};
 =20
-@@ -529,37 +540,37 @@
+@@ -558,37 +569,37 @@ pcie_ctlr: pcie@40000000 {
  		iommu-map =3D <0x0 &smmu_pcie 0x0 0x1>;
  	};
 =20
@@ -279,7 +303,7 @@ index c47f76b01c4b..6a5be4a72746 100644
 +				#power-domain-cells =3D <1>;
 +			};
 =20
--			scpi_dvfs: scpi-dvfs {
+-			scpi_dvfs: clocks-0 {
 -				compatible =3D "arm,scpi-dvfs-clocks";
 +			scmi_dvfs: protocol@13 {
 +				reg =3D <0x13>;
@@ -290,7 +314,7 @@ index c47f76b01c4b..6a5be4a72746 100644
 +				mboxes =3D <&mailbox 1 0 &mailbox 1 1>;
 +				shmem =3D <&cpu_scp_hpri0 &cpu_scp_hpri1>;
  			};
--			scpi_clk: scpi-clk {
+-			scpi_clk: clocks-1 {
 -				compatible =3D "arm,scpi-variable-clocks";
 +
 +			scmi_clk: protocol@14 {
@@ -301,7 +325,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  			};
 -		};
 =20
--		scpi_devpd: scpi-power-domains {
+-		scpi_devpd: power-controller {
 -			compatible =3D "arm,scpi-power-domains";
 -			num-domains =3D <2>;
 -			#power-domain-cells =3D <1>;
@@ -317,7 +341,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		};
  	};
 =20
-@@ -567,40 +578,40 @@
+@@ -596,40 +607,40 @@ thermal-zones {
  		pmic {
  			polling-delay =3D <1000>;
  			polling-delay-passive =3D <100>;
@@ -364,7 +388,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  			status =3D "disabled";
  		};
  	};
-@@ -677,7 +688,7 @@
+@@ -705,7 +716,7 @@ hdlcd@7ff50000 {
  		reg =3D <0 0x7ff50000 0 0x1000>;
  		interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
  		iommus =3D <&smmu_hdlcd1 0>;
@@ -373,7 +397,7 @@ index c47f76b01c4b..6a5be4a72746 100644
  		clock-names =3D "pxlclk";
 =20
  		port {
-@@ -692,7 +703,7 @@
+@@ -720,7 +731,7 @@ hdlcd@7ff60000 {
  		reg =3D <0 0x7ff60000 0 0x1000>;
  		interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
  		iommus =3D <&smmu_hdlcd0 0>;
@@ -386,7 +410,7 @@ diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dts=
i b/arch/arm64/boot/dts/arm
 index eda3d9e18af6..e6ecb0dfcbcd 100644
 --- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
 +++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
-@@ -6,7 +6,7 @@
+@@ -6,7 +6,7 @@ funnel@20130000 { /* cssys1 */
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -395,7 +419,7 @@ index eda3d9e18af6..e6ecb0dfcbcd 100644
  		out-ports {
  			port {
  				csys1_funnel_out_port: endpoint {
-@@ -29,7 +29,7 @@
+@@ -29,7 +29,7 @@ etf@20140000 { /* etf1 */
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -404,7 +428,7 @@ index eda3d9e18af6..e6ecb0dfcbcd 100644
  		in-ports {
  			port {
  				etf1_in_port: endpoint {
-@@ -52,7 +52,7 @@
+@@ -52,7 +52,7 @@ funnel@20150000 { /* cssys2 */
 =20
  		clocks =3D <&soc_smc50mhz>;
  		clock-names =3D "apb_pclk";
@@ -414,10 +438,10 @@ index eda3d9e18af6..e6ecb0dfcbcd 100644
  			port {
  				csys2_funnel_out_port: endpoint {
 diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/a=
rm/juno-r1.dts
-index 5f290090b0cf..89c2f86890b2 100644
+index 0e24e29eb9b1..fee67943f4d5 100644
 --- a/arch/arm64/boot/dts/arm/juno-r1.dts
 +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
-@@ -96,7 +96,7 @@
+@@ -96,7 +96,7 @@ A57_0: cpu@0 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <256>;
  			next-level-cache =3D <&A57_L2>;
@@ -426,7 +450,7 @@ index 5f290090b0cf..89c2f86890b2 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <1024>;
  		};
-@@ -113,7 +113,7 @@
+@@ -113,7 +113,7 @@ A57_1: cpu@1 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <256>;
  			next-level-cache =3D <&A57_L2>;
@@ -435,7 +459,7 @@ index 5f290090b0cf..89c2f86890b2 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <1024>;
  		};
-@@ -130,7 +130,7 @@
+@@ -130,7 +130,7 @@ A53_0: cpu@100 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -444,7 +468,7 @@ index 5f290090b0cf..89c2f86890b2 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <578>;
  		};
-@@ -147,7 +147,7 @@
+@@ -147,7 +147,7 @@ A53_1: cpu@101 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -453,7 +477,7 @@ index 5f290090b0cf..89c2f86890b2 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <578>;
  		};
-@@ -164,7 +164,7 @@
+@@ -164,7 +164,7 @@ A53_2: cpu@102 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -462,7 +486,7 @@ index 5f290090b0cf..89c2f86890b2 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <578>;
  		};
-@@ -181,7 +181,7 @@
+@@ -181,7 +181,7 @@ A53_3: cpu@103 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -472,10 +496,10 @@ index 5f290090b0cf..89c2f86890b2 100644
  			capacity-dmips-mhz =3D <578>;
  		};
 diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/a=
rm/juno-r2.dts
-index 305300dd521c..b1c304ce0181 100644
+index e609420ce3e4..7792626eb29e 100644
 --- a/arch/arm64/boot/dts/arm/juno-r2.dts
 +++ b/arch/arm64/boot/dts/arm/juno-r2.dts
-@@ -96,7 +96,7 @@
+@@ -96,7 +96,7 @@ A72_0: cpu@0 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <256>;
  			next-level-cache =3D <&A72_L2>;
@@ -484,7 +508,7 @@ index 305300dd521c..b1c304ce0181 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <1024>;
  			dynamic-power-coefficient =3D <450>;
-@@ -114,7 +114,7 @@
+@@ -114,7 +114,7 @@ A72_1: cpu@1 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <256>;
  			next-level-cache =3D <&A72_L2>;
@@ -493,7 +517,7 @@ index 305300dd521c..b1c304ce0181 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <1024>;
  			dynamic-power-coefficient =3D <450>;
-@@ -132,7 +132,7 @@
+@@ -132,7 +132,7 @@ A53_0: cpu@100 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -502,7 +526,7 @@ index 305300dd521c..b1c304ce0181 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <485>;
  			dynamic-power-coefficient =3D <140>;
-@@ -150,7 +150,7 @@
+@@ -150,7 +150,7 @@ A53_1: cpu@101 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -511,7 +535,7 @@ index 305300dd521c..b1c304ce0181 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <485>;
  			dynamic-power-coefficient =3D <140>;
-@@ -168,7 +168,7 @@
+@@ -168,7 +168,7 @@ A53_2: cpu@102 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -520,7 +544,7 @@ index 305300dd521c..b1c304ce0181 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <485>;
  			dynamic-power-coefficient =3D <140>;
-@@ -186,7 +186,7 @@
+@@ -186,7 +186,7 @@ A53_3: cpu@103 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -533,7 +557,7 @@ diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/=
arm64/boot/dts/arm/juno.dts
 index f00cffbd032c..a28316c65c1b 100644
 --- a/arch/arm64/boot/dts/arm/juno.dts
 +++ b/arch/arm64/boot/dts/arm/juno.dts
-@@ -95,7 +95,7 @@
+@@ -95,7 +95,7 @@ A57_0: cpu@0 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <256>;
  			next-level-cache =3D <&A57_L2>;
@@ -542,7 +566,7 @@ index f00cffbd032c..a28316c65c1b 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <1024>;
  			dynamic-power-coefficient =3D <530>;
-@@ -113,7 +113,7 @@
+@@ -113,7 +113,7 @@ A57_1: cpu@1 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <256>;
  			next-level-cache =3D <&A57_L2>;
@@ -551,7 +575,7 @@ index f00cffbd032c..a28316c65c1b 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <1024>;
  			dynamic-power-coefficient =3D <530>;
-@@ -131,7 +131,7 @@
+@@ -131,7 +131,7 @@ A53_0: cpu@100 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -560,7 +584,7 @@ index f00cffbd032c..a28316c65c1b 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <578>;
  			dynamic-power-coefficient =3D <140>;
-@@ -149,7 +149,7 @@
+@@ -149,7 +149,7 @@ A53_1: cpu@101 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -569,7 +593,7 @@ index f00cffbd032c..a28316c65c1b 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <578>;
  			dynamic-power-coefficient =3D <140>;
-@@ -167,7 +167,7 @@
+@@ -167,7 +167,7 @@ A53_2: cpu@102 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -578,7 +602,7 @@ index f00cffbd032c..a28316c65c1b 100644
  			cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
  			capacity-dmips-mhz =3D <578>;
  			dynamic-power-coefficient =3D <140>;
-@@ -185,7 +185,7 @@
+@@ -185,7 +185,7 @@ A53_3: cpu@103 {
  			d-cache-line-size =3D <64>;
  			d-cache-sets =3D <128>;
  			next-level-cache =3D <&A53_L2>;
@@ -588,5 +612,5 @@ index f00cffbd032c..a28316c65c1b 100644
  			capacity-dmips-mhz =3D <578>;
  			dynamic-power-coefficient =3D <140>;
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4b395af4..8a7afb92 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -138,21 +138,8 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " file://fvp-b=
aser-aemv8r64.dts;subdir=3Dgit/a
 COMPATIBLE_MACHINE:juno =3D "juno"
 KBUILD_DEFCONFIG:juno =3D "defconfig"
 KCONFIG_MODE:juno =3D "--alldefconfig"
-#FIXME - temporarily pin kernel version to allow for juno patches to app=
ly
-KBRANCH:juno =3D "v5.4/standard/base"
-KERNEL_VERSION_SANITY_SKIP:juno =3D "1"
-SRCREV_machine:juno =3D "dd8a64a523fb714a98328441e0de72cde115a6fc"
 FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:juno =3D " \
-    file://0001-mailbox-add-support-for-doorbell-signal-mode-control.pat=
ch \
-    file://0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.pat=
ch \
-    file://0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch \
-    file://0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.pat=
ch \
-    file://0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch=
 \
-    file://0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.pat=
ch \
-    file://0007-arm64-defconfig-add-all-SCMI-related-configs.patch \
-    file://0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.pat=
ch \
-    "
+SRC_URI:append:juno =3D " file://juno-dts-mhu-doorbell.patch"
=20
 #
 # Musca B1/S2 can't run Linux
--=20
2.25.1


