Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.244.1605900145302506440
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 11:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=c+EOSPHk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id n132so10017681qke.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 11:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Zx2TzS5kX9183t8vQ4qdkpU0iLIDZZ+mL/zQgCLaHa8=;
        b=c+EOSPHkvaWbD2p+vB0DqCdK9E4LN/+t6NkHPvQi6d2aebr2K9/TB/ywd6EB/PmQ+a
         yFIVq+DGW84awapCsB7Yele/XKoA9hgirPBwaXWnjxFIlqiwPVXBBBt0CzKqlHI41HYu
         pD/RYofR1PwsVO0wJUOv4pwAwxLFZSot8LCmwAttBm0bwZdEkzlpGnU4iOnYYfkZMlf+
         JGV1s4TGMFDK7mBTUEPv1Tz3Q2Y3TX34zaiES0LwQZNgF6GLzzSM1jXO9aMZ+LSGNtHD
         oI67vBHz1ryu50Lt9LuYXX4fKEixEdBtBLMDHyhivpm9xH0s+A0qrbL0qOcJAFhz1/wJ
         aEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zx2TzS5kX9183t8vQ4qdkpU0iLIDZZ+mL/zQgCLaHa8=;
        b=rfGaaiCisYFTy1k9sM+6ThXuyamLX2hwF7INO2uHeYA/mdeHZG+uNoFwtn4hzQD05A
         UcCWDIo76os/0cOO412GX0Spop+7PDUq34q2RtzukNG7dhiXbkI2kIIR/1ikhDGEWiGt
         3kzcd4Wv+eMYo11b/bNh/zBlkx5NsLDplSFBsVgNtFw242yLgQ6nKFJHwpXa/TrjzU4P
         dkFUdbjR0yZxEiuRx1z1YJcvvriQPkfAn0GZ+JrsQl8BW1eFgDd1+6ER/w7E2xeXE557
         UAMbSarLlG9r6FiZZkC0gP7z04gr+o6F/xo/GiN6QH7ogtH6i4d/R8aaETJj0ckMUTmb
         jbzA==
X-Gm-Message-State: AOAM530v2bLJhHmoEjPJW3OkDC2PZf2jVuNh5jvG1E1ABre/SwoV9+Qo
	25IDsI9a9VOI7xRE8+Q1fSkCgg==
X-Google-Smtp-Source: ABdhPJz1gl8ispEvBOG63KMoLxgozAyjYwUPiXg9NFail3yBNNh0cvVPQJFfZpup72xB5PcQkmdtpw==
X-Received: by 2002:a05:620a:22eb:: with SMTP id p11mr19194506qki.224.1605900144444;
        Fri, 20 Nov 2020 11:22:24 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:7d34:5ead:95e4:9b53])
        by smtp.gmail.com with ESMTPSA id 82sm2697770qke.76.2020.11.20.11.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 11:22:24 -0800 (PST)
Date: Fri, 20 Nov 2020 14:22:22 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp-board-firmware: include RAM firmware for secondary device
Message-ID: <20201120192221.GD4483@kudzu.us>
References: <20201119175040.32665-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201119175040.32665-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When applying the patch below and trying to build n1sdp, I see the
following error:

Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing shell function do_deploy
| cp: cannot stat '/home/jdm/yocto/poky/build/tmp/work/n1sdp-poky-linux/sdcard-image-n1sdp/0.1-r0/recipe-sysroot/n1sdp-board-firmware_source/*': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/jdm/yocto/poky/build/tmp/work/n1sdp-poky-linux/sdcard-image-n1sdp/0.1-r0/temp/run.do_deploy.10290' failed with exit code 1:
| cp: cannot stat '/home/jdm/yocto/poky/build/tmp/work/n1sdp-poky-linux/sdcard-image-n1sdp/0.1-r0/recipe-sysroot/n1sdp-board-firmware_source/*': No such file or directory
| WARNING: exit code 1 from a shell command.
|

Thanks,
Jon

On Thu, Nov 19, 2020 at 11:20:40PM +0530, Khasim Mohammed wrote:
> From: Khasim Mohammed <khasim.mohammed@arm.com>
> 
> While testing multi-chip mode it was observed that n1sdp running
> as secondary device needs scp and mcp RAM firmware as well.
> 
> This issue wasn't captured earlier as QSPI flash had RAM firmware installed
> and it doesn't get erased automatically therefore the device was able to
> load it on every reboot.
> 
> Change-Id: Ied9d24429c7025206e35f50c8e5b6f090a590015
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  .../recipes-bsp/images/sdcard-image-n1sdp_0.1.bb   | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> index 13fa560..1ce0fbc 100644
> --- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> +++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> @@ -18,9 +18,7 @@ FIRMWARE_DIR = "n1sdp-board-firmware_source"
>  PRIMARY_DIR = "${WORKDIR}/n1sdp-board-firmware_primary"
>  SECONDARY_DIR = "${WORKDIR}/n1sdp-board-firmware_secondary"
>  
> -SOC_BINARIES_PRIMARY = "mcp_fw.bin scp_fw.bin ${SOC_BINARIES_SECONDARY}"
> -SOC_BINARIES_SECONDARY = "mcp_rom.bin scp_rom.bin"
> -
> +SOC_BINARIES = "mcp_fw.bin scp_fw.bin mcp_rom.bin scp_rom.bin"
>  
>  prepare_package() {
>      cd ${WORKDIR}
> @@ -33,7 +31,7 @@ prepare_package() {
>      cp -v ${RECIPE_SYSROOT}/firmware/uefi.bin ${PRIMARY_DIR}/SOFTWARE/
>  
>      # Copy SOC binaries
> -    for f in ${SOC_BINARIES_PRIMARY}; do
> +    for f in ${SOC_BINARIES}; do
>          cp -v ${RECIPE_SYSROOT}/firmware/${f} ${PRIMARY_DIR}/SOFTWARE/
>      done
>  
> @@ -49,7 +47,7 @@ prepare_package() {
>      mkdir -p ${SECONDARY_DIR}/SOFTWARE/
>  
>      # Copy SOC binaries
> -    for f in ${SOC_BINARIES_SECONDARY}; do
> +    for f in ${SOC_BINARIES}; do
>          cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE/
>      done
>  
> @@ -59,10 +57,8 @@ prepare_package() {
>          ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
>      sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000101   ;SoC SCC PLATFORM_CTRL|' \
>          ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
> -    sed -i -e '/^TOTALIMAGES:/ s|5|2|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> -    sed -i -e 's|^IMAGE[^23]|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> -    sed -i -e 's|^IMAGE2|IMAGE0|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> -    sed -i -e 's|^IMAGE3|IMAGE1|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> +    sed -i -e '/^TOTALIMAGES:/ s|5|4|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> +    sed -i -e 's|^IMAGE4|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
>  }
>  
>  do_deploy() {
> -- 
> 2.17.1
> 

> 
> 
> 

