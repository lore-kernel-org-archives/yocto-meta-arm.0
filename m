Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F0EC433FE
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:35:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.10981.1638534921659088938
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 04:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=PKXnFC1n;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id 137so2241767wma.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=7IyPyH5n4bwA8u6Y4ECIHFttHiCqZ6dK+S9jkmzdmfw=;
        b=PKXnFC1nyWnhKwuW+0rlGakWTiEfH0TxP4tpJP89t1c/SlWJvJOFPnUcW46cFOz0sn
         Zz8F+HgaBK2NaV6ZH4jBi9s9JWEw+hgutaowyV9ug297B0ycfSrnWa6V1HakezTE4bPx
         e/D6Z/npL8m7MvF8Ilt/I/q7PZh70O5x+SfbKVqzAGZlzZLya1nkcED6+6CpZF4F2Nxm
         IKyypyrUltG/ccPhgTt35jg4fj9ofi8MJbwsuPoKTmzmAvEzQxDm2KP8b5770WHDRexO
         rIt8hNGceXXAIobdbF6zqY7+KsEAMvLuDLTmXkH7+bR3ujXQs/ItvzZomJbp+xQxJghC
         jx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=7IyPyH5n4bwA8u6Y4ECIHFttHiCqZ6dK+S9jkmzdmfw=;
        b=5Bduxmg839VpS7iqk+6quFFlNk/JUibG5UYPidL0YTmoKCatlVBXYkQkyjBSb/DNXi
         v0/MCPlEgi4BDM7s/8YMe0ihWsP0VLr6Az4PBlzgkTSOugi9wxEgVrzH3GOuXcD06OMb
         gfDUPlOo/6m+9Br90lQ+7TuSj+d7lyPa3tlVnc8ET1YFsuHyKDQxLEgTKttodDUWP9fk
         cR+2yWi3zWWaFN1UZFT8iPY5bfWq3zDTXKDjCjvo4aS96e0UyiPg3Srk70UBZ+eH7Hw+
         1082I11y5j+9Q4OOxqaOmGtXe2Yk7EkGkMODMnqmO615HwUZdtrRQ75zE68jDkS/Pysg
         w9bQ==
X-Gm-Message-State: AOAM530kON8ymTZ7YFBq2fylIOEMNAeQkGDFw01XnWZzjPeN/D3WePk/
	cp0inDgWaufrNdAxSQH2Ls4X6wzBGTbbNAA7vlGFbYKNrMQ=
X-Google-Smtp-Source: 
 ABdhPJwJKH75HOZ1pQTQOonOgOYOMMzu5hggdgSdrN+XbdTIfK7k1tJWARGI70kp/pngTE7gvgn9AjxyFgzj/bMexOI=
X-Received: by 2002:a1c:488:: with SMTP id 130mr14729542wme.157.1638534919583;
 Fri, 03 Dec 2021 04:35:19 -0800 (PST)
MIME-Version: 1.0
References: <20211202202844.2555322-1-ross.burton@arm.com>
In-Reply-To: <20211202202844.2555322-1-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 3 Dec 2021 12:35:08 +0000
Message-ID: 
 <CAAnfSTt_qcpDeiGyEKjV3rmtRzGz=rtCcFBFEznbkuV0k5FG4g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm/edk2-firmware: force debug builds when
 using Clang
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 12:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2525

Still broken, v2 incoming.

On Thu, 2 Dec 2021 at 20:28, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> edk2-firmware release builds with clang fail:
>
> MdePkg/Library/UefiMemoryAllocationLib/MemoryAllocationLib.c:142:15:
> error: variable 'Status' set but not used [-Werror,-Wunused-but-set-variable]
>
> This is upstream as https://bugzilla.tianocore.org/show_bug.cgi?id=3758,
> but until that is resolved we can just force debug builds with clang.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 7072d1b4..dd428d41 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -26,6 +26,10 @@ COMPATIBLE_MACHINE ?= "invalid"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  EDK2_BUILD_RELEASE = "1"
> +# Release builds don't work with clang yet:
> +# https://bugzilla.tianocore.org/show_bug.cgi?id=3758
> +EDK2_BUILD_RELEASE:toolchain-clang = "0"
> +
>  EDK2_PLATFORM      = "unset"
>  # build --platform
>  EDK2_PLATFORM_DSC  = "unset"
> @@ -110,3 +114,4 @@ do_deploy() {
>      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
>  }
>  addtask deploy after do_install
> +TOOLCHAIN = "clang"
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2511): https://lists.yoctoproject.org/g/meta-arm/message/2511
> Mute This Topic: https://lists.yoctoproject.org/mt/87461917/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

