Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33FAC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 16:05:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.750.1664553951614677638
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 09:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DcuZ7vga;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-127dca21a7dso5924928fac.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=As+/A3g3uXcq8pVwDCL7cxNM4njSMPI4ePLDMxm9NUk=;
        b=DcuZ7vgaq+nxqTK7gaSoqALsl++EqJhD2jRuEIYRhsPpbbxiDX6QAQAKd5lU3R+70z
         /boGzCBVfsvD5L2LCC5NeXg2fz6iZoVnztY9OcegvKShew9+3g18/FkvNCU0b3t9FdDe
         H0yXRZ9v2ecoPEXXLRoT6k13d7ljHumtWsxabtKPmhWIDzRNg0I/lK+U9VZcTR/i2Bv6
         FnQw0L0D+Kz7P1cadhD2TpC3Q3YXJIHpjFRyayzzZ8IF4+WaIsscx9YhOnIdzX3wOkJa
         t84s8/MoKHbCq0J+u6R0bXcuvvcYMc6pQN0OYo/60RTHwto/EK5QEoVGbk+3eHiBDeys
         jYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=As+/A3g3uXcq8pVwDCL7cxNM4njSMPI4ePLDMxm9NUk=;
        b=SXHBXGJz/oTAYSXlTLEpFh15HEsr8ecQZlKrg51K57FW+l+sfpB7Y+hHOkgsRvWAdI
         DwaN5L0PZwPtLjxiCkQByyZsvHg6MKcFivTa0jSqpD86QwZOJbPFlVxSsuMF604s/c8i
         7unNjns1bC4gNeVIhTAeUGQlYiT1ItLJ+CLLNzt5RRrhD+7CHkTFeKB49CdW5Hwzs6/S
         Leg34rhbCJrHEZfoO3v6HOveylAL0FMbAXdjjnTqIUk1iUTH9ty1BePPWzt+Gn04KcBI
         Iv51p05orF8ViGmiU/vLGfd/oiJajl/P9UiW4VZ3M7W+YetCp23tHT67U9+NGdbm5Wpe
         lCVg==
X-Gm-Message-State: ACrzQf1fFagmPo3gNGdMyaV+tjUDCykz31b3JrEqEMZkD7UNUyTttvmv
	cvHWT+VmZZJZJyUe27AdLPR5cLpMi3PRK6gG22o=
X-Google-Smtp-Source: 
 AMsMyM6PWtBcDTw/zNzlT9K6LjjYlTv4x6AlxlYon9m01sxUyaNn+VAPwIPLoOADeFB4EMmL1pzkneIuVIKOpNaWjiI=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr11668937oae.262.1664553950791; Fri, 30
 Sep 2022 09:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220929234100.3608904-1-raj.khem@gmail.com>
 <76DDEF7D-5729-44CE-BE8E-F1489A7A6715@arm.com>
In-Reply-To: <76DDEF7D-5729-44CE-BE8E-F1489A7A6715@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 09:05:40 -0700
Message-ID: 
 <CAMKF1sqPaZRpo-Whmn6RYiM2XwOR7POMzmJdw+eQR+PXod5QBw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layers: Add langdale to LAYERSERIES_COMPAT
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f24dd705e9e72a22"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 16:05:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3882

--000000000000f24dd705e9e72a22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 3:03 AM Ross Burton <Ross.Burton@arm.com> wrote:

> I was dithering over whether we should support kirkstone in master or not
> (see Jon=E2=80=99s patch which removes kirkstone), so I thought I=E2=80=
=99d actually try it.
>
> Turns out master hasn=E2=80=99t worked with kirkstone for a long time.
>
> Hopefully post-release oe-core master will get the new name quickly, so w=
e
> can change meta-arm and we don=E2=80=99t have this last minute breakage.


Yeah I think the core should Perhaps warn for few weeks ahead of time to
let layers catch up with needed changes before making it a hard error


