Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C93FC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 01:00:44 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.3305.1635814843025233065
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 18:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Jyp+L4GF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id v2so12321056qve.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 18:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KuJ1a182xjaF577OgzUrkZo7ZA1Y7fKst5RotHfgQeE=;
        b=Jyp+L4GFZiHWy3bYhHVRtYT4OakKVdKOeBA1Bk4sYQTtykjisqQbtpto+57SQQwfVv
         8F8k5UMpKAuoNS1VT7XWUB671TdmziaGYnWf0VSbcmJuUuQkaPucjPfVweKjM2Vkm11k
         eNGFiUMema0XCGoCw0Srl9YbO+B8LkZ5OFqCmjq3tyWJuwttfuNgSQWbCvc4ycNOqjQd
         p7baHHRWGdNETgdLbn0Fgu8I9O4Z0JimN81sSpTo8SrPtKBHH+P4RlgDvzQOtA7ExXLK
         W7CQz7MblJ67gp4w1433ZyjjQnM1XO5ezmWAiW/X3xiI5s972wOy1/fm3ecw9XbRpR+q
         fIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KuJ1a182xjaF577OgzUrkZo7ZA1Y7fKst5RotHfgQeE=;
        b=fqRDIhemjGzvJ6AjEondkW9sjrCalY8J+x6hMryMdsCc4HUh7C+nrzZ34ABLUghA5c
         rkq6U6O1xNDIjms/tEPUKH/m4tucAIMqFwebI3ayvnU9tx6hKZmujagr6AiYaLvLMBTA
         Cb7UgKk2BxGMVA43IP8C5z8mjIh+ObR2LxHTeunPwK6UhWqgEjgNZPTVuOQu+23OcZvV
         s8KPLvkXjuCF+uqquJ1sVdm5J8SGLj2BeO2p6/Gh5rZ65RppGRa/jruAqYumBK+L0Dv1
         qIch55LQ1riVltLZ0LEE8zhYdE0sNGRUswqWFT8Sz1t7EDvaJ5mkO5m3HOMIzFrghgwP
         YKmA==
X-Gm-Message-State: AOAM532UnwY2tgk9cVgCTu30IItqPyyH0tC64aqiZor63gdHtSBFfIVp
	Un/xaSVDtbdl3IuCS5RRV8iGfdRDIrrtRQ==
X-Google-Smtp-Source: 
 ABdhPJyySCcXo90NjkozFHXn5unMV+/Jkxwe0gRkH+/yvPz3SJD5pGSZt3zvFBZ5vyOjtp8sC4wPRg==
X-Received: by 2002:a0c:b2c5:: with SMTP id d5mr31521156qvf.65.1635814841040;
        Mon, 01 Nov 2021 18:00:41 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:e909:8c96:f147:8c9c])
        by smtp.gmail.com with ESMTPSA id
 f2sm11275543qtv.45.2021.11.01.18.00.40
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 18:00:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp: use new u-boot version
Date: Mon,  1 Nov 2021 21:00:39 -0400
Message-Id: <20211102010039.27084-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102010039.27084-1-jon.mason@arm.com>
References: <20211102010039.27084-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Nov 2021 01:00:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2330

