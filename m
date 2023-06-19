Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430CFEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 17:28:35 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.13505.1687195713148950977
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 10:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KIaK7z+l;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-39ed35dfa91so991481b6e.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Jun 2023 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687195712; x=1689787712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGNm52hwEaGwTR3mFSvVtc3pbydMsCpZ1XtO3N1cTUQ=;
        b=KIaK7z+l38GmvaXcFFOT46ftrCkWLcUrCRdKRkw0bzB5TCUOkNIcsaVPhE2QEfhqs4
         Euc2ZIEWAlNQjP/8a1PBrKbnmyJ/+lmE6NC+eo4DJwgIo32B233W9PrUIe0ypZj6EXJ8
         1MfI6t/akaid5vj4Gy6+HkpPjTbJzdpJc/z7K2GWpJ2V3CX9h9nI4vsbg18JeGRfnqvH
         Hw9nfHAJUfFJc1U9bQR7EzSpdfNlQksKIU7fLo58pwwUFgAB0VTKud8X4jg8d7twxPuP
         RU7L8lVEwFRkTrs42eOqIb4sK99pInuoV4h8bySCjll8qdazI1u1yKZZj6itYsRQ0jje
         4flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687195712; x=1689787712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGNm52hwEaGwTR3mFSvVtc3pbydMsCpZ1XtO3N1cTUQ=;
        b=W81UbOawATbFGM/0kq38B9oZpOc6AwsK8fYqj2JlpotnyPB2eIDjeAxYnFhJQaUun9
         kWlXijR4EQMQCgtuE1JtfWboViNaqOJpsXa90MJaI8Ejg88wy3xvqiyVdi1616RHqQaP
         sMd3t+d9RbVKULnbT0T+y1JVfDwMtmfCPW3kNLFlKsS92xdmbWPWIaOXfP1aJiG9xLtf
         vwV7q+wrrx2kDBLPcflVAdQ4EgamwqKJfi1n5whx7o8e7n61E8l6oda3OI2GF+34rBlF
         D/rPdQEHnzIXEIcBNETYk6yrhvhVmEYve6QwJKot4TlFVyrK6x/JeBPef9WjWosSm2x9
         HC4Q==
X-Gm-Message-State: AC+VfDwmxA4NJ/KsPppCp0KB5Lcc2hv/Sr8tERHXug4dz+3HS+RDoz/C
	Rmy5W0LS2bg2weBDeCJBHiVGWaeFf9tPD21QIQs=
X-Google-Smtp-Source: ACHHUZ7QJ3pVWPlIZHXYwqjXL/j5+GxyR+e/Mp/m82LnNe8eT+61i86OSOJc3djw4lMBWvaAfu+qEqjsAg7Ie0uPrMU=
X-Received: by 2002:a05:6808:df4:b0:39a:be48:9e93 with SMTP id
 g52-20020a0568080df400b0039abe489e93mr7312710oic.42.1687195712287; Mon, 19
 Jun 2023 10:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230616181712.4168591-1-raj.khem@gmail.com> <20230616181712.4168591-2-raj.khem@gmail.com>
 <301A7EFA-1C6B-453D-B616-83274136E013@arm.com>
In-Reply-To: <301A7EFA-1C6B-453D-B616-83274136E013@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jun 2023 10:28:06 -0700
Message-ID: <CAMKF1so_X82k4x4+xkaj+yONbweMn49_xHumORb43wS_jFPSSQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] gn: Fix build with gcc13
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Jun 2023 17:28:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4806

On Mon, Jun 19, 2023 at 9:10=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> This breaks the build with gcc12.2 though:

easiest is to use GCC_MAJOR macro to make it version specific

