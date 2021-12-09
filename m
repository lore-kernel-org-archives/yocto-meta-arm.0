Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD9CC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 18:04:50 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.15195.1639073089145620997
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 10:04:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IZCeu28N;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id kl8so5832606qvb.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 10:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AHkCIVQCttJsORy8uGh6CnJS1kpSLALzFdw6okmy7Pw=;
        b=IZCeu28NO9q7f5E1fMFSFphYrsTdMKUf4D/gQiMr9rg+jguL9GVOXNTPXcqjvqQMnZ
         hjGpKT/I8cgjWoSF88vV5mElx9BgHrEUfvgTtyi8UJTbxJyqpU+08MJdh5Kq8s6/gOTQ
         jqu2XJDv7hGGORTJ7QMivTHWyJuNXXzzV5pB8Y46NZFxQv507TxkWmAy2948wsB/Zzke
         KjbrNXKqU6E24DJteaktGjBRX/9kVRLQ357dDvuxN0iAl3fZk7VTf+VAR+LkqBcjEp9J
         1HNORWEKbqTsZ7I03n1UL8VEj+ugbrKmxt7Nebk14lKFvjfqFKtDCxABx6dP+xQ/aElP
         qdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AHkCIVQCttJsORy8uGh6CnJS1kpSLALzFdw6okmy7Pw=;
        b=R8xKmcUAcV/e24sxUSjovCi9og/8IT7ggpHgArqKlsjc3+hpv4plkPdo7oBeD0S3HJ
         8vb6oej1rH/lu0HP+yoqghWvBgc5A6mDZrZ+fFZxPhLg97IcTioF5VkawH0aZY5aXZzK
         5x1nvQtBgVNKHOuUUyvQI75QtGWaaF9IGZDB3w4hxxqZy4NxDHEQXCoNt0xGat+gMTPH
         oH0LsO+KxIYHeEJN3Un4qgW5YlRq2UIPfta77dxtJfNtdMTkMKc9IZ6uGu1mb3boVJes
         2iR6V3ia8PvyC5G0F9M1ZHD/N6iuZDRkkN7USg/JqX9kaV85R1D6+YWak7IcBGpzjrP0
         0Xfg==
X-Gm-Message-State: AOAM531d53GX2nwaj7jU9b8zspGsso/iGXWPrZvsqCgVpbhbb57oW8XU
	VYzAl4M1sk+frnUS2Kl4TIjvNl8qFOLrILCMMhg=
X-Google-Smtp-Source: 
 ABdhPJz1cswoogGJKA0NudMYoXlse4gaRte9I/5okI02PCywnQfZPh4O0FtuD3uXh2SszM3QfA7gyNRfKfclDD/t4/U=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr18288178qvr.110.1639073088206;
 Thu, 09 Dec 2021 10:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20211208205809.3079680-1-raj.khem@gmail.com>
 <20211209130803.GA30223@kudzu.us>
 <CAMKF1sp+0EYS=NL3fjmOT0vc6BMgYkGB7nrxcvwW0Ar=AhgptA@mail.gmail.com>
 <CAAnfSTugjDnJ2spAepURqBJJ6UnRJ_ZydTwdODOaVRqqBqhebQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTugjDnJ2spAepURqBJJ6UnRJ_ZydTwdODOaVRqqBqhebQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 10:04:22 -0800
Message-ID: 
 <CAMKF1sr0EHFn9TqxpLjb9mbWYrs3Qdmd3S6wbQOVF=jget+ybQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: Pin to use gcc for now
To: Ross Burton <ross@burtonini.com>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 18:04:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2588

On Thu, Dec 9, 2021 at 9:56 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Thu, 9 Dec 2021 at 15:16, Khem Raj <raj.khem@gmail.com> wrote:
>
> > Reproduction is simple add meta-clang to your belayers.conf and set TOO=
LCHAIN =3D =E2=80=9Cclang=E2=80=9D in local.conf and unbolt this workaround
>
> We build TF-A with Clang for Juno, so this isn't a fundamental problem.
>
> I'm tempted to say we should revert this and let meta-rockchip set
> this with an override.

Sounds good to me. If all machines in meta-arm are working fine with
clang. I can send a patch to meta-rockchip

>
> Ross

