Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F04EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 21:27:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2925.1686691667282247659
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 14:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 96A1040C47;
	Tue, 13 Jun 2023 21:27:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvI4fqpFM9jX; Tue, 13 Jun 2023 21:27:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6754140ACD;
	Tue, 13 Jun 2023 21:27:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AF2C7163A53; Tue, 13 Jun 2023 17:26:54 -0400 (EDT)
Date: Tue, 13 Jun 2023 17:26:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS
 version
Message-ID: <20230613212654.GU9226@denix.org>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
 <20230612214256.GS9226@denix.org>
 <219D22AE-6AAE-493F-B4DE-C340B852C8A2@arm.com>
 <20230613195848.GT9226@denix.org>
 <BC8E801D-C6A8-47D5-8476-9FFFC403F4E9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BC8E801D-C6A8-47D5-8476-9FFFC403F4E9@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 21:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4775

On Tue, Jun 13, 2023 at 09:14:43PM +0000, Ross Burton wrote:
> On 13 Jun 2023, at 20:58, Denys Dmytriyenko <denis@denix.org> wrote:
> >=20
> > On Tue, Jun 13, 2023 at 02:20:28PM +0000, Ross Burton wrote:
> >> On 12 Jun 2023, at 22:42, Denys Dmytriyenko via lists.yoctoproject.o=
rg <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
> >>>=20
> >>> I would like to propose reverting this series ASAP due to the break=
age caused=20
> >>> to downstream layers and platforms.
> >>=20
> >> Is this just related to the EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECUR=
E=3Dy=E2=80=9D line,=20
> >> or something else too?  Obviously that needs fixing, but I don=E2=80=
=99t think that=20
> >> deserves a bulk revert.
> >=20
> > The reason for the revert proposal was due to a total silence from th=
e author=20
> > on multiple inquiries. Yes, the fix is simple, but a confirmation or =
any kind=20
> > of feedback would have been greatly appreciated=E2=80=A6
>=20
> Agreed, silence isn=E2=80=99t good, and any one of us should have respo=
nded.  A=20
> proposed resolution is running through internal CI now to check it does=
n=E2=80=99t=20
> break anything now, hopefully it will be on the list tomorrow.

Thanks. Is it any different from my proposal?
https://patchwork.yoctoproject.org/project/arm/patch/20230613181723.17112=
12-1-denis@denix.org/

--=20
Denys

