Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169BFC433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 07:07:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.1344.1652339227112022627
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 00:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JP2UxA3S;
 spf=pass (domain: linaro.org, ip: 209.85.216.42,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f42.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso4121326pjg.0
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vPiTSHeC1EVKys4vSsPWTrbv0IheqRpMzLQDvju9CV4=;
        b=JP2UxA3SLRCi5vaKi0IE1j90A5sJ743TCJMFagve5StN0YJXeeg61BMTJRQKqS8zoS
         Ivl+8F9n1671QWqqF5/CaoqOFyCpdOHew0s492UDJKUM6rUKB2r+m3BW9pWrg+R+ZbJC
         6ZXkqhz3opFr5+kqnp9P5fKRCRJI6faOgiXkBxN1kxFwMoW8WsGHAmvkbtkfGQDfRKm0
         PHl1LnyPv4WmA0VzxuUJtZQ3/q4+ifvsbVu8EKdnegYoIOjefYJ4gVsb2YH8Ny9cBAA5
         qdohPRpjruEVAzg1PZ1g7Ud76EKJVnrX7KU6KSIQgSzYV5svuyq4J+f1SjEachwBh499
         ia1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vPiTSHeC1EVKys4vSsPWTrbv0IheqRpMzLQDvju9CV4=;
        b=jDF8C15ZDstA6qy/2F/QEz609dof0HSCHN9cB1wKVv17Y/tsTbD7RyxRGSS4mLiYwr
         PJGy8GEWVa20P60Jm89iHMLYolqZ/2rY7t7STxj0KPZBRuv5+iQAfJ+ajsqz/NghUKHP
         OYhDMCg/nqBJjT53z+F/QLDhqoRqfF2uuCb7ClI297aCdfkXeFBvB8uZS+kQHqnU5yPu
         FVSpO+ETjTPYr8vbFPEAE5uxwQlDHkcRvrlrDcjmLrX4o2dYm6OexaNG9ONwNYOuL4K+
         Rjlmnn3t/vv4t09yO9KCTNz64RmZ6zJrwoDrUJFgEKJuJWUTZd0exZr90qfBedu+Rt3s
         2tzQ==
X-Gm-Message-State: AOAM533JlSMXw7Otysu+nbDvfRMdMIplKpDkmINZVDXy0yPnnrpKviPv
	rdVcPmO+W5oWkvSdGvI+ae4fJpsrJ3MxzaGTeluyjQ==
X-Google-Smtp-Source: 
 ABdhPJwUsBKClZMkhpGCGcQX9LETsqi9DWHopy+UwZWfqNdnzCAoVtlG4jSgj789R0hALjZnQ9EevHeZattfiiBHvt8=
X-Received: by 2002:a17:903:18a:b0:15e:c983:7c2e with SMTP id
 z10-20020a170903018a00b0015ec9837c2emr28485294plg.29.1652339226510; Thu, 12
 May 2022 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1srinq0SbsmN+VNpc=kNdfWo61mZ4mg7hBcseAH9U8q6hQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srinq0SbsmN+VNpc=kNdfWo61mZ4mg7hBcseAH9U8q6hQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 12 May 2022 12:36:54 +0530
Message-ID: 
 <CAFA6WYOk3M7vV0YGFa0k+sgCz0-h7tgacvrAshvY_7h9JXH9eQ@mail.gmail.com>
Subject: Re: [meta-arm] World builds failing on qemuarm
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 May 2022 07:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3388

Hi Khem,

On Tue, 10 May 2022 at 06:19, Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi
>
> I am seeing following build failures on qemuarm ( using clang compiler )
>
> https://errors.yoctoproject.org/Errors/Build/145605/
>
> This started to happen late last week.
>
> Can someone look into this regression ?
>

Looking at the logs:

ld.lld: error: cannot open
TOPDIR/build/tmp/work/qemuarm-yoe-linux-gnueabi/optee-os-tadevkit/3.16.0-r0/recipe-sysroot/usr/lib/clang/14.0.3/lib/linux/libclang_rt.builtins-arm.a:
No such file or directory

It looks like libclang_rt.builtins-arm.a isn't being installed in the
sysroot, can you double check clang recipes if this library is built
and installed properly?

-Sumit

> Thanks
> -Khem
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3373): https://lists.yoctoproject.org/g/meta-arm/message/3373
> Mute This Topic: https://lists.yoctoproject.org/mt/91003714/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

