Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C99C19F2A
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 21:17:26 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.7331.1659215837416298026
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 14:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JpVXEDYE;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id u12so5650500qtk.0
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 14:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zjwPwYrZiAEDTmiiJ6xUIx71sua7OOdLxdRKwmIOC8Y=;
        b=JpVXEDYEO03zXFKhAl0tPphIOMckZ0uXYbC5mekzo+yH28hSa2kxnb8MZFYpo3CmQD
         FTT2UBBzqAGYRWp/PZshLqBEU/8L6n664RmJJ5SnXxmSWEMvVcqm/3UxnoSXIKec6OMH
         k7FeSBfjGkrFcmMxgLksvioSQFcmtTV8U8Tz1YzI5D9qYbfQA80ZGR22aMAruOYT8QVf
         KWAgeBp430aQwjwHBnNiSGG69FNbkyPat6jTVGLaEliHNJVcWceZgLw7E73sMQLUeT+f
         tm4Sel9iaTDz4aEa/U/VhOTE8/yxnSbd6VJf5C9fLXwmrdOOP/RbTpkkOQAgZO7ofMEd
         m+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjwPwYrZiAEDTmiiJ6xUIx71sua7OOdLxdRKwmIOC8Y=;
        b=cK6JsL1B94U3Fi8ar6AyZZniiHX9wyFyLhllECfs21IeADOLhkW9lNl4L1AWnIsiyf
         nsy6+qkM8jPaQAuL638tdq16QBDvy3XCpr5AqYIcCBJv3aVpr36cUaPNf1kAfB3Y3MPf
         UMIqvRL8qYGXq4trzlsucUQzpPT1ekpAMybk1xXthrtLKuPDCK4mMLqkiTtzAxFc0jyP
         Y0AmrnnImP2MJUAnwQ2ld03uC+kQqsIanVjrjRuNcybAz/TMApIFFYSYVsBK/QIK1RcW
         /r+M3OtSYohGcWTUljFOD2j21zwdcriHG5vsFGuAP1PvpnnZb58zStIwTMrpynuCmSRK
         aODg==
X-Gm-Message-State: AJIora/KYZ154lCTJxjYXRl7RhUslu1ybv1QfamfRe8A1SFzRA6I1dOM
	yCnTmKwjlC6bw7oqFlKoVp6igTzta9/GycVgL5U=
X-Google-Smtp-Source: 
 AGRyM1upKeRt5NCYravE5xHzblCcIJyhEhZluNrstk3HH84Z5ZushtkvPsu0J0fTr3FoVNBFHGwtNHOEMjZXe4iccpM=
X-Received: by 2002:a05:622a:386:b0:31f:b1c:5017 with SMTP id
 j6-20020a05622a038600b0031f0b1c5017mr8464352qtx.532.1659215836316; Sat, 30
 Jul 2022 14:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220730162741.3624780-1-raj.khem@gmail.com>
 <FD014B7F-1381-4AAE-8C7D-872CB144D96D@arm.com>
In-Reply-To: <FD014B7F-1381-4AAE-8C7D-872CB144D96D@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Jul 2022 17:17:05 -0400
Message-ID: 
 <CAMKF1srp1H9FmEfAH6_wGVzmr4Yz-BLAfL=oJ4Z07Hcpy3Rhtg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] optee-test: Use system openssl on musl
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000087876105e50c4aaa"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 30 Jul 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3624

--00000000000087876105e50c4aaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 30, 2022 at 3:30 PM Ross Burton <Ross.Burton@arm.com> wrote:

>
>
> > On 30 Jul 2022, at 17:27, Khem Raj via lists.yoctoproject.org <raj.khem=
=3D
> gmail.com@lists.yoctoproject.org> wrote:
> >
> > bundled libcrypto.a in optee-test sources is built using glibc based
> > toolchain and expects foritied _chk version of the libc functions e.g.
> __sprintf_chk
> > which wont work for musl. Therefore rely on freshly built openssl by OE
> > instead
>
> This sounds like something that should be done always, and not just on
> musl builds.


One would think so but that seems to be not the case there is a vendored
version on libcrypto.a and that=E2=80=99s the default I also opened an issu=
e
upstream to at least build the static archive such that=E2=80=99s it=E2=80=
=99s compatible
with musl and glibc see

https://github.com/OP-TEE/optee_test/issues/607

Also see this one for related comments

https://github.com/OP-TEE/optee_test/issues/599


>
> Ross

--00000000000087876105e50c4aaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jul 30, 2022 at 3:30 PM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)"><br>
<br>
&gt; On 30 Jul 2022, at 17:27, Khem Raj via <a href=3D"http://lists.yoctopr=
oject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=
=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; bundled libcrypto.a in optee-test sources is built using glibc based<b=
r>
&gt; toolchain and expects foritied _chk version of the libc functions e.g.=
 __sprintf_chk<br>
&gt; which wont work for musl. Therefore rely on freshly built openssl by O=
E<br>
&gt; instead<br>
<br>
This sounds like something that should be done always, and not just on musl=
 builds.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">One woul=
d think so but that seems to be not the case there is a vendored version on=
 libcrypto.a and that=E2=80=99s the default I also opened an issue upstream=
 to at least build the static archive such that=E2=80=99s it=E2=80=99s comp=
atible with musl and glibc see</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div><a href=3D"https://github.com/OP-TEE/optee_test/issues/607">htt=
ps://github.com/OP-TEE/optee_test/issues/607</a></div><br></div><div dir=3D=
"auto">Also see this one for related comments=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div><a href=3D"https://github.com/OP-TEE/optee=
_test/issues/599">https://github.com/OP-TEE/optee_test/issues/599</a></div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Ross</blockquote></div></div>

--00000000000087876105e50c4aaa--

