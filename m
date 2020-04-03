Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.6864.1585903983912534443
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Apr 2020 01:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qNcdtCTj;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: peter.griffin@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id 19so6112819ljj.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 03 Apr 2020 01:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O9pNZi07ycXD52kIxkX0mcyz5kldv3aVotI11PlugVs=;
        b=qNcdtCTj+IeYmbw9VqKm7kD9pgYc+5blgS1AGWyWZhNTp868Gpjl+wRyB80seyOnzI
         uWxREWYz9pUKLiQs1SdkVJNOVOxjCc4CaE/d0/s9z0f/RW1PsUcjW+UqjYBCgrIMlIft
         EA2B9Z/N+dAg2uaCi+SDfvDw9QlEhxNmXW7PZWH9bZYRXKcxfn+YXSy9b/RxjttTxFNS
         vrA3n2ZQJO6mvjfpP7PRySEvp6V8HfkNLkrsXtA5dd6pc2UGmKqlOhXfsTLsICB4IH9U
         xjCH2xYWZ5B2JcorK8714Oeb4KOXlqv+sMLv9ETql0ztGYX3JJanoKn9+MppxWFaLBso
         Txww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O9pNZi07ycXD52kIxkX0mcyz5kldv3aVotI11PlugVs=;
        b=fHDUNQzRJFgT+py0z4Ru11sklWtRwe+k7cBy4IPbE2XzvAM4yWr7EOVv1w/Cj9Qq3t
         bcm7BI87fGOJlUk/usDsLV3dPCKG1RDe1rz3LsqKDt3i5lXxhhqDvHk1x4QIkqV9bH0T
         dbqhzXN+mbo0c3nP6/++UN7wLmRG1HAHnnVJGHxJ6GNXKt3YCko0UH25bRXHOg/qA7TE
         QPpqn8ZSqSFy/5YdQmnmDiNP/0p7T98nVUPo2f6HmHLHqXeOou9FTjHCPDdgN9aLspeg
         kbUxXY59kSP90kuGKB6gz8Kw8RHRn1h/1heQOMd1wG4Q4Vcn4L5xgPf7cltVxxG7l/+p
         wvVg==
X-Gm-Message-State: AGi0PuYxAcpmCCDOg7Nx5JubIjJoi3mSXoPutBj/+9kPoGT/2RGAr3mH
	UUyt9VT4fnSykcmiaQjDURnN1NJ6CPrlCH6T9JtR8p+K
X-Google-Smtp-Source: APiQypIcHkAttIPVLYcTR3OlLCC04k8n/ScCNoOIJA7uNDB574Ch7hR9u/cG6VV9OqIRg/QOrkXZIDoHAH+CeJAXJ48=
X-Received: by 2002:a05:651c:92:: with SMTP id 18mr3855500ljq.141.1585903981554;
 Fri, 03 Apr 2020 01:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-3-git-send-email-denis@denix.org> <CADrjBPoCAFgEJcZPrDJ2ND2E+2-s+m7oCzT37Rbe08QFekD=GA@mail.gmail.com>
 <20200402163030.GU1578@denix.org>
In-Reply-To: <20200402163030.GU1578@denix.org>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Fri, 3 Apr 2020 09:52:50 +0100
Message-ID: <CADrjBPoLwXdY26F8drDwRdOV56=SSSyVBAc0a=TLkAPcMSHhog@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/5] optee-client: upgrade 3.7.0 -> 3,8,0, cleanup
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="000000000000780b2005a25f0bbe"

--000000000000780b2005a25f0bbe
Content-Type: text/plain; charset="UTF-8"

Hi Denys

On Thu, 2 Apr 2020 at 17:30, Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Apr 02, 2020 at 11:01:17AM +0100, Peter Griffin wrote:
> > Hi Denys,
> >
> > On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > * Rename with _git suffix to match other optee recipes
> > > * Add DESCRIPTION
> > > * Use common HOMEPAGE
> > > * Use install command for header files instead of cp -a
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >
> >
> > Minor nit patch subject 3,8,0, should be 3.8.0. Apart from that
>
> Ah, indeed, thanks for noticing!
> Do you want v2 with this fixed?
>

May as well I suppose.

Peter.

--000000000000780b2005a25f0bbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Denys</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 2 Apr 2020 at 17:30, Denys Dmytriyenk=
o &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Apr 02, 202=
0 at 11:01:17AM +0100, Peter Griffin wrote:<br>
&gt; Hi Denys,<br>
&gt; <br>
&gt; On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko &lt;<a href=3D"mailto:d=
enis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; * Rename with _git suffix to match other optee recipes<br>
&gt; &gt; * Add DESCRIPTION<br>
&gt; &gt; * Use common HOMEPAGE<br>
&gt; &gt; * Use install command for header files instead of cp -a<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.c=
om" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; Minor nit patch subject 3,8,0, should be 3.8.0. Apart from that<br>
<br>
Ah, indeed, thanks for noticing!<br>
Do you want v2 with this fixed?<br></blockquote><div><br></div><div>May as =
well I suppose.</div><div><br></div><div>Peter.</div></div></div>

--000000000000780b2005a25f0bbe--
