Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.8268.1619449888183904708
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 08:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YSxEsTQ3;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n21so8774804eji.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 26 Apr 2021 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aA2T16QaodZyFdonB0sqnpHPYpisSnHFpDlUNvtGFbY=;
        b=YSxEsTQ34ewDL5p4QuvHrmYwCzlq8iVCiyr37CHsPR89hhERCfATgx2J0JES5lzmUp
         eEbvVrnWTyRBH+OWTnJGh44rCsEzCIDabMUhotG/bPsuR6e9Av7qu8M2nP/h8sfdBnS1
         HNyjDy+hrvvlaZ6MAtq5yEBK86zpzSpMv7WPyuciVmjD0xGiiYJ7RPiMr4k8r8CMZXgi
         fAgOEUHCutKsVeVxXferjnOmION5EgBznpC9GHrXKBIWUNhJb7yOlxD4Dj5ihGYkNAQL
         hbsC2OpjPthFSWLYjEWKvXY97jaS+Mn2gZNe8cykAjmbrawtVwlNjC1L7e08w9OuWsTB
         0jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aA2T16QaodZyFdonB0sqnpHPYpisSnHFpDlUNvtGFbY=;
        b=QxJZgJ7+zpi6tqrSO264e/qMZ7OB+L4/QRIOkGGYyTb1UrMJGFOpLmxHMqCAVg2Q6W
         hVElfkJOcSdijH6sitB5yOU5xlfH1kJxe77enRthhLtbA/nhXVaXOfwJVCrtNH8cO3YS
         OHxfVehm5sJjj8CjlTw4xDl97VcK+3+CKiIAStZIOB6kLwRpCVAZVLgAmyZaAqloMMsK
         w+XjyP2ZTWrynlh9v3zEP0CeRlv1LVuiZ9LagUv5ePQEpXwJWkpaF20gnUDx/KWCNdAe
         jrIj1UznAmagIK+9ncIRGT/UgI7VAymUMD1rUWZSOttCcNLRMLZO5VqFOFNAqK4/2ANU
         E7FA==
X-Gm-Message-State: AOAM532xkBh+Zw/Ei+gJnLbg9bQB+smYSbIpY4Zpw4bNnWX9TEFPcpiI
	uny3aRC+27G2An/i5MtK0GCfIwTE+phVf0FGUy4=
X-Google-Smtp-Source: ABdhPJy5ZGnKfDj1e3mrGBTlpeW4ST5KS6I2259ctfsuE/SpEK3mHuKkqwLlB2Tx9axTixyOHjeGn2jCljptHS+t5/o=
X-Received: by 2002:a17:906:f41:: with SMTP id h1mr19309682ejj.399.1619449886441;
 Mon, 26 Apr 2021 08:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <167925D13277D687.1887@lists.yoctoproject.org> <CAJiuCccapfx2x4XSqnT4eUBw7B74u3e_O96-BE=NX1vcUuO=HA@mail.gmail.com>
 <AM6PR08MB3461990064C0A43E1F1FFB8692429@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3461990064C0A43E1F1FFB8692429@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 26 Apr 2021 17:11:15 +0200
Message-ID: <CAJiuCcdq4MD7tuMcNzQv_XNbJ4frEd86ggVAqi3oivZNBWEWpA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] [RFC] gator: Add new package
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Diego,

