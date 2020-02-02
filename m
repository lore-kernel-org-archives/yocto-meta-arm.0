Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.2861.1580672771359135739
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 02 Feb 2020 11:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JdoCnbRB;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: peter.griffin@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id f25so12340773ljg.12
        for <meta-arm@lists.yoctoproject.org>; Sun, 02 Feb 2020 11:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JmFrPJemnSix9GKH7QfFKfBMzHm77SK9WOzFsJ/qHMw=;
        b=JdoCnbRBqa2XR+vvc92y+xMlhvvKCRiI9TLDkeV1Ym63ni9oVr+Kjs+fRTC7D/lM1R
         ARfM2GYSR+CrXWp1LLzA6xv5RaYGlsHqofLUx7N8EdV97Z9wIFwz5QP2O0m+A1gIYHfH
         pYdk+YiZFjOLBecYzFISdqUVhfUDRCHCpIV8uuRtqy7r91LHpJgNBp+DA+8iEn6+BQBn
         2F+IKboQXKsWGyug/F5g2gy14LDAsp2oKdL+RuykyVr41/hvuYbYWAS4qtwuWJOD9FEq
         9VQS8iNgVtzlzAU1yTWCh0C7mmUbzyT5h/QNljypKJWOoY0nfH4al1ehJNynEVMd3VnT
         O4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JmFrPJemnSix9GKH7QfFKfBMzHm77SK9WOzFsJ/qHMw=;
        b=D4Ux++FkEXYCcoN+UxmO5qRiO+Ck4ay1xvMG9/OPTBMe1MM76wgGNNNzObkggPFqOI
         uf/NbyBjMeo5CrKdwv+xrkoFr9t5iUYN7q1BPC6eYE6Qwn+Ap85waXn3urENAzrpnFbJ
         yyb/Abs8onjeEpPityAVYeJy56GU+SSZ2XSdP7g1uehQOTteqM0HYp7bq1ELNWKPVh2P
         ow2QtfsM23mSpzJQRInpckSTihFlFPss3vdp5QPX3WxWXrHQ5PSB3/Z3IQZUmESz5ckF
         QzUtNQJzhAZ36yYvJr6xmODiDmHuDpDxtpiqya0uo5qbYpBhgoCqXdZnimRb9impuEuP
         ri9A==
X-Gm-Message-State: APjAAAUc3eJyK7brIWInphJ+KvsewR9/ZRY/BKwsNu8mTimvhcYXNNYW
	n3tyskTcg9cFarBVBnM30R98/Jemdowm6fDmbUr7ug==
X-Google-Smtp-Source: APXvYqwnCPqNnQ+ZzD0xAg4f2VihDhgKDPh9ZHKzxQKlG7SzH9eBhEBUarAtQ67apItgDkGDM1r+xecYrd89xJJl+GA=
X-Received: by 2002:a2e:b68c:: with SMTP id l12mr11483387ljo.36.1580672769493;
 Sun, 02 Feb 2020 11:46:09 -0800 (PST)
MIME-Version: 1.0
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
 <20200130054742.GQ4735@denix.org> <CAPoiz9y72c=8WATQEe0kzzdCV+6SFGtSQvM6n-XpU+YLjKqMvw@mail.gmail.com>
 <20200131235657.GR4735@denix.org> <CAPoiz9xpw_hp0XmBaz2uVK5-zKx4g+QCvczPrmJ2Vt6Y9ZTMQQ@mail.gmail.com>
In-Reply-To: <CAPoiz9xpw_hp0XmBaz2uVK5-zKx4g+QCvczPrmJ2Vt6Y9ZTMQQ@mail.gmail.com>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Sun, 2 Feb 2020 19:45:57 +0000
Message-ID: <CADrjBPqQQhy-66QNu_Q6fsAxwiGWHjVZqkWmZdxcYS3JdecYmA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 0/5] Add OP-TEE recipes to meta-arm layer
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>, 
	Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, 
	Moorthy Baskaravenkatraman Sambamoorthy <moorthy.baskaravenkatraman-sambamoorthy@linaro.org>, 
	Alexandre Jutras <alexandre.jutras@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000eea131059d9d0ea0"

--000000000000eea131059d9d0ea0
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Sat, 1 Feb 2020 at 15:25, Jon Mason <jdmason@kudzu.us> wrote:

