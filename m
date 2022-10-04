Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1FEC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 23:33:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.17764.1664926411216389896
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 16:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E8E9C40CB6;
	Tue,  4 Oct 2022 23:33:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYQschkBYHWt; Tue,  4 Oct 2022 23:33:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0C2F407FE;
	Tue,  4 Oct 2022 23:33:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 86559174A19; Tue,  4 Oct 2022 19:33:22 -0400 (EDT)
Date: Tue, 4 Oct 2022 19:33:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com, ross.burton@arm.com, daniel.thompson@linaro.org
Subject: Re: [PATCH 2/2] external-arm-toolchain: Enable 11.3.rel1 support
Message-ID: <20221004233322.GB18429@denix.org>
References: <20220926071605.123085-1-sumit.garg@linaro.org>
 <20220926071605.123085-2-sumit.garg@linaro.org>
 <20220927233546.GX18429@denix.org>
 <CAFA6WYNkJ3F9ReeM1oN13r=e8+ZyZ8QPoKBchev8_t7TdZkbxQ@mail.gmail.com>
 <Yzwxxt/TtTeZOlM9@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yzwxxt/TtTeZOlM9@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 23:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3924

On Tue, Oct 04, 2022 at 09:14:46AM -0400, Jon Mason wrote:
> On Mon, Oct 03, 2022 at 04:08:52PM +0530, Sumit Garg wrote:
> > Hi Denys,
> > 
> > Apologies for the delayed response as I was on leave for the last few days.
> > 
> > On Wed, 28 Sept 2022 at 05:05, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Mon, Sep 26, 2022 at 12:46:05PM +0530, Sumit Garg wrote:
> > > > Enable support for 11.3.rel1 binary toolchain release. Also, update CI
> > > > to use it.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > >
> > > Well, the good news is this patch series does build and I was about to send
> > > out my Tested-by:
> > 
> > Thanks for testing it.
> > 
> > >
> > > But, I think, there's quite a mess in the naming/versioning area. See below...
> > >
> > 
> > Yeah I understand your concerns below but this has been caused by
> > renaming of toolchain releases from Arm here [1], so we need to adapt
> > accordingly:
> > 
> > 11.2-2022.02 -> 11.3.Rel1
> > 
> > [1] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
> > 
> > >
> > > > ---
> > > >  ci/get-binary-toolchains                       | 18 +++++++++---------
> > > >  .../external-arm-toolchain-versions.inc        |  7 +++++--
> > > >  2 files changed, 14 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > > > index bfdd8c57..ed334bf3 100755
> > > > --- a/ci/get-binary-toolchains
> > > > +++ b/ci/get-binary-toolchains
> > > > @@ -2,7 +2,7 @@
> > > >  set -u
> > > >
> > > >  HOST_ARCH=$(uname -m)
> > > > -VER="11.2-2022.02"
> > > > +VER="11.3.rel1"
> > >
> > > Here, it says 11.3.rel1 (note lower case)
> > >
> > 
> > It comes from the toolchain download path being:
> > 
> > https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
> > 
> > >
> > > >  DOWNLOAD_DIR=$1
> > > >  TOOLCHAIN_DIR=$2
> > >
> > > <skip>
> > >
> > > > -# Extract the YYYY.MM version
> > > > +# Extract the YYYY.MM or release version
> > > >  def eat_get_main_version(d):
> > > >      version = eat_get_version(d)
> > > >      bb.debug(2, 'Trying for parse version info from: %s' % version)
> > > >      if version != 'UNKNOWN':
> > > > -        if version.split()[4] == '(GNU':
> > > > +        if version.split()[4] == '(Arm':
> > > > +            # gcc version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)
> > > > +            return version.split()[7].split(')')[0]
> > >
> > > Here, it ends up picking up the uppercase version and external-arm-toolchain
> > > package ends up getting "11.3.Rel1" version, which doesn't sort well with the
> > > package feed already containing previous versions like 2018.11, 2019.12 and
> > > 2022.02
> > >
> > 
> > As I mentioned above, we need to adapt to the Arm toolchain release
> > naming convention.
> > 
> > > Moreover, gcc now builds a package versioned as "arm-11.3-r2022.08", so it's
> > > all over the place.
> > 
> > How about following additional changes to bring consistency?
> > 
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> > b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> > index 8eba959..15a87d8 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> > @@ -10,9 +10,7 @@ CVE_VERSION = "11.3"
> > 
> >  BINV = "11.3.1"
> > 
> > -MMYY = "22.08"
> > -RELEASE = "20${MMYY}"
> > -PR = "r${RELEASE}"
> > +PR = "Rel1"
> 
> I'm going to pull in the patches as they currently are.  Let's do
> whatever fix-ups you two agree on with a follow-on patch.

Ok, sounds good. I was testing Sumit's proposed changes above - I'll reply 
with the update soon.


> Thanks,
> Jon
> 
> > 
> > > Not sure where ARM_GCC_SUB_VERSION comes into play,
> > > certainly not in the package version.
> > 
> > It's currently only used in toolchain source download path which uses lowercase:
> > 
> > BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}/srcrel/arm-gnu-toolchain-src-snapshot-${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}.tar.xz"
> > 
> > >
> > > Should we try to standardize/unify these versioning mess here? I'd be happy to
> > > stick to 2022.08 notation, if possible...
> > >
> > 
> > The 2022.08 isn't embedded within the toolchain build version: "gcc
> > version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)". So I am not
> > sure if there is any alternative location within the pre-built
> > toolchain to provide "2022.08" info.
> > 
> > -Sumit
> > 
> > >
> > > > +        elif version.split()[4] == '(GNU':
> > > >              # gcc version 9.2.1 20191025 (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10))
> > > >              # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26))
> > > >              return version.split()[10].split('-')[1]
> > > > --
> > > > 2.17.1