Changes necessary to get the u-boot version 2020.10.  TC patches are no
longer necessary, as they are upstreamed.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc      |  2 +-
 .../conf/machine/include/corstone1000.inc     |  2 +-
 meta-arm-bsp/conf/machine/include/tc.inc      |  3 +-
 ...ove-bootargs-from-Total-Compute-conf.patch | 33 -------------
 ...0002-cmd-part-Correct-error-handling.patch | 32 -------------
 .../0001-arm-add-corstone1000-platform.patch  | 48 +++++++++----------
 ...e1000-enable-devicetree-in-defconfig.patch | 18 ++++---
 ...3-usb-common-move-urb-code-to-common.patch | 34 +++++++------
 .../0004-usb-add-isp1760-family-driver.patch  | 44 ++++++++---------
 ...one1000-enable-isp1763-and-usb-stack.patch | 25 +++++-----
 ...-corstone1000-enable-support-for-FVP.patch | 26 +++++-----
 ...-sharing-PSCI-DTS-node-between-FVP-a.patch | 15 +++---
 ...rm-corstone1000-Emulated-RTC-Support.patch | 20 ++++----
 ...-corstone1000-execute-uboot-from-DDR.patch | 16 +++----
 ...d-add-load-command-for-memory-mapped.patch | 38 +++++++--------
 ...-corstone1000-enable-boot-using-uefi.patch | 18 ++++---
 ...corstone1000-enable-uefi-secure-boot.patch | 20 ++++----
 ...0-enable-handlers-for-uefi-variables.patch | 20 ++++----
 ...stone1000-enable-efi-capsule-options.patch | 18 ++++---
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 24 +++++-----
 .../tc/bootargs.cfg                           |  0
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  7 ++-
 .../u-boot/u-boot_2021.07.bbappend            | 21 --------
 23 files changed, 186 insertions(+), 298 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0002-cmd-part-Correct-error-handling.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2021.07 => u-boot}/tc/bootargs.cfg (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 9adb430983ae..0dd7ebd3eaff 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
 
-PREFERRED_VERSION_u-boot ?= "2021.07"
+PREFERRED_VERSION_u-boot ?= "2021.10"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 753347debdcb..2df46274cf88 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -25,7 +25,7 @@ TFM_SIGN_PRIVATE_KEY = "${S}/bl2/ext/mcuboot/root-RSA-3072_1.pem"
 RE_IMAGE_OFFSET = "0x1000"
 
 # u-boot
-PREFERRED_VERSION_u-boot ?= "2021.07"
+PREFERRED_VERSION_u-boot ?= "2021.10"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 UBOOT_CONFIG ??= "EFI"
diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf/machine/include/tc.inc
index fb2362d86d38..dd0b872eec3d 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -6,7 +6,6 @@ MACHINEOVERRIDES =. "tc:"
 
 # Das U-boot
 UBOOT_MACHINE ?= "total_compute_defconfig"
-PREFERRED_VERSION_u-boot ?= "2021.07"
 UBOOT_RD_LOADADDRESS = "0x88000000"
 UBOOT_RD_ENTRYPOINT = "0x88000000"
 UBOOT_LOADADDRESS = "0x80080000"
@@ -36,4 +35,4 @@ KERNEL_CLASSES = " kernel-fitimage "
 IMAGE_FSTYPES += "cpio.gz"
 INITRAMFS_IMAGE ?= "core-image-minimal"
 
-SERIAL_CONSOLES = "115200;ttyAMA0"
\ No newline at end of file
+SERIAL_CONSOLES = "115200;ttyAMA0"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
deleted file mode 100644
index 87d8469c9bbc..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 893c4a4089f796d1282b3ebde3d327db00e07157 Mon Sep 17 00:00:00 2001
-From: Anders Dellien <anders.dellien@arm.com>
-Date: Tue, 8 Jun 2021 09:35:56 +0100
-Subject: [PATCH 1/2] board: armltd: Remove bootargs from Total Compute
- configuration
-
-This information will be maintained in the device tree instead.
-
-Signed-off-by: Anders Dellien <anders.dellien@arm.com>
-Change-Id: I279399d4a0ea1a3330de5b58e8c9af78e48ba04c
-
-Upstream-Status: Pending [https://lists.denx.de/pipermail/u-boot/2021-June/452156.html]
----
- configs/total_compute_defconfig | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configs/total_compute_defconfig b/configs/total_compute_defconfig
-index e36d701ff4..954023fae5 100644
---- a/configs/total_compute_defconfig
-+++ b/configs/total_compute_defconfig
-@@ -11,8 +11,7 @@ CONFIG_FIT=y
- CONFIG_FIT_SIGNATURE=y
- CONFIG_LEGACY_IMAGE_FORMAT=y
- CONFIG_BOOTDELAY=5
--CONFIG_USE_BOOTARGS=y
--CONFIG_BOOTARGS="console=ttyAMA0 debug user_debug=31 earlycon=pl011,0x7ff80000 loglevel=9 androidboot.hardware=total_compute video=640x480-32@60 androidboot.boot_devices=1c050000.mmci ip=dhcp androidboot.selinux=permissive"
-+# CONFIG_USE_BOOTARGS is not set
- # CONFIG_USE_BOOTCOMMAND is not set
- # CONFIG_DISPLAY_CPUINFO is not set
- # CONFIG_DISPLAY_BOARDINFO is not set
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0002-cmd-part-Correct-error-handling.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0002-cmd-part-Correct-error-handling.patch
deleted file mode 100644
index dfb0f4f827f6..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/0002-cmd-part-Correct-error-handling.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2fb7e756c005fe60b440943cfe0cbd39a82c79ac Mon Sep 17 00:00:00 2001
-From: Anders Dellien <anders.dellien@arm.com>
-Date: Tue, 15 Jun 2021 15:38:55 +0100
-Subject: [PATCH 2/2] cmd: part: Correct error handling
-
-As 'part_get_info_by_name' now returns more status codes than just
--1 to indicate failure, we need to update the return value check.
-
-Signed-off-by: Anders Dellien <anders.dellien@arm.com>
-Change-Id: Id972be70e9ed12fecaf97793b12d23ccc57007e7
-
-Upstream-Status: Pending [https://lists.denx.de/pipermail/u-boot/2021-June/452573.html]
----
- cmd/part.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmd/part.c b/cmd/part.c
-index 3395c17b89..e0463b5a54 100644
---- a/cmd/part.c
-+++ b/cmd/part.c
-@@ -140,7 +140,7 @@ static int do_part_info(int argc, char *const argv[], enum cmd_part_info param)
- 			return 1;
- 	} else {
- 		part = part_get_info_by_name(desc, argv[2], &info);
--		if (part == -1)
-+		if (part < 0)
- 			return 1;
- 	}
- 
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
index 1fe0fb84450d..4b2edc07e35b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
@@ -1,23 +1,24 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 3feb071c77bb6297165c7b671b5c92d6ba306238 Mon Sep 17 00:00:00 2001
+From 3a2ea6e1214b4f74dc99ae80637ea7bad451f6a4 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Jun 2021 10:58:24 +0100
-Subject: [PATCH 01/16] arm: add corstone1000 platform
+Subject: [PATCH] arm: add corstone1000 platform
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 Add support for new corstone1000 platform.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+
 ---
- arch/arm/Kconfig                |  9 ++++
- board/armltd/corstone1000/Kconfig     | 12 +++++
- board/armltd/corstone1000/MAINTAINERS |  6 +++
- board/armltd/corstone1000/Makefile    |  7 +++
- board/armltd/corstone1000/corstone1000.c    | 92 +++++++++++++++++++++++++++++++++
- configs/corstone1000_defconfig        | 39 ++++++++++++++
- include/configs/corstone1000.h        | 80 ++++++++++++++++++++++++++++
+ arch/arm/Kconfig                         |  9 +++
+ board/armltd/corstone1000/Kconfig        | 12 ++++
+ board/armltd/corstone1000/MAINTAINERS    |  6 ++
+ board/armltd/corstone1000/Makefile       |  7 ++
+ board/armltd/corstone1000/corstone1000.c | 92 ++++++++++++++++++++++++
+ configs/corstone1000_defconfig           | 39 ++++++++++
+ include/configs/corstone1000.h           | 80 +++++++++++++++++++++
  7 files changed, 245 insertions(+)
  create mode 100644 board/armltd/corstone1000/Kconfig
  create mode 100644 board/armltd/corstone1000/MAINTAINERS
@@ -27,12 +28,12 @@ Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
  create mode 100644 include/configs/corstone1000.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 0448787b8b..25d2a707be 100644
+index b5bd3284cd1c..392e147756ee 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1173,6 +1173,13 @@ config TARGET_VEXPRESS64_JUNO
+@@ -1186,6 +1186,13 @@ config TARGET_VEXPRESS64_JUNO
+ 	select BLK
  	select USB
- 	select DM_USB
  
 +config TARGET_CORSTONE1000
 +	bool "Support Corstone1000 Platform"
@@ -44,7 +45,7 @@ index 0448787b8b..25d2a707be 100644
  config TARGET_TOTAL_COMPUTE
  	bool "Support Total Compute Platform"
  	select ARM64
-@@ -1985,6 +1992,8 @@ source "arch/arm/mach-nexell/Kconfig"
+@@ -2046,6 +2053,8 @@ source "arch/arm/mach-nexell/Kconfig"
  
  source "board/armltd/total_compute/Kconfig"
  
@@ -55,7 +56,7 @@ index 0448787b8b..25d2a707be 100644
  source "board/CarMediaLab/flea3/Kconfig"
 diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone1000/Kconfig
 new file mode 100644
-index 000000000000..90e6b7af59cb
+index 000000000000..709674d4cf7d
 --- /dev/null
 +++ b/board/armltd/corstone1000/Kconfig
 @@ -0,0 +1,12 @@
@@ -73,7 +74,7 @@ index 000000000000..90e6b7af59cb
 +endif
 diff --git a/board/armltd/corstone1000/MAINTAINERS b/board/armltd/corstone1000/MAINTAINERS
 new file mode 100644
-index 000000000000..601cff17b666
+index 000000000000..313ed7133ecc
 --- /dev/null
 +++ b/board/armltd/corstone1000/MAINTAINERS
 @@ -0,0 +1,6 @@
@@ -85,7 +86,7 @@ index 000000000000..601cff17b666
 +F:	configs/corstone1000_defconfig
 diff --git a/board/armltd/corstone1000/Makefile b/board/armltd/corstone1000/Makefile
 new file mode 100644
-index 000000000000..7bad6f57f1ce
+index 000000000000..c26e609e2c01
 --- /dev/null
 +++ b/board/armltd/corstone1000/Makefile
 @@ -0,0 +1,7 @@
@@ -98,7 +99,7 @@ index 000000000000..7bad6f57f1ce
 +obj-y	:= corstone1000.o
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
 new file mode 100644
-index 000000000000..fe986ceba1c5
+index 000000000000..ab98fa87fbcd
 --- /dev/null
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -0,0 +1,92 @@
@@ -196,7 +197,7 @@ index 000000000000..fe986ceba1c5
 +}
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
 new file mode 100644
-index 000000000000..47d4bf3771e0
+index 000000000000..bc983e65557e
 --- /dev/null
 +++ b/configs/corstone1000_defconfig
 @@ -0,0 +1,39 @@
@@ -241,7 +242,7 @@ index 000000000000..47d4bf3771e0
 +CONFIG_OF_LIBFDT=y
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
 new file mode 100644
-index 000000000000..c8e630c5d857
+index 000000000000..1fe909463f93
 --- /dev/null
 +++ b/include/configs/corstone1000.h
 @@ -0,0 +1,80 @@
@@ -325,6 +326,3 @@ index 000000000000..c8e630c5d857
 +				"bootm $kernel_addr_r - $fdt_addr_r; "
 +
 +#endif
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
index df8c6eda606e..384c9b0f1cb7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
@@ -1,22 +1,23 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 1a034bd9397f96939d58a86e9cf8cd9c206db647 Mon Sep 17 00:00:00 2001
+From 293595471c5fb2b266d97e372dbf5f9279350272 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 22 Jun 2021 17:00:24 +0100
-Subject: [PATCH 02/16] arm: corstone1000: enable devicetree in defconfig
+Subject: [PATCH] arm: corstone1000: enable devicetree in defconfig
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 Add support and setup the default device tree for corstone1000.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+
 ---
  configs/corstone1000_defconfig |  3 ++-
  include/configs/corstone1000.h | 10 +++-------
  2 files changed, 5 insertions(+), 8 deletions(-)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index bc983e6555..54c746d829 100644
+index bc983e65557e..54c746d829cb 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -6,7 +6,8 @@ CONFIG_SYS_MALLOC_F_LEN=0x2000
@@ -30,7 +31,7 @@ index bc983e6555..54c746d829 100644
  CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9"
  # CONFIG_DISPLAY_CPUINFO is not set
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index 1fe909463f..389ac45a58 100644
+index 1fe909463f93..389ac45a5819 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -64,17 +64,13 @@
@@ -54,6 +55,3 @@ index 1fe909463f..389ac45a58 100644
 +                                "cp.b $kernel_addr $kernel_addr_r 0xc00000;" \
 +                                "booti $kernel_addr_r - $fdtcontroladdr; "
  #endif
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
index 1a73d52fcc15..3d759d3bff2a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
@@ -1,15 +1,16 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 84b3b8f2443d0b4f6ac8ef95c941b27d734afbde Mon Sep 17 00:00:00 2001
+From 022b70e5f1ca6b5f2e6edbc7c150902989d3b586 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:20:55 +0100
-Subject: [PATCH 03/16] usb: common: move urb code to common
+Subject: [PATCH] usb: common: move urb code to common
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 Move urb code from musb only use to a more common scope, so other
 drivers in the future can use the handling of urb in usb.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  drivers/usb/common/Makefile                   |   2 +
  drivers/usb/common/usb_urb.c                  | 160 ++++++++++++++++++
@@ -26,7 +27,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  rename drivers/usb/musb-new/usb-compat.h => include/linux/usb/usb_urb_compat.h (57%)
 
 diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
-index 3bedbf213f..dc05cb0a50 100644
+index 3bedbf213f47..dc05cb0a5077 100644
 --- a/drivers/usb/common/Makefile
 +++ b/drivers/usb/common/Makefile
 @@ -4,5 +4,7 @@
@@ -39,7 +40,7 @@ index 3bedbf213f..dc05cb0a50 100644
  obj-$(CONFIG_USB_XHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
 diff --git a/drivers/usb/common/usb_urb.c b/drivers/usb/common/usb_urb.c
 new file mode 100644
-index 0000000000..be3b6b9f32
+index 000000000000..be3b6b9f32e8
 --- /dev/null
 +++ b/drivers/usb/common/usb_urb.c
 @@ -0,0 +1,160 @@
@@ -204,7 +205,7 @@ index 0000000000..be3b6b9f32
 +	return usb_urb_submit(hcd, urb);
 +}
 diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
-index f1fc93f3d4..3ccbc16da3 100644
+index f1fc93f3d403..3ccbc16da379 100644
 --- a/drivers/usb/host/r8a66597-hcd.c
 +++ b/drivers/usb/host/r8a66597-hcd.c
 @@ -14,6 +14,7 @@
@@ -252,7 +253,7 @@ index f1fc93f3d4..3ccbc16da3 100644
  {
  	struct usb_device *parent = usb_dev_get_parent(dev);
 diff --git a/drivers/usb/musb-new/musb_core.c b/drivers/usb/musb-new/musb_core.c
-index 22811a5efb..d1d4ee2da3 100644
+index 18d9bc805f8a..fc7af7484e4c 100644
 --- a/drivers/usb/musb-new/musb_core.c
 +++ b/drivers/usb/musb-new/musb_core.c
 @@ -89,9 +89,9 @@
@@ -267,7 +268,7 @@ index 22811a5efb..d1d4ee2da3 100644
  
  #include "musb_core.h"
 diff --git a/drivers/usb/musb-new/musb_host.c b/drivers/usb/musb-new/musb_host.c
-index acb2d40f3b..e5905d90d6 100644
+index acb2d40f3b5a..e5905d90d66f 100644
 --- a/drivers/usb/musb-new/musb_host.c
 +++ b/drivers/usb/musb-new/musb_host.c
 @@ -26,8 +26,8 @@
@@ -281,7 +282,7 @@ index acb2d40f3b..e5905d90d6 100644
  
  #include "musb_core.h"
 diff --git a/drivers/usb/musb-new/musb_host.h b/drivers/usb/musb-new/musb_host.h
-index afc8fa35a7..5a604bdb0c 100644
+index afc8fa35a738..5a604bdb0cf2 100644
 --- a/drivers/usb/musb-new/musb_host.h
 +++ b/drivers/usb/musb-new/musb_host.h
 @@ -10,7 +10,7 @@
@@ -294,7 +295,7 @@ index afc8fa35a7..5a604bdb0c 100644
  
  static inline struct usb_hcd *musb_to_hcd(struct musb *musb)
 diff --git a/drivers/usb/musb-new/musb_uboot.c b/drivers/usb/musb-new/musb_uboot.c
-index 8ac2f0a78a..85794356b0 100644
+index 8ac2f0a78adb..85794356b0bc 100644
 --- a/drivers/usb/musb-new/musb_uboot.c
 +++ b/drivers/usb/musb-new/musb_uboot.c
 @@ -8,10 +8,10 @@
@@ -350,7 +351,7 @@ index 8ac2f0a78a..85794356b0 100644
 -}
 -#endif
 diff --git a/drivers/usb/musb-new/musb_uboot.h b/drivers/usb/musb-new/musb_uboot.h
-index 18282efccc..6b162f03b1 100644
+index 18282efccc9d..6b162f03b19e 100644
 --- a/drivers/usb/musb-new/musb_uboot.h
 +++ b/drivers/usb/musb-new/musb_uboot.h
 @@ -8,8 +8,8 @@
@@ -367,7 +368,7 @@ diff --git a/drivers/usb/musb-new/usb-compat.h b/include/linux/usb/usb_urb_compa
 similarity index 57%
 rename from drivers/usb/musb-new/usb-compat.h
 rename to include/linux/usb/usb_urb_compat.h
-index 1c66c4fe36..438e70b56a 100644
+index 1c66c4fe3637..438e70b56a63 100644
 --- a/drivers/usb/musb-new/usb-compat.h
 +++ b/include/linux/usb/usb_urb_compat.h
 @@ -1,16 +1,31 @@
@@ -450,7 +451,7 @@ index 1c66c4fe36..438e70b56a 100644
 +
  #endif /* __USB_COMPAT_H__ */
 diff --git a/include/usb_defs.h b/include/usb_defs.h
-index 6dd2c997f9..ec00161710 100644
+index 6dd2c997f9b3..ec00161710a5 100644
 --- a/include/usb_defs.h
 +++ b/include/usb_defs.h
 @@ -81,6 +81,32 @@
@@ -503,6 +504,3 @@ index 6dd2c997f9..ec00161710 100644
  
  /*
   * Hub Status & Hub Change bit masks
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
index 9d75164f76e2..f1ab1198bbac 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
@@ -1,15 +1,16 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From a007c43ab35e81bb609e9af28ebe4f73ee196823 Mon Sep 17 00:00:00 2001
+From ed07f24d76951a10b6be5ec964ed6dd9ef2cb0bf Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 28 Jun 2021 23:31:25 +0100
-Subject: [PATCH 04/16] usb: add isp1760 family driver
+Subject: [PATCH] usb: add isp1760 family driver
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 ISP1760/61/63 are a family of usb controllers, blah, blah, more info
 here.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  Makefile                            |    1 +
  drivers/usb/Kconfig                 |    2 +
@@ -37,19 +38,19 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 drivers/usb/isp1760/isp1760-uboot.h
 
 diff --git a/Makefile b/Makefile
-index 2ab9c53192..570e35d566 100644
+index 20c1aa3f58a5..fa3c5d9d2407 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -828,6 +828,7 @@ libs-y += drivers/usb/host/
+@@ -842,6 +842,7 @@ libs-y += drivers/usb/host/
  libs-y += drivers/usb/mtu3/
  libs-y += drivers/usb/musb/
  libs-y += drivers/usb/musb-new/
 +libs-y += drivers/usb/isp1760/
  libs-y += drivers/usb/phy/
  libs-y += drivers/usb/ulpi/
- libs-y += cmd/
+ ifdef CONFIG_POST
 diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
-index f6975730bf..6f7b4d4db4 100644
+index ab1d061bd0d5..bbe07be02cab 100644
 --- a/drivers/usb/Kconfig
 +++ b/drivers/usb/Kconfig
 @@ -78,6 +78,8 @@ source "drivers/usb/musb/Kconfig"
@@ -62,7 +63,7 @@ index f6975730bf..6f7b4d4db4 100644
  
  source "drivers/usb/phy/Kconfig"
 diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
-index dc05cb0a50..f08b064d24 100644
+index dc05cb0a5077..f08b064d2493 100644
 --- a/drivers/usb/common/Makefile
 +++ b/drivers/usb/common/Makefile
 @@ -4,6 +4,7 @@
@@ -75,7 +76,7 @@ index dc05cb0a50..f08b064d24 100644
  obj-$(CONFIG_USB_EHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
 diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
 new file mode 100644
-index 0000000000..e76fb5e4cc
+index 000000000000..e76fb5e4ccf5
 --- /dev/null
 +++ b/drivers/usb/isp1760/Kconfig
 @@ -0,0 +1,13 @@
@@ -94,7 +95,7 @@ index 0000000000..e76fb5e4cc
 +
 diff --git a/drivers/usb/isp1760/Makefile b/drivers/usb/isp1760/Makefile
 new file mode 100644
-index 0000000000..2c809c01b1
+index 000000000000..2c809c01b118
 --- /dev/null
 +++ b/drivers/usb/isp1760/Makefile
 @@ -0,0 +1,6 @@
@@ -106,7 +107,7 @@ index 0000000000..2c809c01b1
 +obj-$(CONFIG_USB_ISP1760) += isp1760.o
 diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
 new file mode 100644
-index 0000000000..3080595549
+index 000000000000..3080595549c5
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-core.c
 @@ -0,0 +1,378 @@
@@ -490,7 +491,7 @@ index 0000000000..3080595549
 +}
 diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
 new file mode 100644
-index 0000000000..0a60e30b5f
+index 000000000000..0a60e30b5fe7
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-core.h
 @@ -0,0 +1,96 @@
@@ -592,7 +593,7 @@ index 0000000000..0a60e30b5f
 +#endif
 diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
 new file mode 100644
-index 0000000000..b1d86dd69b
+index 000000000000..b1d86dd69b94
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-hcd.c
 @@ -0,0 +1,2574 @@
@@ -3172,7 +3173,7 @@ index 0000000000..b1d86dd69b
 +}
 diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
 new file mode 100644
-index 0000000000..00f5ca8c1f
+index 000000000000..00f5ca8c1f75
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-hcd.h
 @@ -0,0 +1,82 @@
@@ -3260,7 +3261,7 @@ index 0000000000..00f5ca8c1f
 +#endif /* _ISP1760_HCD_H_ */
 diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
 new file mode 100644
-index 0000000000..c610da6b23
+index 000000000000..c610da6b23fb
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-if.c
 @@ -0,0 +1,127 @@
@@ -3393,7 +3394,7 @@ index 0000000000..c610da6b23
 +};
 diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
 new file mode 100644