> On Sat, Feb 1, 2020 at 12:57 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Fri, Jan 31, 2020 at 07:54:08AM +0100, Jon Mason wrote:
> > > On Thu, Jan 30, 2020 at 6:47 AM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > > >
> > > > Thanks! And for the entire series:
> > > >
> > > > Tested-by: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > The only nitpick is that 0001-use-python3-instead-of-python.patch
> gets
> > > > created in patch #4, but is added to the recipe in patch #5 - should
> have
> > > > been all in one patch.
> > >
> > > I was thinking the same thing.  I can easily squash all of this into
> > > one patch via git when I merge, if so desired.
> >
> > I'm fine with squashing few patches, if you want to. Do you want to
> squash 4
> > and 5 only, or all 5 of them into 1?
>
> I was meaning all 5 into 1, but 4 & 5 only can be done if that's preferred.
>

Squashing 4 & 5 together makes sense and would be my preference I think
over 1 giant patch.

Thanks,

Peter.

>
> Thanks,
> Jon
>
> >
> > Denys
> >
> >
> > > Thanks,
> > > Jon
> > >
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > On Wed, Jan 29, 2020 at 05:38:40PM +0000, Peter Griffin wrote:
> > > > > Hi Jon,
> > > > >
> > > > > This patch series adds the OP-TEE recipes from meta-linaro
> > > > > layer to the meta-arm layer which is the new home for generic
> > > > > Arm architecture components.
> > > > >
> > > > > Once these are merged, I will remove them and add a README
> > > > > in meta-linaro.
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Peter.
> > > > >
> > > > > Peter Griffin (5):
> > > > >   optee-client.bb: add optee client recipe and patches
> > > > >   optee-os_git.bb: add optee-os recipe and patches
> > > > >   optee-examples.bb: add recipe for optee examples
> > > > >   optee-test_git.bb: add optee-test recipe & patches
> > > > >   optee-test_git.bb: add python3 backport patch
> > > > >
> > > > >  meta-arm/recipes-security/optee/optee-client.bb    | 35
> +++++++++++
> > > > >  .../optee/optee-client/tee-supplicant.service      | 10 ++++
> > > > >  meta-arm/recipes-security/optee/optee-examples.bb  | 42
> +++++++++++++
> > > > >  ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
> > > > >  meta-arm/recipes-security/optee/optee-os_git.bb    | 69
> ++++++++++++++++++++++
> > > > >  .../0001-use-python3-instead-of-python.patch       | 48
> +++++++++++++++
> > > > >  meta-arm/recipes-security/optee/optee-test_git.bb  | 50
> ++++++++++++++++
> > > > >  7 files changed, 267 insertions(+)
> > > > >  create mode 100644 meta-arm/recipes-security/optee/
> optee-client.bb
> > > > >  create mode 100644
> meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> > > > >  create mode 100644 meta-arm/recipes-security/optee/
> optee-examples.bb
> > > > >  create mode 100644
> meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
> > > > >  create mode 100644 meta-arm/recipes-security/optee/
> optee-os_git.bb
> > > > >  create mode 100644
> meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
> > > > >  create mode 100644 meta-arm/recipes-security/optee/
> optee-test_git.bb
> > > > >
> > > > > --
> > > > > 2.7.4
> > > > >
> > > >
> >
> > >
> >
> > 
>

--000000000000eea131059d9d0ea0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jon,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, 1 Feb 2020 at 15:25, Jon Mason &lt;<=
a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Feb 1, 2020 at 1=
2:57 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"=
_blank">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Jan 31, 2020 at 07:54:08AM +0100, Jon Mason wrote:<br>
&gt; &gt; On Thu, Jan 30, 2020 at 6:47 AM Denys Dmytriyenko &lt;<a href=3D=
"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks! And for the entire series:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Tested-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti=
.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The only nitpick is that 0001-use-python3-instead-of-python=
.patch gets<br>
&gt; &gt; &gt; created in patch #4, but is added to the recipe in patch #5=
 - should have<br>
