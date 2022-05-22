Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90221C433EF
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 19:15:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.19598.1653246929408500035
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 22 May 2022 12:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C0E640CB2;
	Sun, 22 May 2022 19:15:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv3js3WzbTkY; Sun, 22 May 2022 19:15:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E53540CAB;
	Sun, 22 May 2022 19:15:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 68DC617494D; Sun, 22 May 2022 15:15:23 -0400 (EDT)
Date: Sun, 22 May 2022 15:15:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain:
 set the version in the recipe
Message-ID: <20220522191523.GG9834@denix.org>
References: <20220517122818.3324458-1-ross.burton@arm.com>
 <165280103077.3622764.12744147075443410723.b4-ty@arm.com>
 <CAFA6WYOmbkbs4SUzKSMAtONPXxnKmPuP9KdrhomedkWRaoXZug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYOmbkbs4SUzKSMAtONPXxnKmPuP9KdrhomedkWRaoXZug@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 22 May 2022 19:15:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3447

On Tue, May 17, 2022 at 09:37:25PM +0530, Sumit Garg wrote:
> + Denys
> 
> Hi Jon,
> 
> On Tue, 17 May 2022 at 20:54, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Tue, 17 May 2022 13:28:16 +0100, Ross Burton wrote:
> > > We need to support multiple versions of external-arm-toolchain, partly as
> > > different versions have different layouts on disk, and partly because
> > > 11.2 doesn't work on pre-Broadwell hardware.
> > >
> > > Rename this recipe so the version is in the filename, and dynamically
> > > set PKGV instead of PV so PREFERRED_VERSION is easier to use.
> >
> > Applied, thanks!
> >
> > [1/3] arm-toolchain/external-arm-toolchain: set the version in the recipe
> >       commit: ac83feb7cd16265d4e8ee0ed50dba903306867e5
> > [2/3] arm-toolchain/external-arm-toolchain: add back 10.3
> >       commit: 5fec85b41d7263dcc8aa15351beb7c19e2017849
> 
> Can you please revert these two patches? We don't need duplicates for
> external-arm-toolchain recipe. The latest version supports both 11.2
> and 10.3. So the only thing that's required is patch #3.

Sorry, I was traveling last week and missed this. As Sumit correctly says, the 
recipe is version agnostic on purpose and supports multiple versions of the 
binary toolchain.

-- 
Denys

