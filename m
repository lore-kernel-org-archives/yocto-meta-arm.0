Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAACAC61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 07:13:32 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.48051.1675667611259804896
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 23:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g4SM0Yqb;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j17so16337101lfr.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 23:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58PBQyaRATP6fWheZvN9oX/azQHyIQQpo2bqB0BD5dg=;
        b=g4SM0Yqbe+8J5mjCq7w0wRopdlJYJt3Yl04dltCrFQHTqf9AeodrKu0DIvcZnJcKES
         GDdV6he3lvvSK5cDFrHph+XajyTSBRlHlliJ3RfkfwZVAcIpwjrmM+Ik3hw8YMz7LTwG
         3gHaTPCoEFhDPh2nczOuldmK1cVh1obefQnykCh73wWtmh1YsVwyo7rOHx16xi36O31Q
         qMCJ4AfJP1hiuIRZgXEeOAGOUj+qd6/L2az0POa7b0WAu/g1f71jNjNG0kSAw8Cz6O6k
         D+7sBdXblJnbttmXnxM0Hq7t6sYpt+UtqeXu317eywja1MBfjyjkw+KQ4LKYd4QYi1UB
         3vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58PBQyaRATP6fWheZvN9oX/azQHyIQQpo2bqB0BD5dg=;
        b=mkotbTcjXfeS0sY+KDKxmQexE4d//m3BU+WjHBsP/g8XfNbHDbgBeETfuddSazFd14
         kBhfAvvQRCNDo/THt3zcLJGBZY6O7hqmXXDihHhIPS7go1hcUpy6Jtsj2waTjB356otd
         z1OQ/n1SEn+xKDeZsQLLerPz/ZU6RdtF5mIoKM4Aw8OdNwX6G8Wyzex6F/Dy3F4wnvns
         YztoKsFG740e48tKlcseevjRIuJdxxzPWOBIUFzDqbh6dCnvBRlN+/erQawHxMv7bXB8
         rzyWSR8n9yL50AYrgGt8ysuxdqrjwli/5ogbK+ICeMuVDQc5nsLOAN1eKxNj0pSqbef4
         nsBg==
X-Gm-Message-State: AO0yUKXg7cCgFjhdAfv5DMknrGIxMfdBnj80TuTmIS8DcSCvJ6eFmFbW
	WIzETYSQBXJLhc9L5Afv9FvYBA1dzPdIR/SPvmaJfLgvKBQ=
X-Google-Smtp-Source: AK7set+s04qFrgdHcKwdYdtDjIUxtcZ3I2sZhjZE9MrQar/s2DitZWL9TTCnPTZJTUwLd50SVOynkspl97gGRzfOrik=
X-Received: by 2002:ac2:43d0:0:b0:4d2:e530:d53c with SMTP id
 u16-20020ac243d0000000b004d2e530d53cmr2919547lfl.8.1675667608890; Sun, 05 Feb
 2023 23:13:28 -0800 (PST)
MIME-Version: 1.0
References: <MLAd.1675648403918240445.gs7D@lists.yoctoproject.org>
In-Reply-To: <MLAd.1675648403918240445.gs7D@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Feb 2023 08:13:17 +0100
Message-ID: <CANNYZj_kWQAfWwWXsks0tyJ-9JbR_mC5z_mfWqfs0QeZ6rzrTA@mail.gmail.com>
Subject: Re: [meta-arm] Ubuntu BASE on embedded ARM platform
To: kai.schade@upower.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Feb 2023 07:13:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4368

Can you point to examples of such recipes or layers please? Perhaps
you could ask them what they did, rather than here, because frankly I
have no idea what you're talking about and never seen or heard about
it.

Generally, Canonical is trying to sell the idea that people should
move away from Yocto and onto Ubuntu, so I'm not keen on making it
easier to to use their stack with yocto.
https://ubuntu.com/blog/embedded-linux-project-i

Alex

On Mon, 6 Feb 2023 at 02:53, <kai.schade@upower.com> wrote:
>
> Greetings everyone !
>
> Sporadically, Ive seen dinky embedded boards come with recipes supporting=
 Yocto builds that generate Ubuntu images (typically 16.04 or 18.04) which =
are based on Ubuntu BASE.
> http://cdimage.ubuntu.com/ubuntu-base/releases/18.04.5/release/
> (note the 'ubuntu-base')
>
> These base images are less than 50MB in size. Quite compact but very usef=
ul to work with.
>
> I wondered if anyone has an insight into what the general approach would =
be to incorporate the ubuntu-base images into my yocto build ?
> (The alternative is to reverse engineer all those .inc .bbappend .bb etc.=
. files manually, which is quite laborious)
>
> Ubuntu's website, unfortunately, is not very detailed in regard what the =
base images contain.
>
> So, Idk what changes I would have to to to my yocto (the destination) , n=
or what Ubuntu sticks into they base-images (the source).
> Thereby, indecisive which side to look at first.
>
> Hence, posting the question here - maybe so. has thought about that befor=
e.
>
> Thanks !
>
> P.S. Ive also looked into customized ARM server images Ubuntu offers ( ht=
tps://wiki.ubuntu.com/ARM/Server/Install ) but there, too, they are quite t=
ight-lipped as to exactly how they generated those. I assume thats b/c they=
 want to sell Canonical consultancy, resp. customized Ubuntu Core implement=
ations. But, again, Ive seen these small EVBs, baked the Ubuntu base images=
, tried and tested them, I know it works. Therefore the desire to put that =
onto my other board as well ^^
>
>
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4367): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4367
> Mute This Topic: https://lists.yoctoproject.org/mt/96774589/1686489
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [alex.kanavi=
n@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

