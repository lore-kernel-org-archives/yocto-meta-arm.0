Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C65AC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:47:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.21421.1683125237753055239
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 May 2023 07:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=qTQzwX7/;
 spf=pass (domain: linaro.org, ip: 209.85.128.47, mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f1950f569eso34026215e9.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 May 2023 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683125236; x=1685717236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtFOeoi0P6ykHhb5/Y5z+CnM5LzEdcU1Vb7+gJAHXvs=;
        b=qTQzwX7/mBVSdpLKE05Z/n0ae0HVIxCC0r2IhmRKzxtenWW5rYYjRjxgdW0WYSGTQB
         zuGN4qCMGbFSRBNSr/tlKHOa3xYSJA4oqR7i4YGCfyOWKf0gXKPDRw7PXDEE/NvMPDHE
         S6CtxnbGh5GlQwS8+L74xccuDTNY9IaQDMk/Fld1oFQoQCaYIOjIJ3+pSCGlSgTIIs6n
         GDw+ozD2PpQVa/VzVEob85Xv4/cRmHygEhn3OMu8j2tV0V84dU8kmz9/xF/Qlwe/svOo
         I8wfplh1uSgJrv5jiDKWgfmNFuiN+BXWAjzEOFFYGZ/w2keEShdwe99tIT2r2mCfS3na
         UhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125236; x=1685717236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtFOeoi0P6ykHhb5/Y5z+CnM5LzEdcU1Vb7+gJAHXvs=;
        b=iLht1saVbdSzyiJJpOfV9jRxzt7PrjzFVE50ucKJBKR2eV/X5j21gtUE0W8WSGx0MB
         wRZfog6qj84+ieVAZBd3j1N986dKQbfpAaEBN2UqF4jsV8rAMJ710D3yBDisRQpksTti
         Vd5mmeTBV39+W/dyPuLaHV9CZVvQIo8eHamAZc+WX97vDQ79PFXD4otFTPEPjxktqnOI
         NkDkq758gUHdfo9Vh8vnxH+ws3/fZJe9k2WUrwGEYPJL7hRCYRbO/lJD4VpQJ+bWI+M+
         s7SAFOeH2SAaD8zVIQtQFjnCG7D7qL+LBo/xsn2n3Gx/osXnvB0opOcyFnSzZMeNNtGv
         gvWg==
X-Gm-Message-State: AC+VfDxeZRaRLvqrjEkFJB9EJsTm/zcz6n9WqUtyjdVAa+00E4u6YpTc
	uYoSIMHuTswBHWyhSMKSVsoSK4+mLM0SC+gQPeM=
X-Google-Smtp-Source: ACHHUZ78NT3zLSWb2fEIZNHcFWjHVR+k+pvMDBNK1xKMo7VjQBpk9q9nK0EyNnjWYYz3+THEQlk67A==
X-Received: by 2002:a05:600c:2198:b0:3ee:4ff0:83d6 with SMTP id e24-20020a05600c219800b003ee4ff083d6mr14023668wme.40.1683125235896;
        Wed, 03 May 2023 07:47:15 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bc5d7000000b003ee74c25f12sm2120409wmk.35.2023.05.03.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:47:15 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] arm-bsp/u-boot: corstone1000: remove debug messages and fix env
Date: Wed,  3 May 2023 15:47:13 +0100
Message-Id: <20230503144713.3294012-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 May 2023 14:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4631

Remove log messages, that would never show up, but clean that
mess. And fix the env script and config so that trigger the
load of kernel from reading the gpt.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...add-nvmxip-fwu-mdata-and-gpt-options.patch | 54 +++++--------------
 ...00-set-kernel_addr-based-on-boot_idx.patch | 37 ++++++++++---
 2 files changed, 41 insertions(+), 50 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
