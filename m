Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8264C1090241
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 15:41:52 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14353.1773934903289682329
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 08:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaQ34YHF;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6689033d0c3so744926a12.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 08:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773934901; cv=none;
        d=google.com; s=arc-20240605;
        b=BRAztHCDWpktNAW1bvv2dz7yA0MGxHLi+tzrfEqtdnJAftJIzFT5CcClRz93WoAPtH
         aHcHa6ikot1BgG/kFkXxG7sm3dj3JmufqUfriYbguUSe6ZoOhR0T7Q4yxMeHOd08PulS
         5JhTgDzecCuaveyhoro3HfxvaBuh3nQVxPpHPDMfDvfIYtEYtQXKsAl66L303wLjn8u0
         M/scFV0V4vva9ydCOs3eQ10encgKWcj9z1PFxu/zhJwrDIlKF2h2yLnxp7ayaxFME6T4
         m6G4n2IDn7kZEiYRWHTe/X1RRpKTJuKqrxPNRBPA4RKzMNhZUWKSierPyN69ropU5GBG
         YpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YhLaOjmlwzUc6P4ZTJZb5mQteYfW6wx9bhSaQ8WtV5I=;
        fh=0YoW42r3oGrsNdca0bwDMJ3GgzHEDNZb3qpl4L9fpoM=;
        b=XOPPFDXIJWQfo2zb96BAMnDmhgIOZzZttyk9r1y7vpILjooX8D2CsM/2IkrZSoeMja
         xH5ARtN0JVzmq1J8lVTpiRqJZhPZ4YjIKIoJV6YPCmdaTk1rK0qGzjCI1hPZ9FW9nNbS
         V030jDUe1jzGwUbrgdv3g75MoC3bKVNbD+Ijuaq26bd1wtU4tVzzOPnRlHRyEbwzivGR
         N6Yi3uobNb+gxTpxL0IlQzbxIrsMifkqCISHDBNRYvOUB5Ig/2u+5BG/TqQJABzdyXkB
         b/KkBWO2diZKeQ4Vb1yhOtydVxg8n5YRmk7THVqTQf/3yKu93PpdvbdKWWr8V45mlO9+
         sdGg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773934901; x=1774539701; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YhLaOjmlwzUc6P4ZTJZb5mQteYfW6wx9bhSaQ8WtV5I=;
        b=BaQ34YHFmmoRQSIe3AgnMD380qs33XzkZ1Uy/DGnGcKG4mPdUhstno8H5B2lHh4N21
         PonIMj+wby9B/yufxPQQ8X/6dFLmUzz/YHkfsBDBYnFUFfuDLAaa+y88obOzCeEi/oYh
         V4wD8393KhsvBR2et1OXALw9JZUEDR2FydrAfQlkooYYVDP/aDK4WLP0/M/Re3pvx+sE
         b7c8eiLznbYCokX6D+FIRUAt6eL0bhlHMfalkJKq9g34A0cfGF33d73SqyFK26cdV13C
         IRphI2OVtNAMYv8Qa/jY07O3Xy3oNKlE/FFAHmly1e1MZub6P+TI3Di11M0SV+//YKMw
         Gt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934901; x=1774539701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhLaOjmlwzUc6P4ZTJZb5mQteYfW6wx9bhSaQ8WtV5I=;
        b=qArYwLZl41aKOIoEi5mH/LCBtaMABHh+ihvLBRZsoEveK82Hxz4knlLbztPmX7p0kx
         /6lidTN4hpjMv1n9FC3eZTaix2upmVUA5whQ7puNl5yVu3aQ+AduVC7wez5Bh6nnryKj
         eYjSNIYKcB3/l1IP14vkk0tjLnXJl0hifMbskE+zyC7jNNeKV3/9iZH3SEpvqL+yNPDi
         laRgAPm7kyCTgVoqckBkdaZoenkKjKjivGX/bhKt7YW8sAUGviEt2BC+gK6sMkrR2yo0
         C3H/pMpMVTdaZu3yQmrvkjcsHkct8VvR6QRWQdsupWO3wiraoSsp/4PxGrg3HOWu7IhO
         Pgjg==
