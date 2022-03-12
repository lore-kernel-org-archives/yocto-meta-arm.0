Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B49C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 22:02:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.9567.1647122543463441347
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 12 Mar 2022 14:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VXT8fo9F;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: ticotimo@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id r10so18224917wrp.3
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 12 Mar 2022 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T7/7XBbNH8+wSjf921TohTVkBhacugRuw3aiDmdoGTc=;
        b=VXT8fo9FDnwVOq/nh3SsVfDMrD3w4HW8wYsA+NB+uxE5VGOuoHe5VG303iJDeRuQD3
         dOugKv95giByWP0vby3emy5H3H1mxBdGMkutW9n4w5HVr6Ju+tbS82YcKnG4fq5qYSCI
         BrORuFEJU0DOwjzrcb6Msz6fItjjWZj/iQxTHrS4LCyvDXmdBfVT6Tp3RF9tRvS8gThe
         rfR912IZm01MHoqSqAk5oxRIeWJcyBrNvf0IbL9VSH6xMPpIgg1dTNMMK6sL1X5XajGU
         lCS4sRJsDTkTeVJsH2mfSAH/Gr/slnp+dRfy/h7fZduXycC7/P+OjNWxi8hTaPPRISwm
         VmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T7/7XBbNH8+wSjf921TohTVkBhacugRuw3aiDmdoGTc=;
        b=Y+J1V4MdlYavTMh/ghilZTRBp6skoqIXzs0/1UlqPDAf/d5b5EGhaz/pC4B2C5cto0
         bAQx8vLG8Jx2UZPlyyDZrB88d3GBcvMdSz8wYVByler4mjW7CmG+POHWAKH0LDK7/e23
         8uqr84jP7hofv33txVIPg3TniFPz2ceKByhhRRw2/8PRJvMGf9qS44H9uzJnaeQyK2DQ
         3D142j4dYU825IIkvBQBivtDmuPsc2EtGIed4CGLOGLvsra+2MpHIaFTX/GVVSAlu7VD
         P+Rjm1XpCWLq2JGyjGvU4IT0CDP76H+a65zGEULdst6JYHxtnPFDganrCgt4ghh5Ps57
         GH9g==
X-Gm-Message-State: AOAM530SQaFFJE5l1s0yemNxRnWSseYuwK18DSiaaCsO/K+9KYeP68T5
	lnrc+1fz8HcVH8rTS4LKmykRXT5FaTPg4XOzTWc=
X-Google-Smtp-Source: 
 ABdhPJy74BN/uGN9J+832A/Gtkib9YWYtaBo6IvqWTCwcx0a11zUapI49m81iEkxendeS3Xb0Uzh9q66yUArmHMzf/0=
X-Received: by 2002:a5d:4387:0:b0:1ed:a13a:ef0c with SMTP id
 i7-20020a5d4387000000b001eda13aef0cmr11666280wrq.62.1647122541684; Sat, 12
 Mar 2022 14:02:21 -0800 (PST)
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
 <YikHhHc7RcwyEcua@kudzu.us>
 <f91a66b2-53da-4ba9-dc20-3d2b4d590206@linux.microsoft.com>
 <571898ed-d0f4-a7c6-9559-4a125baf7c38@linux.microsoft.com>
In-Reply-To: <571898ed-d0f4-a7c6-9559-4a125baf7c38@linux.microsoft.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 12 Mar 2022 14:02:10 -0800
Message-ID: 
 <CANx9H-A5DxwqX50dX1Ln14r7Ci_JTwGWXeQWQ2Gg3MfrcOKUyg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000ffac8b05da0c99f0"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 22:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3166

--000000000000ffac8b05da0c99f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 9:12 AM Alejandro Hernandez Samaniego <
alhe@linux.microsoft.com> wrote:

