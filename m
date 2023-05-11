Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178C9C7EE23
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:01:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.374.1683820881206536933
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 May 2023 09:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=USI/1U75;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b51eso20122505e9.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683820879; x=1686412879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1UUP9OQ/rKL0HfZ6OoMC8Oz03iW7bAMmL04h/izTEE=;
        b=USI/1U75mYcn38+F397IVvbANODbX8rwYuHspmXp5PrRuMLhdV8wL3YIpl3FNa5ivz
         9tzF2C4rasPoJhPu4mAoMQkWFH7IOLpLGjYB9smz6UFYYh4zFTN9nFCLjv0JP3m0ZwJP
         +o9Ubc1xa2SuH41htu6F6Eq1FccxXS7R6kLKY5X0v7PyKKgRraocfz+scKCAKkZnk4om
         QXomqEbx+zlVKpahEdqzY9lqzLpnTUHXWX82nTdpFoWePypHvH68+7Jt32cmSinginz+
         kKCW3eVGus6z9/6AHHfxm/9keChez97ZPjJ5j8IpfMPAj1I4shcY+wY6Y7n4R5QrUbOd
         vv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683820879; x=1686412879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1UUP9OQ/rKL0HfZ6OoMC8Oz03iW7bAMmL04h/izTEE=;
        b=cRzHfRyoz+sjY0rxcMr2HZGDN1aJDmLOzEUrft3v+D86SoXYGTZJ5P8MtOmP2hhz8V
         0aQ71iPdq0vJgtPKQgoFNU9YUtDpJFV+2OsCbuT4bV7Q6K16gqXfWXddp36a8SskutrG
         XA49/vUeoEJFZHPJXtmLsZ0h8NlJhXhs0r04uQFIV4bjFKmmWjIuwKmzf6C1qZr0yk7J
         Av9ohUJY0lC//PdJkZkI5LQIcipRIomN4K9zdcJfBgGbdcVjLXEyaKYmZRaHeEx90Haj
         8D1Zf0ZZoxT3gWFYinyxSsKi4Jy67IXhm/un/OrXwEkiyte9tIG0GdKf1HcvUSow2W55
         C3Vw==
X-Gm-Message-State: AC+VfDxSfCmWxHWkQUCIt1hpRBYWGtOFat+w9TU+0cCMRNRTR6lMNmwq
	+kZrrE/1vvhp5dFfs88mL8QINbMY3v348A==
X-Google-Smtp-Source: ACHHUZ55YH8ukv/jWxs7cWKcCvIj9QPLTCQ1HtxXF/k1KAyb0xbRYZLkmQrlyUOIzZw14gJEELd61w==
X-Received: by 2002:a1c:4c19:0:b0:3f4:27ff:7d52 with SMTP id z25-20020a1c4c19000000b003f427ff7d52mr9284847wmf.2.1683820878904;
        Thu, 11 May 2023 09:01:18 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003f07ef4e3e0sm12689904wmo.0.2023.05.11.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:01:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC 2/2] runfvp: update filepath in fvpconf to relative path
Date: Thu, 11 May 2023 18:01:16 +0200
Message-Id: <20230511160116.398793-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511160116.398793-1-peron.clem@gmail.com>
References: <20230511160116.398793-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 May 2023 16:01:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4642

Using absolute path in fvpconf will leak the host machine path.

This is a bit annoying when the builder and the runner doesn't use
the same filepath hierachy.

Switch to relative path instead of absolute.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 documentation/runfvp.md                           |  8 ++++----
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf   |  6 +++---
 meta-arm-bsp/conf/machine/corstone500.conf        |  4 ++--
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf |  4 ++--
 meta-arm-bsp/conf/machine/include/fvp-common.inc  | 10 +++++-----
 meta-arm-bsp/conf/machine/tc1.conf                |  8 ++++----
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
index 01b13693..b3c6467f 100644
--- a/documentation/runfvp.md
+++ b/documentation/runfvp.md
@@ -64,7 +64,7 @@ If `FVP_PROVIDER` is not set then it is assumed that `FVP_EXE` is installed on t
 Parameters passed to the FVP with the `--parameter`/`-C` option.  These are expressed as variable flags so individual parameters can be altered easily. For example:
 
 ```
-FVP_CONFIG[bp.flashloader0.fname] = "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
+FVP_CONFIG[bp.flashloader0.fname] = "fip-fvp.bin"
 ```
 
 ### `FVP_DATA`
