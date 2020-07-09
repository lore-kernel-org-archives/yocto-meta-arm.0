Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web10.2227.1594282447556639335
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 01:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eygyyqI3;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id o4so660260ybp.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBJ7sjM450pbX+vHEpIC8kpPm/lLDFLHBoFw147kdtw=;
        b=eygyyqI3mSqzO8p+HzuQQZYyayCqpRLSl5QHS3hM6y1/ZpRvBow6qo1oXj+sGJmW9w
         55nkGeXnlxQHvQ2MQC2wpoxRFPyKhNRsEw7N/2iErwHvPOOQ95/fooQLfxNkzhlnbyAe
         RSY3KZGKk6rmMyYjG+Xf1j5eya1FgeSfbEapN/2F0nSqcLCB/3s3zij1tOuway+OZLM0
         67M4u6yFF8cMsa+MDWeSuExVyYR7hFNgLGtACZC5MNzEV4tXk6EFlZWFI5PYmlrH0Afx
         gUSQRd6+sOvxhRWobVi4mT92uVK109DhthXn/gFwuffsHkhPWh0gM92LSj2rmsD2Cgui
         PpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBJ7sjM450pbX+vHEpIC8kpPm/lLDFLHBoFw147kdtw=;
        b=AeR8yLIYTsOU+6QoNV/fVQsTBQ6S7mDz8PdV4PD4XSo8uMZYPvZL1UU06x65X7Ctge
         3gXyFWUDSVNMIxb0R/RIj/A0svGoxVdXP/KOl2ys7J5W+if2sYcMEGc4auRW91o5BtyU
         OQVi8dG26vRf8/kjudkWFVguh5rk/e5TSRqlSvFFq9YQj6vafKlDkdijoMas2PZK4gRt
         Ey7bVo7XuwU049mYpaCRRdegMwdgBMyJofCqyBvv1o6yIGUr11tgWYeTPo+C78xDikZs
         uK5Eh4XgHw7VZUtUNgoMC/DElAmh0EAGDZaLz5VEaCDdCJkVYYPuIMEhZsRdNuayr7GH
         uBPA==
X-Gm-Message-State: AOAM5313+GWFji+bOhEgaiuH0lcijYJ1qoghvjAToAcsrjks3JlKA9hp
	YQHYssQAqchEqrW8DKCzi9Gp5FCTFeMQkE4UKLX6eA==
X-Google-Smtp-Source: ABdhPJzByC+c6NgvE8lpi1JhbPR6ZtWEyRtqaQKEZr1rfAusDUh42x5cIt8af5JBF3skSTFEHXuAk4fTnxfMqRPDaV8=
X-Received: by 2002:a25:bfc5:: with SMTP id q5mr95177031ybm.475.1594282446572;
 Thu, 09 Jul 2020 01:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200704154301.15546-1-jon.mason@arm.com> <CAP71Wjxp9P1T-gKehWz-eio7JD4H8_DhdvorEtiEf37L49cY2A@mail.gmail.com>
 <7372fed9b3d2942e5b3b2a2e9cce9c3c55fea53e.camel@linuxfoundation.org>
In-Reply-To: <7372fed9b3d2942e5b3b2a2e9cce9c3c55fea53e.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 9 Jul 2020 10:13:55 +0200
Message-ID: <CAP71WjyrP2QEbJCYeXF0yQ0SvTPyVKn99RE9qZThvd=55=HRNQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: yocto-check-layer fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000e664e405a9fdce64"