>
> On 3/10/22 01:05, Alejandro Hernandez wrote:
>
>
> On 3/9/22 13:01, Jon Mason wrote:
>
> On Fri, Mar 04, 2022 at 03:16:31AM +0000, Alejandro Hernandez wrote:
>
> On 3/3/22 23:37, Denys Dmytriyenko wrote:
>
> On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego w=
rote:
>
> On 3/3/22 10:55, Abdellatif El Khlifi wrote:
>
> Hello,
>
> I suggest the following:
>
> In meta-arm-bsp/conf/layer.conf add :
>
> LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D "
> meta-python openembedded-layer"
>
> This statement is a little confusing (to me), please correct me if
> I'm wrong, but you're saying
>
> we should set a dependency from meta-arm-bsp layer, only for
> qemuarm64-secureboot,
>
> however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bs=
p,
>
> AFAIC meta-arm-bsp has now knowledge of its existence, in fact
> there's no other mention of
>
> qemuarm64-secureboot in meta-arm-bsp.
>
> Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending o=
n
> meta-arm, not meta-arm-bsp.
>
> Depending on python3-cryptography which is only available in meta-python =
(part
> of meta-openembedded) should be avoided. Back in the day we pushed for mo=
ving
> other python3 dependencies like pycryptodome and pyelftools into OE-Core:
> https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3c00d8d113=
b46a49584682e10435157d516cahttps://git.yoctoproject.org/meta-arm/commit/?id=
=3Df2069723f27d9229e8ec74263a41160c8df32571
>
> We could try doing the same with this new python3-cryptography dependecy =
and
> propose moving it to OE-Core. Alternatively, consider adding it to meta-a=
rm?
> Not ideal, but meta-arm-bsp briefly carried alternative/older version rec=
ently:
> https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91a6=
c4ca6e1251de0d8058
>
> I agree with Denys's point here, I think its likely there's other cases j=
ust like
> meta-ti, and we would be forcing a meta-oe and meta-python dependency on =
them, IMO
> it would make sense to add a copy of python3-cryptography to meta-arm (es=
pecially since
> there's been similar situations in the past) and in parallel try to make =
a case for
> python3-cryptography to be moved from meta-python to OE-core.
>
> Once (and if) we're successful we can delete the python3-cyrptography cop=
y from meta-arm.
>
> This seems reasonable.  Can you rework your series to add this?  Also,
> we need to keep the older version of OPTEE for corstone1000 (for the
> kirkstone release).  So, if you can keep that around in v2, it would
> be appreciated.
>
> Thanks,
> Jon
>
> Will do, I'll send a v2 soon.
>
> Cheers,
>
> Alejandro
>
>
> Quick update before sending v2, the list of required dependencies to brin=
g python3-cryptography is the following:
>
> recipes:
>
> python3-asn1crypto_1.4.0.bbpython3-cffi_1.15.0.bb
> python3-cryptographypython3-cryptography_36.0.1.bbpython3-cryptography-ve=
ctors_36.0.1.bbpython3-pycparser_2.21.bbpython3-semantic-version_2.9.0.bbpy=
thon3-setuptools-rust-native_1.1.2.bbpython3-typing-extensions_3.10.0.0.bb
>
> classes:
>
> pyo3.bbclass
> setuptools3_rust.bbclass
>
>
The full story (only missing a couple recipes added to ptest because I
don=E2=80=99t know if they are slow or fast)
https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/move-py-crypto

=E2=80=94Tim

>
> Alejandro
>
>
> Alejandro
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3150):
> https://lists.yoctoproject.org/g/meta-arm/message/3150
> Mute This Topic: https://lists.yoctoproject.org/mt/89404067/924729
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ffac8b05da0c99f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 10, 2022 at 9:12 AM Alejandro Hernandez Samanie=
go &lt;<a href=3D"mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)">
 =20
   =20
 =20
  <div></div><div>
    <p><br>
    </p>
    <div>On 3/10/22 01:05, Alejandro Hernandez
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <p><br>
      </p>
      <div>On 3/9/22 13:01, Jon Mason wrote:<br>
      </div>
      <blockquote type=3D"cite">
        <pre style=3D"font-family:monospace">On Fri, Mar 04, 2022 at 03:16:=
31AM +0000, Alejandro Hernandez wrote:
</pre>
        <blockquote type=3D"cite">
          <pre style=3D"font-family:monospace">On 3/3/22 23:37, Denys Dmytr=
iyenko wrote:
</pre>
          <blockquote type=3D"cite">
            <pre style=3D"font-family:monospace">On Thu, Mar 03, 2022 at 09=
:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
</pre>
            <blockquote type=3D"cite">
              <pre style=3D"font-family:monospace">On 3/3/22 10:55, Abdella=
tif El Khlifi wrote:
</pre>
              <blockquote type=3D"cite">
                <pre style=3D"font-family:monospace">Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D &quot;
meta-python openembedded-layer&quot;
</pre>
              </blockquote>
              <pre style=3D"font-family:monospace">This statement is a litt=
le confusing (to me), please correct me if
I&#39;m wrong, but you&#39;re saying

