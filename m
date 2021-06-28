Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.9737.1624878713085801074
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 04:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ks+c7h3W;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id k30-20020a05600c1c9eb02901d4d33c5ca0so5458612wms.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Jun 2021 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CGro00apGOIC/2u2EGkh2C/a+NWbawrgmBPV7xLX4jc=;
        b=ks+c7h3Wtr5BwdFfoJIn6dvuHKjLtQBJ3ebH8VV1CcQL0fzdZWtrzL5llNbl5FL8dr
         spQWbEJeMdUWM9prCsoi0py5eEd8f9o8Xi1zl+mUAM/Obg813xtQkEfb4Ozvl2zROBNZ
         KE7PQOSHtBGcnRgunVlxQaY3bOo7T3RD81s7CIqzRArv1R8H3ckur0TXqN0wiuyXLtCK
         nr/jtXWCJ/4VSSqGOQjOhTruCy7ho6W500qmqdQe9wuVWQv/WbPgRzB9dZGr1BbpB6+2
         XK3Aq1VDsDgSRfqg/wO4bVNmhI9UcVTR+CjJkhxyF8OUI4z329zsxU4Hz13lTTu4jFyU
         5uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGro00apGOIC/2u2EGkh2C/a+NWbawrgmBPV7xLX4jc=;
        b=Sy1nHUdy8raJ5D66ewIImNobryQF61BfrMO8tVbqMB/f4RHPApqz89WqtBfyI8dgJQ
         PNU7KDNxY3XgNjCdOHeB4mk7aMO+AgvYkWkx14zu/3nJmTe1ulL9ketaQqy/s8xbV9Lq
         JAPumHwZPDnNqnkD9WucGwLJ8PY7tO5yQ2kBfadTC/+SsWvlHmXqnBmK7Qhio+ZRMgzS
         gxiJlx8TP3i8J4vy7Jas5aMGH2PES2gRVD1l+R6CEHiuLQM27dzDWVwqhEPbAFAd7xvo
         0gzvR608TQqtviZJJECYrxWYMWtkEKv2hkAHN0lIZ8M+EdH+HGqautr+UqVZoYVRIhbF
         XYUg==
X-Gm-Message-State: AOAM532CL8aYH3s9AjGEbHIOR5wpTU9v+3atWCXLuZy91J4FQwMASo7l
	HLFxq19D0ly/VWHeIXfV74dhuC+ah9h0CpeIzK0vAA==
X-Google-Smtp-Source: ABdhPJwA14AAlpzF3EPWwBhYOuIe9k9/AQwQFEPka/2hK3Yakb1qKy+ttv9n4uOyKrhVSzNvPpFtHRWOCxLmrr5F+hk=
X-Received: by 2002:a05:600c:1d28:: with SMTP id l40mr8769490wms.130.1624878711670;
 Mon, 28 Jun 2021 04:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210626212806.1956740-1-raj.khem@gmail.com> <20210627190850.GV1528@denix.org>
 <CAMKF1sp9RoA3MvNz2HHwHgFe9ubTxipmR5F8OXKK-_5rARD0fw@mail.gmail.com>
In-Reply-To: <CAMKF1sp9RoA3MvNz2HHwHgFe9ubTxipmR5F8OXKK-_5rARD0fw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 28 Jun 2021 12:11:41 +0100
Message-ID: <CAAnfSTtMcEK9QBvP488OSVVPtmffuoV3Jiq0-JFsfbStsUz+tw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator-daemon: Do not specify header files in GATORD_CXX_SRC_FILES
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Jon Mason <jon.mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

It makes me sad when we carry Pending patches for stuff that we own,
so I send the pull request:

https://github.com/ARM-software/gator/pull/27

Please re-send with at least Submitted, unless that gets merged before
you wake up. :)

Ross

On Sun, 27 Jun 2021 at 20:30, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Sun, Jun 27, 2021 at 12:08 PM Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> On Sat, Jun 26, 2021 at 02:28:06PM -0700, Khem Raj wrote:
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > Cc: Jon Mason <jon.mason@arm.com>
>> > Cc: Ross Burton <ross.burton@arm.com>
>> > ---
>> >  ...e-xml-PmuXMLParser.h-header-from-GAT.patch | 31 +++++++++++++++++++
>> >  .../gator-daemon/gator-daemon_7.7.0.bb        |  4 ++-
>> >  2 files changed, 34 insertions(+), 1 deletion(-)
>> >  create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
>> >
>> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
>> > new file mode 100644
>> > index 0000000..fc39f4e
>> > --- /dev/null
>> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch
>> > @@ -0,0 +1,31 @@
>> > +From 6f62c77f0a51de17b7f81f225ef483ed8214640e Mon Sep 17 00:00:00 2001
>> > +From: Khem Raj <raj.khem@gmail.com>
>> > +Date: Sat, 26 Jun 2021 14:19:10 -0700
>> > +Subject: [PATCH] Sources.mk: Remove xml/PmuXMLParser.h header from
>> > + GATORD_CXX_SRC_FILES
>> > +
>> > +This otherwise appears in final linker cmdline and clang is not happy
>> > +since it sees this as an output file along with the real output file
>> > +specified with -o and bails out
>> > +
>> > +| clang-13: error: cannot specify -o when generating multiple output files
>> > +
>>
>> Upstream-Status?
>
>
> Pending
>
>>
>>
>>
>> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +---
>> > + daemon/Sources.mk | 3 +--
>> > + 1 file changed, 1 insertion(+), 2 deletions(-)
>> > +
>> > +diff --git a/daemon/Sources.mk b/daemon/Sources.mk
>> > +index 60d15ef..3e679f5 100644
>> > +--- a/daemon/Sources.mk
>> > ++++ b/daemon/Sources.mk
>> > +@@ -147,5 +147,4 @@ GATORD_CXX_SRC_FILES := \
>> > +     xml/EventsXMLProcessor.cpp \
>> > +     xml/MxmlUtils.cpp \
>> > +     xml/PmuXML.cpp \
>> > +-    xml/PmuXMLParser.cpp \
>> > +-    xml/PmuXMLParser.h
>> > ++    xml/PmuXMLParser.cpp
>> > +--
>> > +2.32.0
>> > +
>> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
>> > index 61b1731..b3ba437 100644
>> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
>> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
>> > @@ -16,7 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>> >                     "
>> >
>> >  SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
>> > -SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main"
>> > +SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main \
>> > +           file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2 \
>> > +          "
>> >
>> >  S = "${WORKDIR}/git/daemon"
>> >
>> > --
>> > 2.32.0
>> >
>>
>> --
>> Regards,
>> Denys Dmytriyenko <denis@denix.org>
>> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
>> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
>
> 
>
