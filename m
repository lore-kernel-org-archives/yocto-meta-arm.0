Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D850AC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:42:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1458.1680104561930121304
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 08:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCB501FB;
	Wed, 29 Mar 2023 08:43:25 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35F5B3F663;
	Wed, 29 Mar 2023 08:42:41 -0700 (PDT)
Message-ID: <b350a9cd-8fc5-f4ee-e3e2-d6d95ccdaed2@arm.com>
Date: Wed, 29 Mar 2023 16:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-arm] [PATCH 2/2] scripts/runfvp: Fix KeyError exception
 when there is no FVP_CONSOLE provided
Content-Language: en-US
To: peron.clem@gmail.com, meta-arm@lists.yoctoproject.org
References: <20230329120057.58949-1-peron.clem@gmail.com>
 <20230329120057.58949-2-peron.clem@gmail.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20230329120057.58949-2-peron.clem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 15:42:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4500

On 29/03/2023 13:00, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
> We access the dictionnary element that doesn't exist.
>
> Use the get() method instead that will default the element to None if i=
t
> doesn't exist.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
Reviewed-by: Peter Hoyes <peter.hoyes@arm.com>
> ---
>   scripts/runfvp | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runfvp b/scripts/runfvp
> index c5a74b2f..ee60486c 100755
> --- a/scripts/runfvp
> +++ b/scripts/runfvp
> @@ -55,8 +55,8 @@ async def start_fvp(args, config, extra_args):
>  =20
>           if args.console:
>               fvp.add_line_callback(lambda line: logger.debug(f"FVP out=
put: {line}"))
> -            expected_terminal =3D config["consoles"]["default"]
> -            if not expected_terminal:
> +            expected_terminal =3D config["consoles"].get("default")
> +            if expected_terminal is None:
>                   logger.error("--console used but FVP_CONSOLE not set =
in machine configuration")
>                   return 1
>               telnet =3D await fvp.create_telnet(expected_terminal)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4496): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/4496
> Mute This Topic: https://lists.yoctoproject.org/mt/97926510/5715260
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoy=
es@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

