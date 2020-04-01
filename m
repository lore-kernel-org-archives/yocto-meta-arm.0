Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.1131.1585723344235893656
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 23:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ED7Q1aEo;
 spf=pass (domain: linaro.org, ip: 209.85.208.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f195.google.com with SMTP id q19so24495268ljp.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2020 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/WToXKGITJA57lY62qfoZNVK4+ce3GKt8id9QV+nPOI=;
        b=ED7Q1aEobkI3RNzQFWiczKmsHp/xIkCHyz2AJYmyqh9NWxpFSGc4YSReYaLaO8zOZH
         ybQNWRPPglFaGl4ihuw3GXcgv5xiJ6NHuHB3S5oSGWgn6JI4umnQh34yIAJ2hXHTfPRt
         neoihiKNtbe8+1M80I00n7tc5MBNlNQlFH/vlLLPctsWah0nAaMLDWXQNyX5HTV85sYK
         rYUeIqvonnSApro7YOc+d3RJ6mUV7qYBnRNK2Jjwj/DFffma4b9BaV5NmnW2zIF8JrBF
         slHa37yg/W7hdFNhKwOvJZl1e63YkzpK9T2ACWdJfOPsuYHgavLsbcf0QfUdVNrjMn+W
         vwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/WToXKGITJA57lY62qfoZNVK4+ce3GKt8id9QV+nPOI=;
        b=Or5zUXTZWvyLVBTV8OAVH1SJrctO033MhVu3RoejWnbiAaI9t8Wz2A9b9YaURk/K8t
         hj0W3e9w4j0oLJQXdYkUcdtRbIa0bXZaewHXlTMH5Jzo/3mIIE4/qfQzhlKrxV9JJr+Y
         8MsbBHR38xfbKp5qVS+xrEnk7aESIH4GbJ1YYAZEli5Ym1AXX2SoYhxm0xUVNaiqi307
         Y91wa5WsrPCJds7EwOZ/yMWCRaIzNUBSK3gn/STKjCsT5XeJjTApSrqH5cOMHEsZHvt2
         QfDtT+HK4VQhlhnsb+6CypHAxnqUzvcSgNDNZEEtt62cn/+YviTVKvTzwoB46hrzSdw3
         0P2g==
X-Gm-Message-State: AGi0PuYRaemZQUCF7zv+T4SDM8Xo0VtifHMnDc32pgyxcUf2rQjCWUah
	pbDibRWH97UKtBim6r/Z1m40hYHki2HG/5zJP4vpDAjMOyc=
X-Google-Smtp-Source: APiQypKXrzA+aoYcMm0dXb8pxVEIi8IOH9BsZrhByq9xVKGQR8IA4hEhGE+Vwcxxu71Ihaw9s5Vg7N1hXWXVrP4Q34Y=
X-Received: by 2002:a05:651c:404:: with SMTP id 4mr12514562lja.281.1585723341798;
 Tue, 31 Mar 2020 23:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <1585684637-53492-1-git-send-email-denis@denix.org>
In-Reply-To: <1585684637-53492-1-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Wed, 1 Apr 2020 12:12:10 +0530
Message-ID: <CAFA6WYOcRKmKSRo6jRDDe06Q3EQYF2ikg4zL-F0kUtRPuLPLbw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2020 at 01:27, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 3 +--
>  meta-arm/conf/layer.conf           | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 0632ba3..8afcbe5 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>
>  LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
> -LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
>
>  # We have patches for xen but meta-virtualization might not be there so filter
>  # out recipes-extended/xen unless xen is activated in the features
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index a247dc1..3a4c4f0 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
>  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain = "30"
>
> -LAYERSERIES_COMPAT_arm-toolchain = "zeus"
> +LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
>
>  # do not error out on bbappends for missing recipes
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
> -
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 65ccd15..0b93e8d 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm = "6"
>
>  LAYERDEPENDS_meta-arm = "core"
> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> --
> 2.7.4
>
> 
