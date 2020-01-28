Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.335.1580250538317222136
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2020 14:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VLIC/4pk;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id q8so12277354ljb.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2020 14:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WgymmJ4/q0Au/OBqH9pM6u6cMdSjaeu9pwrjIbBs3qo=;
        b=VLIC/4pkSQHCGwo4IW9tN2cpmWUsvawHCm0zYdDXbXIcm+FJ1M0CgBvUovcvTttQaK
         xjl1piCvm7GtavQXR71/ia8v3RP0id3UDK223Ia29OYerHkoifSHX8SbWQBut9FXuZ/Q
         aRExLvkPT7CKiegBe60nxRpDO+poR2PPbsQSLOpjPBsH2XnG/c6OGQe0hUGby+JLPJcF
         vY7iRE9vX5foJGxo8OnRcHby+zwnDuz0KXfJzsRGKbSNvCrxjlr90noBWr5UlxpLZ7pL
         JyV4WCT7Dp8GP6iQ0C+2Cy9lrKzICR2JdhLlr9jpi3vz7Cdg/ERYITYW/StXXWjtyHaJ
         BYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WgymmJ4/q0Au/OBqH9pM6u6cMdSjaeu9pwrjIbBs3qo=;
        b=gmLe0JPA9wXXA2MsQap4yaayB8V1jsXsfj/QSsRFjgeLQjPoh8mTjyuwNYyJIk1/kc
         MTjqQPcLevd0NF/Wfloe4zMYKNY839BOIGZJdIdihKqF6bHPlq/7oY76F+Si42sQRaDS
         ExiEU5NN5Tq+jJaX4l8y65SSWicQLZC5mH8iK209Cdca5tjx6FAKQ9W7cg09KZPskOMI
         eB6GmN9S3fm7uvtO9CSLfmph9iaPpN5DdkadlluWtz9Ix+XHg6JVO7ngZmUHa0Pf6Xco
         t13kyxsmj6AqLi39PlQ7GX9HTEQH/JTmOygsO7pkdJjiS0NaRuPJgq/HJ3xMitplJEms
         PD6A==
X-Gm-Message-State: APjAAAV8lyt+dPJa5EKz6GER5FdA1WcSxBBb+vDyy3P9yDpdEXn7STdQ
	zh3G7JEdFPhN5V//17MgP3ecPHaSFaofwy7mvwpAwA==
X-Google-Smtp-Source: APXvYqxF/84AXpPLXEUHJxMhOFr51g21hVutIVftl88du7LWPy5ZcaoHFqPaCMf2n9Yk1HruztO1P/hr/mLVfQ0At9o=
X-Received: by 2002:a2e:b5ce:: with SMTP id g14mr7633482ljn.264.1580250536399;
 Tue, 28 Jan 2020 14:28:56 -0800 (PST)
MIME-Version: 1.0
References: <1580124007-23324-1-git-send-email-sumit.garg@linaro.org>
 <20200128045355.GK4735@denix.org> <CAPoiz9zvPps4ZfkgOwFKEKcKUCdbAov5x9F4+GNfgQ1v5r5YhA@mail.gmail.com>
 <20200128212006.GM4735@denix.org>
In-Reply-To: <20200128212006.GM4735@denix.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 28 Jan 2020 23:28:45 +0100
Message-ID: <CAP71WjzGOUJZbtuJKkgBDnibyvgntmxvXM6LgsFeoQqxh5g0Nw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Import ARM GNU-A toolset recipes from meta-linaro
To: Denys Dmytriyenko <denis@denix.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Sumit Garg <sumit.garg@linaro.org>, jon.mason@arm.com, 
	meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e0f354059d3abfe0"

--000000000000e0f354059d3abfe0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 28 janv. 2020 =C3=A0 22:20, Denys Dmytriyenko <denis@denix.org> a =
=C3=A9crit :