index d1fa8ffb25aa..bd6b9991ec0e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
@@ -1,4 +1,4 @@
-From 7c694af3fd5de372349f740b62cd3d909483fe2e Mon Sep 17 00:00:00 2001
+From 0c2bd094b7686e9497327d825470cb90aa29d10f Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:19:40 +0000
 Subject: [PATCH 40/43] corstone1000: add nvmxip, fwu-mdata and gpt options
@@ -10,15 +10,14 @@ and fwu metadata will be available.
 Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- configs/corstone1000_defconfig | 31 +++++++++++++++++++------------
- fs/fs.c                        |  5 +++++
- 2 files changed, 24 insertions(+), 12 deletions(-)
+ configs/corstone1000_defconfig | 33 ++++++++++++++++++++-------------
+ 1 file changed, 20 insertions(+), 13 deletions(-)
 
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index e009faee0252..711cf13592db 100644
+index e009faee0252..96bb86ec91e9 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -4,13 +4,15 @@ CONFIG_TARGET_CORSTONE1000=y
+@@ -4,18 +4,20 @@ CONFIG_TARGET_CORSTONE1000=y
  CONFIG_TEXT_BASE=0x80000000
  CONFIG_SYS_MALLOC_LEN=0x2000000
  CONFIG_NR_DRAM_BANKS=1
@@ -36,6 +35,12 @@ index e009faee0252..711cf13592db 100644
  CONFIG_FIT=y
  CONFIG_BOOTDELAY=3
  CONFIG_USE_BOOTARGS=y
+ CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9 ip=dhcp earlyprintk"
+-CONFIG_BOOTCOMMAND="run retrieve_kernel_load_addr; echo Loading kernel from $kernel_addr to memory ... ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xf00000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fdtcontroladdr;"
++CONFIG_BOOTCOMMAND="echo Loading kernel from $kernel_addr to memory ... ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xf00000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fdtcontroladdr;"
+ CONFIG_CONSOLE_RECORD=y
+ CONFIG_LOGLEVEL=7
+ # CONFIG_DISPLAY_CPUINFO is not set
 @@ -23,11 +25,16 @@ CONFIG_LOGLEVEL=7
  CONFIG_SYS_MAXARGS=64
  CONFIG_SYS_CBSIZE=512
@@ -93,41 +98,6 @@ index e009faee0252..711cf13592db 100644
 -CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
 +CONFIG_FWU_MULTI_BANK_UPDATE=y
 +# CONFIG_TOOLS_MKEFICAPSULE is not set
-diff --git a/fs/fs.c b/fs/fs.c
-index 8324b4a22f20..f54955a2b7f6 100644
---- a/fs/fs.c
-+++ b/fs/fs.c
-@@ -437,11 +437,13 @@ int fs_set_blk_dev(const char *ifname, const char *dev_part_str, int fstype)
- 	}
- #endif
- 
-+	log_err("RUI: fs_set_blk_dev fstype: %d\n", fstype);
- 	part = part_get_info_by_dev_and_name_or_num(ifname, dev_part_str, &fs_dev_desc,
- 						    &fs_partition, 1);
- 	if (part < 0)
- 		return -1;
- 
-+	log_err("RUI: fs_set_blk_dev 1\n");
- 	for (i = 0, info = fstypes; i < ARRAY_SIZE(fstypes); i++, info++) {
- 		if (fstype != FS_TYPE_ANY && info->fstype != FS_TYPE_ANY &&
- 				fstype != info->fstype)
-@@ -450,6 +452,8 @@ int fs_set_blk_dev(const char *ifname, const char *dev_part_str, int fstype)
- 		if (!fs_dev_desc && !info->null_dev_desc_ok)
- 			continue;
- 
-+		log_err("RUI: fs_set_blk_dev 2: info->fstype: %d part: %d\n",
-+			info->fstype, part);
- 		if (!info->probe(fs_dev_desc, &fs_partition)) {
- 			fs_type = info->fstype;
- 			fs_dev_part = part;
-@@ -457,6 +461,7 @@ int fs_set_blk_dev(const char *ifname, const char *dev_part_str, int fstype)
- 		}
- 	}
- 
-+	log_err("RUI: fs_set_blk_dev 3\n");
- 	return -1;
- }
- 
 -- 