-index 0000000000..94ea60c20b
+index 000000000000..94ea60c20b2a
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-regs.h
 @@ -0,0 +1,292 @@
@@ -3691,7 +3692,7 @@ index 0000000000..94ea60c20b
 +#endif
 diff --git a/drivers/usb/isp1760/isp1760-uboot.c b/drivers/usb/isp1760/isp1760-uboot.c
 new file mode 100644
-index 0000000000..9f2eaa75f3
+index 000000000000..9f2eaa75f3ca
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-uboot.c
 @@ -0,0 +1,64 @@
@@ -3761,7 +3762,7 @@ index 0000000000..9f2eaa75f3
 +
 diff --git a/drivers/usb/isp1760/isp1760-uboot.h b/drivers/usb/isp1760/isp1760-uboot.h
 new file mode 100644
-index 0000000000..2486de6f9e
+index 000000000000..2486de6f9e27
 --- /dev/null
 +++ b/drivers/usb/isp1760/isp1760-uboot.h
 @@ -0,0 +1,27 @@
@@ -3792,6 +3793,3 @@ index 0000000000..2486de6f9e
 +extern struct dm_usb_ops isp1760_usb_ops;
 +
 +#endif
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
index 2e41677b12f1..9c75440b5c80 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
@@ -1,22 +1,23 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 663bfde59a56d65c031526f75f0e08126f02d845 Mon Sep 17 00:00:00 2001
+From c23a5b3c07e20586ab2d3fc0ea7bda3be633e936 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 27 Jul 2021 23:34:57 +0100
-Subject: [PATCH 05/16] corstone1000: enable isp1763 and usb stack
+Subject: [PATCH] corstone1000: enable isp1763 and usb stack
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 MPS3 board have a ISP1763 usb controller, add the correspondent mmio
 area and enable it to be used for mass storage access for example.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  board/armltd/corstone1000/corstone1000.c |  8 ++++++++
