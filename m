Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.2480.1592854155120162863
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 12:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=YVWYj6Hg;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id i3so20704046ljg.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Jun 2020 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ExhXNHTqHmykwPGuGNjt+JqPu0Pcle0xNKgnrgzTh00=;
        b=YVWYj6HgVnJxgCzYwUQ+kKRmnOaxzL8kZ0ItZNuD/0NFWlmQz9NYrhlLPuz5Kmh6II
         D1dMWi61Z+0g3rst2Iy+bcWgYYEYr8tznwy1XSD/+Xd1dEu9962IAseyiax4BTS1UdDW
         1mIE+0Udh8+0qLFxGcTecY71nsMoeHueFMzMPL0Hl0YvyWeZgseLSGA+Z5n+k8tl60BY
         LQ9tPIMcG6xue5VKUz/7sSD/DITJUAnnPMv0E+peJNAaXJiaZzn6qy7VBcKyfXCvDvt0
         kC5kdz+5zcjkKiYyITJIKjlRXJ9TcYyLXwqO/2q7r438yDwttcSGZ5sKQ7+0AFFUNpa8
         OLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ExhXNHTqHmykwPGuGNjt+JqPu0Pcle0xNKgnrgzTh00=;
        b=Yj2uRm9469H3OcbP5nxrA63d9u0AsQJ5HyiCqzVT4uqTueBd4uNK8krkiO48hml3Kd
         +Lw9e1TXwtPoMmS3DZohgE0KSz3GR+gmmzxNrUuQEojCHL0nZ4SZSEDgJhGeSQFeuF8V
         B1EJimxLg3yCtx4LtN974KdDaF3h4CR18s+Xeg5bPACtu3AJhffnjK8e2/AeOMTC2vmf
         RFQuooKOmn+duQlI5lWfrVnkUUNpwzQ9KsvaYU2vGMFVRLPMX5ivMFCJ+umtX3UYzG0D
         nr3AWyytnjyuu5YMMbo3EbT0FuRVYzeEqVobTWz3QWot1M5sH5hQbWvp+NczxEV0HkSN
         bXeg==
X-Gm-Message-State: AOAM530DIS2cWkLvZAez/TIdpdBMllGn5aG+CD4ogcf+Z5edThmHnWlB
	Mz8nQIkjAXTn6hjvpwZUwCifYJloHddJpwJAlC+pRg==
X-Google-Smtp-Source: ABdhPJwBjHuAMe+DqLax/bO0GU2cdjouj8TJ3PvZs2x+wjFqZKP2S6z7SegezpmBx+vFT/mG8Apbb1tBlMR7UlmEE6w=
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr9124665ljm.186.1592854153118;
 Mon, 22 Jun 2020 12:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200622071401.2570-1-gabor.abonyi@arm.com> <20200622071401.2570-5-gabor.abonyi@arm.com>
 <CAAnfSTsX81c+YWMV1X1cNFaKfVCkB2gP0bykdwwondGYDBUDxw@mail.gmail.com> <20200622184355.GH17660@denix.org>
In-Reply-To: <20200622184355.GH17660@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 22 Jun 2020 20:29:02 +0100
Message-ID: <CAAnfSTtxQ3_OST4mk52GNtdaNUWhV3tARX2SfM6k2RaUbrRrtg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
To: Denys Dmytriyenko <denis@denix.org>
Cc: Gabor Abonyi <gabor.abonyi@arm.com>, meta-arm@lists.yoctoproject.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jun 2020 at 19:44, Denys Dmytriyenko <denis@denix.org> wrote:
> > Looks like it's time to start that multiconfig experiment where we
> > just build another cross compiler inside Yocto.
>
> You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores and Armv7
> Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross compilers and
> use those for corresponding components. TF-M sounds like a perfect use case
> for that, as well.

Awesome for doing it already.  Does it work well?

Ross
