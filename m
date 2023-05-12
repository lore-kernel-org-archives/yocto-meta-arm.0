Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C265C77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 14:19:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26163.1683901146824492509
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 May 2023 07:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACD0BD75;
	Fri, 12 May 2023 07:19:50 -0700 (PDT)
Received: from [10.57.82.214] (unknown [10.57.82.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B49E53F663;
	Fri, 12 May 2023 07:19:05 -0700 (PDT)
Message-ID: <7f861c0c-b98a-b9bb-b6fe-d53dd32c724b@arm.com>
Date: Fri, 12 May 2023 15:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arm] [RFC 1/2] runfvp: switch working directory to allow
 path relative to fvpconf
To: peron.clem@gmail.com, meta-arm@lists.yoctoproject.org
References: <20230511160116.398793-1-peron.clem@gmail.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20230511160116.398793-1-peron.clem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 May 2023 14:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4644

Hi Clement,

On 11/05/2023 17:01, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
> fvpconf file contains absolute path that leak builder path.
>
> Allow to add relative path by changing the chdir before loading
> the config file.

The fvpconf file is read by both runfvp and also a custom OE testimage=20
controller [1] which we use heavily for runtime validation - I think=20
these patches will break this use case.

It should be possible to set the 'cwd' argument of subprocess.Popen in=20
the common code [2]. It might require another patch to move conffile=20
loading into the common code though so that its filename is accessible...

We also have an oe-selftest for this common code [3], which may need=20
updating.

[1]=20
https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/oeqa/controllers/=
fvp.py
[2]=20
https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/fvp/runner.py#n99
[3]=20
https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/oeqa/selftest/cas=
es/runfvp.py

Peter

>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>   scripts/runfvp | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/scripts/runfvp b/scripts/runfvp
> index e4b00abc..f0d821be 100755
> --- a/scripts/runfvp
> +++ b/scripts/runfvp
> @@ -87,6 +87,12 @@ def runfvp(cli_args):
>           config_file =3D args.config
>       else:
>           config_file =3D conffile.find(args.config)
> +
> +    # Path inside the config could be relative to the config file
> +    working_directory =3D os.path.dirname(config_file)
> +    logger.debug(f"Switching the working directory to {working_directo=
ry}")
> +    os.chdir(working_directory)
> +
>       logger.debug(f"Loading {config_file}")
>       config =3D conffile.load(config_file)
>       start_fvp(args, config, extra_args)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4641): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/4641
> Mute This Topic: https://lists.yoctoproject.org/mt/98830760/5715260
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoy=
es@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

