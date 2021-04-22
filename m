Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.1157.1619128198127645215
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 14:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=yWzAX3Bb;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id h4so37245475wrt.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Apr 2021 14:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GHBT8CgOjtFnIUB0ocZJWqZFqqAFvhgEO3VE7Hao/IM=;
        b=yWzAX3BbXxwBkZUYV7CMKjTCfp/Sz7zborB9cj5Hkny+I/4siYbAuDuknsVosDonNX
         X59QvvO9BHdV2vbgeirUjsYH7Y48hZtBSjll+WxcMlLqOc6OHLQSblufByJ3aV3eTrab
         3s7WajSWGc/hp+PoMbLMNNkdO/Ovv2NlbOu1NS48+J/L3oUU/wxYKISdSCPqZcef8ZzR
         K16hdiyrF8lPboXpx0r574deIsKxHI4/NbJS9ayzLjAtR0m9mDmOZ3HpgA5eLza2Bsio
         WToh8MjasKe04/gN6bfMajw/TVxgjtZRi+WQ5SoZjmBinvjwYt5MQTV2zdWTF3Z4TZ8r
         dmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHBT8CgOjtFnIUB0ocZJWqZFqqAFvhgEO3VE7Hao/IM=;
        b=TCvfwiGB8/08QznL7+LVi5B9L9IfwfgbnoYJYLN5PcWqzZKk3tqXCVa0XZ8TBzXWK0
         pZjwR5AE/7Ff/y8/gBRQXlXF5mRdix7uKvx2tVqKXpr7PhuGdEbWT33uZ3JMp88ojHNk
         12f6RJaBOBBWUO74M9qVtHJ7fiDDHiIBytUUtOx3uvhcQZwMS3XMTMqecKE0df7OtYXp
         mr0j2ktTVk7XaWJBFaSID+dXaTGJO5y7cniamd/GEyKzsCx8fW3r3kyI9sVK40ZHbCqp
         okvdeEb996970eDMgRO120Yy1gkbL9c5eDcONWdcEkqy7EsMwdPCvoFVolT5bXFyh20m
         MbHQ==
X-Gm-Message-State: AOAM532kgsyGHKomeeS8w+yS5b77TkQQyZTJczyCNoSEO2JFqUabMHTu
	ZLxZQ+xNWPvdgMuvjOm9Eeu1wZMMsE3XyunOAHV8SA==
X-Google-Smtp-Source: ABdhPJz2UDMC/bWctTGHR5ZwkUnXRgKuimJkh6nQeZ38yIv9rVZozwtnl8wuFimEAS14qYxE0NTS8K3tqGzDcEOTDYc=
X-Received: by 2002:a05:6000:186d:: with SMTP id d13mr495731wri.199.1619128196640;
 Thu, 22 Apr 2021 14:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210422160655.3720-1-khasim.mohammed@arm.com>
In-Reply-To: <20210422160655.3720-1-khasim.mohammed@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 22 Apr 2021 22:49:45 +0100
Message-ID: <CAAnfSTsaDuTVoMDnk0_ta+5bX3R7c-Xs7Ez9v_8Zv4N=RCoUfQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp/scp-firmware: Enabling coresight debug non-secure access
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Is this intended for the hardknott release (next week), or is it okay
to merge this just into the master branch after hardknott has
diverged?

Ross

On Thu, 22 Apr 2021 at 17:07, Khasim Mohammed <khasim.mohammed@arm.com> wrote:
>
> From: Khasim Mohammed <khasim.mohammed@arm.com>
>
> This patch enables coresight to work with n1sdp c2c profile.
>
> Change-Id: Id3a5f92cc1f99cd907111ea858aad4efe561179e
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  ...ng-coresight-debug-non-secure-access.patch | 38 +++++++++++++++++++
>  .../scp-firmware/scp-firmware-n1sdp.inc       |  6 +++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch
>
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch
> new file mode 100644
> index 0000000..713f4a5
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch
> @@ -0,0 +1,38 @@
> +[PATCH] n1sdp: Enabling CoreSight debug non-secure access
> +
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +From 194e6239737272c3fadb202deb8015cb6e8df6ec Mon Sep 17 00:00:00 2001
> +From: Khasim Mohammed <khasim.mohammed@arm.com>
> +Date: Thu, 22 Apr 2021 15:48:02 +0100
> +Subject: [PATCH] n1sdp: Enabling CoreSight debug non-secure access
> +
> +This patch enables coresight to work with n1sdp c2c profile.
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +---
> + product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c b/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
> +index 70e2ec3f..ff380ae2 100644
> +--- a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
> ++++ b/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
> +@@ -466,6 +466,12 @@ static int n1sdp_system_init_primary_core(void)
> +             return status;
> +     }
> +
> ++    else {
> ++        /* Enable non-secure CoreSight debug access */
> ++        FWK_LOG_INFO("N1SDP SYSTEM] Enabling CoreSight debug non-secure access");
> ++        *(volatile uint32_t *)(AP_SCP_SRAM_OFFSET +
> ++                               NIC_400_SEC_0_CSAPBM_OFFSET) = 0xFFFFFFFF;
> ++    }
> +     return FWK_SUCCESS;
> + }
> +
> +--
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> index fa3403d..65034d2 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> @@ -6,6 +6,12 @@ SCP_LOG_LEVEL = "INFO"
>  LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
>                      file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
> +
> +SRC_URI_append = " \
> +   file://enabling-coresight-debug-non-secure-access.patch \
> +   "
> +
>  SRCREV  = "6c15afb1b37d0728482c598b063cd69bfc733e93"
>  PV = "2.7.0+git${SRCPV}"
>
> --
> 2.17.1
>
>
> 
>
