Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC78C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 15:19:24 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.12458.1664291961383179294
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 08:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QZOKclo0;
 spf=pass (domain: gmail.com, ip: 209.85.167.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id n83so12187594oif.11
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EFjtqxIoQgzqvegx1r2CNeIXxIOtTqx8zINJtfLt4ps=;
        b=QZOKclo05Siu0HIL2xh1/zvmxDyld1H7K2V8f5e7/8I12x12NqSoqJ0Pt6BKU0aCEo
         HZvV7bgow6Y0q+HY30J0/una7+h0cKvNbivxFT4sVEID/VdSpieK4583qK3nPCBknzsv
         Bv4eLBJ1HE0danr5Vqb5lioGqWLs0xfxaz1gT6tGfVNJwCNQhNqK0RvmvJrknnZoJNav
         gkO50q4YR7h2130Jkj7haeAdg0zNiRBKs1zO8EILe/Vs0W9y55nDg6X+LBBY2KM1zSOj
         7k8rMN4Wn2wI1w3Kl0l+UZj61y2AjKLv4FI9KKZk6jV69kFj4K8CDUp9oUb2mKuY7tOA
         aOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EFjtqxIoQgzqvegx1r2CNeIXxIOtTqx8zINJtfLt4ps=;
        b=jbVOvwjyY7yWoU8rwXjyl6UgiNrXCVi1Jxrr76eFzPCMVPLd308GHQ2kCxeFc2fZJ3
         pmMdwD3YPaxCiwID2l+Q2i7iJz3U7r87olfSiqqMNMeSGvlOMoBahFqE02hnD6qBeALX
         c+nppjf1DPSoMbCcPNyzSokNJHdnKBP/iS0ZAqVJ5/O2V+lc+pIHMmP04mKvajo2vcEa
         6PUHDuyEaxuJ7I9Y+X67IbTyL+ku7o/jyNaE5N/2CU2BUbtkzt/wd5/Oy2pFAWnfn3BQ
         6gFS7rjL3KyiW+EGduuJoCDxA4cj7RIxY4xw1gzunE4nlhMavFdZy6KRDPcHPwvXpGuF
         1uPw==
X-Gm-Message-State: ACrzQf3QrxfDV46qyJ4EnD5aKxR9Uv4KyYp8oVTwstUV1toFxdjw/XN4
	RTFOcdndFnaemI3FKfAY5K4JxYJFts3HjVeEFdxhSDNjmRI=
X-Google-Smtp-Source: 
 AMsMyM4/LVx859SKMCGlUrbc/5Cp0+OL0DFrwBOi2/SHToHDDn3Hqajn4GdzuTJxEbuF/J1fETZ4jMhAZv13Pnh6d+0=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr2013819oib.262.1664291960464; Tue, 27
 Sep 2022 08:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220926222642.3105379-1-raj.khem@gmail.com>
 <9E83B847-E36F-4EFC-BAA8-E09C273D615F@arm.com>
In-Reply-To: <9E83B847-E36F-4EFC-BAA8-E09C273D615F@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2022 08:19:09 -0700
Message-ID: 
 <CAMKF1sru1-OJdkfcnM31h=gRYvUa7_B9STVGr4Jmg7rn1TpfVg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] hafnium: Exclude from world builds
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001b319305e9aa2b18"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Sep 2022 15:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3848

--0000000000001b319305e9aa2b18
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 3:12 AM Ross Burton <Ross.Burton@arm.com> wrote:

> It brings its own compiler, so the host compiler shouldn=E2=80=99t be rel=
evant.
>
> What build configuration is making this break?  We can be more specific
> with exclusions than this.


That=E2=80=99s fine it=E2=80=99s not building at all here so fixing that wo=
uld be fine I
just wanted it to be either building or put aside

>
>
> Ross
>
> > On 26 Sep 2022, at 23:26, Khem Raj via lists.yoctoproject.org <raj.khem=
=3D
> gmail.com@lists.yoctoproject.org> wrote:
> >
> > This does not build with clang from meta-clang and also does not build
> > with gcc either
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
> b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
> > index d90f747..0c4e294 100644
> > --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
> > +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
> > @@ -77,3 +77,5 @@ python() {
> >     if d.getVar("BUILD_ARCH") !=3D "x86_64":
> >         raise bb.parse.SkipRecipe("Cannot be built on non-x86-64 hosts"=
)
> > }
> > +
> > +EXCLUDE_FROM_WORLD =3D "1"
> > --
> > 2.37.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3842):
> https://lists.yoctoproject.org/g/meta-arm/message/3842
> > Mute This Topic: https://lists.yoctoproject.org/mt/93938627/6875888
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000001b319305e9aa2b18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 27, 2022 at 3:12 AM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">It brings its own compiler, so the host compiler shouldn=E2=
=80=99t be relevant.<br>
<br>
What build configuration is making this break?=C2=A0 We can be more specifi=
c with exclusions than this.</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">That=E2=80=99s fine it=E2=80=99s not building at all here so fi=
xing that would be fine I just wanted it to be either building or put aside=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Ross<br>
<br>
&gt; On 26 Sep 2022, at 23:26, Khem Raj via <a href=3D"http://lists.yoctopr=
oject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=
=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; This does not build with clang from meta-clang and also does not build=
<br>
&gt; with gcc either<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.7.bb" rel=3D"=
noreferrer" target=3D"_blank">hafnium_2.7.bb</a> | 2 ++<br>
&gt; 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.=
7.bb" rel=3D"noreferrer" target=3D"_blank">hafnium_2.7.bb</a> b/meta-arm/re=
cipes-bsp/hafnium/<a href=3D"http://hafnium_2.7.bb" rel=3D"noreferrer" targ=
et=3D"_blank">hafnium_2.7.bb</a><br>
&gt; index d90f747..0c4e294 100644<br>
&gt; --- a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.7.bb" r=
el=3D"noreferrer" target=3D"_blank">hafnium_2.7.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.7.bb" r=
el=3D"noreferrer" target=3D"_blank">hafnium_2.7.bb</a><br>
&gt; @@ -77,3 +77,5 @@ python() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;BUILD_ARCH&quot;) !=3D &quot;x86_=
64&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&quot;Canno=
t be built on non-x86-64 hosts&quot;)<br>
&gt; }<br>
&gt; +<br>
&gt; +EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#3842): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/3842" rel=3D"noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/g/meta-arm/message/3842</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/93938627=
/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/93938627/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org=
" target=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/me=
ta-arm/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">=
ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000001b319305e9aa2b18--

