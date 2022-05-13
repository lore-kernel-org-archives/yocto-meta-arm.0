Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8513C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 15:45:22 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.9976.1652456714344890451
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 08:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XQeKcf42;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 185so7326563qke.7
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=USBP10fSJsXMnZFyx2kX46i3nAev3iT2n+N6RguPo4I=;
        b=XQeKcf42rGylfEwHCIaSVRSUfYic4rmr2KVVGPoiutCj1x3Aj0llP3uPGni1KQy84p
         +dnJT7dRBLae7C48Ws2LsJsp6TvG3qzaBLJW88xkwnpe6tS72Me68DECO8mjjBCL1Ega
         PAxpCeb0qKEs8xCkxKvFoDEHlaP/8sOXP0m/blUMBvTagsckulIhsh+RaSpaN1hvwEub
         GKL2OBQKAIp6agl81k8Y/rfhGjt6LoYN3X+ag2g5rbFzhawabC23piI7CcuEhaUWxrfb
         IvB63JisjA8kDKueE/FENzDK7XAGryIhPSEPCErLlD3YO9o4oBjUZSHnV242S+QHmj21
         NoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=USBP10fSJsXMnZFyx2kX46i3nAev3iT2n+N6RguPo4I=;
        b=GxYSKAEulSjeJ0vMruZJzgeiOYqMJMQAkrRf59rrecIWjQoryjasJN9WkvdVgGaH61
         TiycyQKQyaKJSaa4zCvygVwbMzx7d1icqVgveSUkg/1C84x3txCyDxe4HR4yA+NGiWLA
         3807o2kcooOBpnXlcREDKNLQnAzlN4+PAdQV3kj7y9Mo4TcsEdo8EMsoS/A/wqYhCK9p
         86zYNM4urn7iQG6JTbMILX7d4L+xkarxHbqywiPG80JOgRUCV7zm7jPyorhnb+dXltFC
         Tt5JVNTO0xtmnOJ5pyNcNHQoGft0rbC+ltVaWhDJLQ1VLxJgIa1xcXSTlBcqOp7Q/Gnv
         ZYaA==
X-Gm-Message-State: AOAM532ZaIocbgblaqRWCZ59rKE7QcJQen+vKPDreEzq8FUqwNMBnDtR
	6OHUNw0vEHVPXZ34D+6fis1//5ojxu4jUwM33lw=
X-Google-Smtp-Source: 
 ABdhPJy/63SWvOGaTAjpwdr5JP+9OnRR91EXP8Dv4Qc2mG2394bilr4a2D81lC8CUa8wTK9JNdcWPjKaWhYFTnwh43g=
X-Received: by 2002:a37:b51:0:b0:69f:c378:e1e1 with SMTP id
 78-20020a370b51000000b0069fc378e1e1mr4125616qkl.180.1652456713305; Fri, 13
 May 2022 08:45:13 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1srinq0SbsmN+VNpc=kNdfWo61mZ4mg7hBcseAH9U8q6hQ@mail.gmail.com>
 <CAFA6WYOk3M7vV0YGFa0k+sgCz0-h7tgacvrAshvY_7h9JXH9eQ@mail.gmail.com>
 <CAMKF1sqOb702APCmJi3-7qOEf41kV9eVTUurizcdidjZRXhAMQ@mail.gmail.com>
 <CAFA6WYPotdbFJiBL1_g3=E6aHO2-KMKmezEohc-9F=+40Eoobw@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYPotdbFJiBL1_g3=E6aHO2-KMKmezEohc-9F=+40Eoobw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 May 2022 08:44:47 -0700
Message-ID: 
 <CAMKF1spv+4XnK7UzNFPA-8GHWYT-SMNhkH9=891PaR2fEHZUMA@mail.gmail.com>
Subject: Re: [meta-arm] World builds failing on qemuarm
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 15:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3401

On Fri, May 13, 2022 at 3:19 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Thu, 12 May 2022 at 20:36, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Thu, May 12, 2022 at 12:07 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >>
> >> Hi Khem,
> >>
> >> On Tue, 10 May 2022 at 06:19, Khem Raj <raj.khem@gmail.com> wrote:
> >> >
> >> > Hi
> >> >
> >> > I am seeing following build failures on qemuarm ( using clang compiler )
> >> >
> >> > https://errors.yoctoproject.org/Errors/Build/145605/
> >> >
> >> > This started to happen late last week.
> >> >
> >> > Can someone look into this regression ?
> >> >
> >>
> >> Looking at the logs:
> >>
> >> ld.lld: error: cannot open
> >> TOPDIR/build/tmp/work/qemuarm-yoe-linux-gnueabi/optee-os-tadevkit/3.16.0-r0/recipe-sysroot/usr/lib/clang/14.0.3/lib/linux/libclang_rt.builtins-arm.a:
> >> No such file or directory
> >>
> >> It looks like libclang_rt.builtins-arm.a isn't being installed in the
> >> sysroot, can you double check clang recipes if this library is built
> >> and installed properly?
> >
> >
> > This has been addressed except one which is not related to compiler-rt
> >
>
> I guess you are referring to "optee-spdevkit". AFAIK, FFA secure
> partitions aren't supported on 32-bit Arm currently. So I would
> suggest marking this target as incompatible.

right, I think it should add relevant COMPATIBLE_HOST entry then
I have sent a patch for that.

>
> -Sumit
>
>
> >>
> >>
> >> -Sumit
> >>
> >> > Thanks
> >> > -Khem
> >> >
> >> >
> >> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3390): https://lists.yoctoproject.org/g/meta-arm/message/3390
> > Mute This Topic: https://lists.yoctoproject.org/mt/91003714/1777089
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

