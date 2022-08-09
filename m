Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368FBC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:32:08 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.11897.1660051921289751193
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=e00/JT67;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id b7so8519013qvq.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=JXuTTfxTJ/GyWo895a2KN+hTVsgVE3Ha54Fe8GQNHsQ=;
        b=e00/JT6780AKiDWI88Opakxt3qBl/wuyNg+2WkrTl0suseTG9P42Y0vcBjcxGBGcn/
         JfAEaxoclVN93yFofyg2CY9ekZNFfbXXZuVojaHl1dWQvwJXlJ16gLVF2BNTFR/Vbc39
         mRcPP5qEL6QWif6wvBp2YoUZfmbYJYIoEKqSHthXIKHa5h3bQKUAp72fAkpNz0MaNkB8
         HfeEZ5j4OPtaZBcB06NT2LjSIjxnM3GZr4RB3gnpYVlMuonOuKmx41/e8XEkPtwBCTHV
         eGhv8gxy3X32RzR+iM7LOpgfO/l5wmnT5rF80aHBDWI+sbpLLz6A6ApqdpHKlcX4HQTa
         nZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=JXuTTfxTJ/GyWo895a2KN+hTVsgVE3Ha54Fe8GQNHsQ=;
        b=lsrEdC93ONNSH0XukH8uaSdjhTb6PuBDmKGmS8Pim3ywsBwZXKOmFEYEpLLl/JVDWN
         GkUm7jBFz32sddprFH83QO6fafxxinvUzCRdteWknppsksrITSmhDe7YDdpkBvRTXdZi
         4gClszQRBDrw7TR/735e9OcGKB0aR3x58xmbjYxsUzGuBznOYtgv4cJr/4GwSQndsAJT
         NpW1ZDMz9BN78I/HNXtg8hmkViYmKr4TxwvVnf+gOt/HHjT3lmf6IjDmvm0hZHjzy+1m
         M+glyvENX3JZFrAn81zE0niPqZxHCB3khFTXkV/LfEkFHsRUc8WFtKsGltoTDbulcUkq
         P8iA==
X-Gm-Message-State: ACgBeo3JZbPwtwQcP5IENsSnCx5VEpFdioU++tT943xAcf4/xLCHLGmX
	1jqWp98J0TFj0zuuZuVcm7WCRFxomLLVxYxD
X-Google-Smtp-Source: 
 AA6agR4WcjShflYSDNaOnmlxblfMGZyp7sCy0y+76c2lG3dQLKhRbdxk9bxln4ECK3bvw1ZD4kh06w==
X-Received: by 2002:ad4:5f0b:0:b0:478:4658:35f7 with SMTP id
 fo11-20020ad45f0b000000b00478465835f7mr19917998qvb.96.1660051919584;
        Tue, 09 Aug 2022 06:31:59 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 y4-20020ac81284000000b00342f4fc290esm5400598qti.71.2022.08.09.06.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 06:31:58 -0700 (PDT)
Date: Tue, 9 Aug 2022 09:31:57 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/corstone1000: rebase u-boot patches on top
 v2022.07
Message-ID: <YvJhzY1etct15gNa@kudzu.us>
References: <20220809123709.2985416-1-rui.silva@linaro.org>
 <20220809123709.2985416-2-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809123709.2985416-2-rui.silva@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Aug 2022 13:32:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3665

On Tue, Aug 09, 2022 at 01:37:08PM +0100, Rui Miguel Silva wrote:
> Rebase the u-boot patches on top of current u-boot supported
> version in poky, needed some adjustments at efi loader.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>

This patch doesn't apply cleanly because Gowtham's recent patch
dropped some of the files you are modifying.  See

commit 44c58b3e553dcf5abe2fb522d128d864a2651c4c
Author: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Date:   Fri Aug 5 15:09:50 2022 +0100

    arm-bsp/u-boot: drop EFI GetVariable() workarounds patches
    
    The dropped u-boot patches are not required as the bug is
    from the SMM Gateway SP. A patch for the secure partitions
    has been added to fix the SMM Gateway behaviour. Patch
    0048-Fix-UEFI-get_variable-with-small-buffer.patch has been
    added in commit "arm-bsp/secure-partitions: fix SMM gateway
    bug for EFI GetVariable()".
    
    Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>


Please rebase and resend this patch.  Since the corstone500 one
applied cleanly, I've pulled that one in already.

Thanks,
Jon

