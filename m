Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76B910ED676
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:59:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71622.1774616385704627799
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NM1svQpq;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b9144790dso1160618f8f.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Mar 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774616384; x=1775221184; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7V0VcB74MAGTkYkWL32nXuZNSgqMPyT85WVQ3mqPxc=;
        b=NM1svQpq9Y6nDxFT6mDTIdgsxcMOgPZdMIS8Xju9P14/w7gAeMA1UuMfcSq9jCGtCp
         waVMTeMZrYgtKCOCsM5xZE2ESUEiMgrmF9Z0XJWqSM+U+NIBR9rQhZwCUKLGtAmuopUx
         myfNZ8F+M9P2fj+YiQ6WH4ZCIxPnZB4RWPg6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616384; x=1775221184;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7V0VcB74MAGTkYkWL32nXuZNSgqMPyT85WVQ3mqPxc=;
        b=F7u75fMbi8yhvi7KQpAeE/t1ZlZmJs1fMcYUwG9DXAYWiVvcYjwGv+xoL1VzcvZTJI
         8jMqap5NfZ0jFe8LCPv0xU/c6qzOE4/7z0x+eLYo1f+sErHH2KQJTDbmwo0mZOPcMj9Y
         KmrsbcCuTKTPoqW/ORd+71haXhP8yGuithWXrmFodihaHzDgyBjv0G9fGxtQz5jNNQ+E
         cfcHcdNFbaiS+6YVg3B1N3gnK/IldFLj/5hGWlasKR7cQ+6tv+5pgrae1kxeRdjRTcRV
         jAj8qbP3I4PFQOwc+NguKwT2S/8qOTl6yA+vbYFTAznNPI3rRTVuKXVOsi9T38JpS6WY
         ODng==
X-Gm-Message-State: AOJu0YynY9MJRALfQXf4Aq43fcYWM/6AEnLM/fL80YKGBE1QQOlJlncw
	SaXzwLH3qRlFHmx2utCfG1luEz8gBdwwGKBmjkgbbUb2EBokvI/SebK884ccZV0JH+k=
X-Gm-Gg: ATEYQzyh3+bCNRd9pgqpgrTMjfuiw31kVbFMNybn3J2ZiykFV+T7vVQ0CBsY8dyv5tc
	OsmY+x23aYPvpC7ELu8pn+lCZJwLV4zieM8xpZtg++VhOpKkpRvdR29fx21uH8CdxwF7tg6gmJ/
	wgEPek/0IsL3xz6vvHiTUIi3lvhGbkjmzl0QsRG6lsJ6y6mO7ndLAgMEDPbnr24wU6DQRsqlmGu
	gvLhvVCtkUIPpHonZjyigpoMSmCbN+BcqLbMetoZ6trCuLiO/21Dq4dnhRCljDWZrjPELfeNH/h
	ULaH9yuYzIVjeGigueVRqm0uu8HUX6z7moZQ6z600mFoDBQmhohnnRQR/wg3tZsADLPvOvXww5F
	CSrEwzG4qu7EoewLPtfyEzqU7AL/c1W0kpClMjvAavz07gXNB5exTt0sdj72uyK1irylFVvLGbB
	A5xmSbtfl1eDaec6MsWkyOdWB+2hptVE1hCkIKYILX3uCpK6N8L/lnB/j6ayYMFDNL44nCXplqy
	pmiit5e1LuODWc=
X-Received: by 2002:a05:6000:26d1:b0:43b:3bf9:e00b with SMTP id ffacd0b85a97d-43b9e9901bcmr3992372f8f.19.1774616383940;
        Fri, 27 Mar 2026 05:59:43 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm15997341f8f.0.2026.03.27.05.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:59:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 13:59:43 +0100
Message-Id: <DHDL07TEY6X7.YSJGL0UG4WU1@smile.fr>
Subject: Re: [meta-arm] AB-INT failure in whinlatter/edk2-firmware
 do_compile
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "meta-arm ML" <meta-arm@lists.yoctoproject.org>, "Jon Mason"
 <jon.mason@arm.com>, "Ross Burton" <ross.burton@arm.com>
