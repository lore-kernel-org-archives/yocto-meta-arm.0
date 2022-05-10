Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB6EC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 22:04:15 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.3448.1652220252052983176
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 15:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X3W10KaG;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id p4so165568qtq.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eEEr7kDx1BXnsEyu7j7TbnU/h5m7BMZ028qckF6rrjQ=;
        b=X3W10KaGHsI0rb2Vyix2wFjAR1uhhbVsi41SPZ8TiKRX6h/Hcukgw4/NaCR8EosfuU
         /UkSghl2uO1wbtu9VnfoAL8CcdtNBpdxb+X+DnuWwB6GXZWFTUy/yuEC2iB9ACYwuA/s
         xDr7d3nrieyJWNQR5YQ5N+2aZO66q2J0GI8Q+9T9tXorwlVlXAXeU0jDvPF3b59MxDIF
         oO1olnghllmeMwsHIqrrJxEvGabVTfpPnOO2K82703N/mKEyoOxUTrjdPHynOpA/rwG+
         D3KtdjmXSEmlkL12/gbMhNZ9WMLtPQKvl8Rjfvb2n8mTEjEHsJusDIapHye4S9EKSOVI
         LUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEEr7kDx1BXnsEyu7j7TbnU/h5m7BMZ028qckF6rrjQ=;
        b=blgldA+8mN6oc3qVsX8G0fsPACCDB5NohZbAOmxyDxyNflrd9npR6ZZRw2aaXdKq7L
         PAJGtURfKhm1+aQqLipf4zguih5G6Uilr44YI1oxGBmGI8K6A8jj3M9VATyf03v30evo
         EZlQHiogw8zdQsjlUQhTxcE/8csppfulktUYw5CyxyjsHn+6z6Qp1lc4vWSjaeGLK+MV
         JFIQLS/agIdPpayBR0uPTBXtrWZK0J281hZXnxDosT/4USaT7xbMaiFBDdNIzC9Iukx3
         i3okcckO4OQBqz1CTd2BgEok7Jlboljp6jwxrmbatfFaGL/dcS17e2ci0SvdeznxhR/T
         cPtQ==
X-Gm-Message-State: AOAM530JMkqXn+eY6NAerQ9HcV2W9L29THRmKg8xBUYwr9qcdYMEJgk1
	p8Ok/LP+W1ELBZZpz5AWmOmmB3vDHp+nfrWB0zI=
X-Google-Smtp-Source: 
 ABdhPJx4bjN3CPJ3FpL2y1mHAWWEukGNDiBUPK4NG4/xD/vG8om04tddOQjBAHNhT2EM64Szm9kh2mQC5OThPCDi2wU=
X-Received: by 2002:ac8:574d:0:b0:2f3:b4aa:700f with SMTP id
 13-20020ac8574d000000b002f3b4aa700fmr21325531qtx.54.1652220251060; Tue, 10
 May 2022 15:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220420054235.3727707-1-raj.khem@gmail.com>
 <CAAnfSTtwJBchUsZQRd2H8G8fZ2_SzRfu9=WHOMy2ssBOtcEDVw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtwJBchUsZQRd2H8G8fZ2_SzRfu9=WHOMy2ssBOtcEDVw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2022 15:03:45 -0700
Message-ID: 
 <CAMKF1sptVM9U+D10P2bVNJFRphz-eCvdyutUGFStv+exsDXvgw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] hafnium: Fix build when _Noreturn is not
 available
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 22:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3380

On Wed, Apr 20, 2022 at 1:33 AM Ross Burton <ross@burtonini.com> wrote:
>
> Missing Upstream-Status.
>
> However, I'd prefer to understand what the actual problem is first, as
> this feels like a workaround not a fix.

ping, now that gcc12 is in master, it should be reproducible for you.

>
> Ross
>
> On Wed, 20 Apr 2022 at 06:42, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Jon Mason <jon.mason@arm.com>
> > Cc: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../0001-define-_Noreturn-if-needed.patch     | 33 +++++++++++++++++++
> >  meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb   |  1 +
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
> >
> > diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
> > new file mode 100644
> > index 0000000..b73c533
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
> > @@ -0,0 +1,33 @@
> > +From 0d941ba32a082023575fd0d14d52a12b7547b367 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 19 Apr 2022 22:32:56 -0700
> > +Subject: [PATCH] define _Noreturn if needed
> > +
> > +The new _Noreturn function specifier is not recognized by the parser and shows as a syntax error:
> > +
> > +Fixes
> > +../git/inc/hf/panic.h:13:1: error: '_Noreturn' is a C11 extension [-Werror,-Wc11-extensions]
> > +noreturn void panic(const char *fmt, ...);
> > +^
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + inc/hf/panic.h | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/inc/hf/panic.h b/inc/hf/panic.h
> > +index ec864e4f..588f1193 100644
> > +--- a/inc/hf/panic.h
> > ++++ b/inc/hf/panic.h
> > +@@ -10,4 +10,8 @@
> > +
> > + #include <stdnoreturn.h>
> > +
> > ++#ifndef _Noreturn
> > ++#define _Noreturn __attribute__ ((noreturn))
> > ++#endif
> > ++
> > + noreturn void panic(const char *fmt, ...);
> > +--
> > +2.36.0
> > +
> > diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> > index 96e455f..a9f41b9 100644
> > --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> > +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> > @@ -10,6 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  inherit deploy python3native pkgconfig
> >
> >  SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;branch=master \
> > +           file://0001-define-_Noreturn-if-needed.patch \
> >             file://host-ld.patch \
> >             file://pkg-config-native.patch \
> >             file://native-dtc.patch"
> > --
> > 2.36.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3278): https://lists.yoctoproject.org/g/meta-arm/message/3278
> > Mute This Topic: https://lists.yoctoproject.org/mt/90578787/1676615
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

