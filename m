Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3D7CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 15:58:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2161.1779206321951808839
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2026 08:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LVtqOEio;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: marek.bykowski@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45d96d21e82so2227435f8f.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2026 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206320; x=1779811120; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=McC9XvyYYUeYaHihjnTklP2HqVMvIRCFt27sYUQkmlU=;
        b=LVtqOEioz56rb5dojkJBn1dzX5g9NQlMUR4vkQLRdwXu6FFn2I7yC8vYXk+SCs7hOx
         kLay61fxET1FK1m5muoOCImuTIu0zDiwNwutIcGvVnGA22GUv0FgDWUiJjZa6MXAvuaU
         ZNImP/RC+GP/gUmZ3R6P5QjWah3LoY5jwXLiASYSl4+C1JRrrV6eTNN2+4WdwJMki2jE
         3F26v2O9LDiTqzAg79N2i4A3Bc4Ezskn0IF1NXywWOOffN2LuO4aMf1CXYUDf9utuYZ5
         7PMqgVWmUaEwgTpHroMwM0pGzp+4F15RJJ5eFPMkP56rjfLmmKvqZYkQXADCIlLr6R20
         aGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206320; x=1779811120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McC9XvyYYUeYaHihjnTklP2HqVMvIRCFt27sYUQkmlU=;
        b=kiEsFef9MSW/xg89wYwVoU64c9kr1uoAAGlp6NiAkfNvYqE+CHFZ9AzLWLVgLUqdMX
         e5XfCIfFZrF/2nC0YJYYmUSxQIDo5FzTAXtn6vWL5yVSY0cS8ImAHfIRI1ixpmhSzHud
         HhUTX3M1SGbE/dtrEItBBb43Yn/ec53FnNZJsrnXgp3utvj8SKfSh47lFewX6nBClhIP
         uJpfxEA9wHkGu5VS5WBhMJ7DyJ7JtOF7PVKNzHmvkd8l8W1hvltDzrjLvjGNp4LF+qQG
         ZobNQzXpFRWbrOgaD7RmHzTTeBpugxPfuk/JChkG5b4E5m4UAkQCFNlTj/XW3cj5CjZn
         lezg==
X-Gm-Message-State: AOJu0YydkyhqZwJwZWdu00H2XebvefDof0j+EHv5H+neRFQfPC4XTjVj
	DD63YSlk2ebbIxv0BbSwkm1W3yECl2Lx3rLqDYAAqyaPEVTism5DBRYKtGYFg05i5FI=
X-Gm-Gg: Acq92OHV/X97xFkeJB+4hfccWs880cLzGeZQwyv2+qjKVb9VL0SUkQ0BUbmctyBx6Hy
	+FSj9EN1f54sUxMGlsnP1dl1qmRsxOJOS62KfhCT0A+hmi4s7MWus7p2MDdNAebIsIFKFrLPfLv
	Fym6E2EbqJfpSz/3XfyWQcVCMGexVt8/F08KYQx5sNvPqDeGsji2boYJ3sgYW9GY4JlDVjR16fv
	yjvhdmRRAPbEEscNtlbGjijo9zZjIRQgYaBbg9wPjG6JQeL03uWKiq+MNimfA94tSfXLtbkMJXU
	hB2ergGtK97PBveleUu71Ys7o+FmT21TG0lDJ15Mdmq7vrh9Z0u88zdWhBFrfYZkFsLaLHqozct
	RDvEO7FiO4BhZK+WEnnbYda3061aKa/V6VCmGoZ/WX+rAeiLcmlaSLSYkmhM4Y8o4S6rCnUzGRk
	4QAfVw95iRdeyYRCl2Qcgz+SO9EYUHorC9jwboEg==
X-Received: by 2002:a05:6000:2305:b0:44f:d9f8:c0e7 with SMTP id ffacd0b85a97d-45e5c58fe85mr33888451f8f.5.1779206320118;
        Tue, 19 May 2026 08:58:40 -0700 (PDT)
