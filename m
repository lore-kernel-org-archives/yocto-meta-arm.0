Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4124AC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 10:19:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.6546.1652437188507701368
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 03:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j27+pO3r;
 spf=pass (domain: linaro.org, ip: 209.85.214.172,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f172.google.com with SMTP id q4so7491280plr.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c9aNmb9OwbHVkhkASDfHjI4XWvhiyUZ/fuwRN8ZuzNE=;
        b=j27+pO3r4zDp8LZZadz9xI9cOSYzPhQz64Qgf3LAj6TPfygpddtsvwV2mpcqYEp6U0
         lIHK/NbwWN9Dh9/5i7DRrjgSDA9bySk3lc5r8k7Xff/XoE+UN9pAQlFDCkNFT8RcRbZ3
         3vUuEq2x3K6+r3yGtIjgqK21tLwBuVcn38JxckSl48FYmPFstNi9e9vpu+GFjBSZgnqE
         xnOP9e7zpjG8r4drH1D5dbOdKTLkTK0cc48n2Vir7OYShZXAhEz89a2BOnhik2k8D+SS
         XhiVrCoBKtelgsuKc+4QCn5V2FcWH1Kc8qg59CCIWuwXxjNikmPviTnMh5dRqA4ECC3R
         E24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c9aNmb9OwbHVkhkASDfHjI4XWvhiyUZ/fuwRN8ZuzNE=;
        b=jEVj0fm4MvCZ5iUVbudH/SrjeG7vY9M73Kb+OUgqOV5hhBAxnHSlxy732pK9GLg57I
         O46LmkhkS0Ae7/Z3U5IkPF+bUeyIZiI/+AYeu+Y4uX4lJTOn39L9La/cf5WZEDObXD5/
         DcppflSZx6N9Ug9TFmoFEttlNc37cCLdT4fPhPfB4bRaSe4+AxHYJjr64tnOX7HBnhYI
         2njPvSjnZp4gH7+Hl9rYs1JwqyZcEErkmAYUfiwGx2kckwWp0VfJfvEdYZOwuKg4ZYrp
         UPKidsymyXk1uT1v6vcZI30zM/q7vobgOF/4kHe0D+Xydu7+lrqWfSFstOROpJXrHSfR
         lo8g==
X-Gm-Message-State: AOAM532muqtvFBynyCJaQ+keyX4HrCd5eAi1uwKi/ft228Pn6RGIHOTV
	DSvx8dMXWl+Httl75Ce/qMklApHrcZmbWEizWw+9Jg==
X-Google-Smtp-Source: 
 ABdhPJz8ygvBwMjHzL9N/ZqOQarYQ0rkX0IOBKuvm+cKLwsp42DqpsRPlrm3QjbuVWWpqisg2iWMonnjvZd0qJ/jK2E=
X-Received: by 2002:a17:902:8645:b0:15f:2eb5:3d49 with SMTP id
 y5-20020a170902864500b0015f2eb53d49mr4199017plt.42.1652437188021; Fri, 13 May
 2022 03:19:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1srinq0SbsmN+VNpc=kNdfWo61mZ4mg7hBcseAH9U8q6hQ@mail.gmail.com>
 <CAFA6WYOk3M7vV0YGFa0k+sgCz0-h7tgacvrAshvY_7h9JXH9eQ@mail.gmail.com>
 <CAMKF1sqOb702APCmJi3-7qOEf41kV9eVTUurizcdidjZRXhAMQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqOb702APCmJi3-7qOEf41kV9eVTUurizcdidjZRXhAMQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 13 May 2022 15:49:35 +0530
Message-ID: 
 <CAFA6WYPotdbFJiBL1_g3=E6aHO2-KMKmezEohc-9F=+40Eoobw@mail.gmail.com>
Subject: Re: [meta-arm] World builds failing on qemuarm
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 10:19:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3393

On Thu, 12 May 2022 at 20:36, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thu, May 12, 2022 at 12:07 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> Hi Khem,
>>
>> On Tue, 10 May 2022 at 06:19, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > I am seeing following build failures on qemuarm ( using clang compiler )
>> >
>> > https://errors.yoctoproject.org/Errors/Build/145605/
>> >
>> > This started to happen late last week.
>> >
>> > Can someone look into this regression ?
>> >
>>
>> Looking at the logs:
>>
>> ld.lld: error: cannot open
>> TOPDIR/build/tmp/work/qemuarm-yoe-linux-gnueabi/optee-os-tadevkit/3.16.0-r0/recipe-sysroot/usr/lib/clang/14.0.3/lib/linux/libclang_rt.builtins-arm.a:
>> No such file or directory
>>
>> It looks like libclang_rt.builtins-arm.a isn't being installed in the
>> sysroot, can you double check clang recipes if this library is built
>> and installed properly?
>
>
> This has been addressed except one which is not related to compiler-rt
>

I guess you are referring to "optee-spdevkit". AFAIK, FFA secure
partitions aren't supported on 32-bit Arm currently. So I would
suggest marking this target as incompatible.

-Sumit


>>
>>
>> -Sumit
>>
>> > Thanks
>> > -Khem
>> >
>> >
>> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3390): https://lists.yoctoproject.org/g/meta-arm/message/3390
> Mute This Topic: https://lists.yoctoproject.org/mt/91003714/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

