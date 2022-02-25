Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA65C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:21:27 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.3660.1645766486583168925
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AcJwO017;
 spf=pass (domain: linaro.org, ip: 209.85.208.175,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id t14so5892472ljh.8
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iv2f4K4dzff3DVy35SuI6DnLf5SpDoD8HYmkP2YIa9c=;
        b=AcJwO017V+Qxu5sVKXqtxE07207ug9YgOPVDQq0BHpWkGkF6zO/xw0wyqkDOabsG+j
         VAW8vRvWSPzrmD/U96iL13uR+tfyWvEzs+H/2bGKXzLCtCUm0TY6xpfE8KKQhD6mTGys
         FLnuk/IDwtPgD7j2lY4GwFPEIDPSwEfYt4CMO3bg8a6BXOLBSi6n3FvF7ORxGjz4cDPp
         93BAU+9VEzbPyl8JJxSNL/x9ti2N4Mwkxd4+eChoglRClld0Tf+/TK84loBsHO9hwtJP
         P57W4nujhvowCT/fqxTByBREcNyZ64rCBtVav/qqZBbmVR42D8GG4+N502z+RhB20RpB
         29cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iv2f4K4dzff3DVy35SuI6DnLf5SpDoD8HYmkP2YIa9c=;
        b=vdSm/iBVq6j3MFb5CIZQI2Kw59HFA3l5K9NzKrA0lI4G6V27Qlj1Nz1fgzPk0EUc9L
         dMAgJlwmzE7cPPlnAsJMvLXUKOBoWPdTcZ+rH+4z4mebV9iKARLx6EJtJWfIxggppPz1
         n0OtzVxlJUxCo2aSmFQJLx9EHx5EkNssw5bAa8J/3Sn8hjm0rXQw9Vj3bD1/31nZYbKy
         8opO4NwA6sU4OApGBL4YrqEJM+sZo7moTTFrgerLvLDPEfQ4zEGkDYQPounygrECU3Vu
         Q0sB8FZPKKbTlFKtPA7UXmYA54tKopVZ4lZq6lQ7grDVSfn/PnRfUCNVl0M+tVYHj/yl
         rjYw==
X-Gm-Message-State: AOAM531dcq4SMpTR9Ki1IUs+taQH7/dZIL9/mKBhcCetH4Szjc9ZLeV/
	WPaTF2Jdh3iBMjerynUHbMH4GoBSi5nqr0ngZVfbHA==
X-Google-Smtp-Source: 
 ABdhPJzlW2mufqHaJbEHFyNXPOopyEypMqh2Gq7VaYTVKZajrT2kqBKEv9I4Eh84NibdefT+6jAIslRshXQsGnPo7zc=
X-Received: by 2002:a05:651c:328:b0:244:ba17:b467 with SMTP id
 b8-20020a05651c032800b00244ba17b467mr4257446ljp.502.1645766484499; Thu, 24
 Feb 2022 21:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20220224172442.2136276-1-denis@denix.org>
In-Reply-To: <20220224172442.2136276-1-denis@denix.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 25 Feb 2022 10:51:13 +0530
Message-ID: 
 <CAFA6WYPdD1eUTRZc7qXG6ANn2YnLhH23v+afS95NtV3t9sSz_w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: convert remaining
 licenses to SPDX
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:21:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3066

Hi Denys,

On Thu, 24 Feb 2022 at 22:54, Denys Dmytriyenko <denis@denix.org> wrote:
>
> As automated script missed those.
> Also, correct GPLv3 to actually be GPL-3.0-only for toolchain components.
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  .../recipes-devtools/external-arm-toolchain/license.inc   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

It looks like there is already a patch merged to fix this.

[1] https://git.yoctoproject.org/meta-arm/commit/?id=74bd32b2e619b0308b6e44841c6bb2c5968346ee

-Sumit

> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> index 10f2542..4260dc7 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> @@ -1,9 +1,9 @@
>  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
>
> -EAT_BFD_LICENSE = "GPL-3.0"
> -EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> -EAT_GDB_LICENSE = "GPL-3.0"
> -EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
> +EAT_BFD_LICENSE = "GPL-3.0-only"
> +EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> +EAT_GDB_LICENSE = "GPL-3.0-only"
> +EAT_LIBC_LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>  EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
>
>  LICENSE:${PN} = "${EAT_LIBC_LICENSE}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3057): https://lists.yoctoproject.org/g/meta-arm/message/3057
> Mute This Topic: https://lists.yoctoproject.org/mt/89370103/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

