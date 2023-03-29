Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28432C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 16:04:16 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.376.1680105851473552599
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 09:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LAoxBfgS;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id n14so15564526qta.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680105850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7zA5vkQ8zJMSL+0oIVLTuBprq1hfwNx3bztHj3AvNY=;
        b=LAoxBfgStcF51uIqzR/imuoz6Zf6eCpxUcU7zYWTkyvErTZ9GZxpoHH34J70UuK0qk
         D1jfCruelIxdN1mjwSFVvUpWcpvQAfpn8nVHoHbE05GYzieUaR6T7um64f+IID8mmEWi
         iiNDqTmwDXrlU4frDU24SUjadLlyVsWXaUc5MXXz+lcTWTGkx9gjBHLTy5l10PuHlaWN
         uuYuctu4gpkBRlx9315TTwAyjYutbK8DWfuakfQ9xueMtpx0+gVjBXtGTouKWp/ck+aQ
         4LrmRTXKbHAGiFT8l05NA/rTN/MZgWIod32L1a2VPGQwlVv8MMlCagMZTnehKA/u5uCv
         PTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7zA5vkQ8zJMSL+0oIVLTuBprq1hfwNx3bztHj3AvNY=;
        b=6YWHmPbuW0zQr9oIDvNp+dDSg0+HgCE1n0f6etdCTGiDQtqLHUNflFKrmhOuuiDLur
         zjmAC3VsOfmjjgXssSvPzF3LRsnHb3vy7z/V05utd7g3In/9bsiVYVxI9GfxbULbGUz7
         zGoxQg07W6sjLlJNoPm5dAOp0YwjttV+Zp7OlWS1wKxgpOridMmdWhgM+wnKmWg2TWtW
         L+P4aLIRRJknxHDQtvZ3unLwLQ0EdowkIxigS0FGfvwSf2TiEnZI0kQy5q3qxErHJ/tm
         6DW6pyUuL/nCmW96/wCcKrST72yD0Cu1Qt+SVQzVh6KIyP1g69SyhTVl7JozZ45zBgbr
         pgbQ==
X-Gm-Message-State: AO0yUKW4W7J32o/faeiqA9VYRheRTvF0L2rpLU9Jwh92nDIpJfIQP8Ey
	8KG8njbtLwV37aQYz1vCTlCGHKmF6j/kujz9BrpCs0sHFUg=
X-Google-Smtp-Source: AK7set8NHbp8uZSuHwyoAR2WmCw/TA5fuPUo7VyzNW9fM/JCiLixmRJOhke6jm3xX0JDPHv/8lYtJ0r3l9hhRkg5Lnc=
X-Received: by 2002:ac8:5f0b:0:b0:3d7:9d03:75b0 with SMTP id
 x11-20020ac85f0b000000b003d79d0375b0mr7819359qta.13.1680105850424; Wed, 29
 Mar 2023 09:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <1750E21A8E7AA843.29160@lists.yoctoproject.org>
 <CAJiuCce8Q7KjiLewZeB+mrJXRA8ZV_5B7aXdhtaaqHhiDVwe2Q@mail.gmail.com> <acebbf22-512c-f9fe-8167-6dd220db2557@arm.com>
In-Reply-To: <acebbf22-512c-f9fe-8167-6dd220db2557@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 29 Mar 2023 18:03:59 +0200
Message-ID: <CAJiuCccZ5sMpKhfQQGrer7VFk5jiCiZSuoG9sAHunxKHUByfsg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm/lib: pass the PATH to fvp runner
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 16:04:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4505

Hi Peter,

On Wed, 29 Mar 2023 at 17:39, Peter Hoyes <peter.hoyes@arm.com> wrote:
>
> On 29/03/2023 13:02, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
>
> Hi,
>
> On Wed, 29 Mar 2023 at 14:01, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproj=
ect.org <peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > When running an FVP machine the model executable need to be found
> > in the PATH environement.
>
> I'm trying to execute the FVP machine in Docker that will install the FVP
> in a location which is different from the builder machine.
>
> Hope it makes sense
> Regards,
> Clement
>
> Hi Cl=C3=A9ment,
>
> Thanks for this - looks like I broke the use case where FVP_PROVIDER is n=
ot set and the model is provided by the host? Seems like a reasonable solut=
ion to me.
>
> Are you running some tests against the FVP on Docker?

I've just started to use it, my builder machine (hardknott) releases a
package (fvpconf + binaries) and my executor machine runs a Docker
(fvp + runfvp from meta-arm) to execute the release package.

I don't use kas nor bitbake on my executor machine.

So maybe my FVPconf is missing something or maybe my executor machine
doesn't properly set something in the environment.

Regards,
Clement


>
> Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4499): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4499
> Mute This Topic: https://lists.yoctoproject.org/mt/97926508/4240582
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peron.clem@=
gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