@@ -72,8 +72,8 @@ FVP_CONFIG[bp.flashloader0.fname] = "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
 Specify raw data to load at the specified address, passed to the FVP with the `--data` option.  This is a space-separated list of parameters in the format `[INST=]FILE@[MEMSPACE:]ADDRESS`. For example:
 
 ```
-FVP_DATA = "cluster0.cpu0=${DEPLOY_DIR_IMAGE}/Image@0x80080000 \
-            cluster0.cpu0=${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x83000000"
+FVP_DATA = "cluster0.cpu0=Image@0x80080000 \
+            cluster0.cpu0=fvp-base-revc.dtb@0x83000000"
 ```
 
 ### `FVP_APPLICATIONS`
@@ -81,7 +81,7 @@ FVP_DATA = "cluster0.cpu0=${DEPLOY_DIR_IMAGE}/Image@0x80080000 \
 Applications to load on the cores, passed to the FVP with the `--application` option.  These are expressed as variable flags with the flag name being the instance and flag value the filename, for example:
 
 ```
-FVP_APPLICATIONS[cluster0] = "${DEPLOY_DIR_IMAGE}/linux-system.axf"
+FVP_APPLICATIONS[cluster0] = "linux-system.axf"
 ```
 
 Note that symbols are not allowed in flag names, so if you need to use a wildcard in the instance then you'll need to use `FVP_EXTRA_ARGS` and `--application` directly.
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
index 03577b8e..66236515 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -17,7 +17,7 @@ FVP_EXE ?= "FVP_Corstone-1000"
 FVP_CONSOLE ?= "host_terminal_0"
 
 # FVP Parameters
-FVP_CONFIG[se.trustedBootROMloader.fname] ?= "${DEPLOY_DIR_IMAGE}/bl1.bin"
+FVP_CONFIG[se.trustedBootROMloader.fname] ?= "bl1.bin"
 FVP_CONFIG[board.xnvm_size] ?= "64"
 FVP_CONFIG[se.trustedSRAM_config] ?= "6"
 FVP_CONFIG[se.BootROM_config] ?= "3"
@@ -32,10 +32,10 @@ FVP_CONFIG[se.nvm.update_raw_image] ?= "0"
 FVP_CONFIG[se.cryptocell.USER_OTP_FILTERING_DISABLE] ?= "1"
 
 # Boot image
-FVP_DATA ?= "board.flash0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic@0x68000000"
+FVP_DATA ?= "board.flash0=${IMAGE_NAME}.rootfs.wic@0x68000000"
 
 # External system (cortex-M3)
-FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?= "${DEPLOY_DIR_IMAGE}/es_flashfw.bin"
+FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?= "es_flashfw.bin"
 
 # FVP Terminals
 FVP_TERMINALS[host.host_terminal_0] ?= "Normal World Console"
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index a599660c..c13c86c0 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -38,8 +38,8 @@ TEST_SUITES = "linuxboot"
 
 FVP_PROVIDER ?= "fvp-corstone500-native"
 FVP_EXE ?= "FVP_Corstone-500"
-FVP_CONFIG[board.flashloader0.fname] ?= "${DEPLOY_DIR_IMAGE}/bl1.bin"
-FVP_DATA ?= "css.cluster.cpu0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic.nopt@0x80000000"
+FVP_CONFIG[board.flashloader0.fname] ?= "bl1.bin"
+FVP_DATA ?= "css.cluster.cpu0=${IMAGE_NAME}.rootfs.wic.nopt@0x80000000"
 FVP_CONSOLE ?= "terminal_0"
 FVP_TERMINALS[css.terminal_0] ?= "console"
 FVP_TERMINALS[css.terminal_1] ?= ""
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 0c2ea122..62c9cbd0 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -34,7 +34,7 @@ TEST_SUITES = "linuxboot"
 TEST_TARGET_IP ?= "127.0.0.1:8022"
 TEST_SERVER_IP ?= "127.0.1.1"
 
-FVP_EXTRA_ARGS = "-a cluster0*=${DEPLOY_DIR_IMAGE}/linux-system.axf"
+FVP_EXTRA_ARGS = "-a cluster0*=linux-system.axf"
 FVP_PROVIDER ?= "fvp-base-r-aem-native"
 FVP_EXE ?= "FVP_BaseR_AEMv8R"
 FVP_CONSOLE ?= "terminal_0"
