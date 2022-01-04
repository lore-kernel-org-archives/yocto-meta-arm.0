Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576ABC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:05:47 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.4834.1641290745774111193
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 02:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FMMiV563;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id p37so62089282uae.8
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 02:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WBRhlGTtXVSKa5Cq1VFk0Z20PFZuUE6dANjaX5nq3Kk=;
        b=FMMiV563MuKyj10rg7M6+F3J0ZmtyCPMLKdYVpn8Q0kliyVa4T1hZ1vK3OYjaaXcld
         gCaWEd85twNTHU3jfWl+Q+D64tZKc+uQAqRFXvluMs/d85cs4daYIv8giTTyI5LqVI5E
         03HCGusKLJPr+D/Y1pcCZ2gNhSXbEvSKNbE655Qz1GZe++Perq9FVWPLkMsgYoqCVqIZ
         WttSF9R+byA3nF5hvM28nOa2zehwVwO4avymPcAR2srKiD7X6YRt4fQsDbjzyN5ngvCE
         JLTyDODzgXd9s8oN7nLRqS34OlbC+S+vLJVUkMk185SHMdta1ySz1Cg+m6CeIoO+vYlg
         3Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WBRhlGTtXVSKa5Cq1VFk0Z20PFZuUE6dANjaX5nq3Kk=;
        b=m5ZN8IjfwqV+6WFxC3JkeFnJcWaYiUw8SkBXbYXY7qOgcpKGB0jI72Q06zAvs8wZ+Z
         bUS0zQoua6+ZX3ErbvdQm0a7qwxi/mRK+w5wsddCYibpWdYws653PcaYTRiGu94BavG0
         /pwtAr3WF2sRmOOK1RzqTkojcpXFWlluRGHPONZ0d/cdKRtEssInp0fdSXilSU3MOK3E
         yeaPPU239TO1hLn45F7M5T3Q35i9Oao8OQCVGbaT3Iq835trSicR1zeBReJ2/9D95fHE
         g7YuaiyZhiDmLjnOLsmzQTcqOAo7A9wcFjmcuw4SpSoCRqS2mMjq0deO0/hzqBjtjbxY
         PcvA==
X-Gm-Message-State: AOAM532y8libCk5iNrsJnismFiF89ok9UTweursHtpPRewCwXQO2edaa
	0763gufm9IYar6mzkxhQnV4uWg9sAM4Fza18KjI=
X-Google-Smtp-Source: 
 ABdhPJznDsYU5oJRLf9QaD0F52t7j/Xuo9EgcnxuGCUI4X+JwHo1xhaiByxoO2pwir+VYJWOGQgEeckr4waNA64CXEU=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr16003434uai.89.1641290744850;
 Tue, 04 Jan 2022 02:05:44 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
 <5f41546b0c3c904e9e5cca962fda4c6b48b5ee93.camel@linuxfoundation.org>
 <CANNYZj8tSvxroUxXHk0nZBp80o2D13vEizHVaSkn6D2AUizdKw@mail.gmail.com>
 <283cdfc898038fee9465d4f24bd0113ec712dbb1.camel@linuxfoundation.org>
 <16C708FEEAB9A6C0.4600@lists.yoctoproject.org>
In-Reply-To: <16C708FEEAB9A6C0.4600@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Jan 2022 11:05:33 +0100
Message-ID: 
 <CANNYZj8B2YExGwVxtyiYHQWsgaYpxdQ7VAyFFZSpD9UJXyws6w@mail.gmail.com>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 meta-arm@lists.yoctoproject.org,
	Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000d1ebc005d4bec7a0"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 10:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2778

--000000000000d1ebc005d4bec7a0
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jan 2022 at 11:01, Alexander Kanavin via lists.yoctoproject.org
<alex.kanavin=gmail.com@lists.yoctoproject.org> wrote:

> Right, I think I'll end up doing something like this, the question is
> whether it should go directly to meta-arm, build from arm-provided gcc
> source, and replace the prebuilt binary recipe already in place - for
> better maintenance and testing. The customer does prefer that toolchain, as
> they're already using Debian packaged one for development, and this would
> align better.
>

Another alternative is offline SDK installs into target images by
repackaging them via helper recipes :) I started working in that direction,
but it's significantly more complex, so we're exploring direct toolchain
builds first.

Alex

--000000000000d1ebc005d4bec7a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 4 Jan 2022 at 11:01, Alexander Kanavin via <a href=3D"http:/=
/lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;alex.kanavin=3D<a h=
ref=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoprojec=
t.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote">Right, I think I&#39;ll en=
d up doing something like this, the question is whether it should go direct=
ly to meta-arm, build from arm-provided gcc source, and replace the prebuil=
t binary recipe already in place - for better maintenance and testing. The =
customer does prefer that toolchain, as they&#39;re already using Debian pa=
ckaged one for development, and this would align better.<br></div></div></b=
lockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_qu=
ote">Another alternative is offline SDK installs into target images by repa=
ckaging them via helper recipes :) I started working in that direction, but=
 it&#39;s significantly more complex, so we&#39;re exploring direct toolcha=
in builds first.</div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">Alex<br></div></div>

--000000000000d1ebc005d4bec7a0--

