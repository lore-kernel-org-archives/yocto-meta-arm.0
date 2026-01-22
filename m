Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1B6D3EE9F
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:23:01 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42888.1769102575151877997
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 09:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FV2bl2l9;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79419542b12so7724347b3.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Jan 2026 09:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769102574; cv=none;
        d=google.com; s=arc-20240605;
        b=cH8ZBYjFesPGlqLJ0JmZY183tLTfGtmLAtwsPu6FbvCmg3vUpJxfWHRqyS7A799+IK
         JVr4GCYGIvJPycp4fUAmZhEiUIMYzJH/K6DAWWAldof6OWFCPl2iQXX+t/T5RcwXP9vY
         b6bex2Vr+z/0Dy6qfM30p3ppFhBLqynHySy4Sj29PDu7agrxV6OeUtHeu9ED/6XfB3Zo
         ZdfrFi0hz4Y7rWyKQ46HmYY9dMB3GKg1h0i7QBLuMo+vzg6wMPGqmdHHnF4J9HTOjp+m
         hcfb6vPa3IHSI3yMPcQIk/A+8tJREvTYvXR9F3345++c+kzVz7Lk0QpYD+Th8FpR9mMr
         RkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uJmqXdYQWmtaLRpbMuu3UkxKfzz9ZFuIfqzuIxJZKC4=;
        fh=BX4crRZYUF3JyVEi+MVqn8sBLYdHsoMVl2dBQBkutA8=;
        b=WLPQ7VV1cWgYefAkHk1c7JfLoNf3rPL94rn7xrx0ZlNlJ3kt9UU3SM4/q8ddNGxLnf
         nl4d1yFdmKlo8JIwXxjVZamVITtfqOguZrXp4ucyWZH6XfvcGn9Kzn30HLSFxLWVDJqn
         jk51b/Mk62CBOmNjamO7GoBbA1npl+WbGDiqlv814apZTqJbyMVe8t9QAwB5G0QMary/
         LdTf9L5NvyOfLHQvieKIlhaM1oHyc5pLFoCRMXNADqvhbRC0v/CoMhgNK94Wv8H+VsAq
         PCMALS63b/grq8oq1GvI3qj9eZ2+Ne9BgizZRCsf2isbxD094V/gcc2xSF2YIetNfWlE
         dCEg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769102574; x=1769707374; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uJmqXdYQWmtaLRpbMuu3UkxKfzz9ZFuIfqzuIxJZKC4=;
        b=FV2bl2l9vP+ZMW5WOre2IRTD4PPmEkjjzhT+65rWDdSfGsDbNzX/BSHF+yd9ChDaoI
         3xsp5jHJLlGaJRN4i3d6ce7YD53CwrdxYI9BRyrG1nyhet99yCAVRNt96jOQJZdp0wpu
         n/n+tbJWJDQe0fGKilP44elYcCBpsftwL2dCIMnPm5iSKBS7Z0gpXoU3NvsU7wjrdmu7
         SqUzKCiNEbo66TyNvIGs6mnr14cCgommRiUE47b/0hCssmUQ1WS4uTx12NUa8C3OfmXr
         6VVuwNyj0SHwQJy6MJByY+UcDJ4FZKh+qOV3fZHxsKo9zkWUigwK10dUYvIqpclJGb3F
         G8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769102574; x=1769707374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJmqXdYQWmtaLRpbMuu3UkxKfzz9ZFuIfqzuIxJZKC4=;
        b=GgketV7rMtQGXmiNDnl1w1bTvjZZaTkNh9RvxxqSgYmd0o1QixlrN85UIqGMh2d/7H
         6YZwHss7Oeqj0ml2r2FQJqpOgCKaOKISoxRbbMw2+uIW6bcBg68kPjha/LTmnfioXD0b
         j1Bxik0ZgT79OM9paA/v9l4N/eTisEGl+QgaslD2CEP9XuCGIKXToiDG3ekIL3R+zHJ6
         Pc70stI8Yjm1rbDRZUYFfOtTAwS6m7a9s23E6LSyDJjJ1cX4QBHVpUY/wZD+8BkDOPHX
         56C0iUfx3J3swz9VUOK/N+vf3XYGfJbUmqSfu0UDO6hjhWO1QCSzd5OSRdsNa6/Lgrhw
         WiDw==
X-Forwarded-Encrypted: i=1; AJvYcCUqiAIX4hgSy3q5APE/tE72VazNGx6RqlOhjlsUgY7jvZKsS7BvqsHHRXOmYM1gKSi+YiNxvcHtoQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxc8E5EQ4Jwmiqb6Hzz5e8o1WJJhKZHZO/ynWw4cXRvwzOYRgyV
	RbjPlQBNwlqhk+EY0KtXK1pYbHCouMh/cGtlqOjTblt5x2wGsDF+Pv02wr5IqHx6JM9DePN6BoH
	gNO/szlrt785RLH3gHsMDpcheX75ohGY=
X-Gm-Gg: AZuq6aLgA5v5zVwo0H6t5ye0xf/L44SVyI8v8aS/bOcyU0lc2f5nwR82/lvZ9fdZFAS
	bPAc55iueEejZKooDsK62fwIvTqYe9KQtAHt8/QUYeorEScdqzzFdyzcNpwhqJZQa3G+JQQ4Fkx
	6rvOSLA0HQQiHjr6NczULWzN/xbRPg3SSVHyyF30vMVmIQFpZPa4OfGwg3bM/cAM/uob5tYsYjw
	2zyW0KDyX95/9JqsU71QZUldJm88mxO0iT37IGJCMG2jY+p2UOC/8NQKTmL41A7JyevKwrqkzIq
	X/5n0K+YC8M6VEtJP5Gg7NJ6e0ursKm9OmlAkNQE2yajIQGmqgO1qzY0riRG6RARhbmRCdoZsTN
	gTsFM7FhQtD23eBD3vdfxZPzgc59QQcbYtM7bERkcr1bwAQ==