@@ -50,7 +50,7 @@ FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?= "1"
 FVP_CONFIG[bp.virtio_net.secure_accesses] = "1"
 FVP_CONFIG[bp.virtio_rng.enabled] ?= "1"
 FVP_CONFIG[bp.virtio_rng.secure_accesses] = "1"
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?= "${IMAGE_NAME}.rootfs.wic"
 FVP_CONFIG[bp.virtioblockdevice.secure_accesses] = "1"
 FVP_CONFIG[cache_state_modelled] ?= "0"
 FVP_CONFIG[cci400.force_on_from_start] = "1"
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-bsp/conf/machine/include/fvp-common.inc
index 233c734f..47b7ffce 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -33,15 +33,15 @@ FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?= "1"
 # Tell testimage to connect to localhost:8022, and forward that to SSH in the FVP.
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] = "8022=22"
 FVP_CONFIG[cache_state_modelled] ?= "0"
-FVP_CONFIG[bp.secureflashloader.fname] ?= "${DEPLOY_DIR_IMAGE}/bl1-fvp.bin"
-FVP_CONFIG[bp.flashloader0.fname] ?= "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic"
+FVP_CONFIG[bp.secureflashloader.fname] ?= "bl1-fvp.bin"
+FVP_CONFIG[bp.flashloader0.fname] ?= "fip-fvp.bin"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?= "${IMAGE_NAME}.rootfs.wic"
 # Set the baseline to ARMv8.4, as the default is 8.0.
 FVP_CONFIG[cluster0.has_arm_v8-4] = "1"
 FVP_CONFIG[cluster1.has_arm_v8-4] = "1"
 FVP_CONSOLE ?= "terminal_0"
-FVP_DATA ?= "cluster0.cpu0=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}@0x80080000 \
-             cluster0.cpu0=${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x8fc00000"
+FVP_DATA ?= "cluster0.cpu0=${KERNEL_IMAGETYPE}@0x80080000 \
+             cluster0.cpu0=fvp-base-revc.dtb@0x8fc00000"
 FVP_TERMINALS[bp.terminal_0] ?= "Console"
 FVP_TERMINALS[bp.terminal_1] ?= ""
 FVP_TERMINALS[bp.terminal_2] ?= ""
diff --git a/meta-arm-bsp/conf/machine/tc1.conf b/meta-arm-bsp/conf/machine/tc1.conf
index f99bfd2b..5f68cc7a 100644
--- a/meta-arm-bsp/conf/machine/tc1.conf
+++ b/meta-arm-bsp/conf/machine/tc1.conf
@@ -14,9 +14,9 @@ FVP_PROVIDER ?= "fvp-tc1-native"
 FVP_EXE ?= "FVP_TC1"
 
 # FVP Parameters
-FVP_CONFIG[css.scp.ROMloader.fname] ?= "${DEPLOY_DIR_IMAGE}/scp_romfw.bin"
-FVP_CONFIG[css.trustedBootROMloader.fname] ?= "${DEPLOY_DIR_IMAGE}/bl1-tc.bin"
-FVP_CONFIG[board.flashloader0.fname] ?= "${DEPLOY_DIR_IMAGE}/fip_gpt-tc.bin"
+FVP_CONFIG[css.scp.ROMloader.fname] ?= "scp_romfw.bin"
+FVP_CONFIG[css.trustedBootROMloader.fname] ?= "bl1-tc.bin"
+FVP_CONFIG[board.flashloader0.fname] ?= "fip_gpt-tc.bin"
 
 #FVP_CONFIG[board.hostbridge.userNetworking] ?= "true"
 #FVP_CONFIG[board.hostbridge.userNetPorts] ?= "8022=22"
@@ -28,4 +28,4 @@ FVP_TERMINALS[soc.terminal_s0] ?= "Secure Console"
 FVP_TERMINALS[soc.terminal_s1] ?= "Console"
 
 # Boot image
-FVP_DATA ?= "board.dram=${DEPLOY_DIR_IMAGE}/fitImage-core-image-minimal-tc1-tc1@0x20000000"
+FVP_DATA ?= "board.dram=fitImage-core-image-minimal-tc1-tc1@0x20000000"
-- 
2.40.1


