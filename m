Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.385.1601573853934266909
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 10:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=gSX8nTDO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id q5so6295439qkc.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Oct 2020 10:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qo00RbyE/vuyVOF2qAEFr75cGCRitCqlLHhpMQ29Lfw=;
        b=gSX8nTDODnj3tYu9V3wGD284jZVQnuTvTebdJEu2x8F9Lvcjp65logF+pC3noYy4gc
         N2zoiHbCBSwYu8Smq09eQ9ddiConW1b0FpKVRKMZ9zVwG4LuVzvh+c7M3Qk7FqAwBQAY
         UvyqfQlvyLogbuZa2CcxqwkqyuNf4gBUgslP2EDnUf0ZyiTS3lOAQ0i4ofNhgP7TN1jf
         kYRqF+i/Ladp417VmzNTVuLRw3epZqswiXFOmDYj9HeXc0iL/XKyIdeQVaIJYSHOZy8s
         Hwcfwo3PAN1qQrp0cfEXY5q85kSgbkTwzAXRrMSPFSID9oaGsOd2wxoVofF5ZgxbbeOn
         7nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qo00RbyE/vuyVOF2qAEFr75cGCRitCqlLHhpMQ29Lfw=;
        b=tmQ8CKZnWxleTL4+ZYp9nsscQaYuMz/VcPRh0Mq0qHX+d4Z3L0g3yjw6PZQCOdvoRN
         sOGiB8V29bizGgsaiHzwpsztkF18+5XPJf2VzQrdRauLjvBPZ26dyw81SDs3jDuUv4WX
         aQLZF+GeCdCy5MgeP4IBmSse0O5Z8or3p2aJ1NoDKM9p5VY/T1oTPk4SqqAn0Zqr30WX
         zuLx82ACtYlDaAh4ySpXAMDRal3oXhO1U0WrYQtMDwwt17NXVrJVccU9LQiN8aASu7jV
         6fGDqjNv5egkcD55ZgHqH5wWWcTzLmz4wvbCuuISmzhMXrufVvGn8si0NGP1NJQv/M4r
         kkPQ==
X-Gm-Message-State: AOAM532vM3ak3+XaeK6QROs/YATqEVXAFDizxmm4T+a7K+gFKSZwBk7r
	JLbQu6WWSf4HQOCkgUnzaXsBeg==
X-Google-Smtp-Source: ABdhPJyAHGeGdxf13ThmPJzfasGeZ/TgOs1GoSb9+g2n//o0J94okFnD7d5zdLZ/NmW28MXMH4TuWA==
X-Received: by 2002:a05:620a:1085:: with SMTP id g5mr8824895qkk.32.1601573852948;
        Thu, 01 Oct 2020 10:37:32 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id x197sm6916236qkb.17.2020.10.01.10.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 10:37:32 -0700 (PDT)