On Mon, 26 Apr 2021 at 17:01, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> Hi Clement,
>
> Thanks for sending this patch.
>
> Please find my comments inline.
>
> Cheers,
> --
> Diego Sueiro
>
> >-----Original Message-----
> >From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> >On Behalf Of Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org
> >Sent: 25 April 2021 17:16
> >To: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >Cc: meta-arm@lists.yoctoproject.org
> >Subject: Re: [meta-arm] [PATCH] [RFC] gator: Add new package
> >
> >Hi,
> >
> >On Sun, 25 Apr 2021 at 18:12, Cl=C3=A9ment P=C3=A9ron via lists.yoctopro=
ject.org
> ><peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>
> >> To communicate with the target device, Streamline requires the gator
> >> daemon, gatord, to be running on the device.
> >>
> >> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >
> >As suggested on meta-openembedded, i'm reposting this patch here.
> >https://lists.openembedded.org/g/openembedded-devel/topic/82331135
> >
> >> ---
> >>  .../gator/0001-gator-don-t-strip-debug.patch  | 24 ++++++++++++++++++=
+
> >>  .../recipes-devtools/gator/gator_7.5.0.bb     | 22 +++++++++++++++++
> >>  2 files changed, 46 insertions(+)
> >>  create mode 100644
> >> meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.pat
> >> ch  create mode 100644 meta-arm/recipes-devtools/gator/gator_7.5.0.bb
> >>
> >> diff --git
> >> a/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.p
> >> atch
> >> b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.p
> >> atch
> >> new file mode 100644
> >> index 000000000000..8e59fffa1fc2
> >> --- /dev/null
> >> +++ b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-deb
> >> +++ ug.patch
> >> @@ -0,0 +1,24 @@
> >> +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17
> >00:00:00
> >> +2001
> >> +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@outsig=
ht.tech>
> >> +Date: Fri, 16 Apr 2021 15:27:16 +0200
> >> +Subject: [PATCH] gator: don't strip debug
> >> +
>
> Upstream-Status and Signed-off-by tags are missing in this patch.
Ok,
>
> >> +---
> >> + daemon/Makefile | 2 --
> >> + 1 file changed, 2 deletions(-)
> >> +
> >> +diff --git a/daemon/Makefile b/daemon/Makefile index
> >> +ba5f29cfeb10..6807948310f9 100644
> >> +--- a/daemon/Makefile
> >> ++++ b/daemon/Makefile
> >> +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1 -=
d.`
> >\>=3D 5),1)
> >> +       CXXFLAGS +=3D -fno-sized-deallocation  endif
> >> +
> >> +-# -s strips the binary of debug info
> >> +-LDFLAGS     +=3D -s
> >> + LDLIBS      +=3D -lrt -lm -pthread
> >> + TARGET      :=3D $(OBJ_DIR)gatord
> >> + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
> >> +--
> >> +2.25.1
> >> diff --git a/meta-arm/recipes-devtools/gator/gator_7.5.0.bb
> >> b/meta-arm/recipes-devtools/gator/gator_7.5.0.bb
> >> new file mode 100644
> >> index 000000000000..8e15b1ca5fc5
> >> --- /dev/null
> >> +++ b/meta-arm/recipes-devtools/gator/gator_7.5.0.bb
> >> @@ -0,0 +1,22 @@
> >> +SUMMARY =3D "DS-5 Streamine Gator daemon"
> >> +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamline
> >Performance Analyzer."
> >> +
> >> +LICENSE =3D "GPL-2.0-only"
> >> +LIC_FILES_CHKSUM =3D
> >"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >> +LICENSE_libsensors =3D "LGPL-2.1-or-later"
> >
> >The gator github specifies that:
> >
> >- libsensors source code in daemon/libsensors licensed under LGPL-2.1-or=
-later
> >- mxml source code in daemon/mxml licensed under APACHE-2.0 WITH Mini-
> >XML-exception
> >- perf_event.h from Linux userspace kernel headers in daemon/k licensed
> >under GPL-2.0-only WITH Linux-syscall-note
> >
> >I'm not sure how to properly describe that in the recipe.
> >
> >Regards,
> >Clement
> >
> >
> >> +
> >> +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
>
> There is a more recent version (7.6.0) released 10 days ago. Can you plea=
se
> send the recipe for this newer version instead?
>
> Also, as documented in the README.md, there are couple of kernel configs
> required for gator. Can you mention in the recipe the need of the kernel =
configs
> and point to the https://github.com/ARM-software/gator#kernel-configurati=
on link?

Do you want to add this in the Description package or a comment in the reci=
pe?

Thanks for your feebacks,
Clement

>
>
> >> +SRC_URI =3D "git://github.com/ARM-
> >software/gator.git;protocol=3Dhttp;branch=3Dmaster \
> >> +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
> >> +         "
> >> +
> >> +S =3D "${WORKDIR}/git/daemon"
> >> +
> >> +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -
> >D_DEFAULT_SOURCE -DETCDIR=3D\"${sysconfdir}\"' \
> >> +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}'
> >'CROSS_COMPILE=3D${TARGET_PREFIX}' \
> >> +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'${CC}'
> >CXX=3D'${CXX}'"
> >> +
> >> +do_install() {
> >> +       install -d ${D}${sbindir}
> >> +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord }
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
