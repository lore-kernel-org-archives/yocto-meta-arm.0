Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.17855.1604954343971293091
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 12:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=AJYCNHS7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id 13so4766466qvr.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Nov 2020 12:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=swhiKLNxje/FpJMU9yWZARoQh5u+/qfqgS7lu8O7b4E=;
        b=AJYCNHS7BshnWGlaMvLNcn12Aa7AOpq5E920g2A7iVtGy5JssIeehg/WhXUkYkwpHK
         VNAYDeJCJduJ3uaSdjEJSxjwWNkhNdWFH+wYln8Al01kHwmrtxqiIlHmJUs1b7v0724c
         a/nW+yW5xmDz3UjmvVg9oDx8j2zhbw1yo+SLHkGfSZoMqLYn9DjVkcpOnL7uk+NVs/ZD
         3tftURuAXPF8vjHp+ytvar7l+G57au0jG/+OdAUJGX6/qTPiVQCaKKelWspZBVSG3AAv
         0JZ70KCluXLCt+aza509sra3Lf1DQ/Y5H86lKfuv2287ET6NGduZR9Qz5ooJhMs6fEfh
         6lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=swhiKLNxje/FpJMU9yWZARoQh5u+/qfqgS7lu8O7b4E=;
        b=oaJNvM4yrdNz//ipHlstkxyV5icXWccKq4ngB/w/AXqwoiwdDZAgLxtvPrjO2CAfD3
         n3cDc0UR9e98/N0FfTkAfDCzr0G02RjcD5f7Zlz//updh0Tt48K+BVAtjsPyn4mTtHyT
         YLAB5O/DHxS9z8r/psEaJKUGTSuXLYY1nQVMu/+jKINXT5khQAJh/wWJEjOVZ5uNY0U1
         w+teZanOlvfx5AMAjWIOfrhmS6fbFbnDJ9NTaykeH0mDDHZFlfvtM9C+wGIbeDt5sczQ
         lOqnnIsn6vzGNIbjAHuX9MAFKCYJmqbqggDI4eYays1EhWJCmHGHU7momqyCX0CAR/rc
         BawA==
X-Gm-Message-State: AOAM5337OB/cbY5OHpeUzDeWvlHqEa5ZzCh1YL+pljH+qf6yy69y/hWd
	bOrfc+/tJlHq3f57ZOtfBqT9Zw==
X-Google-Smtp-Source: ABdhPJwRlRAh3m6DuJymsx71infyoBiNWpokFUgSrQxqpbbFeN3dBwv3y2kMPMcyRzs1aNPgNfN10w==
X-Received: by 2002:ad4:4512:: with SMTP id k18mr16312144qvu.5.1604954343044;
        Mon, 09 Nov 2020 12:39:03 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e05c:37c6:4b68:d472])
        by smtp.gmail.com with ESMTPSA id g9sm6456843qti.86.2020.11.09.12.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:39:02 -0800 (PST)
Date: Mon, 9 Nov 2020 15:39:00 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/u-boot: fix autoboot issue on juno platform
Message-ID: <20201109203900.GB17359@kudzu.us>
References: <80b1626dd2d1f10caf155a533b858c0ef5a663ba.1604672207.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <80b1626dd2d1f10caf155a533b858c0ef5a663ba.1604672207.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 02:18:58PM +0000, Diego Sueiro wrote:
> From: Damodar Santhapuri <damodar.santhapuri@arm.com>
> 
> this commit fixes memory corruption of uEnv.txt's DRAM memory at
> ${loadaddr} , by giving enough memory to kernel Image.
> 
> Change-Id: I0243b121f1e56b06b8d2f2a21420c594598fad31
> Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>

Patches pushed to master.

Thanks,
Jon

