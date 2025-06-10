Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD25C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 21:32:52 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.207.1749591164049456102
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 14:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ae7NznQN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.170, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-407a5b577f8so1458608b6e.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749591163; x=1750195963; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhCIVllPCdkRUGy5IYqjKgSm/u3WLkxgm8UpLp0E2HM=;
        b=ae7NznQNPs4ojo8zIT/f7+tM6g86Eqo99wpHtTkJbRloKRgjT5DTMILNcQT7pKyUJN
         2UOESICwuQCiECKBMVStVuPe/c9yJ5j2QvdJ83gL+iVwhuzjVVeV1UcA7XCwWp0vYPyy
         rud+uEWL7JdUYjvlrLuQ0DaKcQu2ttGMHbTX+SBhcdL5T79GsOjAXjQdCnlxsubyNycF
         wE1wYs3hWoll2w/R6lQq+fwqFz2WHTY+IfSq/oFMd9Ub90gzbQTBNYjFZ7QkLhxlA0l2
         5Km7fdvYbFoVfH3GHZ74+4XSk794Szz73PA5yNpVktRjGXzX+MFBna00ssxiC5LqdBVd
         w1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749591163; x=1750195963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhCIVllPCdkRUGy5IYqjKgSm/u3WLkxgm8UpLp0E2HM=;
        b=v9oD1OhZyy5hzPnQTAypbXcgL0qIqqzY7rMxiaWA57u7hBpkux6rLSnE8GxltzQKkz
         0IHAYWzV8Xxp8QFlDlNAqsSOgRj1gC86Y8hHdi7tqsmX+vk/b28NZM60Z9COi/gRSJ3v
         Ou1olSxFtPv+Pk6oNyHCxIlocIWrw7To42v+Jmfn4MU1R4puvoqfsSi3yyE3bDs7Maej
         MtwvYffkMeA9XyBAARt0ff8AL25ivQCO+/0e0or2EqYocSt75bkrtlTVpEq5CtspRDzK
         ht9k3XZZEBtlpgUtN26NKF7cBqnte1iUWQJP/octkNlYK9DvSuRLuIDqN6rUgwyOOb37
         WYHg==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZKJPih9n4FmgiDKr77mLz6pondbY4mx+W3wz2MSepMutYkHYzv6ifyWVnA2DkuuSgbuW+krpsw==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzOk2iymbaeR8YDy3LexUHWR66hVUh4XRHDXmWf+RIqM8EFYuEu
	V12Xkpa/Rn8/7YuVoPH7fUAeSseXCKO1oUGeb0IXPJvQ9jArjow5kq12P4xUw1UFxIpEpzCnYUo
	8LikM2pwoQVTkX9kr6nM6wDMg7uH7x1f2NNg3b/EM
X-Gm-Gg: ASbGncvfOSuWABHii4sdopoYyLjLiiluLb1q+8WIsnczFbJShXOvUDvXiCmV6HH4vxy
	ysTai8Npmthn7lIoI3wdvEt7SEmNywOk3fLPCGfvYqV5AeP/01d/F/ifdFZxYHvN264AyPSRjxz
	pWF+KtT1ZXF0kt8EW37HPFSe/K+XyTxz9gg6cUB/UdDs78S9hm08ROVQ==
X-Google-Smtp-Source: AGHT+IF9N56wV+QrbdRjk8SfLzahDjTCj2qaQXCLfrCQ42ZjkSkTaWvDX+39SNlVakN6MtobDJl8xQmpdrUsiqXlIHA=
X-Received: by 2002:a05:6808:3509:b0:3f6:a476:f7d3 with SMTP id
 5614622812f47-40a5e103017mr246028b6e.9.1749591163096; Tue, 10 Jun 2025
 14:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
 <09231705-62A7-4D39-B395-D670B097BBB0@arm.com> <CAHw2UgCz_nCWMLJkSRFu6mYza=_x2i8-a1bPfF+nCCAWxWoC-g@mail.gmail.com>
 <CAHw2UgA_vK3Qk2bSu9kJ23R3HwPHM4m+kDRyzJG5OwpTfCftcg@mail.gmail.com>
