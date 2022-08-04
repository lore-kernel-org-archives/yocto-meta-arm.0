Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD368C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 15:47:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.6477.1659628048642902393
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 08:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BABC240D19;
	Thu,  4 Aug 2022 15:47:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C84zN7YvTYuU; Thu,  4 Aug 2022 15:47:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7FC2940A03;
	Thu,  4 Aug 2022 15:47:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 010E21749C7; Thu,  4 Aug 2022 11:47:20 -0400 (EDT)
Date: Thu, 4 Aug 2022 11:47:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jon Mason <jdmason@kudzu.us>, Martin Jansa <martin.jansa@gmail.com>,
	meta-arm@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [meta-arm] [PATCH][kirkstone] arm-toolchain/layer.conf: remove
 BB_DANGLINGAPPENDS_WARNONLY
Message-ID: <20220804154720.GH18692@denix.org>
References: <20220804094231.748681-1-Martin.Jansa@gmail.com>
 <YuvENV7uaKfqmOat@kudzu.us>
 <CAFA6WYPBThQ_ei8dEx=TQ-T-sGHyBZYge4ZyGZz86htB78Jr_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYPBThQ_ei8dEx=TQ-T-sGHyBZYge4ZyGZz86htB78Jr_Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Aug 2022 15:47:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3646

On Thu, Aug 04, 2022 at 06:37:09PM +0530, Sumit Garg wrote:
> Hi Jon,
> 
> On Thu, 4 Aug 2022 at 18:36, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Odd email format.  I beleive you are asking me to apply this patch to
> > kirkstone.  If not, please let me know.
> >
> > Sumit/Denys, should I apply this all the way back to dunfell (as the
> > grub entry is there in this oldest branch)?
> >
> 
> Yeah, it makes sense.

I agree - this hasn't been needed for quite some time.

-- 
Denys


> > On Thu, Aug 04, 2022 at 11:42:31AM +0200, Martin Jansa wrote:
> > > From: Ross Burton <ross.burton@arm.com>
> > >
> > > This appears to be historical from when the toolchain was in meta-linaro.
> > >
> > > It isn't needed anymore, there's one bbappend in meta-arm-toolchain for
> > > grub which is part of oe-core, so will never be dangling.
> > >
> > > This variable has a global effect, so leaving it in here has a negative
> > > impact on users.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  meta-arm-toolchain/conf/layer.conf | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > > index 3512c34..dd54db8 100644
> > > --- a/meta-arm-toolchain/conf/layer.conf
> > > +++ b/meta-arm-toolchain/conf/layer.conf
> > > @@ -11,8 +11,5 @@ BBFILE_PRIORITY_arm-toolchain = "5"
> > >  LAYERDEPENDS_arm-toolchain = "core"
> > >  LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
> > >
> > > -# do not error out on bbappends for missing recipes
> > > -BB_DANGLINGAPPENDS_WARNONLY = "true"
> > > -
> > >  # These variables are used for armcompiler license
> > >  BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > > --
> > > 2.35.1