> ---
>  .../u-boot-2020.07/juno/u-boot_vexpress_uenv.patch | 63 ++++++++++++++++++----
>  1 file changed, 53 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
> index c68c173..68433ed 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
> @@ -1,16 +1,39 @@
> +From 5372743bab931e0f31e37c3767077abd504eca2b Mon Sep 17 00:00:00 2001
> +From: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +Date: Thu, 5 Nov 2020 22:40:48 +0530
> +Subject: [PATCH] arm: juno: add custom bootcmd to autoboot from uEnv.txt file
> +
> +enable autoboot support with custom bootcmd loads uEnv.txt
> +from NOR to DRAM and import.
> +
> +Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> +Upstream-Status: Pending
> +---
> + include/configs/vexpress_aemv8a.h | 40 ++++++++++++++++++++++++++-----
> + 1 file changed, 34 insertions(+), 6 deletions(-)
> +
>  diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> -index 09cdd3dab5..7d6d231bd9 100644
> +index 09cdd3dab5..9c9f8dfd16 100644
>  --- a/include/configs/vexpress_aemv8a.h
>  +++ b/include/configs/vexpress_aemv8a.h
> -@@ -136,6 +136,32 @@
> +@@ -131,11 +131,39 @@
> + 				"kernel_name=norkern\0"	\
> + 				"kernel_alt_name=Image\0"	\
> + 				"kernel_addr_r=0x80080000\0" \
> +-				"ramdisk_name=ramdisk.img\0"	\
> +-				"ramdisk_addr_r=0x88000000\0"	\
> ++				"initrd_name=ramdisk.img\0"	\
> ++				"initrd_addr_r=0x88000000\0"	\
>   				"fdtfile=board.dtb\0" \
>   				"fdt_alt_name=juno\0" \
>   				"fdt_addr_r=0x80000000\0" \
> -+                               "bootenvfile=uEnv.txt\0" \
> -+                               "bootcmd=run envboot\0" \
> -+                               "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
> ++				"fdt_high=0xffffffffffffffff\0" \
> ++				"initrd_high=0xffffffffffffffff\0" \
> ++                                "bootenvfile=uEnv.txt\0" \
> ++                                "bootcmd=run envboot\0" \
> ++                                "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
>  +                                "importbootenv=echo Importing environment from memory, size ${filesize}; env import -t ${loadaddr} ${filesize}\0" \
> -+                                "loadaddr=0x82000000\0" \
> ++                                "loadaddr=0x84000000\0" \
>  +                                "filesize=0x4000\0" \
>  +                                "loadbootenv=mw.l ${loadaddr} 0 0x1000; afs load ${bootenvfile} ${loadaddr}\0" \
>  +                                "default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr_r} ; " \
> @@ -26,12 +49,32 @@ index 09cdd3dab5..7d6d231bd9 100644
>  +		                                "  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
>  +		                                "fi ; "\
>  +                                                "fdt addr ${fdt_addr_r}; fdt resize; " \
> -+		                                "if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
> ++		                                "if afs load  ${initrd_name} ${initrd_addr_r} ; "\
>  +		                                "then "\
> -+		                                "  setenv ramdisk_param ${ramdisk_addr_r}; "\
> -+		                                "  else setenv ramdisk_param -; "\
> ++		                                "  setenv initrd_param ${initrd_addr_r}; "\
> ++		                                "  else setenv initrd_param -; "\
>  +		                                "fi ; " \
> -+		                                "booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}\0"
> ++		                                "booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}\0"
>   
>   /* Copy the kernel and FDT to DRAM memory and boot */
>   #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr_r} ;"\
> +@@ -151,12 +179,12 @@
> + 				"  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
> + 				"fi ; "\
> + 				"fdt addr ${fdt_addr_r}; fdt resize; " \
> +-				"if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
> ++				"if afs load  ${initrd_name} ${initrd_addr_r} ; "\
> + 				"then "\
> +-				"  setenv ramdisk_param ${ramdisk_addr_r}; "\
> +-				"  else setenv ramdisk_param -; "\
> ++				"  setenv initrd_param ${initrd_addr_r}; "\
> ++				"  else setenv initrd_param -; "\
> + 				"fi ; " \
> +-				"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}"
> ++				"booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}"
> + 
> + 
> + #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
> +-- 
> +2.17.1
> +
> -- 
> 2.7.4
> 

> 
> 
> 

