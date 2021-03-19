Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.7227.1616164361600332795
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 07:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=cziHEo3U;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id x14so3026699qki.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Mar 2021 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LyfK/5sQ6kDtIEpC3OrWZrursELCXMtjwny/scVtImQ=;
        b=cziHEo3UhnU4Vwpfa9ofITNrYWQEKXc8rU7RR9zBMgbZFL8BuuR/WrfkUXdOk9bSTv
         ytV8yjUk4ZUiED/MOcHF5Tr83CdZs9Oxv0F62ac0DkjhA6GXt4BAjOHwxByYnOzfYjhB
         ontRTB397/Se7HfGiouWsMgRYRkPEMqCjTLJCjjzvgM1vaMFcozmKQSswfipQzJ4A8A0
         EzmXUrmJNrwfbhk/wkEJbH9xUfTPfDiXV9UEqJmmFf2r6wBiF/nTmwiySz2ZEqTeOSN6
         bj3+BhBlJcpWKSZDRIb77z1vKPSJXbhzbEqw/2OlSW6P0focY1EtdRGeyDLuqY0LOz1E
         DvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LyfK/5sQ6kDtIEpC3OrWZrursELCXMtjwny/scVtImQ=;
        b=Kq7597ixxaqW259jn/XQp5ep3X2EIWx8r2Xp+GesABRi8KwDfWkdmaZUYyj1H+hBu8
         ueD4YbfkVzua8GHtUCcwukgNpwX3cbn2EoWU6rn/W0SAdHACex2hb8oJUYUHlpF/Reut
         kAZzUzwkkJZ0HYnF6gvuu4wniSRBteDVxS3lF1SSjyha1pxdYvtz6lF6HvKtXpFxjjD6
         6+GB4lK3qSzEXdxc9W7G7j146SlPjJapca5vQA9FMbQ0EoeGhimFPgJSk0Uu3MOLHYTu
         Y3o6W6tL7kpo1x1g/2luKzzogqD++pSHiNeUlDnYrWfZKKBfBAwaFCd0vxfb0nuUTr+1
         jfMw==
X-Gm-Message-State: AOAM532ag7078yPQzMSLOciOxEWxMCefSinP1jhx53Lg2hiTWn59o73x
	UgpgF20WsSobnI/t1pZVLIpL/w==
X-Google-Smtp-Source: ABdhPJwn8SgMIziQOzGjZRQSHQ1GNGWKoFVlC1ib/HISuiDMvSgEfVSeufMTBxBwgugmcRiJoF4WDg==
X-Received: by 2002:a05:620a:218e:: with SMTP id g14mr9594643qka.111.1616164360582;
        Fri, 19 Mar 2021 07:32:40 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:3cd2:9d5f:c31f:db8e])
        by smtp.gmail.com with ESMTPSA id z2sm4648981qkg.22.2021.03.19.07.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 07:32:38 -0700 (PDT)
Date: Fri, 19 Mar 2021 10:32:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp/scp-firmware: bump to latest master branch
Message-ID: <20210319143236.GA4581@kudzu.us>
References: <20210318115605.29547-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210318115605.29547-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 18, 2021 at 05:26:05PM +0530, Khasim Mohammed wrote:
> SCP firmware recipes are updated to build latest SCP firmware,
> the previous release version is 2.7.0.
> 
> New features required for N1SDP are integrated in SCP firmware repository, this mandates
> us to migrate to latest master.
> 
> Change-Id: I1fb44ed790ca17f713333a0e371dce10c9399424
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---

Both patches pulled into master

Thanks,
Jon

