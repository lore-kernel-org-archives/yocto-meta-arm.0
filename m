Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5359C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 13:59:09 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.6715.1660226344430857439
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 06:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ABhtOgdX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id y18so3442427qtv.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=TxjakyfRe/J1rQhJ3FvvFqqKanx4eryEZZCosVJH0bM=;
        b=ABhtOgdXhQ5nZ4yKzkdUdtU7f+Su5TEMUhBmvAK7cPy/Os3/pJTEfk598uoPf4mCow
         hotrdl4eFbUDI2zTGymh7JRcZRu4QiisxuqwJmiJrCQ2rDDPE5ZGkMI1fs+mG3/vtOmg
         YhopWr7SxEIxtvfNgiuVgZrGP0oCriGPCylCa9Dub/QMbOF40Er6DAAwJ649k5JncX9S
         vRUg+TD9ZDFHeZ8fSQ4t5ZTP9yx7iVjY9H6nOJtCpEVrktkeGTLmqFVJ4TVsSV12Ukt7
         s8yrkHpDKQ9HFlfcu5XHWdJc6xA9ThBSFO/2p3V+G7LqsKmDEhlJBom5oB9cDsaGA/VB
         PQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=TxjakyfRe/J1rQhJ3FvvFqqKanx4eryEZZCosVJH0bM=;
        b=sUOEgbjaKamG8EguF8KkUnDO44ABZa0Wg2JU7A41Rkn+GOnnxNeqZgtMc5YNKPLGk5
         Ba4+Ojp8TkYfZQ8F2UEhEm2QdAxIj6aaTccimDh+hp4kOfFkNJ/KLRbzPA63tfGRyFya
         OoTLrIES3NhbfTFEYDUzA9eBnoJhNdbCqothNH7hPAMQS8lfcUockspdfpThHyvhB02p
         bpE+JxlMh63MxR3gze2vJENTCt5OQ0fXE+0Sj7Qn5Es50QK2lxrbAvu83Xxtij6UK4Ug
         lIacsEGDtxvrP2ShS7jtpQsK7JyUkY5Sm+bFIGkseKpnuBZ43EnA5ByGeB4/gZvcX5HM
         11ew==
X-Gm-Message-State: ACgBeo3Du9eqK/XAYzOjW8C22pS3jq3gITLpVl1B0uWY/eqcx0WQz8V/
	zM8WlwZGlwJH6SniaaVH1h1SOQ==
X-Google-Smtp-Source: 
 AA6agR7QKsj3URDV3mwjL05N0Z8woN1TxaMOYNtqd2EwZxRnQqCJHkveAzMpKEBoUlf2xFsGhsoVVg==
X-Received: by 2002:a05:622a:1a9e:b0:342:f7a9:a13a with SMTP id
 s30-20020a05622a1a9e00b00342f7a9a13amr17055217qtc.609.1660226343449;
        Thu, 11 Aug 2022 06:59:03 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 m18-20020ac84452000000b00342f8143599sm1662390qtn.13.2022.08.11.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 06:59:02 -0700 (PDT)
Date: Thu, 11 Aug 2022 09:59:01 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, Jon Mason <jon.mason@arm.com>,
	meta-arm@lists.yoctoproject.org, swat@lists.yoctoproject.org
Subject: Re: New kernel_configcheck warnings in master
Message-ID: <YvULJe8brmagQheh@kudzu.us>
References: <YvUEV+JtJaYnRiP1@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvUEV+JtJaYnRiP1@mail.local>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 13:59:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3675

