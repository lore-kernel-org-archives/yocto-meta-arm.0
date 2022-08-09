Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8816C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 12:37:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.11302.1660048639054146765
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cz1kAlzD;
 spf=pass (domain: linaro.org, ip: 209.85.221.41,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id n4so12410974wrp.10
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cl2OG2KcXzXbDtKA71nrdUNDVzBTMY2hDqqKaNLBdz8=;
        b=cz1kAlzD03tFo853HXe2ntamMQs2A5XHFOaeZZdu1g95z2GuSmsoEVmahPYiGuDv3z
         2lojxik6qCOG97yGe1Ln3QT01qZtZ7n1QTL1Amsrt+KARqu3wLrem/IB4XoT28U5Px3u
         5Of5ng2WSIb0ricke/b+tqWiZ89c0/8u95SpjG43/KAqZmy5hKkwV6igc81XwW9s4k2M
         GBKtnobAo/Awpb4KcS7eIfP5KDkblDva+3seA2keMm5sTW3YtWsE5FgvMneLfzM5k+KB
         u23gAamo1WIaX7rUNsDiJvr9BaupGA5XCEaFzkf7LRu2LT6SWLpAlTPNHtaBwAmhunwC
         dBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cl2OG2KcXzXbDtKA71nrdUNDVzBTMY2hDqqKaNLBdz8=;
        b=09WFrVHBxlOMc3br1XcjkIId6rYRTCw9aTf2H7VjYQiwca7uXhRWDg0ljo3nLDb5+2
         ankEXQXlUtHQ10Qth63htxja+mBJKeXQNhgnw5H2MY8m4ahN9aVFMIoyomrQOkASQgzi
         meOblm5na0vBY4ttZnRm1V5UZ2+zF+NzuoQQpDchNzaBTnY3x4AAWQPf6nNx6duoFABn
         cPxTBVcrpN6XfYnaT8cFpZt+zRShmtfGi0ltFU+/RJioYNT1fzosJIZ0M2oy3qmVZsyK
         F1kAr01CWgc4h3OH5ih9y8XEgWxIBj+OlVrNoYFkiQzalZIrwOwuZB/U4BUhTq7Rd0I6
         cobQ==
X-Gm-Message-State: ACgBeo1Ne1qCKiBxEtWUZptrJfWjoSln7+duIaI97UrtxbNJFe153VuW
	IhVnERr9T3/z6mSRUeggBj/2wJoB70ciCQ==
X-Google-Smtp-Source: 
 AA6agR7by2dAL2Dy2Ry8eru5V0MpeyKtr+1sUBEHAxNt6WiPQlTvS8khzjxD3SP4sEyUOtGOTxLU5g==
X-Received: by 2002:a5d:5957:0:b0:220:6004:18c2 with SMTP id
 e23-20020a5d5957000000b00220600418c2mr14248441wri.568.1660048637182;
        Tue, 09 Aug 2022 05:37:17 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003a38606385esm2081883wms.3.2022.08.09.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 05:37:16 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/2] arm-bsp/corstone500: rebase u-boot patches on v2022.07
Date: Tue,  9 Aug 2022 13:37:09 +0100
Message-Id: <20220809123709.2985416-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809123709.2985416-1-rui.silva@linaro.org>
References: <20220809123709.2985416-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Aug 2022 12:37:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3664

Rebase corstone500 on top of v2022.07, since the version is
the one used upstream.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 ...ng-generic-timer-access-through-MMIO.patch | 16 ++++++++------
 ...0002-board-arm-add-corstone500-board.patch | 22 ++++++++++---------
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 1d25471c6827..adcfddd0d089 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 UBOOT_MACHINE = "corstone500_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
 UBOOT_IMAGE_LOADADDRESS = "0x84000000"
-PREFERRED_VERSION_u-boot ?= "2022.04"
+PREFERRED_VERSION_u-boot ?= "2022.07"
 
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
index 8a98f9dedcce..9a2997569f7f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
@@ -1,4 +1,4 @@
-From fff63cfd7d9654dc9ed0c106f29d3a7ad01b0502 Mon Sep 17 00:00:00 2001
+From d75d794785419592ba49046165d19a6ec9488b2d Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
 Subject: [PATCH 1/2] armv7: adding generic timer access through MMIO
@@ -21,6 +21,8 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 
 %% original patch: 0001-armv7-adding-generic-timer-access-through-MMIO.patch
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  arch/arm/cpu/armv7/Makefile     |  1 +
  arch/arm/cpu/armv7/mmio_timer.c | 75 +++++++++++++++++++++++++++++++++
@@ -29,7 +31,7 @@ Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
  create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
 
 diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
-index bfbd85ae64..1a0a24e531 100644
+index bfbd85ae64ef..1a0a24e53110 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
 @@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
@@ -42,7 +44,7 @@ index bfbd85ae64..1a0a24e531 100644
  obj-y += s5p-common/
 diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
 new file mode 100644
