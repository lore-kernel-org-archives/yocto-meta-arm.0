Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AFBC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 09:41:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.8037.1737711656313649835
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 01:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MJU3eO6O;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43621d27adeso12309775e9.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2025 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1737711655; x=1738316455; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTmc1b755cGxutgNXlfZqZ1rKFO57KQ8i2LGWIl1Izc=;
        b=MJU3eO6OHgVIUCrPIKe8yPD85TvamUV/yoUOjPyk9KgQhouNm/BNmK7Up+zYEXaNed
         PK8n28k5uV7pplfm1L2L+cplSdSORo/tN8/llyrPWNDyecgq8hyCBiQXBiDk5Z3V5GSA
         FfQlCla0zVvaVzr3ucU+0JIWbnnJGECTLD3a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737711655; x=1738316455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTmc1b755cGxutgNXlfZqZ1rKFO57KQ8i2LGWIl1Izc=;
        b=FOcMQASancF1k+QSJVOsDirKjYP5yKwl3qFuzNy9DZAJJvAVAh9PSKvRAmu6HEX/Do
         +TzMCdYf/042qXJW53zMqc9drIZq5qD61rWVt2eQCA5OjlHcUd7DZJoyDfyy+nqcXONM
         ySbryQGeb9stW5cT0FF57ufQbzjHBnKTt67T0hT6g9ted8br822MkciUQZldbGvSet2n
         jlU//LbHpH6T0YSUo59mAv9OU87qjV/vWOu861O8alexRNd33e/0vxtYg8GaGXjDalPA
         fCU7fvetvluemuJdTQqDhE7yjBLtP2dmM6wX3k+fNXThsfzQ8MRMtdUALirl1teNvzgT
         Ifcw==
X-Gm-Message-State: AOJu0YzzHO8FXrc9HZVFOqsw+2tDZzpQyt/sth+oeBAdXw+0ZwhYgzZx
	Hs/3bfmPJvdhgFFwRMgTVuh+EWbIgK8YH9f3lZqa2yzmWCVm9yjxDNFLDMXfooM=
X-Gm-Gg: ASbGnctqO7+MkIWBXYCOeMAJPP3RmABstS1f9txHtSiH02/795tUCApo+Tu2DWPUGop
	b46dWHxViYzS/1XJcYz+EMHeIopc6bn/uEW0ihdr6JqAeMnFt2UgE99ofwvIHDccSPkXAuonORt
	1U6F6vQgw1dXj7oNY0wwqCZXXCvqixgTW1qKNGVTIL1b6ykr7Q8w7jm95MIiwb5x+utK2Brgo38
	CxGB233ir9rcZKxsii59F7BlA9P0ftI7znoSJjK9XjGD2azUDDzI1vR+cl00g4DCpPEQopxq4bl
	IDvvpIVMmEBXy/Pnz6LOooplKgWgZnxVg4ez2MTZ670Wkdrfx5wQX/LBU5bHewwLFXf1kreNvUJ
	UnifTQmONndI1psG4epDbeAUyhMm4IkgKqvYbJISZ
X-Google-Smtp-Source: AGHT+IE8UgWhuvxV+rW66uVoCItFC3YVHAFkv4ntE1BUAnewhMGmqeMUng+N2GlHQvBCeVjjFCQxPQ==
X-Received: by 2002:a05:600c:1d14:b0:436:46f9:4fc6 with SMTP id 5b1f17b1804b1-438913d63cfmr269261355e9.8.1737711654639;
        Fri, 24 Jan 2025 01:40:54 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd43cdbbsm20962105e9.0.2025.01.24.01.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 01:40:54 -0800 (PST)
Message-ID: <c16bd32d-23d9-4fb5-b6a7-e88b61f0ebf8@smile.fr>
Date: Fri, 24 Jan 2025 10:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arm] Removal of external-arm-toolchain?
To: denis@denix.org, ross.burton@arm.com
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
References: <31F864D4-FAF7-4B00-BFAE-B00CB237EBE0@arm.com>
 <20250123200026.GW21836@denix.org>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20250123200026.GW21836@denix.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2025 09:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6347

Hi all,

Le 23/01/2025 à 21:00, Denys Dmytriyenko via lists.yoctoproject.org a écrit :
> On Wed, Jan 22, 2025 at 05:32:52PM +0000, Ross Burton via lists.yoctoproject.org wrote:
>> Hi,
>>
>> It’s that time of the year where I grumble about external-arm-toolchain.  
> 
> Heh, we've had this discussion a few times in the past - I see we are coming 
> back to it again... :)
> 
> 
>> This is the recipe that lets you unpack the Arm binary GCC releases, and 
>> tell yocto to use that directory as the cross compiler.
>>
>> This time:
>>
>> 1) systemd fails to compile as the kernel headers it has don’t include 
>> SIOCGSTAMP_OLD (added in linux 5.2)
>>
>> 2) There is no real support for locales. It ships locale files but they’re 
>> generated by a separate recipe in core and those packages don’t get 
>> generated by e-a-t.  This means many of oe-core’s ptest recipes fail because 
>> of unexpected dependencies on eg locale-base-en-gb.
>>
>> 3) The virtual namespace changes that landed yesterday in core meant it 
>> needs updating.
>>
>> I’ve started work on (3) but discovered (1) and (2) whilst trying to do a 
>> test build.
>>
>> So I’m again thinking we should remove external-arm-toolchain from meta-arm. 
>> My argument for removing it:
>>
>> 1) Whilst it’s a binary release of GCC from Arm, it’s actually almost 
>> identical to upstream. Yocto can already build a newer version of upstream, 
>> which can be patched rapidly to fix bugs.
>>
>> 2) Some pieces of the binary release can be very old: the kernel headers in 
>> the 13.2 build were from linux 4.19.