X-Received: by 2002:a05:690c:4c0f:b0:793:8ce1:6596 with SMTP id
 00721157ae682-79439a838ccmr2344707b3.64.1769102574120; Thu, 22 Jan 2026
 09:22:54 -0800 (PST)
MIME-Version: 1.0
References: <92b1fbe3da82c19ed2ca7a617077f6055a74f7e3.camel@bootlin.com> <6C7BC2F4-364D-41C1-87CB-755547FE281E@arm.com>
In-Reply-To: <6C7BC2F4-364D-41C1-87CB-755547FE281E@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jan 2026 09:22:27 -0800
X-Gm-Features: AZwV_QiMhBfbzAC6c-PVotQBgz4HJE8iChE1OwVCCyypu2qpd4-sMz8XAVhAXb4
Message-ID: <CAMKF1sq=OEHMM97DiKsdBTnCdSCbsfzTLiADfyUb0=RbVBVYeA@mail.gmail.com>
Subject: Re: [yocto] [RFC] Moving OP-TEE support from meta-arm to oe-core
To: yocto@lists.yoctoproject.org, ross.burton@arm.com
Cc: "thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>, 
	"nylon.chen@sifive.com" <nylon.chen@sifive.com>, "peter.lin@sifive.com" <peter.lin@sifive.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000080717d0648fd4a61"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jan 2026 17:23:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6866

--00000000000080717d0648fd4a61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 9:05=E2=80=AFAM Ross Burton via lists.yoctoproject.=
org
<ross.burton=3Darm.com@lists.yoctoproject.org> wrote:

> On 22 Jan 2026, at 09:33, Thomas Perrot via lists.yoctoproject.org
> <thomas.perrot=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >
> > Hi,
> >
> > Currently, OP-TEE support is maintained in the meta-arm layer. However,
> > OP-TEE is now being adopted by non-ARM platforms as well, notably RISC-
> > V.
> >
> > Given this broader adoption, would it make sense to move the OP-TEE
> > recipes from meta-arm to oe-core?
> >
> > I'd like to hear the community's thoughts on this.
>
> Copying in the meta-arm list.
>
> My immediate thought on this is =E2=80=9Cwould the riscv machines actuall=
y use the
> same recipes=E2=80=9D or is there enough forking and vendor branches happ=
ening that
> whilst in theory everyone is using OP-TEE, they=E2=80=99re not all using =
the _same_
> optee.
>
> I=E2=80=99m not against moving genuinely shared recipes somewhere common,=
 but I do
> think verifying this will actually happen is important.
>
> meta-arm tends to have several versions of optee at once for good reason=
=E2=80=A6
> (currently one, but about to be two)
>
>
I think its a good idea, but Ross's point is good too. If optee is forked
for every architecture that can not be a good thing. However, if we can get
qemuarm64 and qemuriscv64 based machines use an upstream version reliably,
we might be able to even help upstream to keep things sane
atleast for emulated machine architecture, similar to u-boot.


> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> You automatically follow any topics you start or reply to.
> View/Reply Online (#66179):
> https://lists.yoctoproject.org/g/yocto/message/66179
> Mute This Topic: https://lists.yoctoproject.org/mt/117397331/1997914
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000080717d0648fd4a61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 22,=
 2026 at 9:05=E2=80=AFAM Ross Burton via <a href=3D"http://lists.yoctoproje=
ct.org">lists.yoctoproject.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.=
com@lists.yoctoproject.org">arm.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22 Jan 2026, a=
t 09:33, Thomas Perrot via <a href=3D"http://lists.yoctoproject.org" rel=3D=
"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;thomas.perrot=
=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.org" target=3D"_blank">=
bootlin.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; Currently, OP-TEE support is maintained in the meta-arm layer. However=
,<br>
&gt; OP-TEE is now being adopted by non-ARM platforms as well, notably RISC=
-<br>
&gt; V.<br>
&gt; <br>
&gt; Given this broader adoption, would it make sense to move the OP-TEE<br=
>
&gt; recipes from meta-arm to oe-core?<br>
&gt; <br>
&gt; I&#39;d like to hear the community&#39;s thoughts on this.<br>
<br>
Copying in the meta-arm list.<br>
<br>
My immediate thought on this is =E2=80=9Cwould the riscv machines actually =
use the same recipes=E2=80=9D or is there enough forking and vendor branche=
s happening that whilst in theory everyone is using OP-TEE, they=E2=80=99re=
 not all using the _same_ optee.<br>
<br>
I=E2=80=99m not against moving genuinely shared recipes somewhere common, b=
ut I do think verifying this will actually happen is important.<br>
<br>
meta-arm tends to have several versions of optee at once for good reason=E2=
=80=A6 (currently one, but about to be two)<br>
<br></blockquote><div><br></div><div>I think its=C2=A0a good idea, but Ross=
&#39;s point is good too. If optee is forked for every architecture that ca=
n not be a good thing. However, if we can get</div><div>qemuarm64 and qemur=
iscv64 based machines use an upstream version reliably, we might be able to=
 even help upstream to keep things sane</div><div>atleast for emulated=C2=
=A0machine=C2=A0architecture, similar to u-boot.</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
You automatically follow any topics you start or reply to.<br>
View/Reply Online (#66179): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/66179" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/66179</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117397331/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117397331/1997914</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000080717d0648fd4a61--

