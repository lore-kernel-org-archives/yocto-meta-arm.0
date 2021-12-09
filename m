Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227CFC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:16:05 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web12.12546.1639062964126115270
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 07:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HvqO3hzW;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id e136so14408116ybc.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rRXJAaIhQGDM9qCtN5FZoOmzUA923VM89pa/0wzui5g=;
        b=HvqO3hzW8ikCl4lXLr2GdhlvguponszIdvZXSbS11sL7KPK8WSIfLk5Gmn/XMUmqMD
         8xRJytkydamoJ0mZX/mkOVb7IAiBTqSRQytahdTA8tqgU9KljBSFir9TpxWvffWP4toT
         iH7Rp/yVqAnzxv+WKeDATvd54JFUsgggKeA1GpKFqOeF3fP6m1M/ycx9D7EAJwT5GyPU
         +jC7guwqjGCS2C02DcDzR23w8kxQt6YNr3RwqP8MpaeHdeSkHDvr4AB90EuBSEwcar24
         +oB5kSHuYvoNPzRtusT5F23TBUK5iClxZIUL7z3xw7D0aqUWrrkw8YW22rHnNqGtKQ8V
         v7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rRXJAaIhQGDM9qCtN5FZoOmzUA923VM89pa/0wzui5g=;
        b=JEf0k1R7n/9zgCAY+4oqSTDMWZRPP4p0lu7pjf6FyZAlyTfkU5bll3hYsSU9nQh3HF
         kCOl9Wa8RZiLWWqZVSWMeqoNW2uzOIrT49GCETENvX4qF7AbJ2f0rZADKrAThgDsI95f
         pDTFbKosbrNrUZgsCT/Ow0BqENtAK6A6LnHE0OXbST+9r75iQiYa24/gvtjvUElqfvMk
         RNUkIIxebOIU8VBKy5nT6TZLJVTkbpEXBExUNokatraUy73VqBZ/5T6Kr+nbwdQRZ4tD
         Sfp4fi/I8D/yeOUUwq+NcfwCwCnYJr8pStbOpz3ExANng2k9LWMxSk9SN1aICev8wa/t
         d/7g==
X-Gm-Message-State: AOAM530ldfd0nLHOrGpc7zt4ALaJiYFe7EARnvxSjMnGJ6oAFjAXnxbj
	7Cx21dRnIgjM0CmPorZ7PHdZaft/a65zxiLFr8KYGmbfRFk=
X-Google-Smtp-Source: 
 ABdhPJypY1UjgEjXNfjC42vK6pH6PgmKDnciwjTW5kHqipomtNpACk74P3bMTWeyswJWt9Z+B1rcnW9K8KMyM8fJ/uA=
X-Received: by 2002:a25:b74b:: with SMTP id e11mr6730977ybm.735.1639062963289;
 Thu, 09 Dec 2021 07:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20211208205809.3079680-1-raj.khem@gmail.com>
 <20211209130803.GA30223@kudzu.us>
In-Reply-To: <20211209130803.GA30223@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 07:15:52 -0800
Message-ID: 
 <CAMKF1sp+0EYS=NL3fjmOT0vc6BMgYkGB7nrxcvwW0Ar=AhgptA@mail.gmail.com>
Subject: Re: [PATCH] trusted-firmware-a: Pin to use gcc for now
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b104fa05d2b8155b"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 15:16:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2582

--000000000000b104fa05d2b8155b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2021 at 5:08 AM Jon Mason <jdmason@kudzu.us> wrote:

> On Wed, Dec 08, 2021 at 12:58:09PM -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.6.bb
> > index ec1bec9..dd8fd44 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> > @@ -10,3 +10,8 @@ SRC_URI_MBEDTLS =3D "git://
> github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protocol=3Dht
> >  SRCREV_mbedtls =3D "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
> >
> >  LIC_FILES_CHKSUM_MBEDTLS =3D
> "file://mbedtls/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> > +
> > +# code bloats with clang and results in error below now
> > +# | aarch64-yoe-linux-musl-ld: region `PMUSRAM' overflowed by 3928 byt=
es
> > +# this needs fixing until then use gcc
> > +TOOLCHAIN =3D "gcc"
>
> Is the above error something that you will fix?  If so, can you open a
> bug somewhere (like the yp bugzilla)?  If not, can you tell us how to
> reproduce so that we can open a ticket in our internal jira?
>

Reproduction is simple add meta-clang to your belayers.conf and set
TOOLCHAIN =3D =E2=80=9Cclang=E2=80=9D in local.conf and unbolt this workaro=
und

I might not be able to get it sooner

>
> I don't want this to be a forgotten workaround.
>
> Thanks,
> Jon
>
> > --
> > 2.34.1
> >
> >
>

--000000000000b104fa05d2b8155b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Dec 9, 2021 at 5:08 AM Jon Mason &lt;<a href=3D"mai=
lto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Wed, Dec 08, 2021 at 12:58:09PM -0800, Khem Raj wrote=
:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fir=
mware-a_2.6.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-a_2.6=
.bb</a> | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http:/=
/trusted-firmware-a_2.6.bb" rel=3D"noreferrer" target=3D"_blank">trusted-fi=
rmware-a_2.6.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"ht=
tp://trusted-firmware-a_2.6.bb" rel=3D"noreferrer" target=3D"_blank">truste=
d-firmware-a_2.6.bb</a><br>
&gt; index ec1bec9..dd8fd44 100644<br>
&gt; --- a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://truste=
d-firmware-a_2.6.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-=
a_2.6.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://truste=
d-firmware-a_2.6.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-=
a_2.6.bb</a><br>
&gt; @@ -10,3 +10,8 @@ SRC_URI_MBEDTLS =3D &quot;git://<a href=3D"http://gi=
thub.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protocol=3Dht" rel=3D"noreferre=
r" target=3D"_blank">github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protocol=
=3Dht</a><br>
&gt;=C2=A0 SRCREV_mbedtls =3D &quot;e483a77c85e1f9c1dd2eb1c5a8f552d2617fe40=
0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM_MBEDTLS =3D &quot;file://mbedtls/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57&quot;<br>
&gt; +<br>
&gt; +# code bloats with clang and results in error below now<br>
&gt; +# | aarch64-yoe-linux-musl-ld: region `PMUSRAM&#39; overflowed by 392=
8 bytes<br>
&gt; +# this needs fixing until then use gcc<br>
&gt; +TOOLCHAIN =3D &quot;gcc&quot;<br>
<br>
Is the above error something that you will fix?=C2=A0 If so, can you open a=
<br>
bug somewhere (like the yp bugzilla)?=C2=A0 If not, can you tell us how to<=
br>
reproduce so that we can open a ticket in our internal jira?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Reproduction is =
simple add meta-clang to your belayers.conf and set TOOLCHAIN =3D =E2=80=9C=
clang=E2=80=9D in local.conf and unbolt this workaround=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I might not be able to get it sooner=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
I don&#39;t want this to be a forgotten workaround.<br>
<br>
Thanks,<br>
Jon<br>
<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--000000000000b104fa05d2b8155b--

