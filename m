Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.3241.1619367373920668843
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 25 Apr 2021 09:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SUBFPwqU;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ja3so4876794ejc.9
        for <meta-arm@lists.yoctoproject.org>; Sun, 25 Apr 2021 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WKiVmJxKv2L/igBopy2p0oi+EDdS3F+/B7T0hwjQqxg=;
        b=SUBFPwqUw5E7DWCwDrV6a5REA8JT6Cmy3zKyTpqhif2ZPPzcsD8MVHI/fEEndjef81
         9e5Bq/V1wxpUvmrWOWP6S3esZdS/YF8D03OVoHLl37xsZ3/EqZ9aszqHeX3YRHqMDyed
         r1vV3BZd7PEavYGSGp3KVLTzdv8FErUk/lGnL5zinIi5n3RpAB3wYRxG1zg988CfZa1X
         c/DerM7MxivuzDIYxb2TPZ9X6u3BzuPEophVIyB5KAnugwYFA8+sy5fEBbjya0aql+WH
         huRRSr/CjghGAZ4ghcfKlN3CYZGGhVbPTcEq6cpZcZu41u+9uMzWcUD4tn59seLgZ8Vp
         BEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WKiVmJxKv2L/igBopy2p0oi+EDdS3F+/B7T0hwjQqxg=;
        b=qrgl1h5sYxqKnVSKkgcHlMdCKNSB2Yhp71p/r3OXozOl3uBZkMdQftEZOEtdGCZTt9
         3PqgfxFbQVao8dn2oM2Srca2IzyvAXMPg3GTLUsUok829YyejZu7d9FHaYZ5ulGu5ac4
         wNnE/WkBlfRdHR2GdIsmYMTEjeKNIP5FFkbPghrCBZLGaVUQLCAvJpNxJs3KeAqfLhMK
         elkgyvKfG7yzPgZDjPT/tH3OrPTheiqL7T9Z4j+0CHSVGMq0cfwRWOSJSIx1g95rgUGc
         3JIkACzmezZ/K0BtAxC3FqitB5Ysawl39I/X5OITygUksW6p67wzAweB/OoNGQfaSF5K
         Ykvg==
X-Gm-Message-State: AOAM530jdCyt9/Wm701CP73EALsrKiDZzcqBCoPUrzPUj+RFywoFm2yq
	x248grwOsR0U676QoGk7HHFtr2DcRcnq2AxjYCA=
X-Google-Smtp-Source: ABdhPJxEUKJMa+fOqC2SzlY8EAER9qUorS6NCnd/48u/VMt9zyKgB7ZDIUaWEUyi+JyJ+Pu/oXur7g7zpuOpzHQy3g0=
X-Received: by 2002:a17:906:f41:: with SMTP id h1mr14434269ejj.399.1619367372348;
 Sun, 25 Apr 2021 09:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <167925D13277D687.1887@lists.yoctoproject.org>
In-Reply-To: <167925D13277D687.1887@lists.yoctoproject.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 25 Apr 2021 18:16:01 +0200
Message-ID: <CAJiuCccapfx2x4XSqnT4eUBw7B74u3e_O96-BE=NX1vcUuO=HA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] [RFC] gator: Add new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 25 Apr 2021 at 18:12, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproje=
ct.org
<peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> To communicate with the target device, Streamline requires the
> gator daemon, gatord, to be running on the device.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

As suggested on meta-openembedded, i'm reposting this patch here.
https://lists.openembedded.org/g/openembedded-devel/topic/82331135

> ---
>  .../gator/0001-gator-don-t-strip-debug.patch  | 24 +++++++++++++++++++
>  .../recipes-devtools/gator/gator_7.5.0.bb     | 22 +++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-arm/recipes-devtools/gator/gator/0001-gator-don=
-t-strip-debug.patch
>  create mode 100644 meta-arm/recipes-devtools/gator/gator_7.5.0.bb
>
> diff --git a/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-stri=
p-debug.patch b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-stri=
p-debug.patch
> new file mode 100644
> index 000000000000..8e59fffa1fc2
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug=
.patch
> @@ -0,0 +1,24 @@
> +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@outsight=
.tech>
> +Date: Fri, 16 Apr 2021 15:27:16 +0200
> +Subject: [PATCH] gator: don't strip debug
> +
> +---
> + daemon/Makefile | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/daemon/Makefile b/daemon/Makefile
> +index ba5f29cfeb10..6807948310f9 100644
> +--- a/daemon/Makefile
> ++++ b/daemon/Makefile
> +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1 -d.=
` \>=3D 5),1)
> +       CXXFLAGS +=3D -fno-sized-deallocation
> + endif
> +
> +-# -s strips the binary of debug info
> +-LDFLAGS     +=3D -s
> + LDLIBS      +=3D -lrt -lm -pthread
> + TARGET      :=3D $(OBJ_DIR)gatord
> + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
> +--
> +2.25.1
> diff --git a/meta-arm/recipes-devtools/gator/gator_7.5.0.bb b/meta-arm/r=
ecipes-devtools/gator/gator_7.5.0.bb
> new file mode 100644
> index 000000000000..8e15b1ca5fc5
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/gator/gator_7.5.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "DS-5 Streamine Gator daemon"
> +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamline P=
erformance Analyzer."
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
> +LICENSE_libsensors =3D "LGPL-2.1-or-later"

The gator github specifies that:

- libsensors source code in daemon/libsensors licensed under LGPL-2.1-or-l=
ater
- mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
Mini-XML-exception
- perf_event.h from Linux userspace kernel headers in daemon/k
licensed under GPL-2.0-only WITH Linux-syscall-note

I'm not sure how to properly describe that in the recipe.

Regards,
Clement


> +
> +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
> +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;br=
anch=3Dmaster \
> +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
> +         "
> +
> +S =3D "${WORKDIR}/git/daemon"
> +
> +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOUR=
CE -DETCDIR=3D\"${sysconfdir}\"' \
> +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=3D${TARGET_=
PREFIX}' \
> +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'${CC}' C=
XX=3D'${CXX}'"
> +
> +do_install() {
> +       install -d ${D}${sbindir}
> +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> +}
> --
> 2.25.1
>
>
>=20
>
