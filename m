Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.12414.1614953996893091989
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 06:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=vCfuqh1l;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id z128so2017170qkc.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Mar 2021 06:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yVOUXzMtS0xn2D45X0GXABnz6Qf/f6BO31tDEQZMAjg=;
        b=vCfuqh1lhQuzwqT7yjntnaHFVbFhUrXhAUAkVBlSL7JdW0DR8q4F6UiQqDw3TzlhnZ
         zmIdKl71GSeQ+do+LebeUjhqqZqW9aEfr4UqU5NpSXGgsYcP+ZsaRzrXKo/cqVEroM63
         s0xVuZ5kjBtERlKgqRikXegRIz+IMwdeGXobybqUj9PJweImoTsPoQmVhaILjsSrBG5h
         YEMg1YLwnMykN3FfWSAZGGyd1VkMJjdzAWJVIWsW4aUea4uChFjmR9Nomip8h/+kF/kC
         /m7mgesmOZfR7fOOn4Tj5m4qRvuzl3rp8Dyc+Omy/pvBB5TdPutD/HdOZgGAS2YYxcbU
         ulkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yVOUXzMtS0xn2D45X0GXABnz6Qf/f6BO31tDEQZMAjg=;
        b=X0TxNj9d0RlUB3YMaGRd+bKy3Cmo1UwUbmnVBH8sZlEMucd7xENoHPk/jGYzSok1eH
         y72UVjRscCuf94beW4/LK8ReaZ9p3ER3Fif6f902BbK+MthtswDHgMIAZkGdoI3GGyzT
         0yCKndoTFJzoDrrFXlaf4E6QBX6ttV9XKhFjPRl+JZb8Vv6CNFI25tNGfeyqK1ZawUiW
         vMikmZmgXNiISN2XcykV9NNHR9AtHi5GdTuB9tFLti8Il8fnaFRHCLdIclSOhsF669ys
         qGBA/fvUbmsozRZ+Op+oYRYsi6UYELdpsdj2hMhTFsnfjxaj7tIBvJWmI/FmTG0JAoC1
         qTQQ==
X-Gm-Message-State: AOAM531OiQm7ZOsaOf6pypgRGQ3jRFJ1NZuQa1AQPbERJiPsF5+Dqnlo
	cEEQvZkTCMH1vCa8KKhjR4i8Zg==
X-Google-Smtp-Source: ABdhPJw/vNrtAjvIQTwunAeson60G4uBB2cVYukXrlROOlInZiyZDKKlbOnhdHfvwkLhA0tph9r48w==
X-Received: by 2002:a05:620a:22f5:: with SMTP id p21mr8961302qki.225.1614953995883;
        Fri, 05 Mar 2021 06:19:55 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:20a3:3a4f:ed63:83f])
        by smtp.gmail.com with ESMTPSA id 85sm1854673qkf.58.2021.03.05.06.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:19:55 -0800 (PST)
Date: Fri, 5 Mar 2021 09:19:54 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/fvp-base*: Fix the MPIDR values in the device tree
Message-ID: <20210305141953.GD17134@kudzu.us>
References: <20210304101922.4929-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210304101922.4929-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 10:19:22AM +0000, Anders Dellien wrote:
> The MPIDR values are incorrect, which means that only two CPUs start.
> With this patch, all 8 CPUs start.
> 
> Change-Id: I4baa8738948ec756d6902bc75d0a56edf15e23f8
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> ---

Applied to the master branch

Thanks,
Jon

>  .../fvp-base-arm32/fvp-base-arm32-dts.patch   | 28 +++++++++----------
>  .../linux/files/fvp-base-dts.patch            | 28 +++++++++----------
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
> index de7b752..b21b4c0 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
> @@ -112,64 +112,64 @@ index 000000000000..f4601c7f99f8
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU1:cpu@1 {
> ++               CPU1:cpu@100 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x1>;
> ++                       reg = <0x0 0x100>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU2:cpu@2 {
> ++               CPU2:cpu@200 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x2>;
> ++                       reg = <0x0 0x200>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU3:cpu@3 {
> ++               CPU3:cpu@300 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x3>;
> ++                       reg = <0x0 0x300>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU4:cpu@100 {
> ++               CPU4:cpu@10000 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x100>;
> ++                       reg = <0x0 0x10000>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU5:cpu@101 {
> ++               CPU5:cpu@10100 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x101>;
> ++                       reg = <0x0 0x10100>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU6:cpu@102 {
> ++               CPU6:cpu@10200 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x102>;
> ++                       reg = <0x0 0x10200>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU7:cpu@103 {
> ++               CPU7:cpu@10300 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x103>;
> ++                       reg = <0x0 0x10300>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
> index 47bc8e1..fcd8f70 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
> @@ -110,64 +110,64 @@ index 000000000000..f4601c7f99f8
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU1:cpu@1 {
> ++               CPU1:cpu@100 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x1>;
> ++                       reg = <0x0 0x100>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU2:cpu@2 {
> ++               CPU2:cpu@200 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x2>;
> ++                       reg = <0x0 0x200>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU3:cpu@3 {
> ++               CPU3:cpu@300 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x3>;
> ++                       reg = <0x0 0x300>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU4:cpu@100 {
> ++               CPU4:cpu@10000 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x100>;
> ++                       reg = <0x0 0x10000>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU5:cpu@101 {
> ++               CPU5:cpu@10100 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x101>;
> ++                       reg = <0x0 0x10100>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU6:cpu@102 {
> ++               CPU6:cpu@10200 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x102>;
> ++                       reg = <0x0 0x10200>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
>  +               };
>  +
> -+               CPU7:cpu@103 {
> ++               CPU7:cpu@10300 {
>  +                       device_type = "cpu";
>  +                       compatible = "arm,armv8";
> -+                       reg = <0x0 0x103>;
> ++                       reg = <0x0 0x10300>;
>  +                       enable-method = "psci";
>  +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  +                       next-level-cache = <&L2_0>;
> -- 
> 2.17.1
> 

> 
> 
> 