&gt; &gt; &gt; been all in one patch.<br>
&gt; &gt;<br>
&gt; &gt; I was thinking the same thing.=C2=A0 I can easily squash all of =
this into<br>
&gt; &gt; one patch via git when I merge, if so desired.<br>
&gt;<br>
&gt; I&#39;m fine with squashing few patches, if you want to. Do you want =
to squash 4<br>
&gt; and 5 only, or all 5 of them into 1?<br>
<br>
I was meaning all 5 into 1, but 4 &amp; 5 only can be done if that&#39;s p=
referred.<br></blockquote><div><br></div><div>Squashing 4 &amp; 5 together =
makes sense and would be my preference I think</div><div>over 1 giant patch=
.</div><div><br></div><div>Thanks,</div><div><br></div><div>Peter.</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Jon<br>
<br>
&gt;<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Jon<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Denys<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Jan 29, 2020 at 05:38:40PM +0000, Peter Griffin wro=
te:<br>
&gt; &gt; &gt; &gt; Hi Jon,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This patch series adds the OP-TEE recipes from meta-li=
naro<br>
&gt; &gt; &gt; &gt; layer to the meta-arm layer which is the new home for =
generic<br>
&gt; &gt; &gt; &gt; Arm architecture components.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Once these are merged, I will remove them and add a RE=
ADME<br>
&gt; &gt; &gt; &gt; in meta-linaro.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Peter.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Peter Griffin (5):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"http://optee-client.bb" rel=3D"=
noreferrer" target=3D"_blank">optee-client.bb</a>: add optee client recipe =
and patches<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"http://optee-os_git.bb" rel=3D"=
noreferrer" target=3D"_blank">optee-os_git.bb</a>: add optee-os recipe and =
patches<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"http://optee-examples.bb" rel=
=3D"noreferrer" target=3D"_blank">optee-examples.bb</a>: add recipe for op=
tee examples<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"http://optee-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">optee-test_git.bb</a>: add optee-test re=
cipe &amp; patches<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"http://optee-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">optee-test_git.bb</a>: add python3 backp=
ort patch<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 meta-arm/recipes-security/optee/<a href=3D"http:=
//optee-client.bb" rel=3D"noreferrer" target=3D"_blank">optee-client.bb</a>=
=
=C2=A0 =C2=A0 | 35 +++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 .../optee/optee-client/tee-supplicant.service=C2=
=
=A0 =C2=A0 =C2=A0 | 10 ++++<br>
&gt; &gt; &gt; &gt;=C2=A0 meta-arm/recipes-security/optee/<a href=3D"http:=
//optee-examples.bb" rel=3D"noreferrer" target=3D"_blank">optee-examples.bb=
</a>=C2=A0 | 42 +++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 ...1-allow-setting-sysroot-for-libgcc-lookup.pat=
ch | 13 ++++<br>
&gt; &gt; &gt; &gt;=C2=A0 meta-arm/recipes-security/optee/<a href=3D"http:=
//optee-os_git.bb" rel=3D"noreferrer" target=3D"_blank">optee-os_git.bb</a>=
=
=C2=A0 =C2=A0 | 69 ++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 .../0001-use-python3-instead-of-python.patch=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 48 +++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 meta-arm/recipes-security/optee/<a href=3D"http:=
//optee-test_git.bb" rel=3D"noreferrer" target=3D"_blank">optee-test_git.bb=
</a>=C2=A0 | 50 ++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 7 files changed, 267 insertions(+)<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta-arm/recipes-security/opt=
ee/<a href=3D"http://optee-client.bb" rel=3D"noreferrer" target=3D"_blank">=
optee-client.bb</a><br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta-arm/recipes-security/opt=
ee/optee-client/tee-supplicant.service<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta-arm/recipes-security/opt=
ee/<a href=3D"http://optee-examples.bb" rel=3D"noreferrer" target=3D"_blank=
">optee-examples.bb</a><br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta-arm/recipes-security/opt=
ee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta-arm/recipes-security/opt=
ee/<a href=3D"http://optee-os_git.bb" rel=3D"noreferrer" target=3D"_blank">=
optee-os_git.bb</a><br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta-arm/recipes-security/opt=
ee/optee-test/0001-use-python3-instead-of-python.patch<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta-arm/recipes-security/opt=
ee/<a href=3D"http://optee-test_git.bb" rel=3D"noreferrer" target=3D"_blank=
">optee-test_git.bb</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.7.4<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
</blockquote></div></div>

--000000000000eea131059d9d0ea0--
