Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DA6C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:14:30 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.12903.1639062868568615840
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 07:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z2dw8Oe6;
 spf=pass (domain: gmail.com, ip: 209.85.219.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id f9so14367325ybq.10
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 07:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEQyVaOjK79xyOJL/g+esyzoE35AohvZzLPLAFT1eFo=;
        b=Z2dw8Oe6BNCVN4rb7B5A7lq/quVnucEvrHO3Dj/CLSJ9VNVFB2QXh5/yVwlrGUKoQ6
         3sYYz9FOCXoUViX+ouRCcSayr4wUb1L5NyuWDsM4BEEYkrl5x8fXx0ERJBD2l/C1fC8t
         aEL0Ajlu8i0YCXVcOGfAH76zMWKc50s2L5tibkiNOkSLxVQsDT2YTuYh7VngMVQ08rXX
         bzQI520BtQrmBzsNeGj8cd0V82MPSWdDtcJEKm4oDcSRsVPSp4HuewmkO3hyykowXkcK
         ZFzwIQTsY19H06/NRqZ4Pr4I4tKhhBmHOWJ36zGeHnj+N4kwkg4GXG23fkdnrkoE34Nw
         frWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEQyVaOjK79xyOJL/g+esyzoE35AohvZzLPLAFT1eFo=;
        b=LW73hGSKR/ljxMsqolbEyJA6OlkTbZNzg+7T41euGnsO+QXvr55XruCXu/sDsCg5gz
         5HM1R6BecDrnp6WsMPZuH1dGtFsMf/m+rHDbmE7PB2gE9R/WSsSJW9OO2XpTt4mfEWOS
         d0uBXu2fuYU5TRTFv7CbcMaElgTBnTgpnEcwM6M3an9JTiVkFq5Vr5YGQBW62kBOG9fG
         718A/V61l6qpCEOdXLrJeUFNqfLWrXVgTU5crjm43zRwQOw71BTcMGXb2hzS3VB5BOsy
         tGzqGO43n+QZ59/vgeSvhR212GUjAti13BYvcq8hOJBQEc7JP8e36Kcutpys72k9Akvg
         fGUQ==
X-Gm-Message-State: AOAM532jvW+4AHlpR4LH/ERokYr+RZIop3v6ecRf4ch0m7LhZ6s80Nf0
	5dftICCcFgSCgMmk/2GV+8Tj7ynkLDlKxIcQafI=
X-Google-Smtp-Source: 
 ABdhPJz+xOTXUFrPfntwfKn7f9Tgyym4ErI5m13ikIVc2kEVpIwSyoL+/2Hn9iPpxiUMQV4iVcKIN9eN9UodMSQi3qk=
X-Received: by 2002:a25:9707:: with SMTP id d7mr6758708ybo.518.1639062867600;
 Thu, 09 Dec 2021 07:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20211208205809.3079680-1-raj.khem@gmail.com>
 <CAAnfSTvf-bYpV67hyZOsw7MuefFdbBiGJfWkB4t0rFMweT4ebA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvf-bYpV67hyZOsw7MuefFdbBiGJfWkB4t0rFMweT4ebA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 07:14:16 -0800
Message-ID: 
 <CAMKF1srpVzDTEg5XXtphs_OLcft8=VUFhC_C7ykFZ07FHsJj=g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: Pin to use gcc for now
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fce77405d2b80f28"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 15:14:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2581

--000000000000fce77405d2b80f28
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 4:52 AM Ross Burton <ross@burtonini.com> wrote:

> What machine was this on?


Rockpi4b based on rk3399


>
> Ross
>
> On Wed, 8 Dec 2021 at 20:58, Khem Raj <raj.khem@gmail.com> wrote:
> >
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
> > @@ -10,3 +10,8 @@ SRC_URI_MBEDTLS = "git://
> github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
> >  SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
> >
> >  LIC_FILES_CHKSUM_MBEDTLS =
> "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > +
> > +# code bloats with clang and results in error below now
> > +# | aarch64-yoe-linux-musl-ld: region `PMUSRAM' overflowed by 3928 bytes
> > +# this needs fixing until then use gcc
> > +TOOLCHAIN = "gcc"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2572):
> https://lists.yoctoproject.org/g/meta-arm/message/2572
> > Mute This Topic: https://lists.yoctoproject.org/mt/87598328/1676615
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000fce77405d2b80f28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Dec 9, 2021 at 4:52 AM Ross Burton &lt;<a href=3D"m=
ailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">What machine was this on?</blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">Rockpi4b based on rk3399</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Ross<br>
<br>
On Wed, 8 Dec 2021 at 20:58, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fir=
mware-a_2.6.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware-a_2.6=
.bb</a> | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
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
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM_MBEDTLS =3D &quot;file://mbedtls/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57&quot;<br>
&gt; +<br>
&gt; +# code bloats with clang and results in error below now<br>
&gt; +# | aarch64-yoe-linux-musl-ld: region `PMUSRAM&#39; overflowed by 392=
8 bytes<br>
&gt; +# this needs fixing until then use gcc<br>
&gt; +TOOLCHAIN =3D &quot;gcc&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#2572): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/2572" rel=3D"noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/g/meta-arm/message/2572</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87598328=
/1676615" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/87598328/1676615</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org=
" target=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/me=
ta-arm/unsub</a> [<a href=3D"mailto:ross@burtonini.com" target=3D"_blank">r=
oss@burtonini.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000fce77405d2b80f28--