Date: Thu, 1 Oct 2020 13:37:27 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Rui Miguel Silva <rui.silva@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: fix patches for a5ds
Message-ID: <20201001173726.GA24357@kudzu.us>
References: <20200929190640.qiejusonu2ad5jdp@arch-thunder.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200929190640.qiejusonu2ad5jdp@arch-thunder.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2020 at 08:06:40PM +0100, Rui Miguel Silva wrote:
> Some of the patches for u-boot do not apply without
> fuzz in 2020.07, rebase them so we do not have the
> ugly warnings during do_patch
> 
> Change-Id: I0c89b18ed66adad66c7cf41373ca7cdd3fdea3da
> Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../a5ds/0001-armv7-add-mmio-timer.patch      | 16 +++++-----
>  ...-arm-add-designstart-cortex-a5-board.patch | 32 +++++++++----------
>  2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
> index fe61ed5..e59afea 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
> @@ -1,7 +1,7 @@
> -From 864749afaf9b3f71ddaa519f4a770ce43e206912 Mon Sep 17 00:00:00 2001
> +From 4449a6c2de38bdeb09e3158f6d9318812966243a Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Wed, 18 Dec 2019 21:52:34 +0000
> -Subject: [PATCH 1/3] armv7: add mmio timer
> +Subject: [PATCH 1/2] armv7: add mmio timer
>  
>  This timer can be used by u-boot when arch-timer is not available in
>  core, for example, Cortex-A5.
> @@ -18,12 +18,12 @@ diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
>  index 8c955d0d5284..82af9c031277 100644
>  --- a/arch/arm/cpu/armv7/Makefile
>  +++ b/arch/arm/cpu/armv7/Makefile
> -@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
> +@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
>   obj-$(CONFIG_IPROC) += iproc-common/
>   obj-$(CONFIG_KONA) += kona-common/
>   obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
>  +obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
> -
> + 
>   ifneq (,$(filter s5pc1xx exynos,$(SOC)))
>   obj-y += s5p-common/
>  diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
> @@ -89,10 +89,10 @@ index 000000000000..5d6f66172398
>  +      return gd->arch.timer_rate_hz;
>  +}
>  diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> -index 6908431d03cf..186001ecfb8c 100644
> +index 916768f361d9..c8fd8c6e355a 100644
>  --- a/scripts/config_whitelist.txt
>  +++ b/scripts/config_whitelist.txt
> -@@ -3108,6 +3108,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
> +@@ -3075,6 +3075,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
>   CONFIG_SYS_MMC_U_BOOT_OFFS
>   CONFIG_SYS_MMC_U_BOOT_SIZE
>   CONFIG_SYS_MMC_U_BOOT_START
> @@ -100,6 +100,6 @@ index 6908431d03cf..186001ecfb8c 100644
>   CONFIG_SYS_MONITOR_
>   CONFIG_SYS_MONITOR_BASE
>   CONFIG_SYS_MONITOR_BASE_EARLY
> ---
> -2.26.2
> +-- 
> +2.28.0
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> index e8e1088..204bdb3 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> @@ -1,7 +1,7 @@
> -From d74c2d6f475bef05c114e859ab52bd721fbee7b2 Mon Sep 17 00:00:00 2001
> +From eed15d394137616a18add204a85b0e9dd5b00e0b Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Wed, 8 Jan 2020 09:48:11 +0000
> -Subject: [PATCH 2/3] board: arm: add designstart cortex-a5 board
> +Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
>  
>  Arm added a new board, designstart, with a cortex-a5 chip, add the
>  default configuration, initialization and makefile for this system.
> @@ -22,23 +22,23 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   create mode 100644 include/configs/designstart_ca5.h
>  
>  diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index bbb1e2738bfe..8f918f6e0375 100644
> +index 54d65f84889f..7bc12f0b4300 100644
>  --- a/arch/arm/Kconfig
>  +++ b/arch/arm/Kconfig
> -@@ -636,6 +636,12 @@ config ARCH_BCM6858
> -       select OF_CONTROL
> -       imply CMD_DM
> -
> +@@ -665,6 +665,12 @@ config ARCH_BCM6858
> + 	select OF_CONTROL
> + 	imply CMD_DM
> + 
>  +config TARGET_DESIGNSTART_CA5
> -+      bool "Support Designstart Cortex-A5"
> -+      select CPU_V7A
> -+      select SEMIHOSTING
> -+      select PL01X_SERIAL
> ++	bool "Support Designstart Cortex-A5"
> ++	select CPU_V7A
> ++	select SEMIHOSTING
> ++	select PL01X_SERIAL
>  +
>   config TARGET_VEXPRESS_CA15_TC2
> -       bool "Support vexpress_ca15_tc2"
> -       select CPU_V7A
> -@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
> + 	bool "Support vexpress_ca15_tc2"
> + 	select CPU_V7A
> +@@ -1866,6 +1872,7 @@ source "board/Marvell/gplugd/Kconfig"
>   source "board/armadeus/apf27/Kconfig"
>   source "board/armltd/vexpress/Kconfig"
>   source "board/armltd/vexpress64/Kconfig"
> @@ -304,6 +304,6 @@ index 000000000000..6db5b1cf4ac2
>  +#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
>  +#define CONFIG_ENV_IS_IN_FLASH                1
>  +#endif
> ---
> -2.26.2
> +-- 
> +2.28.0
>  
> -- 
> 2.28.0
> 

> 
> 
> 

