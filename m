Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B6C38A2D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 09:01:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.4367.1666861293004824976
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 02:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jnh8V9ia;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id d25so1018066lfb.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 02:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bh/yoydWnU4yn3RaMJm/c//01jRyWoDrxAXUnCcWZf0=;
        b=jnh8V9iaZFJlR8Zre7WWHWcmY+bKQbLcN63E9Gh6DZ0xRHPb7acSEEsvgKj0SCzLgs
         RCh+EJhRLGXOnMAHg0ADBLj3v14MtGVJyGjdmw3R6VUqbd/kf2tISQ7YQ9pshKt5MSIQ
         KE+J2/Jf5lfhPChSew+fvx9R4PDipVpcFfOIjDarhSOhPuF/geliwQBawxzaKUpZZBns
         HefeRy6idX0BnBmgLXXmDy+ZSjX4LJojZrKR2k5EvIgKiZiGA/KWuIAre1C4QsaGX7Uh
         dWS0h8iMH1cYpO43MP/a+IdjVElVDwZUHWDAnAO+o4acoY5UFxWYN5nGKH8X44HMZFxd
         qcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bh/yoydWnU4yn3RaMJm/c//01jRyWoDrxAXUnCcWZf0=;
        b=sPjfU2N/A+ri2aNZVvJTKiMbFA/oTysLWsaYLqC5YuDRZl6eCVtChMcWWnYL/hdDSO
         9R0VUWb5zAa4YWk+f9nzx8udbbZJDabSgsFTaQSevTn7gXGAj5Mc8Led3hNbnq30V7wd
         ByxEzhM8OY2SrWUQsy3Dp9YfyC438Tp5kw+pudvBSihgW8FPD+d0NfEykExjO1ScQoHA
         4h7MNwKLhusRop4J/EO5M/W8dEIleqILmpn2Q3He50y0yqqhuQWYTiVVEqTY6TIHEQMs
         /spsEs+S/nymIMJfqawMLzqZotnhhn4N66uh+Jur3PV5XQD1LejQ5qtyEaMGhrL8Heea
         sUmQ==
X-Gm-Message-State: ACrzQf2rarjAlT/MGHNmXfF485FofLQf56QQ+8dZVaR+yAb7nko4Z80E
	uLJjmhn0GCwQYozgwGwGoOTiKCSXQ3WMZFu+ayg=
X-Google-Smtp-Source: AMsMyM4VHwZGZEv5PViG1FFu4qsBV5VrySB1jy/tqNRbCsrFYTFjr8e7RlvzfkWwRkkJ6zbOE/3Y7VTga6MmPQq7pwk=
X-Received: by 2002:ac2:5088:0:b0:4a2:2e18:c4c9 with SMTP id
 f8-20020ac25088000000b004a22e18c4c9mr17240935lfm.5.1666861291143; Thu, 27 Oct
 2022 02:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
 <20221026141854.1557213-2-jose.quaresma@foundries.io> <Y1oi/4RvTqTeRVFJ@nuoska>
In-Reply-To: <Y1oi/4RvTqTeRVFJ@nuoska>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 27 Oct 2022 10:01:19 +0100
Message-ID: <CANPvuRkuiHPKJDCw_Z0qipDS5DTiuMeSc4mqURg4-tKnyasorQ@mail.gmail.com>
Subject: Re: [meta-arm][PATCH 2/3] optee-ftpm/optee-os: rewite in a way to be
 less error prone
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000026079305ec0063c7"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 09:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4047

--00000000000026079305ec0063c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Mikko Rapeli <mikko.rapeli@linaro.org> escreveu no dia quinta, 27/10/2022
=C3=A0(s) 07:19:

> Hi,
>
> On Wed, Oct 26, 2022 at 02:18:53PM +0000, Jose Quaresma wrote:
> > So it becomes clearer the need to use the space in the append
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  .../optee-ftpm/optee-os_%.bbappend               | 16 ++++------------
> >  1 file changed, 4 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > index 40423615..332c7c1c 100644
> > --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > @@ -1,15 +1,7 @@
> >  FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"
> >
> > -DEPENDS:append =3D "\
> > -                  ${@bb.utils.contains('MACHINE_FEATURES', \
> > -                 'optee-ftpm', \
> > -                 'optee-ftpm', \
> > -                 '' , \
> > -                 d)}"
> > +DEPENDS:append =3D "${@bb.utils.contains('MACHINE_FEATURES',
> 'optee-ftpm', \
>
> Same here, don't use :append, use +=3D which will add the space too.
>
> > +                 ' optee-ftpm', '' , d)}"
>