- configs/corstone1000_defconfig           | 19 +++++++++----------
- 2 files changed, 17 insertions(+), 10 deletions(-)
+ configs/corstone1000_defconfig           | 18 ++++++++----------
+ 2 files changed, 16 insertions(+), 10 deletions(-)
 
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
-index ab98fa87fb..a51f5ddfa0 100644
+index ab98fa87fbcd..a51f5ddfa002 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -46,6 +46,14 @@ static struct mm_region corstone1000_mem_map[] = {
@@ -35,7 +36,7 @@ index ab98fa87fb..a51f5ddfa0 100644
  		/* OCVM */
  		.virt = 0x80000000UL,
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index 54c746d829..fed2b16c93 100644
+index 54c746d829cb..8c0329611ba8 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -1,13 +1,12 @@
@@ -68,7 +69,7 @@ index 54c746d829..fed2b16c93 100644
  # CONFIG_CMD_ITEST is not set
  # CONFIG_CMD_SETEXPR is not set
  CONFIG_CMD_DHCP=y
-@@ -29,12 +27,13 @@ CONFIG_CMD_DHCP=y
+@@ -29,12 +27,12 @@ CONFIG_CMD_DHCP=y
  CONFIG_CMD_MII=y
  CONFIG_CMD_PING=y
  CONFIG_CMD_CACHE=y
@@ -84,9 +85,5 @@ index 54c746d829..fed2b16c93 100644
  CONFIG_DM_SERIAL=y
 -CONFIG_OF_LIBFDT=y
 +CONFIG_USB=y
-+CONFIG_DM_USB=y
 +CONFIG_USB_ISP1760=y
 +CONFIG_USB_STORAGE=y
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
index 38e77dc6b732..850ce1834ec0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
@@ -1,14 +1,15 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 8244c266643d7fe77e360d2927adcd123a691dd1 Mon Sep 17 00:00:00 2001
+From e2031439f590b260c5aa30f3a79e7118b20f0d88 Mon Sep 17 00:00:00 2001
 From: "Arpita S.K" <Arpita.S.K@arm.com>
 Date: Mon, 11 Oct 2021 11:41:25 +0530
-Subject: [PATCH 06/16] corstone1000: enable support for FVP
+Subject: [PATCH] corstone1000: enable support for FVP
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 Introduces a new device tree for the FVP.
 
 Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
+
 ---
  arch/arm/dts/Makefile             |   2 +
  arch/arm/dts/corstone1000-fvp.dts |  28 ++++++
@@ -19,12 +20,12 @@ Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
  create mode 100644 arch/arm/dts/corstone1000.dtsi
 
 diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index 9fb38682e6..c70c20b9a5 100644
+index fc16a57e60b0..0a694f19ba66 100644
 --- a/arch/arm/dts/Makefile
 +++ b/arch/arm/dts/Makefile
-@@ -1112,6 +1112,8 @@ dtb-$(CONFIG_TARGET_PRESIDIO_ASIC) += ca-presidio-engboard.dtb
+@@ -1130,6 +1130,8 @@ dtb-$(CONFIG_TARGET_IMX8MM_CL_IOT_GATE) += imx8mm-cl-iot-gate.dtb
  
- dtb-$(CONFIG_TARGET_IMX8MM_CL_IOT_GATE) += imx8mm-cl-iot-gate.dtb
+ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) += lpc3250-ea3250.dtb
  
 +dtb-$(CONFIG_TARGET_CORSTONE1000) += $(DEVICE_TREE).dtb
 +
