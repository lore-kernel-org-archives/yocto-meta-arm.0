Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E90C77B7C
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 21:30:39 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.50.1682026233823809993
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 14:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rcxqsxIx;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: peron.clem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-74df41e2e61so64611685a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682026233; x=1684618233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdV9Yq5/Fw2f4CJUQKzvikaJAZpAHObJh02L45syCQI=;
        b=rcxqsxIxWzOjU8utmyklKjr0x7/XmDw4ehvUF1DXw+davgs+rSJivFDzxi653i4QMf
         9WKKQvTMXS98grHB4UNhqchxXcgtQHscH3gFmj7LV/Vaqs6zba13JcgqXsz4/OUYYonH
         93WgpEihVJMhozEZteViO+JIqsjmTYp4sWIciOI15+Dl0+xPgAaIe90mtO3/NI6ZtfMH
         BWxXZ2MeYHLlQcdQgehXCEHQxMuCacvuRKwdsH0WlQ6rxzEe6skM8z/iSd266113k5S/
         HgyMtO/QAjSaOyqh5M1KApwG0kh+UFHgb5cK/PWinQFdG4I+4QT0Ux8UpL6WBAHZceW5
         IMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682026233; x=1684618233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdV9Yq5/Fw2f4CJUQKzvikaJAZpAHObJh02L45syCQI=;
        b=bsTzKWtu7fwKfGbysBsCNGUaCazc6cDViyO+IEPuBNX7syhck4B+DFYcGfgfypObAq
         IWRRBVx27rC0mX+a2LV9hGL1SvWLkyekvy/qVTtO/eUOjVPHQL/Vi0Co1F1qRI4J9riJ
         CBbmgi7ameBNOReXAZfIgo5PLIEVRsWhAbfPe95geZH+a7NBslYSpYgd8doRJfqKIL87
         vU/94M4HEZs+uu1OxB1DtQWTlnmZIqDDSb0WdVrqZ3bD1XOSvTiNxD/nRcaUAJ2SM/4i
         3n5PjZL/APXkMsHY6MztrZXjYc3G6HJ0szcTBkl6uDmJ0mN7flwMv2F+SKlsfsq1hOd2
         g76A==
X-Gm-Message-State: AAQBX9drr4iH2EZTUnqBmoTJJeJA366158+rEiC0mtlBmrXAiHWdJznB
	aIQAeUIUCFxBG7Yb+UBOPPctHAa6MFFSBTc+FF0=
X-Google-Smtp-Source: AKy350ZOGa85MsevKK2xJ0vP9BeJ5qoXJAakoRLd5Wz9Gd1KZMZ8gj8NaNVFy48szENYqYqkJPDU5mxQVjA5nbd4WE4=
X-Received: by 2002:a05:622a:1a23:b0:3bd:140c:91ed with SMTP id
 f35-20020a05622a1a2300b003bd140c91edmr4563595qtb.52.1682026232606; Thu, 20
 Apr 2023 14:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230418163658.13032-1-peron.clem@gmail.com> <ZEF2vPTDHzWKV/7x@kudzu.us>
In-Reply-To: <ZEF2vPTDHzWKV/7x@kudzu.us>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 20 Apr 2023 23:30:21 +0200
Message-ID: <CAJiuCceXwVH=+81u+NWj3JWAkA8==PhnquSSo0SHqX6L1VR+7w@mail.gmail.com>
Subject: Re: [PATCH] gator-daemon: bump to 8.4.0
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 21:30:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4603

Hi Jon

