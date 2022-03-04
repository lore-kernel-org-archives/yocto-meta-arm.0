Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5C6C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 03:58:38 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3545.1646366316444757231
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 19:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPF44/BT;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id hw13so14800167ejc.9
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 19:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gF1d4PGLZyTPSu+zf1/9ThAkwFkF/1oa3Fv8fb9spI4=;
        b=bPF44/BTlL0GxidTegS+DP5VrZ/5Iku3zBDanoUSlmy24e6baLcAXobS0pESiqq5dE
         hHWFarGQ7L9zz6TzLpdVJMAWzA/BhKz3CQC8v9FSA/6w/GpclQXRyylG0QuyQ2qwIgGp
         scjfQfxF4iHQAWoFaU3RM9JVrVBOKinQ60yG0+mApghvF3KabgHIwVa35YSPOieVGUHa
         JB8OK3NBLcH6W8E0FB7yHTNgi7w8flPTHWeeaWqLb/FVjuhczg6BOIAJP+0O9sw6dh/9
         0AsWY5AolIVolUFkxga5tzoSpbkw5voRAu0GfPou0KGpauFG0ImA+6BnUq/xBt31+Vq1
         b7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gF1d4PGLZyTPSu+zf1/9ThAkwFkF/1oa3Fv8fb9spI4=;
        b=lpYym+3E0FjJ77qgD+zZidZc2pP6ytryN3ADAfuXOavcIw+DRhHKcmPF5qdRYQfyWE
         3KsfXXRmc2kgwX1Y7V9ZMhfVLxNzDeThHGzm1t9nUxK4Xqq4TdDGt3JFDhvsDzKrvgYq
         3Frc23Ugo/w4KhwJavv6fLZtslQXnAxxXuB7fEf93jcjq0hnAgctF7QotFULVezk5Q2J
         fevhHmy+4/84FQNK+ip44+RrLy6CdnCJJcj9f0byZMdD5UCHwy5yH9FLjXj52ayKdPIG
         1eg6h/WsMDYoDtSM3uwd/PYfvgr2IOf09cBiQipow+siDG16o/BqnKLWkwfUBJebJWek
         imqQ==
X-Gm-Message-State: AOAM531ErSugxjpKV5WYpKx8UtY0vH/sytesWxUKX4rp0CK2kzR5dBpC
	z7UldQ16oaAM3IraLr/nUMRuzxOOHpeLl6XQ8UE=
X-Google-Smtp-Source: 
 ABdhPJwneRZp+PUYQC+Qi11ynVXnSAqWNJRG3+Yvn5I3qaNjaY/oWvHeaZZ2SmDqZTgwr+O3AWC7iPnexTPQkBnKKAg=
X-Received: by 2002:a17:906:154c:b0:6ce:21d7:2826 with SMTP id
 c12-20020a170906154c00b006ce21d72826mr29869805ejd.9.1646366314824; Thu, 03
 Mar 2022 19:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
 <20220303233749.GP1766@denix.org>
 <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
In-Reply-To: <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Mar 2022 19:58:23 -0800
Message-ID: 
 <CANx9H-B4N8_a6Vz3zn=zPw5Yc=QWvG0rhfLGL7iwa6fQYgS0Gw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Denys Dmytriyenko <denis@denix.org>,
	Drew Reed <Drew.Reed@arm.com>, Jon Mason <jdmason@kudzu.us>,
	Maxim Uvarov <maxim.uvarov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
 Vishnu Banavath <Vishnu.Banavath@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000005d88b605d95c8782"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 03:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3108

--0000000000005d88b605d95c8782
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 7:16 PM Alejandro Hernandez Samaniego <
alhe@linux.microsoft.com> wrote:

