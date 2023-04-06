Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1677FC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 15:20:16 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.161289.1680794414329011035
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 08:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NGNOIiTT;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: peron.clem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id h8so12237590qko.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680794413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GwGORRWcd5AlH9N2AUu/IsyDvxUhUi5w5y3UfPjb/0=;
        b=NGNOIiTTpgDBfL0CJAlzbWSRGKfVJI/qwinkDV286tyCR+w6oh4jrDYbsZ50PagAwc
         01UESurXDTpAWsYYXbVbCrhCsyOZtGS9TYeemX4OZK4SOqxhDVxLnxU63T88hVIjw6qq
         Im2/vjeFkeKk9rtB2rftcqA/GxY00xmPWbg5Pba2qOjusCopvF8Hxh6Wt8D96YxbTjcM
         KpIOR2/iGktf5zGKCSNBp2Kmx/MAdN7oggFWkpqO2Rz4alByzso2y1izTjBQxAWjDbwi
         yGRcy+cGie6TZt+CqCmkrYOUtMU2jGb1n5aPwjQBmehD5P3fQ+jR2Wj6mHAMMdLckXcQ
         7ATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GwGORRWcd5AlH9N2AUu/IsyDvxUhUi5w5y3UfPjb/0=;
        b=ZJjmNO3HtS02syMzpfwyDz/9zD8AOKzfbloRNPvkraTh4FSGwOE7Wkr7kN4kwoSC7G
         tsAxjhAno9fexWohfSsUrhMbXv74s5XAb9aWeSs0LLflbycbhASQPw8qAQ9FysrXQN0Z
         7Io5UCU21IQAmluU+UZUsABBhZMi73v9qdbMTL7+JP9fyibjEn1fYJ3fuYlA+PEHM1mC
         mCcDQyoZyhxV48Qc8M2zAVg76tWXhG4inwHTxHhLuIzptvLX1cypW06Zk8Zgn2XCPG5a
         DmFIuOTr7a6qawdofYfWAB0CmnSBHPIjMATp/LfRmbkJdBIJjU6PKj2T46HM5yJYIQ3S
         7JWg==
X-Gm-Message-State: AAQBX9fl40YOEI2yDmALwmHX2FvpQ2WnLiQdx810J+wzoKylaKWvqaY8
	wF4T2ppSCxCiGklDhBJFmAmLwfpMJgOezfdEkgbO6bBv
X-Google-Smtp-Source: AKy350bJZjOT0QdG6kRsg8eSMERztTQzGDX7fbh4AbHGAAJGy72SB50wJzAd6eBOybHXPiaRZ6eY+ySf6FWxTycya/s=
X-Received: by 2002:a05:620a:2596:b0:746:7857:d28b with SMTP id
 x22-20020a05620a259600b007467857d28bmr2416160qko.14.1680794413209; Thu, 06
 Apr 2023 08:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230221102509.6601-1-peron.clem@gmail.com> <210CE50C-AEF1-45A8-AD65-CBA78F406959@arm.com>
In-Reply-To: <210CE50C-AEF1-45A8-AD65-CBA78F406959@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 6 Apr 2023 17:20:02 +0200
Message-ID: <CAJiuCcectPDE=zSuHa9ck1XZfZPsWpM9fG-NTzC0ebroXVtgeQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator-daemon: bump to 8.3.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 15:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4559

Hi Ross,

On Tue, 21 Feb 2023 at 23:07, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 21 Feb 2023, at 10:25, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.=
org <peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
> > +++ b/meta-arm/recipes-devtools/gator-daemon/files/0001-daemon-agents-p=
erf-fix-no-matching-function-for-call.patch
> > @@ -0,0 +1,27 @@
> > +From 28f93c8fac4b3565db757010de01974caff74c8d Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@outsigh=
t.tech>
> > +Date: Tue, 7 Feb 2023 13:03:29 +0100
> > +Subject: [PATCH] fix
>
> This patch needs a better explanation than =E2=80=9Cfix=E2=80=9D, your Si=
gned-off-by and an Upstream-Status (is it a backport? Should it be send ups=
tream?).

I think it should. I will open a MR on the gator-daemon github.

>
> > -LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> > +LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
>
> License changes should be justified in the commit message.
>
> I=E2=80=99m guessing this is as mxml is now a dependency and not integrat=
ed, but I=E2=80=99m guessing.
>
> > +FILES_${PN} =3D "/usr/bin/daemon"
>
> FILES_${PN} is old override syntax so this won=E2=80=99t work and should =
in fact produce warnings at build time.
>
> You mean FILES:${PN}, but ${bindir} is already in the default value for F=
ILES:${PN} so this isn=E2=80=99t needed.

Thanks for the review, and sorry for this mistake. I'm still running
on hardknott and didn't catch it. I will pay more attention next time.

Thanks,
Clement

>
> Ross

