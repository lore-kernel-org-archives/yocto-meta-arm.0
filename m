Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF77C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 23:14:03 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.6899.1632784443190146593
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 16:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4dBbXQB8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id x9so18368894qtv.0
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 16:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4P5elcXveHFsQE9jEghbcGh9WiYWyPAGrZNt3gwwxt4=;
        b=4dBbXQB8bjiHNOxaSMyjAMwRKr7FTP/vspMKiQd3ot+RrGTyYOWKcq/4XrKHElsH59
         Lw+Or8y4zQVunn9yH/cKUJLQLmGmPvN2YlOp0/sL1gNq0ROiq9sjYeDBsd+7T0eaA0V7
         o1vO52l4VflI6M3unYIWoEUA/PAn9EsrAKeMz8pTRV4G582LKWUMQEdZVM2HAMGV0kDN
         K/ZhcDde5FonzxG0FIWHpDUsLFCpjppUQeENf14vPaUt7x5V/2fmHmbWZpyFYRHQImkm
         f3ht9ItC9+EL5uDnKuV5l9pEmIAXnBNzeeMd/yw7GN75RbOcEZ7gOKW/W2hXLkr3feQe
         n0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4P5elcXveHFsQE9jEghbcGh9WiYWyPAGrZNt3gwwxt4=;
        b=1QHnuXgNGQ0ZhpDtMb+q8MmQU7OUPnsHm2jsC0keiNMcSPlZAOxLsE1myjP+F0cW1n
         DpUNbUCf18Nf0vQ+tH6tLI2EUoqfQKhVQQ4LmZWGHj0DVM/uwlmrpYCSfGv/f9GtFoLv
         akttBDXAWphOlw2qR86LSqiprylIthMTV5Y+BEr8XUWowIrh1ikh+8B04/AfXUSluySE
         r23xt3W2DX40xAAzskwoekwckZauetnzRSoqutaq0tBQhFmjgcTCvHIGhp1koL1qcRE2
         bpAd34JchoTCehwM5mUkbGTSHUYbeb9TNHRO2ydTP4Cwbxt1b4MwU8cGY2fXXpEn7ha2
         5oQg==
X-Gm-Message-State: AOAM530t/Peb1BHkGFTtYCgWbns3jshM1iXCSI9/r/YXcDpfMPLLGdSh
	OuoJgLqwbuGVi8YYThOIxq/haWNFHCIUJ9uDkyws6w==
X-Google-Smtp-Source: 
 ABdhPJzDo+n63Si2clhaaw2pMvYUeJtItTWfw9bdXMmA3eANLAOtMo1Uprwi3nyeJugcdx/bi/AUdzGyBLdQpLlsCIk=
X-Received: by 2002:ac8:5a:: with SMTP id i26mr2605940qtg.269.1632784442064;
 Mon, 27 Sep 2021 16:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210927131820.19364-1-jon.mason@arm.com>
 <20210927181500.GT1528@denix.org>
In-Reply-To: <20210927181500.GT1528@denix.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 27 Sep 2021 19:13:51 -0400
Message-ID: 
 <CAPoiz9ypbAtwjHDv_F6=1PT9_PbMYWDFbjV9EZMvT+Ogxwjm9A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: use variables
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 23:14:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2238

On Mon, Sep 27, 2021 at 2:15 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Sep 27, 2021 at 09:18:20AM -0400, Jon Mason wrote:
> > Use variables to make it easier to upgrade when the time comes.
> >
> > Change-Id: I9f2575279fe79bc0d895d47fdaffd2d5edd4aa59
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .../recipes-devtools/gcc/gcc-arm-10.3.inc              | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > index 72a6b46..187f4f4 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > @@ -1,8 +1,8 @@
> >  require recipes-devtools/gcc/gcc-common.inc
> >
> >  # Third digit in PV should be incremented after a minor release
> > -
> > -PV = "arm-10.3"
> > +GCC_VERSION = "10.3"
>
> Isn't it too close to be confused with the global GCCVERSION variable in
> meta/conf/distro/include/tcmode-default.inc that specifies gcc preference.
> I realize this GCC_VERSION has a different use, but maybe the name should
> be a bit clearer?

I was a little quick on the trigger and pushed it already, but I agree
with your point.  I'll do a follow-on patch to change it to a better
name.  Suggestions?

Thanks,
Jon

>
>
> > +PV = "arm-${GCC_VERSION}"
> >  CVE_VERSION = "10.3"
> >
> >  # BINV should be incremented to a revision after a minor gcc release
> > @@ -13,7 +13,7 @@ MMYY = "21.07"
> >  RELEASE = "20${MMYY}"
> >  PR = "r${RELEASE}"
> >
> > -FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.3:${FILE_DIRNAME}/gcc-arm-10.3/backport:"
> > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}:${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}/backport:"
> >
> >  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> >  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
> > @@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "\
> >      file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
> >  "
> >
> > -BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/srcrel/gcc-arm-src-snapshot-10.3-2021.07.tar.xz"
> > +BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/${GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}.tar.xz"
> >  SRC_URI = "\
> >             ${BASEURI} \
> >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > @@ -72,7 +72,7 @@ SRC_URI = "\
> >  "
> >  SRC_URI[md5sum] = "5f582fd50eee0e40475b93d2d7a18979"
> >
> > -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.3-2021.07"
> > +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}"
> >
> >  # For dev release snapshotting
> >  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
> > --
> > 2.17.1
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2237): https://lists.yoctoproject.org/g/meta-arm/message/2237
> Mute This Topic: https://lists.yoctoproject.org/mt/85900244/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

