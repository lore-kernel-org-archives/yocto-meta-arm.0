Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B87AC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:21:13 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.12566.1644333667536524302
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 07:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qJ2xpjCg;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id s1so14936079qtw.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DKi8wod3D6uVdxfZZEI7OnbVoRMLm1UIJSraq3ulwUg=;
        b=qJ2xpjCgfDTGmhLfeYudCvvEW/xhclnb2w/ilEG9Mv3PRCvKNUZuzEbC6+LuGf3pdt
         7qtMxRJBWOeQpVXC9zKEtRL7CLZn03XdDbJuafMD775ZNieoqrFiYAiWLztBrtSjn2PI
         1zXuJzm8ty4eVKdqJjEKxbP7cJvEK3A+IrOaA/plHXc3BsIIc+j+QkmQNK0lwoaE6wHh
         sbFzKlDZYhxjQ8n8/pDvpRa6FVKsggh4JzlDbA9RtLXS2wakGaR1+Z+djcHwHZCaGblG
         KfjVHP+t+EbGUzQn1ds8lfVwFGhuFMh5QzH7jwPI/ZZJxiZz8b2H9tWtC8ZM942+MK18
         6jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKi8wod3D6uVdxfZZEI7OnbVoRMLm1UIJSraq3ulwUg=;
        b=jpJq2CLn9UFziTUDZ0R/NiQADZBpTDJ++dReYElu3u1TpVAFCUSpNFkfD2Dq5xxRPS
         YcunNncg2ymUJLdJ5tYSV7gNtaHX3LuPlKwp+RWZshPeTJQskqWdJq8RIp8VyrLv1JiC
         9r9GhLBxl9ecR3c1pLmBARgT9s8PGc8seLUdtKSrpcZrxiYN6YSHEyJG5PkqYKiVB/Jt
         UZBoIHpoifFULYRBlZFTeTMv0FtB9CHMhHBA5MVYSoa64LIXdHqQEcCufXW64F9RFHPx
         MJfjDsvvuRagDfYUqmxEGUmWtE+ErugEjS79EFFfIjsRBCxpqG34TvPQlqNDOjcBtiRQ
         oDpQ==
X-Gm-Message-State: AOAM531/PeuHQ/tpDcXAFkmdHSZ50E4WdE7y921nPc+mUvbKSdFQ8lpb
	3Q5MjMh20VeNlmSkGeYhtz6997yclgyu183K4L4=
X-Google-Smtp-Source: 
 ABdhPJzdodLmElnnY9uWiHJUNSRy1JPXZ0lrKWBu0c/LVIOprSad8+roOn3rkm7SIot4SbVfjuwyk4qCvuEvwCWfuCQ=
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr3255889qty.229.1644333666506;
 Tue, 08 Feb 2022 07:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 07:20:53 -0800
Message-ID: 
 <CAMKF1sr=PMcRWpO3CPBjER9goDuLJKjqNiumGD04yQ1ijFyR6w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000159e7105d78344ef"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 15:21:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2954

--000000000000159e7105d78344ef
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 4:30 AM Ross Burton <ross@burtonini.com> wrote:

> On Wed, 2 Feb 2022 at 05:52, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > The module can not be compiled without patching kernel
> > and rpi machines use linux-raspberrypi and are either arm32
> > or arm64 machines, so this module tries to build in world envs
> >
> > This helps meta-arm to live in multi-BSP envs
>
> What failure did you get when building for RPi? I can't make it break
> by building it for non-corstone machines.
>

Build it for a BSP which does not use yocto reference kernel


> Ross
>

--000000000000159e7105d78344ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 8, 2022 at 4:30 AM Ross Burton &lt;<a href=3D"m=
ailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Wed, 2 Feb 2022 at 05:52, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; The module can not be compiled without patching kernel<br>
&gt; and rpi machines use linux-raspberrypi and are either arm32<br>
&gt; or arm64 machines, so this module tries to build in world envs<br>
&gt;<br>
&gt; This helps meta-arm to live in multi-BSP envs<br>
<br>
What failure did you get when building for RPi? I can&#39;t make it break<b=
r>
by building it for non-corstone machines.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Build it for a B=
SP which does not use yocto reference kernel=C2=A0</div><div dir=3D"auto"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
Ross<br>
</blockquote></div></div>

--000000000000159e7105d78344ef--

