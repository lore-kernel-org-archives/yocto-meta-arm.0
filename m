Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562FBC38A2D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 08:57:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.4303.1666861062517926219
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 01:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PwpbvAT+;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id o12so1392777lfq.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iADnmGpetZD+eLIv4L4D+SsgLuPDvJQjLenrdRya+D0=;
        b=PwpbvAT+LVO3snTFv7XCBnUy0Ds6cXY+N+uEk5juXGLRvz7KsBBZOTMcUC02b6jCqh
         xzmOAzXYtJ02BJncVf8sa3k8StD+fRRu8nxghpPoL9r8Cc80XsQdmUywDK7bY+iieQ0T
         +QjlLuEGC67P5f/06EBWugzitjrZJBT7LvMvAwTHoiIOP2sBvNyz76MNgZo6+JNtAkre
         zM0tbFRzf+b0gJoxASSs2rz9yWZGWUyGjrqA0brF8bXWCVh/ZfP+vjnY6WoGs+cvYcl5
         hf25jMJU9z2ZcszD9LPHSOdsdFyahTyZUo2E8i+XEmqGFi4grof+XwLck5ixeyv2ULxl
         Brww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iADnmGpetZD+eLIv4L4D+SsgLuPDvJQjLenrdRya+D0=;
        b=RGKw56idFofI/dFw1N4KEloCzd5DofQ6A7AClWR0kXY/nyuVqYeuIN14uscC8EOJ2j
         0W5WgSD87dsu6Z9shwmfNsdWd/zoO5N49JQh7wTahr+Jl3e8kNtBuNBhZgBcDWrhbjCF
         pEn/YHKf76AWMsXtMkXPIxnlNDt0PHw7OglZiSg8cnu4Ff5gMBx3A10drItVD+qWbJFk
         T4wHlCT4/WqoBoBBc/IwIufCbSebDnWjj5BESd/SE9GToRN+Z96PCP56Mj3sEDEDp6NT
         Rpax4d7G0GJlt+2n4EU5XLhPUrJSPwB4gVkdRLH6+8TLK1d/YT1Bgwc0cSTd/jSIEhcj
         boDA==
X-Gm-Message-State: ACrzQf1OII/lOuMJ+Tho1+q9olgEVlXVlSYGlS23fiC9AR0Bw6l/KgLN
	GfXEjwra559Kh9PtaSMGHR1eEhgUkhq1R+VJ7xs=
X-Google-Smtp-Source: AMsMyM4XBNzeVUXgD8VMndMtdPyjR4puoaiW9bXckkknOy2LWDL797IWhBnhaTYuxfvY9ZUeRhem6mxQKWtl+Fyjxzw=
X-Received: by 2002:a05:6512:ac7:b0:4a2:6337:86e3 with SMTP id
 n7-20020a0565120ac700b004a2633786e3mr18623845lfu.154.1666861060283; Thu, 27
 Oct 2022 01:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221026141854.1557213-1-jose.quaresma@foundries.io> <Y1oixbW4wq5PILX3@nuoska>
In-Reply-To: <Y1oixbW4wq5PILX3@nuoska>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 27 Oct 2022 09:57:29 +0100
Message-ID: <CANPvuRm=7D18721JuW6s-nAgdZbQEObehdQTKPfPSPJvxi_iXQ@mail.gmail.com>
Subject: Re: [meta-arm][PATCH 1/3] optee-ftpm/optee-os: add missing space in EXTRA_OEMAKE
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000635fbb05ec00559f"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 08:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4046

--000000000000635fbb05ec00559f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikko,

Mikko Rapeli <mikko.rapeli@linaro.org> escreveu no dia quinta, 27/10/2022
=C3=A0(s) 07:18:

> Hi,
>
> On Wed, Oct 26, 2022 at 02:18:52PM +0000, Jose Quaresma wrote:
> > When append to variable a space is required at the beginning.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > index acea7502..40423615 100644
> > --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > @@ -7,7 +7,8 @@ DEPENDS:append =3D "\
> >                   '' , \
> >                   d)}"
> >
> > -EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', \
> > +EXTRA_OEMAKE:append =3D "\
>
> There is no need to use :append here. +=3D will do and will add the
> space.


Right, I can use the +=3D but in this case I follow this pattern to make th=
e
change consistent
with what already existed in the file. I can change it, let's see the
maintainer's opinion.


>
> Using :append everywhere without machine or distro qualifiers is
> an annoying antipattern which intermediate layers should not use.
>
> Higher level product specific layers can't easily change the variables
> which have been amended with :append.
>

This will always be tricky to do, a lot due to the freedom of bitbake
syntax.
With :append usage we need to use the :remove because this needs to be done
at the end of the parsing.
While with +=3D you can assign a new value for the variable during parsing
but you will lose all the others that had already possible been added with
+=3D

Great to talk with you again about bitbake stuff ;)

Jose


> Cheers,
>
> -Mikko
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000635fbb05ec00559f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mikko,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Mikko Rapeli &lt;<a href=3D"mailto:mikko.rap=
eli@linaro.org">mikko.rapeli@linaro.org</a>&gt; escreveu no dia quinta, 27/=
10/2022 =C3=A0(s) 07:18:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
On Wed, Oct 26, 2022 at 02:18:52PM +0000, Jose Quaresma wrote:<br>
&gt; When append to variable a space is required at the beginning.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 3 ++-=
<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend =
b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend<br>
&gt; index acea7502..40423615 100644<br>
&gt; --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend<br>
&gt; +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend<br>
&gt; @@ -7,7 +7,8 @@ DEPENDS:append =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;&#39; , \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d)=
}&quot;<br>
&gt;=C2=A0 <br>
&gt; -EXTRA_OEMAKE:append =3D &quot;${@bb.utils.contains(&#39;MACHINE_FEATU=
RES&#39;, \<br>
&gt; +EXTRA_OEMAKE:append =3D &quot;\<br>
<br>
There is no need to use :append here. +=3D will do and will add the<br>
space.=C2=A0</blockquote><div><br>Right,=C2=A0I can use the=C2=A0+=3D but i=
n this case I follow this pattern to make the change consistent<br>with wha=
t already existed in the file. I can change it, let&#39;s see the maintaine=
r&#39;s opinion.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Using :append everywhere without machine or distro qualifiers is<br>
an annoying antipattern which intermediate layers should not use.<br>
<br>
Higher level product specific layers can&#39;t easily change the variables<=
br>
which have been amended with :append.<br></blockquote><div><br>This will al=
ways be tricky to do, a lot due to the freedom of bitbake syntax.</div><div=
>With :append usage=C2=A0we need to use the :remove because this needs to b=
e done at the end of the parsing.<br>While with +=3D you can assign a new v=
alue for the variable during parsing but you will lose all the others that =
had already possible been added with +=3D</div><div><br>Great to talk with =
you again about=C2=A0bitbake stuff ;)<br><br>Jose<br><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000635fbb05ec00559f--