>
> On 3/3/22 23:37, Denys Dmytriyenko wrote:
>
> On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
>
> On 3/3/22 10:55, Abdellatif El Khlifi wrote:
>
> Hello,
>
> I suggest the following:
>
> In meta-arm-bsp/conf/layer.conf add :
>
> LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot = "
> meta-python openembedded-layer"
>
>
> This statement is a little confusing (to me), please correct me if
> I'm wrong, but you're saying
>
> we should set a dependency from meta-arm-bsp layer, only for
> qemuarm64-secureboot,
>
> however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,
>
> AFAIC meta-arm-bsp has now knowledge of its existence, in fact
> there's no other mention of
>
> qemuarm64-secureboot in meta-arm-bsp.
>
> Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
> meta-arm, not meta-arm-bsp.
>
> Depending on python3-cryptography which is only available in meta-python (part
> of meta-openembedded) should be avoided. Back in the day we pushed for moving
> other python3 dependencies like pycryptodome and pyelftools into OE-Core:
> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516cahttps://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571
>
> We could try doing the same with this new python3-cryptography dependecy and
> propose moving it to OE-Core. Alternatively, consider adding it to meta-arm?
> Not ideal, but meta-arm-bsp briefly carried alternative/older version recently:
> https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058
>
> I agree with Denys's point here, I think its likely there's other cases just like
> meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
> it would make sense to add a copy of python3-cryptography to meta-arm (especially since
> there's been similar situations in the past) and in parallel try to make a case for
> python3-cryptography to be moved from meta-python to OE-core.
>
> Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.
>
> I have suggested moving python3-cryptography (also
python3-cryptography-vectors) to oe-core previously. It is heavily used for
cryptography and needs to be kept up to date which is much more likely in
oe-core.

This also means python3-pyo3, pyo3.bbclass, python3-setuptools-rust-native
and the setuptools_rust.bbclass would also move to oe-core.

And then some tests. And documentation.


> Alejandro
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3107):
> https://lists.yoctoproject.org/g/meta-arm/message/3107
> Mute This Topic: https://lists.yoctoproject.org/mt/89404067/924729
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005d88b605d95c8782
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 3, 2022 at 7:16 PM Alejandro Hernandez Samanieg=
o &lt;<a href=3D"mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">
 =20
   =20
 =20
  <div></div><div>
    <p><br>
    </p>
    <div>On 3/3/22 23:37, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre style=3D"font-family:monospace">On Thu, Mar 03, 2022 at 09:11:28=
PM +0000, Alejandro Hernandez Samaniego wrote:
</pre>
      <blockquote type=3D"cite">
        <pre style=3D"font-family:monospace">On 3/3/22 10:55, Abdellatif El=
 Khlifi wrote:
</pre>
        <blockquote type=3D"cite">
          <pre style=3D"font-family:monospace">Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D &quot;
meta-python openembedded-layer&quot;
</pre>
        </blockquote>
        <pre style=3D"font-family:monospace">
This statement is a little confusing (to me), please correct me if
I&#39;m wrong, but you&#39;re saying

we should set a dependency from meta-arm-bsp layer, only for
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact
there&#39;s no other mention of

qemuarm64-secureboot in meta-arm-bsp.
</pre>
      </blockquote>
      <pre style=3D"font-family:monospace">Moreover, optee is used by other=
 BSP layers (e.g. meta-ti) by depending on=20
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (p=
art=20
of meta-openembedded) should be avoided. Back in the day we pushed for movi=
ng=20
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3=
c00d8d113b46a49584682e10435157d516ca" target=3D"_blank" style=3D"font-famil=
y:monospace">https://git.openembedded.org/meta-openembedded/commit/?id=3Da8=
f3c00d8d113b46a49584682e10435157d516ca</a>
<a href=3D"https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9=
229e8ec74263a41160c8df32571" target=3D"_blank" style=3D"font-family:monospa=
ce">https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9229e8ec=
74263a41160c8df32571</a>

We could try doing the same with this new python3-cryptography dependecy an=
d=20
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm=
?=20
Not ideal, but meta-arm-bsp briefly carried alternative/older version recen=
tly:

<a href=3D"https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab01=
1e2ba91a6c4ca6e1251de0d8058" target=3D"_blank" style=3D"font-family:monospa=
ce">https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91=
a6c4ca6e1251de0d8058</a></pre>
    </blockquote>
    </div><div><pre style=3D"font-family:monospace">I agree with Denys&#39;=
s point here, I think its likely there&#39;s other cases just like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on th=
em, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (espe=
cially since
there&#39;s been similar situations in the past) and in parallel try to mak=
e a case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we&#39;re successful we can delete the python3-cyrptography c=
opy from meta-arm.
</pre></div></blockquote><div dir=3D"auto">I have suggested moving python3-=
cryptography (also python3-cryptography-vectors) to oe-core previously. It =
is heavily used for cryptography and needs to be kept up to date which is m=
uch more likely in oe-core.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">This also means python3-pyo3, pyo3.bbclass, python3-setuptools-rust-nat=
ive and the setuptools_rust.bbclass would also move to oe-core.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">And then some tests. And documentat=
ion.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><pre dir=3D"aut=
o" style=3D"font-family:monospace">
Alejandro
</pre>
    <p>
    </p>
    <blockquote type=3D"cite">
      <pre style=3D"font-family:monospace"></pre>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#3107): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/3107" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/3107</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89404067/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
89404067/924729</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticoti=
mo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005d88b605d95c8782--

