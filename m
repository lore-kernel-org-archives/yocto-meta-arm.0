Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9459C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:35:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.13761.1641933339181372462
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 12:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A70940C3E;
	Tue, 11 Jan 2022 20:35:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukijs3tyTeAB; Tue, 11 Jan 2022 20:35:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 09DC640A03;
	Tue, 11 Jan 2022 20:35:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C719017471A; Tue, 11 Jan 2022 15:35:35 -0500 (EST)
Date: Tue, 11 Jan 2022 15:35:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Ryan Fairfax <rfairfax@microsoft.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v2] arm/optee-os: Fix build race condition
 when building fTPM
Message-ID: <20220111203535.GD26229@denix.org>
References: <Yd3Wpf55ymc+BkZk@kudzu.us>
 <24621.1641929906160979658@lists.yoctoproject.org>
 <Yd3pTSN1vFxrcuOY@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Yd3pTSN1vFxrcuOY@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 20:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2822

The patch is corrupted even visually - it lost all indentation and leadin=
g=20
whitespaces...


On Tue, Jan 11, 2022 at 03:32:13PM -0500, Jon Mason wrote:
> On Tue, Jan 11, 2022 at 11:38:26AM -0800, Ryan Fairfax wrote:
> > I posted from this list's web client to try to avoid encoding issues =
- in part because I cannot use easily alternative clients with my mail ac=
count.=A0 I'll see what I can do to get this resent but are there any spe=
cific errors that might help me understand what is getting modified?
>=20
> Using b4 is the easiest way to see
>=20
> $ b4 am -o - jKa2.1641920328439478855.fAON@lists.yoctoproject.org | git=
 am -s
> Looking up https://lore.kernel.org/r/jKa2.1641920328439478855.fAON%40li=
sts.yoctoproject.org
> Grabbing thread from lore.kernel.org/all
> Analyzing 1 messages in the thread
> ---
> Writing /tmp/tmpjx37s82ib4-am-stdout
>   [PATCH v2] arm/optee-os: Fix build race condition when building fTPM
> ---
> Total patches: 1
> ---
>  Link: https://lore.kernel.org/r/jKa2.1641920328439478855.fAON@lists.yo=
ctoproject.org
>  Base: not found (applies clean to current tree)
> ---
> Applying: arm/optee-os: Fix build race condition when building fTPM
> error: corrupt patch at line 11
> Patch failed at 0001 arm/optee-os: Fix build race condition when buildi=
ng fTPM
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>=20
>=20
>=20
> One way around using an Outlook server is to use Gmail as the SMTP
> server and have it rewrite the address when it sends.  See=20
> https://support.google.com/mail/answer/22370?hl=3Den
>=20
> I might have used this in the past :)

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