@@ -33,7 +34,7 @@ index 9fb38682e6..c70c20b9a5 100644
  # Add any required device tree compiler flags here
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone1000-fvp.dts
 new file mode 100644
-index 0000000000..2188ca5e0e
+index 000000000000..2188ca5e0e4f
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-fvp.dts
 @@ -0,0 +1,28 @@
@@ -67,7 +68,7 @@ index 0000000000..2188ca5e0e
 +};
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
 new file mode 100644
-index 0000000000..b863193fb6
+index 000000000000..b863193fb642
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -0,0 +1,152 @@
@@ -224,7 +225,7 @@ index 0000000000..b863193fb6
 +	};
 +};
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index fed2b16c93..c7f291efb6 100644
+index 8c0329611ba8..941837355c98 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -4,7 +4,6 @@ CONFIG_SYS_TEXT_BASE=0x02100000
@@ -235,6 +236,3 @@ index fed2b16c93..c7f291efb6 100644
  CONFIG_FIT=y
  CONFIG_BOOTDELAY=3
  CONFIG_USE_BOOTARGS=y
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
index 3ed552949991..267cbec1efe2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
@@ -1,10 +1,11 @@
+From 845570f406ccc1919449d79a07bc166e54fedf58 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 25 Aug 2021 16:50:40 +0100
+Subject: [PATCH] arm: corstone1000: sharing PSCI DTS node between FVP
+
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
-From b50c1457fcd05cddf633bff074fc5edecff22e7e Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 25 Aug 2021 16:50:40 +0100
-Subject: [PATCH 07/16] arm: corstone1000: sharing PSCI DTS node between FVP
  and MPS3
 
 At this level of development PSCI is needed to initialize the SMCCC.
