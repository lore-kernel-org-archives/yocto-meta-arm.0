Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196FBC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:01:21 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.4806.1641290479762114691
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 02:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PoetKalT;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id h67so20438753vkh.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 02:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QYdB5enZB9zyNmpcqjsyeWcrE7HEMNxq6GxPBMlYlLg=;
        b=PoetKalTVHRvoXsFbVzSfO8/tUH3G8qaNjiOksxko7B8/XxjlVkDJnD9KbEK3dsj/O
         qLwfjOZrcPk11RQHuIIrAkUNgKLX/4cgH1OaWNvRRjVS6rkWjrV6Jp5EpcY5NADzXWEZ
         KF7SV4sDiP/dwKZMVCS9B8AhQWf/JEOiDDxFTZwpBWN8ycMq6WS8SIPnnsuKUd90WqZw
         1s6ybm9CRHak1VwxXyh6lwvpQjpZ7h0UQthiZ53zMqg5YMKW8YPL89xYzmKFcVmeTL0L
         5WliFsBq+a8X6SvYYYbAYYAyFAI3ZRrLrcux8IQBCag0s7YTIVQ0TZsv4iPu0+JRKrrx
         KRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QYdB5enZB9zyNmpcqjsyeWcrE7HEMNxq6GxPBMlYlLg=;
        b=EeXyYsQR9m2zI2ELCpn2ktdowHROeuUjDFFpCFkKt+5kxO7WyG9KIdTnCvIuuxvk9i
         1OVLV2qXjaNyvk5RonpLrbYXJmfluP40pomRdT2i4UPE5zD97Fqf+y/CBg7Rv6GZQe+/
         QqF425w2PfrjFbLy8rCbl4gSJqECbnvn5VGa5jc39fGWu/p3/6v/9BaQVPRoiU7CC1Ga
         1gc7C0P2HjqQmbYkMJzb3TCCFIXSbcQPbLW4UMo/GJ7g2DnPTo5pVn8YpqJSEPxFpMXX
         t1hkwFOSSwbLROectItnxJgATEP0d3pYTeqpG1U0Lml/izzBrB2ac7Fw7g2fh+GzNIY8
         /yCw==
X-Gm-Message-State: AOAM533r6J7w3hYcwMJ2AYO28JzGK/8V14sP+mBFz5pZO2aGNUXKgBV7
	kerIyG3egr5cBANsCfSoWM4uOccoxIF7jH0N4J4=
X-Google-Smtp-Source: 
 ABdhPJxQbvbwz6vMhLZAOozvpm2PVnj8zyfinK7mplcEaSJw4pr32pm+zOrB/KLBSNZj8QYVm8gi1KjYarwjDQHtPpA=
X-Received: by 2002:a1f:5fcb:: with SMTP id t194mr13404365vkb.1.1641290478917;
 Tue, 04 Jan 2022 02:01:18 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
 <5f41546b0c3c904e9e5cca962fda4c6b48b5ee93.camel@linuxfoundation.org>
 <CANNYZj8tSvxroUxXHk0nZBp80o2D13vEizHVaSkn6D2AUizdKw@mail.gmail.com>
 <283cdfc898038fee9465d4f24bd0113ec712dbb1.camel@linuxfoundation.org>
In-Reply-To: 
 <283cdfc898038fee9465d4f24bd0113ec712dbb1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Jan 2022 11:01:07 +0100
Message-ID: 
 <CANNYZj9YbywT+BmCDqzjaL-Lb5HRXoOwL7b-afLv2qnZbPA76A@mail.gmail.com>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-arm@lists.yoctoproject.org,
	Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000f81b6305d4beb764"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 10:01:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2777

--000000000000f81b6305d4beb764
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jan 2022 at 10:24, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> It is true that you'd need a different target variant for the second
> option I
> mentioned.
>
> I did have something slightly similar with extensions to the gcc/binutils
> recipes for a cross AVR toolchain that runs on an arm target. I found some
> copies here, based on daisy which whilst old, gives the idea:
>
>
> https://git.yoctoproject.org/poky-contrib/commit/?h=rpurdie/daisy&id=f58f90257a5af3e6b6974090e62cad9d90d53ae5
>

Right, I think I'll end up doing something like this, the question is
whether it should go directly to meta-arm, build from arm-provided gcc
source, and replace the prebuilt binary recipe already in place - for
better maintenance and testing. The customer does prefer that toolchain, as
they're already using Debian packaged one for development, and this would
align better.

Alex

--000000000000f81b6305d4beb764
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 4 Jan 2022 at 10:24, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It is t=
rue that you&#39;d need a different target variant for the second option I<=
br>
mentioned.<br>
<br>
I did have something slightly similar with extensions to the gcc/binutils<b=
r>
recipes for a cross AVR toolchain that runs on an arm target. I found some<=
br>
copies here, based on daisy which whilst old, gives the idea:<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/da=
isy&amp;id=3Df58f90257a5af3e6b6974090e62cad9d90d53ae5" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpur=
die/daisy&amp;id=3Df58f90257a5af3e6b6974090e62cad9d90d53ae5</a><br></blockq=
uote><div><br></div><div>Right, I think I&#39;ll end up doing something lik=
e this, the question is whether it should go directly to meta-arm, build fr=
om arm-provided gcc source, and replace the prebuilt binary recipe already =
in place - for better maintenance and testing. The customer does prefer tha=
t toolchain, as they&#39;re already using Debian packaged one for developme=
nt, and this would align better.<br></div><div><br></div><div>Alex<br></div=
></div></div>

--000000000000f81b6305d4beb764--

