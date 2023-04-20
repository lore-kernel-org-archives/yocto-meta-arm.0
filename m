Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A238C77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 21:58:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.561.1682027902708960280
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 14:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4477340C68;
	Thu, 20 Apr 2023 21:58:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_OIKyGVDvZ9; Thu, 20 Apr 2023 21:58:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A5B640A2F;
	Thu, 20 Apr 2023 21:58:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3ECBF16382A; Thu, 20 Apr 2023 17:57:39 -0400 (EDT)
Date: Thu, 20 Apr 2023 17:57:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] gator-daemon: bump to 8.4.0
Message-ID: <20230420215739.GZ9226@denix.org>
References: <20230418163658.13032-1-peron.clem@gmail.com>
 <ZEF2vPTDHzWKV/7x@kudzu.us>
 <CAJiuCceXwVH=+81u+NWj3JWAkA8==PhnquSSo0SHqX6L1VR+7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAJiuCceXwVH=+81u+NWj3JWAkA8==PhnquSSo0SHqX6L1VR+7w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 21:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4604

On Thu, Apr 20, 2023 at 11:30:21PM +0200, Cl=E9ment P=E9ron wrote:
> Hi Jon
>=20
> Le jeu. 20 avr. 2023, 19:30, Jon Mason <jdmason@kudzu.us> a =E9crit :
> >
> > On Tue, Apr 18, 2023 at 06:36:58PM +0200, Cl=E9ment P=E9ron wrote:
> > > Gator Daemon moved to CMake build system so update the recipe
> > >
> > > Remove Apache-2.0 license as mxml has been moved out of this packag=
e
> > >
> > > Drop patches that has been merged
> > >
> > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> >
> > This patch fails on all platforms with:
> >
> > ERROR: Nothing PROVIDES 'libmxml' (but /builds/jonmason00/meta-arm/wo=
rk/build/../../meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.=
bb DEPENDS on or otherwise requires it). Close matches:
> >   libomxil
> >   libxml2
> >   libxpm
> > ERROR: Required build target 'core-image-sato' has no buildable provi=
ders.
> > Missing or unbuildable dependency chain was: ['core-image-sato', 'gat=
or-daemon', 'libmxml']
> >
> > Note: We're going to release mickledore in 1 week.  If you want this
> > in that release, please get the v2 to me as soon as possible.
>=20
> Ha yes, this is because libmxml is in meta-oe and not in oe-core.
>=20
> Should I include a libmxml recipe inside meta-arm or add the meta-oe
> layer dependency?

Please do NOT add meta-oe as a dependency for meta-arm/meta-arm! That wou=
ld be=20
a blow for several dependent BSP layers re-using meta-arm...


> Not sure what's best both are not very satisfying :/
>=20
> Thanks,
> Clement
>=20
> >
> > Thanks,
> > Jon
> >
> > > ---
> > >  .../0001-Include-missing-cstdint.patch        | 32 ---------------=
----
> > >  .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 ---------------=
---
> > >  ...-daemon_7.8.0.bb =3D> gator-daemon_8.4.0.bb} | 21 ++++--------
> > >  3 files changed, 7 insertions(+), 77 deletions(-)
> > >  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-da=
emon/0001-Include-missing-cstdint.patch
> > >  delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-da=
emon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> > >  rename meta-arm/recipes-devtools/gator-daemon/{gator-daemon_7.8.0.=
bb =3D> gator-daemon_8.4.0.bb} (51%)
> > >
> > > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/00=
01-Include-missing-cstdint.patch b/meta-arm/recipes-devtools/gator-daemon=
/gator-daemon/0001-Include-missing-cstdint.patch
> > > deleted file mode 100644
> > > index 294f804f..00000000
> > > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Incl=
ude-missing-cstdint.patch
> > > +++ /dev/null
> > > @@ -1,32 +0,0 @@
> > > -From 87745a6cad0f7819ac8f8d3826f5e228ebd843c5 Mon Sep 17 00:00:00 =
2001
> > > -From: Khem Raj <raj.khem@gmail.com>
> > > -Date: Thu, 2 Feb 2023 16:39:26 -0800
> > > -Subject: [PATCH] Include missing <cstdint>
> > > -
> > > -gcc 13 moved some includes around and as a result <cstdint> is no
> > > -longer transitively included [1]. Explicitly include it
> > > -for uintXX_t.
> > > -
> > > -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> > > -
> > > -Upstream-Status: Submitted [https://github.com/ARM-software/gator/=
pull/40]
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ----
> > > - daemon/xml/CurrentConfigXML.h | 1 +
> > > - 1 file changed, 1 insertion(+)
> > > -
> > > -diff --git a/daemon/xml/CurrentConfigXML.h b/daemon/xml/CurrentCon=
figXML.h
> > > -index 0b239fd..d9047e3 100644
> > > ---- a/daemon/xml/CurrentConfigXML.h
> > > -+++ b/daemon/xml/CurrentConfigXML.h
> > > -@@ -1,6 +1,7 @@
> > > - /* Copyright (C) 2020-2021 by Arm Limited. All rights reserved. *=
/
> > > - #pragma once
> > > -
> > > -+#include <cstdint>
> > > - #include <set>
> > > - #include <string>
> > > -
> > > ---
> > > -2.39.1
> > > -
> > > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/00=
01-daemon-mxml-Define-_GNU_SOURCE.patch b/meta-arm/recipes-devtools/gator=
-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
> > > deleted file mode 100644
> > > index d2460434..00000000
> > > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daem=
on-mxml-Define-_GNU_SOURCE.patch
> > > +++ /dev/null
> > > @@ -1,31 +0,0 @@
> > > -From 04e2e924c3ab8da41343277746804dbcd7bf520d Mon Sep 17 00:00:00 =
2001
> > > -From: Khem Raj <raj.khem@gmail.com>
> > > -Date: Sat, 13 Aug 2022 16:49:52 -0700
> > > -Subject: [PATCH] daemon/mxml: Define _GNU_SOURCE
> > > -
> > > -This file uses vasprintf() which is defined only with _GNU_SOURCE
> > > -feature macro is on.
> > > -
> > > -Upstream-Status: Pending
> > > -
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ----
> > > - daemon/mxml/mxml-string.c | 2 ++
> > > - 1 file changed, 2 insertions(+)
> > > -
> > > -diff --git a/daemon/mxml/mxml-string.c b/daemon/mxml/mxml-string.c
> > > -index 678aeb9..c9cd153 100644
> > > ---- a/daemon/mxml/mxml-string.c
> > > -+++ b/daemon/mxml/mxml-string.c
> > > -@@ -13,6 +13,8 @@
> > > -  * Include necessary headers...
> > > -  */
> > > -
> > > -+#define _GNU_SOURCE
> > > -+
> > > - #include "config.h"
> > > -
> > > -
> > > ---
> > > -2.37.2
> > > -
> > > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.=
8.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> > > similarity index 51%
> > > rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8=
.0.bb
> > > rename to meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0=
.bb
> > > index 6188b07e..586b3ce8 100644
> > > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> > > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
> > > @@ -8,28 +8,21 @@ HOMEPAGE =3D "https://github.com/ARM-software/gat=
or"
> > >  # configuration requirement specified here:
> > >  # https://github.com/ARM-software/gator#kernel-configuration
> > >
> > > -LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> > > +LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263 \
> > >                      file://libsensors/COPYING.LGPL;md5=3D4fbd65380=
cdd255951079008b364516c \
> > > -                    file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd=
8986968f4327 \
> > >                      file://k/perf_event.h;endline=3D14;md5=3De548b=
f30a60b2ed11ef2dcf7bfdac230 \
> > >                     "
> > >
> > > -SRCREV =3D "6a944e7ee1f1c3ab9b2a57efd24c58503122db02"
> > > -SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dht=
tp;branch=3Dmain;protocol=3Dhttps \
> > > -           file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;stripl=
evel=3D2 \
> > > -           file://0001-Include-missing-cstdint.patch;striplevel=3D=
2 \
> > > -          "
> > > +SRCREV =3D "75662ba2dc2e1c7a17cff640a35629dca99c5b79"
> > > +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dht=
tp;branch=3Dmain;protocol=3Dhttps"
> > >
> > >  S =3D "${WORKDIR}/git/daemon"
> > >
> > > +DEPENDS =3D "boost libmxml pkgconfig-native protobuf protobuf-nati=
ve"
> > > +
> > >  COMPATIBLE_HOST =3D "aarch64.*-linux"
> > >
> > > -EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT=
_SOURCE -DETCDIR=3D\"${sysconfdir}\"' \
> > > -                'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_CO=
MPILE=3D${TARGET_PREFIX}' \
> > > -                'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtt=
i' CC=3D'${CC}' CXX=3D'${CXX}' V=3D1"
> > > +inherit cmake
> > >
> > > -do_install() {
> > > -        install -d ${D}${sbindir}
> > > -        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> > > -}
> > > +EXTRA_OECMAKE +=3D "-DENABLE_VCPKG=3DOFF -DGATOR_INSTALL_PREFIX=3D=
./bin"
> > > --
> > > 2.39.2 (Apple Git-143)