X-Gm-Message-State: AOJu0YxeSETKIvsKsftAznPbtdzicb/a8NWeFPmOmB/XX0cTQtdaA7E3
	U1qi/TvJw0N+BFPKE/WA4Fac3C+BaVyfmmh5UjrPEVfNo6tM7zKdCnxw0b7m+hdE0yB0W/QbmGW
	qABh/1jwGY3TcPgiV6ngsbIZPcdS/JFE=
X-Gm-Gg: ATEYQzwfgvb0S3DWxo9qm/cA4nxSkxapNs04lkP700a2NysRvD3iGrw1oDEv6LC2rSM
	vffNqnydBwXT334zFXtFK9pGl7ck76gNKwZ+DFLQ56HZQBMpP8mumwnZey5rxY8oGaVz7saeSqI
	iYOC5Lik+8Vl6jc+SHrNMbRaEd2Bq671p0KwR1sKMGrWp7uUzmCmPrgEscOfncr/oDW/iJ8NouW
	3dZDSDWqVkiYzHcOhrMKSIhMAsDDtPChW/6yFAlL2nRAe47ycKSn2H0uTFb474VzhvgB6BVXsk/
	gXEj79PQmA==
X-Received: by 2002:a17:907:1b06:b0:b97:aea3:86dc with SMTP id
 a640c23a62f3a-b97f48e0c86mr571682566b.15.1773934901126; Thu, 19 Mar 2026
 08:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260318122948.3511335-2-jose.quaresma@oss.qualcomm.com> <CAPoiz9wiA7yLLBycGkd4BAk4Lw1wnJTfgw5ABwzcVfece=D_Ww@mail.gmail.com>
In-Reply-To: <CAPoiz9wiA7yLLBycGkd4BAk4Lw1wnJTfgw5ABwzcVfece=D_Ww@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 19 Mar 2026 15:41:29 +0000
X-Gm-Features: AaiRm50YIzqhnGkzLvI537YZWjHPhXmB4_vUF6O14iC74_cgELh-kVD_jBNIAxc
Message-ID: <CANPvuR=Oi9qRT2tjyKVh5257igb3PsqWzRObb2tB4-J=pYLEXQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] layers: update for wrynose release series
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000a2ec38064d6267dd"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2026 15:41:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6965

--000000000000a2ec38064d6267dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jon Mason <jdmason@kudzu.us> escreveu (quinta, 19/03/2026 =C3=A0(s) 14:11):

> Thanks for the patch, but we pushed a quick patch to get our CI
> working before we saw yours on the list.
>

No rush!

Thanks,
Jose


