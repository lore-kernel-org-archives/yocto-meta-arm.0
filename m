Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.4099.1591821621446055113
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 13:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=HqcvU/n0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id f18so3522882qkh.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2020 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q23Ge3p+Sd9OLxSgSC0DtK6uWa6k6ZtPXE2c30SSfac=;
        b=HqcvU/n0ByVdXZ7dSfi/+xyDxkZ6ovxO7/qLWpSQt54IB+ZHZOEauk7W6XKEvdqbO0
         2X2RY65BXKwm+Kg0IKw8o5adKu+NQf17IhRW76U8y2HF5QJ0ZsojamjPc5xrKPWvIcMu
         WLPocJa0SfS8sttRoY+sM+b9lgpUwwcBpqfi+LzZNqD8/NH8qMceS6iiU52th4OXPbQW
         raeg2WTxJuEpU3exSkzxvhVt+CcbyU9o0hgSv2Fe6ctBK7JHi6yKW60ImwqoBIOeZTw3
         0pS3gwpOEtBr/eZ15BHzFIGv4eZcBopQ9dXYDxzIcbexXKbyEnwkplAC6A1oFdazTm7n
         AWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q23Ge3p+Sd9OLxSgSC0DtK6uWa6k6ZtPXE2c30SSfac=;
        b=HKqeutb281kfrLUxuALXjiq6gJW5TgWqG7ICCM6wrvx3n3uql0IrUi9Buig2h52PMm
         EVFg43ZPR7JTGZfVBW42zP0VWrskHLpL7P6idixTg3KP5VaGfMGjQni9ei/2D/ekBuaV
         2o1sdkmTlSkoMuMwGXqNNjjG6RdTAf9TztUjaSHi0zi4wY2vVW7fWNse8S+JO9xtvy8h
         HLv1w2PbByT6alUrTA5oaBiy6FCusHVMI8yitPZuTGHGze367FbL69gOnB0dGzNhNoxQ
         JyukI05JkzuCIVqGrNvXVnYAsuZBDTvakMWIwWrEqr+Px5l9gipxSNAqJz1zUJd2Xwnw
         JBGA==
X-Gm-Message-State: AOAM531fULijbBjadBtMmpWptBSqRpOsBSIfZjbfpl5/DQEbNmtYWA19
	a1Sqkf8oiQ7Fae5rzQ4qSPyOVg==
X-Google-Smtp-Source: ABdhPJyr4zqp17EWe3vhNFBmU3pjIzoPR7NNuKld71fm0FW4RQmb1gGVv/d7sl16pAB0RSlU+zWpVw==
X-Received: by 2002:a05:620a:24c:: with SMTP id q12mr5125446qkn.172.1591821620485;
        Wed, 10 Jun 2020 13:40:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:403d:d74f:c1dd:a98f])
        by smtp.gmail.com with ESMTPSA id i40sm963711qte.67.2020.06.10.13.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:40:20 -0700 (PDT)
Date: Wed, 10 Jun 2020 16:40:17 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Rui Miguel Silva <rui.silva@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: u-boot: rebase a5ds patches
Message-ID: <20200610204016.GA25448@kudzu.us>
References: <20200609132711.68599-1-rui.silva@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200609132711.68599-1-rui.silva@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2020 at 02:27:11PM +0100, Rui Miguel Silva wrote:
> Rebase a5ds u-boot patches so, they apply clean in top of
> latest u-boot.
> 
> Change-Id: I12e596ef8460429b540777e2a8646ed64f81fbac
> Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
> ---
> 
> Jon, when ok, please apply this also to dunfell branch.
> Thanks.

Pulled into master.  Are these needed for dunfell, as it has the older
version of u-boot?

Thanks,
Jon