--000000000000e664e405a9fdce64
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 8, 2020 at 12:02 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-07-08 at 11:57 +0200, Nicolas Dechesne wrote:
> >
> >
> > On Mon, Jul 6, 2020 at 11:39 PM Jon Mason <jon.mason@arm.com> wrote:
> > > Changes necessary to get yocto-check-layer to pass
> > >
> > > Change-Id: Ie9ea5047ab1344d14a585552277fdbd6b2bc48ab
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  meta-arm-bsp/README.md                                     | 1 +
> > >  .../recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend  | 3 ++-
> > >  .../recipes-kernel/linux/linux-yocto-arm-platforms.inc     | 7
> > > ++++++-
> > >  meta-arm/README.md                                         | 1 +
> > >  4 files changed, 10 insertions(+), 2 deletions(-)
> > >  create mode 100644 meta-arm-bsp/README.md
> > >  create mode 100644 meta-arm/README.md
> > >
> > > diff --git a/meta-arm-bsp/README.md b/meta-arm-bsp/README.md
> > > new file mode 100644
> > > index 0000000..490ddca
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/README.md
> > > @@ -0,0 +1 @@
> > > +See ../README.md
> > > diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-
> > > ifupdown_1.0.bbappend b/meta-arm-bsp/recipes-core/init-
> > > ifupdown/init-ifupdown_1.0.bbappend
> > > index 8b5120f..2c5f61a 100644
> > > --- a/meta-arm-bsp/recipes-core/init-ifupdown/init-
> > > ifupdown_1.0.bbappend
> > > +++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-
> > > ifupdown_1.0.bbappend
> > > @@ -3,5 +3,6 @@
> > >  #
> > >  # Enable second network interface on startup
> > >  #
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > > -FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files/juno:"
> > > +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> >
> > hmm. don't these changes impact the metadata with or without this
> > layer added? How can it pass the check-layer script?
>
> I have to admit I saw this patch and was wondering that too. Unless the
> recipe is already machine specific in core?
>

right.. the recipe does:
PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"

So it's a luck situation for yocto-check-layer.. since it computes world
signature with a qemu machine by default. so they indeed don't change after
adding meta-arm-bsp! however for someone not using qemu in the first place,
adding meta-arm-bsp would change them!


>
> Cheers,
>
> Richard
>
>

--000000000000e664e405a9fdce64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 8, 2020 at 12:02 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, 2020-07-08 at 11:57 +0200, Nicolas Deche=
sne wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jul 6, 2020 at 11:39 PM Jon Mason &lt;<a href=3D"mailto:jon.ma=
son@arm.com" target=3D"_blank">jon.mason@arm.com</a>&gt; wrote:<br>
&gt; &gt; Changes necessary to get yocto-check-layer to pass<br>
&gt; &gt; <br>
&gt; &gt; Change-Id: Ie9ea5047ab1344d14a585552277fdbd6b2bc48ab<br>
&gt; &gt; Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com"=
 target=3D"_blank">jon.mason@arm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-arm-bsp/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt;=C2=A0 .../recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend=
=C2=A0 | 3 ++-<br>
&gt; &gt;=C2=A0 .../recipes-kernel/linux/linux-yocto-arm-platforms.inc=C2=
=A0 =C2=A0 =C2=A0| 7<br>
&gt; &gt; ++++++-<br>
&gt; &gt;=C2=A0 meta-arm/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt;=C2=A0 4 files changed, 10 insertions(+), 2 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm-bsp/README.md<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm/README.md<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-arm-bsp/README.md b/meta-arm-bsp/README.md<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..490ddca<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/README.md<br>
&gt; &gt; @@ -0,0 +1 @@<br>
&gt; &gt; +See ../README.md<br>
&gt; &gt; diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-<br>
&gt; &gt; ifupdown_1.0.bbappend b/meta-arm-bsp/recipes-core/init-<br>
&gt; &gt; ifupdown/init-ifupdown_1.0.bbappend<br>
&gt; &gt; index 8b5120f..2c5f61a 100644<br>
&gt; &gt; --- a/meta-arm-bsp/recipes-core/init-ifupdown/init-<br>
&gt; &gt; ifupdown_1.0.bbappend<br>
&gt; &gt; +++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-<br>
&gt; &gt; ifupdown_1.0.bbappend<br>
&gt; &gt; @@ -3,5 +3,6 @@<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # Enable second network interface on startup<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt; +PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; &gt; <br>
&gt; &gt; -FILESEXTRAPATHS_prepend_juno :=3D &quot;${THISDIR}/files/juno:&q=
uot;<br>
&gt; &gt; +FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; <br>
&gt; hmm. don&#39;t these changes impact the metadata with or without this<=
br>
&gt; layer added? How can it pass the check-layer script?<br>
<br>
I have to admit I saw this patch and was wondering that too. Unless the<br>
recipe is already machine specific in core?<br></blockquote><div><br></div>=
<div>right.. the recipe does:</div>PACKAGE_ARCH_qemuall =3D &quot;${MACHINE=
_ARCH}&quot;<br><div><br></div><div>So it&#39;s a luck situation for yocto-=
check-layer.. since it computes world signature with a qemu machine by defa=
ult. so they indeed don&#39;t change after adding meta-arm-bsp! however for=
 someone not using qemu in the first place, adding meta-arm-bsp would chang=
e them!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000e664e405a9fdce64--
