Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.2519.1621898399795253046
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 May 2021 16:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MnfSH3nV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id 1so21927156qtb.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 May 2021 16:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dGPq7GypBqCOOwS+9/WgN11NS/aB74M6uClJws0QfLI=;
        b=MnfSH3nVjixYybkDbQ+lNB45sg4KDn3l6m57vPkl3GfeiN3v+FjBm9ReRwQoMJ/YOZ
         lJfAo16m5sVYJz4XLAZ3ed5V78F6AWKaDffCE4US+AUOA00oLCX4mmkEo84ta0l2qLPO
         3kHT0GeJ90jWDbMzoRJdOiUjylWtNlTpu0HS+6m4F0+oU6KPV/VxeJA8JRNLsnAKYrYp
         xrHiohcXAO+HcKPkpKOeIllP6NgQsY/eKuPaRoqxOtzUHs0z9RSHrEFJy0H5R4jM4f8x
         bJ/R8qFE3kA/DsBURMTCKzH8+UqpCTrM53hKcmwZLB2L5ihzMSScMFkQaLp7B+O6yg6K
         zpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dGPq7GypBqCOOwS+9/WgN11NS/aB74M6uClJws0QfLI=;
        b=laLAzaJjURhuBy4QrA2xv1P52qytPwrSsOpAcVFZbifvRKpocjFKcUQnDntB3WNQbs
         WizkFSlLuDph3W3PZfPePa20XFyVCTqmmuaLZwPN9r+HevSKwBAGFDZ7SFONE/l6Ow+l
         Ezs+XnBJXpsCFUvfwcjS5bI6dPVRhj86y/p25Skcr4bcDc2H3RgNCi3MrTGB5+aQmdJq
         tkoPslaocmZK6FMqW5sY7H9sv4KS2yFClW1nCH7qSolMEaQkgQOCxWMa8Zlrv7v4EOkg
         PsCFZqCDvOq5BT1uab2Cog7TJOEnqWYdJSKLBuKniA9f2bHQhp8h+6udvx08HkRjUBOz
         NQ3w==
X-Gm-Message-State: AOAM532KJaiyMoWQ01G0V3fG1kyiocjWbelZhscor3f09zkeVn36RyE3
	6jaso8dXGA0PFonpi8gYip47Ig==
X-Google-Smtp-Source: ABdhPJw+DU3RgL6irMYFW43ucriwDwx6cPukAyRJO14IT0N5JmwOeSaMM6GWrOC9zYd2Np43dVAIAQ==
X-Received: by 2002:ac8:5784:: with SMTP id v4mr25188157qta.264.1621898398765;
        Mon, 24 May 2021 16:19:58 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:e800:1cd0:dce4:7cd5:acc])
        by smtp.gmail.com with ESMTPSA id f13sm11160898qkk.107.2021.05.24.16.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 16:19:58 -0700 (PDT)