>
> Ross
>
> > On 30 Sep 2022, at 00:41, Khem Raj via lists.yoctoproject.org <raj.khem=
=3D
> gmail.com@lists.yoctoproject.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta-arm-bsp/conf/layer.conf       | 2 +-
> > meta-arm-toolchain/conf/layer.conf | 2 +-
> > meta-arm/conf/layer.conf           | 2 +-
> > meta-atp/conf/layer.conf           | 2 +-
> > meta-gem5/conf/layer.conf          | 2 +-
> > 5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.con=
f
> > index a1e22c0..236d9a5 100644
> > --- a/meta-arm-bsp/conf/layer.conf
> > +++ b/meta-arm-bsp/conf/layer.conf
> > @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
> > BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
> > BBFILE_PRIORITY_meta-arm-bsp =3D "5"
> >
> > -LAYERSERIES_COMPAT_meta-arm-bsp =3D "kirkstone"
> > +LAYERSERIES_COMPAT_meta-arm-bsp =3D "kirkstone langdale"
> >
> > LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
> > # This won't be used by layerindex-fetch, but works everywhere else
> > diff --git a/meta-arm-toolchain/conf/layer.conf
> b/meta-arm-toolchain/conf/layer.conf
> > index 3cb8b06..935eb62 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
> > BBFILE_PRIORITY_arm-toolchain =3D "5"
> >
> > LAYERDEPENDS_arm-toolchain =3D "core"
> > -LAYERSERIES_COMPAT_arm-toolchain =3D "kirkstone"
> > +LAYERSERIES_COMPAT_arm-toolchain =3D "kirkstone langdale"
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index c23ea56..4b3161e 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
> >     core \
> >     arm-toolchain \
> > "
> > -LAYERSERIES_COMPAT_meta-arm =3D "kirkstone"
> > +LAYERSERIES_COMPAT_meta-arm =3D "kirkstone langdale"
> >
> > # runfvp --console needs telnet, so pull this in for testimage.
> > HOSTTOOLS_NONFATAL +=3D "telnet"
> > diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
> > index 3ec36e8..043d601 100644
> > --- a/meta-atp/conf/layer.conf
> > +++ b/meta-atp/conf/layer.conf
> > @@ -6,4 +6,4 @@ BBFILE_COLLECTIONS +=3D "meta-atp"
> > BBFILE_PATTERN_meta-atp =3D "^${LAYERDIR}/"
> >
> > LAYERDEPENDS_meta-atp =3D "core openembedded-layer meta-gem5"
> > -LAYERSERIES_COMPAT_meta-atp =3D "kirkstone"
> > +LAYERSERIES_COMPAT_meta-atp =3D "kirkstone langdale"
> > diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
> > index d329bd0..3802b43 100644
> > --- a/meta-gem5/conf/layer.conf
> > +++ b/meta-gem5/conf/layer.conf
> > @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 =3D "^${LAYERDIR}/"
> > BBFILE_PRIORITY_meta-gem5 =3D "5"
> >
> > LAYERDEPENDS_meta-gem5 =3D "core openembedded-layer meta-arm"
> > -LAYERSERIES_COMPAT_meta-gem5 =3D "kirkstone"
> > +LAYERSERIES_COMPAT_meta-gem5 =3D "kirkstone langdale"
> >
> > BBFILES_DYNAMIC +=3D " \
> >
>  virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/=
*.bbappend
> \
> > --
> > 2.37.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3879):
> https://lists.yoctoproject.org/g/meta-arm/message/3879
> > Mute This Topic: https://lists.yoctoproject.org/mt/94006911/6875888
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000f24dd705e9e72a22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 30, 2022 at 3:03 AM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">I was dithering over whether we should support =
kirkstone in master or not (see Jon=E2=80=99s patch which removes kirkstone=
), so I thought I=E2=80=99d actually try it.<br>
<br>
Turns out master hasn=E2=80=99t worked with kirkstone for a long time.<br>
<br>
Hopefully post-release oe-core master will get the new name quickly, so we =
can change meta-arm and we don=E2=80=99t have this last minute breakage.</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah I think the co=
re should Perhaps warn for few weeks ahead of time to let layers catch up w=
ith needed changes before making it a hard error</div><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Ross<br>
<br>
&gt; On 30 Sep 2022, at 00:41, Khem Raj via <a href=3D"http://lists.yoctopr=
oject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=
=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta-arm-bsp/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; meta-arm-toolchain/conf/layer.conf | 2 +-<br>
&gt; meta-arm/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +=
-<br>
&gt; meta-atp/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +=
-<br>
&gt; meta-gem5/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; 5 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.co=
nf<br>
&gt; index a1e22c0..236d9a5 100644<br>
&gt; --- a/meta-arm-bsp/conf/layer.conf<br>
&gt; +++ b/meta-arm-bsp/conf/layer.conf<br>
&gt; @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D &quot;meta-arm-bsp&quot;<br>
&gt; BBFILE_PATTERN_meta-arm-bsp =3D &quot;^${LAYERDIR}/&quot;<br>
&gt; BBFILE_PRIORITY_meta-arm-bsp =3D &quot;5&quot;<br>
&gt; <br>
&gt; -LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;kirkstone&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;kirkstone langdale&quot;<br=
>
&gt; <br>
&gt; LAYERDEPENDS_meta-arm-bsp =3D &quot;core meta-arm&quot;<br>
&gt; # This won&#39;t be used by layerindex-fetch, but works everywhere els=
e<br>
&gt; diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/c=
onf/layer.conf<br>
&gt; index 3cb8b06..935eb62 100644<br>
&gt; --- a/meta-arm-toolchain/conf/layer.conf<br>
&gt; +++ b/meta-arm-toolchain/conf/layer.conf<br>
&gt; @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D &quot;^${LAYERDIR}/&=
quot;<br>
&gt; BBFILE_PRIORITY_arm-toolchain =3D &quot;5&quot;<br>
&gt; <br>
&gt; LAYERDEPENDS_arm-toolchain =3D &quot;core&quot;<br>
&gt; -LAYERSERIES_COMPAT_arm-toolchain =3D &quot;kirkstone&quot;<br>
&gt; +LAYERSERIES_COMPAT_arm-toolchain =3D &quot;kirkstone langdale&quot;<b=
r>
&gt; diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf<br>
&gt; index c23ea56..4b3161e 100644<br>
&gt; --- a/meta-arm/conf/layer.conf<br>
&gt; +++ b/meta-arm/conf/layer.conf<br>
&gt; @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0core \<br>
&gt;=C2=A0 =C2=A0 =C2=A0arm-toolchain \<br>
&gt; &quot;<br>
&gt; -LAYERSERIES_COMPAT_meta-arm =3D &quot;kirkstone&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-arm =3D &quot;kirkstone langdale&quot;<br>
&gt; <br>
&gt; # runfvp --console needs telnet, so pull this in for testimage.<br>
&gt; HOSTTOOLS_NONFATAL +=3D &quot;telnet&quot;<br>
&gt; diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf<br>
&gt; index 3ec36e8..043d601 100644<br>
&gt; --- a/meta-atp/conf/layer.conf<br>
&gt; +++ b/meta-atp/conf/layer.conf<br>
&gt; @@ -6,4 +6,4 @@ BBFILE_COLLECTIONS +=3D &quot;meta-atp&quot;<br>
&gt; BBFILE_PATTERN_meta-atp =3D &quot;^${LAYERDIR}/&quot;<br>
&gt; <br>
&gt; LAYERDEPENDS_meta-atp =3D &quot;core openembedded-layer meta-gem5&quot=
;<br>
&gt; -LAYERSERIES_COMPAT_meta-atp =3D &quot;kirkstone&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-atp =3D &quot;kirkstone langdale&quot;<br>
&gt; diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf<br>
&gt; index d329bd0..3802b43 100644<br>
&gt; --- a/meta-gem5/conf/layer.conf<br>
&gt; +++ b/meta-gem5/conf/layer.conf<br>
&gt; @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 =3D &quot;^${LAYERDIR}/&quo=
t;<br>
&gt; BBFILE_PRIORITY_meta-gem5 =3D &quot;5&quot;<br>
&gt; <br>
&gt; LAYERDEPENDS_meta-gem5 =3D &quot;core openembedded-layer meta-arm&quot=
;<br>
&gt; -LAYERSERIES_COMPAT_meta-gem5 =3D &quot;kirkstone&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-gem5 =3D &quot;kirkstone langdale&quot;<br>
&gt; <br>
&gt; BBFILES_DYNAMIC +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtualization-layer:${LAYERDIR}/dynamic-layers/met=
a-virtualization/*/*/*.bbappend \<br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#3879): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/3879" rel=3D"noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/g/meta-arm/message/3879</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94006911=
/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/94006911/6875888</a><br>
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

--000000000000f24dd705e9e72a22--

