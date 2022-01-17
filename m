Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D85EC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 13:40:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.11295.1642426831010082566
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 05:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=7eczI3RW;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso22764739wmd.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 05:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=6mbqhwR6Fp6Ig91ED7qKjGCddwJFND0V1V9UOFYD+J0=;
        b=7eczI3RWUpEh+zg+AFPHA0PXH4hhQrS3J5cKl8Wh+sj/P0UaKeRaZep+dnaJo2jckd
         eX6SrydGW1mtX3k2K87ogZG2mZKP9OW6GzOTrara0TiffjqZhP2UgnIJEyAvM2kPtVOh
         UO5iVdttlXxlJ96ccBSiBOKdXJr2k0XyRVrVjJwCNV4lhvPEbUB4oCSOl9vXygjc+8Wf
         xyHa0IkdbeDZFfcPARnQ8ExH/S0MjnQPpfNwXXRKUKRlucyfvjPsBzhyDK8y1MACce3V
         YiQ9FMrvv6JHFtJe7jEN8kU8RHx1HRi3OoZEE047QKAPmrVwKZTgmFdjvBrBqL1qwazC
         uDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=6mbqhwR6Fp6Ig91ED7qKjGCddwJFND0V1V9UOFYD+J0=;
        b=Mnyfk/o1rwVXJ+vyuPfsOU5Bl6Xb6ltzW1n4SNcruQV7uD4iqIkrFiWJ/QefZ90DWu
         3nnAwYJBcRWbxiPTTDWvZKzu7U0Kxkhgi8xeoB2Tg5lGfY84ABIj4cA+q2vUP45jzMXH
         cCVN4aCsIa4MHePvoD4aNnoEPPT4dYPx2ctPf3zCk3aVflyKF+gJFFXzH3IjtYNO+hd7
         hbOF/5o9cMzAe98cI1jew1R1U8GvXa7ZZpXRTbETz9MRy+F5ECEJ7wH6x5JJETo4MLDp
         nIxa9xtdIA6f2spAWATzCKyvViidnGwFDYX+w++C2br5p0tyUxz85JDZ2ZhvM2l4albI
         nx3g==
X-Gm-Message-State: AOAM533xoh+OT/oSyn8b+fw5J3z30SVmyDb4Y5fA3rYzAZDk7DJHiv4s
	c6mhr/YxwVDoiunh3uEHwgbvcE2QZo8FITDG5ZP6wReSBEQ=
X-Google-Smtp-Source: 
 ABdhPJy/mu645WmAIykh/krjVO8ZwY7gaoJmk1Fobhg+TAiKN8jN4eIw1+COPGNz+dfiK97YTX2OK0NfhvLwPVa7UE4=
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr5618728wrd.231.1642426828841;
 Mon, 17 Jan 2022 05:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20220117133824.465198-1-ross.burton@arm.com>
In-Reply-To: <20220117133824.465198-1-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 17 Jan 2022 13:40:17 +0000
Message-ID: 
 <CAAnfSTuR0bsv0k5Ch9qAAY+0sm89d9tydr7rrtxEbVYJzUokGg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] CI: track honister branch for clang and zephyr
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 13:40:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2837

This was for honister.

Because it fixes CI, I've already pushed it.

Ross

On Mon, 17 Jan 2022 at 13:38, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> These layers now have honister branches, so track those instead of master.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ci/clang.yml       | 1 -
>  ci/meta-zephyr.yml | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/ci/clang.yml b/ci/clang.yml
> index 063f72d9..f3524473 100644
> --- a/ci/clang.yml
> +++ b/ci/clang.yml
> @@ -4,7 +4,6 @@ header:
>  repos:
>    meta-clang:
>      url: https://github.com/kraj/meta-clang
> -    refspec: master
>
>  local_conf_header:
>    clang: |
> diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
> index d8fae2ef..2b9d19e5 100644
> --- a/ci/meta-zephyr.yml
> +++ b/ci/meta-zephyr.yml
> @@ -6,4 +6,3 @@ header:
>  repos:
>    meta-zephyr:
>      url: https://git.yoctoproject.org/git/meta-zephyr
> -    refspec: master
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2835): https://lists.yoctoproject.org/g/meta-arm/message/2835
> Mute This Topic: https://lists.yoctoproject.org/mt/88483579/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

