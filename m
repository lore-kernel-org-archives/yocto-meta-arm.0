Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C82AC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 23:57:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.4953.1633478252902919857
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 16:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FBEB40C2A;
	Tue,  5 Oct 2021 23:57:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBVu5NBGAk99; Tue,  5 Oct 2021 23:57:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB4C8407DA;
	Tue,  5 Oct 2021 23:57:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8C806174679; Tue,  5 Oct 2021 19:57:28 -0400 (EDT)
Date: Tue, 5 Oct 2021 19:57:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jon Mason <jdmason@kudzu.us>, Jon Mason <jon.mason@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: use variables
Message-ID: <20211005235728.GI1528@denix.org>
References: <20210927131820.19364-1-jon.mason@arm.com>
 <20210927181500.GT1528@denix.org>
 <CAPoiz9ypbAtwjHDv_F6=1PT9_PbMYWDFbjV9EZMvT+Ogxwjm9A@mail.gmail.com>
 <CAFA6WYP113C8TgS6sOAHG9W+nAHELO50Ys0ckV0hz4DSxwsn-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYP113C8TgS6sOAHG9W+nAHELO50Ys0ckV0hz4DSxwsn-Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Oct 2021 23:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2253

On Tue, Sep 28, 2021 at 10:35:28AM +0530, Sumit Garg wrote:
> On Tue, 28 Sept 2021 at 04:44, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Mon, Sep 27, 2021 at 2:15 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Mon, Sep 27, 2021 at 09:18:20AM -0400, Jon Mason wrote:
> > > > Use variables to make it easier to upgrade when the time comes.
> > > >
> > > > Change-Id: I9f2575279fe79bc0d895d47fdaffd2d5edd4aa59
> > > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > > ---
> > > >  .../recipes-devtools/gcc/gcc-arm-10.3.inc              | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > > index 72a6b46..187f4f4 100644
> > > > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> > > > @@ -1,8 +1,8 @@
> > > >  require recipes-devtools/gcc/gcc-common.inc
> > > >
> > > >  # Third digit in PV should be incremented after a minor release
> > > > -
> > > > -PV = "arm-10.3"
> > > > +GCC_VERSION = "10.3"
> > >
> > > Isn't it too close to be confused with the global GCCVERSION variable in
> > > meta/conf/distro/include/tcmode-default.inc that specifies gcc preference.
> > > I realize this GCC_VERSION has a different use, but maybe the name should
> > > be a bit clearer?
> >
> > I was a little quick on the trigger and pushed it already, but I agree
> > with your point.  I'll do a follow-on patch to change it to a better
> > name.  Suggestions?
> 
> Maybe ARM_GCC_VERSION?

Jon,

Any update on this? Are you still looking for a different variable name?

-- 
Denys

> -Sumit
> 
> >
> > Thanks,
> > Jon
> >
> > >
> > >
> > > > +PV = "arm-${GCC_VERSION}"
> > > >  CVE_VERSION = "10.3"
> > > >
> > > >  # BINV should be incremented to a revision after a minor gcc release
> > > > @@ -13,7 +13,7 @@ MMYY = "21.07"
> > > >  RELEASE = "20${MMYY}"
> > > >  PR = "r${RELEASE}"
> > > >
> > > > -FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.3:${FILE_DIRNAME}/gcc-arm-10.3/backport:"
> > > > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}:${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}/backport:"
> > > >
> > > >  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> > > >  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
> > > > @@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "\
> > > >      file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
> > > >  "
> > > >
> > > > -BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/srcrel/gcc-arm-src-snapshot-10.3-2021.07.tar.xz"
> > > > +BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/${GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}.tar.xz"
> > > >  SRC_URI = "\
> > > >             ${BASEURI} \
> > > >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > > > @@ -72,7 +72,7 @@ SRC_URI = "\
> > > >  "
> > > >  SRC_URI[md5sum] = "5f582fd50eee0e40475b93d2d7a18979"
> > > >
> > > > -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.3-2021.07"
> > > > +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}"
> > > >
> > > >  # For dev release snapshotting
> > > >  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
> > > > --
> > > > 2.17.1
> > > >

