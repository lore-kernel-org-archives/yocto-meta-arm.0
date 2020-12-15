Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.12262.1608042155238887728
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 06:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZDPNZej0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id d14so18477986qkc.13
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 06:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=46SyTafP6hR4LP8X8i747GLeX3ZSNIHSPfWl9CjSEpg=;
        b=ZDPNZej059ztTH4iaYVm2Cg/IvIOTuMZa7arFYialFcGquz8MuNWb3GqNRWwlMN9tC
         dcbW89n0/T7gyB4vDPMe+FKdni+mW2DCCrWWwCRbVzUp68RxwjGxpsWgPzt+YCXfC3KJ
         Zp7+uSg67itPv3B/0Lavid/dG9AoRuWqGx8F38yo1+11hvsWyanV3rOqXyLQ9YDY8Cwz
         v8YvYuoOiQE9OyA4dYC7iJr33jHlRHoZalVM6nnSG56f7itpmoRhmpNuQmAq3qRpuw3S
         wslQSHE3D235Ute1EhSwk6gZodwB7j9oM4YM3IVRQIbs+pebCL5BhwUshBP+7iTQnihB
         +XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=46SyTafP6hR4LP8X8i747GLeX3ZSNIHSPfWl9CjSEpg=;
        b=RTbkLAxFOovisGE4c80hschjdZW6CZuRyWb7D9PGrv+uvRQ0TCSAT64WdLSNRR6vCR
         VPwalRvcsP/LHuo1N4jWBVC8cB1mSb9HpshFiaUNVFQ2XMpuf4BdjhDQylYIXM5eFart
         9Vh2zJiNOwDWCjtbC8gBMo0Xq7NPzvp88c2cTY7Ej0Pj7bLFwrSG7YysLcsl6TWyC00P
         42RAXau9dAplVWeXLxQSkT8efNfyVa6HSYF9UcXrnAHp02jS0Lf+UfjDP5crREN+7pgu
         7LfqBspKRYAnPO1uVo10O0Wr0cYs2pScVnaeP+gB7nVIcVmWwiAUyrQzN1WUiSusJJkk
         rIbA==
X-Gm-Message-State: AOAM5323VtpkTKNXvLSacch74C3UsTYBR/hbLQsFLQqVpOeeJEqhXVH4
	i1en4+RWG0awHPgmda7QMLb81w==
X-Google-Smtp-Source: ABdhPJyB8+ZYKYj8mrlPK/nBWSaeyRTr/URUqsl1oO97+I8PAcD7A/3j6ug1aHBAk88mzJapaUfPiw==
X-Received: by 2002:a37:8ec6:: with SMTP id q189mr39595582qkd.123.1608042154358;
        Tue, 15 Dec 2020 06:22:34 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id z133sm17683430qka.20.2020.12.15.06.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:22:34 -0800 (PST)
