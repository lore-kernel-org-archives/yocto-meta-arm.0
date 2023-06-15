Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6121BEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 19:46:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.28190.1686858381582048318
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 12:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACBB340C2E;
	Thu, 15 Jun 2023 19:46:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K7f5mW_IDrwI; Thu, 15 Jun 2023 19:46:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80C6740A3D;
	Thu, 15 Jun 2023 19:46:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 443F1163A87; Thu, 15 Jun 2023 15:46:17 -0400 (EDT)
Date: Thu, 15 Jun 2023 15:46:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm-toolchain/external-arm: remove
 -fcanon-prefix-map from DEBUG_PREFIX_MAP
Message-ID: <20230615194617.GF1518@denix.org>
References: <20230612145659.934478-1-ross.burton@arm.com>
 <20230612145659.934478-3-ross.burton@arm.com>
 <CAFA6WYMfzst+gsYAYKumKVU1zrVxpKL04w_P0+mzoQYC2FR_TQ@mail.gmail.com>
 <C5FDDC93-624C-453E-9C80-96E66E806C91@arm.com>
 <CAFA6WYPSuPjR3sQ0YEvcc7rmqzhbPYstfF_OcCsDck5EVJW1Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYPSuPjR3sQ0YEvcc7rmqzhbPYstfF_OcCsDck5EVJW1Wg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 19:46:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4801

On Wed, Jun 14, 2023 at 10:59:29AM +0530, Sumit Garg wrote:
> On Tue, 13 Jun 2023 at 19:46, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 13 Jun 2023, at 06:10, Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > On Mon, 12 Jun 2023 at 20:27, Ross Burton <ross.burton@arm.com> wrote:
> > >>
> > >> From: Ross Burton <ross.burton@arm.com>
> > >>
> > >> The binaryh Arm compiler is based on GCC 12. Remove this GCC 13-specific
> > >> option until the next release.
> > >>
> > >
> > > We have to keep this GCC 13 flag removed by default since we support
> > > multiple versions of Arm binary toolchain GCC 8 onwards.
> >
> > 8?  <shudder>
> >
> > Who supports this, where is this documented,
> 
> The external-arm toolchain recipe is designed to work with the
> toolchain which is pre-installed on the build machine. There isn't any
> hardcoded version but we rather extract version information from
> external toolchain here [1].

Heh, this goes back to the early days of external toolchain support in 
OpenEmbedded Classic, which I added 14 years ago:
https://git.openembedded.org/openembedded/commit/?id=2512ba21856d0ffd942ddd3a7c834d585a117ff1

This is something being passed in from outside and OE/YP has no control 
over, hence some flexibility was designed in. It's not meant to support 
all the version ever released, but some flexibility is expected.


> > and more importantly who wants an ancient gcc?
> 
> I have seen people still using prebuilt Linaro GCC which predates Arm
> GCC. I guess the reason being that the toolchain is an essential piece
> in building the overall product software stack and people are
> reluctant to not switch toolchain versions.
> 
> [1] https://git.yoctoproject.org/meta-arm/tree/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc#n26

