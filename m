Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45946C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:03:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.22777.1636984994925118823
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=E8FMWdRR;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id z200so14071814wmc.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9RVaaQ2gCXPj/9Lck1OlHJ87dON/4B+I9z2QsZd7Zs=;
        b=E8FMWdRR4PTawdwUb7E4dzxA2OgpBU0i/zzJ1hLorMHAx/NjTRY7ZvQVa1pVlOrpzC
         62e72NC1AfSiKe8BrtVeLH+uWozrdFSTfl2CYx18MnTrhqZkIkitwFk6Tuz0kldBmSPS
         DQqLOcdZVhwE4qCfuzwigS2qLhEsmTMSZbESsIhAmvKhKV7D6AFMtR3bFw91753GFSix
         htRnmPDyI+pnwEoqef9XqBvoA172LxYuQiWFdxLV2eby8UHhVnojMDjgAuP3Wl/NbMyp
         5HH8piBYrt1Vp9o/1C1lYEw3owrsx40Wl4iY6sCUz0aqbzm1rxvBNAxFUbIygaY7Vmx+
         kGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9RVaaQ2gCXPj/9Lck1OlHJ87dON/4B+I9z2QsZd7Zs=;
        b=xQvW1bUhZaYXEHKqA6UHjlwOQLHStO0qgj2nejIRFea2XZZhAvp28I/nkytU9EsDiu
         VYs2Y8qXQQv0G6WcmyPXDvgpnK6K/5MsEngs9sncYigFclY4Ogylja6anDYna6RjyM7r
         Ybp3hoMXSrWUOMZhBe5JYkmam58+OmzhI3Zah/n8NcjS/qbB44OCdTZw8InpT0UN/Qhs
         AR0aB9/np3iVeD3sgB4Rf6fUeJEpPAeSuPTup9gJE1NvPBOcseMLTDvWm7CHobqHHTuK
         eIx5iobL74TJ9mVb1VhpUTc1zFLea/WNyGj7MOQl/W5PvUsF0rffH+PcN4oy140nfVqY
         wXXw==
X-Gm-Message-State: AOAM531sVkgLvPWQlq4P5nF9BYCVB1JQvESLzfONP3ywcl7GnRs6ZxjB
	gygv9rlR3dC99Jpzag1ScZUjZSZtfu83yYezlnkd1Q==
X-Google-Smtp-Source: 
 ABdhPJwlhi8vXwIL7wpcTf7zjQ3GSsDfFSHQgss9d9SQyn+HxfGdY9OYA40q6kSSYLXsojhkCJ4H6bjGNLadAE07I4k=
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr42381632wmq.62.1636984993277;
 Mon, 15 Nov 2021 06:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <20211115140100.24634-5-maxim.uvarov@linaro.org>
In-Reply-To: <20211115140100.24634-5-maxim.uvarov@linaro.org>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 15 Nov 2021 14:03:02 +0000
Message-ID: 
 <CAAnfSTvdN+Cta73oTQ3MFjNznAT8U0MYaur8h3NzjHUVddMO3Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv3 5/5] tfa: add depends on openssl
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 14:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2390

Rebase to current master and this will go away.  TF-A doesn't link to
the target libcrypto.

Ross

On Mon, 15 Nov 2021 at 14:01, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> build ci/corstone1000-fvp.yml: generated the following error for me:
> libcrypto.so.3: cannot open shared object file: No such file or directory
> Add openssl to DEPENDS.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 243e641..0f7d3de 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -87,7 +87,7 @@ DEPENDS:remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
>
>  # We need dtc for dtbs compilation
>  # We need openssl for fiptool
> -DEPENDS = "dtc-native openssl-native"
> +DEPENDS = "dtc-native openssl-native openssl"
>  DEPENDS:append:toolchain-clang = " compiler-rt"
>
>  # CC and LD introduce arguments which conflict with those otherwise provided by
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2389): https://lists.yoctoproject.org/g/meta-arm/message/2389
> Mute This Topic: https://lists.yoctoproject.org/mt/87069393/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

