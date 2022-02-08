Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AD1C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:55:50 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.13810.1644339349530200274
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 08:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C6YNlyDT;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id r14so15244746qtt.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=96eprZeNv1BjynsXtCWFrCYWBYuRNCxDK1XMXztcbbg=;
        b=C6YNlyDTIM1ya/hmpd4wxGDO92Ipn20fjaDMeQDF8AyU4fg4XbAyluN97QFJqDsoPG
         iVYFD3JOAJxjY15i0r0ZEgBFbffLscSJKQiSXpu0/sCMggsv8+lgjwK9JdMgfROF9ix/
         tNHN+ISlaZx8HfBf90luBU3K+gZXxUr6MJziPwDZ8uXubwEt/4FQt+dbalRTlF3n9FHG
         SZ2tRbs0hddz1AEWargoY1EQeSKpm4DNZIOrO40R0+GI/KcvkTBaoO7aQVgTi9UQPAwL
         0JLwhsUQO21RmeH80p+5e7Vl/VhfNUoIq3cvNxTkRVKVjhV9ioghpWdCpRKQDDihS+oO
         Au3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=96eprZeNv1BjynsXtCWFrCYWBYuRNCxDK1XMXztcbbg=;
        b=HgtoZRg93+Qadl7TaqHetpIdZ7pJnGnPfsVWsJK8zunu3r07h7emwT/SuVuVZZfR1Y
         Dc419ZHLCT8nWDnN6CJbMuSU9t5GRPRI9wueDd7iL4kTDvA7+lhiQOo+4uf5NlxaW4i8
         Bunqaz7RvhJusAGBos/lZRJ2WKUbLLdQBf2jwaw6NOdiLjis3W+XlkCmI4SaSiCfk4ha
         VUuqYbQ4x2ktKtgShR36mU9z/tOVexY8o297pmX5w2N7I7HGp4Kk5PF81oGBZv8V4E1T
         16YcBHY6jLzM90630SVGE+pPlR7Qb+VL13ub+7ZVZ6Cmptk4LjLpoxcJbssneV7twy9R
         PXrQ==
X-Gm-Message-State: AOAM5335zyMUx/mg/G7jfKddqkvgQb+o5zAHsA8JpsrwR6AzuW3TigX7
	bYrybwVyD6L8tU3S3oS+JTcgZYwNqnVTI+vRjqY=
X-Google-Smtp-Source: 
 ABdhPJynjkn0Vj8MemAk0VpwmPLQJA9kZ//GSzSK/VUzam3AGooK7YQt2RTNSV9FUVYzPP9Lz/JMoCauj8sk4Jq2GuQ=
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr3571616qty.229.1644339348532;
 Tue, 08 Feb 2022 08:55:48 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
 <CAMKF1sr=PMcRWpO3CPBjER9goDuLJKjqNiumGD04yQ1ijFyR6w@mail.gmail.com>
 <CAAnfSTtNJuK5mUYAct6EcnEMdf3HO-GS3nhZQLeeWmOdSyWsgg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtNJuK5mUYAct6EcnEMdf3HO-GS3nhZQLeeWmOdSyWsgg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 08:55:22 -0800
Message-ID: 
 <CAMKF1srGSE3-gcoiCnDk+DGOrHrS_Vh8_e0_rrzU9-FbckWW-w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 16:55:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2956

On Tue, Feb 8, 2022 at 8:37 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 8 Feb 2022 at 15:21, Khem Raj <raj.khem@gmail.com> wrote:
> >> What failure did you get when building for RPi? I can't make it break
> >> by building it for non-corstone machines.
> >
> > Build it for a BSP which does not use yocto reference kernel
>
> Worked for our TC0 machine, which uses the Android Common Kernel.
>
> What failure did you get when building for RPi?

https://errors.yoctoproject.org/Errors/Details/623682/

>
> Ross