Received: from localhost.localdomain ([89.46.86.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm42996842f8f.26.2026.05.19.08.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:58:39 -0700 (PDT)
From: Marek Bykowski <marek.bykowski@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Marek Bykowski <marek.bykowski@gmail.com>
Subject: [PATCH] arm-bsp: use IMAGE_LINK_NAME for FVP disk image path
Date: Tue, 19 May 2026 15:58:35 +0000
Message-Id: <20260519155835.3504405-1-marek.bykowski@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2026 15:58:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7056

${IMAGE_NAME} expands to a timestamped filename which gets written into
the .fvpconf. A mismatch occurs when do_image reruns (regenerating the
.fvpconf with a new timestamp) but do_image_wic hits sstate (leaving the
old .wic on disk), causing the FVP to fail at startup with:

  Can't stat <image>-<timestamp>.wic! (error 2)

Use IMAGE_LINK_NAME instead, which is the stable symlink that always
points to the most recently built .wic.

Signed-off-by: Marek Bykowski <marek.bykowski@gmail.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 2 +-
 meta-arm-bsp/conf/machine/fvp-base.conf         | 2 +-
 meta-arm-bsp/conf/machine/rdn2.conf             | 2 +-
 meta-arm-bsp/conf/machine/rdv2.conf             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
index e447b56e..9b776b24 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -65,7 +65,7 @@ FVP_CONFIG[board.msd_mmc.diagnostics] ?= "0"
 FVP_CONFIG[board.msd_mmc.p_max_block_count] ?= "0xFFFF"
 FVP_CONFIG[board.msd_config.pl180_fifo_depth] ?= "16"
 FVP_CONFIG[board.msd_mmc.support_unpadded_images] ?= "true"
-FVP_CONFIG[board.msd_mmc.p_mmc_file] ?= "${IMAGE_NAME}.wic"
+FVP_CONFIG[board.msd_mmc.p_mmc_file] ?= "${IMAGE_LINK_NAME}.wic"
 
 # MMC2 card configuration
 FVP_CONFIG[board.msd_mmc_2.card_type] ?= "SDHC"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 83506c7e..cbfa90ab 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -60,7 +60,7 @@ FVP_CONFIG[cluster0.stage12_tlb_size] ?= "1024"
 FVP_CONFIG[cluster1.stage12_tlb_size] ?= "1024"
 FVP_CONFIG[bp.secureflashloader.fname] ?= "trusted-firmware-a/bl1.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?= "trusted-firmware-a/fip.bin"
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?= "${IMAGE_NAME}.wic"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?= "${IMAGE_LINK_NAME}.wic"
 
 # FVP Base default is 8.0, so there is no has_arm_v8-0 for it.  However, this is needed for every version after.  So set this accordingly
 FVP_EXTRA_ARGS = "--parameter cluster0.has_arm_v${ARM_ISA_MAJOR}-${ARM_ISA_MINOR}=1 --parameter cluster1.has_arm_v${ARM_ISA_MAJOR}-${ARM_ISA_MINOR}=1"
diff --git a/meta-arm-bsp/conf/machine/rdn2.conf b/meta-arm-bsp/conf/machine/rdn2.conf
index cc9ba06c..2349f1b7 100644
--- a/meta-arm-bsp/conf/machine/rdn2.conf
+++ b/meta-arm-bsp/conf/machine/rdn2.conf
@@ -49,7 +49,7 @@ FVP_CONFIG[board.dram_size] ?= "0x200000000"
 FVP_CONFIG[board.virtio_net.enabled] ?= "1"
 FVP_CONFIG[board.virtio_net.hostbridge.userNetworking] ?= "1"
 FVP_CONFIG[board.virtio_net.hostbridge.userNetPorts] = "2222=22"
-FVP_CONFIG[board.virtioblockdevice.image_path] ?= "${IMAGE_NAME}.wic"
+FVP_CONFIG[board.virtioblockdevice.image_path] ?= "${IMAGE_LINK_NAME}.wic"
 
 FVP_CONSOLES[default] = "terminal_ns_uart_ap"
 FVP_TERMINALS[css.scp.terminal_uart_scp] ?= "SCP Console"
diff --git a/meta-arm-bsp/conf/machine/rdv2.conf b/meta-arm-bsp/conf/machine/rdv2.conf
index 2c306f26..bb83ffce 100644
--- a/meta-arm-bsp/conf/machine/rdv2.conf
+++ b/meta-arm-bsp/conf/machine/rdv2.conf
@@ -51,7 +51,7 @@ FVP_CONFIG[board.dram_size] ?= "0x200000000"
 FVP_CONFIG[board.virtio_net.enabled] ?= "1"
 FVP_CONFIG[board.virtio_net.hostbridge.userNetworking] ?= "1"
 FVP_CONFIG[board.virtio_net.hostbridge.userNetPorts] = "2222=22"
-FVP_CONFIG[board.virtioblockdevice.image_path] ?= "${IMAGE_NAME}.wic"
+FVP_CONFIG[board.virtioblockdevice.image_path] ?= "${IMAGE_LINK_NAME}.wic"
 
 FVP_CONSOLES[default] = "terminal_ns_uart_ap"
 FVP_TERMINALS[css.scp.terminal_uart_scp] ?= "SCP Console"
-- 
2.34.1