> On Tue, Jan 28, 2020 at 04:06:17PM -0500, Jon Mason wrote:
> > On Mon, Jan 27, 2020 at 11:54 PM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > >
> > > On Mon, Jan 27, 2020 at 04:50:07PM +0530, Sumit Garg wrote:
> > > > Add a new meta-arm-toolchain layer to hold ARM GNU-A toolset recipe=
s
> > > > imported from meta-linaro tree, branch: master and commit ID:
> > > > 504ca3b217c9602b10eda0ec8a9f1055b59e482f.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > >
> > > It's an exact copy of what's currently in meta-linaro-toolchain, but =
I
> still
> > > decided to test it - I applied this patch to meta-arm and reconfigure=
d
> my
> > > setup by replacing meta-linaro-toolchain with the new
> meta-arm-toolchain and
> > > ran few builds that use external-arm-toolchain and gcc-arm recipes:
> > >
> > > Tested-by: Denys Dmytriyenko <denys@ti.com>
> >
> > Thank you for the patch, Sumit, and for testing, Denys.  It is now
> > included in meta-arm, see
> >
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3Dc0a59f3d=
94c633d6c902e7bd436690bc890bbc40
>
> Thank you, Jon!
>
> Now I only need OP-TEE recipes migrated (Nico?) - I wonder if meta-optee
> sublayer is required like it's in meta-linaro/meta-optee[1], or just
> adding
> them into main meta-arm sublayer would be fine?


I think it should go into meta-arm directly. I don=E2=80=99t think adding t=
oo many
layers is the right approach. We need to make sure that meta-arm remains a
generic software layer (no machine, no distro) so that it can easilt be
consumed, so arguably we might not even need meta-arm-toolchain neither...


>
> [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/
>
> --
> Denys
>

--000000000000e0f354059d3abfe0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mar. 28 janv. 2020 =C3=A0 22:20, Denys Dmytriyenko =
&lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Jan 28, 2020 at 04:=
06:17PM -0500, Jon Mason wrote:<br>
&gt; On Mon, Jan 27, 2020 at 11:54 PM Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Jan 27, 2020 at 04:50:07PM +0530, Sumit Garg wrote:<br>
&gt; &gt; &gt; Add a new meta-arm-toolchain layer to hold ARM GNU-A toolset=
 recipes<br>
&gt; &gt; &gt; imported from meta-linaro tree, branch: master and commit ID=
:<br>
&gt; &gt; &gt; 504ca3b217c9602b10eda0ec8a9f1055b59e482f.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Sumit Garg &lt;<a href=3D"mailto:sumit.garg@l=
inaro.org" target=3D"_blank">sumit.garg@linaro.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s an exact copy of what&#39;s currently in meta-linaro-too=
lchain, but I still<br>
&gt; &gt; decided to test it - I applied this patch to meta-arm and reconfi=
gured my<br>
&gt; &gt; setup by replacing meta-linaro-toolchain with the new meta-arm-to=
olchain and<br>
&gt; &gt; ran few builds that use external-arm-toolchain and gcc-arm recipe=
s:<br>
&gt; &gt;<br>
&gt; &gt; Tested-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" =
target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; <br>
&gt; Thank you for the patch, Sumit, and for testing, Denys.=C2=A0 It is no=
w<br>
&gt; included in meta-arm, see<br>
&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/=
?id=3Dc0a59f3d94c633d6c902e7bd436690bc890bbc40" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=
=3Dc0a59f3d94c633d6c902e7bd436690bc890bbc40</a><br>
<br>
Thank you, Jon!<br>
<br>
Now I only need OP-TEE recipes migrated (Nico?) - I wonder if meta-optee <b=
r>
sublayer is required like it&#39;s in meta-linaro/meta-optee[1], or just ad=
ding <br>
them into main meta-arm sublayer would be fine?</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I think it should go into meta-arm directly.=
 I don=E2=80=99t think adding too many layers is the right approach. We nee=
d to make sure that meta-arm remains a generic software layer (no machine, =
no distro) so that it can easilt be consumed, so arguably we might not even=
 need meta-arm-toolchain neither...=C2=A0</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
[1] <a href=3D"https://git.linaro.org/openembedded/meta-linaro.git/tree/" r=
el=3D"noreferrer" target=3D"_blank">https://git.linaro.org/openembedded/met=
a-linaro.git/tree/</a><br>
<br>
-- <br>
Denys<br>
</blockquote></div></div>

--000000000000e0f354059d3abfe0--
