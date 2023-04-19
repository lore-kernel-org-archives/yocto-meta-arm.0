Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BB6C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:43:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43333.1681922584317883376
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0BA31042;
	Wed, 19 Apr 2023 09:43:47 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9487E3F5A1;
	Wed, 19 Apr 2023 09:43:03 -0700 (PDT)
Message-ID: <1ed4d0b0-ac63-92f2-e900-510b4d9252cd@arm.com>
Date: Wed, 19 Apr 2023 17:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arm] FVPConf leak host path with absolute links
To: peron.clem@gmail.com
References: <CAJiuCceSV9ew8zgq+WaY4vRa4OmzqqOGQDnQbEBT2mZoG-QSug@mail.gmail.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org
In-Reply-To: <CAJiuCceSV9ew8zgq+WaY4vRa4OmzqqOGQDnQbEBT2mZoG-QSug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4583

On 19/04/2023 13:47, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
> Hi,
>
> I've two separate machines.
> One is a builder that generates my Yocto firmware and I'm now
> integrating a FVP machine.
> One is a "tester" that runs and validates my firmwares.
>
> The Problem is that they don't share the same folder hierarchy and the
> fvpconf is not really usable as it's full of absolute paths.
>
> Is there a strong reason to use absolute paths in the fvpconf?
>
> Would it be acceptable to move to relative ones instead?
>
> Thanks for your help,
> Clement

Hi Clement,

I tried to find a fix for this a while back, but couldn't find anything=20
particularly elegant because different FVPs have different configuration=20
keys for disk and flash images.

Maybe it would work if runfvp set the cwd to dirname(fvpconf) and passed=20
relative paths to the model?

Peter

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4581): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/4581
> Mute This Topic: https://lists.yoctoproject.org/mt/98365542/5715260
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoy=
es@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

