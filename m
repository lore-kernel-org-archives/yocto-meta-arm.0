Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEE6C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:57:27 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.13839.1644339446209760285
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 08:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NTtm4+qr;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id h9so4794903qvm.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZcqQZCvrVvLJ44lsYawy1z44UvyPgzFbmTp9uVryAoI=;
        b=NTtm4+qr+6chNnQPHnpB9cCEvkYjJOqU2DK6JdDT9gC8schR1C2j44+NmtMh5qWC+4
         qEoH1YClU3MJJdarSQ9Qy7fzI5gbRXqwwDHg2GzEUYPXJk29pwqFz4tiAX+qZ4LhbX15
         CeZfHHZYkbjLPcxd4hx2Zzhj3/A9C1JXUjRPnsgxmEd87ZLtoD7/C8COKH1TYJYE/+Cp
         tpX8tcbTLwYWzpdIIa4cQ8HfX3Arcz5XlVknLhG6J1+zljq2BRPykiuQgm8JKeF+dM/4
         /4hWZ2fuO6L32tlnEt8m+geAnBb2H6yOpbfyav1Zw+il4CayK2hZQNGuHyHQKz7mdopW
         c68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZcqQZCvrVvLJ44lsYawy1z44UvyPgzFbmTp9uVryAoI=;
        b=wk5IiKSXh/ckgLLfD7/1byJrQgFm1DBjk3nDUrLyu9gTi9K50EmMMabU/9HYtor4B9
         By20tXpr13iEf6kPSbzOAp98LUIqgt/1AFuYoHDAKv2LZOsnSFb1jB3e5eaE6vamw+F7
         ewsyBkKcxUGnCvEdTF5ackS9VUy2jEqM45R3ZFgQW/8alJSzgR8FH/MbshCd8Qu7Dbsk
         JLLsp8I7DnYIvAx+O7WmMvh+zCoelN0JUqUYgD6iDDJZPovFjAvuZ7qn2yqDxZ2YoStE
         SWlbMBHyPH4GgxWAVqOzu7muK5NjAeDMLz6fac39q2x1bBEXqUkgVcizO4iELHtour+t
         bh6A==
X-Gm-Message-State: AOAM533o+9MCthHHbdnbVAqHygty+Jkhb9jizC6HTljIfHr0BAHq6lFg
	7jxQ2ajTP6ZrOfFgcptyMK6uaht/NYjsIaf6Isc=
X-Google-Smtp-Source: 
 ABdhPJxIcfKs6c8+hjnuEMnE3Q1Flxr2/PhHO6w2uieTsofaL4BQ3iH2rBB584IVtO8MppDoyrMCZa3gLDybbnFfaCQ=
X-Received: by 2002:a05:6214:509a:: with SMTP id
 kk26mr3876396qvb.24.1644339445159;
 Tue, 08 Feb 2022 08:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
 <CAMKF1sr=PMcRWpO3CPBjER9goDuLJKjqNiumGD04yQ1ijFyR6w@mail.gmail.com>
 <CAAnfSTtNJuK5mUYAct6EcnEMdf3HO-GS3nhZQLeeWmOdSyWsgg@mail.gmail.com>
 <CAMKF1srGSE3-gcoiCnDk+DGOrHrS_Vh8_e0_rrzU9-FbckWW-w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srGSE3-gcoiCnDk+DGOrHrS_Vh8_e0_rrzU9-FbckWW-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 08:56:59 -0800
Message-ID: 
 <CAMKF1sr4ZPxVXy3YO_CNsw5=uH=KXGJBs0rReNjKMPb85ck=GQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 16:57:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2957

On Tue, Feb 8, 2022 at 8:55 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 8, 2022 at 8:37 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > On Tue, 8 Feb 2022 at 15:21, Khem Raj <raj.khem@gmail.com> wrote:
> > >> What failure did you get when building for RPi? I can't make it break
> > >> by building it for non-corstone machines.
> > >
> > > Build it for a BSP which does not use yocto reference kernel
> >
> > Worked for our TC0 machine, which uses the Android Common Kernel.
> >
> > What failure did you get when building for RPi?
>
> https://errors.yoctoproject.org/Errors/Details/623682/

you are carrying
meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
which is not upstream I guess yet, RPI uses 5.10 kernel.

>
> >
> > Ross