we should set a dependency from meta-arm-bsp layer, only for
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact
there&#39;s no other mention of

qemuarm64-secureboot in meta-arm-bsp.
</pre>
            </blockquote>
            <pre style=3D"font-family:monospace">Moreover, optee is used by=
 other BSP layers (e.g. meta-ti) by depending on
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (p=
art
of meta-openembedded) should be avoided. Back in the day we pushed for movi=
ng
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
d
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm=
?
Not ideal, but meta-arm-bsp briefly carried alternative/older version recen=
tly:

<a href=3D"https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab01=
1e2ba91a6c4ca6e1251de0d8058" target=3D"_blank" style=3D"font-family:monospa=
ce">https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91=
a6c4ca6e1251de0d8058</a>
</pre>
          </blockquote>
          <pre style=3D"font-family:monospace">I agree with Denys&#39;s poi=
nt here, I think its likely there&#39;s other cases just like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on th=
em, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (espe=
cially since
there&#39;s been similar situations in the past) and in parallel try to mak=
e a case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we&#39;re successful we can delete the python3-cyrptography c=
opy from meta-arm.
</pre>
        </blockquote>
        <pre style=3D"font-family:monospace">This seems reasonable.  Can yo=
u rework your series to add this?  Also,
we need to keep the older version of OPTEE for corstone1000 (for the
kirkstone release).  So, if you can keep that around in v2, it would
be appreciated.

Thanks,
Jon
</pre>
      </blockquote>
      <pre style=3D"font-family:monospace">Will do, I&#39;ll send a v2 soon=
.</pre>
      <pre style=3D"font-family:monospace">Cheers,</pre>
      <pre style=3D"font-family:monospace">Alejandro
</pre>
      <p><br>
      </p>
    </blockquote>
    </div><div><pre style=3D"font-family:monospace">Quick update before sen=
ding v2, the list of required dependencies to bring python3-cryptography is=
 the following:</pre>
    <pre style=3D"font-family:monospace">recipes:
</pre>
    <pre style=3D"font-family:monospace"><a href=3D"http://python3-asn1cryp=
to_1.4.0.bb" target=3D"_blank" style=3D"font-family:monospace">python3-asn1=
crypto_1.4.0.bb</a>
<a href=3D"http://python3-cffi_1.15.0.bb" target=3D"_blank" style=3D"font-f=
amily:monospace">python3-cffi_1.15.0.bb</a>
python3-cryptography
<a href=3D"http://python3-cryptography_36.0.1.bb" target=3D"_blank" style=
=3D"font-family:monospace">python3-cryptography_36.0.1.bb</a>
<a href=3D"http://python3-cryptography-vectors_36.0.1.bb" target=3D"_blank"=
 style=3D"font-family:monospace">python3-cryptography-vectors_36.0.1.bb</a>
<a href=3D"http://python3-pycparser_2.21.bb" target=3D"_blank" style=3D"fon=
t-family:monospace">python3-pycparser_2.21.bb</a>
<a href=3D"http://python3-semantic-version_2.9.0.bb" target=3D"_blank" styl=
e=3D"font-family:monospace">python3-semantic-version_2.9.0.bb</a>
<a href=3D"http://python3-setuptools-rust-native_1.1.2.bb" target=3D"_blank=
" style=3D"font-family:monospace">python3-setuptools-rust-native_1.1.2.bb</=
a>
<a href=3D"http://python3-typing-extensions_3.10.0.0.bb" target=3D"_blank" =
style=3D"font-family:monospace">python3-typing-extensions_3.10.0.0.bb</a></=
pre>
    <pre style=3D"font-family:monospace">classes:</pre>
    <pre style=3D"font-family:monospace">pyo3.bbclass
setuptools3_rust.bbclass
</pre></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">The =
full story (only missing a couple recipes added to ptest because I don=E2=
=80=99t know if they are slow or fast)</div><div dir=3D"auto"><div><a href=
=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/move-py-crypto"=
>https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/move-py-crypto</a>=
</div><br></div><div dir=3D"auto">=E2=80=94Tim</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><=
pre dir=3D"auto" style=3D"font-family:monospace">
Alejandro
</pre>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <p> </p>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre style=3D"font-family:monospace">Alejandro
</pre>
          <br>
          <fieldset></fieldset>
          <pre style=3D"font-family:monospace">
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#3150): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/3150" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/3150</a><br>
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

--000000000000ffac8b05da0c99f0--