Le jeu. 20 avr. 2023, 19:30, Jon Mason <jdmason@kudzu.us> a =C3=A9crit :
>
> On Tue, Apr 18, 2023 at 06:36:58PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Gator Daemon moved to CMake build system so update the recipe
> >
> > Remove Apache-2.0 license as mxml has been moved out of this package
> >
> > Drop patches that has been merged
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> This patch fails on all platforms with:
>
> ERROR: Nothing PROVIDES 'libmxml' (but /builds/jonmason00/meta-arm/work/b=
uild/../../meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb DEP=
ENDS on or otherwise requires it). Close matches:
>   libomxil
>   libxml2
>   libxpm
> ERROR: Required build target 'core-image-sato' has no buildable providers=
.
> Missing or unbuildable dependency chain was: ['core-image-sato', 'gator-d=
aemon', 'libmxml']
>
> Note: We're going to release mickledore in 1 week.  If you want this
> in that release, please get the v2 to me as soon as possible.

Ha yes, this is because libmxml is in meta-oe and not in oe-core.

Should I include a libmxml recipe inside meta-arm or add the meta-oe
layer dependency?

Not sure what's best both are not very satisfying :/

Thanks,
Clement

>
> Thanks,
> Jon
>
> > ---
> >  .../0001-Include-missing-cstdint.patch        | 32 -------------------
> >  .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 ------------------
> >  ...-daemon_7.8.0.bb =3D> gator-daemon_8.4.0.bb} | 21 ++++--------
> >  3 files changed, 7 insertions(+), 77 deletions(-)
> >  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon=
/0001-Include-missing-cstdint.patch
> >  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon=
/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> >  rename meta-arm/recipes-devtools/gator-daemon/{gator-daemon_7.8.0.bb =
=3D> gator-daemon_8.4.0.bb} (51%)
> >
> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-I=
nclude-missing-cstdint.patch b/meta-arm/recipes-devtools/gator-daemon/gator=
-daemon/0001-Include-missing-cstdint.patch
> > deleted file mode 100644
> > index 294f804f..00000000
> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-=
missing-cstdint.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From 87745a6cad0f7819ac8f8d3826f5e228ebd843c5 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Thu, 2 Feb 2023 16:39:26 -0800
> > -Subject: [PATCH] Include missing <cstdint>
> > -
> > -gcc 13 moved some includes around and as a result <cstdint> is no
> > -longer transitively included [1]. Explicitly include it
> > -for uintXX_t.
> > -
> > -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> > -
> > -Upstream-Status: Submitted [https://github.com/ARM-software/gator/pull=
/40]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - daemon/xml/CurrentConfigXML.h | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/daemon/xml/CurrentConfigXML.h b/daemon/xml/CurrentConfigX=
ML.h
> > -index 0b239fd..d9047e3 100644
> > ---- a/daemon/xml/CurrentConfigXML.h
> > -+++ b/daemon/xml/CurrentConfigXML.h
> > -@@ -1,6 +1,7 @@
> > - /* Copyright (C) 2020-2021 by Arm Limited. All rights reserved. */
> > - #pragma once
> > -
> > -+#include <cstdint>
> > - #include <set>
> > - #include <string>
> > -
> > ---
> > -2.39.1
> > -
> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-d=
aemon-mxml-Define-_GNU_SOURCE.patch b/meta-arm/recipes-devtools/gator-daemo=
n/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> > deleted file mode 100644
> > index d2460434..00000000
> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-m=
xml-Define-_GNU_SOURCE.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From 04e2e924c3ab8da41343277746804dbcd7bf520d Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 13 Aug 2022 16:49:52 -0700
> > -Subject: [PATCH] daemon/mxml: Define _GNU_SOURCE
> > -
> > -This file uses vasprintf() which is defined only with _GNU_SOURCE
> > -feature macro is on.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - daemon/mxml/mxml-string.c | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/daemon/mxml/mxml-string.c b/daemon/mxml/mxml-string.c
> > -index 678aeb9..c9cd153 100644
> > ---- a/daemon/mxml/mxml-string.c
> > -+++ b/daemon/mxml/mxml-string.c
> > -@@ -13,6 +13,8 @@
> > -  * Include necessary headers...
> > -  */
> > -
> > -+#define _GNU_SOURCE
> > -+
> > - #include "config.h"
> > -
> > -
> > ---
> > -2.37.2
> > -
> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.=
bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> > similarity index 51%
> > rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.b=
b
> > rename to meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> > index 6188b07e..586b3ce8 100644
> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> > @@ -8,28 +8,21 @@ HOMEPAGE =3D "https://github.com/ARM-software/gator"
> >  # configuration requirement specified here:
> >  # https://github.com/ARM-software/gator#kernel-configuration
> >
> > -LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> > +LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
> >                      file://libsensors/COPYING.LGPL;md5=3D4fbd65380cdd2=
55951079008b364516c \
> > -                    file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd8986=
968f4327 \
> >                      file://k/perf_event.h;endline=3D14;md5=3De548bf30a=
60b2ed11ef2dcf7bfdac230 \
> >                     "
> >
> > -SRCREV =3D "6a944e7ee1f1c3ab9b2a57efd24c58503122db02"
> > -SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;b=
ranch=3Dmain;protocol=3Dhttps \
> > -           file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;striplevel=
=3D2 \
> > -           file://0001-Include-missing-cstdint.patch;striplevel=3D2 \
> > -          "
> > +SRCREV =3D "75662ba2dc2e1c7a17cff640a35629dca99c5b79"
> > +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;b=
ranch=3Dmain;protocol=3Dhttps"
> >
> >  S =3D "${WORKDIR}/git/daemon"
> >
> > +DEPENDS =3D "boost libmxml pkgconfig-native protobuf protobuf-native"
> > +
> >  COMPATIBLE_HOST =3D "aarch64.*-linux"
> >
> > -EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOU=
RCE -DETCDIR=3D\"${sysconfdir}\"' \
> > -                'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPIL=
E=3D${TARGET_PREFIX}' \
> > -                'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' C=
C=3D'${CC}' CXX=3D'${CXX}' V=3D1"
> > +inherit cmake
> >
> > -do_install() {
> > -        install -d ${D}${sbindir}
> > -        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> > -}
> > +EXTRA_OECMAKE +=3D "-DENABLE_VCPKG=3DOFF -DGATOR_INSTALL_PREFIX=3D./bi=
n"
> > --
> > 2.39.2 (Apple Git-143)
> >
> >

