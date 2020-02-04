Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.7188.1580828561874762783
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 07:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mR+W4cP9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.65, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f65.google.com with SMTP id s6so10832906iol.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 04 Feb 2020 07:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7XRQ7NbhWFj4GxQSmaOf8PogYaV83WGCO8sPWucjnzg=;
        b=mR+W4cP95dQHG2Yh2CXxnVRMrQgWG8dWmdd0kxaipiF/MQOvkktuH3afdTNdPaoaB8
         Cm9gk18N70xS53AZUlGVgaplx1SwvJ47i/ZwpeqIMI1MB20OPEU8O7S36kggHAksRP1J
         ZSd1WImskL18F3Spx4uPy+Tg//AWwEfQ5cL1LuxtS2uvF4+kg8+d/zcOPuB3Gt1y1pWs
         0TGgwpvYyOBoYsT68i+Gq9uhuL6iuqQdxYN9gZycq4TOoxWKIVrP0IGNiskV1kgvqBMk
         lTdinygL3UQmU01NrfNDmtJq0IwqYpibdpsq4+tBCYwj9fTm0Glh40MM9m3CXRIAel8F
         hAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7XRQ7NbhWFj4GxQSmaOf8PogYaV83WGCO8sPWucjnzg=;
        b=WEDw/T4qfyHUhpLw48sI7APu5/XoO1M8aQwO4q/c+x99K6KYCeDIWPYfwn3McBALI/
         jT/TAlT9IdZH/w1rKGe4Uh2iMhq/GOI5CJrJ+eBbYmYKi1zjlDdeyPZ/3fPeKQX2rAgr
         HsG9naa5VL8ru78qbn8gyfGBUU+KGdihB/aVpFsNIMR3YOOtE+ivrkpUGmI8OSlMZpgC
         gBWzmwl2pUpT1VxcuedRzsm7AV/tN0wLyAYafPr2iPGXLlI77vLrKRhPCI8k+9P7lHFl
         abgpMqBztEMN6pRNdN3Qb2a4WiNnnKJcCU5hcd0uunZvV8+i0vJrodd7OkLxMG3MbwxU
         ALNg==
X-Gm-Message-State: APjAAAXIVYJ4szZwfPnl7AHJrRGao55RKmvDSIdQjEq1GRLzQzt6981H
	d2folC31VJb1tdBoYXNEYzc6Tbahkw5in+eQctj6SdsionrZpQ==
X-Google-Smtp-Source: APXvYqxOdKAjdpKcaJ32O8jhmL8wBQbxL/CwGd/8yo1KQve7WJxODW7mq58lONwdWpZske9clZHsd27esikr9UJAob0=
X-Received: by 2002:a6b:6103:: with SMTP id v3mr24515637iob.49.1580828561022;
 Tue, 04 Feb 2020 07:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20200204143957.18275-1-bertrand.marquis@arm.com> <CAP71WjwytXDP69UyruLCRD7TrCSetRqP60V5qLpW323ku+f8Vg@mail.gmail.com>
In-Reply-To: <CAP71WjwytXDP69UyruLCRD7TrCSetRqP60V5qLpW323ku+f8Vg@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Tue, 4 Feb 2020 15:02:29 +0000
Message-ID: <CAPoiz9xn6DaKmACAwJk5_4JRuhe-iWXq+g6tNg3GUXmw0eMQkg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Optimize execution on FVP and Foundation platform
To: meta-arm@lists.yoctoproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2020 at 2:52 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
>
>
> Le mar. 4 f=C3=A9vr. 2020 =C3=A0 15:40, Bertrand <bertrand.marquis@arm.c=
om> a =C3=A9crit :
>>
>> Add an extra partition to the disk image generated for FVP and
>> Foundation platform (to be used for user data or extra usage). The
>> partition is created on the hard drive but is not formated.
>> Speed up running on FVP and Foundation by optimizing model parameters:
>> - disable options that are already set by default
>> - disable cache modelling on FVP
>> - disable secure memory
>> - disable real time on Foundation (prevents timeout as execution is a
>> lot slower then on a real system)
>>
>> Change-Id: I20d613bd8b0f4cb7df87c294d45b9f718f6a8ed3
>
>
> These tags should be removed.

We are using gerrit internally.  It would be a nightmare of rebases if
we remove it, as it would not match our internal version.

Thanks,
Jon


>>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  meta-arm-bsp/conf/machine/fvp-common/fvp.inc              | 5 +++++
>>  .../fvp-common/files/start-foundation-armv8.sh            | 4 ++--
>>  .../recipes-devtools/fvp-common/files/start-fvp-base.sh   | 8 +++-----
>>  3 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bs=
p/conf/machine/fvp-common/fvp.inc
>> index 606ea32..6bf33f3 100644
>> --- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
>> +++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
>> @@ -27,6 +27,11 @@ DISK_IMG_PARTITION2_SIZE =3D "2048"
>>  DISK_IMG_PARTITION2_FSTYPE =3D "ext4"
>>  DISK_IMG_PARTITION2_CONTENT =3D "rootfs"
>>
>> +# Empty third partition (8G - 2048M - 128M)
>> +DISK_IMG_PARTITION3_SIZE =3D "6016"
>> +DISK_IMG_PARTITION3_FSTYPE =3D ""
>> +DISK_IMG_PARTITION3_CONTENT =3D ""
>> +
>>  SERIAL_CONSOLES =3D "115200;ttyAMA0"
>>
>>  PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
>> diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-found=
ation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-found=
ation-armv8.sh
>> index 4e45a04..ca39bee 100755
>> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-a=
rmv8.sh
>> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-a=
rmv8.sh
>> @@ -40,10 +40,10 @@ DISK_FILE=3D""
>>  FOUNDATION_PLAT_EXE=3D"Foundation_Platform"
>>
>>  # Foundation Platform arguments
>> +# 4 cores
>> +# gicv3 emulation (required for hardware virtualisation)
>>  FOUNDATION_PLAT_ARGS=3D" \
>>      --cores=3D4 \
>> -    --secure-memory \
>> -    --use-real-time \
>>      --gicv3"
>>
>>  # Foundation Platform user arguments
>> diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-b=
ase.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
>> index b6e237b..1d3c206 100755
>> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
>> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
>> @@ -38,13 +38,11 @@ DISK_FILE=3D""
>>  FVPEXEC=3D"FVP_Base_RevC-2xAEMv8A"
>>
>>  # FVP arguments
>> +# enable virtio network
>> +# disable cache modelling to improve performances
>>  FVPARGS=3D" \
>>      -C bp.virtio_net.enabled=3D1 \
>> -    -C pctl.startup=3D0.0.0.0 \
>> -    -C bp.secure_memory=3D1 \
>> -    -C bp.tzc_400.diagnostics=3D1 \
>> -    -C cluster0.NUM_CORES=3D4 \
>> -    -C cluster1.NUM_CORES=3D4"
>> +    -C cache_state_modelled=3D0"
>>
>>  # FVP user arguments
>>  EXTRA_ARGS=3D""
>> --
>> 2.17.1
>>
>>
>=20
