Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.9868.1624879271189451505
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 04:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=B6u+5VHl;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id a13so20780549wrf.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Jun 2021 04:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u2pQJPQIIp5iySWiab8BCIuEi+lgPhMuCLC/7fxhW28=;
        b=B6u+5VHl51hPIu8pI0vL+zLU+wkE6OV7hHJboA4+BRSx6wE/5ow5CMFO1nuREHEAzy
         9m7mZn/xViyeEb2TCiN2ZmXx67VcEbMJ9rDFNINiU0xgOM91vnz08qMdTwVblSKCtMcS
         4SchkX2hPc1/hJ4lWfNlzpO4lj7CyX+RhxwgzXgMiYZX2jYwWujAhP/ihl7x3qO6f8P6
         daTjvmaP1nMy0jI/HmYVQQ2TnewvCG+m+9ZYZhWLZx2VILMWRajoVJC8g9bhN/1xD8tA
         M1Lyi/jupmZAcfwBI5aS3cCfHDMv7ZhgBlFoAfcQRNBQ7GGvx0hc/SvcPg3cyUTkoR9N
         uXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u2pQJPQIIp5iySWiab8BCIuEi+lgPhMuCLC/7fxhW28=;
        b=I1x3FAgzUFQbRr0JYMOQzQyDgAZMgquriB/ILzsVTZI2NcfzpfpyWuSZMTDzoJaT57
         TzmxK8uGZ4yzIujjjKSoY96I/kaVIbJi7EwMNZkYNKjNJxoMlhXllvMlSLR56YDx6KOV
         9fb3Il8hoSYNpi9XJYb+OVClpQWB7k6c5r+VVWMFS59br73VsD96GkQ+ZAQvZZf+RrUm
         e6+ZpIbID3Yt8aFAWTNG30YOfFODxSK1N3qlqFDIto8LzD7NppHMG8YMGfR86xdAWsMz
         yNAofAym+Rgo4VXp574GL8kMqTMmwLVL5tV+hEgtZDGYqYBkaLittYa0n6R5dZeK/kkr
         XCpg==
X-Gm-Message-State: AOAM5304D+8DL8pzk8uJazTtT4mRlTh3zcOKg8TBX0gbytM60KByCqUu
	y3SxYtDQXTFgIcVPFu6DqrRc2oxATLZjYMzXjJZUyw==
X-Google-Smtp-Source: ABdhPJxLRqw6MyvvmT7NY6xiIhuVf67QkW3UTfhrloMnuNcSVKhcw6nY3U/Hk+/pfpUMjQjAg77hMwju/AXksa9e1YE=
X-Received: by 2002:a5d:5187:: with SMTP id k7mr26704956wrv.395.1624879269745;
 Mon, 28 Jun 2021 04:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210626212806.1956740-1-raj.khem@gmail.com> <20210627190850.GV1528@denix.org>
 <CAMKF1sp9RoA3MvNz2HHwHgFe9ubTxipmR5F8OXKK-_5rARD0fw@mail.gmail.com> <CAAnfSTtMcEK9QBvP488OSVVPtmffuoV3Jiq0-JFsfbStsUz+tw@mail.gmail.com>
In-Reply-To: <CAAnfSTtMcEK9QBvP488OSVVPtmffuoV3Jiq0-JFsfbStsUz+tw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 28 Jun 2021 12:20:58 +0100
Message-ID: <CAAnfSTsyBoGub6Zw0KDjYRZqeownXHBm_UQEDp0UiSGGCZi6BA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator-daemon: Do not specify header files in GATORD_CXX_SRC_FILES
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Jon Mason <jon.mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Resend with Backport please :)

Ross

On Mon, 28 Jun 2021 at 12:11, Ross Burton <ross@burtonini.com> wrote:
>
> It makes me sad when we carry Pending patches for stuff that we own,
> so I send the pull request:
>
> https://github.com/ARM-software/gator/pull/27
>
> Please re-send with at least Submitted, unless that gets merged before
> you wake up. :)
>
> Ross
>
> On Sun, 27 Jun 2021 at 20:30, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Sun, Jun 27, 2021 at 12:08 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> On Sat, Jun 26, 2021 at 02:28:06PM -0700, Khem Raj wrote:
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > Cc: Jon Mason <jon.mason@arm.com>
> >> > Cc: Ross Burton <ross.burton@arm.com>
> >> > ---
> >> >  ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 31 +++++++++++++++++++
> >> >  .../gator-daemon/gator-daemon_7.7.0.bb        |  4 ++-
> >> >  2 files changed, 34 insertions(+), 1 deletion(-)
> >> >  create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> >> >
> >> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> >> > new file mode 100644
> >> > index 0000000..fc39f4e
> >> > --- /dev/null
> >> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
> >> > @@ -0,0 +1,31 @@
> >> > +From 6f62c77f0a51de17b7f81f225ef483ed8214640e Mon Sep 17 00:00:00 2001
> >> > +From: Khem Raj <raj.khem@gmail.com>
> >> > +Date: Sat, 26 Jun 2021 14:19:10 -0700
> >> > +Subject: [PATCH] Sources.mk: Remove xml/PmuXMLParser.h header from
> >> > + GATORD_CXX_SRC_FILES
> >> > +
> >> > +This otherwise appears in final linker cmdline and clang is not happy
> >> > +since it sees this as an output file along with the real output file
> >> > +specified with -o and bails out
> >> > +
> >> > +| clang-13: error: cannot specify -o when generating multiple output files
> >> > +
> >>
> >> Upstream-Status?
> >
> >
> > Pending
> >
> >>
> >>
> >>
> >> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > +---
> >> > + daemon/Sources.mk | 3 +--
> >> > + 1 file changed, 1 insertion(+), 2 deletions(-)
> >> > +
> >> > +diff --git a/daemon/Sources.mk b/daemon/Sources.mk
> >> > +index 60d15ef..3e679f5 100644
> >> > +--- a/daemon/Sources.mk
> >> > ++++ b/daemon/Sources.mk
> >> > +@@ -147,5 +147,4 @@ GATORD_CXX_SRC_FILES := \
> >> > +     xml/EventsXMLProcessor.cpp \
> >> > +     xml/MxmlUtils.cpp \
> >> > +     xml/PmuXML.cpp \
> >> > +-    xml/PmuXMLParser.cpp \
> >> > +-    xml/PmuXMLParser.h
> >> > ++    xml/PmuXMLParser.cpp
> >> > +--
> >> > +2.32.0
> >> > +
> >> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> >> > index 61b1731..b3ba437 100644
> >> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> >> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> >> > @@ -16,7 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >> >                     "
> >> >
> >> >  SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
> >> > -SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main"
> >> > +SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main \
> >> > +           file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2 \
> >> > +          "
> >> >
> >> >  S = "${WORKDIR}/git/daemon"
> >> >
> >> > --
> >> > 2.32.0
> >> >
> >>
> >> --
> >> Regards,
> >> Denys Dmytriyenko <denis@denix.org>
> >> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> >> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> >
> >
> > 
> >
