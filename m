Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C04C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 07:55:37 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.3947.1641282936321100364
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 23:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NeujVHfB;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id o63so61827062uao.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 23:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9WX0Ua8lhU+30twB8OWDP4b7pdRJS8WMoZnH3HFGBsA=;
        b=NeujVHfBZPR96Bl/P+elgULWjjw/+J7aTID/lL3ZHun7McEZ0z+C9zSFg6CzmKHvJY
         rYsO6WfuHf7eC9N7tk56F/afSmIHbpwNoa+43I6n2YCXUHDC5i6zdZYmYcsb+Eo0sRJR
         fihgixSkuJ3eKreAZvWOD8rX+/wDXQp59cnG4p3LjM+WNEp+61z8U65aOW9BkOuEO5FE
         WPu4A8vI8EU2SFI8W6/UjyDE9207+1F/bXHLOtTX/5vUMtw7QsMKra2Ewo5Vy65Punuw
         Sj+plToxCiDWc8AljvLxgTJDljSheITVU8ytE2J3BwLAhGuidW8Gw1InEbmNNnBbvhHj
         DHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9WX0Ua8lhU+30twB8OWDP4b7pdRJS8WMoZnH3HFGBsA=;
        b=NenzJxee4kT4ckac2Qh/6LsgPGq3n2cMYiQBYblYwJW5uL849WaiX8aDbQGOBC3LzR
         XQx0YsdoPy+aVD6EDgXqW3DpyhLlg4/zjTCzBGZ1eDG0UNNAedct5mcVv7igTSINuG5M
         Y1iEV9ATGBpQrDlvFGrqXVkOO7F7hEZzGJHrgaRtcTjtSDEoE6DYOCgKaUGi25F5ib12
         A1jA37Tuttu6Ptd5714PUGnaldG2a3dm1GpqMdx8ru6opI++/AUPXTmYLGJmj+3G5XDH
         4jRZtIfM+wCiNHb3oNoRToYWziURSeZOFJC2FK6TML/K5WDb2cGVLeWNI9/Grknyagp4
         cjyQ==
X-Gm-Message-State: AOAM5305H1/Xu4vieEZZqJNEo+iRjKNvVCOJy6fgmQrGs8sekvCNiRZB
	wbiyLkI8s2ariDIyEoIEGFIO7DUVlxIqz7liH+T5aIn+
X-Google-Smtp-Source: 
 ABdhPJxQV9V2KQl2dUeg4Y6ma5i7HIIhNqv9K0QUSck+Nsalii8ZpKCHsZ/XiYf/QS1aFzkd4TczoCqJnN8qOqWeMiw=
X-Received: by 2002:a05:6102:f0e:: with SMTP id
 v14mr15015814vss.45.1641282935458;
 Mon, 03 Jan 2022 23:55:35 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
 <5f41546b0c3c904e9e5cca962fda4c6b48b5ee93.camel@linuxfoundation.org>
In-Reply-To: 
 <5f41546b0c3c904e9e5cca962fda4c6b48b5ee93.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Jan 2022 08:55:24 +0100
Message-ID: 
 <CANNYZj8tSvxroUxXHk0nZBp80o2D13vEizHVaSkn6D2AUizdKw@mail.gmail.com>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-arm@lists.yoctoproject.org,
	Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000005812ab05d4bcf61b"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 07:55:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2775

--0000000000005812ab05d4bcf61b
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Jan 2022 at 23:27, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Can't you just use the normal OE gcc compiler with the right flags passed
> in to
> disable the auto library pieces? or if that doesn't work, use an OE built
> baremetal compiler?
>

The normal compiler would then no longer be suited for native compilation
on the target, right?

The baremetal compiler would have to be set up in a cross-canadian fashion
- existing cross-canadian pieces cannot be used as they're made for SDK
builds. I'm not sure how to do it without making multiple copies of the
recipe for each canadian target, and then having to support and update them
in a private layer.

Basically both options seem worse to me from maintenance and testability
perspective than just building the vendor toolchain from source, but maybe
there is something specific to them I'm not seeing?

Alex

--0000000000005812ab05d4bcf61b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 3 Jan 2022 at 23:27, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Can&#39=
;t you just use the normal OE gcc compiler with the right flags passed in t=
o<br>
disable the auto library pieces? or if that doesn&#39;t work, use an OE bui=
lt<br>
baremetal compiler?<br></blockquote><div><br></div>The normal compiler woul=
d then no longer be suited for native compilation on the target, right?</di=
v><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">The barem=
etal compiler would have to be set up in a cross-canadian fashion - existin=
g cross-canadian pieces cannot be used as they&#39;re made for SDK builds. =
I&#39;m not sure how to do it without making multiple copies of the recipe =
for each canadian target, and then having to support and update them in a p=
rivate layer.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote">Basically both options seem worse to me from maintenance and testab=
ility perspective than just building the vendor toolchain from source, but =
maybe there is something specific to them I&#39;m not seeing?</div><div cla=
ss=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div=
>

--0000000000005812ab05d4bcf61b--

