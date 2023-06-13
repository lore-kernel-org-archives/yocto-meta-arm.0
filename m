Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480C7EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 19:59:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.810.1686686381936303411
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 12:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A29740C47;
	Tue, 13 Jun 2023 19:59:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzZMBKwx_iEE; Tue, 13 Jun 2023 19:59:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E20BC40A46;
	Tue, 13 Jun 2023 19:59:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A91E0163A53; Tue, 13 Jun 2023 15:58:48 -0400 (EDT)
Date: Tue, 13 Jun 2023 15:58:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS
 version
Message-ID: <20230613195848.GT9226@denix.org>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
 <20230612214256.GS9226@denix.org>
 <219D22AE-6AAE-493F-B4DE-C340B852C8A2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <219D22AE-6AAE-493F-B4DE-C340B852C8A2@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 19:59:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4773

On Tue, Jun 13, 2023 at 02:20:28PM +0000, Ross Burton wrote:
> On 12 Jun 2023, at 22:42, Denys Dmytriyenko via lists.yoctoproject.org =
<denis=3Ddenix.org@lists.yoctoproject.org> wrote:
> >=20
> > I would like to propose reverting this series ASAP due to the breakag=
e caused=20
> > to downstream layers and platforms.
>=20
> Is this just related to the EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3D=
y=E2=80=9D line,=20
> or something else too?  Obviously that needs fixing, but I don=E2=80=99=
t think that=20
> deserves a bulk revert.

The reason for the revert proposal was due to a total silence from the au=
thor=20
on multiple inquiries. Yes, the fix is simple, but a confirmation or any =
kind=20
of feedback would have been greatly appreciated...

--=20
Denys