@@ -12,12 +13,13 @@ At this level of development PSCI is needed to initialize the SMCCC.
 SMCCC is needed by FF-A and it is relevant to the MPS3 and FVP.
 
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
 ---
  arch/arm/dts/corstone1000.dtsi | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
-index b863193fb6..da1725e01f 100644
+index b863193fb642..da1725e01f5f 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -149,4 +149,8 @@
@@ -29,6 +31,3 @@ index b863193fb6..da1725e01f 100644
 +		method = "smc";
 +	};
  };
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
index ba01fe556936..24f78cd2f565 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
@@ -1,25 +1,26 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 9a045bf04210bf9a00803fc47016e1af59d31e8f Mon Sep 17 00:00:00 2001
+From d365d3ecea5aed0620b953eb74024a5e5f5636c2 Mon Sep 17 00:00:00 2001
 From: "Arpita S.K" <Arpita.S.K@arm.com>
 Date: Mon, 11 Oct 2021 11:45:41 +0530
-Subject: [PATCH 08/16] arm: corstone1000: Emulated RTC Support
+Subject: [PATCH] arm: corstone1000: Emulated RTC Support
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 This patch adds the options that should be
 enabled to turn on emulated RTC support.
 
 Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
+
 ---
  configs/corstone1000_defconfig | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index c7f291efb6..dbe3c9e3f3 100644
+index 941837355c98..81fd067c2a79 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -36,3 +36,8 @@ CONFIG_USB=y
- CONFIG_DM_USB=y
+@@ -35,3 +35,8 @@ CONFIG_DM_SERIAL=y
+ CONFIG_USB=y
  CONFIG_USB_ISP1760=y
  CONFIG_USB_STORAGE=y
 +CONFIG_DM_RTC=y
@@ -27,6 +28,3 @@ index c7f291efb6..dbe3c9e3f3 100644
 +CONFIG_EFI_GET_TIME=y
 +CONFIG_EFI_SET_TIME=y
 +CONFIG_RTC_EMULATION=y
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
index b004e1b98ac8..5002178637ee 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
@@ -1,21 +1,22 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From b720b166364407ceb05385f5e72cb238195622ad Mon Sep 17 00:00:00 2001
+From 380efa943bc1b2b6b7d79b3dffb37a751c5fb4c1 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Wed, 1 Sep 2021 18:33:32 +0100
-Subject: [PATCH 09/16] arm: corstone1000: execute uboot from DDR
+Subject: [PATCH] arm: corstone1000: execute uboot from DDR
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 Previously uboot was executing from CVM. With the addition of
 secure partitions in optee, uboot has been moved to DDR.
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
 ---
  configs/corstone1000_defconfig | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index dbe3c9e3f3..af1c5ecd89 100644
+index 81fd067c2a79..d26932dd487c 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -1,6 +1,6 @@
@@ -26,6 +27,3 @@ index dbe3c9e3f3..af1c5ecd89 100644
  CONFIG_SYS_MALLOC_F_LEN=0x2000
  CONFIG_NR_DRAM_BANKS=1
  CONFIG_IDENT_STRING=" corstone1000 aarch64 "
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
index ca2039ca024e..9da2b2f8c214 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
@@ -1,10 +1,10 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 5278fb64beabeddd6c80229e5165f91ed1e95376 Mon Sep 17 00:00:00 2001
+From 53641a3776dc6c96716c81d9ca522ddf4756a07f Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 24 Jun 2021 09:25:00 +0100
-Subject: [PATCH 10/16] cmd: load: add load command for memory mapped
+Subject: [PATCH] cmd: load: add load command for memory mapped
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 cp.b is used a lot as a way to load binaries to memory and execute
 them, however we may need to integrate this with the efi subsystem to
@@ -19,6 +19,7 @@ with this a kernel with CONFIG_EFI_STUB enabled will be loaded and
 then subsequently booted with bootefi command.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  cmd/Kconfig                      |  6 ++++
  cmd/bootefi.c                    | 12 ++++++++
@@ -28,7 +29,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  5 files changed, 79 insertions(+)
 
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index a9fb4eead2..56fa0ceade 100644
+index 3a857b3f6e2e..a33b2a2a123b 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
 @@ -1048,6 +1048,12 @@ config CMD_LOADB
@@ -45,7 +46,7 @@ index a9fb4eead2..56fa0ceade 100644
  	bool "loads"
  	default y
 diff --git a/cmd/bootefi.c b/cmd/bootefi.c
-index cba81ffe75..9e1b91c89e 100644
+index 83eab0bd7f18..698698a7d257 100644
 --- a/cmd/bootefi.c
 +++ b/cmd/bootefi.c
 @@ -34,6 +34,18 @@ static struct efi_device_path *bootefi_device_path;