>  ...t-CCIX-speed-to-GEN3-to-work-with-in.patch | 78 -------------------
>  .../scp-firmware/scp-firmware-n1sdp.inc       |  8 +-
>  2 files changed, 4 insertions(+), 82 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
> 
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
> deleted file mode 100644
> index 1f6f696..0000000
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> -
> -From 3deb59c5f4c64aa092bb3a4ebc018acf3f746f47 Mon Sep 17 00:00:00 2001
> -From: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
> -Date: Tue, 10 Nov 2020 12:31:04 +0530
> -Subject: [PATCH] product/n1sdp: set CCIX speed to GEN3 to work with interposer
> - C2C setup
> -
> -Set CCIX speed to GEN3 to work with interposer C2C setup
> -In this use case set downstream/upstream port transmitter
> -preset value to 4.
> -
> -Signed-off-by: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
> -Change-Id: I635566574babbb7591b5bba97105f76f1f8e550a
> ----
> - .../module/n1sdp_pcie/src/mod_n1sdp_pcie.c    | 30 ++++++++++++++-----
> - 1 file changed, 23 insertions(+), 7 deletions(-)
> -
> -diff --git a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
> -index 901e0464..ba02144f 100644
> ---- a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
> -+++ b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
> -@@ -206,7 +206,12 @@ static int n1sdp_pcie_phy_init(fwk_id_t id)
> -     if (dev_ctx == NULL)
> -         return FWK_E_PARAM;
> - 
> --    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
> -+    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
> -+        pcie_ctx.c2c_api->is_slave_alive())
> -+        gen_speed = PCIE_GEN_3;
> -+    else
> -+        gen_speed = PCIE_GEN_4;
> -+
> -     lane_count = LAN_COUNT_IN_X_16;
> - 
> -     FWK_LOG_INFO("[%s] Initializing PHY...", pcie_type[did]);
> -@@ -239,7 +244,12 @@ static int n1sdp_pcie_controller_init(fwk_id_t id, bool ep_mode)
> -     if (dev_ctx == NULL)
> -         return FWK_E_PARAM;
> - 
> --    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
> -+    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
> -+        pcie_ctx.c2c_api->is_slave_alive())
> -+        gen_speed = PCIE_GEN_3;
> -+    else
> -+        gen_speed = PCIE_GEN_4;
> -+
> -     lane_count = LAN_COUNT_IN_X_16;
> - 
> -     if (ep_mode) {
> -@@ -282,12 +292,18 @@ static int n1sdp_pcie_link_training(fwk_id_t id, bool ep_mode)
> -     if (dev_ctx == NULL)
> -         return FWK_E_PARAM;
> - 
> --    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
> -+    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
> -+        pcie_ctx.c2c_api->is_slave_alive()) {
> -+        gen_speed = PCIE_GEN_3;
> -+        down_stream_tx_preset = PCIE_RC_TX_PRESET_VALUE;
> -+        up_stream_tx_preset = PCIE_RC_TX_PRESET_VALUE;
> -+    } else {
> -+        gen_speed = PCIE_GEN_4;
> -+        down_stream_tx_preset = CCIX_RC_TX_PRESET_VALUE;
> -+        up_stream_tx_preset = CCIX_RC_TX_PRESET_VALUE;
> -+    }
> -+
> -     lane_count = LAN_COUNT_IN_X_16;
> --    down_stream_tx_preset = dev_ctx->config->ccix_capable ?
> --                            CCIX_RC_TX_PRESET_VALUE : PCIE_RC_TX_PRESET_VALUE;
> --    up_stream_tx_preset = dev_ctx->config->ccix_capable ?
> --                          CCIX_RC_TX_PRESET_VALUE : PCIE_RC_TX_PRESET_VALUE;
> - 
> -     if (gen_speed >= PCIE_GEN_3 && !ep_mode) {
> -         FWK_LOG_INFO(
> --- 
> -2.25.1
> -
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> index 635ec39..d365dc6 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> @@ -3,11 +3,11 @@
>  SCP_PLATFORM  = "n1sdp"
>  SCP_LOG_LEVEL = "INFO"
>  
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
> +LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
> +                    file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>  
> -SRC_URI_append = " \
> -   file://0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch \
> -   "
> +SRCREV  = "6c15afb1b37d0728482c598b063cd69bfc733e93"
> +PV = "2.7+git${SRCPV}"
>  
>  COMPATIBLE_MACHINE_n1sdp = "n1sdp"
>  
> -- 
> 2.17.1
> 

> 
> 
> 

