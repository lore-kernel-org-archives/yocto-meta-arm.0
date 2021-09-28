Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6655C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 05:05:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.9839.1632805541767659623
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 22:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pDuIH1fU;
 spf=pass (domain: linaro.org, ip: 209.85.167.46,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id b20so87605510lfv.3
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8GTzhXIugMLZ2iik9WacwvOAqOEhhzh6OTvLrueYixY=;
        b=pDuIH1fUGdI10dWtAwnI8h9BPSiSeG1THjJXbPP/C+ExvakFOSxnVF4iIoOy6SN7Se
         jmFmv6+lKtomxkC55nINQk9GWABWm1WoDI0XyQU1AypG05UAV54EuVN/gW/ZgQbhS4iC
         Wvhdr5U8MJzJxKD8yC2axkL8Ve/Rda9ofHGbWVZcgyvmMtNYLbavkxzjMlMcBM5xRFcr
         lLHFNlm9StWJPdRkdCjQZ5WaeNZcBeDziADNdY+0EPWr6nRknaqYhJWmXTzsHmIu0h+J
         WCQeV2xExEHUPvcpERVgyXGYUZe9fZOpjV4o3/1JrnuhMk9zes55vPnL0GMEC62X0Nk5
         x3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8GTzhXIugMLZ2iik9WacwvOAqOEhhzh6OTvLrueYixY=;
        b=XpD7Cp4VOum3pd3J19fozViFDuccmeXrtlq3LCdpaMaaFA5MQ7rFx/2a3up2MnRmx8
         CT6IGafo3BRrcsBep9JyiO2zS5LiQcw9K4tliR0kAvDe9TI3rNGU2ms6zuJ7oD4N/Ek2
         HTAvncL8yKR7NnSLTwpZ4wE+EdiCCJYTx5qvOUhMeof/2AJbFUSaZaFxBnbjHdlOL63X
         Qu6q6DyFErXQeE7QD4upoyHP6y0ehleXK7GF+2wZiBVWSHhTjgYuUnEvStryDxElxpR6
         1aVqEZvvbFjNqW12iXZqn8U5c9OHuBmN3MwWFPOPgDwWdsNFz8z4rxNTaOy8CvtPvcCz
         crCg==
X-Gm-Message-State: AOAM5338tjrUN9Tn+gahGnPtVajI362bcZNsx8qnZ0rGGHbhBvKRBu5z
	vTZFityi8Nx2NNWiAZLAflAVgz0OAbFEYRkt5gvmpw==
X-Google-Smtp-Source: 
 ABdhPJzvacdyi4AvDWOnGs5cgeJvdh4sDYVvsyfK799/TubxVGg+rRxkp1Ddy5VnzH09/mzq4EEuJE5h27MSniiIKcc=
X-Received: by 2002:a2e:5306:: with SMTP id h6mr3935183ljb.271.1632805539717;
 Mon, 27 Sep 2021 22:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210927131820.19364-1-jon.mason@arm.com>
 <20210927181500.GT1528@denix.org>
 <CAPoiz9ypbAtwjHDv_F6=1PT9_PbMYWDFbjV9EZMvT+Ogxwjm9A@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9ypbAtwjHDv_F6=1PT9_PbMYWDFbjV9EZMvT+Ogxwjm9A@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 28 Sep 2021 10:35:28 +0530
Message-ID: 
 <CAFA6WYP113C8TgS6sOAHG9W+nAHELO50Ys0ckV0hz4DSxwsn-Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: use variables
To: Jon Mason <jdmason@kudzu.us>
Cc: Denys Dmytriyenko <denis@denix.org>, Jon Mason <jon.mason@arm.com>,
 meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Sep 2021 05:05:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2239

On Tue, 28 Sept 2021 at 04:44, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Sep 27, 2021 at 2:15 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Mon, Sep 27, 2021 at 09:18:20AM -0400, Jon Mason wrote:
> > > Use variables to make it easier to upgrade when the time comes.
> > >
> > > Change-Id: I9f2575279fe79bc0d895d47fdaffd2d5edd4aa59
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  .../recipes-devtools/gcc/gcc-arm-10.3.inc              | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > index 72a6b46..187f4f4 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > @@ -1,8 +1,8 @@
> > >  require recipes-devtools/gcc/gcc-common.inc
> > >
> > >  # Third digit in PV should be incremented after a minor release
> > > -
> > > -PV = "arm-10.3"
> > > +GCC_VERSION = "10.3"
> >
> > Isn't it too close to be confused with the global GCCVERSION variable in
> > meta/conf/distro/include/tcmode-default.inc that specifies gcc preference.
> > I realize this GCC_VERSION has a different use, but maybe the name should
> > be a bit clearer?
>
> I was a little quick on the trigger and pushed it already, but I agree
> with your point.  I'll do a follow-on patch to change it to a better
> name.  Suggestions?

Maybe ARM_GCC_VERSION?

-Sumit

>
> Thanks,
> Jon
>
> >
> >
> > > +PV = "arm-${GCC_VERSION}"
> > >  CVE_VERSION = "10.3"
> > >
> > >  # BINV should be incremented to a revision after a minor gcc release
> > > @@ -13,7 +13,7 @@ MMYY = "21.07"
> > >  RELEASE = "20${MMYY}"
> > >  PR = "r${RELEASE}"
> > >
> > > -FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.3:${FILE_DIRNAME}/gcc-arm-10.3/backport:"
> > > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}:${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}/backport:"
> > >
> > >  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> > >  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
> > > @@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "\
> > >      file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
> > >  "
> > >
> > > -BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/srcrel/gcc-arm-src-snapshot-10.3-2021.07.tar.xz"
> > > +BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/${GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}.tar.xz"
> > >  SRC_URI = "\
> > >             ${BASEURI} \
> > >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > > @@ -72,7 +72,7 @@ SRC_URI = "\
> > >  "
> > >  SRC_URI[md5sum] = "5f582fd50eee0e40475b93d2d7a18979"
> > >
> > > -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.3-2021.07"
> > > +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}"
> > >
> > >  # For dev release snapshotting
> > >  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
> > > --
> > > 2.17.1
> > >
> >
> > --
> > Regards,
> > Denys Dmytriyenko <denis@denix.org>
> > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2238): https://lists.yoctoproject.org/g/meta-arm/message/2238
> Mute This Topic: https://lists.yoctoproject.org/mt/85900244/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