I'm agree that the issue n°1, it's been a while that the ARM toolchain has not
updated their linux-headers... While systemd is probably the project that uses
the latest kernel features that requires a fairly recent version of linux-headers.

So even with the latest ARM 14.2 toolchain, users will have to switch to the
Yocto toolchain as soons as systemd is used in their system.

>>
>> 3) The binary release has limited platforms: you can only target 32-bit arm 
>> on x86-64 or aarch64 hosts, and 64-bit arm on x86-64 hosts.
>>
>> 4) Trying to force a round peg (binary toolchain) into a square hole (the 
>> implicit interface exposed by yocto’s gcc recipes) is going to be a constant 
>> battle.
>>
>> 5) Given the problems I found it appears out CI is the main user of it, and 
>> that CI coverage is explicitly minimal (disables ptest because we can’t 
>> build a target gcc either).
>>
>> My understanding is that TI were active users of the binary toolchain for 
>> customers who appreciated the speed improvement by not having to compile a 
>> cross compiler
> 
> Yes, TI used binary toolchains since the OpenEmbedded Classic days, including 
> but not limited to CodeSourcery, Linaro, and lately Arm. While support for 
> normal OE-built toolchain was always an option, the default preference for TI 
> products was to use a pre-built binary toolchain.
> 
> Though, the build speed was not the reason, at least not the main reason. 
> It was due to the technical support requirements. OE-built cross toolchain 
> was not trusted back in the day and OE is not in the business of providing 
> commercial compiler support, like CodeSourcery would, for example.
> 
> 
>> , but I don’t believe the latest releases of their product 
>> support this.
> 
> True, the maintenance and migration from one release to another was a real 
> nightmare, pretty much like you are describing above - always needing to fix 
> something. All the remaining extra TI customizations (e.g. supporting both 
> 64-bit and 32-bit external toolchains at the same time, SDK packaging, etc.) 
> were finally removed 1.5 years ago:
> https://git.yoctoproject.org/meta-arago/commit/?id=6000a07a51053b7685556246f9f5df7ef7714463
> 
> 
> That said, it appears there are some other users of external toolchain - there 
> was a person from Smile recently fixing some issues with usrmerge support. And 
> I just received a personal email from one of our customers inquiring about it 
> as well. In other words - there are other interested parties out there...

It was me probably :)

> 
> 
>>  Also this is a prime use case for sstate, in particular the 
>> public yocto state server which can be used to fetch all the native tools, 
>> not just the compiler.
> 
> This is probably a topic for another thread, but there are some issues with 
> using sstate like that - public yocto sstate server is very slow and just 
> checking what is available takes a very long time, plus cross toolchain is not 
> a native package and from my experience re-use is quite low in other distros.
> 
> 
>> So, would anyone seriously object if I sent a patch to remove the 
>> external-arm-toolchain recipe? This would only be for master, we wouldn’t 
>> retroactively remove it from the stable branches.
> 
> As one of the meta-arm-toolchain co-maintainers[1], I would not object to 
> removing external-arm-toolchain support (the Linux side) from the layer.
> 
> [1] https://git.yoctoproject.org/meta-arm/tree/meta-arm-toolchain/README.md#n99
> 
> 
> But, besides external-arm-toolchain, there are also recipes in the layer for 
> baremetal compilers, which are not proper cross- recipes, but they pretend 
> to be native- ones. That's very hacky and there are some drawbacks, while the 
> only benefit is speed, as those are also binary pre-builds. I was previously 
> suggesting replacing them with a proper baremetal multiconfig usage, like I 
> did in meta-ti for K3 platforms. And as I recall, you were interested in that 
> solution as well. If that's still the case, please let me know if you need any 
> help with that...

The projet I'm working on uses meta-ti with external-arm-toolchain since a while
(from thud to scarthgap). I wasn't aware of all the discussions about the
removal that happened previously. Using an external toolchain looks usual
especially if you come from Buildroot world :)

For a new project using a TI K3 SoC, yocto uses a multiconfig setup to build for
the ARM r5f core used by the SoC boot sequence.
So, we also uses the external-arm-toolchain to build for the r5f core (even is a
Linux toolchain is not strictly required).
An external barebetal toolchain could be used for the r5f core but the
external-arm-toolchain package only support Linux toolchains.

Removing or at least deprecating external-arm-toolchain package make it clear
that the Yocto toolchain is recommanded for new project.

Best regards,
Romain


> 
> Thanks and regards,
> Denys
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6344): https://lists.yoctoproject.org/g/meta-arm/message/6344
> Mute This Topic: https://lists.yoctoproject.org/mt/110756921/4417264
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [romain.naour@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


