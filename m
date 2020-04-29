Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.599.1588152729453278721
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 02:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s/p1Kd0L;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id d197so922816ybh.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Apr 2020 02:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=gPPLS5gDGQ81zqx6rWqDF+bLqHU3iV4nZZmf9+UGUGY=;
        b=s/p1Kd0LNP2u7vUwlV+V1xBRvPxFHwyNb8UZ98otuhs7ZV29aLwtHLToCu4Q54SqKH
         x2Be6Jrk6Sza1Us+upiHRVz0X675rk+6bhrbHddXux6Il1Iq5ZPSYGv3nKQbBIGRaYCT
         tr4WCwpFIi5+wKr6ehqKXCnm39q2icS5R2SmJK3aZGD3LqQ1f6uPo6hJPThn5K8zvYkI
         vbJpeGyF8f3xP9+5NCMPb5NL1liW7VN9zDzV3c+z+kkjM87/CaUxVbDlkw4G5ogVaZ3z
         1wDX+/SJikeffHIjRAuVO/PLoKyGkRoBt7fXTvIoRjx9wBNt9qM1OX/f/O5wOu/NG9eF
         DawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=gPPLS5gDGQ81zqx6rWqDF+bLqHU3iV4nZZmf9+UGUGY=;
        b=YQxC7ejCZgcYqZw9L4gg7b7H/6iBJgtWOMCQD95xjHE5sz2lLZa9LrLcybz6W3ZecZ
         IK8Mu0UjGm9bspK2gtmI8cLmQMRAhhZSHt/08F9YUFilGGhW33HpfIcY7LxRI/fGs6X+
         uPQy/mq1uVNuPzKzsWcY4ro2c0YZrcC8HIELQyoo02IuZbilkVSY8op66dX2BdAFusyh
         yZMxLvIinxXOGirZzNx+EiroJgeQxhTpY+eZK6GSyWxCsnzj93Fc5fmCLET/P1zqdFbv
         U5VKSlhXEpfoqzXE3h097HAXacWas9MbMdEy8CbrBQV2exR4Nuy7f7vxWVrJqtAE4M2z
         PnGg==
X-Gm-Message-State: AGi0PuZnPcy/dGfZq/Qzi0u4t+hkTw7W7ljF8qkvZ065psNbK+TMyehx
	STTPBKhGEqYTyKrF7ol39uH8zF6OsRwuqpfHim6afLPQFL0=
X-Google-Smtp-Source: APiQypINFIc9Px8X40VZELKR1jV9oU7Vifnw3SNiVLQ5IsjsI+kCg1wVBirNm8pmodOzFTVv9GjGaVWmIufvt5Y28As=
X-Received: by 2002:a5b:48c:: with SMTP id n12mr53462744ybp.133.1588152728128;
 Wed, 29 Apr 2020 02:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200425225727.GL11927@denix.org>
In-Reply-To: <20200425225727.GL11927@denix.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 29 Apr 2020 11:31:57 +0200
Message-ID: <CAP71Wjy84MgZdC+j4WxysbH2wJuLrkBe1DNUFRxDAMwhknNtCQ@mail.gmail.com>
Subject: Re: [meta-arm] Couple questions about Dunfell
To: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000035a15b05a46a9fa7"

--00000000000035a15b05a46a9fa7
Content-Type: text/plain; charset="UTF-8"

hi,

On Sun, Apr 26, 2020 at 12:57 AM Denys Dmytriyenko <denis@denix.org> wrote:

> Hi, Jon,
>
> I had couple questions:
>
> 1. What is the time frame for branching off Dunfell?
>
> 2. What is the policy for backporting to Dunfell?
>

I am definitely interested in these questions, or rather in the answers to
these questions! Since dunfell is LTS, I would expect a dunfell branch to
be maintained in meta-arm.


>
> I've got several patches in the pipeline that I'm testing and wanted to
> know
> my options.
>
> Thanks.
>
> --
> Denys
> 
>

--00000000000035a15b05a46a9fa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 26, 2020 at 12:57 AM Denys=
 Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi, Jon,=
<br>
<br>
I had couple questions:<br>
<br>
1. What is the time frame for branching off Dunfell?<br>
<br>
2. What is the policy for backporting to Dunfell?<br></blockquote><div><br=
></div><div>I am definitely interested in these questions, or rather in the=
 answers to these questions! Since dunfell is LTS, I would expect a dunfell=
 branch to be maintained in meta-arm.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
I&#39;ve got several patches in the pipeline that I&#39;m testing and want=
ed to know <br>
my options.<br>
<br>
Thanks.<br>
<br>
-- <br>
Denys<br>
<br>
</blockquote></div></div>

--00000000000035a15b05a46a9fa7--
