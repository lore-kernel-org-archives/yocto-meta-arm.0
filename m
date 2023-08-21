Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6D3EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:59:54 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.10332.1692622790196786088
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 05:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=B2yhB1QV;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bcc4347d2dso7136381fa.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692622788; x=1693227588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J75iDNvXUbsIxZrw4y2PXm7nP7TyFrHHEM5OgiUOp24=;
        b=B2yhB1QVQpRy+FzZIgPZvtf/0OFymKO2a5r9WgeEpovQiJRNrjm26KE2KowGJ/zQvg
         +lCe8Wd4pHwStCPFaG7j0nXbGdgX0JwK0lKmrU4NCHMBEsoYplvDBnu2GpsdLAfP4Wn5
         e20vz6+S1uxuQWqKeQMsiHuHqKDiNX+N4cI3bk0GIkxLmEyMZQXAtiqkQfJw079/cXwI
         DtkuNCsLdWzL4oLdt/TEiUrt56n5zCAD5PyoQVMUkS/5iQ/13Xmq3xfJ2VeSzVnTNGBr
         gjtBO+KDw3+qVSUT2CDMIb78ktpcy3udUxgRO9wa46tnAzn/XeXai2UV233SU9T50pK2
         fKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692622788; x=1693227588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J75iDNvXUbsIxZrw4y2PXm7nP7TyFrHHEM5OgiUOp24=;
        b=X5XVVQ8ITyYa0ADSNrr1k/c6XMZVsxJRG1NFgJQp1LPm7xO7MoPUFeAoGOWawRnfEs
         9S4FUcILP+mznw3gdS0hVusN9SYlldWFijjOhU22v5+GHlgLeYRpiiRmoBJhUJ1nkwh1
         eufsWj0/yOrYzQBSF5SM2Ep+xNzyHyQ/+Brnwywp8hx3S8MPOxD9trdM3DDc9yBTB6Ll
         7c3bwCXdR24JZWy6eUM6MLdn77t2IW9nKi/ByE6bIOXqKTzomkoo5ZVGfxFr0OCaKHBZ
         RXOESSA6WQ5SEIEX6imrcdgIAMaziuwxgC15hFLYeU+SHiWiplrVcTaBQeqhfhElVa5Q
         d8SQ==
X-Gm-Message-State: AOJu0YwOejQVlDCk47kdQRQM3niziQpRNrVcG93mO5NrmOIu68B38iFb
	TkxlKBiuppwwiEGTaJra6QK9Xg==
X-Google-Smtp-Source: AGHT+IHQtwdgbW9TtxnnRdgB2jNNgjnO8Q8BucyfKrU5q4E/O0WKYzzUp7VYC2v3WRAASofngGS1bg==
X-Received: by 2002:a2e:a168:0:b0:2b6:e96c:5414 with SMTP id u8-20020a2ea168000000b002b6e96c5414mr4752042ljl.52.1692622788213;
        Mon, 21 Aug 2023 05:59:48 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id d2-20020a05651c004200b002b6f1afd00esm2212127ljd.107.2023.08.21.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:59:47 -0700 (PDT)
Date: Mon, 21 Aug 2023 15:59:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/linux-yocto: change defconfig patch for
 6.4
Message-ID: <ZONfwc7SZdVohjFH@nuoska>
References: <20230820215106.3643758-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820215106.3643758-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 12:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4970

Hi,

On Sun, Aug 20, 2023 at 04:51:06PM -0500, Jon Mason wrote:
> Use the patch that Mikko Rapeli is trying to upstream to work around the
> Nuvoton defconfig issue instead of reverting the patch that added the
> platform to the kernel.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  ...g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch | 50 +++++++++++++++++++
>  ...config-Add-Nuvoton-NPCM-family-suppo.patch | 45 -----------------
>  .../linux/linux-yocto%.bbappend               |  5 ++
>  .../linux/linux-yocto-rt_6.1%.bbappend        |  1 -
>  .../linux/linux-yocto_6.1%.bbappend           |  1 -
>  5 files changed, 55 insertions(+), 47 deletions(-)
>  create mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
>  delete mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.patch
> 
> diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch b/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
> new file mode 100644
> index 00000000..d7f01853
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
> @@ -0,0 +1,50 @@
> +From 94a5e7ffe5855272708a94190820534c4f51bdd8 Mon Sep 17 00:00:00 2001
> +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Date: Tue, 15 Aug 2023 10:36:56 +0300
> +Subject: [PATCH] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
> +
> +There is no code for this config option and enabling it in defconfig
> +causes warnings from tools which are detecting unused and obsolete
> +kernel config flags since the flag will be completely missing from
> +effective build config after "make olddefconfig".
> +
> +Fixes yocto kernel recipe build time warning:
> +
> +WARNING: [kernel config]: This BSP contains fragments with warnings:
> +...
> +[INFO]: the following symbols were not found in the active
> +configuration:
> +     - CONFIG_COMMON_CLK_NPCM8XX
> +
> +The flag was added with commit 45472f1e5348c7b755b4912f2f529ec81cea044b
> +v5.19-rc4-15-g45472f1e5348 so 6.1 and 6.4 stable kernel trees are
> +affected.
> +
> +Fixes: 45472f1e5348c7b755b4912f2f529ec81cea044b ("arm64: defconfig: Add Nuvoton NPCM family support")
> +Cc: stable@kernel.org
> +Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Cc: Jon Mason <jon.mason@arm.com>
> +Cc: Jon Mason <jdmason@kudzu.us>
> +Cc: Ross Burton <ross@burtonini.com>
> +Cc: Arnd Bergmann <arnd@arndb.de>
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +
> +Signed-off-by: Jon Mason <jon.mason@arm.com>
> +Upstream-Status: Inappropriate

Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-arm-kernel/2023-August/859760.html]

Cheers,

-Mikko

