Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329F1CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 04:02:13 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.17982.1694491323437580883
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 21:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Da0lfREa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.208.174, mailfrom: jdmason@kudzu.us)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b974031aeaso88377411fa.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 21:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694491321; x=1695096121; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg5LQH1OUob3Qt14VMkKDxzhx9qwAqB1ifQvATUpF74=;
        b=Da0lfREaXEhZM/+LSujyiPoxFMhn6ARGfPVEjp8rf3MK51oa0h/+Kppp/7qD0bwTsa
         EHbFKQvdEgrnU50cySMRBu9H1hc3zT1aH0ObnsJzoPAy/T2G/4yFVZasjZZ7UIjJ+Qrl
         pGlK4tYjODx6CIkiEYw9HtlsUYFYMz76pe/I8zQjZ1ESv2UTdNPDVJ07O4PTjkH6fqD9
         aDERNmIa2849XHb1nbDCkwEazpuvpqzYmpn1iqclY/EJq1IPbraxNfvm02EGl0kg4VD+
         h8OnAA5ktaQRgu6CN6erJKI+GJ11Gvkn3Xg2aHWtnW+XZfj+hOU7WM7pXqudD0HssI01
         JC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694491321; x=1695096121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cg5LQH1OUob3Qt14VMkKDxzhx9qwAqB1ifQvATUpF74=;
        b=DRT5nMXjBaFr56W0P0B1K6gkorOqRnvih49r0PqwHMXRNNPc5Iew5TUq9mgSvwdBSE
         JY7sovXXrZiQqFP/z2nBmMS+rtoDWu8q0+y8hkcg1Azv9iopf6omHwuj8fa94m4ASoFr
         PmiL8GOSij2QSoe0iqGY/w67sBDpiKmdcnOR8rh/QssygR8ZxlPWmgPlLjuXK4YTJRI7
         tBevW8A/gSeVXvGQVW2eD8IEJ89um/eWTeOHWUgZl0im5Wln8zgxH9hdzAqPmeB1o+5Y
         VHMLOPDIVmImZBsdBQIup1ztKd2mD3h633iZwWN0BeU5B4dwnwW0Q5vhtCJ57yMdFZgM
         AI+g==
X-Gm-Message-State: AOJu0YwEr52aKUM9K12Xn/cGpf3Jqp9T9aeNBSpcQigqiYUkrpb3Ymyn
	wYa7PvVdUNs6SrW3yLJWBQge836upIhx/5akSVWHrQ==
X-Google-Smtp-Source: AGHT+IFBbgyN/+FpcEs9YszrM6k/iitWd7vJ7n9KGPpcUA1XNMjeik4yX5n8KFKUOsfq8i+VDIvv8AxJuKqxuByJHok=
X-Received: by 2002:a2e:b164:0:b0:2bb:94e4:49f with SMTP id
 a4-20020a2eb164000000b002bb94e4049fmr8958216ljm.32.1694491321268; Mon, 11 Sep
 2023 21:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230910163550.3900070-1-martin.jansa@gmail.com> <17840AA742C25184.29005@lists.yoctoproject.org>
In-Reply-To: <17840AA742C25184.29005@lists.yoctoproject.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 12 Sep 2023 00:01:50 -0400
Message-ID: <CAPoiz9wn0kQdsVogYJn-e5ApkAiw9G+2OxR_UCOTFxTaV7egzw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for nanbield
To: jdmason@kudzu.us
Cc: meta-arm@lists.yoctoproject.org, Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 04:02:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5039

On Mon, Sep 11, 2023 at 11:57=E2=80=AFPM Jon Mason via lists.yoctoproject.o=
rg
<jdmason=3Dkudzu.us@lists.yoctoproject.org> wrote:
>
>
> On Sun, 10 Sep 2023 18:35:50 +0200, Martin Jansa wrote:
> > * oe-core switched to nanbield in:
> >   https://git.openembedded.org/openembedded-core/commit/?id=3Df212cb12a=
0db9c9de5afd3cc89b1331d386e55f6
> >
> >
>
> Applied, thanks!
>
> [1/1] layer.conf: update LAYERSERIES_COMPAT for nanbield
>       commit: 2d809a7c3511b9fcb71f1b264184e7840a378adc

Actually, what was included in meta-arm was Khem's patch, not yours
(though identical patches, his was the one that made it in).  Weird
that the b4 tooling got confused.  Sorry for the noise.

Thanks,
Jon


> Best regards,
> --
> Jon Mason <jon.mason@arm.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5035): https://lists.yoctoproject.org/g/meta-arm/mess=
age/5035
> Mute This Topic: https://lists.yoctoproject.org/mt/101275923/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/leave/7218881/3616=
920/1111825316/xyzzy [jdmason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

