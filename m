Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD40DC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 18:12:28 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.14992.1644343948251983557
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 10:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mAwd+Z2u;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id l14so3170479qtp.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 10:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1n0lPHeQg10QPgQwqtPGQbcf9/AJJO1xvQpK8omVJVg=;
        b=mAwd+Z2uJgO/7caFdlKk6mQzqtQSkp624aqMYZf6pdrLQc2+o6vU1/tOBANr7sF+/k
         rJhJAVn5nT6PdFomK5Wqi2hLquFKWgDnCI/HpsicL6EWncj07F6xUXaiog3j5zOR0qs4
         6OoS8DMZ8sPkX4P+RR+PcLrCtsvaeCd/skBwM3a+s7nw+1/tRzsKlq3UBzmheMOzohLN
         S+A8E8E+EgTWXJb3A1+942i66z3Cs5piO9FK1eCnlCqZ42Qf91VgBGyHptOCXMt8mO01
         mJXYjgsvalCC1+u45PZ3qKdPlHt80VPSks4Rfeq4S4RLYn2ZHd1o0BagV3PU+KaiZUj0
         T/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1n0lPHeQg10QPgQwqtPGQbcf9/AJJO1xvQpK8omVJVg=;
        b=E8io2fYnXsHeT9c2Y5bBIGh2dJDS7UyZAxq8xQASl1Dt41bbW/VsirG+74n5hvz9hT
         CxAJIqUAsvotIrvgHDQmu3FPPVz8PjkxvnBLTj7SbLkCPEPF2xjRWaP6jjJs8DJeCym0
         INt/kWm6vGmLS0sm9j0p89m3Q4NRM5Sq60OQJ9hScwy4wGNn1s94f0ubc716G3zgl8wI
         R7MQEnSbq8smAeY+wmGvcNdTxx9t1S8lTluRLg2AXjztuFhmKojOEszSNfzcnNpgP/gN
         C/yEVPeOdPyW290Yh7r2aDAFa1cogT2lmiJMA7dstmivlOIPQXoHbWawIiV6V0315mD4
         VupQ==
X-Gm-Message-State: AOAM533WBJMDDKkCpY2/fuRLyETays257JLyz06S21uUDi64oQerBufR
	nyu1Q5F4K8Bezx0IglVghTSRCIIP9f7IuuPcI7G8dtvxbBo=
X-Google-Smtp-Source: 
 ABdhPJxARaXrNHQrTHQp1FohI2UWqiSVOhITMEWtAARuIv3AEAO+dC9Gdqs9FzlTJoysPDvYrofDhdbAiXVdmo7F4Bg=
X-Received: by 2002:a05:622a:15ce:: with SMTP id
 d14mr3966866qty.330.1644343947251;
 Tue, 08 Feb 2022 10:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
 <CAMKF1sr=PMcRWpO3CPBjER9goDuLJKjqNiumGD04yQ1ijFyR6w@mail.gmail.com>
 <CAAnfSTtNJuK5mUYAct6EcnEMdf3HO-GS3nhZQLeeWmOdSyWsgg@mail.gmail.com>
 <CAMKF1srGSE3-gcoiCnDk+DGOrHrS_Vh8_e0_rrzU9-FbckWW-w@mail.gmail.com>
 <CAMKF1sr4ZPxVXy3YO_CNsw5=uH=KXGJBs0rReNjKMPb85ck=GQ@mail.gmail.com>
 <CAAnfSTuLEqiinzsB+N8E5TrFk5B0=iSJkZ2SCmpS6MP3NqgzQg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuLEqiinzsB+N8E5TrFk5B0=iSJkZ2SCmpS6MP3NqgzQg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 10:12:01 -0800
Message-ID: 
 <CAMKF1srifPMLMnddOzTC_gU-mO+rjT7zTx+qV=nx0DfMqM_-9g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 18:12:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2959

On Tue, Feb 8, 2022 at 9:39 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 8 Feb 2022 at 16:57, Khem Raj <raj.khem@gmail.com> wrote:
> > you are carrying
> > meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
> > which is not upstream I guess yet, RPI uses 5.10 kernel.
>
> That's a U-Boot patch. :)
>
> But I did notice that the target I tested, the TC0 machine with 5.10
> ACK, is also patched with the FFA driver backport (which is 5.14
> onwards).
>
> Not sure calling out rpi specifically is the right thing here as this
> isn't RPi specific, but I don't fancy listing every BSP which doesn't
> have 5.14 either. Neither is making the recipe EXCLUDE_FROM_WORLD a
> good solution.  Hmm.  I'll have a think.

needs a kernel version check perhaps in some ways.

>
> Ross