Here the space is only added if needed and together with the value.


> >
> > -EXTRA_OEMAKE:append =3D "\
> > -                       ${@bb.utils.contains('MACHINE_FEATURES', \
> > -                      'optee-ftpm', \
> > -                      'CFG_EARLY_TA=3Dy
> EARLY_TA_PATHS=3D"${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stri=
pped.elf"',
> \
> > -                      '', \
> > -                      d)} "
> > +EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES',
> 'optee-ftpm', \
>
> Ditto.
>

+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES',
'optee-ftpm', \
+                      ' CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${STAGING_DIR_
TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', '', d)} "

The same here

Jose


>
> Cheers,
>
> -Mikko
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000026079305ec0063c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@lin=
aro.org">mikko.rapeli@linaro.org</a>&gt; escreveu no dia quinta, 27/10/2022=
 =C3=A0(s) 07:19:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi,<br>
<br>
On Wed, Oct 26, 2022 at 02:18:53PM +0000, Jose Quaresma wrote:<br>
&gt; So it becomes clearer the need to use the space in the append<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../optee-ftpm/optee-os_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++++------------<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 12 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend =
b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend<br>
&gt; index 40423615..332c7c1c 100644<br>
&gt; --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend<br>
&gt; +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend<br>
&gt; @@ -1,15 +1,7 @@<br>
&gt;=C2=A0 FTPM_UUID=3D&quot;bc50d971-d4c9-42c4-82cb-343fb7f37896&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS:append =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.=
utils.contains(&#39;MACHINE_FEATURES&#39;, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;op=
tee-ftpm&#39;, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;op=
tee-ftpm&#39;, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#=
39; , \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d)}&quo=
t;<br>
&gt; +DEPENDS:append =3D &quot;${@bb.utils.contains(&#39;MACHINE_FEATURES&#=
39;, &#39;optee-ftpm&#39;, \<br>
<br>
Same here, don&#39;t use :append, use +=3D which will add the space too.<br=
>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39; o=
ptee-ftpm&#39;, &#39;&#39; , d)}&quot;<br></blockquote><div><br>Here the sp=
ace is only added if needed and=C2=A0together with the value.<br>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 <br>
&gt; -EXTRA_OEMAKE:append =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0${@bb.utils.contains(&#39;MACHINE_FEATURES&#39;, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;optee-ftpm&#39;, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D&quot;${STAGING_DIR_TARGET}/=
lib/optee_armtz/${FTPM_UUID}.stripped.elf&quot;&#39;, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;&#39;, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d)} &quot;<br>
&gt; +EXTRA_OEMAKE:append =3D &quot;${@bb.utils.contains(&#39;MACHINE_FEATU=
RES&#39;, &#39;optee-ftpm&#39;, \<br>
<br>
Ditto.<br></blockquote><div><br><span style=3D"color:rgb(0,0,0)">+EXTRA_OEM=
AKE:append =3D &quot;${@bb.utils.contains(&#39;MACHINE</span><span style=3D=
"color:rgb(0,0,0)">_FEATURES&#39;, &#39;optee-ftpm&#39;, \</span><br style=
=3D"color:rgb(0,0,0)"><span style=3D"color:rgb(0,0,0)">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; CFG_EARLY=
_TA=3Dy EARLY_TA_PATHS=3D&quot;${STAGING_DIR_</span><span style=3D"color:rg=
b(0,0,0)">TARGET}/lib/optee_armtz/${FTPM</span><span style=3D"color:rgb(0,0=
,0)">_UUID}.stripped.elf&quot;&#39;, &#39;&#39;, d)} &quot;</span><font col=
or=3D"#888888"><br></font><br>The same here<br><br>Jose<br>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000026079305ec0063c7--

