Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E03C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 21:15:10 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.6897.1641417309695667582
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 13:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YoQ/sFth;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id o1so812253uap.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 13:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KV+gDB/X7dx4LBnLreXQPRnuGN1JeQeTxQXdmNhysqM=;
        b=YoQ/sFthathk/wQ0qO7+UW1PZGO7EcgaVPrU15FJY21a80E/1i6cCosfZNBNyFePv7
         DaoSEajvJTxT8sUJ1BkUi5mMJ/vCcOkhNrIa8m+3lK4wW1/SV026K4fwFzC21IdSGbSX
         UtdNsCUlvjRgOyYVn/3mOMoCUcYSC5ktAW3rh+57RV3DEUfVV0sVYtCrWDG3AD1J9mFE
         lGoV5JtXumUG1nVhFQV3vF9uAU/wfQ8JwsE3qOr19UtWvD104g7RQFiwxWzDXzVafh6P
         p0Itg0B7EQeHYTNRpq/odzBl6j2O/3O6djryDJzCe1GR8CLy+OMx535YXtzGKuQvpMyl
         nYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KV+gDB/X7dx4LBnLreXQPRnuGN1JeQeTxQXdmNhysqM=;
        b=MavFRr5DRZMCyjhxm4dVeEitwgiu7172tutppCQP2mKutgIz77JnTFbSJ1OsX2ruw3
         gsEoqeEH2V1Kdj8CEkon3CJdFKcou0RYDOzCol44ZMpZ/6kkg2Yn8qQl0b+3wQzYmb5o
         oE0302Hh3fs72SsmxwAhPAHUiYwxtxwSn+RJ9tJafbzM0B1p8mU62Eh5eGP4eGj8jX1Q
         cCaGm+oH+xIPfU3yiZfksqTwWmRrosiXyBme64o2sgVVDGzOJaNu8jXfADeaNsLEp5LI
         ohqN0xhkjnCyekCqRkEQJbhGTTr1WvGaeM51TWJLExBb8CiFtcWBs1sMamSbMlvVbTuT
         dYrA==
X-Gm-Message-State: AOAM532w/ikiRrhHWRqXrC2o17AwW/z+BqGg5JtL6hNoGUm806G9D186
	vMxD5A50hlC1f6P+39RP+P03OqrG01mPz6/jHGw=
X-Google-Smtp-Source: 
 ABdhPJxQWxCoefuzcou+tH4dz6tyJ+Uxn0JlbrMCyAXuTzw8npWwTYjr6N3mx3wqgi11HOnsogR6vBMAguTBt4UH3xU=
X-Received: by 2002:a05:6102:370c:: with SMTP id
 s12mr16024194vst.42.1641417308855;
 Wed, 05 Jan 2022 13:15:08 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
 <5f41546b0c3c904e9e5cca962fda4c6b48b5ee93.camel@linuxfoundation.org>
 <CANNYZj8tSvxroUxXHk0nZBp80o2D13vEizHVaSkn6D2AUizdKw@mail.gmail.com>
 <283cdfc898038fee9465d4f24bd0113ec712dbb1.camel@linuxfoundation.org>
In-Reply-To: 
 <283cdfc898038fee9465d4f24bd0113ec712dbb1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Jan 2022 22:14:57 +0100
Message-ID: 
 <CANNYZj_eZOiGHvfskS8HetKPXSoSzYQaM4ZynUMz8TWyVkxAeg@mail.gmail.com>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-arm@lists.yoctoproject.org,
	Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000009f60c205d4dc3f3e"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jan 2022 21:15:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2800

--0000000000009f60c205d4dc3f3e
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
> I definitely have something more recent locally too (pyro, can't remember
> if I
> made it to dunfell with that code), I can dig that out if it is
> interesting. I
> thought somewhere I had a BBCLASSEXTEND recipe which added multiple cross
> compiler arches on target but I can't find that one :/.
>

After poking at the vendor toolchain a bit, I don't think building that
from source is a great option either. Perhaps the best solution is to use
the mcextend class to do the needed tweaks directly inside the binutils/gcc
recipes (or as bbappends in meta-arm perhaps). Does that sound about right?

Alex

--0000000000009f60c205d4dc3f3e
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
die/daisy&amp;id=3Df58f90257a5af3e6b6974090e62cad9d90d53ae5</a><br>
<br>
I definitely have something more recent locally too (pyro, can&#39;t rememb=
er if I<br>
made it to dunfell with that code), I can dig that out if it is interesting=
. I<br>
thought somewhere I had a BBCLASSEXTEND recipe which added multiple cross<b=
r>
compiler arches on target but I can&#39;t find that one :/.<br></blockquote=
><div><br></div>After poking at the vendor toolchain a bit, I don&#39;t thi=
nk building that from source is a great option either. Perhaps the best sol=
ution is to use the mcextend class to do the needed tweaks directly inside =
the binutils/gcc recipes (or as bbappends in meta-arm perhaps). Does that s=
ound about right?</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Alex<br></div></div>

--0000000000009f60c205d4dc3f3e--

