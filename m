Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5929C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 09:03:00 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.7357.1682067777053742375
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 02:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hgUDWh8O;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3ef38bea86aso8896401cf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682067776; x=1684659776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ok0jHrBdyBYyjrqavOMN/VKt8LqfWpYy4AdVyVrcXE=;
        b=hgUDWh8O7D9Tii31fOl8pQS83ypIn4TRI4t4DP19PFX8SRWPsxFNMyUx7sqMpNsJj3
         Ub3Utx8C+08u/vHh80OrIYJMLmis5pgMXVxRzPVrVUgbRTjYe3ZuVd89uy8oJsYZscMT
         IFrzaADjhZecnHh+RL78ob9Fo7r6o3vCCwfuuSmS5cTLuckIWc/lPKN+E2eopncEcY1H
         rzsqbhBuYLg0ETK0JySihkod6CIw0tF11/A2ZCFgpM27yMnWcx1NNaUSz36z464wJeBY
         bJekOmskDElBzGufBN5wqXzYEZP/nUWcEX30cVHzbjHq19zuP9nVVRL293VNvpTFdHPJ
         q/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682067776; x=1684659776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ok0jHrBdyBYyjrqavOMN/VKt8LqfWpYy4AdVyVrcXE=;
        b=Gwrkfj+4oac/2Yav1pzTdzuLEH5DmdAC2F0XnEFxVJbYNjixWgLs4z+QvESHqE3XCw
         e86/ZAAlAixD16EVjRYiB4VAndi9niusmy5hoypiDfoLZbsJliTGeBYJ9V8Ov5ZqN17Y
         o3m3hfAz3lLaQBKscAXzJPr+KEqikjqrwacZI+PoQ/VMn4vjua6JMMgwA9NFoESD3N4g
         8j5aeUt3S0YYpk9+W9zpeRMNbzMG/jSCIZQR+PyiCIOrfom91h5K9KKshyFOzyJGNd7c
         nSsSLr4cGwF9gOIK+RyskBT1kBYazutPK+DgopGRV9A3kem0Ed/FQ9aygl/iwTQlt3fZ
         nONw==
X-Gm-Message-State: AAQBX9dvklOXNMgheiDGvnznX8s4hEslwjmbxtK6nUq+HHBGNV3C1zI/
	6jXi+GpDIcKT9LVJ8Si7Xd5lXmQeaBkcv7rrR3w=
X-Google-Smtp-Source: AKy350aTP0f2Y8rTW9itKJStZVfFTOdtSyGGFMco9Lx0FmqEz57KESnI61mGGt8AT0Jp+pHxiZwAgvRTfKJuvUqGiHo=
X-Received: by 2002:ac8:5bd5:0:b0:3ef:5221:5710 with SMTP id
 b21-20020ac85bd5000000b003ef52215710mr7052227qtb.47.1682067775860; Fri, 21
 Apr 2023 02:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230418163658.13032-1-peron.clem@gmail.com> <ZEF2vPTDHzWKV/7x@kudzu.us>
 <CAJiuCceXwVH=+81u+NWj3JWAkA8==PhnquSSo0SHqX6L1VR+7w@mail.gmail.com> <20230420215739.GZ9226@denix.org>
In-Reply-To: <20230420215739.GZ9226@denix.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 21 Apr 2023 11:02:44 +0200
Message-ID: <CAJiuCcf5y6qJRvthJAzDKoF8P+GP_W0a5_qu3WXW8Sq964FD1g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator-daemon: bump to 8.4.0
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 09:03:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4605

Hi Denys,

On Thu, 20 Apr 2023 at 23:58, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Apr 20, 2023 at 11:30:21PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Jon
> >
> > Le jeu. 20 avr. 2023, 19:30, Jon Mason <jdmason@kudzu.us> a =C3=A9crit =
:
> > >
> > > On Tue, Apr 18, 2023 at 06:36:58PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > Gator Daemon moved to CMake build system so update the recipe
> > > >
> > > > Remove Apache-2.0 license as mxml has been moved out of this packag=
e
> > > >
> > > > Drop patches that has been merged
> > > >
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > >
> > > This patch fails on all platforms with:
> > >
> > > ERROR: Nothing PROVIDES 'libmxml' (but /builds/jonmason00/meta-arm/wo=
rk/build/../../meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb=
 DEPENDS on or otherwise requires it). Close matches:
