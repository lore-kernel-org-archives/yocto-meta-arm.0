Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96080C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 10:03:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.62082.1643796211734679459
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 02:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=BIro9mIA;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id f17so37293911wrx.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 02:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bFyQQpDOx7RFmTPqsQtUPCoxXfNKE8mV3TXtZYbTz20=;
        b=BIro9mIA20Pvdd0ATxTFMTZrcoFe1coX2/IM+Y/8hb0KB6O86h2K3qRMMmma90Jsa/
         pJg/BNrVzSEE1lmuZ9ca0FBHeJfsLxDI8oscnGtrrV73Q+ZGI3Lg5tMEtkiwtA3gjx7G
         ayUMLb5+ZHymhAkATr3rxE19icBcnS31H64CBrFcmXBvJJiQE2qsEg4w77QfiNhCyvof
         AB4AEqVqPeobzGUm6IoraVaC4Ojf8jn5QmHTnR/ApS3RUzXK7FpIJC1ZemzH6qVe8qe2
         SxKqckCWotNdLj2+98TbbuHV9MGzmYqVPj3GX12aZylq1mAzR3n/BjFzl/wZslD/9/j4
         CivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bFyQQpDOx7RFmTPqsQtUPCoxXfNKE8mV3TXtZYbTz20=;
        b=TgKI6YKIG40WPsSpiIE42NGNS5ouQDw1WTJZUJoZiYohcE0pxQXTZfrLSab7IT6UNi
         cCkr8Bv4ITRDgEM1kwbBMSnZEmg6a0iflQtVWgxT2KtdhuAtRkehv+t9iX45ZE7pgS5V
         fpmxii/FbBx07XgQuTHzRklXogPOar193Q7C2gVgtGuiyvZt4E49zabStkT2r+taW1sP
         hWEYRRz7EPhP12M5EwsxMwcn1uhbjBQDWJsLRH/S6wzzxO5C4pJdOLdZo6HNgmXIuexQ
         GnsKbod1L0Z20RMiwsflWjXdknl9oyvq61JeiVayMfuNCAGIEf3S+hyUoW0CmzaAPSkF
         lABA==
X-Gm-Message-State: AOAM53123RYZEJ2nN1q5WuwKWkWlMGrCdwmJKqc7tjfWFdesDAu76fzn
	RP0JwnEm9BztwJEoJHmhh2YRcykEQzdPbYgL0L0vQ3OxPz1X54V+
X-Google-Smtp-Source: 
 ABdhPJxmjLCuGs8wHMU6sRowVv+PHhs7nFaobTzi7Qb6h5l3eL6ZaisAdo+JQYcw+H67LRBK2lZvel99edj+sohnlQI=
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr2983945wrt.497.1643796209988;
 Wed, 02 Feb 2022 02:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
In-Reply-To: <20220202055225.2212857-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 2 Feb 2022 10:03:19 +0000
Message-ID: 
 <CAAnfSTt+fuJrkx96wgz-wmpj=u2MwcMnFsPp02NMLXwrVmCXMg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Feb 2022 10:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2939

If this needs kernel patches then the base recipe should set
COMPATIBLE_HOST to invalid and then machines opt-in by enabling it
with bbappends in meta-arm-bsp.

Ross

On Wed, 2 Feb 2022 at 05:52, Khem Raj <raj.khem@gmail.com> wrote:
>
> The module can not be compiled without patching kernel
> and rpi machines use linux-raspberrypi and are either arm32
> or arm64 machines, so this module tries to build in world envs
>
> This helps meta-arm to live in multi-BSP envs
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> index 2db8afc..93f5f02 100644
> --- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> +++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> @@ -29,3 +29,4 @@ do_install:append() {
>  }
>
>  COMPATIBLE_HOST = "(arm|aarch64).*-linux"
> +COMPATIBLE_HOST:rpi = "null"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2935): https://lists.yoctoproject.org/g/meta-arm/message/2935
> Mute This Topic: https://lists.yoctoproject.org/mt/88852674/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