To: "Jon Mason" <jdmason@kudzu.us>
X-Mailer: aerc 0.20.0
References: <DH7ZEAMDKDZ2.3W0SJDQU59IXK@smile.fr>
 <DHB2UT9U65ZR.1A4WRTWWUTYG8@smile.fr>
 <CAPoiz9wHEKfkv7jwphR8K+kVBNEhgMf_GpLFHnTvd8MOj2zOug@mail.gmail.com>
In-Reply-To: <CAPoiz9wHEKfkv7jwphR8K+kVBNEhgMf_GpLFHnTvd8MOj2zOug@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Mar 2026 12:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6980

On Fri Mar 27, 2026 at 1:53 PM CET, Jon Mason wrote:
> Sorrying, I just noticed this yesterday.  I tested and pushed it in
> https://git.yoctoproject.org/meta-arm/commit/?h=3Dwhinlatter&id=3D4dc2a7b=
f29c1853b95dda53d9527f0a23049295f
>
> Let me know if you are still having issues.
The "Build for sbsa-ref (poky): Build targets" step of my current
Whinlatter build has passed without issue[0]. So, that does look better.

Thank you :)

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/335=
1
>
> Thanks,
> Jon
>
> On Tue, Mar 24, 2026 at 10:21=E2=80=AFAM Yoann Congal via
> lists.yoctoproject.org <yoann.congal=3Dsmile.fr@lists.yoctoproject.org>
> wrote:
>>
>> On Sat Mar 21, 2026 at 12:00 AM CET, Yoann Congal wrote:
>> > Hello,
>> >
>> > While testing my whinlatter branch in
>> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/75/builds/33=
01
>> > Worker: ubuntu2510-vk-1
>> > ... I got a build failure coming from edk2-firmware:
>> > | make[3]: Entering directory '/srv/pokybuild/yocto-worker/meta-arm/bu=
ild/build/tmp/work/sbsa_ref-poky-linux/edk2-firmware/202408/sources/edk2/Ba=
seTools/Source/C/VfrCompile/Pccts/antlr'
>> > | gcc  -c -O -I. -I../support/set -I../h -DUSER_ZZSYN  -DZZLEXBUFSIZE=
=3D65536  antlr.c -o antlr.o
>> > | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65=
536 -c dlg_p.c
>> > | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65=
536 -c dlg_a.c
>> > | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65=
536 -c main.c
>> > | main.c: In function =E2=80=98ProcessArgs=E2=80=99:
>> > | main.c:163:42: error: too many arguments to function =E2=80=98p->pro=
cess=E2=80=99; expected 0, have 2
>> > |   163 |                                         (*p->process)( *argv=
, *(argv+1) );
>> > |       |                                         ~^~~~~~~~~~~~  ~~~~~
>> > | main.c:120:34: note: declared here
>> > |   120 |                         WildFunc process;
>> > |       |                                  ^~~~~~~
>> >
>> > It succedded when retried (same whinlatter commit, different worker:
>> > debian12-vk-7)
>> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/330=
3
>> >
>> > Regards,
>>
>> Looks like "arm-bsp/edk2-firmware: fix build on newer hosts"[0] is
>> needed for the whinlatter branch (On Ubuntu 25.10 GCC version is 15 by
>> default [1])
>> [0]: https://git.yoctoproject.org/meta-arm/commit/?id=3D3afd7461b1b4fd49=
90443df10dee30bee4eb6449
>> [1]: https://documentation.ubuntu.com/ubuntu-for-developers/reference/av=
ailability/gcc/
>>
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#6968): https://lists.yoctoproject.org/g/meta-arm/mes=
sage/6968
>> Mute This Topic: https://lists.yoctoproject.org/mt/118427086/3616920
>> Group Owner: meta-arm+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@ku=
dzu.us]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Yoann Congal
Smile ECS


