Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA49C7EE23
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.86297.1684150432139229842
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 May 2023 04:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A7262F4;
	Mon, 15 May 2023 04:34:35 -0700 (PDT)
Received: from [10.57.82.214] (unknown [10.57.82.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 875663F7BD;
	Mon, 15 May 2023 04:33:50 -0700 (PDT)
Message-ID: <d0f8dfb1-977b-8bd3-0546-7b9b33dc6b23@arm.com>
Date: Mon, 15 May 2023 12:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arm] [RFC 1/2] runfvp: switch working directory to allow
 path relative to fvpconf
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
References: <20230511160116.398793-1-peron.clem@gmail.com>
 <7f861c0c-b98a-b9bb-b6fe-d53dd32c724b@arm.com>
 <CAJiuCcej=qKCg-ULE3GWHYsysApHDh7yJXTXwEsKQpvnBVKmKg@mail.gmail.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <CAJiuCcej=qKCg-ULE3GWHYsysApHDh7yJXTXwEsKQpvnBVKmKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 11:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4647

On 15/05/2023 10:27, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Peter,
>
> On Fri, 12 May 2023 at 16:19, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
>> Hi Clement,
>>
>> On 11/05/2023 17:01, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.or=
g wrote:
>>> fvpconf file contains absolute path that leak builder path.
>>>
>>> Allow to add relative path by changing the chdir before loading
>>> the config file.
>> The fvpconf file is read by both runfvp and also a custom OE testimage
>> controller [1] which we use heavily for runtime validation - I think
>> these patches will break this use case.
> Thanks for the review and the explanation,
Thanks for pursuing this refactor.
>
> So this will make the config read multiple times right? one time in
> the caller and one time in the callee.
I'm not sure I understand fully, but the suggestion is to move all=20
config reading logic inside FVPRunner.start() so that we only call=20
conffile.load() in one place and the number of arguments to=20
FVPRunner.start() is reduced.
>
> What about passing the conf working directory as a param of FVPRunner.s=
tart() ?
>
> Something like this:
> def start(self, fvpconf, extra_args=3D[], terminal_choice=3D"none",
> stdout=3Dsubprocess.PIPE, fvp_cwd=3DNone):

I think it would make more sense to derive the cwd from the fvpconf=20
filename? If the fvpconf file contents are inherently dependent on the=20
cwd I don't think it makes sense to support alternate cwds.

Peter

>
> Regards,
> Clement
>
>
>> It should be possible to set the 'cwd' argument of subprocess.Popen in
>> the common code [2]. It might require another patch to move conffile
>> loading into the common code though so that its filename is accessible=
...
>>
>> We also have an oe-selftest for this common code [3], which may need
>> updating.
>>
>> [1]
>> https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/oeqa/controlle=
rs/fvp.py
>> [2]
>> https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/fvp/runner.py#=
n99
>> [3]
>> https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/oeqa/selftest/=
cases/runfvp.py
>>
>> Peter
>>
>>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>>> ---
>>>    scripts/runfvp | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/scripts/runfvp b/scripts/runfvp
>>> index e4b00abc..f0d821be 100755
>>> --- a/scripts/runfvp
>>> +++ b/scripts/runfvp
>>> @@ -87,6 +87,12 @@ def runfvp(cli_args):
>>>            config_file =3D args.config
>>>        else:
>>>            config_file =3D conffile.find(args.config)
>>> +
>>> +    # Path inside the config could be relative to the config file
>>> +    working_directory =3D os.path.dirname(config_file)
>>> +    logger.debug(f"Switching the working directory to {working_direc=
tory}")
>>> +    os.chdir(working_directory)
>>> +
>>>        logger.debug(f"Loading {config_file}")
>>>        config =3D conffile.load(config_file)
>>>        start_fvp(args, config, extra_args)
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#4641): https://lists.yoctoproject.org/g/meta-arm/=
message/4641
>>> Mute This Topic: https://lists.yoctoproject.org/mt/98830760/5715260
>>> Group Owner: meta-arm+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.h=
oyes@arm.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

