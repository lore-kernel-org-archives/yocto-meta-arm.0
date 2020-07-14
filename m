Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.2187.1594749538529804257
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 10:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=kyEFUtZT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id k18so13501985qtm.10
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 10:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jWbMGByEOmhuVeTLIbQTMnDzh2cNwX6LMszxbr3wmcE=;
        b=kyEFUtZTGO4LBnQqLJJlZD/pJR+lcpyGO7Sb0H6TTdB5M2oZkD0c+Yt8PTAuSsw4Z/
         /bAmYIq/eUoe8kWuvBYNQuss0cyUk8lIADoTGPIB653FAeH7Yvig731mAOv4p2zJIuEo
         3VMX2Xzhy7/2VG+O4jgmnWhNY0je/73/6Ph+x3bq/BA3M2MCTzvoV5zuHWg2+iK7xlfM
         PNycuX7Ej6om9Ix8i+iTUKwyrpQpTZzxxcHCHE+XOx24GEOQEqggxmX3jFvWxtOEBNRU
         7QXdbETD4MEdUcaz3eTW/8I5zyCpobuZfJpTrwKp9epnC33uObwtQTBZyrf6mXc8OY5x
         PJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jWbMGByEOmhuVeTLIbQTMnDzh2cNwX6LMszxbr3wmcE=;
        b=NVIdAi8g5wlYS4r3O0q6EjJ+RHxBNTmjERCdCggM4BeCqAa/qAxSdlR7LTdn4HBfF5
         xdLnD99Fm1dH0kE+RVkGCp0JC3cEWSqC/t89PSWrbINdK41hBA6ijNJYznhsyAjCeHgE
         yiItJZsjcJ7vDHyA1ZXmuAHsq3rlqubJ2DPmPG5IOa8nDC6bOnrvtTbyzpD8ftwn14yN
         okjtNyfgYdeuIHOkx6vtqbhV8Mw+xXqxebzKgd27i/peV13HsVwC4MPAEBPFkn56tPXx
         5eubyGMZxsUnG1gpL1uoZDOSCbTMP4vCBUt5h4pcNtJqAh2AF9uUOqbDwxl+afsJBAEi
         vV1g==
X-Gm-Message-State: AOAM531w+PrfFQzn9a7X3f2rKjf0k0y6T9WRP+arfHTkf8qkYJU3VVwl
	Wzip8dIbmcGVcsiYwy8EmdRrnA==
X-Google-Smtp-Source: ABdhPJxZoJc6RKohkWzt0keftvT+o4qynJirQ/JNuHdl72mdtAqbujyg67g/zg1aZMvKdcxqpoD1sQ==
X-Received: by 2002:ac8:6644:: with SMTP id j4mr6127417qtp.295.1594749536507;
        Tue, 14 Jul 2020 10:58:56 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d523:4dcb:5d9f:3d2])
        by smtp.gmail.com with ESMTPSA id a25sm24250832qtk.40.2020.07.14.10.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 10:58:56 -0700 (PDT)
Date: Tue, 14 Jul 2020 13:58:54 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: fix uenv errors while rebasing v2020.07
Message-ID: <20200714175854.GB17632@kudzu.us>
References: <20200714120007.577999-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200714120007.577999-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 01:00:07PM +0100, Ross Burton wrote:
> From: Damodar Santhapuri <damodar.santhapuri@arm.com>
> 
>      This commit fixes the erros while rebasing u-boot src
>      to v2020.07
> 
> Change-Id: Iac926f77f80348b91f20f77fb52794a5a365a0ee
> Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>


This breaks dunfell compatability on the master branch, since it
doesn't apply cleanly to anything older than v2020.07.  I'm thinking
we probably need to keep both versions and clean-up the bbappends to
allow for the application of the correct patch depending on the
situation.

Thanks,
Jon

> ---
>  .../files/juno/u-boot_vexpress_uenv.patch     | 50 +++++++++----------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
> index bb90c17..c68c173 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
> @@ -1,37 +1,37 @@
>  diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> -index 2354f4e958..3e01f477dc 100644
> +index 09cdd3dab5..7d6d231bd9 100644
>  --- a/include/configs/vexpress_aemv8a.h
>  +++ b/include/configs/vexpress_aemv8a.h
> -@@ -151,6 +151,32 @@
> - 				"fdt_addr=0x83000000\0" \
> - 				"fdt_high=0xffffffffffffffff\0" \
> - 				"initrd_high=0xffffffffffffffff\0" \
> -+                                "bootenvfile=uEnv.txt\0" \
> -+                                "bootcmd=run envboot\0" \
> -+                                "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
> +@@ -136,6 +136,32 @@
> + 				"fdtfile=board.dtb\0" \
> + 				"fdt_alt_name=juno\0" \
> + 				"fdt_addr_r=0x80000000\0" \
> ++                               "bootenvfile=uEnv.txt\0" \
> ++                               "bootcmd=run envboot\0" \
> ++                               "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
>  +                                "importbootenv=echo Importing environment from memory, size ${filesize}; env import -t ${loadaddr} ${filesize}\0" \
>  +                                "loadaddr=0x82000000\0" \
>  +                                "filesize=0x4000\0" \
>  +                                "loadbootenv=mw.l ${loadaddr} 0 0x1000; afs load ${bootenvfile} ${loadaddr}\0" \
> -+				"default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr} ; " \
> -+                                		"if test $? -eq 1; then "\
> -+		                                "  echo Loading ${kernel_alt_name} instead of "\
> -+                		                "${kernel_name}; "\
> -+		                                "  afs load ${kernel_alt_name} ${kernel_addr};"\
> -+                                		"fi ; "\
> -+		                                "afs load  ${fdtfile} ${fdt_addr} ; " \
> -+                		                "if test $? -eq 1; then "\
> -+		                                "  echo Loading ${fdt_alt_name} instead of "\
> -+		                                "${fdtfile}; "\
> -+		                                "  afs load ${fdt_alt_name} ${fdt_addr}; "\
> ++                                "default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr_r} ; " \
> ++                                                "if test $? -eq 1; then "\
> ++                                                "  echo Loading ${kernel_alt_name} instead of "\
> ++                                                "${kernel_name}; "\
> ++                                                "  afs load ${kernel_alt_name} ${kernel_addr_r};"\
> ++                                                "fi ; "\
> ++		                                "afs load  ${fdtfile} ${fdt_addr_r} ; " \
> ++                                                "if test $? -eq 1; then "\
> ++                                                "  echo Loading ${fdt_alt_name} instead of "\
> ++                                                "${fdtfile}; "\
> ++		                                "  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
>  +		                                "fi ; "\
> -+                		                "fdt addr ${fdt_addr}; fdt resize; " \
> -+		                                "if afs load  ${initrd_name} ${initrd_addr} ; "\
> ++                                                "fdt addr ${fdt_addr_r}; fdt resize; " \
> ++		                                "if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
>  +		                                "then "\
> -+		                                "  setenv initrd_param ${initrd_addr}; "\
> -+		                                "  else setenv initrd_param -; "\
> ++		                                "  setenv ramdisk_param ${ramdisk_addr_r}; "\
> ++		                                "  else setenv ramdisk_param -; "\
>  +		                                "fi ; " \
> -+		                                "booti ${kernel_addr} ${initrd_param} ${fdt_addr}\0"
> ++		                                "booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}\0"
>   
>   /* Copy the kernel and FDT to DRAM memory and boot */
> - #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr} ; " \
> + #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr_r} ;"\
> -- 
> 2.26.2
> 

> 

