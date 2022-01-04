Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53159C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 15:39:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.8113.1641310764555942821
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 07:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Qq5zax9H;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id q16so76998366wrg.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 07:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M97ntBHm/pp3ozQOtGcSGRpeQzKb4SLg4O3aoYsd6Tg=;
        b=Qq5zax9HQVuJvGFTq0NcbBXbwBmoJiAGT66gL503+po1OsNuVO2PSIVYCJ014nldYn
         UKC3xHdxJUe8JOxfjeLk2fXcHoP8vh9MvYNpb9tLveSGgvDjRe6QpPkNHjt/l3g8f1IX
         jv10mtMlLucZuAzHrDfadzENXn70CmFyx2KD+K/TLEGaKpaMxPtbILElH7DCAXUJgRlG
         WeFvvJlKJ7IBwl7mEaVmZsWjxBRSXVafqQH/r419SYir/3YgvQgxzAqpC1Xe/PnO+Htt
         pY2xMhVdvgNQBAdEHFdX9pEc+OLmoWBG0v+pwKfEpMIEfCKvCWFpnY1m6aAxDoF2guf6
         srYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M97ntBHm/pp3ozQOtGcSGRpeQzKb4SLg4O3aoYsd6Tg=;
        b=lw2O5NEO4PHenSo/tjQ3QszmFSQ0C/M8Bbtmx0t9a9P0fIiRmZ1zT1dv2aoeH6cbtw
         5QlJfaoJaFaIfjtCeL3wfAEnb4+eGDgjSAqEB5shIll7wETx8bK8TEUd5w5HaqynGuEe
         QW1s2J5/7r6Z+XZGq1P4nUUGpnpzSgwIlCYoBup80pyHySo3YE7E34ufk+T+EuNOYUqb
         2oJqOio98ZEKDzBQoa75mNqRKnAs3GdJA0/+5vydjtS9evjmcOHQzAvN0RjREndGQnRv
         jjYhqN+lsCixUc3Qj5PH+w1WBVoNxRkVt/F1dIoG8W/UmAG38WeOy3PJpWF9zCbt+e3F
         mxIA==
X-Gm-Message-State: AOAM530WWTd/i6Fsj37+/9gP1w1LP4adUY9fp6gkK7Yz3Z949is+hEcz
	A+2hnXRk8GcLmu6guYoHV9uzEwmgkeoA2knNxQK1Qg==
X-Google-Smtp-Source: 
 ABdhPJye485pqExnVK8yw4i0C+BXDXWct6YwpYN/0NdpRkCIcGfTxqYYazJO43t1I4lHuPum0+MdmHj1+Yofun2K0ys=
X-Received: by 2002:adf:fc83:: with SMTP id g3mr42502689wrr.405.1641310762819;
 Tue, 04 Jan 2022 07:39:22 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 4 Jan 2022 15:39:11 +0000
Message-ID: 
 <CAAnfSTvvyx+2ry+KQV_vx1+t7eqH7NDkhqkaUgDzv1eHUPDZbA@mail.gmail.com>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: meta-arm@lists.yoctoproject.org,
	Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 15:39:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2781

On Mon, 3 Jan 2022 at 19:58, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
> we (Weidmueller/Linutronix) have a use case where gcc-arm-none-eabi needs=
 to run on a 32 bit arm host to dynamically build binaries for an arm32 bar=
emetal RTOS. Existing pre-built recipe cannot fulfill this, so I'd like to =
propose swapping this for a recipe that builds gcc-arm-none-eabi from sourc=
e for any target to run on, similar to Debian:
>
> https://packages.debian.org/bullseye/gcc-arm-none-eabi
>
> The other reason to do this is that gcc is open source: taking prebuilt b=
inaries for it goes against OE principles.
>
> I can do the technical work, but would like to hear opinions and feedback=
 first.

Considering that the Arm GCC is mostly standard GCC with some
backports, and our GCC is often newer, simply using the standard GCC
(if the baremetal is arm-a) with -nostdlib should be sufficient?

Ross