> ---
>  .../conf/machine/include/corstone1000.inc     |  2 +-
>  ...d-add-load-command-for-memory-mapped.patch | 24 +++----
>  ...add-support-to-corstone1000-platform.patch | 30 +++++----
>  ...3-usb-common-move-urb-code-to-common.patch |  4 +-
>  .../0004-usb-add-isp1760-family-driver.patch  |  8 +--
>  ...ne1000-enable-isp1763-usb-controller.patch |  4 +-
>  ...ntroducing-Arm-FF-A-low-level-driver.patch | 36 +++++-----
>  ...7-arm_ffa-introducing-armffa-command.patch | 14 ++--
>  ...troducing-MM-communication-with-FF-A.patch | 16 ++---
>  ...troducing-test-module-for-UCLASS_FFA.patch | 10 +--
>  ...stone1000-enable-FF-A-and-MM-support.patch |  4 +-
>  ...one1000-introduce-EFI-capsule-update.patch | 30 ++++-----
>  ...000-Update-FFA-shared-buffer-address.patch |  4 +-
>  ...e-sure-shared-buffer-contents-are-no.patch |  4 +-
>  ...000-fix-unrecognized-filesystem-type.patch |  8 +--
>  ...tone1000-pass-interface-id-and-buffe.patch | 10 +--
>  ...stone1000-pass-interface-id-and-kern.patch |  8 +--
>  ...one1000-remove-guid-check-from-corst.patch | 10 +--
>  ...-the-cast-when-using-binary-OR-on-FI.patch |  4 +-
>  ...-error-code-when-rx-buffer-is-larger.patch |  4 +-
>  .../0020-Use-correct-buffer-size.patch        |  4 +-
>  ...e-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch |  4 +-
>  ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |  8 +--
>  ...-add-get_image_info-for-corstone1000.patch | 65 ++++++++++---------
>  ...4-Comment-mm_communicate-failure-log.patch |  4 +-
>  ...bootcomplete-message-to-secure-encla.patch | 16 ++---
>  ...ull-pointer-exception-with-get_image.patch |  8 +--
>  ...027-arm-corstone1000-add-mmc-for-fvp.patch |  6 +-
>  28 files changed, 178 insertions(+), 171 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> index 91dbbfdb1fd7..081c8041c237 100644
> --- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
> +++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> @@ -22,7 +22,7 @@ TFM_SIGN_PRIVATE_KEY = "${S}/bl2/ext/mcuboot/root-RSA-3072_1.pem"
>  RE_IMAGE_OFFSET = "0x1000"
>  
>  # u-boot
> -PREFERRED_VERSION_u-boot ?= "2022.04"
> +PREFERRED_VERSION_u-boot ?= "2022.07"
>  EXTRA_IMAGEDEPENDS += "u-boot"
>  
>  UBOOT_CONFIG ??= "EFI"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
> index d0ae964f1b80..7356e9f8bbfa 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-mapped.patch
> @@ -1,4 +1,4 @@
> -From c047b15fba9da36616bc9a346d9fe4d76e7ca4b2 Mon Sep 17 00:00:00 2001
> +From d1ac9904bc49c58f08a604079180de4de17fec77 Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Thu, 24 Jun 2021 09:25:00 +0100
>  Subject: [PATCH 01/27] cmd: load: add load command for memory mapped
> @@ -26,10 +26,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   6 files changed, 78 insertions(+)
>  
>  diff --git a/README b/README
> -index f51f392111f9..049bcd108980 100644
> +index b7ab6e50708d..cd76f95e74c1 100644
>  --- a/README
>  +++ b/README
> -@@ -2760,6 +2760,7 @@ rarpboot- boot image via network using RARP/TFTP protocol
> +@@ -2578,6 +2578,7 @@ rarpboot- boot image via network using RARP/TFTP protocol
>   diskboot- boot from IDE devicebootd   - boot default, i.e., run 'bootcmd'
>   loads	- load S-Record file over serial line
>   loadb	- load binary file over serial line (kermit mode)
> @@ -38,10 +38,10 @@ index f51f392111f9..049bcd108980 100644
>   mm	- memory modify (auto-incrementing)
>   nm	- memory modify (constant address)
>  diff --git a/cmd/Kconfig b/cmd/Kconfig
> -index 5e25e45fd288..ff50102a89c7 100644
> +index 09193b61b95f..ba2f321ae989 100644
>  --- a/cmd/Kconfig
>  +++ b/cmd/Kconfig
> -@@ -1076,6 +1076,12 @@ config CMD_LOADB
> +@@ -1143,6 +1143,12 @@ config CMD_LOADB
>   	help
>   	  Load a binary file over serial line.
>   
> @@ -55,7 +55,7 @@ index 5e25e45fd288..ff50102a89c7 100644
>   	bool "loads"
>   	default y
>  diff --git a/cmd/bootefi.c b/cmd/bootefi.c
> -index 53d9f0e0dcca..8d492ea9e70c 100644
> +index 827fcd97dfd8..37ce659fa123 100644
>  --- a/cmd/bootefi.c
>  +++ b/cmd/bootefi.c
>  @@ -34,6 +34,18 @@ static struct efi_device_path *bootefi_device_path;
> @@ -141,10 +141,10 @@ index 7e4a552d90ef..1224a7f85bb3 100644
>  +);
>  +#endif /* CONFIG_CMD_LOADM */
>  diff --git a/include/efi_loader.h b/include/efi_loader.h
> -index af36639ec6a7..126db279dd3e 100644
> +index 11930fbea838..5b41985244e2 100644
>  --- a/include/efi_loader.h
>  +++ b/include/efi_loader.h
> -@@ -585,6 +585,8 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj *handle,
> +@@ -591,6 +591,8 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj *handle,
>   void efi_save_gd(void);
>   /* Call this to relocate the runtime section to an address space */
>   void efi_runtime_relocate(ulong offset, struct efi_mem_desc *map);
> @@ -154,10 +154,10 @@ index af36639ec6a7..126db279dd3e 100644
>   void efi_add_handle(efi_handle_t obj);
>   /* Create handle */
>  diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_device_path.c
> -index 0542aaae16c7..d8dc59b2c95c 100644
> +index 171661b89727..2493d7432613 100644
>  --- a/lib/efi_loader/efi_device_path.c
>  +++ b/lib/efi_loader/efi_device_path.c
> -@@ -1138,6 +1138,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
> +@@ -1158,6 +1158,8 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
>   {
>   	struct blk_desc *desc = NULL;
>   	struct disk_partition fs_partition;
> @@ -166,7 +166,7 @@ index 0542aaae16c7..d8dc59b2c95c 100644
>   	int part = 0;
>   	char *filename;
>   	char *s;
> -@@ -1153,6 +1155,13 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
> +@@ -1173,6 +1175,13 @@ efi_status_t efi_dp_from_name(const char *dev, const char *devnr,
>   	} else if (!strcmp(dev, "Uart")) {
>   		if (device)
>   			*device = efi_dp_from_uart();
> @@ -181,5 +181,5 @@ index 0542aaae16c7..d8dc59b2c95c 100644
>   		part = blk_get_device_part_str(dev, devnr, &desc, &fs_partition,
>   					       1);
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
> index e0caaa44b9ea..1dc3785c86e8 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.patch
> @@ -1,4 +1,4 @@
> -From 5cc889db3279ef4944ab64e36db3dbab1bf9ffa5 Mon Sep 17 00:00:00 2001
> +From 1d227611a37c75543bad5cc9595717e3d6c28901 Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Tue, 15 Feb 2022 09:44:10 +0000
>  Subject: [PATCH 02/27] arm: add support to corstone1000 platform
> @@ -27,10 +27,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   board/armltd/corstone1000/Kconfig        |  12 ++
>   board/armltd/corstone1000/MAINTAINERS    |   7 +
>   board/armltd/corstone1000/Makefile       |   7 +
> - board/armltd/corstone1000/corstone1000.c | 121 ++++++++++++++++
> + board/armltd/corstone1000/corstone1000.c | 125 +++++++++++++++++
>   configs/corstone1000_defconfig           |  80 +++++++++++
>   include/configs/corstone1000.h           |  86 ++++++++++++
> - 11 files changed, 548 insertions(+)
> + 11 files changed, 552 insertions(+)
>   create mode 100644 arch/arm/dts/corstone1000-fvp.dts
>   create mode 100644 arch/arm/dts/corstone1000-mps3.dts
>   create mode 100644 arch/arm/dts/corstone1000.dtsi
> @@ -42,12 +42,12 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   create mode 100644 include/configs/corstone1000.h
>  
>  diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index 4567c183fb84..d64051b533a7 100644
> +index 9898c7d68e1b..2fc2b7d20f12 100644
>  --- a/arch/arm/Kconfig
>  +++ b/arch/arm/Kconfig
> -@@ -1266,6 +1266,12 @@ config TARGET_VEXPRESS64_JUNO
> - 	select USB
> - 	imply OF_HAS_PRIOR_STAGE
> +@@ -1347,6 +1347,12 @@ config ARCH_VEXPRESS64
> + 	select ENV_IS_IN_FLASH if MTD
> + 	imply DISTRO_DEFAULTS
>   
>  +config TARGET_CORSTONE1000
>  +	bool "Support Corstone1000 Platform"
> @@ -58,7 +58,7 @@ index 4567c183fb84..d64051b533a7 100644
>   config TARGET_TOTAL_COMPUTE
>   	bool "Support Total Compute Platform"
>   	select ARM64
> -@@ -2198,6 +2204,8 @@ source "arch/arm/mach-nexell/Kconfig"
> +@@ -2295,6 +2301,8 @@ source "arch/arm/mach-npcm/Kconfig"
>   
>   source "board/armltd/total_compute/Kconfig"
>   
> @@ -68,10 +68,10 @@ index 4567c183fb84..d64051b533a7 100644
>   source "board/bosch/guardian/Kconfig"
>   source "board/Marvell/octeontx/Kconfig"
>  diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> -index 644ba961a223..7de25d09c9fe 100644
> +index a7e0d9f6c0e8..8c8f15b6a813 100644
>  --- a/arch/arm/dts/Makefile
>  +++ b/arch/arm/dts/Makefile
> -@@ -1215,6 +1215,9 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) += lpc3250-ea3250.dtb
> +@@ -1265,6 +1265,9 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) += lpc3250-ea3250.dtb
>   
>   dtb-$(CONFIG_ARCH_QEMU) += qemu-arm.dtb qemu-arm64.dtb
>   
> @@ -369,10 +369,10 @@ index 000000000000..77a82c28929b
>  +obj-y	:= corstone1000.o
>  diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
>  new file mode 100644
> -index 000000000000..eff1739f0b02
> +index 000000000000..2fa485ff3799
>  --- /dev/null
>  +++ b/board/armltd/corstone1000/corstone1000.c
> -@@ -0,0 +1,121 @@
> +@@ -0,0 +1,125 @@
>  +// SPDX-License-Identifier: GPL-2.0+
>  +/*
>  + * (C) Copyright 2022 ARM Limited
> @@ -452,6 +452,10 @@ index 000000000000..eff1739f0b02
>  +
>  +struct mm_region *mem_map = corstone1000_mem_map;
>  +
> ++void set_dfu_alt_info(char *interface, char *devstr)
> ++{
> ++}
> ++
>  +int board_init(void)
>  +{
>  +	return 0;
> @@ -673,5 +677,5 @@ index 000000000000..cf166f107efd
>  +				"bootefi $kernel_addr_r $fdtcontroladdr;"
>  +#endif
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
> index 9974915a0b16..b2ad1640d02b 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
> @@ -1,4 +1,4 @@
> -From b8f4f76e135ff2061d0032292f5209ac911dba16 Mon Sep 17 00:00:00 2001
> +From 45801e4c737cff40d3ea94f921a7abe89bf2797d Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Mon, 28 Jun 2021 23:20:55 +0100
>  Subject: [PATCH 03/27] usb: common: move urb code to common
> @@ -493,5 +493,5 @@ index 6dd2c997f9b3..ec00161710a5 100644
>   /*
>    * Hub Status & Hub Change bit masks
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
> index 5940f06d4d3c..2796ee9dd628 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
> @@ -1,4 +1,4 @@
> -From 62a666a83766f5517e90464638455286bb33f433 Mon Sep 17 00:00:00 2001
> +From 466f5eb0bdf4bdcba141409e1e8dc57697e7533e Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Mon, 28 Jun 2021 23:31:25 +0100
>  Subject: [PATCH 04/27] usb: add isp1760 family driver
> @@ -34,10 +34,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   create mode 100644 drivers/usb/isp1760/isp1760-uboot.h
>  
>  diff --git a/Makefile b/Makefile
> -index ad83d60dc39d..2c857c1fe2cc 100644
> +index 98867fbe06b4..67851020f5c1 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -834,6 +834,7 @@ libs-y += drivers/usb/host/
> +@@ -841,6 +841,7 @@ libs-y += drivers/usb/host/
>   libs-y += drivers/usb/mtu3/
>   libs-y += drivers/usb/musb/
>   libs-y += drivers/usb/musb-new/
> @@ -3801,5 +3801,5 @@ index 000000000000..2486de6f9e27
>  +
>  +#endif
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
> index 2ce03b64015f..be25477951f4 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controller.patch
> @@ -1,4 +1,4 @@
> -From b7fb62e512e00a5fdbb4321bb0b4109261518481 Mon Sep 17 00:00:00 2001
> +From dd699e47ba3f2c12b11e884d5afc071554ab8fc1 Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Thu, 3 Mar 2022 16:52:02 +0000
>  Subject: [PATCH 05/27] corstone1000: enable isp1763 usb controller
> @@ -44,5 +44,5 @@ index cf166f107efd..8ba0effb0ab2 100644
>   				"boot_bank_flag=0x08002000\0"				\
>   				"kernel_addr_bank_0=0x083EE000\0"			\
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
> index 8cc848fec362..32d0e216971e 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
> @@ -1,4 +1,4 @@
> -From ede21dc1ca75132698cc81e88357c5789ccf67c7 Mon Sep 17 00:00:00 2001
> +From 18717f89a3745555a9af40f17c4012029e7d7e15 Mon Sep 17 00:00:00 2001
>  From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>  Date: Tue, 16 Nov 2021 12:34:52 +0000
>  Subject: [PATCH 06/27] arm_ffa: introducing Arm FF-A low-level driver
> @@ -58,10 +58,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   create mode 100644 lib/arm-ffa/arm_ffa_helper.c
>  
>  diff --git a/MAINTAINERS b/MAINTAINERS
> -index 96582fc67777..14307e6da644 100644
> +index 7f27ff4c20fc..d29d7e040764 100644
>  --- a/MAINTAINERS
>  +++ b/MAINTAINERS
> -@@ -232,6 +232,14 @@ F:	board/CZ.NIC/
> +@@ -244,6 +244,14 @@ F:	board/CZ.NIC/
>   F:	configs/turris_*_defconfig
>   F:	include/configs/turris_*.h
>   
> @@ -143,20 +143,20 @@ index 22fd541f9a28..45eca83a473c 100644
>   	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, state));
>   #endif
>  diff --git a/common/board_r.c b/common/board_r.c
> -index c24d9b4e220b..af20f38b104c 100644
> +index 6f4aca2077d6..412a0ea9fac3 100644
>  --- a/common/board_r.c
>  +++ b/common/board_r.c
> -@@ -61,6 +61,9 @@
> - #include <wdt.h>
> +@@ -62,6 +62,9 @@
>   #include <asm-generic/gpio.h>
>   #include <efi_loader.h>
> + #include <relocate.h>
>  +#ifdef CONFIG_ARM_FFA_TRANSPORT
>  +#include <arm_ffa_helper.h>
>  +#endif
>   
>   DECLARE_GLOBAL_DATA_PTR;
>   
> -@@ -770,6 +773,9 @@ static init_fnc_t init_sequence_r[] = {
> +@@ -779,6 +782,9 @@ static init_fnc_t init_sequence_r[] = {
>   	INIT_FUNC_WATCHDOG_RESET
>   	initr_net,
>   #endif
> @@ -180,10 +180,10 @@ index b26ca8cf70c9..e83c23789d1b 100644
>   
>   source "drivers/axi/Kconfig"
>  diff --git a/drivers/Makefile b/drivers/Makefile
> -index 4e7cf284405a..6671d2a604ab 100644
> +index 67c8af74424e..1be687b55d13 100644
>  --- a/drivers/Makefile
>  +++ b/drivers/Makefile
> -@@ -107,6 +107,7 @@ obj-y += iommu/
> +@@ -109,6 +109,7 @@ obj-y += iommu/
>   obj-y += smem/
>   obj-y += thermal/
>   obj-$(CONFIG_TEE) += tee/
> @@ -2249,10 +2249,10 @@ index 000000000000..0e143e54511e
>  +int ffa_uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin);
>  +#endif
>  diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
> -index 0e26e1d13824..a1181b8f48e7 100644
> +index 3ba69ad9a084..732441824557 100644
>  --- a/include/dm/uclass-id.h
>  +++ b/include/dm/uclass-id.h
> -@@ -52,6 +52,7 @@ enum uclass_id {
> +@@ -55,6 +55,7 @@ enum uclass_id {
>   	UCLASS_EFI_MEDIA,	/* Devices provided by UEFI firmware */
>   	UCLASS_ETH,		/* Ethernet device */
>   	UCLASS_ETH_PHY,		/* Ethernet PHY device */
> @@ -2320,10 +2320,10 @@ index 7f2be2339475..54980a130fdb 100644
>   
>   #define arm_smccc_smc_quirk(...) __arm_smccc_smc(__VA_ARGS__)
>  diff --git a/lib/Kconfig b/lib/Kconfig
> -index 3c6fa99b1a6a..473821b882e2 100644
> +index acc0ac081a44..65db65c3c4cd 100644
>  --- a/lib/Kconfig
>  +++ b/lib/Kconfig
> -@@ -810,6 +810,7 @@ config SMBIOS_PARSER
> +@@ -902,6 +902,7 @@ config SMBIOS_PARSER
>   source lib/efi/Kconfig
>   source lib/efi_loader/Kconfig
>   source lib/optee/Kconfig
> @@ -2332,7 +2332,7 @@ index 3c6fa99b1a6a..473821b882e2 100644
>   config TEST_FDTDEC
>   	bool "enable fdtdec test"
>  diff --git a/lib/Makefile b/lib/Makefile
> -index 11b03d1cbec8..8e6fad613067 100644
> +index d9b1811f7506..4aa3e2ed2a7e 100644
>  --- a/lib/Makefile
>  +++ b/lib/Makefile
>  @@ -9,6 +9,7 @@ obj-$(CONFIG_EFI) += efi/
> @@ -2564,7 +2564,7 @@ index 000000000000..623899d38044
>  +	return 0;
>  +}
>  diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
> -index 5bcb8253edba..cffa2c69d621 100644
> +index 4da64b5d2962..c68d9ed4f0bd 100644
>  --- a/lib/efi_loader/efi_boottime.c
>  +++ b/lib/efi_loader/efi_boottime.c
>  @@ -23,6 +23,10 @@
> @@ -2578,7 +2578,7 @@ index 5bcb8253edba..cffa2c69d621 100644
>   DECLARE_GLOBAL_DATA_PTR;
>   
>   /* Task priority level */
> -@@ -2114,6 +2118,10 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
> +@@ -2113,6 +2117,10 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
>   	struct efi_event *evt, *next_event;
>   	efi_status_t ret = EFI_SUCCESS;
>   
> @@ -2589,7 +2589,7 @@ index 5bcb8253edba..cffa2c69d621 100644
>   	EFI_ENTRY("%p, %zx", image_handle, map_key);
>   
>   	/* Check that the caller has read the current memory map */
> -@@ -2174,6 +2182,15 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
> +@@ -2173,6 +2181,15 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
>   		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
>   	}
>   
> @@ -2606,5 +2606,5 @@ index 5bcb8253edba..cffa2c69d621 100644
>   	efi_runtime_detach();
>   
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
> index 83f0547ea96c..b88e3696380f 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introducing-armffa-command.patch
> @@ -1,4 +1,4 @@
> -From 541b2b51dc77832ab5845cab4762d29976838d36 Mon Sep 17 00:00:00 2001
> +From a53c7fef8ed8b5dc4154ad092781b9a6f8f55baa Mon Sep 17 00:00:00 2001
>  From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>  Date: Tue, 16 Nov 2021 12:36:27 +0000
>  Subject: [PATCH 07/27] arm_ffa: introducing armffa command
> @@ -20,10 +20,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   create mode 100644 cmd/armffa.c
>  
>  diff --git a/MAINTAINERS b/MAINTAINERS
> -index 14307e6da644..f3fd559da54a 100644
> +index d29d7e040764..32fc267fcf13 100644
>  --- a/MAINTAINERS
>  +++ b/MAINTAINERS
> -@@ -235,6 +235,7 @@ F:	include/configs/turris_*.h
> +@@ -247,6 +247,7 @@ F:	include/configs/turris_*.h
>   ARM FF-A
>   M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>   S:	Maintained
> @@ -32,10 +32,10 @@ index 14307e6da644..f3fd559da54a 100644
>   F:	include/arm_ffa.h
>   F:	include/arm_ffa_helper.h
>  diff --git a/cmd/Kconfig b/cmd/Kconfig
> -index ff50102a89c7..ff124bf4bad0 100644
> +index ba2f321ae989..090e668125d5 100644
>  --- a/cmd/Kconfig
>  +++ b/cmd/Kconfig
> -@@ -813,6 +813,16 @@ endmenu
> +@@ -873,6 +873,16 @@ endmenu
>   
>   menu "Device access commands"
>   
> @@ -53,7 +53,7 @@ index ff50102a89c7..ff124bf4bad0 100644
>   	#depends on FLASH_CFI_DRIVER
>   	bool "armflash"
>  diff --git a/cmd/Makefile b/cmd/Makefile
> -index 166c652d9825..770b846c44e0 100644
> +index 5e43a1e022e8..e40f52f1e416 100644
>  --- a/cmd/Makefile
>  +++ b/cmd/Makefile
>  @@ -12,6 +12,8 @@ obj-y += panic.o
> @@ -338,5 +338,5 @@ index 000000000000..71a6ebb656d1
>  +	   "devlist\n"
>  +	   "	 - displays the arm_ffa device info\n");
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
> index 9b1383ebe4c4..8a540f71c6fa 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
> @@ -1,4 +1,4 @@
> -From 2f09d4a2e87febd7365b9e18d669208ff2c35edc Mon Sep 17 00:00:00 2001
> +From 17ff3e90f1680dde0dfd9c5a544f7db0817beaf0 Mon Sep 17 00:00:00 2001
>  From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>  Date: Wed, 13 Oct 2021 17:51:44 +0100
>  Subject: [PATCH 08/27] arm_ffa: introducing MM communication with FF-A
> @@ -30,10 +30,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   2 files changed, 273 insertions(+), 6 deletions(-)
>  
>  diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
> -index e5e35fe51f65..6827b821545e 100644
> +index e3f2402d0e8e..37131237af3f 100644
>  --- a/lib/efi_loader/Kconfig
>  +++ b/lib/efi_loader/Kconfig
> -@@ -56,13 +56,23 @@ config EFI_VARIABLE_FILE_STORE
> +@@ -60,13 +60,23 @@ config EFI_VARIABLE_FILE_STORE
>   	  stored as file /ubootefi.var on the EFI system partition.
>   
>   config EFI_MM_COMM_TEE
> @@ -42,7 +42,7 @@ index e5e35fe51f65..6827b821545e 100644
>  +	bool "UEFI variables storage service via the trusted world"
>  +	depends on OPTEE || ARM_FFA_TRANSPORT
>   	help
> -+	  The MM SP (also called partition) can be StandAlonneMM or smm-gateway.
> ++         the MM SP (also called partition) can be StandAlonneMM or smm-gateway.
>  +	  When using the u-boot OP-TEE driver, StandAlonneMM is supported.
>  +	  When using the u-boot FF-A  driver, StandAlonneMM and smm-gateway are supported.
>  +
> @@ -56,9 +56,9 @@ index e5e35fe51f65..6827b821545e 100644
>  +	  MM buffer. The data is copied by u-boot to thea shared buffer before issuing
>  +	  the door bell event.
>  +
> - endchoice
> - 
> - config EFI_VARIABLES_PRESEED
> + config EFI_VARIABLE_NO_STORE
> + 	bool "Don't persist non-volatile UEFI variables"
> + 	help
>  diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
>  index dfef18435dfa..9cb8cfb9c779 100644
>  --- a/lib/efi_loader/efi_variable_tee.c
> @@ -379,5 +379,5 @@ index dfef18435dfa..9cb8cfb9c779 100644
>   
>   	/*
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
> index 4fb317ba85d2..0db34ac3ff98 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
> @@ -1,4 +1,4 @@
> -From c9a2c457648b732292482fae59a7fd61cefffd33 Mon Sep 17 00:00:00 2001
> +From ca7724cded2c1f1be0610d5c6aa96a2a02efbf6b Mon Sep 17 00:00:00 2001
>  From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>  Date: Tue, 16 Nov 2021 12:38:48 +0000
>  Subject: [PATCH 09/27] arm_ffa: introducing test module for UCLASS_FFA
> @@ -17,10 +17,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   create mode 100644 test/dm/ffa.h
>  
>  diff --git a/MAINTAINERS b/MAINTAINERS
> -index f3fd559da54a..6510f844fe09 100644
> +index 32fc267fcf13..8209dc9319f1 100644
>  --- a/MAINTAINERS
>  +++ b/MAINTAINERS
> -@@ -240,6 +240,7 @@ F:	drivers/arm-ffa/
> +@@ -252,6 +252,7 @@ F:	drivers/arm-ffa/
>   F:	include/arm_ffa.h
>   F:	include/arm_ffa_helper.h
>   F:	lib/arm-ffa/
> @@ -29,7 +29,7 @@ index f3fd559da54a..6510f844fe09 100644
>   ARM FREESCALE IMX
>   M:	Stefano Babic <sbabic@denx.de>
>  diff --git a/test/dm/Makefile b/test/dm/Makefile
> -index d46552fbf320..ddac250cdff0 100644
> +index f0a7c97e3d17..09a3403d2f53 100644
>  --- a/test/dm/Makefile
>  +++ b/test/dm/Makefile
>  @@ -79,6 +79,7 @@ obj-$(CONFIG_POWER_DOMAIN) += power-domain.o
> @@ -128,5 +128,5 @@ index 000000000000..a0802bd6928a
>  +
>  +#endif /*__TEST_DM_FFA_H */
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
> index bc96fc461929..c7e2a8b4ed39 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
> @@ -1,4 +1,4 @@
> -From ce6598d255113458fd5c9d19bb7469b721e37f6f Mon Sep 17 00:00:00 2001
> +From 78c4d304c808e59045ce75899285b28e3cd12bd6 Mon Sep 17 00:00:00 2001
>  From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>  Date: Tue, 2 Nov 2021 16:44:39 +0000
>  Subject: [PATCH 10/27] arm_ffa: corstone1000: enable FF-A and MM support
> @@ -53,5 +53,5 @@ index 8ba0effb0ab2..afc9ccfc192b 100644
>   #define CONFIG_SKIP_LOWLEVEL_INIT
>   
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
> index cb24ec3e1451..5024e43eeddc 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule-update.patch
> @@ -1,4 +1,4 @@
> -From e70d0128090158872847b82b82cdbcf0e2f13885 Mon Sep 17 00:00:00 2001
> +From ff3d798233a4a52459684f0800320d4fb706de2e Mon Sep 17 00:00:00 2001
>  From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>  Date: Thu, 11 Nov 2021 16:27:59 +0000
>  Subject: [PATCH 11/27] efi: corstone1000: introduce EFI capsule update
> @@ -58,10 +58,10 @@ index afc9ccfc192b..a400cdef69d0 100644
>   #define MM_SP_UUID_DATA	\
>   	0xed, 0x32, 0xd5, 0x33,	\
>  diff --git a/include/efi_loader.h b/include/efi_loader.h
> -index 126db279dd3e..01b432e6184b 100644
> +index 5b41985244e2..796419b69b40 100644
>  --- a/include/efi_loader.h
>  +++ b/include/efi_loader.h
> -@@ -965,11 +965,11 @@ extern const struct efi_firmware_management_protocol efi_fmp_fit;
> +@@ -984,11 +984,11 @@ extern const struct efi_firmware_management_protocol efi_fmp_fit;
>   extern const struct efi_firmware_management_protocol efi_fmp_raw;
>   
>   /* Capsule update */
> @@ -76,10 +76,10 @@ index 126db279dd3e..01b432e6184b 100644
>   		efi_uintn_t capsule_count,
>   		u64 *maximum_capsule_size,
>  diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
> -index cffa2c69d621..5c77a40c3ebe 100644
> +index c68d9ed4f0bd..f2b5c7834c01 100644
>  --- a/lib/efi_loader/efi_boottime.c
>  +++ b/lib/efi_loader/efi_boottime.c
> -@@ -2096,6 +2096,44 @@ static void efi_exit_caches(void)
> +@@ -2095,6 +2095,44 @@ static void efi_exit_caches(void)
>   #endif
>   }
>   
> @@ -124,7 +124,7 @@ index cffa2c69d621..5c77a40c3ebe 100644
>   /**
>    * efi_exit_boot_services() - stop all boot services
>    * @image_handle: handle of the loaded image
> -@@ -2209,6 +2247,15 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
> +@@ -2208,6 +2246,15 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
>   	/* Recalculate CRC32 */
>   	efi_update_table_header_crc32(&systab.hdr);
>   
> @@ -141,10 +141,10 @@ index cffa2c69d621..5c77a40c3ebe 100644
>   	efi_set_watchdog(0);
>   	WATCHDOG_RESET();
>  diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
> -index f00440163d41..c100c1b95298 100644
> +index a6b98f066a0b..a0689ba912fc 100644
>  --- a/lib/efi_loader/efi_capsule.c
>  +++ b/lib/efi_loader/efi_capsule.c
> -@@ -24,6 +24,14 @@
> +@@ -25,6 +25,14 @@
>   #include <crypto/pkcs7_parser.h>
>   #include <linux/err.h>
>   
> @@ -159,7 +159,7 @@ index f00440163d41..c100c1b95298 100644
>   DECLARE_GLOBAL_DATA_PTR;
>   
>   const efi_guid_t efi_guid_capsule_report = EFI_CAPSULE_REPORT_GUID;
> -@@ -509,6 +517,89 @@ static efi_status_t efi_capsule_update_firmware(
> +@@ -512,6 +520,89 @@ static efi_status_t efi_capsule_update_firmware(
>   }
>   #endif /* CONFIG_EFI_CAPSULE_FIRMWARE_MANAGEMENT */
>   
> @@ -249,7 +249,7 @@ index f00440163d41..c100c1b95298 100644
>   /**
>    * efi_update_capsule() - process information from operating system
>    * @capsule_header_array:	Array of virtual address pointers
> -@@ -522,7 +613,7 @@ static efi_status_t efi_capsule_update_firmware(
> +@@ -525,7 +616,7 @@ static efi_status_t efi_capsule_update_firmware(
>    *
>    * Return:			status code
>    */
> @@ -258,7 +258,7 @@ index f00440163d41..c100c1b95298 100644
>   		struct efi_capsule_header **capsule_header_array,
>   		efi_uintn_t capsule_count,
>   		u64 scatter_gather_list)
> -@@ -539,6 +630,13 @@ efi_status_t EFIAPI efi_update_capsule(
> +@@ -542,6 +633,13 @@ efi_status_t EFIAPI efi_update_capsule(
>   		goto out;
>   	}
>   
> @@ -272,7 +272,7 @@ index f00440163d41..c100c1b95298 100644
>   	ret = EFI_SUCCESS;
>   	for (i = 0, capsule = *capsule_header_array; i < capsule_count;
>   	     i++, capsule = *(++capsule_header_array)) {
> -@@ -551,6 +649,39 @@ efi_status_t EFIAPI efi_update_capsule(
> +@@ -554,6 +652,39 @@ efi_status_t EFIAPI efi_update_capsule(
>   
>   		log_debug("Capsule[%d] (guid:%pUs)\n",
>   			  i, &capsule->capsule_guid);
> @@ -312,7 +312,7 @@ index f00440163d41..c100c1b95298 100644
>   		if (!guidcmp(&capsule->capsule_guid,
>   			     &efi_guid_firmware_management_capsule_id)) {
>   			ret  = efi_capsule_update_firmware(capsule);
> -@@ -589,7 +720,7 @@ out:
> +@@ -592,7 +723,7 @@ out:
>    *
>    * Return:			status code
>    */
> @@ -322,7 +322,7 @@ index f00440163d41..c100c1b95298 100644
>   		efi_uintn_t capsule_count,
>   		u64 *maximum_capsule_size,
>  diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
> -index eee54e48784f..989380d4f8cd 100644
> +index 492ecf4cb15c..bfd4687e10b5 100644
>  --- a/lib/efi_loader/efi_setup.c
>  +++ b/lib/efi_loader/efi_setup.c
>  @@ -16,6 +16,13 @@
> @@ -355,5 +355,5 @@ index eee54e48784f..989380d4f8cd 100644
>   		ret = efi_set_variable_int(u"CapsuleMax",
>   					   &efi_guid_capsule_report,
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
> index 60dc8501b4f9..5d87a08bfdbe 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-corstone1000-Update-FFA-shared-buffer-address.patch
> @@ -1,4 +1,4 @@
> -From b2d752b4bbd5b2dc4cb22d2d652a261287505926 Mon Sep 17 00:00:00 2001
> +From 5ab4ef1ce55f18dd50441d076f8684e1b8923c5b Mon Sep 17 00:00:00 2001
>  From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>  Date: Wed, 17 Nov 2021 15:28:06 +0000
>  Subject: [PATCH 12/27] corstone1000: Update FFA shared buffer address
> @@ -33,5 +33,5 @@ index a400cdef69d0..db0f91335cef 100644
>   #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
>   #define CONFIG_SKIP_LOWLEVEL_INIT
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
> index 2495538d91ed..96f158e5d14c 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
> @@ -1,4 +1,4 @@
> -From 67a755f74716068cfd44a8897c31151fe9ee4328 Mon Sep 17 00:00:00 2001
> +From 217488e00e99fdaa59fd74936c39a58bc5bab6a4 Mon Sep 17 00:00:00 2001
>  From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>  Date: Thu, 18 Nov 2021 16:42:59 +0000
>  Subject: [PATCH 13/27] corstone1000: Make sure shared buffer contents are not
> @@ -48,5 +48,5 @@ index 9cb8cfb9c779..b6be2b54a030 100644
>   
>   	ffa_ret = ffa_notify_mm_sp();
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
> index fa201eb9c804..36ba6e421b2b 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch
> @@ -1,4 +1,4 @@
> -From e2463e3ef52260b38131085c0901de8708d52693 Mon Sep 17 00:00:00 2001
> +From 7a8e1d3ab51b0e7f255fbb547b7ade5dce9ac058 Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Fri, 4 Mar 2022 15:56:09 +0000
>  Subject: [PATCH 14/27] arm: corstone1000: fix unrecognized filesystem type
> @@ -12,10 +12,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   1 file changed, 3 insertions(+)
>  
>  diff --git a/common/usb_storage.c b/common/usb_storage.c
> -index c9e2d7343ce2..ae72338323ba 100644
> +index eaa31374ef73..79cf4297d4f4 100644
>  --- a/common/usb_storage.c
>  +++ b/common/usb_storage.c
> -@@ -769,6 +769,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *srb, struct us_data *us)
> +@@ -784,6 +784,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *srb, struct us_data *us)
>   st:
>   	retry = 0;
>   again:
> @@ -26,5 +26,5 @@ index c9e2d7343ce2..ae72338323ba 100644
>   	result = usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
>   				&actlen, USB_CNTL_TIMEOUT*5);
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
> index 0d1912c880ff..cf50598a927d 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
> @@ -1,4 +1,4 @@
> -From 81bf9ed7e8e858cef13cfc3d1435c44445e523df Mon Sep 17 00:00:00 2001
> +From c816f0dda42b1e1e0612803da23add7a5da94e66 Mon Sep 17 00:00:00 2001
>  From: Vishnu Banavath <vishnu.banavath@arm.com>
>  Date: Fri, 10 Dec 2021 20:03:35 +0000
>  Subject: [PATCH 15/27] efi_capsule: corstone1000: pass interface id and buffer
> @@ -39,10 +39,10 @@ index db0f91335cef..a7445e61348b 100644
>   #define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
>   
>  diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
> -index c100c1b95298..17d769803b2a 100644
> +index a0689ba912fc..e08e97cf3fb7 100644
>  --- a/lib/efi_loader/efi_capsule.c
>  +++ b/lib/efi_loader/efi_capsule.c
> -@@ -27,6 +27,8 @@
> +@@ -28,6 +28,8 @@
>   #ifdef CONFIG_TARGET_CORSTONE1000
>   #include <arm_ffa_helper.h>
>   #include <cpu_func.h>
> @@ -51,7 +51,7 @@ index c100c1b95298..17d769803b2a 100644
>   
>   void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared buffer virtual address */
>   efi_guid_t corstone1000_capsule_guid = EFI_CORSTONE1000_CAPSULE_ID_GUID;
> -@@ -587,11 +589,12 @@ static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_s
> +@@ -590,11 +592,12 @@ static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_s
>   	func_data.data0 = &part_id;
>   
>   	/*
> @@ -69,5 +69,5 @@ index c100c1b95298..17d769803b2a 100644
>   	func_data.data1_size = sizeof(msg);
>   	func_data.data1 = &msg;
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
> index f460fad8ec76..0a5cd1db1cb2 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
> @@ -1,4 +1,4 @@
> -From 10d0ffc26ddcecd83921c2b3b37cb4eff54a154f Mon Sep 17 00:00:00 2001
> +From 6060b3e0bd69db16ffe17001d5907fb1c851b122 Mon Sep 17 00:00:00 2001
>  From: Vishnu Banavath <vishnu.banavath@arm.com>
>  Date: Fri, 10 Dec 2021 20:10:41 +0000
>  Subject: [PATCH 16/27] efi_boottime: corstone1000: pass interface id and
> @@ -21,7 +21,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   1 file changed, 10 insertions(+), 3 deletions(-)
>  
>  diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
> -index 5c77a40c3ebe..b58a8c98fd05 100644
> +index f2b5c7834c01..140d0f4f71da 100644
>  --- a/lib/efi_loader/efi_boottime.c
>  +++ b/lib/efi_loader/efi_boottime.c
>  @@ -27,6 +27,11 @@
> @@ -36,7 +36,7 @@ index 5c77a40c3ebe..b58a8c98fd05 100644
>   DECLARE_GLOBAL_DATA_PTR;
>   
>   /* Task priority level */
> -@@ -2121,10 +2126,12 @@ static int efi_corstone1000_kernel_started_event(void)
> +@@ -2120,10 +2125,12 @@ static int efi_corstone1000_kernel_started_event(void)
>   	func_data.data0 = &part_id;
>   
>   	/*
> @@ -53,5 +53,5 @@ index 5c77a40c3ebe..b58a8c98fd05 100644
>   	func_data.data1_size = sizeof(msg);
>   	func_data.data1 = &msg;
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
> index fa6ab326ad0d..3b70bdf039e3 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch
> @@ -1,4 +1,4 @@
> -From c463798489e41725f8ba33debeedc7c4011cda38 Mon Sep 17 00:00:00 2001
> +From b22d39962f71f648756caaf16dca8a3a83611f85 Mon Sep 17 00:00:00 2001
>  From: Vishnu Banavath <vishnu.banavath@arm.com>
>  Date: Sat, 11 Dec 2021 13:23:55 +0000
>  Subject: [PATCH 17/27] efi_loader: corstone1000: remove guid check from
> @@ -14,10 +14,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   1 file changed, 1 insertion(+), 15 deletions(-)
>  
>  diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
> -index 17d769803b2a..939040d2755e 100644
> +index e08e97cf3fb7..891143c33909 100644
>  --- a/lib/efi_loader/efi_capsule.c
>  +++ b/lib/efi_loader/efi_capsule.c
> -@@ -654,12 +654,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
> +@@ -657,12 +657,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
>   			  i, &capsule->capsule_guid);
>   
>   #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
> @@ -30,7 +30,7 @@ index 17d769803b2a..939040d2755e 100644
>   		if (efi_size_in_pages(capsule->capsule_image_size) >
>   		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
>   			log_err("Corstone1000: Capsule data size exceeds the shared buffer size\n");
> -@@ -685,15 +679,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
> +@@ -688,15 +682,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
>   		goto out;
>   #endif
>   
> @@ -48,5 +48,5 @@ index 17d769803b2a..939040d2755e 100644
>   			goto out;
>   	}
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
> index 4ee10a0be1b8..b587ac3da0d1 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
> @@ -1,4 +1,4 @@
> -From 1cfca60850727448bdbfe720d98d9e0d4523f6aa Mon Sep 17 00:00:00 2001
> +From 0dbd3b956c6a18dc5a0254173e8ac8561e769274 Mon Sep 17 00:00:00 2001
>  From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>  Date: Sat, 11 Dec 2021 21:05:10 +0000
>  Subject: [PATCH 18/27] arm_ffa: removing the cast when using binary OR on
> @@ -36,5 +36,5 @@ index 38ea4ba83efc..d0db3ef508a1 100644
>   /* The FF-A SMC function prototype definition */
>   
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
> index 21a89a4001af..622c34d7441a 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
> @@ -1,4 +1,4 @@
> -From 7db27eeaba0fd5ddb1e49977bb7e342a1980aa3d Mon Sep 17 00:00:00 2001
> +From c72259ff6d63db2305d2d578835c937e96aec1b6 Mon Sep 17 00:00:00 2001
>  From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>  Date: Sun, 12 Dec 2021 17:51:17 +0000
>  Subject: [PATCH 19/27] Return proper error code when rx buffer is larger
> @@ -27,5 +27,5 @@ index b6be2b54a030..38655a9dbb7c 100644
>   
>   		efi_memcpy_runtime(comm_buf, virt_shared_buf, rx_data_size);
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch
> index 54328a73d83f..a0bef2f93a53 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch
> @@ -1,4 +1,4 @@
> -From 9ad9ead58e8e9e4f9e7a283c916421b443b424ce Mon Sep 17 00:00:00 2001
> +From 5c0082a094fe9b0f6778bb95d888ca0c46e244a6 Mon Sep 17 00:00:00 2001
>  From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>  Date: Mon, 13 Dec 2021 15:25:23 +0000
>  Subject: [PATCH 20/27] Use correct buffer size
> @@ -36,5 +36,5 @@ index e65fbde60d0a..bb9919095649 100644
>   	efi_uintn_t data_size;
>   	efi_uintn_t name_size;
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
> index c7ac38f77c66..2a140b2729e3 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
> @@ -1,4 +1,4 @@
> -From b81214dea7056c3877aa9eb775557dc4702660ec Mon Sep 17 00:00:00 2001
> +From 55691f06dafade226eb6934f378ab2c23c567e4c Mon Sep 17 00:00:00 2001
>  From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>  Date: Sun, 12 Dec 2021 17:58:08 +0000
>  Subject: [PATCH 21/27] Update comm_buf when EFI_BUFFER_TOO_SMALL
> @@ -26,5 +26,5 @@ index 38655a9dbb7c..67743d1f8fce 100644
>   			return EFI_BUFFER_TOO_SMALL;
>   		}
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
> index aaea20e63229..41fe7bd016c1 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
> @@ -1,4 +1,4 @@
> -From 5fec641015f8f1ca80f55f05b5e1f67653321303 Mon Sep 17 00:00:00 2001
> +From f98d5d84ca82088b90d5215323681e7be7ab5439 Mon Sep 17 00:00:00 2001
>  From: Vishnu Banavath <vishnu.banavath@arm.com>
>  Date: Fri, 17 Dec 2021 19:49:02 +0000
>  Subject: [PATCH 22/27] efi_loader: populate ESRT table if EFI_ESRT config
> @@ -14,10 +14,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   1 file changed, 7 insertions(+)
>  
>  diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
> -index 939040d2755e..790d2ba8fe19 100644
> +index 891143c33909..7db78f1f7648 100644
>  --- a/lib/efi_loader/efi_capsule.c
>  +++ b/lib/efi_loader/efi_capsule.c
> -@@ -676,6 +676,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
> +@@ -679,6 +679,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
>   			ret = EFI_SUCCESS;
>   		}
>   
> @@ -32,5 +32,5 @@ index 939040d2755e..790d2ba8fe19 100644
>   #endif
>   
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
> index c86b65815897..a72c66a56f0d 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
> @@ -1,4 +1,4 @@
> -From 34fadec4f659248a6020676f5894895977ccf79d Mon Sep 17 00:00:00 2001
> +From 97a0c2aa811fe94f9d5fc494b2edddb722dc7e86 Mon Sep 17 00:00:00 2001
>  From: Vishnu Banavath <vishnu.banavath@arm.com>
>  Date: Fri, 17 Dec 2021 19:50:25 +0000
>  Subject: [PATCH 23/27] efi_firmware: add get_image_info for corstone1000
> @@ -12,26 +12,25 @@ Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
>  
>  Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>  ---
> - lib/efi_loader/efi_firmware.c | 64 ++++++++++++++++++++++++++++++++++-
> - 1 file changed, 63 insertions(+), 1 deletion(-)
> + lib/efi_loader/efi_firmware.c | 71 ++++++++++++++++++++++++++++++++++-
> + 1 file changed, 70 insertions(+), 1 deletion(-)
>  
>  diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
> -index a5ff32f121f4..9eb89849b28d 100644
> +index 30cafd15caac..af43d4502f92 100644
>  --- a/lib/efi_loader/efi_firmware.c
>  +++ b/lib/efi_loader/efi_firmware.c
> -@@ -241,6 +241,7 @@ const efi_guid_t efi_firmware_image_type_uboot_fit =
> -  *
> -  * Return		status code
> -  */
> -+
> - static
> - efi_status_t EFIAPI efi_firmware_fit_get_image_info(
> - 	struct efi_firmware_management_protocol *this,
> -@@ -332,6 +333,56 @@ const struct efi_firmware_management_protocol efi_fmp_fit = {
> - const efi_guid_t efi_firmware_image_type_uboot_raw =
> - 	EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID;
> +@@ -17,11 +17,69 @@
> + 
> + #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
>   
>  +#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
> ++#define EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID \
> ++	EFI_GUID(0xe2bb9c06, 0x70e9, 0x4b14, 0x97, 0xa3, \
> ++		 0x5a, 0x79, 0x13, 0x17, 0x6e, 0x3f)
> ++
> ++ const efi_guid_t efi_firmware_image_type_uboot_raw =
> ++				EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID;
> ++
>  +static efi_status_t efi_corstone1000_img_info_get (
>  +	efi_uintn_t *image_info_size,
>  +	struct efi_firmware_image_descriptor *image_info,
> @@ -81,34 +80,38 @@ index a5ff32f121f4..9eb89849b28d 100644
>  +	return EFI_SUCCESS;
>  +}
>  +#endif
> ++
>   /**
> -  * efi_firmware_raw_get_image_info - return information about the current
> - 				     firmware image
> -@@ -376,12 +427,20 @@ efi_status_t EFIAPI efi_firmware_raw_get_image_info(
> +  * struct fmp_payload_header - EDK2 header for the FMP payload
> +  *
> +  * This structure describes the header which is preprended to the
> +- * FMP payload by the edk2 capsule generation scripts.
> ++ * FMP payload by the edk1 capsule generation scripts.
> +  *
> +  * @signature:			Header signature used to identify the header
> +  * @header_size:		Size of the structure
> +@@ -285,10 +343,18 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
>   	     !descriptor_size || !package_version || !package_version_name))
>   		return EFI_EXIT(EFI_INVALID_PARAMETER);
>   
> --	ret = efi_get_dfu_info(image_info_size, image_info,
>  +#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
>  +	ret = efi_corstone1000_img_info_get(image_info_size, image_info,
> - 			       descriptor_version, descriptor_count,
> - 			       descriptor_size,
> - 			       package_version, package_version_name,
> - 			       &efi_firmware_image_type_uboot_raw);
> -+#else
> - 
> -+	ret = efi_get_dfu_info(image_info_size, image_info,
>  +			       descriptor_version, descriptor_count,
>  +			       descriptor_size,
>  +			       package_version, package_version_name,
>  +			       &efi_firmware_image_type_uboot_raw);
> ++#else
> + 	ret = efi_fill_image_desc_array(image_info_size, image_info,
> + 					descriptor_version, descriptor_count,
> + 					descriptor_size, package_version,
> + 					package_version_name);
>  +#endif
> + 
>   	return EFI_EXIT(ret);
>   }
> - 
> -@@ -462,6 +521,9 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
> - 
> - 	}
> +@@ -401,6 +467,9 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
> + 	if (status != EFI_SUCCESS)
> + 		return EFI_EXIT(status);
>   
>  +#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
>  +	return EFI_EXIT(EFI_SUCCESS);
> @@ -117,5 +120,5 @@ index a5ff32f121f4..9eb89849b28d 100644
>   			     NULL, NULL))
>   		return EFI_EXIT(EFI_DEVICE_ERROR);
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
> index c6a1aed2e628..15bbde7e0232 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
> @@ -1,4 +1,4 @@
> -From c0c6e4c1166c4868afc36649b9ed98081a6966e1 Mon Sep 17 00:00:00 2001
> +From ced6a1d91e3bcfcc551f4d8ed42e768e454b794b Mon Sep 17 00:00:00 2001
>  From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>  Date: Fri, 24 Dec 2021 14:22:52 +0000
>  Subject: [PATCH 24/27] Comment mm_communicate failure log
> @@ -30,5 +30,5 @@ index 67743d1f8fce..a34989efac83 100644
>   	}
>   
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch
> index d5a0ec0b1bb5..e725e869a724 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch
> @@ -1,4 +1,4 @@
> -From af2defbfaffa4264052e30f269b91794068e4773 Mon Sep 17 00:00:00 2001
> +From d964eae02120fae1bfde7fd64103f5a0b9411104 Mon Sep 17 00:00:00 2001
>  From: Vishnu Banavath <vishnu.banavath@arm.com>
>  Date: Wed, 5 Jan 2022 17:56:09 +0000
>  Subject: [PATCH 25/27] efi_loader: send bootcomplete message to secure enclave
> @@ -32,10 +32,10 @@ index a7445e61348b..06b605e43bdf 100644
>   #define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
>   #define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (x)))
>  diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
> -index b58a8c98fd05..d0703060491b 100644
> +index 140d0f4f71da..6b9f5cf272b8 100644
>  --- a/lib/efi_loader/efi_boottime.c
>  +++ b/lib/efi_loader/efi_boottime.c
> -@@ -2101,46 +2101,6 @@ static void efi_exit_caches(void)
> +@@ -2100,46 +2100,6 @@ static void efi_exit_caches(void)
>   #endif
>   }
>   
> @@ -82,7 +82,7 @@ index b58a8c98fd05..d0703060491b 100644
>   /**
>    * efi_exit_boot_services() - stop all boot services
>    * @image_handle: handle of the loaded image
> -@@ -2254,15 +2214,6 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
> +@@ -2253,15 +2213,6 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
>   	/* Recalculate CRC32 */
>   	efi_update_table_header_crc32(&systab.hdr);
>   
> @@ -99,10 +99,10 @@ index b58a8c98fd05..d0703060491b 100644
>   	efi_set_watchdog(0);
>   	WATCHDOG_RESET();
>  diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
> -index 9eb89849b28d..477ad072070e 100644
> +index af43d4502f92..25f427b93669 100644
>  --- a/lib/efi_loader/efi_firmware.c
>  +++ b/lib/efi_loader/efi_firmware.c
> -@@ -356,7 +356,7 @@ static efi_status_t efi_corstone1000_img_info_get (
> +@@ -47,7 +47,7 @@ static efi_status_t efi_corstone1000_img_info_get (
>   		*package_version_name = NULL; /* not supported */
>   
>   	if(image_info == NULL) {
> @@ -112,7 +112,7 @@ index 9eb89849b28d..477ad072070e 100644
>   	}
>   
>  diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
> -index 989380d4f8cd..515a0bdf74ef 100644
> +index bfd4687e10b5..a20128e9b582 100644
>  --- a/lib/efi_loader/efi_setup.c
>  +++ b/lib/efi_loader/efi_setup.c
>  @@ -17,6 +17,9 @@
> @@ -187,5 +187,5 @@ index 989380d4f8cd..515a0bdf74ef 100644
>   	if (ret != EFI_SUCCESS) {
>   		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n");
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch
> index 532e87267711..9f09ed987382 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch
> @@ -1,4 +1,4 @@
> -From 2da8554ab732c59c7ca624ac4b16412fa9c2e39c Mon Sep 17 00:00:00 2001
> +From 58972d406e9c08c4d330deedd28337b814119222 Mon Sep 17 00:00:00 2001
>  From: Vishnu Banavath <vishnu.banavath@arm.com>
>  Date: Fri, 14 Jan 2022 15:24:18 +0000
>  Subject: [PATCH 26/27] efi_loader: fix null pointer exception with
> @@ -16,10 +16,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>   1 file changed, 11 insertions(+), 8 deletions(-)
>  
>  diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
> -index 477ad072070e..f99c57fde576 100644
> +index 25f427b93669..28d9a19edb90 100644
>  --- a/lib/efi_loader/efi_firmware.c
>  +++ b/lib/efi_loader/efi_firmware.c
> -@@ -347,26 +347,29 @@ static efi_status_t efi_corstone1000_img_info_get (
> +@@ -38,26 +38,29 @@ static efi_status_t efi_corstone1000_img_info_get (
>   	int i = 0;
>   
>   	*image_info_size = sizeof(*image_info);
> @@ -58,5 +58,5 @@ index 477ad072070e..f99c57fde576 100644
>   					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
>   	image_info[i].attributes_setting = IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
>  -- 
> -2.30.2
> +2.37.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch
> index bf95ed7273d8..955b0a833af1 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch
> @@ -1,4 +1,4 @@
> -From cbf16548dc6dcc8eea97aa18c6ae17fb848e5c6c Mon Sep 17 00:00:00 2001
> +From 8bfb6d0ec53ac1133f78323363c9e9bb07f93cf8 Mon Sep 17 00:00:00 2001
>  From: Rui Miguel Silva <rui.silva@linaro.org>
>  Date: Tue, 5 Apr 2022 10:24:38 +0100
>  Subject: [PATCH 27/27] arm:corstone1000: add mmc for fvp
> @@ -52,7 +52,7 @@ index 1fcc137a493c..26b0f1b3cea6 100644
>  +	};
>   };
>  diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
> -index eff1739f0b02..936a6c9f8b89 100644
> +index 2fa485ff3799..3d537d7a9052 100644
>  --- a/board/armltd/corstone1000/corstone1000.c
>  +++ b/board/armltd/corstone1000/corstone1000.c
>  @@ -46,22 +46,38 @@ static struct mm_region corstone1000_mem_map[] = {
> @@ -144,5 +144,5 @@ index 06b605e43bdf..d9855bf91ebf 100644
>   #include <config_distro_bootcmd.h>
>   
>  -- 
> -2.30.2
> +2.37.1
>  
> -- 
> 2.37.1
> 
> 