-2.39.2
+2.40.0
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch
index 25e248b73464..547ea954a2af 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch
@@ -1,4 +1,4 @@
-From e8272dc9390adfd0818d1093c83f3b5c07649a95 Mon Sep 17 00:00:00 2001
+From d736c596f7a8446955d35bef5adae22de24ab9ab Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 23 Feb 2023 10:35:00 +0000
 Subject: [PATCH 42/43] corstone1000: set kernel_addr based on boot_idx
@@ -13,12 +13,13 @@ then set the env variable kernel_addr with that value.
 Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- board/armltd/corstone1000/corstone1000.c | 55 +++++++++++++++++++++++-
- configs/corstone1000_defconfig           |  1 +
- 2 files changed, 55 insertions(+), 1 deletion(-)
+ board/armltd/corstone1000/corstone1000.c   | 58 +++++++++++++++++++++-
+ board/armltd/corstone1000/corstone1000.env |  8 ---
+ configs/corstone1000_defconfig             |  1 +
+ 3 files changed, 58 insertions(+), 9 deletions(-)
 
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
-index 0a58ccd99cdd..0923ca6e8c5b 100644
+index 0a58ccd99cdd..b767195cccb6 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -5,13 +5,23 @@
@@ -45,7 +46,7 @@ index 0a58ccd99cdd..0923ca6e8c5b 100644
  static struct mm_region corstone1000_mem_map[] = {
  	{
  		/* CVM */
-@@ -108,5 +118,48 @@ int dram_init_banksize(void)
+@@ -108,5 +118,51 @@ int dram_init_banksize(void)
  
  void fwu_plat_get_bootidx(int *boot_idx)
  {
@@ -70,6 +71,9 @@ index 0a58ccd99cdd..0923ca6e8c5b 100644
 +	plat = dev_get_plat(dev);
 +	device_find_first_child(dev, &bdev);
 +	desc = dev_get_uclass_plat(bdev);
++	ret = fwu_get_active_index(&corstone1000_boot_idx);
++	if (ret < 0)
++		log_err("corstone1000: failed to read boot index\n");
 +
 +	if (!corstone1000_boot_idx)
 +		ret = part_get_info_by_name(desc, CORSTONE1000_KERNEL_PRIMARY,
@@ -95,8 +99,25 @@ index 0a58ccd99cdd..0923ca6e8c5b 100644
 +
 +	return ret;
  }
+diff --git a/board/armltd/corstone1000/corstone1000.env b/board/armltd/corstone1000/corstone1000.env
+index a6ee4962211b..ee318b1b1c30 100644
+--- a/board/armltd/corstone1000/corstone1000.env
++++ b/board/armltd/corstone1000/corstone1000.env
+@@ -2,12 +2,4 @@
+ 
+ usb_pgood_delay=250
+ boot_bank_flag=0x08005006
+-kernel_addr_bank_0=0x08280000
+-kernel_addr_bank_1=0x0936E000
+-retrieve_kernel_load_addr=
+-	if itest.l *${boot_bank_flag} == 0; then
+-		setenv kernel_addr $kernel_addr_bank_0;
+-	else
+-		setenv kernel_addr $kernel_addr_bank_1;
+-	fi;
+ kernel_addr_r=0x88200000
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
-index 711cf13592db..68054f755624 100644
+index 96bb86ec91e9..23e9e6ae5bd3 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -22,6 +22,7 @@ CONFIG_CONSOLE_RECORD=y
@@ -108,5 +129,5 @@ index 711cf13592db..68054f755624 100644
  CONFIG_SYS_CBSIZE=512
  # CONFIG_CMD_CONSOLE is not set
 -- 
-2.39.2
+2.40.0
 
-- 
2.40.0