>
> 2023-06-19 14:48:07 - INFO - | ../git/src/gn/desc_builder.cc: In member f=
unction =E2=80=98base::Value {anonymous}::BaseDescBuilder::ToBaseValue(cons=
t Scope*)=E2=80=99:
> 2023-06-19 14:48:07 - INFO - | ../git/src/gn/desc_builder.cc:180:12: erro=
r: use of deleted function =E2=80=98base::Value::Value(const base::Value&)=
=E2=80=99
> 2023-06-19 14:48:07 - INFO - | 180 | return res;
> 2023-06-19 14:48:07 - INFO - | | ^~~
> 2023-06-19 14:48:07 - INFO - | In file included from ../git/src/gn/comman=
ds.h:14,
> 2023-06-19 14:48:07 - INFO - | from ../git/src/gn/desc_builder.cc:10:
> 2023-06-19 14:48:07 - INFO - | ../git/src/base/values.h:367:3: note: decl=
ared here
> 2023-06-19 14:48:07 - INFO - | 367 | Value(const Value&) =3D delete;
> 2023-06-19 14:48:07 - INFO - | | ^~~~~
> 2023-06-19 14:48:07 - INFO - | ../git/src/gn/desc_builder.cc: In instanti=
ation of =E2=80=98base::Value {anonymous}::BaseDescBuilder::ToBaseValue(con=
st std::vector<T>&) [with T =3D Value]=E2=80=99:
> 2023-06-19 14:48:07 - INFO - | ../git/src/gn/desc_builder.cc:194:44: requ=
ired from here
> 2023-06-19 14:48:07 - INFO - | ../git/src/gn/desc_builder.cc:171:12: erro=
r: use of deleted function =E2=80=98base::Value::Value(const base::Value&)=
=E2=80=99
> 2023-06-19 14:48:07 - INFO - | 171 | return res;
> 2023-06-19 14:48:07 - INFO - | | ^~~
> 2023-06-19 14:48:07 - INFO - | In file included from ../git/src/gn/comman=
ds.h:14,
> 2023-06-19 14:48:07 - INFO - | from ../git/src/gn/desc_builder.cc:10:
> 2023-06-19 14:48:07 - INFO - | ../git/src/base/values.h:367:3: note: decl=
ared here
> 2023-06-19 14:48:07 - INFO - | 367 | Value(const Value&) =3D delete;
> 2023-06-19 14:48:07 - INFO - | | ^~~~~
>
> Is there a solution which works for both?
>
> Ross
>
> > On 16 Jun 2023, at 19:17, Khem Raj via lists.yoctoproject.org <raj.khem=
=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > ...Remove-redundant-move-in-return-stat.patch | 43 +++++++++++++++++++
> > meta-arm/recipes-devtools/gn/gn_git.bb        |  1 +
> > 2 files changed, 44 insertions(+)
> > create mode 100644 meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc=
-Remove-redundant-move-in-return-stat.patch
> >
> > diff --git a/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remov=
e-redundant-move-in-return-stat.patch b/meta-arm/recipes-devtools/gn/gn/000=
1-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
> > new file mode 100644
> > index 00000000..f712037a
> > --- /dev/null
> > +++ b/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redun=
dant-move-in-return-stat.patch
> > @@ -0,0 +1,43 @@
> > +From 45673f4f62eb063d6d5aa0ad68a6171936ad9347 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 24 Jan 2023 00:13:57 -0800
> > +Subject: [PATCH] desc_builder.cc: Remove redundant move in return stat=
ement
> > +
> > +Fixes build with gcc13
> > +
> > +../git/src/gn/desc_builder.cc: In member function 'base::Value {anonym=
ous}::BaseDescBuilder::ToBaseValue(const Scope*)':
> > +../git/src/gn/desc_builder.cc:179:21: error: redundant move in return =
statement [-Werror=3Dredundant-move]
> > +  179 |     return std::move(res);
> > +      |            ~~~~~~~~~^~~~~
> > +
> > +Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/=
15000]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/gn/desc_builder.cc | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/gn/desc_builder.cc b/src/gn/desc_builder.cc
> > +index 444a5e02..3ef170c3 100644
> > +--- a/src/gn/desc_builder.cc
> > ++++ b/src/gn/desc_builder.cc
> > +@@ -167,7 +167,7 @@ class BaseDescBuilder {
> > +     base::ListValue res;
> > +     for (const auto& v : vector)
> > +       res.GetList().emplace_back(ToBaseValue(v));
> > +-    return std::move(res);
> > ++    return res;
> > +   }
> > +
> > +   base::Value ToBaseValue(const Scope* scope) {
> > +@@ -176,7 +176,7 @@ class BaseDescBuilder {
> > +     scope->GetCurrentScopeValues(&map);
> > +     for (const auto& v : map)
> > +       res.SetKey(v.first, ToBaseValue(v.second));
> > +-    return std::move(res);
> > ++    return res;
> > +   }
> > +
> > +   base::Value ToBaseValue(const Value& val) {
> > +--
> > +2.39.1
> > +
> > diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-=
devtools/gn/gn_git.bb
> > index 4e7fa9f7..44a7f3a6 100644
> > --- a/meta-arm/recipes-devtools/gn/gn_git.bb
> > +++ b/meta-arm/recipes-devtools/gn/gn_git.bb
> > @@ -5,6 +5,7 @@ LICENSE =3D "BSD-3-Clause"
> > LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837b=
b34d"
> >
> > SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmai=
n \
> > +           file://0001-desc_builder.cc-Remove-redundant-move-in-return=
-stat.patch \
> >            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
> > SRCREV =3D "4bd1a77e67958fb7f6739bd4542641646f264e5d"
> > PV =3D "0+git${SRCPV}"
> > --
> > 2.41.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#4803): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/4803
> > Mute This Topic: https://lists.yoctoproject.org/mt/99576553/6875888
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross.burt=
on@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

