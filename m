Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C7FC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 17:40:00 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.14566.1644341999699635930
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 09:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=vOL1UBps;
 spf=pass (domain: burtonini.com, ip: 209.85.160.176,
 mailfrom: ross@burtonini.com)
Received: by mail-qt1-f176.google.com with SMTP id e16so15374885qtq.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 09:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pb9p7OMMm2BVht7FOb9jm2MnXe+Fpu+0+WdusgSK2UA=;
        b=vOL1UBpsJwO0lxcjvbgO0SVDcEDRVlRdoZirsytfjVT32rlYc7YKmtTWAUjJ6NtEG6
         J71jUYgj4EzOJg/OMuUt+E8Qg2JT/LfKNjGq7guK1nzBmjoJWZAgEtZdhD83RhI49kXH
         HjL1w6qyiwi0zfl/Ur+tL6vwDBB3gknuatlDZQvjGMRFB8ijY7P2jVD5k1k/vbOqwblO
         WWrh9mBqciiZ3XpKS5bmVdVVTZ+wM7jHMCLSmysnEMZNfNjgFtdtYIYnEEBOpfIcpCXe
         d3aIPn5kxgHM0rGfHAOEYFsTB09TpZ+b/4cp+tnTGsKX2msVP+VRMMDqMvBneXV+uYMY
         SdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pb9p7OMMm2BVht7FOb9jm2MnXe+Fpu+0+WdusgSK2UA=;
        b=t+J6qKJ20x/N90XlBLyj6SczC8+zRa2txt5xHxuQ/7/hyIMO9rBgQQ4rlZGw6b5pYB
         CRrRJPV6ZNst/Sar4tJEXUvtYRBURcdn8rZ6WG6ONnPkvwx/duDqkDm284RGozqBZexN
         DKuQlyZ1N4a6pwlFusnotYTxklX6756Rwaz1xSCNsPUQu4A1SiVJmTlMEqSCiuwKIxRN
         zi8DGUR1SZvW1pmGFWmt3PxL9tLcZP+82CLdfsJK1Afi8KmfRJfErw9i7xUQE49ZnA6L
         /++02IHsimYlqr7bXClgQvN6enwvnQ0XhnWlx3u0HQYFAMsWAzVNFgWeocF/Xu/49rCA
         5SXA==
X-Gm-Message-State: AOAM530BjEb1Wns4eoqQVn1gfRIAK5eXLJkASQrm4fhvyLMDaFhrKQG/
	pIBx1vBxFUIaJThluWhMiA80kz0CaGwefbza5GnkWA==
X-Google-Smtp-Source: 
 ABdhPJz4kKHi7E5zdyO3AtMylVDT5ewY0K36nLdA9b3JODgJYSGXrl9DwDM0mMQhbvyLotApg9TgivPt0XbCw1+ex/M=
X-Received: by 2002:ac8:59c6:: with SMTP id f6mr3692733qtf.343.1644341998640;
 Tue, 08 Feb 2022 09:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
 <CAMKF1sr=PMcRWpO3CPBjER9goDuLJKjqNiumGD04yQ1ijFyR6w@mail.gmail.com>
 <CAAnfSTtNJuK5mUYAct6EcnEMdf3HO-GS3nhZQLeeWmOdSyWsgg@mail.gmail.com>
 <CAMKF1srGSE3-gcoiCnDk+DGOrHrS_Vh8_e0_rrzU9-FbckWW-w@mail.gmail.com>
 <CAMKF1sr4ZPxVXy3YO_CNsw5=uH=KXGJBs0rReNjKMPb85ck=GQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr4ZPxVXy3YO_CNsw5=uH=KXGJBs0rReNjKMPb85ck=GQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 8 Feb 2022 17:39:47 +0000
Message-ID: 
 <CAAnfSTuLEqiinzsB+N8E5TrFk5B0=iSJkZ2SCmpS6MP3NqgzQg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 17:40:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2958

On Tue, 8 Feb 2022 at 16:57, Khem Raj <raj.khem@gmail.com> wrote:
> you are carrying
> meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
> which is not upstream I guess yet, RPI uses 5.10 kernel.

That's a U-Boot patch. :)

But I did notice that the target I tested, the TC0 machine with 5.10
ACK, is also patched with the FFA driver backport (which is 5.14
onwards).

Not sure calling out rpi specifically is the right thing here as this
isn't RPi specific, but I don't fancy listing every BSP which doesn't
have 5.14 either. Neither is making the recipe EXCLUDE_FROM_WORLD a
good solution.  Hmm.  I'll have a think.

Ross

