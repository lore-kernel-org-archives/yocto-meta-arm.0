Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D5C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 15:08:27 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.19216.1736780902722127902
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 07:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=oiPgemMp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.43, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2a8690dcb35so1296154fac.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Jan 2025 07:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1736780902; x=1737385702; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOkY0n+DOCH9Le9nYEKYKYuBL5HrrVjdwr3woOsVwiU=;
        b=oiPgemMpA7hkOXaRNG7Z9c+dvulSzbOGcyTco/AV235CASSThgIpSVL22O4ZZLW5Px
         QcrkGUOwOctm7Ry1EQErXcOKHMcjEsCnIO6PjpxPymMMRNvF43v2HcWq3dQ2hOIjugY/
         KBHPJ8ivDJq4G1fqr5FHTlcAWtx27QPxnm2qoFEVngKBqU/Ax92x49w7HrXcVk/jEUp6
         bZdAAd9dhJeBo7WATZEjDgrciQMW1Pvb66m/uQjGYxS9iqmG3T91y/Z2874z5xHAKqQ/
         n1B8ILR6dWkN4UsIRoSU2dq+HZKk1/pt1ph3HEcejptlupW7E4ioR6/UeBsnmJlY1oUx
         HcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780902; x=1737385702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOkY0n+DOCH9Le9nYEKYKYuBL5HrrVjdwr3woOsVwiU=;
        b=CsQVgt4yFvfqwqbBKan7UGSDskwabhBRHjEr6ZaM4GA965NFg0G0TOMbsYTZ3Rk+dP
         pWp838nNjUht14ZPIXQUzQ3h1eR7cAlGC1SKAL0PGzHIZUejxKmvM815+8AG6ZwPJkNr
         Q87nYQ9lrZNThF2mVAo9pasuq/65uH8WKTlcbeqE9CYy+m1nBAmIIlf44iJB8rbFFqIR
         7RU3Ape2i16R94TtVIgw5ewaoL8LRjhZhIueBxwLk2sg6xy8C3AE4EzSHlBT+iwvJrpY
         ofg4BVDks8K7ptu9INO8Lh6aGYbKsuOnsez/uMlvBrTaV+IzfLPQr2PBaqwp/qvxkNuU
         TZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCXfHW2z24RBd6etWM+1Dv5TJshJ6K1gheQuNy7E7kwmXrhCPU97CcaRCAxfPNLBXczf2+1VNI1gjA==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy4kMKV5SqURphCgrsDb4f6nzquNqMoj4LNj9dvhVppJtEEg4V1
	MItMJPwDPZsBS37ou8KmoRsXAl6F10+RZFkYlI/yfLsRWAbiZ97k6HsGSZfEt6zOWrWvcqGxbKH
	jbWt6dZyMDFpkLyX7IrH3imKz271z90MgmOya
X-Gm-Gg: ASbGncsEd83ainrUVtE/WJA35IKIspnML6HYn/Fku6qEnl3tgGBS/XrhgCib+DnwAp8
	5sCL3Vf8KCk+AZYnLAG/pdJJMKKHx5G3keAqVTg==
X-Google-Smtp-Source: AGHT+IEG2vGhaxq0Cxeq5gT7TOnzcxnONTr3I8KBKRvrDCXgu5Q5OW1X0RarrAryypO/abmXslZBvRAHXGytG69tEIU=
X-Received: by 2002:a05:6871:80c5:b0:29d:c832:840d with SMTP id
 586e51a60fabf-2aa0699a7dbmr13337016fac.35.1736780900630; Mon, 13 Jan 2025
 07:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20241217-tf-a-2-12-v1-1-cca762965260@cherry.de>
 <CAPoiz9wjKi+tD98g0BHPY_dezg9Us72VwfdAVPU_WsQmHmjVDw@mail.gmail.com> <a59de097-d14c-4e84-afdc-cceb4d3baa9e@cherry.de>
In-Reply-To: <a59de097-d14c-4e84-afdc-cceb4d3baa9e@cherry.de>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 13 Jan 2025 10:08:10 -0500
X-Gm-Features: AbW1kvb57iE9ulENwxhy8E-SWD1ANLCHDQom4jg_RAZWyGMx7nYqkSGpilrE17o
Message-ID: <CAPoiz9zaU28vetfAmr8ukuUoCEupKK3fddV=HC3iSc29QWjwTw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/trusted-firmware-a: add support for 2.12.0
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: foss@0leil.net, meta-arm@lists.yoctoproject.org, 
	Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Jan 2025 15:08:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6318

On Mon, Jan 13, 2025 at 9:51=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Jon,
>
> On 12/21/24 2:20 PM, Jon Mason wrote:
> > On Tue, Dec 17, 2024 at 10:06=E2=80=AFAM Quentin Schulz via
> > lists.yoctoproject.org <foss=3D0leil.net@lists.yoctoproject.org> wrote:
> >>
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> Add support for TF-A version v2.12.0 and mbedtls 3.6.1.
> >>
> >> GCC-compiled boot tested on RK3588 Tiger, RK3399 Puma and PX30 Ringnec=
k.
> >>
> >> 0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch is merged in
> >> 2.12.0 so no need to have it in SRC_URI as for 2.11.0 and earlier
> >> recipes.
> >>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >
> > Unfortunately, this isn't a simple upgrade.  There is now a hard
> > dependency on poetry.  See
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8666827497/viewer#L9246
> >
> > I was seeing it on all my builds when I did the recipe bump a couple
> > weeks ago (but I did a replacement of the 2.11 recipe, not an
> > additional one).  So, this is going to need a poetry recipe to get
> > working, which is where I left my attempt :)
> >
>
> I see this got merged without changes? Is there something to be done
> still here?

There is nothing for you to do here and thank you for the patch.  I'm
in the process of addressing the poetry/CoT issue, which I should have
done today or tomorrow.

Technically there were minor changes to your patch that I probably
should've pointed out in the commit (pinning everything that needed
poetry to 2.11).

Thanks,
Jon

> Cheers,
> Quentin