> 
>  .../a5ds/0001-armv7-add-mmio-timer.patch      | 18 ++++----
>  ...-arm-add-designstart-cortex-a5-board.patch | 42 +++++++++----------
>  2 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
> index fbf8a14fdf59..9dfb3094220c 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
> @@ -1,7 +1,7 @@
> -From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 2001
> +From 864749afaf9b3f71ddaa519f4a770ce43e206912 Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Wed, 18 Dec 2019 21:52:34 +0000
> -Subject: [PATCH 1/2] armv7: add mmio timer
> +Subject: [PATCH 1/3] armv7: add mmio timer
> 
>  This timer can be used by u-boot when arch-timer is not available in
>  core, for example, Cortex-A5.
> @@ -18,17 +18,17 @@ diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
>  index 8c955d0d5284..82af9c031277 100644
>  --- a/arch/arm/cpu/armv7/Makefile
>  +++ b/arch/arm/cpu/armv7/Makefile
> -@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
> +@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
>   obj-$(CONFIG_IPROC) += iproc-common/
>   obj-$(CONFIG_KONA) += kona-common/
>   obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
>  +obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
> -
> +
>   ifneq (,$(filter s5pc1xx exynos,$(SOC)))
>   obj-y += s5p-common/
>  diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
>  new file mode 100644
> -index 000000000000..1b905db8bb19
> +index 000000000000..5d6f66172398
>  --- /dev/null
>  +++ b/arch/arm/cpu/armv7/mmio_timer.c
>  @@ -0,0 +1,56 @@
> @@ -89,10 +89,10 @@ index 000000000000..1b905db8bb19
>  +      return gd->arch.timer_rate_hz;
>  +}
>  diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> -index cf1808e051c8..8624714ae7a6 100644
> +index 6908431d03cf..186001ecfb8c 100644
>  --- a/scripts/config_whitelist.txt
>  +++ b/scripts/config_whitelist.txt
> -@@ -3138,6 +3138,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
> +@@ -3108,6 +3108,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
>   CONFIG_SYS_MMC_U_BOOT_OFFS
>   CONFIG_SYS_MMC_U_BOOT_SIZE
>   CONFIG_SYS_MMC_U_BOOT_START
> @@ -100,6 +100,6 @@ index cf1808e051c8..8624714ae7a6 100644
>   CONFIG_SYS_MONITOR_
>   CONFIG_SYS_MONITOR_BASE
>   CONFIG_SYS_MONITOR_BASE_EARLY
> ---
> -2.25.0
> +--
> +2.26.2
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> index 3c527ae23a4a..7d02e5fee860 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> @@ -1,7 +1,7 @@
> -From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 2001
> +From d74c2d6f475bef05c114e859ab52bd721fbee7b2 Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Wed, 8 Jan 2020 09:48:11 +0000
> -Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
> +Subject: [PATCH 2/3] board: arm: add designstart cortex-a5 board
> 
>  Arm added a new board, designstart, with a cortex-a5 chip, add the
>  default configuration, initialization and makefile for this system.
> @@ -22,33 +22,33 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   create mode 100644 include/configs/designstart_ca5.h
> 
>  diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index f9dab073ea14..2cc9413114de 100644
> +index bbb1e2738bfe..8f918f6e0375 100644
>  --- a/arch/arm/Kconfig
>  +++ b/arch/arm/Kconfig
> -@@ -628,6 +628,12 @@ config ARCH_BCM6858
> -       select OF_CONTROL
> -       imply CMD_DM
> -
> +@@ -636,6 +636,12 @@ config ARCH_BCM6858
> +       select OF_CONTROL
> +       imply CMD_DM
> +
>  +config TARGET_DESIGNSTART_CA5
> -+      bool "Support Designstart Cortex-A5"
> -+      select CPU_V7A
> -+      select SEMIHOSTING
> -+      select PL01X_SERIAL
> ++      bool "Support Designstart Cortex-A5"
> ++      select CPU_V7A
> ++      select SEMIHOSTING
> ++      select PL01X_SERIAL
>  +
>   config TARGET_VEXPRESS_CA15_TC2
> -       bool "Support vexpress_ca15_tc2"
> -       select CPU_V7A
> -@@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
> +       bool "Support vexpress_ca15_tc2"
> +       select CPU_V7A
> +@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
>   source "board/armadeus/apf27/Kconfig"
>   source "board/armltd/vexpress/Kconfig"
>   source "board/armltd/vexpress64/Kconfig"
>  +source "board/armltd/designstart/Kconfig"
> + source "board/cortina/presidio-asic/Kconfig"
>   source "board/broadcom/bcm23550_w1d/Kconfig"
>   source "board/broadcom/bcm28155_ap/Kconfig"
> - source "board/broadcom/bcm963158/Kconfig"
>  diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
>  new file mode 100644
> -index 000000000000..6446fe3f4492
> +index 000000000000..a9564e8655e2
>  --- /dev/null
>  +++ b/board/armltd/designstart/Kconfig
>  @@ -0,0 +1,12 @@
> @@ -66,7 +66,7 @@ index 000000000000..6446fe3f4492
>  +endif
>  diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/Makefile
>  new file mode 100644
> -index 000000000000..b64c905c7021
> +index 000000000000..d2dc2b74ed85
>  --- /dev/null
>  +++ b/board/armltd/designstart/Makefile
>  @@ -0,0 +1,8 @@
> @@ -80,7 +80,7 @@ index 000000000000..b64c905c7021
>  +obj-y := designstart.o
>  diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designstart/designstart.c
>  new file mode 100644
> -index 000000000000..b0400f110ce2
> +index 000000000000..658057a00330
>  --- /dev/null
>  +++ b/board/armltd/designstart/designstart.c
>  @@ -0,0 +1,49 @@
> @@ -178,7 +178,7 @@ index 000000000000..a2a756740295
>  +
>  diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
>  new file mode 100644
> -index 000000000000..79c4b36060d2
> +index 000000000000..6db5b1cf4ac2
>  --- /dev/null
>  +++ b/include/configs/designstart_ca5.h
>  @@ -0,0 +1,122 @@
> @@ -304,6 +304,6 @@ index 000000000000..79c4b36060d2
>  +#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
>  +#define CONFIG_ENV_IS_IN_FLASH                1
>  +#endif
> ---
> -2.25.0
> +--
> +2.26.2
> 
> --
> 2.26.2
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 