Date: Mon, 24 May 2021 19:19:57 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/fvp-base*: move to u-boot 2021.04
Message-ID: <20210524231956.GA5325@kudzu.us>
References: <20210524201651.19095-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210524201651.19095-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 24, 2021 at 09:16:51PM +0100, Anders Dellien wrote:
> Remove fvp-base patch that has been merged upstream and rebase
> fvp-base-arm32 patch
> 
> Change-Id: Iac16598933b94c1db13d3e40f1d5b3a137c8bd4c
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/fvp-common.inc      |  2 +-
>  ...-Add-vexpress_aemv8a_aarch32-variant.patch | 29 +++++------
>  ...et-DRAM-to-4G-to-match-with-kernel-d.patch | 48 -------------------
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |  4 +-
>  4 files changed, 15 insertions(+), 68 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
> 
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index 169c0a3..96f81c3 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.10%"
>  
> -PREFERRED_VERSION_u-boot ?= "2021.01"
> +PREFERRED_VERSION_u-boot ?= "2021.04"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> index 0719629..c1feca1 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> @@ -1,4 +1,4 @@
> -From eb241dfffcf641d7f37e853e1795557796671b19 Mon Sep 17 00:00:00 2001
> +From 6ae7b384eef45dd9f70e5e53c32cb14c56733013 Mon Sep 17 00:00:00 2001
>  From: Anders Dellien <anders.dellien@arm.com>
>  Date: Thu, 23 Jul 2020 17:32:55 +0100
>  Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
> @@ -25,15 +25,15 @@ Signed-off-by: Anders Dellien <anders.dellien@arm.com>
>   arch/arm/Kconfig                          |  5 +++
>   board/armltd/vexpress64/Kconfig           |  2 +-
>   configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
> - include/configs/vexpress_aemv8a.h         | 24 +++++++++-----
> - 4 files changed, 62 insertions(+), 9 deletions(-)
> + include/configs/vexpress_aemv8a.h         | 23 +++++++++----
> + 4 files changed, 62 insertions(+), 8 deletions(-)
>   create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
>  
>  diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index fbe90875ae..8468bfb45b 100644
> +index 3307f2b3fc..0389e04cfb 100644
>  --- a/arch/arm/Kconfig
>  +++ b/arch/arm/Kconfig
> -@@ -1187,6 +1187,11 @@ config TARGET_VEXPRESS64_BASE_FVP
> +@@ -1184,6 +1184,11 @@ config TARGET_VEXPRESS64_BASE_FVP
>   	select PL01X_SERIAL
>   	select SEMIHOSTING
>   
> @@ -57,7 +57,7 @@ index 1d13f542e6..dad181c93c 100644
>   	default "vexpress64"
>  diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
>  new file mode 100644
> -index 0000000000..cf1e8d5cae
> +index 0000000000..0726e0d0db
>  --- /dev/null
>  +++ b/configs/vexpress_aemv8a_aarch32_defconfig
>  @@ -0,0 +1,40 @@
> @@ -102,7 +102,7 @@ index 0000000000..cf1e8d5cae
>  +CONFIG_DM_SERIAL=y
>  +CONFIG_PL01X_SERIAL=y
>  diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> -index e63c335f85..edded8c52b 100644
> +index 7318fb6c58..f223811134 100644
>  --- a/include/configs/vexpress_aemv8a.h
>  +++ b/include/configs/vexpress_aemv8a.h
>  @@ -9,8 +9,15 @@
> @@ -132,8 +132,8 @@ index e63c335f85..edded8c52b 100644
>   #define GICD_BASE			(0x2f000000)
>   #define GICC_BASE			(0x2c000000)
>   #elif CONFIG_TARGET_VEXPRESS64_JUNO
> -@@ -159,7 +167,8 @@
> - 				"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}"
> +@@ -164,7 +172,8 @@
> + #endif
>   
>   
>  -#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
> @@ -142,7 +142,7 @@ index e63c335f85..edded8c52b 100644
>   #define CONFIG_EXTRA_ENV_SETTINGS	\
>   				"kernel_name=Image\0"		\
>   				"kernel_addr=0x80080000\0"	\
> -@@ -168,7 +177,9 @@
> +@@ -173,7 +182,9 @@
>   				"fdtfile=devtree.dtb\0"		\
>   				"fdt_addr=0x83000000\0"		\
>   				"boot_name=boot.img\0"		\
> @@ -151,9 +151,9 @@ index e63c335f85..edded8c52b 100644
>  +				"fdt_high=0xffffffffffffffff\0" \
>  +				"initrd_high=0xffffffffffffffff\0"
>   
> + #ifndef CONFIG_BOOTCOMMAND
>   #define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then " \
> - 				"  set bootargs; " \
> -@@ -177,18 +188,15 @@
> +@@ -183,15 +194,13 @@
>   				"  bootm ${boot_addr} ${boot_addr} " \
>   				"  ${fdt_addr}; " \
>   				"else; " \
> @@ -168,11 +168,8 @@ index e63c335f85..edded8c52b 100644
>  -				"  booti $kernel_addr - $fdt_addr; " \
>  +				BOOT_TYPE " $kernel_addr - $fdt_addr; " \
>   				"fi"
> - 
> --
>   #endif
> - 
> - /* Monitor Command Prompt */
> + #endif
>  -- 
>  2.17.1
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
> deleted file mode 100644
> index 541927c..0000000
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 9abe5e68033dab0d521475090ffd0cef9cb2c581 Mon Sep 17 00:00:00 2001
> -Message-Id: <9abe5e68033dab0d521475090ffd0cef9cb2c581.1614260356.git.diego.sueiro@arm.com>
> -From: Diego Sueiro <diego.sueiro@arm.com>
> -Date: Mon, 15 Feb 2021 07:27:57 +0000
> -Subject: [PATCH] vexpress64_fvp: Set DRAM to 4G to match with kernel
> - devicetree
> -
> -Currently, the kernel devicetree is setting the DRAM size to ~4G.
> -
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ----
> - configs/vexpress_aemv8a_semi_defconfig | 2 +-
> - include/configs/vexpress_aemv8a.h      | 3 +++
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
> -index a26137ef5d..2ecb7762ce 100644
> ---- a/configs/vexpress_aemv8a_semi_defconfig
> -+++ b/configs/vexpress_aemv8a_semi_defconfig
> -@@ -2,7 +2,7 @@ CONFIG_ARM=y
> - CONFIG_TARGET_VEXPRESS64_BASE_FVP=y
> - CONFIG_SYS_TEXT_BASE=0x88000000
> - CONFIG_SYS_MALLOC_F_LEN=0x2000
> --CONFIG_NR_DRAM_BANKS=1
> -+CONFIG_NR_DRAM_BANKS=2
> - CONFIG_SYS_MEMTEST_START=0x80000000
> - CONFIG_SYS_MEMTEST_END=0xff000000
> - CONFIG_ENV_SIZE=0x40000
> -diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> -index 566bee5b87..7318fb6c58 100644
> ---- a/include/configs/vexpress_aemv8a.h
> -+++ b/include/configs/vexpress_aemv8a.h
> -@@ -117,6 +117,9 @@
> - #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
> - #define PHYS_SDRAM_2			(0x880000000)
> - #define PHYS_SDRAM_2_SIZE		0x180000000
> -+#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP && CONFIG_NR_DRAM_BANKS == 2
> -+#define PHYS_SDRAM_2			(0x880000000)
> -+#define PHYS_SDRAM_2_SIZE		0x80000000
> - #endif
> - 
> - /* Enable memtest */
> --- 
> -2.17.1
> -
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index df9fdfb..a572347 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -5,9 +5,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  #
>  # FVP BASE
>  #
> -SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch \
> -                            file://0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch \
> -                          "
> +SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
>  
>  #
>  # FVP BASE ARM32
> -- 
> 2.17.1
> 

> 
> 
> 

