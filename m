Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5D4FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 14:26:40 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.7188.1666880798307155917
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 07:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GuWj68AZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id a15so2830410ljb.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PCaaSSZOhCC8EYcY/IbS1ep40Ez+uZoiQq6pqjt7vV4=;
        b=GuWj68AZdvfz2vTGtKZ4Ksr4KJuuk+JRtKSbSELwuSXPrN+5aBGXEfXdd4uUbioW8n
         AdepCndAdH8puljkEUAIo5mzg89vS80kuWeOAAdg3RN1BwoOzKI0HKF/Zf3xaOzwn5Gi
         RcVAKB3GOUOUXuQ+ZoRYmaRPEayMxy+EJBNcufe1wYhs/l2f6z+zEwt10uIcVNt6NVxq
         fMAmASUiYry9ORdybRihYgwsWYhBYLWARXa6z7npMZGe5ZDxEMPNZezpLvGjv8Muv+JQ
         CwtUtK/cthb2DMfsRMDhMLnRLGb8arEhMa1WISq5SYS1n8jlVFIYMQi9LlBnMNiq+mgF
         B6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCaaSSZOhCC8EYcY/IbS1ep40Ez+uZoiQq6pqjt7vV4=;
        b=SSE8UdHu0aT6Qq6rzeov9/yOji8Gipkyu5wd3Y3Gk+KB3WJzt0BZOiAo17dMyZlcds
         Q70ArQRP/kU7TDA+SqX0JX2Rph8Ao4q6e3jv3A/ZzHEyJKijWeWneHgekP9aw6LeTRpj
         tTaZMGIRJ/dSi8Y80kdFxytJTlYC2u9EbFVSk7BPqtt0XMZ76doHcyFbpcGgmcU6vEFj
         U44efPNuhw3aREwzdqOkUIFIIuQWvZP9fIvQwGYzbaakd8HhSbitiidUJvFcIpmI0BFS
         zTg50vmc67hNo4mnVDScKMnnD9hT5I8Af55zt8f7kNzYAsSRNigrkYZwDHct7FJ6b/KZ
         /iiw==
X-Gm-Message-State: ACrzQf1tpskBDDYGBmVtoBx8zkUXzmS/lpJ9RgVs+Ki7LBEHok27W1KJ
	m8rjVAAqymrtVKwgZrKH7hALcJcxCozb4bYzMRw=
X-Google-Smtp-Source: AMsMyM7RoCpDDhIsrCPBR333EhRsK3aP7M33AKMI8AIm9CARX5Fa6bYPwO0sghKo9Tn4e/E4/VjQsCwiOkYDxrRApeE=
X-Received: by 2002:a05:651c:111:b0:277:2451:816c with SMTP id
 a17-20020a05651c011100b002772451816cmr2599087ljb.17.1666880796246; Thu, 27
 Oct 2022 07:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
 <20221026141854.1557213-2-jose.quaresma@foundries.io> <Y1qPvwDtDEwYylhQ@kudzu.us>
In-Reply-To: <Y1qPvwDtDEwYylhQ@kudzu.us>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 27 Oct 2022 15:26:24 +0100
Message-ID: <CANPvuRkAUDOcmywX4wbBZZDNkh4r_mT6+OtASTF2TD+0sp5jOw@mail.gmail.com>
Subject: Re: [meta-arm][PATCH 2/3] optee-ftpm/optee-os: rewite in a way to be
 less error prone
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000be4a6505ec04edf7"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 14:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4053

--000000000000be4a6505ec04edf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Jon Mason <jdmason@kudzu.us> escreveu no dia quinta, 27/10/2022 =C3=A0(s) 1=
5:03:

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
> > +                 ' optee-ftpm', '' , d)}"
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
> > +                      ' CFG_EARLY_TA=3Dy
> EARLY_TA_PATHS=3D"${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stri=
pped.elf"',
> '', d)} "
> > --
> > 2.34.1
> >
> >
>
> This is a "style" patch, and doesn't really fix an issue.  I believe
> there are other instances of this in the tree.  If you were to do a
> patch (or more likely a series of patches) that unifies all of the
> recipes to have a unified style, I'd be more inclined to take it (but
> honestly I don't think that is a good use of your time).
>

Right, I changed the style because I am fixing a bug in the same file
but yeah this patch doesn't fix any issue and can be dropped.


>
> The other two of the series look to fix bugs and I'll pull those in.
> Thank you for the patches :)
>

It's my pleasure.

Jose


>
> Thanks,
> Jon
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000be4a6505ec04edf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jon,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu=
.us">jdmason@kudzu.us</a>&gt; escreveu no dia quinta, 27/10/2022 =C3=A0(s) =
15:03:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, O=
ct 26, 2022 at 02:18:53PM +0000, Jose Quaresma wrote:<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39; o=
ptee-ftpm&#39;, &#39;&#39; , d)}&quot;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39; CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D&quot;${STAGING_DIR_TARGET}=
/lib/optee_armtz/${FTPM_UUID}.stripped.elf&quot;&#39;, &#39;&#39;, d)} &quo=
t;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
<br>
This is a &quot;style&quot; patch, and doesn&#39;t really fix an issue.=C2=
=A0 I believe<br>
there are other instances of this in the tree.=C2=A0 If you were to do a<br=
>
patch (or more likely a series of patches) that unifies all of the<br>
recipes to have a unified style, I&#39;d be more inclined to take it (but<b=
r>
honestly I don&#39;t think that is a good use of your time).<br></blockquot=
e><div><br>Right, I changed the style because I am fixing a bug in the same=
 file</div><div>but yeah this patch doesn&#39;t=C2=A0fix any issue and can =
be dropped.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
The other two of the series look to fix bugs and I&#39;ll pull those in.<br=
>
Thank you for the patches :)<br></blockquote><div><br>It&#39;s my pleasure.=
<br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Thanks,<br>
Jon<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000be4a6505ec04edf7--

