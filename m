Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86F4C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 13:30:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6400.1660224602900568743
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 06:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ioLHL/g1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CA73B24000D;
	Thu, 11 Aug 2022 13:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660224600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=TLFRXEdgfCI+/Rd/z+czHHMe8baGl9kTOnJCMPN3An8=;
	b=ioLHL/g1tOiT2jezVXe8i5KGDhvrKb8zURh11DZBez4j2aedCA1kYu3UMWWN4/MQLZwr2o
	WlnDOPiaJyxCtnv/siLWB7PG9AYRbFKhLHVLHyXdNyuzPbuEGZ5Vkk8YklH8iFcFPfeLDB
	/BwDjhxgMpPVczZhRhO1nL8dITahy6v3vsIaaWRTR0cOCNXgarYH7isIeD/YsKhsfXjO2U
	1/nvSkdQmiGxQU1PzyCabhyoOvOjihqS1JvEHlQmxAc4F+Zxu21PxrTC8uKM+coidSD6e+
	EJO8V1m8XLXn3eipUP2RURKAlYGsu4Zd3rExNklTKBD1ZqL8lIv0vjlFQnat9Q==
Date: Thu, 11 Aug 2022 15:29:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>, Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, swat@lists.yoctoproject.org
Subject: New kernel_configcheck warnings in master
Message-ID: <YvUEV+JtJaYnRiP1@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 13:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3671

Hello,

Since the latest kernel upgrade in master, the following warnings have
appeared:

WARNING: linux-yocto-5.19+gitAUTOINC+eb7088acca_43e6ab6ed0-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
    [NOTE]: 'CONFIG_BT_HCIUART_MRVL' last val (y) and .config val (n) do not match
    [INFO]: CONFIG_BT_HCIUART_MRVL : n 
    [INFO]: raw config text:
        config BT_HCIUART_MRVL
        	bool "Marvell protocol support"
        	select BT_HCIUART_H4
        	depends on BT_HCIUART && BT_HCIUART_SERDEV && BT && NET
        	help
        	  Marvell is serial protocol for communication between Bluetooth
        	  device and host. This protocol is required for most Marvell Bluetooth
        	  devices with UART interface.
	  
        	  Say Y here to compile support for HCI MRVL protocol.
        Config 'BT_HCIUART_MRVL' has the following Direct dependencies (BT_HCIUART_MRVL=n):
                BT_HCIUART(=n) && BT_HCIUART_SERDEV(=n) && BT(=n) && NET(=y)
        Parent dependencies are:
             BT_HCIUART [n] NET [y] BT [n] BT_HCIUART_SERDEV [n]
    [INFO]: config 'CONFIG_BT_HCIUART_MRVL' was set, but it wasn't assignable, check (parent) dependencies
    [NOTE]: 'CONFIG_BT_MRVL' last val (m) and .config val (n) do not match
    [INFO]: CONFIG_BT_MRVL : n 
    [INFO]: raw config text:
        config BT_MRVL
        	tristate "Marvell Bluetooth driver support"
        	depends on BT && NET
        	help
        	  The core driver to support Marvell Bluetooth devices.
	  
        	  This driver is required if you want to support
        	  Marvell Bluetooth devices, such as 8688/8787/8797/8887/8897/8977/8987/8997.
	  
        	  Say Y here to compile Marvell Bluetooth driver
        	  into the kernel or say M to compile it as module.
        Config 'BT_MRVL' has the following Direct dependencies (BT_MRVL=n):
                BT(=n) && NET(=y)
        Parent dependencies are:
             NET [y] BT [n]
    [INFO]: config 'CONFIG_BT_MRVL' was set, but it wasn't assignable, check (parent) dependencies
    [NOTE]: 'CONFIG_BT_MRVL_SDIO' last val (m) and .config val (n) do not match
    [INFO]: CONFIG_BT_MRVL_SDIO : n 
    [INFO]: raw config text:
        config BT_MRVL_SDIO
        	tristate "Marvell BT-over-SDIO driver"
        	select FW_LOADER
        	select WANT_DEV_COREDUMP
        	depends on BT_MRVL && MMC && BT && NET
        	help
        	  The driver for Marvell Bluetooth chipsets with SDIO interface.
	  
        	  This driver is required if you want to use Marvell Bluetooth
        	  devices with SDIO interface. Currently SD8688/SD8787/SD8797/SD8887/SD8897/SD8977/SD8987/SD8997
        	  chipsets are supported.
	  
        	  Say Y here to compile support for Marvell BT-over-SDIO driver
        	  into the kernel or say M to compile it as module.
        Config 'BT_MRVL_SDIO' has the following Direct dependencies (BT_MRVL_SDIO=n):
                BT_MRVL(=n) && MMC(=y) && BT(=n) && NET(=y)
        Parent dependencies are:
             MMC [y] BT_MRVL [n] NET [y] BT [n]
    [INFO]: config 'CONFIG_BT_MRVL_SDIO' was set, but it wasn't assignable, check (parent) dependencies
    [NOTE]: 'CONFIG_BT_QCOMSMD' last val (m) and .config val (n) do not match
    [INFO]: CONFIG_BT_QCOMSMD : n 
    [INFO]: raw config text:
        config BT_QCOMSMD
        	tristate "Qualcomm SMD based HCI support"
        	select BT_QCA
        	depends on (RPMSG || (COMPILE_TEST && RPMSG = n)) && (QCOM_WCNSS_CTRL || (COMPILE_TEST && QCOM_WCNSS_CTRL = n)) && BT && NET
        	help
        	  Qualcomm SMD based HCI driver.
        	  This driver is used to bridge HCI data onto the shared memory
        	  channels to the WCNSS core.
	  
        	  Say Y here to compile support for HCI over Qualcomm SMD into the
        	  kernel or say M to compile as a module.
        Config 'BT_QCOMSMD' has the following Direct dependencies (BT_QCOMSMD=n):
                RPMSG(=y) || (COMPILE_TEST(=n) && RPMSG(=y) = n) (=y) && QCOM_WCNSS_CTRL(=m) || (COMPILE_TEST(=n) && QCOM_WCNSS_CTRL(=m) = n) (=m) && BT(=n) && NET(=y)
        Parent dependencies are:
             QCOM_WCNSS_CTRL [m] NET [y] COMPILE_TEST [n] BT [n] RPMSG [y]
    [INFO]: config 'CONFIG_BT_QCOMSMD' was set, but it wasn't assignable, check (parent) dependencies

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

