Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF389C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:32:05 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.21198.1716301921185477615
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=yIcQAN9H;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.48, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-24544cb03abso1965252fac.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301920; x=1716906720; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEywssUx9WDAKlf86Cll8akMvaFFDKywRUFKysA3zGs=;
        b=yIcQAN9HUusMbgurF6rBzmGB9ZPHCOeHaZTHDEZLsNyltNmqMW9Ua8lpV4c3O+UAAl
         omOyD9pTneClxgPDlVHODqTM78R0ZZwWZERWku84E6/jKqNO12w4Llmww8scnmXkHfKj
         sZp75yJ5Ch2vxAWk9+XBNqBkdqk1ja0DzrdJNzHnfcpsvj0UQ7nrVaupRgQoa8iJI8tD
         7VLZRV/fcIe2Iv6wH4eZ8db/8lDVTcQaZqH2VPi5naClmk+h+6wacrrWgi1T1rfq0BOl
         VGoq8zIayhjlZJUQ6f/EoH/U/AgIWu8vsRp5hiyOsbSrHW1bYvEcrVaQWM6aBBcT0PhB
         7EZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301920; x=1716906720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEywssUx9WDAKlf86Cll8akMvaFFDKywRUFKysA3zGs=;
        b=sRDyeWvGJaG91iBsn2D+oLert91BYVVvefsKSa+BWHP9QGW5NvynCq5Ocb2WAACjb8
         5DpREh0xL6kH9jtcSfs4xgzwRMpWhi1W3zWNp90Uo58Ry3F1vHWxyLd0D2ihKL8Q5vo2
         QLi9x//BrkKSJUfQ8UJ8jUIrKThoa+3grw2cm6JC7OtChEpafeQKKCiUvC+05R89/ZWM
         SFiIl2pewxvLzADqsIhUdtqo+wAQ4QQjfh+vZU7T3QlM8sScQd0M8Vucle0TgmcizWd1
         N6QcLjsOnCSY9gvDQ5IfK5tajUh5C1gmNqcPC7KV//NgecdCAk2Vs7CoJ+nMrDbyvxaI
         sNgQ==
X-Gm-Message-State: AOJu0YyfgDrrbflhqXLat8CoAiNdxTMH0e6CCqnggPADyEsZWv4LMYtk
	U8veIqkbZRbmMK6XetNAzIit+S9ME0YMn8ZKjp7/NUsfnsyvowz+7pMYevcmKDL/TTdJerg2qmm
	xxpZZfh/lo22FITEcLve0fOjUVi4tboaoWcDx
X-Google-Smtp-Source: AGHT+IGcvq8JQVkggK7rkjtiyhSAgJbALl8iUYa4aeMjAjHLex5Xd34mWs+E/38s0jSyAIsQXvjPr2O5K7QPqkBipvY=
X-Received: by 2002:a05:6870:9401:b0:24c:522a:26ae with SMTP id
 586e51a60fabf-24c522a2dd7mr1880331fac.47.1716301920425; Tue, 21 May 2024
 07:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240516095951.32196-1-ben.cownley@arm.com> <17D186E15108A282.8212@lists.yoctoproject.org>
In-Reply-To: <17D186E15108A282.8212@lists.yoctoproject.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 21 May 2024 10:31:47 -0400
Message-ID: <CAPoiz9wZTUXLd7bYyjBnqC49YDEGv2CHcNNiteX1gCkhs4GmUg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-systemready/linux-distros: Upgrade the
 openSUSE version to 15.5
To: jdmason@kudzu.us
Cc: meta-arm@lists.yoctoproject.org, Ben Cownley <ben.cownley@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:32:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5746

FYI, your git author email address is wrong.  I fixed it in the
backport to scarthgap, but it leaked in in the original patch.  Please
fix this so it doesn't happen again.

Thanks,
Jon

On Tue, May 21, 2024 at 10:29=E2=80=AFAM Jon Mason via lists.yoctoproject.o=
rg
<jdmason=3Dkudzu.us@lists.yoctoproject.org> wrote:
>
>
> On Thu, 16 May 2024 10:59:51 +0100, Ben Cownley wrote:
> > openSUSE upgraded to 15.5
> > openSUSE Licenses updated to reflect update from 15.4 to 15.5
> > License now includes: Apache-1.1, BSL-1.0, IPL-1.0, Sleepycat, Zlib
> >
> >
>
> Applied, thanks!
>
> [1/1] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
>       commit: 8097a792db82326d44b71c019ce94c00ca6f7e01
>
> Best regards,
> --
> Jon Mason <jon.mason@arm.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5741): https://lists.yoctoproject.org/g/meta-arm/mess=
age/5741
> Mute This Topic: https://lists.yoctoproject.org/mt/106131648/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

