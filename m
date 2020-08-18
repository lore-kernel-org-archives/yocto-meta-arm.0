Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.66564.1597758219681082285
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 06:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=0MS+2c1m;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id f19so10611094qtp.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Aug 2020 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pGX9TM3E+2dJfUFr9FRwUMTxIwXbVZZJ+64qX14vo/0=;
        b=0MS+2c1mR2QnyJ465zDy0gMXEuu5eDv3EId2oLjORPNtfYTUpD+ylqmcHgz6V6Hz4u
         FdzcXIPqX8I/W6DNtur0TgOCE6TryUBczqcBGtBBcC+u+8LcigwDXHOTQLB9ZPfCORES
         5kJN0emE2ZDGyRxpbo5/eU90R80Z+pw+/UwVGp9PrCdAB0S+Qcb9oLmfjU0hsX44oC7C
         KJGyqJfLSCfattOVHunpUUdnptg7W1iO7F65aM+kqDhTqDz8WcouZd6uwlvSVh24GvfA
         njoZvpOldgcYPx75a9CMkleZkhtbXcJ3G+HL8sKgBOwPLBksq43Emn4X7D4kH+7Ci6kp
         59rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pGX9TM3E+2dJfUFr9FRwUMTxIwXbVZZJ+64qX14vo/0=;
        b=IE03wJGQQkaLNVY3jCJo6UQNFb8q7MydxuKNyF8+Lk+wn7I+XREBDIo0Dv3QI/KxFa
         ycZiRqrxdlvWBcSoybkA92XQ9UUxh//LfmE54OqiGEgYOKyBSQxQEeI6pB/+PnQ/pzhK
         F+6ZBOZ1P90bMSyPBnepm+8ITBiCYa9JNjqdI/UppwQrHPQV9vQKWnAOlFLapRVpHIZT
         ut+Jl1W38WlplCrftwiH2Mj5tUBd1b/Z0H9RCyXL6Iwo1TjLNy8Id1eLbtR3Upjnaczv
         wBYjxolWKSlXadnDTuYJzynqmNRH60rdbyMu70ZhBTXSZJnfhXaiNXO/+R7jbn0yXjDJ
         E+Ww==
X-Gm-Message-State: AOAM531FS2T55BAsd4s7ou5JyMCeSvr5N5Q7bKZ2sU7xd5MAZZs/z2uA
	VQPqCl+MNf9FlwfREAgMoGP2pQ==
X-Google-Smtp-Source: ABdhPJwgLs7DhQRFZ1chYQS3L7l7RTfz7XwuIKxujp1RHsBPfliN+kuRtCE3p1BPn62zmvg9sGo2+g==
X-Received: by 2002:aed:3263:: with SMTP id y90mr17624253qtd.94.1597758218109;
        Tue, 18 Aug 2020 06:43:38 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d16:b387:eeae:139a])
        by smtp.gmail.com with ESMTPSA id s5sm21257881qke.120.2020.08.18.06.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 06:43:37 -0700 (PDT)
