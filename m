Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7056C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 23:45:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.146486.1680738297946347713
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 16:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4867C40AC9;
	Wed,  5 Apr 2023 23:44:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ty-3lQVLtccY; Wed,  5 Apr 2023 23:44:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EE545406B5;
	Wed,  5 Apr 2023 23:44:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B75961637F9; Wed,  5 Apr 2023 19:44:14 -0400 (EDT)
Date: Wed, 5 Apr 2023 19:44:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Jon Mason <jdmason@kudzu.us>, Adam Johnston <Adam.Johnston@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>, Jon Mason <Jon.Mason@arm.com>,
	Yocto TSC <tsc@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit
 to 3.20 for N1SDP
Message-ID: <20230405234414.GJ9226@denix.org>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230404161414.GC9226@denix.org>
 <PAXPR08MB6432BA9D89EC85F016E440FDE9909@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230405150847.GD9226@denix.org>
 <ZC3IXbJDPZYoaVHh@kudzu.us>
 <4C217F66-AD65-48CF-8850-78CC7034F21F@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4C217F66-AD65-48CF-8850-78CC7034F21F@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 23:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4557

On Wed, Apr 05, 2023 at 07:20:20PM +0000, Ross Burton wrote:
> On 5 Apr 2023, at 20:13, Jon Mason <jdmason@kudzu.us> wrote:
> >=20
> >> At the TSC meetings recently we've discussed the possibility of migr=
ating=20
> >> Trusted Firmware and OP-TEE components from meta-arm to oe-core in o=
rder to=20
> >> reduce dependencies on these core components by other BSPs.
>=20
> My opinion here is that in the ideal world a generic-arm64 BSP wouldn=E2=
=80=99t need=20
> anything extra in oe-core to work: assume working firmware (SystemReady=
),=20
> mainline kernel, mainline U-Boot, etc and it will work.  It may not be =
as=20
> fully functional as you=E2=80=99d get by adding custom optee/tf pieces =
but that=E2=80=99s=20
> where meta-arm steps in, which was designed explicitly to be BSP-agnost=
ic.

Understood and agree. I'm not yet that much familiar with SystemReady fir=
mware=20
specifics - does that include Trusted Firmware? Not so sure about OP-TEE,=
 but=20
what does the spec say about it?

--=20
Denys

