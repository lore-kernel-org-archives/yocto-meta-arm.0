Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.6606.1586325986629215306
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 23:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Hq5EIsuD;
 spf=pass (domain: linaro.org, ip: 209.85.222.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-qk1-f193.google.com with SMTP id v7so2121358qkc.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2020 23:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=goA2pH1sCSHb4j5wSl+uiK8WeY4ug/cH7brWHeG7QSs=;
        b=Hq5EIsuDNVBkbH/CawBINvWPYyNmgfpn4IiCEF26t/MVQgd2UNuwIEaPLZEOtXU0CZ
         MdnwhVQzY8YfBSiXx3SLhhfGJqH6CZ3iLI4IsTDtiKciFIa4zS8WU0nECfcNDVgg1uqJ
         tHHIoRehVAtfM/EL/jxhCPUHqpmyByaNCf40IDgk9yLJSu7+370lwGbX8NVtIXgwQS3l
         W0ek31OSPpOq0bxYuQmB/Gq6zog0c7NV5d4PrraM9aR8qNjfAiJZfMKCQOfQmVx0JXtQ
         NCipvPxPUFHnEnsa4itY595RaKzstXDIzc8QA1Cd1liO1IlfnZXn7NhxnPOzjvFzhHjY
         UX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=goA2pH1sCSHb4j5wSl+uiK8WeY4ug/cH7brWHeG7QSs=;
        b=p3Quy4RxD5FOkVz0XmM/kW/LjycYGrnfpuoo+MeTcsfXfpHo4UjNpL7po4OHCIVPew
         5N3ymgOsTChajih8h5grPg8XTwKbkSjL6GQQEfaovE9HBYvOYrrG5Kf0y0/MOFcYxrij
         RJOn13VFvFCV5eQaDxXusQ0g3Q3/G7FIZh9RHP/ZiC28QZzz7G4poaYEL1fhwXiq3VSI
         WC8agirBRIPComhSVZuO8JySvOa3WPXqFaQIb+LvxMiPYjj1TwONuZxvj9FmZDFoDvsA
         zI0E/cUFD198n2Xk+8oIa4PKtFduz+eohZ2o09Hy8lRQImt/deApm5RZoT++HNmC1b3K
         uBJw==
X-Gm-Message-State: AGi0PuZWXpWO8eXzPNsTmJSbXuVPlDTAKnv9s5y9k4DpCM77grL7i8/k
	pQfAycNQKl2hgScNnSLx4ozBQVBf/VxG9uqZ2QLOgdLnUMg=
X-Google-Smtp-Source: APiQypJ+E/fHGcmpSXdfBmLbMb7uZ7XGNiwgdXvD39QwBwg7y4E35+S+kliOsCpME2HamO1/4H/udG95Kqsn+GR38KY=
X-Received: by 2002:a25:870f:: with SMTP id a15mr9647854ybl.397.1586325985453;
 Tue, 07 Apr 2020 23:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <1585684637-53492-1-git-send-email-denis@denix.org>
 <20200408034234.GD29748@kudzu.us> <20200408035233.GA1578@denix.org>
In-Reply-To: <20200408035233.GA1578@denix.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 8 Apr 2020 08:06:14 +0200
Message-ID: <CAP71WjwNZLxTL1sPW01w3oC1SAuYPb+qPwA9p+982FvqTL+P0w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="000000000000dc873d05a2c14c93"

--000000000000dc873d05a2c14c93
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 8, 2020 at 5:52 AM Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, Apr 07, 2020 at 11:42:35PM -0400, Jon Mason wrote:
> > On Tue, Mar 31, 2020 at 03:57:17PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  meta-arm-bsp/conf/layer.conf       | 2 +-
> > >  meta-arm-toolchain/conf/layer.conf | 3 +--
> > >  meta-arm/conf/layer.conf           | 2 +-
> > >  3 files changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta-arm-bsp/conf/layer.conf
> b/meta-arm-bsp/conf/layer.conf
> > > index 0632ba3..8afcbe5 100644
> > > --- a/meta-arm-bsp/conf/layer.conf
> > > +++ b/meta-arm-bsp/conf/layer.conf
> > > @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
> > >  BBFILE_PRIORITY_meta-arm-bsp = "6"
> > >
> > >  LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
> > > -LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
> > > +LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> >
> > I was actually waiting for dunfell to be released, then I was going to
> > remove warrior and zeus when adding dunfell.  The logic behind this is
> > to limit the scope of our support and testing.  To my knowledge, no one
> > is using meta-arm in production for warrior or zeus, so I don't think
> > it's an issue.
>
> Jon,
>
> You can remove warrior and zeus later, but OE-Core master has been only
> compatible with dunfell for couple weeks now and meta-arm in unusable w/o
> a similar change.


+1. We would like to switch our OE RPB builds to meta-arm-toolchain, and
remove our copy of gcc-arm from meta-linaro-toolchain, but we can't do that
until this patch gets in.
OE-core is typically updated several weeks before the release, that allows
all layers to get ready for the release.


>


> --
> Denys
>
>
> > Thanks,
> > Jon
> >
> > >
> > >  # We have patches for xen but meta-virtualization might not be there
> so filter
> > >  # out recipes-extended/xen unless xen is activated in the features
> > > diff --git a/meta-arm-toolchain/conf/layer.conf
> b/meta-arm-toolchain/conf/layer.conf
> > > index a247dc1..3a4c4f0 100644
> > > --- a/meta-arm-toolchain/conf/layer.conf
> > > +++ b/meta-arm-toolchain/conf/layer.conf
> > > @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
> > >  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
> > >  BBFILE_PRIORITY_arm-toolchain = "30"
> > >
> > > -LAYERSERIES_COMPAT_arm-toolchain = "zeus"
> > > +LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
> > >
> > >  # do not error out on bbappends for missing recipes
> > >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> > > -
> > > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > > index 65ccd15..0b93e8d 100644
> > > --- a/meta-arm/conf/layer.conf
> > > +++ b/meta-arm/conf/layer.conf
> > > @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
> > >  BBFILE_PRIORITY_meta-arm = "6"
> > >
> > >  LAYERDEPENDS_meta-arm = "core"
> > > -LAYERSERIES_COMPAT_meta-arm = "warrior zeus"
> > > +LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > > --
> > > 2.7.4
> > >
> >
> > >
> >
>
> >
>
> 
>

--000000000000dc873d05a2c14c93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 8, 2020 at 5:52 AM Denys =
Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, A=
pr 07, 2020 at 11:42:35PM -0400, Jon Mason wrote:<br>
&gt; On Tue, Mar 31, 2020 at 03:57:17PM -0400, Denys Dmytriyenko wrote:<br=
>
&gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targ=
et=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.=
com" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-arm-bsp/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
 +-<br>
&gt; &gt;=C2=A0 meta-arm-toolchain/conf/layer.conf | 3 +--<br>
&gt; &gt;=C2=A0 meta-arm/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 3 files changed, 3 insertions(+), 4 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/la=
yer.conf<br>
&gt; &gt; index 0632ba3..8afcbe5 100644<br>
&gt; &gt; --- a/meta-arm-bsp/conf/layer.conf<br>
&gt; &gt; +++ b/meta-arm-bsp/conf/layer.conf<br>
&gt; &gt; @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp =3D &quot;^${LAYER=
DIR}/&quot;<br>
&gt; &gt;=C2=A0 BBFILE_PRIORITY_meta-arm-bsp =3D &quot;6&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 LAYERDEPENDS_meta-arm-bsp =3D &quot;core openembedded-laye=
r meta-arm&quot;<br>
&gt; &gt; -LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;warrior zeus&quot;<br=
>
&gt; &gt; +LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;warrior zeus dunfell&=
quot;<br>
&gt; <br>
&gt; I was actually waiting for dunfell to be released, then I was going t=
o<br>
&gt; remove warrior and zeus when adding dunfell.=C2=A0 The logic behind t=
his is<br>
&gt; to limit the scope of our support and testing.=C2=A0 To my knowledge,=
 no one<br>
&gt; is using meta-arm in production for warrior or zeus, so I don&#39;t t=
hink<br>
&gt; it&#39;s an issue.<br>
<br>
Jon,<br>
<br>
You can remove warrior and zeus later, but OE-Core master has been only <b=
r>
compatible with dunfell for couple weeks now and meta-arm in unusable w/o =
<br>
a similar change.</blockquote><div><br></div><div>+1. We would like to swi=
tch our OE RPB builds to meta-arm-toolchain, and remove our copy of gcc-arm=
 from meta-linaro-toolchain, but we can&#39;t do that until this patch gets=
 in.</div><div>OE-core is typically updated several weeks before the releas=
e, that allows all layers to get ready for the release.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Denys<br>
<br>
<br>
&gt; Thanks,<br>
&gt; Jon<br>
&gt; <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 # We have patches for xen but meta-virtualization might no=
t be there so filter<br>
&gt; &gt;=C2=A0 # out recipes-extended/xen unless xen is activated in the =
features<br>
&gt; &gt; diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolc=
hain/conf/layer.conf<br>
&gt; &gt; index a247dc1..3a4c4f0 100644<br>
&gt; &gt; --- a/meta-arm-toolchain/conf/layer.conf<br>
&gt; &gt; +++ b/meta-arm-toolchain/conf/layer.conf<br>
&gt; &gt; @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS +=3D &quot;arm-toolchain&quot=
;<br>
&gt; &gt;=C2=A0 BBFILE_PATTERN_arm-toolchain :=3D &quot;^${LAYERDIR}/&quot=
;<br>
&gt; &gt;=C2=A0 BBFILE_PRIORITY_arm-toolchain =3D &quot;30&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -LAYERSERIES_COMPAT_arm-toolchain =3D &quot;zeus&quot;<br>
&gt; &gt; +LAYERSERIES_COMPAT_arm-toolchain =3D &quot;zeus dunfell&quot;<b=
r>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 # do not error out on bbappends for missing recipes<br>
&gt; &gt;=C2=A0 BB_DANGLINGAPPENDS_WARNONLY =3D &quot;true&quot;<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf=
<br>
&gt; &gt; index 65ccd15..0b93e8d 100644<br>
&gt; &gt; --- a/meta-arm/conf/layer.conf<br>
&gt; &gt; +++ b/meta-arm/conf/layer.conf<br>
&gt; &gt; @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm =3D &quot;^${LAYERDIR}=
/&quot;<br>
&gt; &gt;=C2=A0 BBFILE_PRIORITY_meta-arm =3D &quot;6&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 LAYERDEPENDS_meta-arm =3D &quot;core&quot;<br>
&gt; &gt; -LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus&quot;<br>
&gt; &gt; +LAYERSERIES_COMPAT_meta-arm =3D &quot;warrior zeus dunfell&quot=
;<br>
&gt; &gt; -- <br>
&gt; &gt; 2.7.4<br>
&gt; &gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; <br>
<br>
&gt; <br>
<br>
<br>
</blockquote></div></div>

--000000000000dc873d05a2c14c93--