Date: Tue, 18 Aug 2020 09:43:35 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Damodar Santhapuri <damodar.santhapuri@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/juno: Move to linux-yocto 5.4
Message-ID: <20200818134334.GA9658@kudzu.us>
References: <20200814155814.6202-1-damodar.santhapuri@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200814155814.6202-1-damodar.santhapuri@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2020 at 09:28:14PM +0530, Damodar Santhapuri wrote:
> This commit includes
> 1. Move from linux-linaro-arm 4.9 to linux-yocto 5.4
> 2. MHU patches for SCMI
> 3. add patch to remove stale configs in v5.4
> 
> Observed the below error in kernel boot
> 
> [    7.177114] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
> [    7.197984] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
> [    7.201125] smsc911x 18000000.ethernet eth1: SMSC911x/921x identified at 0xffff800012a70000, IRQ: 8
> [    7.206968] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
> [    7.206978] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
> [    7.216073] arm-scmi firmware:scmi: message for 5 is not expected!
> 
> Change-Id: I4651a142bcee06ba95faa315e3caaf871f406b5a
> Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/juno.conf           |   6 +-
>  .../bsp/arm-platforms/juno/juno-board.cfg     |   2 -
>  .../bsp/arm-platforms/juno/juno-drm.cfg       |   1 -
>  .../bsp/arm-platforms/juno/juno-sound.cfg     |   1 +
>  ...ort-for-doorbell-signal-mode-control.patch |  93 +++
>  ...box-add-bindings-to-support-ARM-MHU-.patch |  98 +++
>  ..._mhu-migrate-to-threaded-irq-handler.patch | 106 ++++
>  ...re-factor-data-structure-to-add-door.patch | 338 ++++++++++
>  ...u-add-full-support-for-the-doorbells.patch | 224 +++++++
>  ...add-support-to-read-and-record-mbox-.patch |  67 ++
>  ...fconfig-add-all-SCMI-related-configs.patch |  79 +++
>  ...dd-mhu-doorbell-support-and-scmi-dev.patch | 592 ++++++++++++++++++
>  .../linux/linux-arm-platforms.inc             |  12 +
>  13 files changed, 1613 insertions(+), 6 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch
> 
> diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
> index 5f74535..50c9d2f 100644
> --- a/meta-arm-bsp/conf/machine/juno.conf
> +++ b/meta-arm-bsp/conf/machine/juno.conf
> @@ -17,9 +17,9 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
>  
>  SERIAL_CONSOLES = "115200;ttyAMA0"
>  
> -# Use kernel provided by linaro (Contains support for SCMi or HDMI)
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
> -PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
> +# Use kernel provided by yocto
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> +PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg
> index 73ea076..654efa4 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg
> @@ -31,8 +31,6 @@ CONFIG_CPU_IDLE=y
>  CONFIG_ARM_CPUIDLE=y
>  
>  CONFIG_CPU_FREQ=y
> -CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
> -CONFIG_ARM_DT_BL_CPUFREQ=y
>  CONFIG_ARM_SCPI_CPUFREQ=y
>  
>  CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg
> index fb5e855..1216297 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg
> @@ -1,5 +1,4 @@
>  CONFIG_DRM=y
> -CONFIG_DRM_ARM=y
>  CONFIG_DRM_HDLCD=y
>  CONFIG_DRM_I2C_NXP_TDA998X=y
>  CONFIG_FB=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
> index 399c77d..d3419ef 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
> @@ -2,6 +2,7 @@ CONFIG_SOUND=y
>  CONFIG_SND=y
>  CONFIG_SND_SEQUENCER=y
>  CONFIG_SND_SEQ_DUMMY=y
> +CONFIG_SND_OSSEMUL=y
>  CONFIG_SND_MIXER_OSS=y
>  CONFIG_SND_PCM_OSS=y
>  CONFIG_SND_SEQUENCER_OSS=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch
> new file mode 100644
> index 0000000..8ebaf8f
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch
> @@ -0,0 +1,93 @@
> +From e9ba9ad0a4f7084bd775f3246f553e18fbb18c4d Mon Sep 17 00:00:00 2001
> +From: Sudeep Holla <sudeep.holla@arm.com>
> +Date: Wed, 1 Nov 2017 16:15:27 +0000
> +Subject: [PATCH 1/8] mailbox: add support for doorbell/signal mode controllers
> +
> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970337]
> +
> +Some mailbox controllers are lack FIFOs or memory to transmit data.
> +They typically contains single doorbell registers to just signal the
> +remote. The actually data is transmitted/shared using some shared memory
> +which is not part of the mailbox.
> +
> +Such controllers don't need to transmit any data, they just transmit
> +the signal. In such controllers the data pointer passed to
> +mbox_send_message is passed to client via it's tx_prepare callback.
> +Controller doesn't need any data to be passed from the client.
> +
> +This patch introduce the new API send_signal to support such doorbell/
> +signal mode in mailbox controllers. This is useful to avoid another
> +layer of abstraction as typically multiple channels can be multiplexied
> +into single register.
> +
> +Cc: Jassi Brar <jassisinghbrar@gmail.com>
> +Cc: Arnd Bergmann <arnd@arndb.de>
> +Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +---
> + drivers/mailbox/mailbox.c          | 11 ++++++++++-
> + include/linux/mailbox_controller.h | 11 +++++++++++
> + 2 files changed, 21 insertions(+), 1 deletion(-)
> +
> +diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> +index 0b821a5b2db8..a1f916a6e044 100644
> +--- a/drivers/mailbox/mailbox.c
> ++++ b/drivers/mailbox/mailbox.c
> +@@ -74,7 +74,10 @@ static void msg_submit(struct mbox_chan *chan)
> + 	if (chan->cl->tx_prepare)
> + 		chan->cl->tx_prepare(chan->cl, data);
> + 	/* Try to submit a message to the MBOX controller */
> +-	err = chan->mbox->ops->send_data(chan, data);
> ++	if (chan->mbox->ops->send_data)
> ++		err = chan->mbox->ops->send_data(chan, data);
> ++	else
> ++		err = chan->mbox->ops->send_signal(chan);
> + 	if (!err) {
> + 		chan->active_req = data;
> + 		chan->msg_count--;
> +@@ -480,6 +483,12 @@ int mbox_controller_register(struct mbox_controller *mbox)
> + 	/* Sanity check */
> + 	if (!mbox || !mbox->dev || !mbox->ops || !mbox->num_chans)
> + 		return -EINVAL;
> ++	/*
> ++	 * A controller can support either doorbell mode or normal message
> ++	 * transmission mode but not both
> ++	 */
> ++	if (mbox->ops->send_data && mbox->ops->send_signal)
> ++		return -EINVAL;
> + 
> + 	if (mbox->txdone_irq)
> + 		txdone = TXDONE_BY_IRQ;
> +diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
> +index 36d6ce673503..476bb9d2ee88 100644
> +--- a/include/linux/mailbox_controller.h
> ++++ b/include/linux/mailbox_controller.h
> +@@ -20,6 +20,16 @@ struct mbox_chan;
> +  *		transmission of data is reported by the controller via
> +  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
> +  *		sleep.
> ++ * @send_signal: The API asks the MBOX controller driver, in atomic
> ++ *		 context try to transmit a signal on the bus. Returns 0 if
> ++ *		 data is accepted for transmission, -EBUSY while rejecting
> ++ *		 if the remote hasn't yet absorbed the last signal sent. Actual
> ++ *		 transmission of data must be handled by the client and  is
> ++ *		 reported by the controller via mbox_chan_txdone (if it has
> ++ *		 some TX ACK irq). It must not sleep. Unlike send_data,
> ++ *		 send_signal doesn't handle any messages/data. It just sends
> ++ *		 notification signal(doorbell) and client needs to prepare all
> ++ *		 the data.
> +  * @flush:	Called when a client requests transmissions to be blocking but
> +  *		the context doesn't allow sleeping. Typically the controller
> +  *		will implement a busy loop waiting for the data to flush out.
> +@@ -45,6 +55,7 @@ struct mbox_chan;
> +  */
> + struct mbox_chan_ops {
> + 	int (*send_data)(struct mbox_chan *chan, void *data);
> ++	int (*send_signal)(struct mbox_chan *chan);
> + 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
> + 	int (*startup)(struct mbox_chan *chan);
> + 	void (*shutdown)(struct mbox_chan *chan);
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch
> new file mode 100644
> index 0000000..e830093
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch
> @@ -0,0 +1,98 @@
> +From 890fedb91e4b81bdb2384c7bb36580d25859191f Mon Sep 17 00:00:00 2001
> +From: Sudeep Holla <sudeep.holla@arm.com>
> +Date: Fri, 28 Apr 2017 11:28:24 +0100
> +Subject: [PATCH 2/8] dt-bindings: mailbox: add bindings to support ARM MHU
> + doorbells
> +
> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970343]
> +
> +The ARM MHU has mechanism to assert interrupt signals to facilitate
> +inter-processor message based communication. It drives the signal using
> +a 32-bit register, with all 32-bits logically ORed together. It also
> +enables software to set, clear and check the status of each of the bits
> +of this register independently. Each bit of the register can be
> +associated with a type of event that can contribute to raising the
> +interrupt thereby allowing it to be used as independent doorbells.
> +
> +Since the first version of this binding can't support doorbells,
> +this patch extends the existing binding to support them by allowing
> +"#mbox-cells" to be 2.
> +
> +Cc: Jassi Brar <jaswinder.singh@linaro.org>
> +Cc: Rob Herring <robh+dt@kernel.org>
> +Cc: devicetree@vger.kernel.org
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +---
> + .../devicetree/bindings/mailbox/arm-mhu.txt   | 39 ++++++++++++++++++-
> + 1 file changed, 37 insertions(+), 2 deletions(-)
> +
> +diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> +index 4971f03f0b33..ba659bcc7109 100644
> +--- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> ++++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> +@@ -10,6 +10,15 @@ STAT register and the remote clears it after having read the data.
> + The last channel is specified to be a 'Secure' resource, hence can't be
> + used by Linux running NS.
> + 
> ++The MHU drives the interrupt signal using a 32-bit register, with all
> ++32-bits logically ORed together. It provides a set of registers to
> ++enable software to set, clear and check the status of each of the bits
> ++of this register independently. The use of 32 bits per interrupt line
> ++enables software to provide more information about the source of the
> ++interrupt. For example, each bit of the register can be associated with
> ++a type of event that can contribute to raising the interrupt. Each of
> ++the 32-bits can be used as "doorbell" to alert the remote processor.
> ++
> + Mailbox Device Node:
> + ====================
> + 
> +@@ -18,13 +27,21 @@ Required properties:
> + - compatible:		Shall be "arm,mhu" & "arm,primecell"
> + - reg:			Contains the mailbox register address range (base
> + 			address and length)
> +-- #mbox-cells		Shall be 1 - the index of the channel needed.
> ++- #mbox-cells		Shall be 1 - the index of the channel needed when
> ++			not used as set of doorbell bits.
> ++			Shall be 2 - the index of the channel needed, and
> ++			the index of the doorbell bit within the channel
> ++			when used in doorbell mode.
> + - interrupts:		Contains the interrupt information corresponding to
> +-			each of the 3 links of MHU.
> ++			each of the 3 physical channels of MHU namely low
> ++			priority non-secure, high priority non-secure and
> ++			secure channels.
> + 
> + Example:
> + --------
> + 
> ++1. Controller which doesn't support doorbells
> ++
> + 	mhu: mailbox@2b1f0000 {
> + 		#mbox-cells = <1>;
> + 		compatible = "arm,mhu", "arm,primecell";
> +@@ -41,3 +58,21 @@ Example:
> + 		reg = <0 0x2e000000 0x4000>;
> + 		mboxes = <&mhu 1>; /* HP-NonSecure */
> + 	};
> ++
> ++2. Controller which supports doorbells
> ++
> ++	mhu: mailbox@2b1f0000 {
> ++		#mbox-cells = <2>;
> ++		compatible = "arm,mhu", "arm,primecell";
> ++		reg = <0 0x2b1f0000 0x1000>;
> ++		interrupts = <0 36 4>, /* LP-NonSecure */
> ++			     <0 35 4>; /* HP-NonSecure */
> ++		clocks = <&clock 0 2 1>;
> ++		clock-names = "apb_pclk";
> ++	};
> ++
> ++	mhu_client: scb@2e000000 {
> ++		compatible = "arm,scpi";
> ++		reg = <0 0x2e000000 0x200>;
> ++		mboxes = <&mhu 1 4>; /* HP-NonSecure 5th doorbell bit */
> ++	};
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
> new file mode 100644
> index 0000000..e3bc571
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
> @@ -0,0 +1,106 @@
> +From 620e29a3323608c23fe370744b79e2fd19fc4ee0 Mon Sep 17 00:00:00 2001
> +From: Sudeep Holla <sudeep.holla@arm.com>
> +Date: Tue, 2 May 2017 11:12:43 +0100
> +Subject: [PATCH 3/8] mailbox: arm_mhu: migrate to threaded irq handler
> +
> +Upstream-Status: Submitted[https://patchwork.kernel.org/patch/10970345]
> +
> +In preparation to introduce support for doorbells which require the
> +interrupt handlers to be threaded, this patch moves the existing
> +interrupt handler to threaded handler.
> +
> +Also it moves out the registering and freeing of the handlers from
> +the mailbox startup and shutdown methods. This also is required to
> +support doorbells.
> +
> +Cc: Jassi Brar <jaswinder.singh@linaro.org>
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +---
> + drivers/mailbox/arm_mhu.c | 46 +++++++++++++++++++--------------------
> + 1 file changed, 22 insertions(+), 24 deletions(-)
> +
> +diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
> +index 9da236552bd7..d7a0b25df372 100644
> +--- a/drivers/mailbox/arm_mhu.c
> ++++ b/drivers/mailbox/arm_mhu.c
> +@@ -76,33 +76,16 @@ static int mhu_startup(struct mbox_chan *chan)
> + {
> + 	struct mhu_link *mlink = chan->con_priv;
> + 	u32 val;
> +-	int ret;
> + 
> + 	val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
> + 	writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
> + 
> +-	ret = request_irq(mlink->irq, mhu_rx_interrupt,
> +-			  IRQF_SHARED, "mhu_link", chan);
> +-	if (ret) {
> +-		dev_err(chan->mbox->dev,
> +-			"Unable to acquire IRQ %d\n", mlink->irq);
> +-		return ret;
> +-	}
> +-
> + 	return 0;
> + }
> + 
> +-static void mhu_shutdown(struct mbox_chan *chan)
> +-{
> +-	struct mhu_link *mlink = chan->con_priv;
> +-
> +-	free_irq(mlink->irq, chan);
> +-}
> +-
> + static const struct mbox_chan_ops mhu_ops = {
> + 	.send_data = mhu_send_data,
> + 	.startup = mhu_startup,
> +-	.shutdown = mhu_shutdown,
> + 	.last_tx_done = mhu_last_tx_done,
> + };
> + 
> +@@ -124,13 +107,6 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 		return PTR_ERR(mhu->base);
> + 	}
> + 
> +-	for (i = 0; i < MHU_CHANS; i++) {
> +-		mhu->chan[i].con_priv = &mhu->mlink[i];
> +-		mhu->mlink[i].irq = adev->irq[i];
> +-		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
> +-		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
> +-	}
> +-
> + 	mhu->mbox.dev = dev;
> + 	mhu->mbox.chans = &mhu->chan[0];
> + 	mhu->mbox.num_chans = MHU_CHANS;
> +@@ -147,6 +123,28 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 		return err;
> + 	}
> + 
> ++	for (i = 0; i < MHU_CHANS; i++) {
> ++		int irq = mhu->mlink[i].irq = adev->irq[i];
> ++
> ++		if (irq <= 0) {
> ++			dev_dbg(dev, "No IRQ found for Channel %d\n", i);
> ++			continue;
> ++		}
> ++
> ++		mhu->chan[i].con_priv = &mhu->mlink[i];
> ++		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
> ++		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
> ++
> ++		err = devm_request_threaded_irq(dev, irq, NULL,
> ++						mhu_rx_interrupt, IRQF_ONESHOT,
> ++						"mhu_link", &mhu->chan[i]);
> ++		if (err) {
> ++			dev_err(dev, "Can't claim IRQ %d\n", irq);
> ++			mbox_controller_unregister(&mhu->mbox);
> ++			return err;
> ++		}
> ++	}
> ++
> + 	dev_info(dev, "ARM MHU Mailbox registered\n");
> + 	return 0;
> + }
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch
> new file mode 100644
> index 0000000..137493d
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch
> @@ -0,0 +1,338 @@
> +From a75e42a4aa52ff0c8d24594a2510e9e7edcc810d Mon Sep 17 00:00:00 2001
> +From: Sudeep Holla <sudeep.holla@arm.com>
> +Date: Tue, 2 May 2017 11:50:59 +0100
> +Subject: [PATCH 4/8] mailbox: arm_mhu: re-factor data structure to add
> + doorbell support
> +
> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970347]
> +
> +In order to support doorbells, we need a bit of reword around data
> +structures that are per-channel. Since the number of doorbells are
> +not fixed though restricted to maximum of 20, the channel assignment
> +and initialization is move to xlate function.
> +
> +This patch also adds the platform data for the existing support of one
> +channel per physical channel.
> +
> +Cc: Jassi Brar <jaswinder.singh@linaro.org>
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +---
> + drivers/mailbox/arm_mhu.c | 209 ++++++++++++++++++++++++++++++++++----
> + 1 file changed, 187 insertions(+), 22 deletions(-)
> +
> +diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
> +index d7a0b25df372..24999bb9dc57 100644
> +--- a/drivers/mailbox/arm_mhu.c
> ++++ b/drivers/mailbox/arm_mhu.c
> +@@ -12,6 +12,8 @@
> + #include <linux/io.h>
> + #include <linux/mailbox_controller.h>
> + #include <linux/module.h>
> ++#include <linux/of.h>
> ++#include <linux/of_device.h>
> + 
> + #define INTR_STAT_OFS	0x0
> + #define INTR_SET_OFS	0x8
> +@@ -22,7 +24,8 @@
> + #define MHU_SEC_OFFSET	0x200
> + #define TX_REG_OFFSET	0x100
> + 
> +-#define MHU_CHANS	3
> ++#define MHU_NUM_PCHANS	3	/* Secure, Non-Secure High and Low Priority */
> ++#define MHU_CHAN_MAX	20	/* Max channels to save on unused RAM */
> + 
> + struct mhu_link {
> + 	unsigned irq;
> +@@ -32,53 +35,175 @@ struct mhu_link {
> + 
> + struct arm_mhu {
> + 	void __iomem *base;
> +-	struct mhu_link mlink[MHU_CHANS];
> +-	struct mbox_chan chan[MHU_CHANS];
> ++	struct mhu_link mlink[MHU_NUM_PCHANS];
> + 	struct mbox_controller mbox;
> ++	struct device *dev;
> + };
> + 
> ++/**
> ++ * ARM MHU Mailbox platform specific configuration
> ++ *
> ++ * @num_pchans: Maximum number of physical channels
> ++ * @num_doorbells: Maximum number of doorbells per physical channel
> ++ */
> ++struct mhu_mbox_pdata {
> ++	unsigned int num_pchans;
> ++	unsigned int num_doorbells;
> ++	bool support_doorbells;
> ++};
> ++
> ++/**
> ++ * ARM MHU Mailbox allocated channel information
> ++ *
> ++ * @mhu: Pointer to parent mailbox device
> ++ * @pchan: Physical channel within which this doorbell resides in
> ++ * @doorbell: doorbell number pertaining to this channel
> ++ */
> ++struct mhu_channel {
> ++	struct arm_mhu *mhu;
> ++	unsigned int pchan;
> ++	unsigned int doorbell;
> ++};
> ++
> ++static inline struct mbox_chan *
> ++mhu_mbox_to_channel(struct mbox_controller *mbox,
> ++		    unsigned int pchan, unsigned int doorbell)
> ++{
> ++	int i;
> ++	struct mhu_channel *chan_info;
> ++
> ++	for (i = 0; i < mbox->num_chans; i++) {
> ++		chan_info = mbox->chans[i].con_priv;
> ++		if (chan_info && chan_info->pchan == pchan &&
> ++		    chan_info->doorbell == doorbell)
> ++			return &mbox->chans[i];
> ++	}
> ++
> ++	dev_err(mbox->dev,
> ++		"Channel not registered: physical channel: %d doorbell: %d\n",
> ++		pchan, doorbell);
> ++
> ++	return NULL;
> ++}
> ++
> ++static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
> ++{
> ++	unsigned int pchan;
> ++	struct mhu_mbox_pdata *pdata = dev_get_platdata(mhu->dev);
> ++
> ++	for (pchan = 0; pchan < pdata->num_pchans; pchan++)
> ++		if (mhu->mlink[pchan].irq == irq)
> ++			break;
> ++	return pchan;
> ++}
> ++
> ++static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
> ++					const struct of_phandle_args *spec)
> ++{
> ++	struct arm_mhu *mhu = dev_get_drvdata(mbox->dev);
> ++	struct mhu_mbox_pdata *pdata = dev_get_platdata(mhu->dev);
> ++	struct mhu_channel *chan_info;
> ++	struct mbox_chan *chan = NULL;
> ++	unsigned int pchan = spec->args[0];
> ++	unsigned int doorbell = pdata->support_doorbells ? spec->args[1] : 0;
> ++	int i;
> ++
> ++	/* Bounds checking */
> ++	if (pchan >= pdata->num_pchans || doorbell >= pdata->num_doorbells) {
> ++		dev_err(mbox->dev,
> ++			"Invalid channel requested pchan: %d doorbell: %d\n",
> ++			pchan, doorbell);
> ++		return ERR_PTR(-EINVAL);
> ++	}
> ++
> ++	for (i = 0; i < mbox->num_chans; i++) {
> ++		chan_info = mbox->chans[i].con_priv;
> ++
> ++		/* Is requested channel free? */
> ++		if (chan_info &&
> ++		    mbox->dev == chan_info->mhu->dev &&
> ++		    pchan == chan_info->pchan &&
> ++		    doorbell == chan_info->doorbell) {
> ++			dev_err(mbox->dev, "Channel in use\n");
> ++			return ERR_PTR(-EBUSY);
> ++		}
> ++
> ++		/*
> ++		 * Find the first free slot, then continue checking
> ++		 * to see if requested channel is in use
> ++		 */
> ++		if (!chan && !chan_info)
> ++			chan = &mbox->chans[i];
> ++	}
> ++
> ++	if (!chan) {
> ++		dev_err(mbox->dev, "No free channels left\n");
> ++		return ERR_PTR(-EBUSY);
> ++	}
> ++
> ++	chan_info = devm_kzalloc(mbox->dev, sizeof(*chan_info), GFP_KERNEL);
> ++	if (!chan_info)
> ++		return ERR_PTR(-ENOMEM);
> ++
> ++	chan_info->mhu = mhu;
> ++	chan_info->pchan = pchan;
> ++	chan_info->doorbell = doorbell;
> ++
> ++	chan->con_priv = chan_info;
> ++
> ++	dev_dbg(mbox->dev, "mbox: created channel phys: %d doorbell: %d\n",
> ++		pchan, doorbell);
> ++
> ++	return chan;
> ++}
> ++
> + static irqreturn_t mhu_rx_interrupt(int irq, void *p)
> + {
> +-	struct mbox_chan *chan = p;
> +-	struct mhu_link *mlink = chan->con_priv;
> ++	struct arm_mhu *mhu = p;
> ++	unsigned int pchan = mhu_mbox_irq_to_pchan_num(mhu, irq);
> ++	struct mbox_chan *chan = mhu_mbox_to_channel(&mhu->mbox, pchan, 0);
> ++	void __iomem *base = mhu->mlink[pchan].rx_reg;
> + 	u32 val;
> + 
> +-	val = readl_relaxed(mlink->rx_reg + INTR_STAT_OFS);
> ++	val = readl_relaxed(base + INTR_STAT_OFS);
> + 	if (!val)
> + 		return IRQ_NONE;
> + 
> + 	mbox_chan_received_data(chan, (void *)&val);
> + 
> +-	writel_relaxed(val, mlink->rx_reg + INTR_CLR_OFS);
> ++	writel_relaxed(val, base + INTR_CLR_OFS);
> + 
> + 	return IRQ_HANDLED;
> + }
> + 
> + static bool mhu_last_tx_done(struct mbox_chan *chan)
> + {
> +-	struct mhu_link *mlink = chan->con_priv;
> +-	u32 val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
> ++	struct mhu_channel *chan_info = chan->con_priv;
> ++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
> ++	u32 val = readl_relaxed(base + INTR_STAT_OFS);
> + 
> + 	return (val == 0);
> + }
> + 
> + static int mhu_send_data(struct mbox_chan *chan, void *data)
> + {
> +-	struct mhu_link *mlink = chan->con_priv;
> ++	struct mhu_channel *chan_info = chan->con_priv;
> ++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
> + 	u32 *arg = data;
> + 
> +-	writel_relaxed(*arg, mlink->tx_reg + INTR_SET_OFS);
> ++	writel_relaxed(*arg, base + INTR_SET_OFS);
> + 
> + 	return 0;
> + }
> + 
> + static int mhu_startup(struct mbox_chan *chan)
> + {
> +-	struct mhu_link *mlink = chan->con_priv;
> ++	struct mhu_channel *chan_info = chan->con_priv;
> ++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
> + 	u32 val;
> + 
> +-	val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
> +-	writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
> ++	val = readl_relaxed(base + INTR_STAT_OFS);
> ++	writel_relaxed(val, base + INTR_CLR_OFS);
> + 
> + 	return 0;
> + }
> +@@ -89,14 +214,47 @@ static const struct mbox_chan_ops mhu_ops = {
> + 	.last_tx_done = mhu_last_tx_done,
> + };
> + 
> ++static const struct mhu_mbox_pdata arm_mhu_pdata = {
> ++	.num_pchans = 3,
> ++	.num_doorbells = 1,
> ++	.support_doorbells = false,
> ++};
> ++
> + static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + {
> +-	int i, err;
> ++	u32 cell_count;
> ++	int i, err, max_chans;
> + 	struct arm_mhu *mhu;
> ++	struct mbox_chan *chans;
> ++	struct mhu_mbox_pdata *pdata;
> + 	struct device *dev = &adev->dev;
> +-	int mhu_reg[MHU_CHANS] = {MHU_LP_OFFSET, MHU_HP_OFFSET, MHU_SEC_OFFSET};
> ++	struct device_node *np = dev->of_node;
> ++	int mhu_reg[MHU_NUM_PCHANS] = {
> ++		MHU_LP_OFFSET, MHU_HP_OFFSET, MHU_SEC_OFFSET,
> ++	};
> ++
> ++	err = of_property_read_u32(np, "#mbox-cells", &cell_count);
> ++	if (err) {
> ++		dev_err(dev, "failed to read #mbox-cells in %s\n",
> ++			np->full_name);
> ++		return err;
> ++	}
> ++
> ++	if (cell_count == 1) {
> ++		max_chans = MHU_NUM_PCHANS;
> ++		pdata = (struct mhu_mbox_pdata *)&arm_mhu_pdata;
> ++	} else {
> ++		dev_err(dev, "incorrect value of #mbox-cells in %s\n",
> ++			np->full_name);
> ++		return -EINVAL;
> ++	}
> ++
> ++	if (pdata->num_pchans > MHU_NUM_PCHANS) {
> ++		dev_err(dev, "Number of physical channel can't exceed %d\n",
> ++			MHU_NUM_PCHANS);
> ++		return -EINVAL;
> ++	}
> + 
> +-	/* Allocate memory for device */
> + 	mhu = devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
> + 	if (!mhu)
> + 		return -ENOMEM;
> +@@ -107,14 +265,22 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 		return PTR_ERR(mhu->base);
> + 	}
> + 
> ++	chans = devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
> ++	if (!chans)
> ++		return -ENOMEM;
> ++
> ++	dev->platform_data = pdata;
> ++
> ++	mhu->dev = dev;
> + 	mhu->mbox.dev = dev;
> +-	mhu->mbox.chans = &mhu->chan[0];
> +-	mhu->mbox.num_chans = MHU_CHANS;
> ++	mhu->mbox.chans = chans;
> ++	mhu->mbox.num_chans = max_chans;
> + 	mhu->mbox.ops = &mhu_ops;
> + 	mhu->mbox.txdone_irq = false;
> + 	mhu->mbox.txdone_poll = true;
> + 	mhu->mbox.txpoll_period = 1;
> + 
> ++	mhu->mbox.of_xlate = mhu_mbox_xlate;
> + 	amba_set_drvdata(adev, mhu);
> + 
> + 	err = devm_mbox_controller_register(dev, &mhu->mbox);
> +@@ -123,7 +289,7 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 		return err;
> + 	}
> + 
> +-	for (i = 0; i < MHU_CHANS; i++) {
> ++	for (i = 0; i < pdata->num_pchans; i++) {
> + 		int irq = mhu->mlink[i].irq = adev->irq[i];
> + 
> + 		if (irq <= 0) {
> +@@ -131,13 +297,12 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 			continue;
> + 		}
> + 
> +-		mhu->chan[i].con_priv = &mhu->mlink[i];
> + 		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
> + 		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
> + 
> + 		err = devm_request_threaded_irq(dev, irq, NULL,
> + 						mhu_rx_interrupt, IRQF_ONESHOT,
> +-						"mhu_link", &mhu->chan[i]);
> ++						"mhu_link", mhu);
> + 		if (err) {
> + 			dev_err(dev, "Can't claim IRQ %d\n", irq);
> + 			mbox_controller_unregister(&mhu->mbox);
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
> new file mode 100644
> index 0000000..0bc2eb3
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
> @@ -0,0 +1,224 @@
> +From eed2fcf3a44c672805daf1bb2940744f4eff9145 Mon Sep 17 00:00:00 2001
> +From: Sudeep Holla <sudeep.holla@arm.com>
> +Date: Tue, 2 May 2017 12:07:28 +0100
> +Subject: [PATCH 5/8] mailbox: arm_mhu: add full support for the doorbells
> +
> +Upstream-Status: Submitted[https://patchwork.kernel.org/patch/10970349]
> +
> +We now have the basic infrastructure and binding to support doorbells
> +on ARM MHU controller.
> +
> +This patch adds all the necessary mailbox operations to add support for
> +the doorbells. Maximum of 32 doorbells are supported on each physical
> +channel, however the total number of doorbells is restricted to 20
> +in order to save memory. It can increased if required in future.
> +
> +Cc: Jassi Brar <jaswinder.singh@linaro.org>
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +---
> + drivers/mailbox/arm_mhu.c | 129 ++++++++++++++++++++++++++++++++++++--
> + 1 file changed, 125 insertions(+), 4 deletions(-)
> +
> +diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
> +index 24999bb9dc57..5bdc494dc4ef 100644
> +--- a/drivers/mailbox/arm_mhu.c
> ++++ b/drivers/mailbox/arm_mhu.c
> +@@ -10,6 +10,7 @@
> + #include <linux/err.h>
> + #include <linux/interrupt.h>
> + #include <linux/io.h>
> ++#include <linux/kernel.h>
> + #include <linux/mailbox_controller.h>
> + #include <linux/module.h>
> + #include <linux/of.h>
> +@@ -86,6 +87,14 @@ mhu_mbox_to_channel(struct mbox_controller *mbox,
> + 	return NULL;
> + }
> + 
> ++static void mhu_mbox_clear_irq(struct mbox_chan *chan)
> ++{
> ++	struct mhu_channel *chan_info = chan->con_priv;
> ++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].rx_reg;
> ++
> ++	writel_relaxed(BIT(chan_info->doorbell), base + INTR_CLR_OFS);
> ++}
> ++
> + static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
> + {
> + 	unsigned int pchan;
> +@@ -97,6 +106,95 @@ static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
> + 	return pchan;
> + }
> + 
> ++static struct mbox_chan *mhu_mbox_irq_to_channel(struct arm_mhu *mhu,
> ++						 unsigned int pchan)
> ++{
> ++	unsigned long bits;
> ++	unsigned int doorbell;
> ++	struct mbox_chan *chan = NULL;
> ++	struct mbox_controller *mbox = &mhu->mbox;
> ++	void __iomem *base = mhu->mlink[pchan].rx_reg;
> ++
> ++	bits = readl_relaxed(base + INTR_STAT_OFS);
> ++	if (!bits)
> ++		/* No IRQs fired in specified physical channel */
> ++		return NULL;
> ++
> ++	/* An IRQ has fired, find the associated channel */
> ++	for (doorbell = 0; bits; doorbell++) {
> ++		if (!test_and_clear_bit(doorbell, &bits))
> ++			continue;
> ++
> ++		chan = mhu_mbox_to_channel(mbox, pchan, doorbell);
> ++		if (chan)
> ++			break;
> ++	}
> ++
> ++	return chan;
> ++}
> ++
> ++static irqreturn_t mhu_mbox_thread_handler(int irq, void *data)
> ++{
> ++	struct mbox_chan *chan;
> ++	struct arm_mhu *mhu = data;
> ++	unsigned int pchan = mhu_mbox_irq_to_pchan_num(mhu, irq);
> ++
> ++	while (NULL != (chan = mhu_mbox_irq_to_channel(mhu, pchan))) {
> ++		mbox_chan_received_data(chan, NULL);
> ++		mhu_mbox_clear_irq(chan);
> ++	}
> ++
> ++	return IRQ_HANDLED;
> ++}
> ++
> ++static bool mhu_doorbell_last_tx_done(struct mbox_chan *chan)
> ++{
> ++	struct mhu_channel *chan_info = chan->con_priv;
> ++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
> ++
> ++	if (readl_relaxed(base + INTR_STAT_OFS) & BIT(chan_info->doorbell))
> ++		return false;
> ++
> ++	return true;
> ++}
> ++
> ++static int mhu_doorbell_send_signal(struct mbox_chan *chan)
> ++{
> ++	struct mhu_channel *chan_info = chan->con_priv;
> ++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
> ++
> ++	/* Send event to co-processor */
> ++	writel_relaxed(BIT(chan_info->doorbell), base + INTR_SET_OFS);
> ++
> ++	return 0;
> ++}
> ++
> ++static int mhu_doorbell_startup(struct mbox_chan *chan)
> ++{
> ++	mhu_mbox_clear_irq(chan);
> ++	return 0;
> ++}
> ++
> ++static void mhu_doorbell_shutdown(struct mbox_chan *chan)
> ++{
> ++	struct mhu_channel *chan_info = chan->con_priv;
> ++	struct mbox_controller *mbox = &chan_info->mhu->mbox;
> ++	int i;
> ++
> ++	for (i = 0; i < mbox->num_chans; i++)
> ++		if (chan == &mbox->chans[i])
> ++			break;
> ++
> ++	if (mbox->num_chans == i) {
> ++		dev_warn(mbox->dev, "Request to free non-existent channel\n");
> ++		return;
> ++	}
> ++
> ++	/* Reset channel */
> ++	mhu_mbox_clear_irq(chan);
> ++	chan->con_priv = NULL;
> ++}
> ++
> + static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
> + 					const struct of_phandle_args *spec)
> + {
> +@@ -214,16 +312,30 @@ static const struct mbox_chan_ops mhu_ops = {
> + 	.last_tx_done = mhu_last_tx_done,
> + };
> + 
> ++static const struct mbox_chan_ops mhu_doorbell_ops = {
> ++	.send_signal = mhu_doorbell_send_signal,
> ++	.startup = mhu_doorbell_startup,
> ++	.shutdown = mhu_doorbell_shutdown,
> ++	.last_tx_done = mhu_doorbell_last_tx_done,
> ++};
> ++
> + static const struct mhu_mbox_pdata arm_mhu_pdata = {
> + 	.num_pchans = 3,
> + 	.num_doorbells = 1,
> + 	.support_doorbells = false,
> + };
> + 
> ++static const struct mhu_mbox_pdata arm_mhu_doorbell_pdata = {
> ++	.num_pchans = 2,	/* Secure can't be used */
> ++	.num_doorbells = 32,
> ++	.support_doorbells = true,
> ++};
> ++
> + static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + {
> + 	u32 cell_count;
> + 	int i, err, max_chans;
> ++	irq_handler_t handler;
> + 	struct arm_mhu *mhu;
> + 	struct mbox_chan *chans;
> + 	struct mhu_mbox_pdata *pdata;
> +@@ -243,6 +355,9 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 	if (cell_count == 1) {
> + 		max_chans = MHU_NUM_PCHANS;
> + 		pdata = (struct mhu_mbox_pdata *)&arm_mhu_pdata;
> ++	} else if (cell_count == 2) {
> ++		max_chans = MHU_CHAN_MAX;
> ++		pdata = (struct mhu_mbox_pdata *)&arm_mhu_doorbell_pdata;
> + 	} else {
> + 		dev_err(dev, "incorrect value of #mbox-cells in %s\n",
> + 			np->full_name);
> +@@ -275,7 +390,6 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 	mhu->mbox.dev = dev;
> + 	mhu->mbox.chans = chans;
> + 	mhu->mbox.num_chans = max_chans;
> +-	mhu->mbox.ops = &mhu_ops;
> + 	mhu->mbox.txdone_irq = false;
> + 	mhu->mbox.txdone_poll = true;
> + 	mhu->mbox.txpoll_period = 1;
> +@@ -283,6 +397,14 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 	mhu->mbox.of_xlate = mhu_mbox_xlate;
> + 	amba_set_drvdata(adev, mhu);
> + 
> ++	if (pdata->support_doorbells) {
> ++		mhu->mbox.ops = &mhu_doorbell_ops;
> ++		handler = mhu_mbox_thread_handler;
> ++	} else {
> ++		mhu->mbox.ops = &mhu_ops;
> ++		handler = mhu_rx_interrupt;
> ++	}
> ++
> + 	err = devm_mbox_controller_register(dev, &mhu->mbox);
> + 	if (err) {
> + 		dev_err(dev, "Failed to register mailboxes %d\n", err);
> +@@ -300,9 +422,8 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
> + 		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
> + 
> +-		err = devm_request_threaded_irq(dev, irq, NULL,
> +-						mhu_rx_interrupt, IRQF_ONESHOT,
> +-						"mhu_link", mhu);
> ++		err = devm_request_threaded_irq(dev, irq, NULL, handler,
> ++						IRQF_ONESHOT, "mhu_link", mhu);
> + 		if (err) {
> + 			dev_err(dev, "Can't claim IRQ %d\n", irq);
> + 			mbox_controller_unregister(&mhu->mbox);
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch
> new file mode 100644
> index 0000000..3749499
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch
> @@ -0,0 +1,67 @@
> +From af51d09655236217ffa349ac776a4e16890e1bef Mon Sep 17 00:00:00 2001
> +From: Sudeep Holla <sudeep.holla@arm.com>
> +Date: Tue, 2 May 2017 12:08:36 +0100
> +Subject: [PATCH 6/8] mailbox: arm_mhu: add support to read and record
> + mbox-name
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/patchwork/patch/791692]
> +
> +It's sometimes useful to identify the mailbox controller with the name
> +as specified in the devicetree via mbox-name property especially in a
> +system with multiple controllers.
> +
> +This patch adds support to read and record the mailbox controller name.
> +
> +Cc: Jassi Brar <jaswinder.singh@linaro.org>
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +---
> + drivers/mailbox/arm_mhu.c | 11 ++++++++---
> + 1 file changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
> +index 5bdc494dc4ef..21259b252004 100644
> +--- a/drivers/mailbox/arm_mhu.c
> ++++ b/drivers/mailbox/arm_mhu.c
> +@@ -39,6 +39,7 @@ struct arm_mhu {
> + 	struct mhu_link mlink[MHU_NUM_PCHANS];
> + 	struct mbox_controller mbox;
> + 	struct device *dev;
> ++	const char *name;
> + };
> + 
> + /**
> +@@ -249,8 +250,8 @@ static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
> + 
> + 	chan->con_priv = chan_info;
> + 
> +-	dev_dbg(mbox->dev, "mbox: created channel phys: %d doorbell: %d\n",
> +-		pchan, doorbell);
> ++	dev_dbg(mbox->dev, "mbox: %s, created channel phys: %d doorbell: %d\n",
> ++		mhu->name, pchan, doorbell);
> + 
> + 	return chan;
> + }
> +@@ -380,6 +381,10 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 		return PTR_ERR(mhu->base);
> + 	}
> + 
> ++	err = of_property_read_string(np, "mbox-name", &mhu->name);
> ++	if (err)
> ++		mhu->name = np->full_name;
> ++
> + 	chans = devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
> + 	if (!chans)
> + 		return -ENOMEM;
> +@@ -431,7 +436,7 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
> + 		}
> + 	}
> + 
> +-	dev_info(dev, "ARM MHU Mailbox registered\n");
> ++	dev_info(dev, "%s mailbox registered\n", mhu->name);
> + 	return 0;
> + }
> + 
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch
> new file mode 100644
> index 0000000..2a60e68
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch
> @@ -0,0 +1,79 @@
> +From 40cecdd2a60706782bc84b6cecf44f3701dbec33 Mon Sep 17 00:00:00 2001
> +From: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +Date: Tue, 21 Jul 2020 16:17:11 +0530
> +Subject: [PATCH 7/8] arm64: defconfig: add all SCMI related configs
> +
> +Upstream-Status: Pending [yet to submit]
> +
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +---
> + arch/arm64/configs/defconfig | 17 ++++++++++++++---
> + 1 file changed, 14 insertions(+), 3 deletions(-)
> +
> +diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> +index c9a867ac32d4..8322b217d1a1 100644
> +--- a/arch/arm64/configs/defconfig
> ++++ b/arch/arm64/configs/defconfig
> +@@ -75,18 +75,20 @@ CONFIG_ARM_CPUIDLE=y
> + CONFIG_ARM_PSCI_CPUIDLE=y
> + CONFIG_CPU_FREQ=y
> + CONFIG_CPU_FREQ_STAT=y
> +-CONFIG_CPU_FREQ_GOV_POWERSAVE=m
> ++CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> + CONFIG_CPU_FREQ_GOV_USERSPACE=y
> + CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> +-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
> ++CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> + CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
> + CONFIG_CPUFREQ_DT=y
> + CONFIG_ACPI_CPPC_CPUFREQ=m
> + CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
> + CONFIG_ARM_SCPI_CPUFREQ=y
> + CONFIG_ARM_IMX_CPUFREQ_DT=m
> ++CONFIG_ARM_SCMI_CPUFREQ=y
> + CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
> + CONFIG_ARM_TEGRA186_CPUFREQ=y
> ++CONFIG_ARM_SCMI_PROTOCOL=y
> + CONFIG_ARM_SCPI_PROTOCOL=y
> + CONFIG_RASPBERRYPI_FIRMWARE=y
> + CONFIG_INTEL_STRATIX10_SERVICE=y
> +@@ -430,6 +432,7 @@ CONFIG_POWER_RESET_SYSCON=y
> + CONFIG_SYSCON_REBOOT_MODE=y
> + CONFIG_BATTERY_SBS=m
> + CONFIG_BATTERY_BQ27XXX=y
> ++CONFIG_SENSORS_ARM_SCMI=y
> + CONFIG_SENSORS_ARM_SCPI=y
> + CONFIG_SENSORS_LM90=m
> + CONFIG_SENSORS_PWM_FAN=m
> +@@ -686,6 +689,7 @@ CONFIG_XEN_GRANT_DEV_ALLOC=y
> + CONFIG_CROS_EC_I2C=y
> + CONFIG_CROS_EC_SPI=y
> + CONFIG_COMMON_CLK_RK808=y
> ++CONFIG_COMMON_CLK_SCMI=y
> + CONFIG_COMMON_CLK_SCPI=y
> + CONFIG_COMMON_CLK_CS2000_CP=y
> + CONFIG_COMMON_CLK_S2MPS11=y
> +@@ -851,11 +855,18 @@ CONFIG_CRYPTO_ANSI_CPRNG=y
> + CONFIG_DMA_CMA=y
> + CONFIG_CMA_SIZE_MBYTES=32
> + CONFIG_PRINTK_TIME=y
> ++CONFIG_DYNAMIC_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + CONFIG_DEBUG_FS=y
> + CONFIG_MAGIC_SYSRQ=y
> + CONFIG_DEBUG_KERNEL=y
> ++CONFIG_SOFTLOCKUP_DETECTOR=y
> ++CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> ++CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
> ++CONFIG_WQ_WATCHDOG=y
> ++CONFIG_PANIC_ON_OOPS=y
> + # CONFIG_SCHED_DEBUG is not set
> + # CONFIG_DEBUG_PREEMPT is not set
> +-# CONFIG_FTRACE is not set
> ++CONFIG_FUNCTION_TRACER=y
> ++CONFIG_FUNCTION_PROFILER=y
> + CONFIG_MEMTEST=y
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch
> new file mode 100644
> index 0000000..146ecb1
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch
> @@ -0,0 +1,592 @@
> +From 037f26919a5f3e1050395396de729dc42cab98ba Mon Sep 17 00:00:00 2001
> +From: Sudeep Holla <sudeep.holla@arm.com>
> +Date: Thu, 20 Apr 2017 11:58:01 +0100
> +Subject: [PATCH 8/8] arm64: dts: juno: add mhu doorbell support and scmi
> + device nodes
> +
> +Upstream-Status: Pending [yet to submit]
> +
> +Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +---
> + arch/arm64/boot/dts/arm/juno-base.dtsi    | 129 ++++++++++++----------
> + arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |   6 +-
> + arch/arm64/boot/dts/arm/juno-r1.dts       |  12 +-
> + arch/arm64/boot/dts/arm/juno-r2.dts       |  12 +-
> + arch/arm64/boot/dts/arm/juno.dts          |  12 +-
> + 5 files changed, 91 insertions(+), 80 deletions(-)
> +
> +diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> +index c47f76b01c4b..6a5be4a72746 100644
> +--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> ++++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> +@@ -23,13 +23,14 @@
> + 	};
> + 
> + 	mailbox: mhu@2b1f0000 {
> +-		compatible = "arm,mhu", "arm,primecell";
> ++		compatible = "arm,mhu-doorbell", "arm,primecell";
> + 		reg = <0x0 0x2b1f0000 0x0 0x1000>;
> + 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> + 			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> + 		interrupt-names = "mhu_lpri_rx",
> + 				  "mhu_hpri_rx";
> +-		#mbox-cells = <1>;
> ++		#mbox-cells = <2>;
> ++		mbox-name = "ARM-MHU";
> + 		clocks = <&soc_refclk100mhz>;
> + 		clock-names = "apb_pclk";
> + 	};
> +@@ -53,7 +54,7 @@
> + 		#iommu-cells = <1>;
> + 		#global-interrupts = <1>;
> + 		dma-coherent;
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 	};
> + 
> + 	gic: interrupt-controller@2c010000 {
> +@@ -113,7 +114,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 
> + 		in-ports {
> + 			port {
> +@@ -137,7 +138,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		in-ports {
> + 			port {
> + 				tpiu_in_port: endpoint {
> +@@ -154,7 +155,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 
> + 		out-ports {
> + 			port {
> +@@ -191,7 +192,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		arm,scatter-gather;
> + 		in-ports {
> + 			port {
> +@@ -210,7 +211,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				stm_out_port: endpoint {
> +@@ -225,7 +226,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 
> + 		out-ports {
> + 			#address-cells = <1>;
> +@@ -260,7 +261,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 	};
> + 
> + 	etm0: etm@22040000 {
> +@@ -269,7 +270,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster0_etm0_out_port: endpoint {
> +@@ -285,7 +286,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster0_funnel_out_port: endpoint {
> +@@ -320,7 +321,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 	};
> + 
> + 	etm1: etm@22140000 {
> +@@ -329,7 +330,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster0_etm1_out_port: endpoint {
> +@@ -345,7 +346,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 	};
> + 
> + 	etm2: etm@23040000 {
> +@@ -354,7 +355,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster1_etm0_out_port: endpoint {
> +@@ -370,7 +371,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster1_funnel_out_port: endpoint {
> +@@ -417,7 +418,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 	};
> + 
> + 	etm3: etm@23140000 {
> +@@ -426,7 +427,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster1_etm1_out_port: endpoint {
> +@@ -442,7 +443,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 	};
> + 
> + 	etm4: etm@23240000 {
> +@@ -451,7 +452,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster1_etm2_out_port: endpoint {
> +@@ -467,7 +468,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 	};
> + 
> + 	etm5: etm@23340000 {
> +@@ -476,7 +477,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				cluster1_etm3_out_port: endpoint {
> +@@ -494,14 +495,24 @@
> + 		#size-cells = <1>;
> + 		ranges = <0 0x0 0x2e000000 0x8000>;
> + 
> +-		cpu_scp_lpri: scp-shmem@0 {
> ++		cpu_scp_lpri0: scp-shmem@0 {
> + 			compatible = "arm,juno-scp-shmem";
> +-			reg = <0x0 0x200>;
> ++			reg = <0x0 0x80>;
> + 		};
> + 
> +-		cpu_scp_hpri: scp-shmem@200 {
> ++		cpu_scp_lpri1: scp-shmem@80 {
> + 			compatible = "arm,juno-scp-shmem";
> +-			reg = <0x200 0x200>;
> ++			reg = <0x80 0x80>;
> ++		};
> ++
> ++		cpu_scp_hpri0: scp-shmem@100 {
> ++			compatible = "arm,juno-scp-shmem";
> ++			reg = <0x100 0x80>;
> ++		};
> ++
> ++		cpu_scp_hpri1: scp-shmem@180 {
> ++			compatible = "arm,juno-scp-shmem";
> ++			reg = <0x180 0x80>;
> + 		};
> + 	};
> + 
> +@@ -529,37 +540,37 @@
> + 		iommu-map = <0x0 &smmu_pcie 0x0 0x1>;
> + 	};
> + 
> +-	scpi {
> +-		compatible = "arm,scpi";
> +-		mboxes = <&mailbox 1>;
> +-		shmem = <&cpu_scp_hpri>;
> ++	firmware {
> ++		scmi {
> ++			compatible = "arm,scmi";
> ++			mbox-names = "tx", "rx";
> ++			mboxes = <&mailbox 0 0 &mailbox 0 1>;
> ++			shmem = <&cpu_scp_lpri0 &cpu_scp_lpri1>;
> ++			#address-cells = <1>;
> ++			#size-cells = <0>;
> + 
> +-		clocks {
> +-			compatible = "arm,scpi-clocks";
> ++			scmi_devpd: protocol@11 {
> ++				reg = <0x11>;
> ++				#power-domain-cells = <1>;
> ++			};
> + 
> +-			scpi_dvfs: scpi-dvfs {
> +-				compatible = "arm,scpi-dvfs-clocks";
> ++			scmi_dvfs: protocol@13 {
> ++				reg = <0x13>;
> + 				#clock-cells = <1>;
> +-				clock-indices = <0>, <1>, <2>;
> +-				clock-output-names = "atlclk", "aplclk","gpuclk";
> ++				mbox-names = "tx", "rx";
> ++				mboxes = <&mailbox 1 0 &mailbox 1 1>;
> ++				shmem = <&cpu_scp_hpri0 &cpu_scp_hpri1>;
> + 			};
> +-			scpi_clk: scpi-clk {
> +-				compatible = "arm,scpi-variable-clocks";
> ++
> ++			scmi_clk: protocol@14 {
> ++				reg = <0x14>;
> + 				#clock-cells = <1>;
> +-				clock-indices = <3>;
> +-				clock-output-names = "pxlclk";
> + 			};
> +-		};
> + 
> +-		scpi_devpd: scpi-power-domains {
> +-			compatible = "arm,scpi-power-domains";
> +-			num-domains = <2>;
> +-			#power-domain-cells = <1>;
> +-		};
> +-
> +-		scpi_sensors0: sensors {
> +-			compatible = "arm,scpi-sensors";
> +-			#thermal-sensor-cells = <1>;
> ++			scmi_sensors0: protocol@15 {
> ++				reg = <0x15>;
> ++				#thermal-sensor-cells = <1>;
> ++			};
> + 		};
> + 	};
> + 
> +@@ -567,40 +578,40 @@
> + 		pmic {
> + 			polling-delay = <1000>;
> + 			polling-delay-passive = <100>;
> +-			thermal-sensors = <&scpi_sensors0 0>;
> ++			thermal-sensors = <&scmi_sensors0 0>;
> + 		};
> + 
> + 		soc {
> + 			polling-delay = <1000>;
> + 			polling-delay-passive = <100>;
> +-			thermal-sensors = <&scpi_sensors0 3>;
> ++			thermal-sensors = <&scmi_sensors0 3>;
> + 		};
> + 
> + 		big_cluster_thermal_zone: big-cluster {
> + 			polling-delay = <1000>;
> + 			polling-delay-passive = <100>;
> +-			thermal-sensors = <&scpi_sensors0 21>;
> ++			thermal-sensors = <&scmi_sensors0 21>;
> + 			status = "disabled";
> + 		};
> + 
> + 		little_cluster_thermal_zone: little-cluster {
> + 			polling-delay = <1000>;
> + 			polling-delay-passive = <100>;
> +-			thermal-sensors = <&scpi_sensors0 22>;
> ++			thermal-sensors = <&scmi_sensors0 22>;
> + 			status = "disabled";
> + 		};
> + 
> + 		gpu0_thermal_zone: gpu0 {
> + 			polling-delay = <1000>;
> + 			polling-delay-passive = <100>;
> +-			thermal-sensors = <&scpi_sensors0 23>;
> ++			thermal-sensors = <&scmi_sensors0 23>;
> + 			status = "disabled";
> + 		};
> + 
> + 		gpu1_thermal_zone: gpu1 {
> + 			polling-delay = <1000>;
> + 			polling-delay-passive = <100>;
> +-			thermal-sensors = <&scpi_sensors0 24>;
> ++			thermal-sensors = <&scmi_sensors0 24>;
> + 			status = "disabled";
> + 		};
> + 	};
> +@@ -677,7 +688,7 @@
> + 		reg = <0 0x7ff50000 0 0x1000>;
> + 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> + 		iommus = <&smmu_hdlcd1 0>;
> +-		clocks = <&scpi_clk 3>;
> ++		clocks = <&scmi_clk 3>;
> + 		clock-names = "pxlclk";
> + 
> + 		port {
> +@@ -692,7 +703,7 @@
> + 		reg = <0 0x7ff60000 0 0x1000>;
> + 		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> + 		iommus = <&smmu_hdlcd0 0>;
> +-		clocks = <&scpi_clk 3>;
> ++		clocks = <&scmi_clk 3>;
> + 		clock-names = "pxlclk";
> + 
> + 		port {
> +diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> +index eda3d9e18af6..e6ecb0dfcbcd 100644
> +--- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> ++++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> +@@ -6,7 +6,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				csys1_funnel_out_port: endpoint {
> +@@ -29,7 +29,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		in-ports {
> + 			port {
> + 				etf1_in_port: endpoint {
> +@@ -52,7 +52,7 @@
> + 
> + 		clocks = <&soc_smc50mhz>;
> + 		clock-names = "apb_pclk";
> +-		power-domains = <&scpi_devpd 0>;
> ++		power-domains = <&scmi_devpd 8>;
> + 		out-ports {
> + 			port {
> + 				csys2_funnel_out_port: endpoint {
> +diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> +index 5f290090b0cf..89c2f86890b2 100644
> +--- a/arch/arm64/boot/dts/arm/juno-r1.dts
> ++++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> +@@ -96,7 +96,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <256>;
> + 			next-level-cache = <&A57_L2>;
> +-			clocks = <&scpi_dvfs 0>;
> ++			clocks = <&scmi_dvfs 0>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <1024>;
> + 		};
> +@@ -113,7 +113,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <256>;
> + 			next-level-cache = <&A57_L2>;
> +-			clocks = <&scpi_dvfs 0>;
> ++			clocks = <&scmi_dvfs 0>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <1024>;
> + 		};
> +@@ -130,7 +130,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 		};
> +@@ -147,7 +147,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 		};
> +@@ -164,7 +164,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 		};
> +@@ -181,7 +181,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 		};
> +diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
> +index 305300dd521c..b1c304ce0181 100644
> +--- a/arch/arm64/boot/dts/arm/juno-r2.dts
> ++++ b/arch/arm64/boot/dts/arm/juno-r2.dts
> +@@ -96,7 +96,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <256>;
> + 			next-level-cache = <&A72_L2>;
> +-			clocks = <&scpi_dvfs 0>;
> ++			clocks = <&scmi_dvfs 0>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <1024>;
> + 			dynamic-power-coefficient = <450>;
> +@@ -114,7 +114,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <256>;
> + 			next-level-cache = <&A72_L2>;
> +-			clocks = <&scpi_dvfs 0>;
> ++			clocks = <&scmi_dvfs 0>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <1024>;
> + 			dynamic-power-coefficient = <450>;
> +@@ -132,7 +132,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <485>;
> + 			dynamic-power-coefficient = <140>;
> +@@ -150,7 +150,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <485>;
> + 			dynamic-power-coefficient = <140>;
> +@@ -168,7 +168,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <485>;
> + 			dynamic-power-coefficient = <140>;
> +@@ -186,7 +186,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <485>;
> + 			dynamic-power-coefficient = <140>;
> +diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> +index f00cffbd032c..a28316c65c1b 100644
> +--- a/arch/arm64/boot/dts/arm/juno.dts
> ++++ b/arch/arm64/boot/dts/arm/juno.dts
> +@@ -95,7 +95,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <256>;
> + 			next-level-cache = <&A57_L2>;
> +-			clocks = <&scpi_dvfs 0>;
> ++			clocks = <&scmi_dvfs 0>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <1024>;
> + 			dynamic-power-coefficient = <530>;
> +@@ -113,7 +113,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <256>;
> + 			next-level-cache = <&A57_L2>;
> +-			clocks = <&scpi_dvfs 0>;
> ++			clocks = <&scmi_dvfs 0>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <1024>;
> + 			dynamic-power-coefficient = <530>;
> +@@ -131,7 +131,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 			dynamic-power-coefficient = <140>;
> +@@ -149,7 +149,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 			dynamic-power-coefficient = <140>;
> +@@ -167,7 +167,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 			dynamic-power-coefficient = <140>;
> +@@ -185,7 +185,7 @@
> + 			d-cache-line-size = <64>;
> + 			d-cache-sets = <128>;
> + 			next-level-cache = <&A53_L2>;
> +-			clocks = <&scpi_dvfs 1>;
> ++			clocks = <&scmi_dvfs 1>;
> + 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
> + 			capacity-dmips-mhz = <578>;
> + 			dynamic-power-coefficient = <140>;
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 9224dde..79ef26e 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -48,6 +48,18 @@ SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch"
>  #
>  COMPATIBLE_MACHINE_juno = "juno"
>  KMACHINE_juno = "juno"
> +KBUILD_DEFCONFIG_juno = "defconfig"
> +KCONFIG_MODE_juno = "--alldefconfig"
> +SRC_URI_append_juno = " \
> +    file://0001-mailbox-add-support-for-doorbell-signal-mode-control.patch \
> +    file://0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch \
> +    file://0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch \
> +    file://0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch \
> +    file://0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch \
> +    file://0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch \
> +    file://0007-arm64-defconfig-add-all-SCMI-related-configs.patch \
> +    file://0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch \
> +    "
>  
>  #
>  # SGI575 KMACHINE
> -- 
> 2.17.1
> 

> 