On Thu, Aug 11, 2022 at 03:29:59PM +0200, Alexandre Belloni wrote:
> Hello,
> 
> Since the latest kernel upgrade in master, the following warnings have
> appeared:
> 
> WARNING: linux-yocto-5.19+gitAUTOINC+eb7088acca_43e6ab6ed0-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
>     [NOTE]: 'CONFIG_BT_HCIUART_MRVL' last val (y) and .config val (n) do not match
>     [INFO]: CONFIG_BT_HCIUART_MRVL : n 
>     [INFO]: raw config text:
>         config BT_HCIUART_MRVL
>         	bool "Marvell protocol support"
>         	select BT_HCIUART_H4
>         	depends on BT_HCIUART && BT_HCIUART_SERDEV && BT && NET
>         	help
>         	  Marvell is serial protocol for communication between Bluetooth
>         	  device and host. This protocol is required for most Marvell Bluetooth
>         	  devices with UART interface.
> 	  
>         	  Say Y here to compile support for HCI MRVL protocol.
>         Config 'BT_HCIUART_MRVL' has the following Direct dependencies (BT_HCIUART_MRVL=n):
>                 BT_HCIUART(=n) && BT_HCIUART_SERDEV(=n) && BT(=n) && NET(=y)
>         Parent dependencies are:
>              BT_HCIUART [n] NET [y] BT [n] BT_HCIUART_SERDEV [n]
>     [INFO]: config 'CONFIG_BT_HCIUART_MRVL' was set, but it wasn't assignable, check (parent) dependencies
>     [NOTE]: 'CONFIG_BT_MRVL' last val (m) and .config val (n) do not match
>     [INFO]: CONFIG_BT_MRVL : n 
>     [INFO]: raw config text:
>         config BT_MRVL
>         	tristate "Marvell Bluetooth driver support"
>         	depends on BT && NET
>         	help
>         	  The core driver to support Marvell Bluetooth devices.
> 	  
>         	  This driver is required if you want to support
>         	  Marvell Bluetooth devices, such as 8688/8787/8797/8887/8897/8977/8987/8997.
> 	  
>         	  Say Y here to compile Marvell Bluetooth driver
>         	  into the kernel or say M to compile it as module.
>         Config 'BT_MRVL' has the following Direct dependencies (BT_MRVL=n):
>                 BT(=n) && NET(=y)
>         Parent dependencies are:
>              NET [y] BT [n]
>     [INFO]: config 'CONFIG_BT_MRVL' was set, but it wasn't assignable, check (parent) dependencies
>     [NOTE]: 'CONFIG_BT_MRVL_SDIO' last val (m) and .config val (n) do not match
>     [INFO]: CONFIG_BT_MRVL_SDIO : n 
>     [INFO]: raw config text:
>         config BT_MRVL_SDIO
>         	tristate "Marvell BT-over-SDIO driver"
>         	select FW_LOADER
>         	select WANT_DEV_COREDUMP
>         	depends on BT_MRVL && MMC && BT && NET
>         	help
>         	  The driver for Marvell Bluetooth chipsets with SDIO interface.
> 	  
>         	  This driver is required if you want to use Marvell Bluetooth
>         	  devices with SDIO interface. Currently SD8688/SD8787/SD8797/SD8887/SD8897/SD8977/SD8987/SD8997
>         	  chipsets are supported.
> 	  
>         	  Say Y here to compile support for Marvell BT-over-SDIO driver
>         	  into the kernel or say M to compile it as module.
>         Config 'BT_MRVL_SDIO' has the following Direct dependencies (BT_MRVL_SDIO=n):
>                 BT_MRVL(=n) && MMC(=y) && BT(=n) && NET(=y)
>         Parent dependencies are:
>              MMC [y] BT_MRVL [n] NET [y] BT [n]
>     [INFO]: config 'CONFIG_BT_MRVL_SDIO' was set, but it wasn't assignable, check (parent) dependencies
>     [NOTE]: 'CONFIG_BT_QCOMSMD' last val (m) and .config val (n) do not match
>     [INFO]: CONFIG_BT_QCOMSMD : n 
>     [INFO]: raw config text:
>         config BT_QCOMSMD
>         	tristate "Qualcomm SMD based HCI support"
>         	select BT_QCA
>         	depends on (RPMSG || (COMPILE_TEST && RPMSG = n)) && (QCOM_WCNSS_CTRL || (COMPILE_TEST && QCOM_WCNSS_CTRL = n)) && BT && NET
>         	help
>         	  Qualcomm SMD based HCI driver.
>         	  This driver is used to bridge HCI data onto the shared memory
>         	  channels to the WCNSS core.
> 	  
>         	  Say Y here to compile support for HCI over Qualcomm SMD into the
>         	  kernel or say M to compile as a module.
>         Config 'BT_QCOMSMD' has the following Direct dependencies (BT_QCOMSMD=n):
>                 RPMSG(=y) || (COMPILE_TEST(=n) && RPMSG(=y) = n) (=y) && QCOM_WCNSS_CTRL(=m) || (COMPILE_TEST(=n) && QCOM_WCNSS_CTRL(=m) = n) (=m) && BT(=n) && NET(=y)
>         Parent dependencies are:
>              QCOM_WCNSS_CTRL [m] NET [y] COMPILE_TEST [n] BT [n] RPMSG [y]
>     [INFO]: config 'CONFIG_BT_QCOMSMD' was set, but it wasn't assignable, check (parent) dependencies

Yes, we are very aware, and our CI is failing because of this.  I
_think_ recent changes to yocto-kernel-cache are causing this.
d2b8b81fd3798eb276e768c24b450e0012a31893

We also have testimage failing due to parselog finding (new) errors.
So, more changes in yocto-kernel-cache will mostly likely be needed
for that as well.

This is the long way of saying, we're on it and hope to have it fixed
in the next day or so.

Thanks,
Jon

> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