>
> Thanks,
> Jon
>
> On Wed, Mar 18, 2026 at 8:30=E2=80=AFAM Jose Quaresma via
> lists.yoctoproject.org
> <quaresma.jose=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> > ---
> >  meta-arm-bsp/conf/layer.conf       | 2 +-
> >  meta-arm-toolchain/conf/layer.conf | 2 +-
> >  meta-arm/conf/layer.conf           | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.con=
f
> > index ecb91b08..58ab6b87 100644
> > --- a/meta-arm-bsp/conf/layer.conf
> > +++ b/meta-arm-bsp/conf/layer.conf
> > @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
> >  BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-arm-bsp =3D "5"
> >
> > -LAYERSERIES_COMPAT_meta-arm-bsp =3D "whinlatter"
> > +LAYERSERIES_COMPAT_meta-arm-bsp =3D "whinlatter wrynose"
> >
> >  LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
> >  # This won't be used by layerindex-fetch, but works everywhere else
> > diff --git a/meta-arm-toolchain/conf/layer.conf
> b/meta-arm-toolchain/conf/layer.conf
> > index 8bffff41..b51fc107 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_arm-toolchain =3D "5"
> >
> >  LAYERDEPENDS_arm-toolchain =3D "core"
> > -LAYERSERIES_COMPAT_arm-toolchain =3D "whinlatter"
> > +LAYERSERIES_COMPAT_arm-toolchain =3D "whinlatter wrynose"
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index 9d18c7c4..bfcd569d 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
> >      core \
> >      arm-toolchain \
> >  "
> > -LAYERSERIES_COMPAT_meta-arm =3D "whinlatter"
> > +LAYERSERIES_COMPAT_meta-arm =3D "whinlatter wrynose"
> >
> >  # runfvp --console needs telnet, so pull this in for testimage.
> >  HOSTTOOLS_NONFATAL +=3D "telnet"
> > --
> > 2.53.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#6961):
> https://lists.yoctoproject.org/g/meta-arm/message/6961
> > Mute This Topic: https://lists.yoctoproject.org/mt/118381496/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> jdmason@kudzu.us]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a2ec38064d6267dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jon Mason &lt;<=
a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; escreveu (quint=
a, 19/03/2026 =C3=A0(s) 14:11):<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Thanks for the patch, but we pushed a quick patch to get ou=
r CI<br>
working before we saw yours on the list.<br></blockquote><div><br></div><di=
v>No rush!<br><br>Thanks,</div><div>Jose<br>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Jon<br>
<br>
On Wed, Mar 18, 2026 at 8:30=E2=80=AFAM Jose Quaresma via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" tar=
get=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.q=
ualcomm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-arm-bsp/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
&gt;=C2=A0 meta-arm-toolchain/conf/layer.conf | 2 +-<br>
&gt;=C2=A0 meta-arm/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.co=
nf<br>
&gt; index ecb91b08..58ab6b87 100644<br>
&gt; --- a/meta-arm-bsp/conf/layer.conf<br>
&gt; +++ b/meta-arm-bsp/conf/layer.conf<br>
&gt; @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D &quot;meta-arm-bsp&quot;<br>
&gt;=C2=A0 BBFILE_PATTERN_meta-arm-bsp =3D &quot;^${LAYERDIR}/&quot;<br>
&gt;=C2=A0 BBFILE_PRIORITY_meta-arm-bsp =3D &quot;5&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;whinlatter&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;whinlatter wrynose&quot;<br=
>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_meta-arm-bsp =3D &quot;core meta-arm&quot;<br>
&gt;=C2=A0 # This won&#39;t be used by layerindex-fetch, but works everywhe=
re else<br>
&gt; diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/c=
onf/layer.conf<br>
&gt; index 8bffff41..b51fc107 100644<br>
&gt; --- a/meta-arm-toolchain/conf/layer.conf<br>
&gt; +++ b/meta-arm-toolchain/conf/layer.conf<br>
&gt; @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D &quot;^${LAYERDIR}/&=
quot;<br>
&gt;=C2=A0 BBFILE_PRIORITY_arm-toolchain =3D &quot;5&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_arm-toolchain =3D &quot;core&quot;<br>
&gt; -LAYERSERIES_COMPAT_arm-toolchain =3D &quot;whinlatter&quot;<br>
&gt; +LAYERSERIES_COMPAT_arm-toolchain =3D &quot;whinlatter wrynose&quot;<b=
r>
&gt; diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf<br>
&gt; index 9d18c7c4..bfcd569d 100644<br>
&gt; --- a/meta-arm/conf/layer.conf<br>
&gt; +++ b/meta-arm/conf/layer.conf<br>
&gt; @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 core \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 arm-toolchain \<br>
&gt;=C2=A0 &quot;<br>
&gt; -LAYERSERIES_COMPAT_meta-arm =3D &quot;whinlatter&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-arm =3D &quot;whinlatter wrynose&quot;<br>
&gt;<br>
&gt;=C2=A0 # runfvp --console needs telnet, so pull this in for testimage.<=
br>
&gt;=C2=A0 HOSTTOOLS_NONFATAL +=3D &quot;telnet&quot;<br>
&gt; --<br>
&gt; 2.53.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#6961): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/6961" rel=3D"noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/g/meta-arm/message/6961</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11838149=
6/3616920" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/118381496/3616920</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org=
" target=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/me=
ta-arm/unsub</a> [<a href=3D"mailto:jdmason@kudzu.us" target=3D"_blank">jdm=
ason@kudzu.us</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000a2ec38064d6267dd--

