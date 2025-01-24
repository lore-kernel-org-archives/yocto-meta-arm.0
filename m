Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3578AC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 05:51:50 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.5561.1737697908036097541
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 21:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hzZpKzYV;
 spf=pass (domain: linaro.org, ip: 209.85.221.171, mailfrom: sumit.garg@linaro.org)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-518799f2828so863168e0c.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Jan 2025 21:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737697907; x=1738302707; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5SwQhaNYQ+zmWR4XA2h4lu6pZ5kjfAseWC6W/0dc+s=;
        b=hzZpKzYVNDbO6GmqC3R5URJw1s5yWWkdxwYtO4pxwtXPEDUHlb75iTt33H8AxpSqD9
         zkJTTRnGYb7v/rhKt2KRidhM+zz3zXB07i9dZ9hGSS+A0EZQJ2qbHJ50DzUQEsELK68s
         5EViF975V3kum1nL4Ujd9Hj3yfPm7kk91HWlXSsR2M6qWHnJpMi1V/QkLlLurTriEZts
         T5HZovqbGIOiOMMbwoLPKKq23voiWz4Qm+lbwv48AXcdCbonhEGJBB/3B6N2+bp/Wjya
         ogrIGlD4Oo2aS7Ut0U6ye1BzLTfnBFdv3e9rl8ixCCdO6CjG56gFdFiiZQcJyQq3rIqV
         EYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737697907; x=1738302707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5SwQhaNYQ+zmWR4XA2h4lu6pZ5kjfAseWC6W/0dc+s=;
        b=wjUQwzFHIFVjzEJfQlNm6tDkoZAIsyXvgnIi6rAPqQCEKTV0QTrhUG9BxdvAfIyho4
         pd1lXNDf+t537ig7awsU0Ojpb8p+uQnyuPSaRZZ3jBumK472zRZvqHSw6XKWphst8G2R
         IYsKgtxZqyNW800M/CvBcgeUpbfOCuemj5d8De0SBuWOjCkfqJonZ8sjmw1lqdtGL28R
         W/zgJnqBAvnp3PWdu8RoF84xk2KYlJ3DiKjPDj9ytgSvJkXmJOupvCjSpBnPbpmVH/fb
         TDVQFGPom3CyEsEyABTNRVoDrEAF+P8hovdG7toluVYLdk3beZPSFaqzd2u6VLNdnrZ1
         GKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyiqBORiq3BiXwkeCVJuHF2+wWrLSvrz+0Ss2h65HZMZscu6i4IY5wDz4W2CxCphi9CPNkREdzAQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzWNHh3q+Wf/eQq0coqLYpwlRk2xqoKsSw0lOn+LbHk1MyT7XDs
	Xrojx2kCG1NHC/RGGeSW+aDFYECHGo+TR05tnYq2RYMO7pkIIakpEpX3Mk7K8RbQ6CJwt5NI0d0
	HJXi3B9+eHS4f/rwFGZM2Ks+iF7iuoSHy/XlMmA==
X-Gm-Gg: ASbGncvugGnMmCCNxHfp3eOgYxZn0uIwcpCjngL4pCbtdqJD4zkoUj5sP38j4jF7QLW
	UwXCQHe/t7Cc5UF8LK3IEUYEhqDmXeTfYVP1aulZo+i+OAgKWTEuDaCYJVVT6rwYf
X-Google-Smtp-Source: AGHT+IEHfCMwNzTr2goOdbmqH8AH9VSoU1t1HMka50eXUcGXXvih5IP+VaqfxjqPseClmQllSUJ7gmUiTLmO1Kw+938=
X-Received: by 2002:a05:6122:2028:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-51e4fb68a06mr2223428e0c.2.1737697906983; Thu, 23 Jan 2025
 21:51:46 -0800 (PST)
MIME-Version: 1.0
References: <31F864D4-FAF7-4B00-BFAE-B00CB237EBE0@arm.com> <20250123200026.GW21836@denix.org>
 <AEF7EB1B-00CA-4038-B625-CC3EF0A6B681@arm.com>
In-Reply-To: <AEF7EB1B-00CA-4038-B625-CC3EF0A6B681@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 24 Jan 2025 11:21:36 +0530
X-Gm-Features: AWEUYZmp6vIY6Lp0chd8FvlVQ2WBMR8KB-ICYELNuSZGyWb0xetji_psL4NLCZc
Message-ID: <CAFA6WYN7_h+4nF7gGgDdcgm=AQHK_PW2saYX1TrUEdHBDtTP3A@mail.gmail.com>
Subject: Re: [meta-arm] Removal of external-arm-toolchain?
To: Ross Burton <Ross.Burton@arm.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2025 05:51:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6346

Hi Ross,

On Fri, 24 Jan 2025 at 01:48, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 23 Jan 2025, at 20:00, Denys Dmytriyenko <denis@denix.org> wrote:
> > That said, it appears there are some other users of external toolchain =
- there
> > was a person from Smile recently fixing some issues with usrmerge suppo=
rt. And
> > I just received a personal email from one of our customers inquiring ab=
out it
> > as well. In other words - there are other interested parties out there.=
..
>
> At the time I asked Smile what their usecase was but I=E2=80=99ve forgott=
en already.  I=E2=80=99ll reach out again.
>
> >> Also this is a prime use case for sstate, in particular the
> >> public yocto state server which can be used to fetch all the native to=
ols,
> >> not just the compiler.
> >
> > This is probably a topic for another thread, but there are some issues =
with
> > using sstate like that - public yocto sstate server is very slow and ju=
st
> > checking what is available takes a very long time, plus cross toolchain=
 is not
> > a native package and from my experience re-use is quite low in other di=
stros.
>
> Try again if you haven=E2=80=99t recently: it has sped up a lot and I hav=
e a weekly cron job to verify that I can build packages using public sstate=
 for the toolchain.
>
> >> So, would anyone seriously object if I sent a patch to remove the
> >> external-arm-toolchain recipe? This would only be for master, we would=
n=E2=80=99t
> >> retroactively remove it from the stable branches.
> >
> > As one of the meta-arm-toolchain co-maintainers[1], I would not object =
to
> > removing external-arm-toolchain support (the Linux side) from the layer=
.
>
> Thank you for being explicit.  Copying in Sumit to get his feedback.

I don't have any objections here. Without any real world use-case
scenarios now for using pre-built toolchain, it's hard to justify the
maintenance burden it comes with.

-Sumit