> > >   libomxil
> > >   libxml2
> > >   libxpm
> > > ERROR: Required build target 'core-image-sato' has no buildable provi=
ders.
> > > Missing or unbuildable dependency chain was: ['core-image-sato', 'gat=
or-daemon', 'libmxml']
> > >
> > > Note: We're going to release mickledore in 1 week.  If you want this
> > > in that release, please get the v2 to me as soon as possible.
> >
> > Ha yes, this is because libmxml is in meta-oe and not in oe-core.
> >
> > Should I include a libmxml recipe inside meta-arm or add the meta-oe
> > layer dependency?
>
> Please do NOT add meta-oe as a dependency for meta-arm/meta-arm! That wou=
ld be
> a blow for several dependent BSP layers re-using meta-arm...

Ok, I will send a v2 with the libmxml recipe.

That's not perfect to reuse the same recipe but it's better than
depending on meta-oe.

Regards,
Clement

>
>
> > Not sure what's best both are not very satisfying :/
> >
> > Thanks,
> > Clement
> >
> > >
> > > Thanks,
> > > Jon
> > >
> > > > ---
> > > >  .../0001-Include-missing-cstdint.patch        | 32 ---------------=
----
> > > >  .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 ---------------=
---
> > > >  ...-daemon_7.8.0.bb =3D> gator-daemon_8.4.0.bb} | 21 ++++--------
> > > >  3 files changed, 7 insertions(+), 77 deletions(-)
> > > >  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-da=
emon/0001-Include-missing-cstdint.patch
> > > >  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-da=
emon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> > > >  rename meta-arm/recipes-devtools/gator-daemon/{gator-daemon_7.8.0.=
bb =3D> gator-daemon_8.4.0.bb} (51%)
> > > >
> > > > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/00=
01-Include-missing-cstdint.patch b/meta-arm/recipes-devtools/gator-daemon/g=
ator-daemon/0001-Include-missing-cstdint.patch
> > > > deleted file mode 100644
> > > > index 294f804f..00000000
> > > > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Incl=
ude-missing-cstdint.patch
> > > > +++ /dev/null
> > > > @@ -1,32 +0,0 @@
> > > > -From 87745a6cad0f7819ac8f8d3826f5e228ebd843c5 Mon Sep 17 00:00:00 =
2001
> > > > -From: Khem Raj <raj.khem@gmail.com>
> > > > -Date: Thu, 2 Feb 2023 16:39:26 -0800
> > > > -Subject: [PATCH] Include missing <cstdint>
> > > > -
> > > > -gcc 13 moved some includes around and as a result <cstdint> is no
> > > > -longer transitively included [1]. Explicitly include it
> > > > -for uintXX_t.
> > > > -
> > > > -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> > > > -
> > > > -Upstream-Status: Submitted [https://github.com/ARM-software/gator/=
pull/40]
> > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ----
> > > > - daemon/xml/CurrentConfigXML.h | 1 +
> > > > - 1 file changed, 1 insertion(+)
> > > > -
> > > > -diff --git a/daemon/xml/CurrentConfigXML.h b/daemon/xml/CurrentCon=
figXML.h
> > > > -index 0b239fd..d9047e3 100644
> > > > ---- a/daemon/xml/CurrentConfigXML.h
> > > > -+++ b/daemon/xml/CurrentConfigXML.h
> > > > -@@ -1,6 +1,7 @@
> > > > - /* Copyright (C) 2020-2021 by Arm Limited. All rights reserved. *=
/
> > > > - #pragma once
> > > > -
> > > > -+#include <cstdint>
> > > > - #include <set>
> > > > - #include <string>
> > > > -
> > > > ---
> > > > -2.39.1
> > > > -
> > > > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/00=
01-daemon-mxml-Define-_GNU_SOURCE.patch b/meta-arm/recipes-devtools/gator-d=
aemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> > > > deleted file mode 100644
> > > > index d2460434..00000000
> > > > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daem=
on-mxml-Define-_GNU_SOURCE.patch
> > > > +++ /dev/null
> > > > @@ -1,31 +0,0 @@
> > > > -From 04e2e924c3ab8da41343277746804dbcd7bf520d Mon Sep 17 00:00:00 =
2001
> > > > -From: Khem Raj <raj.khem@gmail.com>
> > > > -Date: Sat, 13 Aug 2022 16:49:52 -0700
> > > > -Subject: [PATCH] daemon/mxml: Define _GNU_SOURCE
> > > > -
> > > > -This file uses vasprintf() which is defined only with _GNU_SOURCE
> > > > -feature macro is on.
> > > > -
> > > > -Upstream-Status: Pending
> > > > -
> > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ----
> > > > - daemon/mxml/mxml-string.c | 2 ++
> > > > - 1 file changed, 2 insertions(+)
> > > > -
> > > > -diff --git a/daemon/mxml/mxml-string.c b/daemon/mxml/mxml-string.c
> > > > -index 678aeb9..c9cd153 100644
> > > > ---- a/daemon/mxml/mxml-string.c
> > > > -+++ b/daemon/mxml/mxml-string.c
> > > > -@@ -13,6 +13,8 @@
> > > > -  * Include necessary headers...
> > > > -  */
> > > > -
> > > > -+#define _GNU_SOURCE
> > > > -+
> > > > - #include "config.h"
> > > > -
> > > > -
> > > > ---
> > > > -2.37.2
> > > > -
> > > > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.=
8.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> > > > similarity index 51%
> > > > rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8=
.0.bb
> > > > rename to meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0=
.bb
> > > > index 6188b07e..586b3ce8 100644
> > > > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> > > > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> > > > @@ -8,28 +8,21 @@ HOMEPAGE =3D "https://github.com/ARM-software/gat=
or"
> > > >  # configuration requirement specified here:
> > > >  # https://github.com/ARM-software/gator#kernel-configuration
> > > >
> > > > -LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> > > > +LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
> > > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263 \
> > > >                      file://libsensors/COPYING.LGPL;md5=3D4fbd65380=
cdd255951079008b364516c \
> > > > -                    file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd=
8986968f4327 \
> > > >                      file://k/perf_event.h;endline=3D14;md5=3De548b=
f30a60b2ed11ef2dcf7bfdac230 \
> > > >                     "
> > > >
> > > > -SRCREV =3D "6a944e7ee1f1c3ab9b2a57efd24c58503122db02"
> > > > -SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dht=
tp;branch=3Dmain;protocol=3Dhttps \
> > > > -           file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;stripl=
evel=3D2 \
> > > > -           file://0001-Include-missing-cstdint.patch;striplevel=3D=
2 \
> > > > -          "
> > > > +SRCREV =3D "75662ba2dc2e1c7a17cff640a35629dca99c5b79"
> > > > +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dht=
tp;branch=3Dmain;protocol=3Dhttps"
> > > >
> > > >  S =3D "${WORKDIR}/git/daemon"
> > > >
> > > > +DEPENDS =3D "boost libmxml pkgconfig-native protobuf protobuf-nati=
ve"
> > > > +
> > > >  COMPATIBLE_HOST =3D "aarch64.*-linux"
> > > >
> > > > -EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT=
_SOURCE -DETCDIR=3D\"${sysconfdir}\"' \
> > > > -                'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_CO=
MPILE=3D${TARGET_PREFIX}' \
> > > > -                'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtt=
i' CC=3D'${CC}' CXX=3D'${CXX}' V=3D1"
> > > > +inherit cmake
> > > >
> > > > -do_install() {
> > > > -        install -d ${D}${sbindir}
> > > > -        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> > > > -}
> > > > +EXTRA_OECMAKE +=3D "-DENABLE_VCPKG=3DOFF -DGATOR_INSTALL_PREFIX=3D=
./bin"
> > > > --
> > > > 2.39.2 (Apple Git-143)

