Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F617C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 02:15:01 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.6411.1633486499715572859
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 19:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=VJ9NpV1C;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id b65so926063qkc.13
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 19:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uiVYb/zz5UcVT8MZnZH3Li51cRphyMtEF2Epx6V14yQ=;
        b=VJ9NpV1CPbIAHQQV+rnmCqilZbamMhthKdFs5HOPMNZv7UBcVQ6vFTq43TQ8wJfJEl
         P04Dgwx7udAmCFjFVzdX9KZv+oICd0vd2qxtfkzlRHWe1ZzOuD7QPmQ8lwswF3QMnHTK
         dd9miwHAV70Llb/1FkFcM9jSia+A4LZsi/x189FLaeDTGuxNE7jYhQNShSim/7pOHL9M
         EQjnONmOJ9Pn5wYrGdH3xG8Y5N7ALG4MSwuAXDJ4e1OdY4zTycvE6M1XKFD6hUJbLB5+
         wxPxLFg1XOuPYe9rSSb1oKoBHkW7XLYXsJAeJfn6pRkS5NARTbxEK7Wure7400pKQufE
         herw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uiVYb/zz5UcVT8MZnZH3Li51cRphyMtEF2Epx6V14yQ=;
        b=ZqdIBxakvdKlL7UBuMViKWBsFjUK6E9dqydrgnNajPcWWChD7hGBP++AXwx2iIq+EC
         GxD2IsgRcRjtt+LNkbVFTfBz86avOTdZX9L9+qyV4Ck/T5EwKvbfzSzjar+SihQLFbDt
         6lpC9Qwj/4fQRQ6l+rTGs8ZI7ANpCHdGn7iOz01T5GfdMJbALcNWeqUoprNcAMGnMrP0
         8bcUx6c+4/C4jzIaC3ZTcz5Hic7Dfopwhv0qvBnbWnEO4eTaYNr4bRlRpcFfEAX2a4A5
         EJlobXl1bn9U5bZ9gXTW2uFVwqqP61zfrrCTr6hyLpsvqfHYKHPI80HaUkwQFaiUWDQ6
         4KSg==
X-Gm-Message-State: AOAM532QTr7sb/itdBWe2+b23nIVc1qIUfG1MqU8sddDht26Z2X00EWj
	9vJWINI9kKg9yS/UWoLYN/bTdE+pUjNICtvq8l7KDw==
X-Google-Smtp-Source: 
 ABdhPJz0xKSojXB8e10BkPQxxcuINLtJlMKcA7QO2OUBKly+gtvDOkJeWluY2J1Wbve7pGCsTDbf3DZnFuORIIaaaB8=
X-Received: by 2002:ae9:ed45:: with SMTP id
 c66mr18619785qkg.336.1633486498805;
 Tue, 05 Oct 2021 19:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210927131820.19364-1-jon.mason@arm.com>
 <20210927181500.GT1528@denix.org>
 <CAPoiz9ypbAtwjHDv_F6=1PT9_PbMYWDFbjV9EZMvT+Ogxwjm9A@mail.gmail.com>
 <CAFA6WYP113C8TgS6sOAHG9W+nAHELO50Ys0ckV0hz4DSxwsn-Q@mail.gmail.com>
 <20211005235728.GI1528@denix.org>
In-Reply-To: <20211005235728.GI1528@denix.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 5 Oct 2021 22:14:48 -0400
Message-ID: 
 <CAPoiz9z_J7w9ifpnYojQj9eQupiRF=pxmiy2X3Yd+_MwbGB0dA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: use variables
To: Denys Dmytriyenko <denis@denix.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, Jon Mason <jon.mason@arm.com>,
	meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Oct 2021 02:15:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2254

Denys, I was waiting on you to ack the name Sumit suggested.

Thanks,
Jon

On Tue, Oct 5, 2021 at 7:57 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Sep 28, 2021 at 10:35:28AM +0530, Sumit Garg wrote:
> > On Tue, 28 Sept 2021 at 04:44, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Mon, Sep 27, 2021 at 2:15 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > On Mon, Sep 27, 2021 at 09:18:20AM -0400, Jon Mason wrote:
> > > > > Use variables to make it easier to upgrade when the time comes.
> > > > >
> > > > > Change-Id: I9f2575279fe79bc0d895d47fdaffd2d5edd4aa59
> > > > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > > > ---
> > > > >  .../recipes-devtools/gcc/gcc-arm-10.3.inc              | 10 +++++-----
> > > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > > > index 72a6b46..187f4f4 100644
> > > > > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > > > @@ -1,8 +1,8 @@
> > > > >  require recipes-devtools/gcc/gcc-common.inc
> > > > >
> > > > >  # Third digit in PV should be incremented after a minor release
> > > > > -
> > > > > -PV = "arm-10.3"
> > > > > +GCC_VERSION = "10.3"
> > > >
> > > > Isn't it too close to be confused with the global GCCVERSION variable in
> > > > meta/conf/distro/include/tcmode-default.inc that specifies gcc preference.
> > > > I realize this GCC_VERSION has a different use, but maybe the name should
> > > > be a bit clearer?
> > >
> > > I was a little quick on the trigger and pushed it already, but I agree
> > > with your point.  I'll do a follow-on patch to change it to a better
> > > name.  Suggestions?
> >
> > Maybe ARM_GCC_VERSION?
>
> Jon,
>
> Any update on this? Are you still looking for a different variable name?
>
> --
> Denys
>
> > -Sumit
> >
> > >
> > > Thanks,
> > > Jon
> > >
> > > >
> > > >
> > > > > +PV = "arm-${GCC_VERSION}"
> > > > >  CVE_VERSION = "10.3"
> > > > >
> > > > >  # BINV should be incremented to a revision after a minor gcc release
> > > > > @@ -13,7 +13,7 @@ MMYY = "21.07"
> > > > >  RELEASE = "20${MMYY}"
> > > > >  PR = "r${RELEASE}"
> > > > >
> > > > > -FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.3:${FILE_DIRNAME}/gcc-arm-10.3/backport:"
> > > > > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}:${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}/backport:"
> > > > >
> > > > >  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> > > > >  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
> > > > > @@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "\
> > > > >      file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
> > > > >  "
> > > > >
> > > > > -BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/srcrel/gcc-arm-src-snapshot-10.3-2021.07.tar.xz"
> > > > > +BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/${GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}.tar.xz"
> > > > >  SRC_URI = "\
> > > > >             ${BASEURI} \
> > > > >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > > > > @@ -72,7 +72,7 @@ SRC_URI = "\
> > > > >  "
> > > > >  SRC_URI[md5sum] = "5f582fd50eee0e40475b93d2d7a18979"
> > > > >
> > > > > -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.3-2021.07"
> > > > > +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}"
> > > > >
> > > > >  # For dev release snapshotting
> > > > >  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
> > > > > --
> > > > > 2.17.1
> > > > >

