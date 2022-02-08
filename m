Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26A5C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 12:30:56 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.10420.1644323455373780484
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 04:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=IgiJ9oqu;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1504003wme.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2paMEq61SDl7j680N/5iOgJZkS4uu/MWiiO/+u0TxUI=;
        b=IgiJ9oqurYGWgT1ND5g/hxN/qEDK0/rJIefhuV8qtNr5FrQRwdWlgb8oY0AXLsNE5K
         ryCWDlAiqEau0Mc9eyBvOUVA1dumVDN6mR/bHXXYB0oQSnFFbynqtwnAFcaZYJCmZSwH
         YeCCHdkxpucr2APj0qpr7e6vIwNgGLMJRrI7lr4UF9L9LH0k+I7b1JKnl2ZMlhkbgYSC
         SdyW1kqcSSRld8XHZcFkYuTjQpxugrRApoSx4tT2pJKC3SWT1rfefW0c/WA7Xx0AEJ7h
         XuazTgQWepJDdyNWarDPNGGBwjKmo9KqvCC1XfCSWgRkoZ9tLwIQpYo1qwwzaTpXfG5H
         ZMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2paMEq61SDl7j680N/5iOgJZkS4uu/MWiiO/+u0TxUI=;
        b=OEfn4vuAJw6V6wNDKHCU2KqMr5Gi8xBBtEy2N+3wrfDesQu/IDafFFSU1CY8zRb2WI
         5Oh26E9r0jGiHyBU9y48K1eycvXghLaUbzMvV1n8j8qNdsJmxzv2GT2a0wMpfJnMs3D0
         Js0kXAEYLE1GvlAmFDbEHFxj1vl/Vll6BL3z3VxjxnQEAX/uaS7Ayk5e7Qme5YiL5yNj
         M7vldu34uH35CvHLD5BuBoHX4llvx/t1P58+w1M54hd5Dhf9iQAKFG/or4WJGQK0MxYG
         zIvJrO/Nrffeo9nfiv8R+iDJ4hNDv03moPxLum5SKmFZOZGMS8VW+twYCyvVxPJTMK3c
         wxww==
X-Gm-Message-State: AOAM531HZzU8qqB8fmWbbph2PqrKkCGYmKhDqKfRjwWp9zERAgYHAKKk
	6CVj1MDA1Caz7KH/7PiWFLigOjFErqtAN92p7UrBcw==
X-Google-Smtp-Source: 
 ABdhPJy0qmu1irqFyCw3i0QfF3gUf1Pjr9DVBxnWmgmUHXzx+KIpYg4zHmLPYEXdF9QW2OD9q0vwaPbSYZGBC/kSAE4=
X-Received: by 2002:a7b:cb48:: with SMTP id v8mr944362wmj.69.1644323453739;
 Tue, 08 Feb 2022 04:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
In-Reply-To: <20220202055225.2212857-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 8 Feb 2022 12:30:42 +0000
Message-ID: 
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 12:30:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2953

On Wed, 2 Feb 2022 at 05:52, Khem Raj <raj.khem@gmail.com> wrote:
>
> The module can not be compiled without patching kernel
> and rpi machines use linux-raspberrypi and are either arm32
> or arm64 machines, so this module tries to build in world envs
>
> This helps meta-arm to live in multi-BSP envs

What failure did you get when building for RPi? I can't make it break
by building it for non-corstone machines.

Ross

