Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1459C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 15:12:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15188.1682089942117924987
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 08:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C92240AE9;
	Fri, 21 Apr 2023 15:12:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXnMfzqD3oiH; Fri, 21 Apr 2023 15:12:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D49E740ACD;
	Fri, 21 Apr 2023 15:12:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DD765163829; Fri, 21 Apr 2023 11:11:38 -0400 (EDT)
Date: Fri, 21 Apr 2023 11:11:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "peron.clem@gmail.com" <peron.clem@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v2 1/2] support: add libmxml 3.3.1 recipe
Message-ID: <20230421151138.GA9226@denix.org>
References: <20230421090732.54079-1-peron.clem@gmail.com>
 <C6BB3F5B-314F-4D2B-BD98-3C68C2F59AD3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <C6BB3F5B-314F-4D2B-BD98-3C68C2F59AD3@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 15:12:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4609

On Fri, Apr 21, 2023 at 02:06:20PM +0000, Ross Burton wrote:
> On 21 Apr 2023, at 10:07, Cl=C3=A9ment P=C3=A9ron via lists.yoctoprojec=
t.org <peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
> >=20
> > libmxml is required by new version of gator-daemon as it
> > has been removed from the package and is now an explicit
> > dependency.
> >=20
> > This is a duplicate of the recipe present in meta-oe layer.
>=20
> I get Denys=E2=80=99s objection to *requiring* meta-oe in meta-arm, but=
 I don=E2=80=99t want=20
> to start copying recipes from meta-oe every time we need something from=
=20
> there.
>=20
> I feel a better solution here would be to use dynamic-layers in meta-ar=
m. =20
> Denys, would you be okay with that?

Placing gator-daemon into dynamic-layers? Sure, meta-ti BSP is currently =
not=20
using it, so the dependency won't be affected. Not sure about other BSPs=20
depending on meta-arm though, but overall it's probably the most flexible=
=20
soltion.

--=20
Denys

