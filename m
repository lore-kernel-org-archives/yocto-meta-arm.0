Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.6070.1611900198695220977
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 22:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p4zhcyAj;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id a7so7748261qkb.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 Jan 2021 22:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v4NzJDtdf/TwU3DXVTHbLKm5uyDVoMMqbmrOqxKX3jc=;
        b=p4zhcyAjC+65dxqSZ1empuBnL9pa6CA20KDA1QDydqUvDdx3tnSD8m+N1YBS98V4bW
         RtHByizcXsa+MzBem1TmdnujrlcdPoaC5DRPxI7qBcvz538yHnTh2eW1r1BG7eN0xnVF
         bQRZ0l2g7qR1s5cMk7ab+MJyOrFvGTbzFJAZFPaBxfP/UWJmHO5TPZOS59b2yhYHEPEB
         PCBNyZiLxLBc/9l6/1ypV9p7Yk5YJDyOWCJJv+pDnXZ1RevU6lQxjbrHZfu7m5+4EXvd
         fLW2FHImwGTi/Ph36KNHrFBRQEMoJeqmr858bqf32azlg3RucS/xZIfeM0gmiSTFRu8i
         ChXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v4NzJDtdf/TwU3DXVTHbLKm5uyDVoMMqbmrOqxKX3jc=;
        b=mKclpkUSsiGm5Sh06iTb3c1AgQ4qs1IelL24LhkjL5HSbNMEvm/3//Wd+JnNQPm3ot
         Veiap1zQCpMkMoVTHK8cMSusMkrhaLxirKpac08YKJOo2oObxZsuo0qE9qvCI6JQVCeS
         et4IUj5lTDMHSzeEtKuXLSeBodH9BGVke6yO55DvDDFYfxzsADPHInaOplrPl9ZTxeg+
         kXMbV/veGE3DxKApf7d1iTqS5ddIw1rSnnQYpiQ2rgBUD4fpiiI7eFNkhjGeZ8SG97oN
         9xVRkRgayEiUHZBDdv2o50C+Tqj0V+tP8+lzpJi4+HYbWuanpYFB7u4RqtcCWGxyMEc3
         K5yQ==
X-Gm-Message-State: AOAM5326Bk4fIWIz737Kt0Z70djJBniyxJ+EjI6y2XzpHKsV5rwHIwQc
	f5qNvzJgP0seUf1g9EkafY/I3Sp18wlJxh4RisU=
X-Google-Smtp-Source: ABdhPJxkenlCzfj8HjupPubWnTL1/yjdIp2zay75FlZRyCOVJB+9TwU2FtcNdvPiUWajFjJYDSXz8BQZz1gIOR9Ccew=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr2736477qke.474.1611900197783;
 Thu, 28 Jan 2021 22:03:17 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sox8e6OgAYwzPSinah7kk6YcYbn6HRUZFgd_H5C27Ss=A@mail.gmail.com>
 <CAFA6WYM8oqCJHruVB2eco5y6VddY7nq_P6HyKQVdOEJteXjKzw@mail.gmail.com>
In-Reply-To: <CAFA6WYM8oqCJHruVB2eco5y6VddY7nq_P6HyKQVdOEJteXjKzw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 28 Jan 2021 22:03:07 -0800
Message-ID: <CAMKF1srYuxGAqyHOQ62FhGxAD5Dkp44SY6X3zFK-Bwtb370-Gg@mail.gmail.com>
Subject: Re: [meta-arm] preferred version arm-8.3 of gcc-cross-aarch64 not available
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Cliff Brake <cbrake@bec-systems.com>, Jon Mason <Jon.Mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b3ce7c05ba03c284"

--000000000000b3ce7c05ba03c284
Content-Type: text/plain; charset="UTF-8"

There are no changes in distro wrt this variable for ages but it does
update the layers as you might see in that pull request

On Thu, Jan 28, 2021 at 9:38 PM Sumit Garg <sumit.garg@linaro.org> wrote:

> Hi Khem,
>
> Support for arm-8.3 was recently removed [1] from meta-arm master
> branch and it only supports arm-9.2 and arm-10.2 releases. It looks
> like your distro has configured the preferred version of GCC as
> arm-8.3 but it isn't able to find it. Could you check the value of
> "GCCVERSION" variable?
>
> [1]
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=a56011bf30c86a86c4feb57827030516c37f65ed
>
> Regards,
> Sumit
>
> On Fri, 29 Jan 2021 at 00:14, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi All
> >
> > We have started seeing this error. It seems related to meta-arm. We do
> not want
> > gcc from meta-arm but it it still trying to creep in. Please help out.
> >
> >
> > https://github.com/YoeDistro/yoe-distro/pull/518#issuecomment-769242387
> >
> > Thanks
> > -Khem
> >
> > 
> >
>

--000000000000b3ce7c05ba03c284
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There are no changes in distro wrt this variable for ages=
 but it does update the layers as you might see in that pull request=C2=A0<=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Jan 28, 2021 at 9:38 PM Sumit Garg &lt;<a href=3D"mailto:sumit.=
garg@linaro.org">sumit.garg@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">Hi Khem,<br>
<br>
Support for arm-8.3 was recently removed [1] from meta-arm master<br>
branch and it only supports arm-9.2 and arm-10.2 releases. It looks<br>
like your distro has configured the preferred version of GCC as<br>
arm-8.3 but it isn&#39;t able to find it. Could you check the value of<br>
&quot;GCCVERSION&quot; variable?<br>
<br>
[1] <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/=
?id=3Da56011bf30c86a86c4feb57827030516c37f65ed" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=
=
=3Da56011bf30c86a86c4feb57827030516c37f65ed</a><br>
<br>
Regards,<br>
Sumit<br>
<br>
On Fri, 29 Jan 2021 at 00:14, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi All<br>
&gt;<br>
&gt; We have started seeing this error. It seems related to meta-arm. We d=
o not want<br>
&gt; gcc from meta-arm but it it still trying to creep in. Please help out=
.<br>
&gt;<br>
&gt;<br>
&gt; <a href=3D"https://github.com/YoeDistro/yoe-distro/pull/518#issuecomm=
ent-769242387" rel=3D"noreferrer" target=3D"_blank">https://github.com/YoeD=
istro/yoe-distro/pull/518#issuecomment-769242387</a><br>
&gt;<br>
&gt; Thanks<br>
&gt; -Khem<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000b3ce7c05ba03c284--