In-Reply-To: <CAHw2UgA_vK3Qk2bSu9kJ23R3HwPHM4m+kDRyzJG5OwpTfCftcg@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 10 Jun 2025 17:32:32 -0400
X-Gm-Features: AX0GCFuwLc9MWqwluE7dlBeqQU_75utYqkUndyObm_3MALNSkGoSC2C7Xz1PZJw
Message-ID: <CAPoiz9y=COjMc9Sk7nOMXhBTc532AJE7bZGUbKBVuXLiN70sQA@mail.gmail.com>
Subject: Re: [meta-arm] fvp-base doesn't support armv8.2
To: marek.bykowski@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 21:32:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6541

On Tue, Jun 10, 2025 at 7:49=E2=80=AFAM Marek Bykowski via
lists.yoctoproject.org
<marek.bykowski=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> I forked off the scarthgap branch some time ago (SHA1 commit and date
> below), parked and recently resumed my work on it.
>
> $ git branch -r --contains a8fe9d22eaefc294f91096c6a32663e2f4ab3b10
>   origin/scarthgap
> $ git log --format=3Dformat:%cd -1 a8fe9d22eaefc294f91096c6a32663e2f4ab3b=
10
> Mon Jan 6 06:00:11 2025 -0500
>
> My goal is to have a Cortex-A55 simulated which is armv8.2.
>
> I followed Ross's suggestion
>
> meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
>
> -EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4"
> +EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D2"
>
> and it worked. Seeing the model booted up to Linux prompt.
>
> Connected with arm ds and the midr_el1 shows me this MIDR_EL1 0x410FD0F0 =
32 RO.
> Implementer Arm Limited. 8 RO
> Variant 0x0 4 RO
> Architecture Architectural features are individually identified in the
> ID_* registers. 4 RO
> PartNum 0xD0F 12 RO
> Revision 0x0 4 RO

It's much easier to look at lscpu output or /proc/cpuinfo on a running fvp
For example,
# cat /proc/cpuinfo
processor : 0
BogoMIPS : 200.00
Features : fp asimd evtstrm crc32 atomics fphp asimdhp cpuid asimdrdm
jscvt fcma lrcpc dcpop asimddp asimdfhm dit uscat ilrcpc flagm sb paca
pacg dcpodp flagm2 frint bti
CPU implementer : 0x41
CPU architecture: 8
CPU variant : 0x0
CPU part : 0xd0f
CPU revision : 0

> I guess for the ARM AEM models there is really no way to read it back
> if the model implements version 8.2, isn' it?

I'm sure there is a way, but I don't know off the top of my head.



>
> On Tue, 10 Jun 2025 at 12:42, Marek <marek.bykowski@gmail.com> wrote:
> >
> > Thanks Jon and Ross!
> >
> > On Mon, 9 Jun 2025 at 15:54, Ross Burton <Ross.Burton@arm.com> wrote:
> > >
> > > On 8 Jun 2025, at 21:14, Marek Bykowski via lists.yoctoproject.org <m=
arek.bykowski=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >
> > > > When I simply change to "require conf/machine/include/arm/arch-armv=
8-2a.inc" and "FVP_CONFIG[cluster0.has_arm_v8-2] =3D "1"" and "FVP_CONFIG[c=
luster1.has_arm_v8-2] =3D "1" " the FVP_Base_RevC-2xAEMvA doesn't boot at a=
ll. I do not see even a single line of log even from bl1. Would that mean t=
he SW stack/Yocto doesn't support armv8.2 for fvp-base model platform?
> > >
> > > If you=E2=80=99re using a recent meta-arm which sets the base-fvp to =
v8.4 cores, then you didn=E2=80=99t also tell TF-A to use 8.2 and it might =
have been trying to use 8.4 instructions.  See this in the TF-A recipe:
> > >
> > > EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4=E2=80=9D
> > >
> > > Ross
> >
> >
> >
> > --
> > Sl=C3=A1n,
> > Marek
>
>
>
> --
> Sl=C3=A1n,
> Marek
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6539): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6539
> Mute This Topic: https://lists.yoctoproject.org/mt/113539838/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