-index 0000000000..edd806e06e
+index 000000000000..edd806e06e42
 --- /dev/null
 +++ b/arch/arm/cpu/armv7/mmio_timer.c
 @@ -0,0 +1,75 @@
@@ -122,17 +124,17 @@ index 0000000000..edd806e06e
 +	return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index a6bc234f51..8d5cd67ace 100644
+index c61df4fb1c9b..cfb1c68b6297 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -1524,6 +1524,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+@@ -1253,6 +1253,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
  CONFIG_SYS_MMC_U_BOOT_OFFS
  CONFIG_SYS_MMC_U_BOOT_SIZE
  CONFIG_SYS_MMC_U_BOOT_START
 +CONFIG_SYS_MMIO_TIMER
- CONFIG_SYS_MONITOR_BASE
  CONFIG_SYS_MONITOR_LEN
  CONFIG_SYS_MONITOR_SEC
+ CONFIG_SYS_MOR_VAL
 -- 
-2.30.2
+2.37.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
index 29b29438c8ac..c389a64c8791 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
@@ -1,4 +1,4 @@
-From 73c319a1096259652853fa2538a733a8ebea96a8 Mon Sep 17 00:00:00 2001
+From 3566cf4ab79ca78acd69cfb87e74587394e5aeb2 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
 Subject: [PATCH 2/2] board: arm: add corstone500 board
@@ -13,6 +13,8 @@ makefile for this system.
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 
 %% original patch: 0002-board-arm-add-corstone500-board.patch
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  arch/arm/Kconfig                       |  10 +++
  board/armltd/corstone500/Kconfig       |  12 +++
@@ -28,10 +30,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/corstone500.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 4567c183fb..66f99fdf4f 100644
+index 9898c7d68e1b..8c60ed39712e 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -641,6 +641,15 @@ config ARCH_BCMSTB
+@@ -718,6 +718,15 @@ config ARCH_BCMSTB
  	  This enables support for Broadcom ARM-based set-top box
  	  chipsets, including the 7445 family of chips.
  
@@ -47,7 +49,7 @@ index 4567c183fb..66f99fdf4f 100644
  config TARGET_VEXPRESS_CA9X4
  	bool "Support vexpress_ca9x4"
  	select CPU_V7A
-@@ -2202,6 +2211,7 @@ source "board/bosch/shc/Kconfig"
+@@ -2299,6 +2308,7 @@ source "board/bosch/shc/Kconfig"
  source "board/bosch/guardian/Kconfig"
  source "board/Marvell/octeontx/Kconfig"
  source "board/Marvell/octeontx2/Kconfig"
@@ -57,7 +59,7 @@ index 4567c183fb..66f99fdf4f 100644
  source "board/cortina/presidio-asic/Kconfig"
 diff --git a/board/armltd/corstone500/Kconfig b/board/armltd/corstone500/Kconfig
 new file mode 100644
-index 0000000000..8e689bd1fd
+index 000000000000..8e689bd1fdc8
 --- /dev/null
 +++ b/board/armltd/corstone500/Kconfig
 @@ -0,0 +1,12 @@
@@ -75,7 +77,7 @@ index 0000000000..8e689bd1fd
 +endif
 diff --git a/board/armltd/corstone500/Makefile b/board/armltd/corstone500/Makefile
 new file mode 100644
-index 0000000000..6598fdd3ae
+index 000000000000..6598fdd3ae0d
 --- /dev/null
 +++ b/board/armltd/corstone500/Makefile
 @@ -0,0 +1,8 @@
@@ -89,7 +91,7 @@ index 0000000000..6598fdd3ae
 +obj-y := corstone500.o
 diff --git a/board/armltd/corstone500/corstone500.c b/board/armltd/corstone500/corstone500.c
 new file mode 100644
-index 0000000000..e878f5c6a5
+index 000000000000..e878f5c6a521
 --- /dev/null
 +++ b/board/armltd/corstone500/corstone500.c
 @@ -0,0 +1,48 @@
@@ -143,7 +145,7 @@ index 0000000000..e878f5c6a5
 +
 diff --git a/configs/corstone500_defconfig b/configs/corstone500_defconfig
 new file mode 100644
-index 0000000000..d3161a4b40
+index 000000000000..d3161a4b40d8
 --- /dev/null
 +++ b/configs/corstone500_defconfig
 @@ -0,0 +1,40 @@
@@ -189,7 +191,7 @@ index 0000000000..d3161a4b40
 +CONFIG_OF_LIBFDT=y
 diff --git a/include/configs/corstone500.h b/include/configs/corstone500.h
 new file mode 100644
-index 0000000000..93c397d2f5
+index 000000000000..93c397d2f515
 --- /dev/null
 +++ b/include/configs/corstone500.h
 @@ -0,0 +1,109 @@
@@ -303,5 +305,5 @@ index 0000000000..93c397d2f5
 +#define CONFIG_ENV_IS_IN_FLASH		1
 +#endif
 -- 
-2.30.2
+2.37.1
 
-- 
2.37.1