@@ -68,7 +69,7 @@ index cba81ffe75..9e1b91c89e 100644
   * efi_clear_bootdev() - clear boot device
   */
 diff --git a/cmd/load.c b/cmd/load.c
-index b7894d7db0..4de197681c 100644
+index 381ed1b3e25b..fea81a4e027a 100644
 --- a/cmd/load.c
 +++ b/cmd/load.c
 @@ -1020,6 +1020,45 @@ static ulong load_serial_ymodem(ulong offset, int mode)
@@ -132,23 +133,23 @@ index b7894d7db0..4de197681c 100644
 +);
 +#endif /* CONFIG_CMD_LOADM */
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index b81180cfda..fc4f1ec67a 100644
+index c440962fe522..611aae64a9ba 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -485,6 +485,8 @@ void efi_save_gd(void);
- void efi_restore_gd(void);
+@@ -577,6 +577,8 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj *handle,
+ void efi_save_gd(void);
  /* Call this to relocate the runtime section to an address space */
  void efi_runtime_relocate(ulong offset, struct efi_mem_desc *map);
 +/* Call this to get image parameters */
 +void efi_get_image_parameters(void **img_addr, size_t *img_size);
- /* Call this to set the current device name */
- void efi_set_bootdev(const char *dev, const char *devnr, const char *path,
- 		     void *buffer, size_t buffer_size);
+ /* Add a new object to the object list. */
+ void efi_add_handle(efi_handle_t obj);
+ /* Create handle */
 diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_device_path.c
-index 76c2f82fe6..a610b6ff0e 100644
+index cbdb466da41c..537f7b8c5f9a 100644
 --- a/lib/efi_loader/efi_device_path.c
 +++ b/lib/efi_loader/efi_device_path.c
