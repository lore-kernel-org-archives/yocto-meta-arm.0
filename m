Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F4FC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 10:09:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.45762.1684318163471978422
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 03:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I7wzSMmg;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f41dceb93bso3848645e9.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684318161; x=1686910161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1UUP9OQ/rKL0HfZ6OoMC8Oz03iW7bAMmL04h/izTEE=;
        b=I7wzSMmgKCMIZJCTx5UZoyT5xP+W3Zps/Q1FbPU9FFiMKNtRI3crVHYv1n2dZb/jtd
         J0sQNe1VmAzMIocwTNP/1UoR5Ilg6atd2vhfjSXORzg64XssLhIckVPZ2udz/dLUs+zJ
         i+wBSUMuHi25/C3f0ZmUp0o+Hnzm5aPiw+3Y8E1yMgkE4djn+uHslwc0PmAijD+cjd2R
         Jk7Buy0qrseiDhNYzLr6fwqpG9gqI0Tf0NM5XEsxJJvr7HXokqFASgf2U7nEq+BT5dkk
         f0LpMnSMDXSlptpkCnA5L/x/YNWhUp+EZ+5nJKWlkA+dyoylNmr/RDoomaW4pLP2usD2
         Ufpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684318161; x=1686910161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1UUP9OQ/rKL0HfZ6OoMC8Oz03iW7bAMmL04h/izTEE=;
        b=Nh+sMQY2ZIMujdDVJN1bhbNnfyU4nYKkSHITg0dSkKpEBL2NaGjC7NXfZRcm5u3rZ5
         37FkB4ruk3hI50z7CHTL5SvMipg0ochWTlOkVNqHhrgDqRHdZ1a+CjTOKurV85/9I22z
         6nlO/2ma2woNAvWk0H0Fc/B6IoRpwNmVJUotUoG55OFt+kEKS6RJJiEcByWLyyWB2KK0
         etxc01facPVp/VSfOP/kbogLtad+a/18DkbRYxcvGqknvZ5vrMAeusw1H8YeV7EcxTda
         fR+K3ea547tT5fuboGuDomVal4cEbucnmkT7v/jtfZ0IAqVzCakEr/e0k7x2k1u+SMzJ
         ALaQ==
X-Gm-Message-State: AC+VfDwm61MuyUeYOhj+itPo75zz2LYDeQQmNcOr+PVcCPoe91jxPIyS
	w3xsCsaYiyyaJk/fwwb1cngvvOtpbxjikQ==
X-Google-Smtp-Source: ACHHUZ53ECizeEKKvY1QVu90pNnKGT421z7VqUZI+83cVfsgQku7SR6TXHvv67kg0CEJAR8kQU8l6Q==
X-Received: by 2002:a1c:7702:0:b0:3f1:81c6:f59a with SMTP id t2-20020a1c7702000000b003f181c6f59amr28624985wmi.4.1684318161401;
        Wed, 17 May 2023 03:09:21 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc445000000b003f42e008c8dsm1770392wmi.44.2023.05.17.03.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:09:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH v2 3/3] runfvp: update filepath in fvpconf to relative path
Date: Wed, 17 May 2023 12:09:13 +0200
Message-Id: <20230517100913.96055-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517100913.96055-1-peron.clem@gmail.com>
References: <20230517100913.96055-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 10:09:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4663

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