Date: Tue, 15 Dec 2020 09:22:32 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/scp-firmware: update a patch that is now upstream
Message-ID: <20201215142232.GE20024@kudzu.us>
References: <20201215092231.2761388-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201215092231.2761388-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 09:22:31AM +0000, Ross Burton wrote:
> Change-Id: Ibfa8f7d3c0f38fcde514170211264ec02efff953
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  ...t-CCIX-speed-to-GEN3-to-work-with-in.patch | 35 ++++++++-----------
>  1 file changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
> index fbc04f4..1f6f696 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
> @@ -1,13 +1,9 @@
> -Upstream-Status: Inappropriate [will not be submitted as its only required till hardware gets fixed]
> -
> -The patch is picked from git repo:
> -https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree/scp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
> -
> +Upstream-Status: Backport
>  Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
>  
> -From a6d545cf9b6c46f2ea415d64fa81eb4771cfb51c Mon Sep 17 00:00:00 2001
> +From 3deb59c5f4c64aa092bb3a4ebc018acf3f746f47 Mon Sep 17 00:00:00 2001
>  From: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
> -Date: Thu, 28 May 2020 16:19:12 +0530
> +Date: Tue, 10 Nov 2020 12:31:04 +0530
>  Subject: [PATCH] product/n1sdp: set CCIX speed to GEN3 to work with interposer
>   C2C setup
>  
> @@ -15,23 +11,22 @@ Set CCIX speed to GEN3 to work with interposer C2C setup
>  In this use case set downstream/upstream port transmitter
>  preset value to 4.
>  
> -Change-Id: I16e72a5eaa105386a64ab4ffe56f67134c670313
>  Signed-off-by: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
> +Change-Id: I635566574babbb7591b5bba97105f76f1f8e550a
>  ---
> - .../module/n1sdp_pcie/src/mod_n1sdp_pcie.c    | 33 +++++++++++++++----
> - 1 file changed, 26 insertions(+), 7 deletions(-)
> + .../module/n1sdp_pcie/src/mod_n1sdp_pcie.c    | 30 ++++++++++++++-----
> + 1 file changed, 23 insertions(+), 7 deletions(-)
>  
>  diff --git a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
> -index 19fa5a5..a93e6cc 100644
> +index 901e0464..ba02144f 100644
>  --- a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
>  +++ b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
> -@@ -206,7 +206,13 @@ static int n1sdp_pcie_phy_init(fwk_id_t id)
> +@@ -206,7 +206,12 @@ static int n1sdp_pcie_phy_init(fwk_id_t id)
>       if (dev_ctx == NULL)
>           return FWK_E_PARAM;
>   
>  -    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
> -+    if ((n1sdp_get_chipid() != 0x0) ||
> -+        !dev_ctx->config->ccix_capable ||
> ++    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
>  +        pcie_ctx.c2c_api->is_slave_alive())
>  +        gen_speed = PCIE_GEN_3;
>  +    else
> @@ -40,13 +35,12 @@ index 19fa5a5..a93e6cc 100644
>       lane_count = LAN_COUNT_IN_X_16;
>   
>       FWK_LOG_INFO("[%s] Initializing PHY...", pcie_type[did]);
> -@@ -239,7 +245,13 @@ static int n1sdp_pcie_controller_init(fwk_id_t id, bool ep_mode)
> +@@ -239,7 +244,12 @@ static int n1sdp_pcie_controller_init(fwk_id_t id, bool ep_mode)
>       if (dev_ctx == NULL)
>           return FWK_E_PARAM;
>   
>  -    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
> -+    if ((n1sdp_get_chipid() != 0x0) ||
> -+        !dev_ctx->config->ccix_capable ||
> ++    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
>  +        pcie_ctx.c2c_api->is_slave_alive())
>  +        gen_speed = PCIE_GEN_3;
>  +    else
> @@ -55,13 +49,12 @@ index 19fa5a5..a93e6cc 100644
>       lane_count = LAN_COUNT_IN_X_16;
>   
>       if (ep_mode) {
> -@@ -282,12 +294,19 @@ static int n1sdp_pcie_link_training(fwk_id_t id, bool ep_mode)
> +@@ -282,12 +292,18 @@ static int n1sdp_pcie_link_training(fwk_id_t id, bool ep_mode)
>       if (dev_ctx == NULL)
>           return FWK_E_PARAM;
>   
>  -    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
> -+    if ((n1sdp_get_chipid() != 0x0) ||
> -+        !dev_ctx->config->ccix_capable ||
> ++    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
>  +        pcie_ctx.c2c_api->is_slave_alive()) {
>  +        gen_speed = PCIE_GEN_3;
>  +        down_stream_tx_preset = PCIE_RC_TX_PRESET_VALUE;
> @@ -81,5 +74,5 @@ index 19fa5a5..a93e6cc 100644
>       if (gen_speed >= PCIE_GEN_3 && !ep_mode) {
>           FWK_LOG_INFO(
>  -- 
> -2.25.0
> +2.25.1
>  
> -- 
> 2.25.1
> 

> 
> 
> 