-@@ -1170,6 +1170,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
+@@ -1176,6 +1176,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
  {
  	struct blk_desc *desc = NULL;
  	struct disk_partition fs_partition;
@@ -157,7 +158,7 @@ index 76c2f82fe6..a610b6ff0e 100644
  	int part = 0;
  	char *filename;
  	char *s;
-@@ -1185,6 +1187,14 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
+@@ -1191,6 +1193,14 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
  	} else if (!strcmp(dev, "Uart")) {
  		if (device)
  			*device = efi_dp_from_uart();
@@ -172,6 +173,3 @@ index 76c2f82fe6..a610b6ff0e 100644
  	} else {
  		part = blk_get_device_part_str(dev, devnr, &desc, &fs_partition,
  					       1);
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
index 95b97ee6e1e2..06f188755178 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
@@ -1,23 +1,24 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 283cae5b37eced831080a50d76006359662fb6bf Mon Sep 17 00:00:00 2001
+From 98619983895e1bc2e33c3cf933b9699b8276d63a Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 23 Jun 2021 00:45:38 +0100
-Subject: [PATCH 11/16] arm: corstone1000: enable boot using uefi
+Subject: [PATCH] arm: corstone1000: enable boot using uefi
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 In a way to prepare future use of uefi features, enable booting using
 the bootefi binary loading.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+
 ---
  configs/corstone1000_defconfig | 7 +++++++
  include/configs/corstone1000.h | 6 +++---
  2 files changed, 10 insertions(+), 3 deletions(-)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index af1c5ecd89..aa664029fc 100644
+index d26932dd487c..46ce1780c4b4 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -2,6 +2,7 @@ CONFIG_ARM=y
@@ -42,7 +43,7 @@ index af1c5ecd89..aa664029fc 100644
  # CONFIG_CMD_EDITENV is not set
  # CONFIG_CMD_ENV_EXISTS is not set
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index 389ac45a58..5e22e075ad 100644
+index 389ac45a5819..5e22e075ad07 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -70,7 +70,7 @@
@@ -56,6 +57,3 @@ index 389ac45a58..5e22e075ad 100644
 +				"loadm $kernel_addr $kernel_addr_r 0xc00000;" \
 +				"bootefi $kernel_addr_r $fdtcontroladdr;"
  #endif
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
index e71ae2cc1e4e..1860a4af2998 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
@@ -1,32 +1,30 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From e49597b8d9058d8c5b925339b0041fd7096c622d Mon Sep 17 00:00:00 2001
+From 4aaf08f3dc34300c537f703f5bd9aeea3a28260f Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 14 Sep 2021 10:46:49 +0100
-Subject: [PATCH 12/16] arm: corstone1000: enable uefi secure boot
+Subject: [PATCH] arm: corstone1000: enable uefi secure boot
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 To make it possible to have a secure way to execute UEFI images
 enable UEFI secure boot support and by inherit the
 cryptographic functionalities.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  configs/corstone1000_defconfig | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index aa664029fc..a8651287ed 100644
+index 46ce1780c4b4..fc3a9a21f7ae 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -43,6 +43,7 @@ CONFIG_USB=y
- CONFIG_DM_USB=y
+@@ -42,6 +42,7 @@ CONFIG_DM_SERIAL=y
+ CONFIG_USB=y
  CONFIG_USB_ISP1760=y
  CONFIG_USB_STORAGE=y
 +CONFIG_EFI_SECURE_BOOT=y
  CONFIG_DM_RTC=y
  CONFIG_CMD_RTC=y
  CONFIG_EFI_GET_TIME=y
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
index 594e9f54ca85..3af7e26e56a8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
@@ -1,21 +1,22 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From de37d61d1414cb6408390412cf77d7a88f8964e1 Mon Sep 17 00:00:00 2001
+From 47d4157afbc401577b606e9faeb70ec888b7cee5 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 14 Sep 2021 22:00:47 +0100
-Subject: [PATCH 13/16] arm: corstone1000: enable handlers for uefi variables
+Subject: [PATCH] arm: corstone1000: enable handlers for uefi variables
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 Enable the setenv/printenv -e option to handle uefi
 variables and the efidebug command.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  configs/corstone1000_defconfig | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index a8651287ed..b17e2df47b 100644
+index fc3a9a21f7ae..afa79bbf26cb 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -24,6 +24,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
@@ -34,14 +35,11 @@ index a8651287ed..b17e2df47b 100644
  CONFIG_CMD_FAT=y
  CONFIG_OF_CONTROL=y
  CONFIG_REGMAP=y
-@@ -43,6 +45,7 @@ CONFIG_USB=y
- CONFIG_DM_USB=y
+@@ -42,6 +44,7 @@ CONFIG_DM_SERIAL=y
+ CONFIG_USB=y
  CONFIG_USB_ISP1760=y
  CONFIG_USB_STORAGE=y
 +# CONFIG_HEXDUMP is not set
  CONFIG_EFI_SECURE_BOOT=y
  CONFIG_DM_RTC=y
  CONFIG_CMD_RTC=y
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
index a414a094ae78..ab9c38218339 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
@@ -1,24 +1,25 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From fe0acf22a0c30f7d3eb1a8c66fb423b4146d35ab Mon Sep 17 00:00:00 2001
+From 708229c83e1453ba796fbfa598ba70a1335fe1e1 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 14 Sep 2021 22:07:15 +0100
-Subject: [PATCH 14/16] arm: dipha: enable efi capsule options
+Subject: [PATCH] arm: dipha: enable efi capsule options
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
 
 Enable the set of efi capsule config options to enable the
 variables.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
 ---
  configs/corstone1000_defconfig | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index b17e2df47b..cfe80cf5f4 100644
+index afa79bbf26cb..776e9c6f6223 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -46,6 +46,12 @@ CONFIG_DM_USB=y
+@@ -45,6 +45,12 @@ CONFIG_USB=y
  CONFIG_USB_ISP1760=y
  CONFIG_USB_STORAGE=y
  # CONFIG_HEXDUMP is not set
@@ -31,6 +32,3 @@ index b17e2df47b..cfe80cf5f4 100644
  CONFIG_EFI_SECURE_BOOT=y
  CONFIG_DM_RTC=y
  CONFIG_CMD_RTC=y
--- 
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
index c1feca135dac..2a65b1412b29 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
@@ -1,4 +1,4 @@
-From 6ae7b384eef45dd9f70e5e53c32cb14c56733013 Mon Sep 17 00:00:00 2001
+From 44db30dcf57035f130246d5c76a34f205822347f Mon Sep 17 00:00:00 2001
 From: Anders Dellien <anders.dellien@arm.com>
 Date: Thu, 23 Jul 2020 17:32:55 +0100
 Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
@@ -30,10 +30,10 @@ Signed-off-by: Anders Dellien <anders.dellien@arm.com>
  create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 3307f2b3fc..0389e04cfb 100644
+index b5bd3284cd1c..b3aae233a1ac 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1184,6 +1184,11 @@ config TARGET_VEXPRESS64_BASE_FVP
+@@ -1170,6 +1170,11 @@ config TARGET_VEXPRESS64_BASE_FVP
  	select PL01X_SERIAL
  	select SEMIHOSTING
  
@@ -46,7 +46,7 @@ index 3307f2b3fc..0389e04cfb 100644
  	bool "Support Versatile Express Juno Development Platform"
  	select ARM64
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
-index 1d13f542e6..dad181c93c 100644
+index 1d13f542e677..dad181c93c3d 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -1,4 +1,4 @@
@@ -57,7 +57,7 @@ index 1d13f542e6..dad181c93c 100644
  	default "vexpress64"
 diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
 new file mode 100644
-index 0000000000..0726e0d0db
+index 000000000000..0726e0d0db5a
 --- /dev/null
 +++ b/configs/vexpress_aemv8a_aarch32_defconfig
 @@ -0,0 +1,40 @@
@@ -102,7 +102,7 @@ index 0000000000..0726e0d0db
 +CONFIG_DM_SERIAL=y
 +CONFIG_PL01X_SERIAL=y
 diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 7318fb6c58..f223811134 100644
+index 54b5967a89dc..48b75c10d979 100644
 --- a/include/configs/vexpress_aemv8a.h
 +++ b/include/configs/vexpress_aemv8a.h
 @@ -9,8 +9,15 @@
@@ -132,9 +132,9 @@ index 7318fb6c58..f223811134 100644
  #define GICD_BASE			(0x2f000000)
  #define GICC_BASE			(0x2c000000)
  #elif CONFIG_TARGET_VEXPRESS64_JUNO
-@@ -164,7 +172,8 @@
- #endif
- 
+@@ -174,7 +182,8 @@
+ 				"fdt_addr_r=0x80000000\0" \
+ 				BOOTENV
  
 -#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
 +#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
@@ -142,7 +142,7 @@ index 7318fb6c58..f223811134 100644
  #define CONFIG_EXTRA_ENV_SETTINGS	\
  				"kernel_name=Image\0"		\
  				"kernel_addr=0x80080000\0"	\
-@@ -173,7 +182,9 @@
+@@ -183,7 +192,9 @@
  				"fdtfile=devtree.dtb\0"		\
  				"fdt_addr=0x83000000\0"		\
  				"boot_name=boot.img\0"		\
@@ -153,7 +153,7 @@ index 7318fb6c58..f223811134 100644
  
  #ifndef CONFIG_BOOTCOMMAND
  #define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then " \
-@@ -183,15 +194,13 @@
+@@ -193,15 +204,13 @@
  				"  bootm ${boot_addr} ${boot_addr} " \
  				"  ${fdt_addr}; " \
  				"else; " \
@@ -171,5 +171,5 @@ index 7318fb6c58..f223811134 100644
  #endif
  #endif
 -- 
-2.17.1
+2.20.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/bootargs.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc/bootargs.cfg
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index b73e6f7e4234..864a5688bda7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,5 +1,3 @@
-# Machine specific u-boot
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 #
@@ -37,3 +35,8 @@ SRC_URI:append:fvp-base = " file://bootargs.cfg"
 # FVP BASE ARM32
 #
 SRC_URI:append:fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
+
+#
+# TC0 and TC1 MACHINES
+#
+SRC_URI:append:tc = " file://bootargs.cfg"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
deleted file mode 100644
index ef881a1bd916..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
+++ /dev/null
@@ -1,21 +0,0 @@
-# Machine specific u-boot
-
-THIS_DIR := "${THISDIR}"
-FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}/tc:"
-
-#
-# TC0 MACHINE
-#
-SRC_URI:append:tc0 = " \
-    file://0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch \
-    file://0002-cmd-part-Correct-error-handling.patch \
-    file://bootargs.cfg \
-    "
-#
-# TC1 MACHINE
-#
-SRC_URI:append:tc1 = " \
-    file://0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch \
-    file://0002-cmd-part-Correct-error-handling.patch \
-    file://bootargs.cfg \
-    "
-- 
2.20.1


