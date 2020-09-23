Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.2043.1600897736924599463
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 14:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=P3uGboSc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id g3so1228004qtq.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Sep 2020 14:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8iGKBhfbhoHjGZn+fHowLjJ741vYJXEBT21rgKZrHvE=;
        b=P3uGboScEFvw81VA44z26g+F9e5Z164lemjXLVqZ/p9ZROMnFlKE04vfsGifMYqHfR
         pNJl8X+ShhHUPX+tL1eRLRHxDuInhbc45jfjq3ZFJzATQi0GhHmLBW3/6GTgMz83OMzE
         EesYzpn6toZKzZ4AWC85gdnnfxc9VpP9li2RbPNKQpxpb+gkegKeGqpTEKaiajNXlh/0
         TVXv+1yx6y+RVGOkAo+fzNy3XEP4c599VTXVlxXAcWjTtN/GuISc59DU1tZAGafkUC7l
         q9H7nJOCJeS3PgeQ71P1RA045Fsp1oaInS/vk5XUj1KUZiURHB2wS9GdlV+04QeAmQ41
         tU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8iGKBhfbhoHjGZn+fHowLjJ741vYJXEBT21rgKZrHvE=;
        b=UBrj0A0OOVl/7Y/0+XXFOWOXj4UbbIjPWVsco8LAP8qqEAVBEi3AYvLsGE23/Zd68R
         DO9WOQhnF8aEJc8Kp10FfH9sZDZ7q9Q40PYV7ki5cEQGTukToRS3+3m79xjorjz5Z/do
         EFFlRrW4NnwSYy3BYdNSh6D4o5UThRGUcaPb/Mqmh9yIoEyoxDorMvVQXAg1phUgvIqa
         Jg787FHgmhU8IVmO2t6xXyEufhgocq507zeGgjWJZQEIzBFv96+rfrhQFqHlJQoIgRtf
         xGvsWAtNUZ2HgFU1mI23RG4O8YSOODZXocpSLJOmXu0DZFyBs3y69iGJgPwDkaZS2rmM
         3dHw==
X-Gm-Message-State: AOAM530FRG9jKWziPq3YFttamowdFmrUyVfvaDYQgfv5IHnGHdn7peLX
	TSEJUY8TBTORloTR1LDj+Bb2UuBRLR5VnMQW
X-Google-Smtp-Source: ABdhPJwDJIlDaTwj7TyHweonwLP8p8euWziEjWpQmC3J/Hg3Lfm/nFt2+NCCXpcyqTL0ymyQGym2zA==
X-Received: by 2002:ac8:3175:: with SMTP id h50mr2266886qtb.185.1600897735636;
        Wed, 23 Sep 2020 14:48:55 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id l13sm784783qtv.82.2020.09.23.14.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 14:48:55 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/u-boot: Rebase FVP patches on u-boot 2020.07
Date: Wed, 23 Sep 2020 17:48:51 -0400
Message-Id: <20200923214851.23174-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anders Dellien <anders.dellien@arm.com>

This removes fuzz warnings when applying the patches.

Also change 'earlyprintk' parameter to 'earlycon' as
the former isn't support for AArch64.

Change-Id: I7d9ee3e3ab47877e1d85862dbc835e0d5dac0ecc
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../fvp-common/u-boot_vexpress_fvp.patch         |  2 +-
 .../fvp-common/u-boot_vexpress_fvp.patch         | 16 ++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend         |  4 ++--
 3 files changed, 19 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.01}/fvp-common/u-boot_vexpress_fvp.patch (78%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
similarity index 78%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
index bdca202c9aa2..19e1a569cc04 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
@@ -7,7 +7,7 @@ index c9cec8322c..3a339be6a2 100644
  CONFIG_BOOTDELAY=1
  CONFIG_USE_BOOTARGS=y
 -CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
-+CONFIG_BOOTARGS="console=ttyAMA0 earlyprintk=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
  # CONFIG_USE_BOOTCOMMAND is not set
  # CONFIG_DISPLAY_CPUINFO is not set
  # CONFIG_DISPLAY_BOARDINFO is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
new file mode 100644
index 000000000000..9a21687e07c0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Inappropriate [OE config specific]
+
+diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
+index f0ac2f9da3..93fcd3026a 100644
+--- a/configs/vexpress_aemv8a_semi_defconfig
++++ b/configs/vexpress_aemv8a_semi_defconfig
+@@ -10,7 +10,7 @@ CONFIG_DISTRO_DEFAULTS=y
+ CONFIG_ANDROID_BOOT_IMAGE=y
+ CONFIG_BOOTDELAY=1
+ CONFIG_USE_BOOTARGS=y
+-CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
+ # CONFIG_USE_BOOTCOMMAND is not set
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 5fc3723c72aa..205c3c477dec 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -2,8 +2,8 @@
 
 THIS_DIR := "${THISDIR}"
 FILESEXTRAPATHS_prepend = "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
-FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
-FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
+FILESEXTRAPATHS_prepend_fvp-base = "${THIS_DIR}/${BP}/fvp-common:"
+FILESEXTRAPATHS_prepend_foundation-armv8 = "${THIS_DIR}/${BP}/fvp-common:"
 
 #
 # Cortex-A5 DesignStart KMACHINE
-- 
2.20.1

